<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Login page</title>

<style>
    html, body, div, span, applet, object, iframe,
h1, h2, h3, h4, h5, h6, p, blockquote, pre,
a, abbr, acronym, address, big, cite, code,
del, dfn, em, font, img, ins, kbd, q, s, samp,
small, strike, strong, sub, sup, tt, var,
b, u, i, center,
dl, dt, dd, ol, ul, li,
fieldset, form, label, legend,
table, caption, tbody, tfoot, thead, tr, th, td {
  margin: 0;
  padding: 0;
  border: 0;
  outline: 0;
  font-size: 100%;
  vertical-align: baseline;
  background: transparent;
}
body {
  background: white; 
  color: #000;
  font: 14px Arial;
  margin: 0 auto;
  padding: 0;
  position: relative;
 
}
h1{ font-size:28px;}
h2{ font-size:26px;}
h3{ font-size:18px;}
h4{ font-size:16px;}
h5{ font-size:14px;}
h6{ font-size:12px;}
h1,h2,h3,h4,h5,h6{ color:#563D64;}
small{ font-size:10px;}
b, strong{ font-weight:bold;}
a{ text-decoration: none; }
a:hover{ text-decoration: underline; }
.left { float:left; }
.right { float:right; }
.alignleft { float: left; margin-right: 15px; }
.alignright { float: right; margin-left: 15px; }
.clearfix:after,
form:after {
  content: ".";
  display: block;
  height: 0;
  clear: both;
  visibility: hidden;
}
.container { margin: 300px auto;
             position: relative;
             width: 900px;
             
             

             }
#content {
  background: #f9f9f9;
  background: -moz-linear-gradient(top,  rgba(248,248,248,1) 0%, rgba(249,249,249,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -o-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: -ms-linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  background: linear-gradient(top,  rgba(248,248,248,1) 0%,rgba(249,249,249,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8', endColorstr='#f9f9f9',GradientType=0 );
  -webkit-box-shadow: 0 1px 0 #fff inset;
  -moz-box-shadow: 0 1px 0 #fff inset;
  -ms-box-shadow: 0 1px 0 #fff inset;
  -o-box-shadow: 0 1px 0 #fff inset;
  box-shadow: 0 1px 0 #fff inset;
  border: 1px solid #c4c6ca;
  margin: 0 auto;
  padding: 25px 0 0;
  position: relative;
  text-align: center;
  text-shadow: 0 1px 0 #fff;
  width: 400px;
}
#content h1 {
  color: #7E7E7E;
  font: bold 25px Helvetica, Arial, sans-serif;
  letter-spacing: -0.05em;
  line-height: 20px;
  margin: 10px 0 30px;
}
#content h1:before,
#content h1:after {
  content: "";
  height: 1px;
  position: absolute;
  top: 10px;
  width: 27%;
}
#content h1:after {
  background: rgb(126,126,126);
  background: -moz-linear-gradient(left,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
  background: -webkit-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -o-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -ms-linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: linear-gradient(left,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    right: 0;
}
#content h1:before {
  background: rgb(126,126,126);
  background: -moz-linear-gradient(right,  rgba(126,126,126,1) 0%, rgba(255,255,255,1) 100%);
  background: -webkit-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -o-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: -ms-linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
  background: linear-gradient(right,  rgba(126,126,126,1) 0%,rgba(255,255,255,1) 100%);
    left: 0;
}

#content form { margin: 0 20px; position: relative }
#content form input[type="text"],
#content form input[type="password"] {
  -webkit-border-radius: 3px;
  -moz-border-radius: 3px;
  -ms-border-radius: 3px;
  -o-border-radius: 3px;
  border-radius: 3px;
  -webkit-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0,0,0,0.08) inset;
  -webkit-transition: all 0.5s ease;
  -moz-transition: all 0.5s ease;
  -ms-transition: all 0.5s ease;
  -o-transition: all 0.5s ease;
  transition: all 0.5s ease;
  background: #eae7e7 url(https://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat;
  border: 1px solid #c8c8c8;
  color: #777;
  font: 13px Helvetica, Arial, sans-serif;
  margin: 0 0 10px;
  padding: 15px 10px 15px 40px;
  width: 80%;
}
#content form input[type="text"]:focus,
#content form input[type="password"]:focus {
  -webkit-box-shadow: 0 0 2px #ed1c24 inset;
  -moz-box-shadow: 0 0 2px #ed1c24 inset;
  -ms-box-shadow: 0 0 2px #ed1c24 inset;
  -o-box-shadow: 0 0 2px #ed1c24 inset;
  box-shadow: 0 0 2px #ed1c24 inset;
  background-color: #fff;
  border: 1px solid #ed1c24;
  outline: none;
}
#employeeNumber { background-position: 10px 10px !important }
#employeePassword { background-position: 10px -53px !important }

#content form input[type="submit"] {
  background: rgb(254,231,154);
  background: -moz-linear-gradient(top,  rgba(254,231,154,1) 0%, rgba(254,193,81,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -o-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: -ms-linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  background: linear-gradient(top,  rgba(254,231,154,1) 0%,rgba(254,193,81,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fee79a', endColorstr='#fec151',GradientType=0 );
  -webkit-border-radius: 30px;
  -moz-border-radius: 30px;
  -ms-border-radius: 30px;
  -o-border-radius: 30px;
  border-radius: 30px;
  -webkit-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -moz-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -ms-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  -o-box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  box-shadow: 0 1px 0 rgba(255,255,255,0.8) inset;
  border: 1px solid #D69E31;
  color: #85592e;
  cursor: pointer;
  float: left;
  font: bold 15px Helvetica, Arial, sans-serif;
  height: 35px;
  margin: 20px 0 35px 15px;
  position: relative;
  text-shadow: 0 1px 0 rgba(255,255,255,0.5);
  width: 120px;
}
#content form input[type="submit"]:hover {
  background: rgb(254,193,81);
  background: -moz-linear-gradient(top,  rgba(254,193,81,1) 0%, rgba(254,231,154,1) 100%);
  background: -webkit-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: -o-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: -ms-linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  background: linear-gradient(top,  rgba(254,193,81,1) 0%,rgba(254,231,154,1) 100%);
  filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fec151', endColorstr='#fee79a',GradientType=0 );
}
#content form div a {
  color: #004a80;
    float: right;
    font-size: 13px;
    margin: 30px 15px 0 0;
    text-decoration: none;
}

</style>
<script type="text/javascript">
	function goFindEmployeeNumber(){
		location.href = "./findEmployeeNumber"
	}
</script>
</head>
<body>
<div class="container">
  <section id="content">
    <form action="/josso/login.do" method="post">
      <h1>Josso</h1>
      
      <div>
        <input type="text" placeholder="사원번호를 입력하세요." required="" id="employeeNumber" name="employeeNumber"/>
      </div>
      <div>
        <input type="password" placeholder="비밀번호를 입력하세요" required="" id="employeePassword" name="employeePassword"/>
      </div>
      <div>
        <input type="submit" value="Log in" />
        <a href="#">비밀번호 찾기</a>
        <a href="javascript:goFindEmployeeNumber()">사원번호 찾기</a>
        
      </div>
    </form>
    
  </section>
</div>
</body>
</html>