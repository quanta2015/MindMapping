var lib = []
var log = []
var previous, account, max
var _sTime, _stop


init()

function initData() {
  let wordList = JSON.parse(window.localStorage.getItem('EWORD_WORD'))
  account = JSON.parse(window.localStorage.getItem('EWORD_USER'))
  lib = []
  wordList.map((item,index)=>{
    lib.push(item.word)
  })

  lib.sort()
  lib = ["Banana", "Hamburger", "Tomato", "Ice-cream", "Salad", "Iceeee", "Pewf"]
  max = lib.length
}

function init() {
  $('body').on('click','.m-item-cnt', (e)=>{
    e.stopPropagation();
  })

  $('body').on('mouseover','.m-item-add', (e)=>{
    $(e.currentTarget).append('<div class="m-popup m-popup-up">增加单词框</div>')
  }).on('mouseout','.m-item-add', (e)=>{
    $('.m-popup').remove()
  })

  $('body').on('mouseover','.m-item-del', (e)=>{
    $(e.currentTarget).append('<div class="m-popup m-popup-bt">删除单词框</div>')
  }).on('mouseout','.m-item-del', (e)=>{
    $('.m-popup').remove()
  })

  $('body').on('mouseover','.m-item-cnt', (e)=>{
    $(e.currentTarget).append('<div class="m-popup m-popup-ma m-popup-up">选择单词</div>')
  }).on('mouseout','.m-item-cnt', (e)=>{
    $('.m-popup').remove()
  })

  

  $('body').on('click','.m-save',doSave)
  $('body').on('click','.m-start',doStart)
  $('body').on('click','.m-log',doLog)
  $('body').on('click','.m-logout',doLogout)
  

  $('body').on('click', function (e) { 
    let t = e.currentTarget
    // 隐藏下拉框
    $('select').removeClass('hide').addClass('hide')
    $('.m-val').removeClass('hide')

  })

  $('body').on('click','.m-val',doShowSel)
  $('body').on('click','.m-item-add',doAdd)
  $('body').on('click','.m-item-del',doDel)
  $('body').on('focus','select', function (e) { 
    previous = this.value 

    //初始化下拉数据
    let t = e.currentTarget
    let p = $(t).parent().parent()
    let id = p.attr('data-id')
    initSel($(`.s${id}`))
  }).change(doChange)
}


function initTimer() {
  _sTime = moment()
  _stop = false
  _timeHandle = setTimeout(doTimer, 1000)
}

function doTimer() {
  $('.m-wl-time').text(caluTime(_sTime))

  if (!_stop) {
    setTimeout(doTimer, 1000)
  }
}


function doLog() {
  account = JSON.parse(window.localStorage.getItem('EWORD_USER'))
  window.location = `log.html?account=${account.code}`
}

function doStart(e) {
  initData()
  updateLib()
  initTimer()
  
  let root = '<div class="m-item" data-lv="1" data-id="1"><div class="m-item-cnt"><span class="m-val">请选择</span><select class="s1 hide"></select></div><div class="m-item-fun"><div class="m-item-add">+</div><div class="m-item-del hide">del</div></div><div class="m-child"></div></div>'
  $('.m-root').empty().append(root)
}

async function doSave(e) {
  // 停止计时器
  _stop = true

  let file = await canvas2Blob()
  var formData = new FormData()
  formData.append('file',file,'upload.jpg')
  formData.append("code", account.code)
  formData.append("log",  JSON.stringify(log))

  promiseUpload('/save',formData,(e)=>{
    if (e.code === 200) {
      toastr.error('保存成功！');
      $('.m-save').addClass('hide');
    }else{
      toastr.error('保存失败！');
    }
  })
}


// 显示下拉框
function doShowSel(e) {
  let t = e.currentTarget
  $(t).addClass('hide')
  $(t).next().removeClass('hide')
  $(t).next().trigger('focus')
}

