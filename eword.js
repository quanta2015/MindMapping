var createError = require('http-errors');
var express = require('express');
var path = require('path');
var fs = require('fs');
var http = require('http');
var bodyParser = require('body-parser')
var moment = require('moment');
var cors = require('cors')
var exphbs = require('express-handlebars');
var url = require('url')
var db = require("./db/db")
var jwt= require('jsonwebtoken')
var conf = require('./db/conf')
var formidable = require('formidable')
var csv = require("csvtojson")


const valid = (d) => { return ((typeof(d) != 'undefined')&&(d.length !== 0))?true:false }
const frmat = (d) => { return d.sort().join('|') }
const clone = (e) =>{ return JSON.parse(JSON.stringify(e))}
　

var port = 8080;
var secret = conf.secret

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(cors());
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(express.static(path.join(__dirname, '/')));


var __projdir = path.resolve(__dirname,'./');

var hbs = exphbs.create({
  partialsDir: 'views/',
  layoutsDir: "views/layouts/",
  defaultLayout: 'layout',
  extname: '.hbs'
});

app.engine('hbs', hbs.engine);

app.get('/', function(req, res, next) {
  res.sendFile(__dirname + '/login.html');
});



//用户登录
app.post('/login', function(req, res) {
  var {usr, pwd} = req.body
  let where = `where usr='${usr}' and pwd = '${pwd}'`
  db.select('account',where,'','', (err,ret)=>{
    let account = ret[0]
    if (ret.length > 0) {
      db.select('word','','','', (err,word)=>{
        res.status(200).json({
          code: 200,
          msg: '登录成功',
          data: { account: account, word:word }
        })
      })
    }else{
      res.status(200).json({
        code: -1,
        msg: '用户名密码错误',
        data: null,
      })
    }
  })
})


// 保存操作记录和图片
app.post('/save', function(req, res) {
  let sql  = `CALL LOG_SAVE(?)`;
  let params = {
    code: null,
    log: null,
    file: null
  } 

  let uploadFile = "";
  var form = new formidable.IncomingForm();
  form.encoding = 'utf-8';                 
  form.uploadDir = "upload"; 
  form.keepExtensions = true;
  form.maxFieldsSize = 300 * 1024 * 1024;  
  form.parse(req);

  form.on('field', function(name, value) {
      if (name==='code') params.code = value;
      if (name==='log') params.log = JSON.parse(value);
    })
    .on('file', function(field, file) {
      params.file = file.path
    })
    .on('end', function() {
      db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
        if (err) {
          res.status(500).json({ code: -1, msg: 'add apply failed', data: null})
        }else{
          if (ret[0].err_code===0) {
            res.status(200).json({ code: 200 })
          }else{
            res.status(200).json({ code: 201})
          }
        }
      })//end db
    })//end form
})



// 取测试用户列表
app.post('/testlist', function(req, res) {
  let sql  = `CALL TEST_LIST()`;
  db.procedureSQL(sql,(err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: 'import user failed', data: null})
    }else{
      res.status(200).json({ code: 200, data: { test: ret[0] }, msg:'测试数据列表！' })
    }
  })//end db
})



// 取操作清单
app.post('/loglist', function(req, res) {
  var {code} = req.body
  let where = `where code='${code}'`

  db.select('log',where,'','', (err,ret)=>{
    if (ret.length > 0) {
      res.status(200).json({
        code: 200,
        data: { log: ret }
      })
    }else{
      res.status(200).json({
        code: -1,
        msg: '尚未进行测试',
      })
    }
  })
})


// 取用户列表
app.post('/userlist', function(req, res) {
  let where = `where type<>0`
  db.select('account',where,'','', (err,ret)=>{
    if (ret.length > 0) {
      res.status(200).json({
        code: 200,
        data: { user: ret }
      })
    }else{
      res.status(200).json({
        code: -1,
        data: '没有USER数据',
      })
    }
  })
})


