// const BASE = "http://47.111.22.103:8080";
// const BASE_API = "http://47.111.22.103:8080/api";

// const BASE = "http://127.0.0.1:8080";
// const BASE_API = "http://127.0.0.1:8080/api";

const BASE_API = "http://133.167.73.231:8080"


/* VARIABLE DEF */
const MASK = 1
const NO_MASK = 0


/* LODER DEF */
const LOADER = '<div class="mask" id="i-mask" style="position:absolute; top:0; left:0;right:0; bottom:0;z-index:9999999999;background:rgba(0,0,0, 0.15);display:flex;justify-content: center;align-items: center;"><div class="loaded"><div class="loaders "><div class="loader"><div class="loader-inner ball-spin-fade-loader"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div></div></div></div></div>';


/* MSG DEF */
const MSG_COMMENT_SUCCESS = "提交留言成功！";
const MSG_ERROR = "网络出错！";


/* AJAX DEF */
function renderTmpl(tmpl, cb) {  
  $.ajax({url: tmpl, async: false}).then(function(e) { 
    cb(e);
  });
}


function promise(method, url, data, isMask, cb) {
  isMask ? $('body').append(LOADER) : null;
  var promise = $.ajax({
    type: method,
    crossDomain: true,
    url: BASE_API + url,
    dataType: 'json',
    contentType: "application/json",
    data: data,
  });
  promise
    .then(function (e) {
      $('#i-mask').remove();
      cb(e);
    })
    .catch(function (err) {
      $('#i-mask').remove();
      console.log(err);
    });
}

function promiseTmpl(method, tmpl, url, data, isMask, cb) {
  isMask ? $('body').append(LOADER) : null;
  $.when(
    $.ajax(tmpl),
    $.ajax({
      type: method,
      crossDomain: true,
      url: BASE_API + url,
      dataType: 'json',
      contentType: "application/json",
      data: data,
    })
  ).done(function (tmpl, e) {
    $("#i-mask").remove();
    cb(tmpl[0], e[0]);
  });
}

function promiseTmplWhen(tmpl, url_a, url_b, isMask, cb) {  
  isMask ? $('body').append(LOADER) : null;
  $.when(
    $.ajax(tmpl),
    $.ajax({
      type: 'GET',
      crossDomain: true,
      url: BASE_API + url_a,
      dataType: 'json',
      contentType: "application/json",
    }),
    $.ajax({
      type: 'GET',
      crossDomain: true,
      url: BASE_API + url_b,
      dataType: 'json',
      contentType: "application/json",
    }))
    .done(function (tmpl, e1, e2) {
      $("#i-mask").remove();
      cb(tmpl[0], e1[0], e2[0]);
    });
}


/* TMPL FUNC DEF */
var rdHelper = {
  formatTimeDay: function (t) {
    return moment(t).format("YYYY.MM.DD");
  },
  formatTimeMin: function (t) {
    return moment(t).format("YYYY/MM/DD HH:mm");
  },
  getSimpleContent: function (rich) {
    return rich.replace(/<(?:.|\n)*?>/gm, '');
  },
  formatImageURL: function (img) {  
    return BASE + '/' + img;
  },
  formatIconURL: function (img) {  
    img = img.replace('project_imgs','icon_project_imgs').toLowerCase() ;
    return BASE + '/' + img;
  },
  formatIconURLHonor: function (img) {  
    img = img.replace('honor/honor','icon/icon-honor');
    return BASE + '/' + img;
  }
}


/* OTHER FUNC DEF */
function encodeQuery(obj) {
  var params = [];
  Object.keys(obj).forEach(function (key) {
    var value = obj[key]
    if (typeof value === 'undefined') {
      value = '';
    }
    params.push([key, encodeURIComponent(value)].join('='))
  })
  return params.join('&')
}

function getUrlVars()
{
    var vars = [], hash;
    var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
    for(var i = 0; i < hashes.length; i++)
    {
        hash = hashes[i].split('=');
        vars.push(hash[0]);
        vars[hash[0]] = hash[1];
    }
    return vars;
}


