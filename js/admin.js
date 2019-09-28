var USER_SIZE = 10,WORD_SIZE = 10
var _type,_tmpl,_size

init()


function init() {

  let init = getUrlParam('init')
  
  if (init === 'test') {
    doTestMG()
  }else{
    doUserMG()
  }


  

  $('body').on('click','.m-logout', doLogout)
  $('body').on('click','.m-user-mg',doUserMG)
  $('body').on('click','.m-word-mg',doWordMG)
  $('body').on('click','.m-test-mg',doTestMG)
  
  
  
  $('body').on('click','.m-modify' ,doModify)
  $('body').on('click','.m-save' ,doSave)
  $('body').on('click','.m-undo' ,doUndo)
  $('body').on('click','.m-delete' ,doDel)
  $('body').on('click','.m-add' ,doAdd)

  $('body').on('change','#uploadFile', doImport);
}

function doAdd(e) {
  let count = $('.m-row').length+1

  if (_type === MODULE_USER) {
    $('.m-user').append(`<div class="m-row m-row-add"><div class="m-uid"><input type="text" class="m-edit disabled" value="${count}"></div><div class="m-id hide"><input type="text" class="m-edit disabled" value="0"></div><div class="m-code"><input type="text" class="m-edit disabled"></div><div class="m-usr"><input type="text" class="m-edit disabled"></div><div class="m-cls"><input type="text" class="m-edit disabled"></div><div class="m-pwd"><input type="text" class="m-edit disabled"></div><div class="m-fun" data-id="0"><span class="m-btn m-modify">修改</span><span class="m-btn m-delete">删除</span><span class="m-btn m-save hide">保存</span><span class="m-btn m-undo hide">取消</span></div></div>`)
  }else{
    $('.m-user').append(`<div class="m-row m-row-add"><div class="m-uid"><input type="text" class="m-edit disabled" value="${count}"></div><div class="m-id hide"><input type="text" class="m-edit disabled" value="0"></div><div class="m-word"><input type="text" class="m-edit disabled"></div><div class="m-symb"><input type="text" class="m-edit disabled"></div><div class="m-mean"><input type="text" class="m-edit disabled"></div><div class="m-imgw"><input type="text" class="m-edit disabled"></div><div class="m-fun" data-id="{{:id}}"><span class="m-btn m-modify">修改</span> <span class="m-btn m-delete">删除</span><span class="m-btn m-save hide">保存</span><span class="m-btn m-undo hide">取消</span></div></div>`)
  }
  
  $("#control-page").pagination('selectPage', $("#control-page").pagination('getPagesCount'))
  $('.m-row').last().find('.m-modify').trigger('click')
}

function doDel(e) {
  let t = e.currentTarget
  let id  = $(t).parent().prevAll('.m-id' ).children().val()
  let data = { id: id }
  let url = (_type===MODULE_USER)?'/deluser':'/delword'

  promise('post',url,JSON.stringify(data), true, (r)=>{
    refreshPage(_tmpl,r.data,_type,_size)
  })
}
 
function doSave(e) {
  let t = e.currentTarget


  if (_type === MODULE_USER) {
    let id   = $(t).parent().prevAll('.m-id' ).children().val()
    let usr  = $(t).parent().prevAll('.m-usr' ).children().val()
    let code = $(t).parent().prevAll('.m-code').children().val()
    let cls  = $(t).parent().prevAll('.m-cls' ).children().val()
    let pwd  = $(t).parent().prevAll('.m-pwd' ).children().val()
    let data = { id: id,  usr: usr, code: code, cls: cls, pwd: pwd }
    promise('post','/saveuser',JSON.stringify(data), true, (r)=>{
      doUserMG()
    })
  }else{
    let id   = $(t).parent().prevAll('.m-id'  ).children().val()
    let word = $(t).parent().prevAll('.m-word').children().val()
    let symb = $(t).parent().prevAll('.m-symb').children().val()
    let mean = $(t).parent().prevAll('.m-mean').children().val()
    let imgw = $(t).parent().prevAll('.m-imgw').children().val()
    let data = { id: id,  word: word, symb: symb, mean: mean, imgw: imgw }
    promise('post','/saveword',JSON.stringify(data), true, (r)=>{
      doWordMG()
    })
  }
}

function doImport(e) {

  let file = e.currentTarget;
  let forms = new FormData()
  forms.append('file',file.files[0])
  forms.append('type',_type)

  promiseUpload('/uploadCSV',forms,(e)=>{
    if (e.code === 200) {
      toastr.info(e.msg)
      refreshPage(_tmpl,e.data,_type,_size)
    }else{
      toastr.error(e.msg)
    }
  })
}

function doUndo(e) {
  let t = e.currentTarget
  let id  = $(t).parent().prevAll('.m-id' ).children().val()
  if (parseInt(id) === 0) {
    $(t).parent().parent().remove()
  }else{
    if (_type === MODULE_USER) {
      doUserMG()
    }else{
      doWordMG()
    }
  }

  $('.m-row .m-btn').removeClass('hide')
  $(t).parent().prevAll().find('input').addClass('disabled')
  $('.m-save').addClass('hide')
  $('.m-undo').addClass('hide')
}

function doModify(e) {
  let t = e.currentTarget
  $('.m-row .m-btn').addClass('hide')

  $(t).parent().prevAll('.m-usr' ).children().removeClass('disabled')
  $(t).parent().prevAll('.m-code').children().removeClass('disabled')
  $(t).parent().prevAll('.m-cls' ).children().removeClass('disabled')
  $(t).parent().prevAll('.m-pwd' ).children().removeClass('disabled')

  $(t).parent().prevAll('.m-word' ).children().removeClass('disabled')
  $(t).parent().prevAll('.m-symb' ).children().removeClass('disabled')
  $(t).parent().prevAll('.m-mean' ).children().removeClass('disabled')
  $(t).parent().prevAll('.m-imgw' ).children().removeClass('disabled')

  $(t).parent().find('.m-save').removeClass('hide')
  $(t).parent().find('.m-undo').removeClass('hide')
}


function doUserMG() {
  _type = MODULE_USER
  _size = USER_SIZE
  promiseTmpl('post','/tmpl/user.tmpl','/userlist',null, true, (r,e)=>{
    _tmpl = r
    refreshPage(r,e.data,'user',_size)
  })
}

function doWordMG() {
  _type = MODULE_WORD
  _size = WORD_SIZE
  promiseTmpl('post','/tmpl/word.tmpl','/wordlist',null, true, (r,e)=>{
    _tmpl = r
    refreshPage(r,e.data,'word',_size)
  })
}

function doTestMG() {
  _type = MODULE_WORD
  _size = WORD_SIZE
  promiseTmpl('post','/tmpl/test.tmpl','/testlist',null, true, (r,e)=>{
    _tmpl = r
    refreshPage(r,e.data,'test',_size)
  })
}

function refreshPage(tmpl,data,type,pg_size) {
  $('.m-admin').empty()
  $('.m-admin').append($.templates(tmpl).render(data, rdHelper))

  let COUNT = data[type].length
  let items = $('.m-row');
  items.slice(pg_size).hide();

  $('#control-page').pagination({
    items: COUNT,
    itemsOnPage: pg_size,
    prevText: '&laquo;',
    nextText: '&raquo;',
    hrefTextPrefix: '#',
    onPageClick: function (pageNumber) {
      var showFrom = pg_size * (pageNumber - 1);
      var showTo = showFrom + pg_size;
      items.hide().slice(showFrom, showTo).show();
    }
  })
}














