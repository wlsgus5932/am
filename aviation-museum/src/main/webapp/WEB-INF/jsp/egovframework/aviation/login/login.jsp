<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
  </head>
  <!-- css -->
  <link rel="stylesheet" href="assets/css/main_css.css" />

  <script src="assets/libs/jquery/jquery-3.6.3.min.js"></script>

  <script>
    $(function () {
      $('#member_id').focus()
    })
    function validateEncryptedForm() {
      var username = document.getElementById('member_id').value
      var password = document.getElementById('member_pw').value
      if (!username) {
        alert('ID를 입력해주세요.')
        $('#member_id').focus()
        return false
      }
      if (!password) {
        alert('비밀번호를 입력해주세요.')
        $('#member_pw').focus()
        return false
      }

      try {
        var rsaPublicKeyModulus = document.getElementById('rsaPublicKeyModulus').value
        var rsaPublicKeyExponent = document.getElementById('rsaPublicKeyExponent').value
        submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPublicKeyExponent)
      } catch (err) {
        alert(err)
      }
      return false
    }

    function submitEncryptedForm(username, password, rsaPublicKeyModulus, rsaPpublicKeyExponent) {
      var rsa = new RSAKey()
      rsa.setPublic(rsaPublicKeyModulus, rsaPpublicKeyExponent)
      // 사용자ID와 비밀번호를 RSA로 암호화한다.
      var securedUsername = rsa.encrypt(username)
      var securedPassword = rsa.encrypt(password)
      // POST 로그인 폼에 값을 설정하고 발행(submit) 한다.
      var securedLoginForm = document.getElementById('securedLoginForm')
      securedLoginForm.securedUsername.value = securedUsername
      securedLoginForm.securedPassword.value = securedPassword
      //   		    securedLoginForm.submit();
      var queryString = $('form[name=securedLoginForm]').serialize()

      $.ajax({
        type: 'post',
        url: '/login.do',
        data: queryString,
        dataType: 'json',
        contentType: 'application/x-www-form-urlencoded;charset=UTF-8',
        error: function (xhr, status, error) {},
        success: function (data) {
          console.log(data)
          if (data.session) {
            alert('로그인 성공')
            location.href = '/dashBoard.do'
          } else {
            alert('로그인 실패')
            location.href = '/login.do'
          }
        },
      })
    }
  </script>
  <script type="text/javascript" src="assets/js/rsajs/jsbn.js" defer></script>
  <script type="text/javascript" src="assets/js/rsajs/prng4.js" defer></script>
  <script type="text/javascript" src="assets/js/rsajs/rng.js" defer></script>
  <script type="text/javascript" src="assets/js/rsajs/rsa.js" defer></script>
  <!-- <script src="assets/js/pages/dashboard.init.js"></script> -->
  <!-- <script src="assets/js/app.js"></script> -->

  <% Object publicKeyModulus = request.getAttribute("publicKeyModulus"); Object publicKeyExponent = request.getAttribute("publicKeyExponent"); %>
  <body>
    <form action="" method="post" name="form" onsubmit="return false">
      <input type="hidden" id="rsaPublicKeyModulus" value="<%=publicKeyModulus%>" />          
      <input type="hidden" id="rsaPublicKeyExponent" value="<%=publicKeyExponent%>" />
      <div class="main_wrap">
        <div class="content_wrap">
          <h2 class="main_text">항공박물관</h2>
          <h3 class="sub_text">회원 서비스 이용을 위해 로그인 해주세요.</h3>
          <input
            type="text"
            name="member_id"
            id="member_id"
            class="id_wrap total_input"
            placeholder="아이디"
            onkeypress="if( event.keyCode == 13 ){validateEncryptedForm();}"
          />
          <br />
          <input
            type="password"
            name="member_pw"
            id="member_pw"
            class="passsword_wrap total_input"
            placeholder="비밀번호"
            onkeypress="if( event.keyCode == 13 ){validateEncryptedForm();}"
          />
          <br />
          <div class="login_wrap">
            <button type="button" onClick="validateEncryptedForm()">로그인</button>
          </div>
          <div class="login_main_logo_img">
            <img src="assets/custom_img/logo-black.png" alt="" height="22" />
          </div>
        </div>
      </div>
    </form>

    <form id="securedLoginForm" name="securedLoginForm" action="<%=request.getContextPath()%>/login.do" method="post" style="display: none">
                  <input type="hidden" name="securedUsername" id="securedUsername" value="" />           
      <input type="hidden" name="securedPassword" id="securedPassword" value="" />       
    </form>
  </body>
</html>