//刷新单词库显示
function updateLib() {
  $('.m-wl-count').text(lib.length)
  $('.m-wl-time').text('0:00:00')
  $('.m-wl-l').empty()
  lib.map((e,index)=>{
    let item = `<span class="m-word">${e}</span>`
    $('.m-wl-l').append(item)
  })
}

//选择单词
function doChange(e) {
  let type 
  let t = e.target
  let val = t.value
  if (previous!=='') {
    lib.push(previous)
    lib.sort()
    type = 'change'
  }else{
    type = 'select'
  }
  delWord(val)
  updateLib()
  $('select').blur()

  // 隐藏下拉框
  $(t).addClass('hide')
  $($(t).prev()[0]).text(val).removeClass('hide')

  if(lib.length === 0) {
    $('.m-save').removeClass('hide')
  }

  // 保存日志
  let lv  = $(t).parent().parent().attr('data-lv')
  let sel_id = $(t).parent().parent().attr('data-id')
  addLog(type,lv,sel_id,val)
}


//从单词库中移除单词
function delWord(w) {
  for(let i=0;i<lib.length;i++) {
    if (w === lib[i]) {
      lib.splice(i,1)
      break
    }
  }
}


// 添加单词节点
function doAdd(e) {
  let count = $('.m-item').length
  if (count===max) {
    toastr.error('超过单词数量');
    return
  }

  let t = e.currentTarget
  let p = $(t).parent().parent()
  let lv = parseInt(p.attr('data-lv'))+1
  let id = p.attr('data-id')
  let cid = $(t).parent().next().children().length+1
  let sel_id = `${id}-${cid}`

  let item = `<div class="m-item" data-lv="${lv}" data-id="${sel_id}"><div class="m-item-cnt"><span class="m-val">请选择</span><select class="s${sel_id} hide"><option value ="">请选择</option></select></div><div class="m-item-fun"><div class="m-item-add">+</div><div class="m-item-del">-</div></div><div class="m-child"></div></div>`

  $(t).parent().next().append(item)

  // 保存日志
  addLog('add',lv,sel_id,'')
}


// 删除单词节点
function doDel(e) {
  let t = e.currentTarget

  let self = $(t).parent().parent()
  let childList = $(self).find('.m-val')
  childList.map((index,item)=>{
    let val = $(item).text()
    if (val!=='请选择') {
      lib.push(val)
    }
  })

  let lv  = $(self).attr('data-lv')
  let sel_id = $(self).attr('data-id')
  let val = $(self).find('.m-item-cnt select').val()
  let n = self.nextAll()

  // 删除节点
  self.remove()
  
  // 修正后续id
  fixIndex(n,lv)
  // 更新word
  updateLib()
  
  // 保存日志
  addLog('del',lv,sel_id,val)
}


function fixIndexById(item,level) {
  let arr = $(item).attr('data-id').split('-')
  arr[level-1] = parseInt(arr[level-1])-1
  let id = arr.join('-')
  $(item).attr('data-id',id)
  return id
}

//删除后修改后续item的id
function fixIndex(e,level) {
  e.map((index,item)=>{
    // let arr = $(item).attr('data-id').split('-')
    // let len = arr.length
    // arr[level-1] = parseInt(arr[level-1])-1
    
    // let id = arr.join('-')
    let id = fixIndexById(item,level)
    // $(item).attr('data-id',id)
    $(item).find('select').attr('class',`s${id}`)
    $(item).find('.m-item').map((j,ele)=>{
      fixIndexById(ele,level)
    })

  })
}

// 初始化下拉框
function initSel(e) {
  e.empty()
  e.append(`<option value ="">请选择</option>`)
  lib.map((item,index)=>{
    e.append(`<option value ="${item}">${item}</option>`)
  })
}

//添加日志
function addLog(act, level, id, params) {
  log.push({
    time: moment().format('YYYY-MM-DD HH:mm:ss'),
    act: act,
    level:level,
    id:id,
    params:params
  })
}

