// 更新用户
app.post('/saveuser', function(req, res) {
  let sql  = `CALL USER_UPDATE(?)`;
  var params = clone(req.body)

  db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: '更新用户失败', data: null})
    }else{
      if (ret[0].err_code ===0) {
        res.status(200).json({ code: 200, msg: ret[0].err_msg })
      }else{
        res.status(200).json({ code: 201, msg: '用户已存在' })
      }
    }
  })//end db
})

// 删除用户
app.post('/deluser', function(req, res) {
  let sql  = `CALL USER_DELETE(?)`;
  var params = clone(req.body)

  db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: 'import user failed', data: null})
    }else{
      res.status(200).json({ code: 200, data: { user: ret }, msg:'删除数据成功！' })
    }
  })//end db
})




// 导出用户
app.post('/uploadCSV', function(req, res) {
  
  let csvfile,csvtype,sql,params,data
  let uploadFile = "";
  let form = new formidable.IncomingForm();
  form.encoding = 'utf-8';                 
  form.uploadDir = "upload"; 
  form.keepExtensions = true;
  form.maxFieldsSize = 300 * 1024 * 1024;  
  form.parse(req);

  form.on('field', function(name, value) {
      if (name==='type') csvtype = value;
    }).on('file', function(field, file) {
      csvfile = file.path
    })
    .on('end', function() {
      csv().fromFile(csvfile).then((jsonObj)=>{

        if (csvtype === 'user') {
          sql  = `CALL USER_IMPORT(?)`
          params = { user: jsonObj } 
          data =  { user: null }
        }else{
          sql  = `CALL WORD_IMPORT(?)`
          params = { word: jsonObj } 
          data =  { word: null }
        }

        db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
          if (err) {
            res.status(500).json({ code: -1, msg: '导入数据失败', data: null})
          }else{
            if (csvtype === "user") {
              res.status(200).json({ code: 200, data: { user: ret }, msg:'导入数据成功！' })
            }else{
              res.status(200).json({ code: 200, data: { word: ret }, msg:'导入数据成功！' })
            }
          }
        })//end db
      })
    })//end form
})




// 取单词列表
app.post('/wordlist', function(req, res) {
  db.select('word','','','', (err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: '取单词数据失败', data: null})
    }else{
      res.status(200).json({ code: 200, data: { word: ret }, msg:'取单词数据成功！' })
    }
  })
})


// 删除单词
app.post('/delword', function(req, res) {
  let sql  = `CALL WORD_DELETE(?)`;
  var params = clone(req.body)

  db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: '删除单词失败', data: null})
    }else{
      res.status(200).json({ code: 200, data: { word: ret }, msg:'删除单词成功！' })
    }
  })//end db
})


// 更新单词
app.post('/saveword', function(req, res) {
  let sql  = `CALL WORD_UPDATE(?)`;
  var params = clone(req.body)

  db.procedureSQL(sql,JSON.stringify(params),(err,ret)=>{
    if (err) {
      res.status(500).json({ code: -1, msg: '更新单词失败', data: null})
    }else{
      if (ret[0].err_code ===0) {
        res.status(200).json({ code: 200, msg: ret[0].err_msg })
      }else{
        res.status(200).json({ code: 201, msg: '单词已存在' })
      }
    }
  })//end db
})




