<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator" prefix="decorator"%>
<%@ page import="com.ydhdj.fyzh.service.CommonService" %>
<%@ page import="java.sql.*" %>
<%
	CommonService cs = new CommonService();
	cs.init(request);
%>
<c:set var="path" value="<%=request.getContextPath()%>"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="keywords" content="it领域内的pdf分享平台">
<meta name="description" content="计算机领域内的pdf电子文件分享平台">
<title>ITPDF分享平台</title>
<link rel="stylesheet" href="<c:url value='/static/bootstrap-3.3.4/css/bootstrap.min.css'/>"/>
<link rel="stylesheet" href="<c:url value='/static/css/font.css'/>"/>
<link rel="shortcut icon"  href="<c:url value='/static/img/logo.ico'/>"/>
<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="http://cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
<script src="http://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<decorator:head></decorator:head>
<script type="text/javascript" charset="utf-8" src="http://static.bshare.cn/b/buttonLite.js#uuid=31130e83-30f1-4349-aa45-75f02ca4027d&style=2&textcolor=#000000&bgcolor=none&bp=qqmb,weixin,bsharesync,qzone,sinaminiblog,renren,qqim&text=分享"></script>
<script type="text/javascript" src="<c:url value='/static/js/jquery-1.11.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/static/bootstrap-3.3.4/js/bootstrap.min.js'/>"></script>
<!--  
<script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?77a82e15c4f76fe436bb69d1301a085d";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>


<script>
(function(){
    var bp = document.createElement('script');
    bp.src = '//push.zhanzhang.baidu.com/push.js';
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(bp, s);
})();
</script>
-->      
</head>
<body>
<div class="container">
	<!-- 注册登录等信息 -->
	<div class="row">
		<div class="col-md-12">
		
			<c:choose>
				<c:when test="${sessionScope.login_user != null }">
					<h4><a class="pull-right" href="<c:url value='/logout'/>">注销</a></h4>
					<h4 ><span class="pull-right">&nbsp;|&nbsp;</span></h4>
				</c:when>
			</c:choose>
			
			<h4><a class="pull-right" href="<c:url value='/register'/>">注册</a></h4>
			<h4 ><span class="pull-right">&nbsp;|&nbsp;</span></h4>
			<h4>
				<c:choose>
					<c:when test="${sessionScope.login_user != null }">
						<div class="dropdown">
							<a id="label"class="pull-right" href="<c:url value='/personal_center'/>">${sessionScope.login_user['name'] }</a>
							<ul class="dropdown-menu" role="menu" aria-labelledby="label">
								<li role="presentation">
									<a class="menuitem">注销</a>
								</li>
							</ul>
						</div>
						
					</c:when>
					<c:otherwise>
						<a class=" pull-right" href="<c:url value='/login'/>">登录</a>
					</c:otherwise>
				</c:choose>
				
			</h4>
			<a class="bshareDiv" href="http://www.bshare.cn/share">分享按钮</a>
			
		</div>
	</div>
	<br>
	<!-- logo区域 -->
	<div class="row">
		<div class="col-md-4" >
		<a href="${path }/show_main">
			<img alt="itpdf logo" src="static/img/logo.png">
		</a>
		</div>
		<div class="col-md-4 col-md-offset-4">
			 <div class="input-group">
               <input id="searchKeyWord" type="text" class="form-control" value="${requestScope.search_key }">
               <span class="input-group-btn">
                  <button id="searchInSite" class="btn btn-default" type="button">站内搜索</button>
               </span>
            </div>
		</div>
	</div>
	<br>
	<div class="row">
		<!-- 左侧分类区域 -->
		<div class="col-md-3" >
			<div class="list-group">
				<div class="list-group-item active"><i class="glyphicon glyphicon-th">&nbsp;PDF文件分类</i></div>
				<c:forEach items="${requestScope.all_category}" var="item" varStatus="index">
				    <c:url value="/show_category?category=${item['category']}&start=0&curPageIndex=0" var="url"></c:url>
					<div class="list-group-item"><a href="${url }">${item['category']}(${item['cnt']})</a></div>
				</c:forEach>
			</div>
			<div class="list-group">
				<div class="list-group-item active"><i class="glyphicon glyphicon-user">&nbsp;联系方式</i></div>
				<div class="list-group-item">
					<h5><a href="mailto:fyzh88@126.com">Email:fyzh84@163.com</a></h5>
			   		<h5><a href="tencent://message/?uin=707321921&amp;Site=QQ&amp;Menu=yes">QQ群:521614960</a></h5>
			   		<h5><a href="tencent://message/?uin=707321921&amp;Site=QQ&amp;Menu=yes">QQ:1776138054</a></h5>
				</div>
			</div>
		</div>
	
		<div class="col-md-9">
			<!-- 各个页面特异区域 -->
			<decorator:body></decorator:body>
		</div>
	</div>
	<!-- 页脚 -->
	<div class="row">
		<div class="col-md-10">
		</div>
		<div class="col-md-1">
			<a href="#">友情链接</a>
			<a href="http://www.runoob.com/" target="_blank">菜鸟笔记</a>
			<a href="http://www.boost.org/" target="_blank">boost-c++</a>
		</div>
		<div class="col-md-1">
			<c:url var="disclaimerUrl" value="/show_disclaimer"></c:url>
			<a href="${disclaimerUrl }">免责声明</a>
			<c:url var="adviceUrl" value="/show_advice"></c:url>
			<a href="${adviceUrl }">意见反馈</a>
			<c:url var="contactUrl" value="/show_contact"></c:url>
			<a href="${contactUrl }">联系我们</a>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			   <div style="text-align:center;">
			      <h6>Copyright &copy; 2015-2020    All Rights Reserved. </h6>
			   </div>
		</div>
		<div class="col-md-12">
			<div style="text-align:center;">
			<h6>冀ICP备15029302号 &nbsp;&nbsp;版权所有</h6>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12" style="height:45px">
		</div>
	</div>
</div>
<script type="text/javascript">
	var path="${path}";
</script>
<script type="text/javascript" src="<c:url value='/static/my_js/search.js'/>"></script>
</body>
</html>