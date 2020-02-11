<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="digno.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="indexstyle/js/jquery.js"></script>
    <link href="https://fonts.googleapis.com/css?family=Noto+Serif:400,400italic,700|Open+Sans:300,400,600,700" rel="stylesheet">
  <link href="indexstyle/css/bootstrap.css" rel="stylesheet" />
  <link href="indexstyle/css/bootstrap-responsive.css" rel="stylesheet" />
  <link href="indexstyle/css/fancybox/jquery.fancybox.css" rel="stylesheet">
  <link href="indexstyle/css/jcarousel.css" rel="stylesheet" />
  <link href="indexstyle/css/flexslider.css" rel="stylesheet" />
  <link href="indexstyle/css/style.css" rel="stylesheet" />
  <!-- Theme skin -->
  <link href="indexstyle/skins/default.css" rel="stylesheet" />
  <!-- Fav and touch icons -->
  <link rel="apple-touch-icon-precomposed" sizes="144x144" href="indexstyle/ico/apple-touch-icon-144-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="114x114" href="indexstyle/ico/apple-touch-icon-114-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" sizes="72x72" href="indexstyle/ico/apple-touch-icon-72-precomposed.png" />
  <link rel="apple-touch-icon-precomposed" href="indexstyle/ico/apple-touch-icon-57-precomposed.png" />
  <link rel="shortcut icon" href="indexstyle/ico/favicon.png" />

</head>
<body>
  
    <div>
     <div id="mySignin" class="modal styled" tabindex="-1" role="dialog" aria-labelledby="mySigninModalLabel" aria-hidden="true">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                <h4 id="mySigninModalLabel">Login to your <strong>account</strong></h4>
              </div>
              <div class="modal-body">
                <form class="form-horizontal">
                  <div class="control-group">
                    <label class="control-label" for="inputText">Username</label>
                    <div class="controls">
                      <input type="text" id="inputText" placeholder="Username">
                    </div>
                  </div>
                  <div class="control-group">
                    <label class="control-label" for="inputSigninPassword">Password</label>
                    <div class="controls">
                      <input type="password" id="inputSigninPassword" placeholder="Password">
                    </div>
                  </div>
                  <div class="control-group">
                    <div class="controls">
                      <button type="submit" class="btn" onclick="Login()" >Sign in</button>
                    </div>
                    <p class="aligncenter margintop20">
                      Forgot password? <a href="#myReset" data-dismiss="modal" aria-hidden="true" data-toggle="modal">Reset</a>
                    </p>
                  </div>
                </form>
              </div>
            </div>
    </div>
  
    <script>
        function Login() {

            var postData = JSON.stringify({
                "username": $("#inputText").val(),
                "password": $("#inputSigninPassword").val()
            });
            $.ajax({
                type: "POST",
                url: "login.aspx/MyMethod",
                data: postData,
                contentType: "application/json; charset=utf-8",
                success: function (result) {
                   window.location.href = "admin.aspx";
                },
                error: function (msg) { alert("Please the Enter the UserName & Password"); }
            });
        }

        function callbackfunction(result) {
            if (result.d) {
                var a = result.d;

            }
        }
    </script>
</body>
</html>