//计算统计结果
function calcData(list) {
  
  let len = list.length
  let e = moment(list[len-1].createtime)
  let s = moment(list[0].createtime)

  var duration = moment.duration(e.diff(s));
  var m = {
    hours: `${parseInt(duration.asHours(), 10)}`,
    minutes: `${parseInt(duration.asMinutes()) % 60}`,
    seconds: `${parseInt(duration.asSeconds()) % 60}`,
    toString: function() {
        let m = `00${this.minutes}`.substr(this.minutes.length);
        let s = `00${this.seconds}`.substr(this.seconds.length);
        return `${this.hours}:${m}:${s}`;
    }
  }

  //计算基本数据
  let basicData = {
    dure: m.toString(),
    count: len
  }

  // 计算操作类型比例
  let typeJson = { sel: 0, chg: 0, add: 0, del: 0 }
  list.map((item,index)=>{
    if (item.act ==='select') {
      typeJson.sel++
    }else if(item.act ==='change') {
      typeJson.chg++
    }else if(item.act ==='add') {
      typeJson.add++
    }else if(item.act ==='del') {
      typeJson.del++
    }
  })
  let typeData = []
  typeData.push({name:'select', y:typeJson.sel})
  typeData.push({name:'change', y:typeJson.chg})
  typeData.push({name:'add',    y:typeJson.add})
  typeData.push({name:'del',    y:typeJson.del})


  // 计算单词操作数量
  let wordJson = []
  for(let i=0;i<list.length;i++) {
    if (list[i].data==="") {
      continue
    }
    let wordItem = getWordItem(list[i].data, wordJson)
    if ( wordItem !== null) {
      calcType(list[i].act, wordItem)
    }else{
      let n = { word:list[i].data, sel:0, chg:0, add:0, del:0, all:0 }
      calcType(list[i].act, n)
      wordJson.push(n)
    }
  }

  wordJson.sort((a,b)=>{return b.all-a.all})

  let wordDataD = [
    { name: 'select', data: [] },
    { name: 'change', data: [] },
    { name: 'del', data: [] },
  ]
  let wordDataT = []

  wordJson.map((item,index)=>{
    wordDataT.push(item.word)
    wordDataD[0].data.push(item.sel)
    wordDataD[1].data.push(item.chg)
    wordDataD[2].data.push(item.del)
  })

  let wordData = {
    wordDataD: wordDataD,
    wordDataT: wordDataT,
  }


  // 计算步骤操作时间
  let timeJson = []
  let nlist = []
  list[0].cost = 0
  nlist.push(list[0])
  list.reduce((pre,cur)=>{
    let s = moment(pre.createtime).format('x');
    let e = moment(cur.createtime).format('x');
    let ret = e - s
    let duration = moment.duration(ret).asMilliseconds()
    cur.cost = duration*1.0/1000
    nlist.push(cur) 
    return cur
  })

  let timeData = []
  nlist.sort((a,b)=>{return b.cost - a.cost})
  nlist.map((item,index)=>{
    let d = []
    d.push(`${index+1}-${item.act}[${item.item_lv}][${item.item_id}][${item.data}]`)
    d.push(parseInt(item.cost))
    timeData.push(d)
  })


  // 返回全部统计数据
  let ret = {
    basicData: basicData,
    typeData: typeData,
    wordData: wordData,
    timeData: timeData,
  }
  return ret
}

function getWordItem(val, list) {
  for(let i=0;i<list.length;i++) {
    if (list[i].word === val) {
      return list[i]
    }
  }
  return null;
}


function calcType(type,item) {
  if (type ==='select') {
    item.sel++
  }else if(type ==='change') {
    item.chg++
  }else if(type ==='add') {
    item.add++
  }else if(type ==='del') {
    item.del++
  }
  item.all++
}

app.post('/logdetail', function(req, res) {
  var {id} = req.body
  let where = `where log_id='${id}'`

  db.select('log_detail',where,'','', (err,ret)=>{
    if (ret.length > 0) {

      let data = calcData(ret)

      res.status(200).json({
        code: 200,
        data: { logdetail: ret, data: data }
      })

    }else{
      res.status(200).json({
        code: -1,
        data: null,
      })
    }
  })
})

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});



app.set('port', port);
var httpServer = http.createServer(app);
httpServer.listen(port);
httpServer.on('error', onError);
httpServer.on('listening', onListening);



function onError(error) {
  if (error.syscall !== 'listen') {
    throw error;
  }

  var bind = typeof port === 'string'
    ? 'Pipe ' + port
    : 'Port ' + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case 'EACCES':
      console.error(bind + ' requires elevated privileges');
      process.exit(1);
      break;
    case 'EADDRINUSE':
      console.error(bind + ' is already in use');
      process.exit(1);
      break;
    default:
      throw error;
  }
}

function onListening() {
  var addr = httpServer.address();
  var bind = typeof addr === 'string'
    ? 'pipe ' + addr
    : 'port ' + addr.port;
}