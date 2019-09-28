init()


function init() {
  $('body').on('click','.m-btn-login',doLogin)

}

function doLogin() {
  let usr = $('.m-usr').val()
  let pwd = $('.m-pwd').val()
  let data = {
    usr:usr,
    pwd:pwd
  }

  promise('post','/login',JSON.stringify(data), true, (e)=>{
    if (e.data.account.type === USER_TYPE_ADMIN) {
      window.location = 'admin.html'
      window.localStorage.setItem('EWORD_USER', JSON.stringify(e.data.account))
    }else{
      window.localStorage.setItem('EWORD_USER', JSON.stringify(e.data.account))
      window.localStorage.setItem('EWORD_WORD', JSON.stringify(e.data.word))
      window.location = 'index.html'
    }
  })
}








