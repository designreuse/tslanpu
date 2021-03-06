<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String path = request.getContextPath();

	String basePath = request.getScheme() + "://"

			+ request.getServerName() + ":" + request.getServerPort()

			+ path + "/";
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>食品药品动态监管系统</title>
<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.5 -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/bootstrap/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/font-awesome/css/font-awesome.min.css'/>">
<link rel="stylesheet"
	href="<c:url value='/ionicons/css/ionicons.min.css'/>">
<!-- DataTables -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. Choose a skin from the css/skins
         folder instead of downloading all of them to reduce the load. -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/dist/css/skins/_all-skins.min.css">
<script
	src="${pageContext.request.contextPath }/plugins/jQuery/jQuery-2.1.4.min.js"></script>
<!--<link rel="stylesheet"
	href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
<script src="//apps.bdimg.com/libs/jquery/1.10.2/jquery.min.js"></script>
  <script src="//apps.bdimg.com/libs/jqueryui/1.10.4/jquery-ui.min.js"></script> -->
<script src="<c:url value='/js/jedate/jquery-ui.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jedate/jquery-ui.css'/>" />

<script src="<c:url value='/js/jedate/jquery-ui-timepicker-addon.js'/>"></script>
<script src="<c:url value='/js/jedate/jquery-ui-timepicker-zh-CN.js'/>"></script>
<script
	src="<c:url value='/js/jedate/jquery.ui.datepicker-zh-CN.js.js'/>"></script>
<link rel="stylesheet" type="text/css"
	href="<c:url value='/js/jedate/jquery-ui-timepicker-addon.css'/>" />

<link rel="stylesheet" href="jqueryui/style.css">

</head>
<script>
		$(function(){
			$("#cjsj").datetimepicker();
			$("#div1cytime").datetimepicker();
			$("#div2gjtime").datetimepicker();
			$("#div2yptime").datetimepicker();
			$("#div3cytime").datetimepicker();	
			$("#d7sytime").datetimepicker();
					
		});
		
		
		
    	 function changeFunc(){
    			var selectBox = document.getElementById("table");
    			
    			var selectedValue = selectBox.options[selectBox.selectedIndex].value;
    			var target1 =document.getElementById("div1");
    			var target2 =document.getElementById("div2");
    			var target3 =document.getElementById("div3");
    			var target4 =document.getElementById("div4");
    			var target5 =document.getElementById("div5");
    			var target6 =document.getElementById("div6");
    			var target7 =document.getElementById("div7");
    			var target8 =document.getElementById("div8");
    			var target9 =document.getElementById("div9");
    			var target10 =document.getElementById("div10");	
    			
    				if(target1.getAttribute("id")==selectedValue){
    							target1.style.display="block";
    				}else{
    					target1.style.display="none";
    				}
    				
    				if(target2.getAttribute("id")==selectedValue){
						target2.style.display="block";
			}else{
				target2.style.display="none";
			}
    				if(target3.getAttribute("id")==selectedValue){
						target3.style.display="block";
			}else{
				target3.style.display="none";
			}
    				if(target4.getAttribute("id")==selectedValue){
						target4.style.display="block";
			}else{
				target4.style.display="none";
			}
    				if(target5.getAttribute("id")==selectedValue){
						target5.style.display="block";
			}else{
				target5.style.display="none";
			}
    				if(target6.getAttribute("id")==selectedValue){
						target6.style.display="block";
			}else{
				target6.style.display="none";
			}
    				if( target7.getAttribute("id")==selectedValue){
						target7.style.display="block";
			}else{
				target7.style.display="none";
			}
    				
    				if(target8.getAttribute("id")==selectedValue){
						target8.style.display="block";
			}else{
				target8.style.display="none";
			}
    				if(target9.getAttribute("id")==selectedValue){
						target9.style.display="block";
			}else{
				target9.style.display="none";
			}
    				if(target10.getAttribute("id")==selectedValue){
						target10.style.display="block";
			}else{
				target10.style.display="none";
			}
    			} 
    	
    	  $(function() {
    		    var availableTags = [
    			<c:forEach var="item" items="${qy}">   
    			  "${item.qyname}",   
    			</c:forEach> +","+
    			<c:forEach var="item" items="${qy1}">   
    			  "${item.qyname}",   
    			</c:forEach> +","+
    			<c:forEach var="item" items="${qy2}">   
  			  "${item.qyname}",   
  			</c:forEach> +","+
			<c:forEach var="item" items="${qy3}">   
			  "${item.qyname}",   
			</c:forEach>  +","+
			<c:forEach var="item" items="${qy4}">   
			  "${item.qyname}",  
			</c:forEach> 
    		    ];
    		    $( "#dwname" ).autocomplete({
    		    	source: function(request, response) {
        			var results = $.ui.autocomplete.filter(availableTags, request.term);
       				response(results.slice(0, 10));}
    		    }
    		    );
    		  });
    	  function qyname(){
    		  var name = $("#dwname").val();
    		  if(name!=""){
    			  ajaxbyname(name);
    		  }
    	  }
    	  function ajaxbyname(name){
    		  $.ajax({
    			 	url:"http://localhost:8080/tslanpu/foodAjaxServlet",
    	  			data:{qyname:name},
    	  			async:false,
    	  			type:"post",
    	  			dataType:"JSON",
    	  			success:function(jsonData){
    	  				//food
    	  				if(jsonData.byqynameFood!=null)
    	  					{
        	  				var qyname = jsonData.byqynameFood.qyname;//被抽检单位
        	  				var scaddress = jsonData.byqynameFood.scaddress;//生产地址
        	  				var qyphone = jsonData.byqynameFood.qyphone; //企业负责人手机号
        	  				var qydelegate = jsonData.byqynameFood.qydelegate;//企业负责人
        	  				var scpermit = jsonData.byqynameFood.scpermit;//食品生产许可证编号
        	  				var zzcode = jsonData.byqynameFood.zzcode;//注册号
        	  				var fddelegate = jsonData.byqynameFood.fddelegate;//法定代表人
        	  				var ems = jsonData.byqynameFood.ems;//邮编
    	  					}
    	  				else if(jsonData.byqynameIndustry!=null){
    	  					var qyname = jsonData.byqynameIndustry.qyname;//被抽检单位
        	  				var scaddress = jsonData.byqynameIndustry.scaddress;//生产地址
        	  				var qyphone = jsonData.byqynameIndustry.qyphone; //企业负责人手机号
        	  				var qydelegate = jsonData.byqynameIndustry.qydelegate;//企业负责人
        	  				var scpermit = jsonData.byqynameIndustry.scpermit;//食品生产许可证编号
        	  				var zzcode = jsonData.byqynameIndustry.zzcode;//注册号
        	  				var fddelegate = jsonData.byqynameIndustry.fddelegate;
        	  				var ems = jsonData.byqynameIndustry.ems;//邮编
    	  					}
    	  				else if(jsonData.byqynameCriculate!=null){
        	  				var qyname = jsonData.byqynameCriculate.qyname;//被抽检单位
            	  			var scaddress = jsonData.byqynameCriculate.scaddress;//生产地址
            	  			var qyphone = jsonData.byqynameCriculate.qyphone; //企业负责人手机号
            	  			var qydelegate = jsonData.byqynameCriculate.qydelegate;//企业负责人
            	  			var scpermit = jsonData.byqynameCriculate.scpermit;//食品生产许可证编号
            	  			var zzcode = jsonData.byqynameCriculate.zzcode;//注册号
            	  			var fddelegate = jsonData.byqynameCriculate.fddelegate;
            	  			var ems = jsonData.byqynameCriculate.ems;//邮编
        	  				}
    	  				else if(jsonData.byqynameProduction!=null){
        	  				var qyname = jsonData.byqynameProduction.qyname;//被抽检单位
            	  			var scaddress = jsonData.byqynameProduction.scaddress;//生产地址
            	  			var qyphone = jsonData.byqynameProduction.qyphone; //企业负责人手机号
            	  			var qydelegate = jsonData.byqynameProduction.qydelegate;//企业负责人
            	  			var scpermit = jsonData.byqynameProduction.scpermit;//食品生产许可证编号
            	  			var zzcode = jsonData.byqynameProduction.zzcode;//注册号
            	  			var fddelegate = jsonData.byqynameProduction.fddelegate;
            	  			var ems = jsonData.byqynameProduction.ems;//邮编
        	  				}
    	  				else if(jsonData.byqynameAgricultural!=null){
        	  				var qyname = jsonData.byqynameAgricultural.qyname;//被抽检单位
            	  			var scaddress = jsonData.byqynameAgricultural.scaddress;//生产地址
            	  			var qyphone = jsonData.byqynameAgricultural.qyphone; //企业负责人手机号
            	  			var qydelegate = jsonData.byqynameAgricultural.qydelegate;//企业负责人
            	  			var scpermit = jsonData.byqynameAgricultural.scpermit;//食品生产许可证编号
            	  			var zzcode = jsonData.byqynameAgricultural.zzcode;//注册号
            	  			var fddelegate = jsonData.byqynameAgricultural.fddelegate;
            	  			var ems = jsonData.byqynameAgricultural.ems;//邮编
        	  				}
    	  		
    	  				/* var qyname = jsonData.byqynameFood.qyname;//被抽检单位
    	  				var fdscaddress = jsonData.byqynameFood.scaddress;//生产地址
    	  				var fdqyphone = jsonData.byqynameFood.qyphone; //企业负责人手机号
    	  				var fdqydelegate = jsonData.byqynameFood.qydelegate;//企业负责人
    	  				var fdscpermit = jsonData.byqynameFood.scpermit;//食品生产许可证编号
    	  				var fdzzcode = jsonData.byqynameFood.zzcode;//注册号 */
    	  				
    	  				$("#d1bcjdw").attr("value",fddelegate);
    	  				$("#bcydwname").attr("value",qyname);
    	  				$("#bcydwdz").attr("value",scaddress);
    	  				$("#bcjfrdb").attr("value",fddelegate);
    	  				$("#bcyzzcode").attr("value",zzcode);
    	  				$("#bcylxr").attr("value",qydelegate);
    	  				$("#bcydwtele").attr("value",qyphone);
    	  				$("#ems").attr("value",ems);
    	  				
   
    	  			}
    		  });
    	  }
       </script>

<style>
.textareaStyle {
	width: 100%;
	height: 100%;
	border: 0
}
</style>
<style>

.dzinputStyle {
	width: 400px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}
.inputStyle {
	width: 200px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}
.tabinputStyle {
	width: 200px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}
.miniinputStyle {
	width: 50px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
	BORDER-BOTTOM-STYLE: solid
}
.tabminiinputStyle {
	width: 50px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}
.tabmidinputStyle {
	width: 120px;
	BORDER-TOP-STYLE: none;
	BORDER-RIGHT-STYLE: none;
	BORDER-LEFT-STYLE: none;
}
</style>
<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<header class="main-header"> <!-- 头部标题 --> <jsp:include
			page="/pages/header.jsp"></jsp:include> </header>

		<!-- Left side column. contains the logo and sidebar -->
		<!-- 左边栏 -->
		<aside class="main-sidebar"> <!-- sidebar: style can be found in sidebar.less -->
		<jsp:include page="/pages/left.jsp"></jsp:include> <!-- /.sidebar -->
		</aside>

		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<!--  <section class="content-header">
          <h1>
            Data Tables
            <small>advanced tables</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
            <li><a href="#">Tables</a></li>
            <li class="active">Data tables</li>
          </ol>
        </section> -->
			<!-- Main content -->
			<section class="content">
			<div class="row" style="text-align: center">
				<div class="col-xs-12">
					<div class="box">
						<div class="box-header">
							<h3>抽检报告制作</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<form id="formValidate" action="<c:url value='/FoodServlet'/>"
								method="post">
								<input type="hidden" name="method" value="add"> <input
									type="hidden" name="token" value="${tokenF }">
								<table id="" class="table table-condensed">
									<tbody>
										<tr>
											<td><label for="dwname">1.被抽检单位</label></td>
											<td><input id="dwname" type="text" style="width: 260px"
												onblur="qyname()"></td>
											<td><b>2.抽检时间</b></td>
											<td><input id="cjsj" type="text" style="width: 260px"
												class="" name="cjsj" /></td>
										</tr>

										<tr>
											<td>请选择表：</td>
											<td><select id="table" style="width: 280px" name="table"
												onchange="changeFunc();">
													<option value="div0">请选择</option>
													<option value="div1">食品安全抽样检验告知书</option>
													<option value="div2">食品安全抽样检验抽样单</option>
													<option value="div3">食品安全抽样检验工作质量及工作纪律反馈单</option>
													<option value="div4">食品安全抽样检验样品购置费用告知书</option>
													<option value="div5">现场检查笔录</option>
													<option value="div6">食品安全抽样检验样品信息登记表</option>
													<option value="div7">食品安全抽样检验样品移交确认单</option>
													<option value="div8">食品安全抽样检验封条</option>
													<option value="div9">检验结果告知书</option>
													<option value="div10">食品安全快速检测登记表</option>
											</select></td>
										</tr>
								</table>
							</form>

							<div id="div1" style="display: none">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 22.0pt; font-family: 方正小标宋简体'>食品安全抽样检验告知书<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US style='font-size: 22.0pt'><o:p>&nbsp;</o:p></span>
								</p>

							<p class=MsoNormal align=center style='text-align:right'><span lang=EN-US
style='font-size:22.0pt'><span style="mso-spacerun:yes">                  
</span></span><span lang=EN-US style='font-size:12.0pt'>No<input
										id="d1num" class="inputStyle"><span
										style="mso-spacerun: yes">               </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US style='font-size: 12.0pt'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align=center style='text-align: left'>
									<span lang=EN-US style='font-size: 15.0pt; font-family: 仿宋_GB2312><spanstyle="mso-spacerun: yes">                       </span></span><span
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><input
										id="d1bcjdw" class="inputStyle">：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>
								<p align="left">
									<span lang=EN-USstyle='font-size: 15.0pt; font-family:仿宋_GB2312'>
										依据《中华人民共和国食品安全法》，国家对食品进行定期或者不定期的抽样检验。按我局部署，现对你单位依法进行国家食品安全（ <input
										type="radio" name="examtype" value="监督抽检">监督抽检<input
										type="radio" name="examtype" value="风险监测">风险监测）。请你单位认真阅读本通知书背面《食品安全抽样检验企业须知》，并予以积极配合。
									</span>
								</p>
								<table border="0" align="center">
									<tr>
										<td>被抽食品：<input id="d1bcsp" class="inputStyle">
										</td>
									</tr>

									<tr>
										<td>抽样单位：<input id="d1cydw" class="inputStyle">
										</td>
									<tr>
										<td>抽样人员：<input id="d1cyry" class="inputStyle">
										</td>
									</tr>

									<tr>
										<td>抽样日期：<span><input type="text"
												class="inputStyle" id="div1cytime" readonly /> </span>

										</td>
									</tr>
								</table>
								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">                                  
									</span></span><span style='font-size: 15.0pt; font-family: 仿宋_GB2312'>年<span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span>月<span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span>日<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal style='text-indent: 30.0pt'>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">                  </span></span><span
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'>有效期至<span
										lang=EN-US><span style="mso-spacerun: yes">        
										</span></span>年<span lang=EN-US><span style="mso-spacerun: yes">   
										</span></span>月<span lang=EN-US><span style="mso-spacerun: yes">   
										</span></span>日<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US
										style='font-size: 15.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 24.0pt; mso-char-indent-count: 2.0'
									align="left">
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>本告知书一式三联。第一联被抽样单位留存；第二联
										抽样单位留存；第三联组织抽样检验的食品药品监管部门（市场监管部门）留存<span lang=EN-US><o:p></o:p></span>
									</span>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 22.0pt; font-family: 方正小标宋简体'>食品安全抽样检验被抽样单位须知<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>1</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．对食品进行抽样检验是食品药品监管部门依法履行监管职责的一项重要措施，任何单位和个人不得妨碍抽检工作的正常进行。被抽样单位无正当理由，对抽样工作不配合或者拒绝抽样检验的，按拒检处理。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>2</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．依据《中华人民共和国食品安全法》的有关规定，抽样检验的样品通过购买的方式获取<span
										lang=EN-US>,</span>不向被抽样单位收取检验费和其他任何费用。被抽样单位应及时将《国家食品安全抽样检验样品购置费用告知书》和相应的发票送至指定单位。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>3</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．国家食品安全抽样检验事先不通知被抽样单位。抽样人员不得少于</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>2</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>名，抽样前应向被抽样单位出示注明抽检监测内容的《国家食品安全抽样检验告知书》（原件）和抽样人员有效身份证件。抽样单位为承检机构的，抽样前还应向被抽样单位出示《国家食品安全抽样检验任务委托书》<span
										lang=EN-US>(</span>复印件<span lang=EN-US>)</span>。样品应由抽样人员从食品生产者的成品库的待销产品、食品经营者销售的食品、餐饮服务提供者使用或销售的食品中抽取。食品标签、包装、说明书标有“试制”或者“样品”等字样的和全部用于出口的食品不在抽样范围。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>4</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．抽取的样品应由抽样人员自行送达或寄送至承检机构。确需被抽样单位协助寄送的，抽样人员应明确告知样品的寄、送要求。被抽样单位应在规定的时限内正确寄送，寄送样品的费用由抽样单位支付。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>5</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．被抽样单位应当协助抽样工作人员如实填写国家食品安全抽样检验抽样单。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>6</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．被抽样单位、生产者对执行此次抽检任务的单位、个人及有关抽检工作的任何意见，请填写《国家食品安全抽样检验工作质量及工作纪律反馈单》，填写完毕后寄送至指定单位。反馈意见者应留下电话、传真、</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>Email</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>等联系方式。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 32.0pt; mso-char-indent-count: 2.0; mso-line-height-alt: 0pt'
									align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>7</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>．凡在市场上抽取的或涉及委托加工的样品，生产者或委托加工方应自收到通知之日起</span><span
										lang=EN-US
										style='font-size: 16.0pt; mso-fareast-font-family: 仿宋_GB2312'>5</span><span
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'>个工作日内反馈意见，逾期未反馈的，视为认同样品的真实性。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

							</div>
							<div id="div2" style="display: none">
								<p class=MsoNormal align=center
									style='text-align: center; line-height: 28.0pt; mso-line-height-rule: exactly'>
									<span style='font-size: 18.0pt; font-family: 方正小标宋简体'>食品安全抽样检验抽样单<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span
										style='font-size: 10.5pt; mso-ascii-font-family: "Times New Roman"'>抽样单编号：</span><input id="d2bianhao"
										class="inputStyle"><span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'><span
										style="mso-spacerun: yes">                          </span><span
										style="mso-spacerun: yes">   </span><span
										style="mso-spacerun: yes">  </span></span><span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'><span
										style="mso-spacerun: yes">                 </span><span
										style="mso-spacerun: yes">    </span>  <span
										style="mso-spacerun: yes">  </span></span><span lang=EN-US
										style='font-size: 10.5pt; font-family: "Monotype Corsiva"'>N</span><u><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>O</span></u><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>
									</span><span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'><span
										style="mso-spacerun: yes"><input id="d2no" type="text"
											class="miniinputStyle"></span> <o:p></o:p></span>
								</p>

								<div align=center>

									<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
										width=517
										style='width: 517.3pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
										<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
											<td width=107 colspan=2
												style='width: 106.75pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>任务来源<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=235 colspan=9
												style='width: 234.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="d2rwly" type="text" class="tabinputStyle"></o:p></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>任务类别<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'><input type="radio" name="rwlb" value="监督抽检">监督抽检 <input type="radio" name="rwlb" value="风险监测">风险监测<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 1'>
											<td width=53 rowspan=4
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>被抽样<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>单位信息<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>单位名称<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=235 colspan=9
												style='width: 234.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="bcydwname" type="text" class="tabinputStyle"/></o:p></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>区域类型<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'><input type="radio" name="dctype" value="城市">城市<input type="radio" name="dctype" value="乡村">乡村<input type="radio" name="dctype" value="景点">景点<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 2'>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>单位地址<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=411 colspan=17
												style='width: 410.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal
													style='text-indent: 52.5pt; mso-char-indent-count: 5.0; line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>省（区、市）<span
														lang=EN-US><span style="mso-spacerun: yes">  
														</span><span style="mso-spacerun: yes"> </span><span
															style="mso-spacerun: yes"> </span><span
															style="mso-spacerun: yes"> </span></span>地区（市、州、盟）<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span><span style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes">  </span></span>县（市、区）<span lang=EN-US><span
															style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes">  </span></span>乡（镇）<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 16.0pt; mso-line-height-rule: exactly' align="center">
													<span lang=EN-US style='font-size: 10.5pt'><span
														style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes"></span> <o:p><input id="bcydwdz" type="text" class="dzinputStyle"></o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 3'>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>法人代表<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=56 colspan=2
												style='width: 56.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="bcjfrdb" type="text" class="tabinputStyle"/></o:p></span>
												</p>
											</td>
											<td width=48 colspan=5
												style='width: 48.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>年销售额<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=131 colspan=2
												style='width: 130.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=right style='text-align: right'>
													<span style='font-size: 10.5pt'><input id="bcjxse" type="text" class="tabminiinputStyle">万元<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=70 colspan=3
												style='width: 69.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>营业执照号<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=107 colspan=5
												style='width: 106.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="bcyzzcode" type="text" class="tabmidinputStyle"></o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 4'>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>联 系 人<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=56 colspan=2
												style='width: 56.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="bcylxr" type="text" class="tabinputStyle"></o:p></span>
												</p>
											</td>
											<td width=48 colspan=5
												style='width: 48.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>电<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>话<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=88
												style='width: 88.05pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input class="tabmidinputStyle" type="text" id="bcydwtele"></o:p></span>
												</p>
											</td>
											<td width=43
												style='width: 42.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>传真<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=70 colspan=3
												style='width: 69.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input id="fax" type="text" class="tabminiinputStyle"></o:p></span>
												</p>
											</td>
											<td width=35 colspan=2
												style='width: 34.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>邮编<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=72 colspan=3
												style='width: 72.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p><input class="tabmidinputStyle" type="text" id="ems"></o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 5'>
											<td width=53
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>抽样地点<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=464 colspan=18
												style='width: 463.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal
													style='line-height: 11.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>生产环节：<input type="radio" name="schj" value="原辅料库">原辅料库<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span><input type="radio" name="schj" value="生产线">生产线<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="schj" value="半成品库">半成品库<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>成品库（<input type="radio" name="schjcpk" value="待检区">待检区 <input type="radio" name="schjcpk" value="已检区">已检区）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 11.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>流通环节：<input type="radio" name="lthj" value="农贸市场">农贸市场<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>□菜市场<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="批发市场">批发市场<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="商店">商场<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="超市">超市<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="小食杂店">小食杂店<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="网购">网购<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="lthj" value="其他">其他（<input id=" lyhjother" type="text" class="miniinputStyle">）<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 11.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>餐饮环节：<input type="radio" name="cyhj" value="餐馆">餐馆（<input type="radio" name="cg" value="特大型餐馆">特大型餐馆<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span><input type="radio" name="cg" value="大型餐馆">大型餐馆<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="cg" value="中型餐馆">中型餐馆<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="cg" value="小型餐馆">小型餐馆）<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 11.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 9.0pt'><span
														style="mso-spacerun: yes">          </span></span><span
														style='font-size: 9.0pt'><input type="radio" name="cyhj" value="食堂">食堂（<input type="radio" name="st" value="机关食堂">机关食堂<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span><input type="radio" name="st" value="学校">学校
													</span><span
														style='font-size: 9.0pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 9.0pt'>托幼食堂<span lang=EN-US><span
															style="mso-spacerun: yes">    </span><span
															style="mso-spacerun: yes">    </span></span><input type="radio" name="st" value="企事业单位食堂">企事业单位食堂<span
														lang=EN-US><span style="mso-spacerun: yes">       
														</span></span><input type="radio" name="st" value="建筑工地食堂">建筑工地食堂）<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 11.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 9.0pt'><span
														style="mso-spacerun: yes">          </span></span><span
														style='font-size: 9.0pt'><input type="radio" name="cyhj" value="小吃店">小吃店<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span><input type="radio" name="cyhj" value="快餐店">快餐店<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span><input type="radio" name="cyhj" value="饮品店">饮品店<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span><input type="radio" name="cyhj" value="集体用餐配送单位">集体用餐配送单位<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span><input type="radio" name="cyhj" value="中央厨房">中央厨房<span lang=EN-US><span
															style="mso-spacerun: yes">      </span></span><input type="radio" name="cyhj" value="其他">其他（<input id="cyhjother" type="text" class="miniinputStyle">）<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 6'>
											<td width=53 rowspan=10
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品信息<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品来源<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=323 colspan=12
												style='width: 322.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'><input type="radio" name="yply" value="加工">加工</span><span
														style='font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 10.5pt; mso-hansi-font-family: 宋体; mso-bidi-font-family: 宋体'>自制<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span></span></span><span style='font-size: 10.5pt'><input type="radio" name="yply" value="委托生产">委托生产<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span></span><input type="radio" name="yply" value="外购">外购<span lang=EN-US><span style="mso-spacerun: yes">   
														</span></span><input type="radio" name="yply" value="其他">其他<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 7'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品属性<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=323 colspan=12
												style='width: 322.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□普通食品<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>□特殊膳食食品<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□节令食品<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□重大活动保障食品<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 8'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品类型<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=323 colspan=12
												style='width: 322.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>□食用农产品<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>□工业加工食品<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□餐饮加工食品<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>□食品添加剂<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>□食品相关产品<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>□其他（<span lang=EN-US><span
															style="mso-spacerun: yes">              </span></span>）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 9'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品名称<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=147 colspan=4
												style='width: 146.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>商标<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 10'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□生产</span><span
														style='font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 10.5pt'>□加工</span><span
														style='font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 10.5pt'>□购进日期<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=147 colspan=4
												style='width: 146.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<input type="text" id="div2gjtime" readonly />
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>规格型号<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 11'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品批号<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=147 colspan=4
												style='width: 146.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>保质期<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 12'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>执行标准</span><span
														style='font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 10.5pt; mso-hansi-font-family: 宋体; mso-bidi-font-family: 宋体'>技术文件</span><span
														lang=EN-US style='font-size: 10.5pt'><o:p></o:p></span>
												</p>
											</td>
											<td width=147 colspan=4
												style='width: 146.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>质量等级<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 13'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>生产许可证编号<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=104 colspan=3
												style='width: 104.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=43
												style='width: 42.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>单价<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=52 colspan=4
												style='width: 51.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>是否出口<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=71 colspan=2
												style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□是 □否<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 14'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>抽样基数</span><span
														style='font-size: 10.5pt; font-family: 宋体; mso-ascii-font-family: 仿宋_GB2312; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 10.5pt; mso-hansi-font-family: 宋体; mso-bidi-font-family: 宋体'>批量</span><span
														lang=EN-US style='font-size: 10.5pt'><o:p></o:p></span>
												</p>
											</td>
											<td width=104 colspan=3
												style='width: 104.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=43
												style='width: 42.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>抽样数<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=52 colspan=4
												style='width: 51.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>备样数量<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=71 colspan=2
												style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 15'>
											<td width=141 colspan=6
												style='width: 141.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>样品形态<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=147 colspan=4
												style='width: 146.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□固体□半固体□液体□气体<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=54 colspan=2
												style='width: 53.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>包装分类<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□散装<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□预包装<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr
											style='mso-yfti-irow: 16; height: 19.85pt; mso-height-rule: exactly'>
											<td width=53 rowspan=3
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>（标示）生<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>产者信息<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=141 colspan=5
												style='width: 141.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>生产者名称<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=323 colspan=13
												style='width: 322.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr
											style='mso-yfti-irow: 17; height: 19.85pt; mso-height-rule: exactly'>
											<td width=141 colspan=5
												style='width: 141.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>生产者地址<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=323 colspan=13
												style='width: 322.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr
											style='mso-yfti-irow: 18; height: 19.85pt; mso-height-rule: exactly'>
											<td width=141 colspan=5
												style='width: 141.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>生产者联系人<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=104 colspan=4
												style='width: 104.3pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=96 colspan=3
												style='width: 96.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>联系电话<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr
											style='mso-yfti-irow: 19; height: 19.85pt; mso-height-rule: exactly'>
											<td width=53 rowspan=2
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>抽样时样<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>品的储存<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=245 colspan=9 rowspan=2
												style='width: 245.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>□常温<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□冷藏<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□冷冻<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□避光<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□密闭<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□其他<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>温度<span lang=EN-US><span
															style="mso-spacerun: yes">       </span></span>（℃）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=96 colspan=3
												style='width: 96.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>寄、送样品截止日期<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>
															<input type="text" id="div2yptime" readonly>
														</o:p></span>
												</p>
											</td>
										</tr>
										<tr
											style='mso-yfti-irow: 20; height: 19.85pt; mso-height-rule: exactly'>
											<td width=96 colspan=3
												style='width: 96.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>寄送样品地址<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 19.85pt; mso-height-rule: exactly'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 14.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 21'>
											<td width=53
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>抽样样品<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 12.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 10.5pt'>包装<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=245 colspan=9
												style='width: 245.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□玻璃瓶<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□塑料瓶<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□塑料袋<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□无菌袋<span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>□其他<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=96 colspan=3
												style='width: 96.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>抽样方式<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=123 colspan=6
												style='width: 122.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>□无菌抽样□非无菌抽样<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 22'>
											<td width=53 rowspan=2
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>抽样单位<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>信息<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>单位名称<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=192 colspan=8
												style='width: 192.05pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=43
												style='width: 42.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>地址<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=176 colspan=8
												style='width: 176.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 23'>
											<td width=53
												style='width: 53.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>联系人<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=55
												style='width: 54.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=40 colspan=5
												style='width: 39.75pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>电话<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=98 colspan=2
												style='width: 97.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=43
												style='width: 42.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>传真<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=76 colspan=4
												style='width: 76.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=39 colspan=3
												style='width: 39.1pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>邮编<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=61
												style='width: 60.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 24; height: 23.9pt'>
											<td width=53
												style='width: 53.35pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 23.9pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span style='font-size: 10.5pt'>备注<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=464 colspan=18
												style='width: 463.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm; height: 23.9pt'>
												<p class=MsoNormal align=center style='text-align: center'>
													<span lang=EN-US style='font-size: 10.5pt'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 25; mso-yfti-lastrow: yes'>
											<td width=172 colspan=5
												style='width: 172.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal
													style='line-height: 16.0pt; mso-line-height-rule: exactly'>
													<b style='mso-bidi-font-weight: normal'><span
														style='font-size: 9.0pt'>被抽样单位对抽样程序、过程、封样状态及上述内容意见：□无异议<span
															lang=EN-US><span style="mso-spacerun: yes"> 
															</span></span>□有异议<span lang=EN-US><o:p></o:p></span></span></b>
												</p>
												<p class=MsoNormal>
													<span style='font-size: 9.0pt'>被抽样单位签名（盖章）：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 45.0pt; mso-char-indent-count: 5.0'>
													<span style='font-size: 9.0pt'>年<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>日<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=172 colspan=7
												style='width: 172.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 0cm 0cm 0cm'>
												<p class=MsoNormal
													style='line-height: 15.0pt; mso-line-height-rule: exactly'>
													<b style='mso-bidi-font-weight: normal'><span
														style='font-size: 9.0pt'>生产者对抽样程序、过程、封样状态及上述内容意见：□无异议<span
															lang=EN-US><span style="mso-spacerun: yes"> 
															</span></span>□有异议<span lang=EN-US><o:p></o:p></span></span></b>
												</p>
												<p class=MsoNormal>
													<span style='font-size: 9.0pt'>生产者签名（盖章）：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 45.0pt; mso-char-indent-count: 5.0'>
													<span style='font-size: 9.0pt'>年<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>日<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=172 colspan=7
												style='width: 172.45pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>抽样人（签名）：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US style='font-size: 9.0pt'><o:p>&nbsp;</o:p></span>
												</p>
												<p class=MsoNormal
													style='line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>抽样单位（公章）：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 54.0pt; mso-char-indent-count: 6.0; line-height: 16.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 9.0pt'>年<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">     </span></span>日<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<![if !supportMisalignedColumns]>
										<tr height=0>
											<td width=53 style='border: none'></td>
											<td width=53 style='border: none'></td>
											<td width=55 style='border: none'></td>
											<td width=1 style='border: none'></td>
											<td width=10 style='border: none'></td>
											<td width=22 style='border: none'></td>
											<td width=0 style='border: none'></td>
											<td width=6 style='border: none'></td>
											<td width=10 style='border: none'></td>
											<td width=88 style='border: none'></td>
											<td width=43 style='border: none'></td>
											<td width=4 style='border: none'></td>
											<td width=50 style='border: none'></td>
											<td width=16 style='border: none'></td>
											<td width=7 style='border: none'></td>
											<td width=28 style='border: none'></td>
											<td width=1 style='border: none'></td>
											<td width=10 style='border: none'></td>
											<td width=61 style='border: none'></td>
										</tr>
										<![endif]>
									</table>

								</div>

								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 18.0pt; font-family: 方正小标宋简体'>填表说明<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>1</span><span
										style='font-size: 10.5pt'>．本文书是抽样单位在执行抽样任务时所使用的文书。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>2</span><span
										style='font-size: 10.5pt'>．“抽样编号”为抽样单位内部对所采集样品的编号，按《国家食品安全抽样检验抽样单编号规则》编制填写，一个样品有唯一抽样编号。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>3</span><span
										style='font-size: 10.5pt'>．“<span lang=EN-US>No</span>”为抽样单印制的流水号。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>4</span><span
										style='font-size: 10.5pt'>．“任务来源”要求填写出具《国家食品安全抽样检验告知书》的食品药品监管部门的名称。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>5</span><span
										style='font-size: 10.5pt'>．“任务类别”
										在“监督抽检、风险监测”中选择，仅含有风险监测项目的食品样品抽取时选择风险监测，其他选择监督抽检。<span
										lang=EN-US><o:p></o:p></span>
									</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>6</span><span
										style='font-size: 10.5pt'>．“被抽样单位名称”按照工商行政部门核发的营业执照标示名称填写。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>7</span><span
										style='font-size: 10.5pt'>．“被抽样单位地址”按照省（区、市）、地区（市、州、盟）、县（市、区）、乡（镇）、具体地址的格式填写被抽样单位的实际地址，若在批发市场等流通环节抽样时，应记录被抽样单位摊位号。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>8</span><span
										style='font-size: 10.5pt'>．“区域类型”在“城镇、乡村、景点”中选择，其中：“城市”为县中心城区及县级市以上的城（市）区域范围，“乡镇”为城（市）区域以外范围，“景点”为旅游景点范围，选择“景点”时，应同时选择“城市”或“乡镇”。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>9</span><span
										style='font-size: 10.5pt'>．“年销售额”在生产加工环节抽样时填写。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>10</span><span
										style='font-size: 10.5pt'>．“抽样地点”：当单位类型为“生产”时，在“原辅料库、生产线、半成品库、成品库（□待检区、□已检区）”选择其一；当单位类型为“流通”时，在“农贸市场、菜市场、批发市场、商场、超市、小食杂店、网购、其他”中选择其一；当单位类型为“餐饮”时，在“餐馆、食堂、小吃店、快餐店、饮品店、集体用餐配送单位、中央厨房、其他”中选择其一，当选择“餐馆”时还要在“特大型餐馆、大型餐馆、中型餐馆、小型餐馆”中进行选择，当选择“食堂”时还要在“机关食堂、学校<span
										lang=EN-US>/</span>托幼食堂、企事业单位食堂、建筑工地食堂”进行选择。<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>11</span><span
										style='font-size: 10.5pt'>．“样品来源、样品属性、样品类型”在相应的□中打“√”即可。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>12</span><span
										style='font-size: 10.5pt'>．“样品名称、规格型号、商标、生产许可证编号、样品批号、执行标准<span
										lang=EN-US>/</span>技术文件、保质期、质量等级、单价、标示生产者名称、标示生产者地址、生产者联系人、联系电话”，按实际样品包装标签或销售价签、菜单等标示的名称填写。对食用农产品、餐饮食品等非预包装食品，无明确标示内容的项目，填写“<span
										lang=EN-US>/</span>”，不得留空白。<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>13</span><span
										style='font-size: 10.5pt'>．“生产<span lang=EN-US>/</span>加工<span
										lang=EN-US>/</span>购进日期”原则上：对预包装食品按包装标签上标示的生产日期填写，散装食品按进货单标示的生产日期填写，餐饮自制食品按实际加工日期填写，餐饮环节抽取的食用农产品等，按购进日期填写。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>14</span><span
										style='font-size: 10.5pt'>．“是否出口”在相应□内打“√”即可。此处所指出口，是指同批次产品既在国内销售，又有部分用于出口。同一批次产品全部用于出口的不予抽样。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>15</span><span
										style='font-size: 10.5pt'>．“抽样基数<span lang=EN-US>/</span>批量、抽样数量、备样数量”按照相应产品的抽样检验实施细则中要求的数量抽样并据实填写，数量的单位应与规格型号中的单位一致。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>16</span><span
										style='font-size: 10.5pt'>．“样品形态、包装分类、抽样时样品的储存条件、抽样方式、抽样样品包装”在相应□内打“√”即可。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>17</span><span
										style='font-size: 10.5pt'>．“寄送样品截止日期”，原则上被抽样品应在</span><span
										lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>5</span><span
										style='font-size: 10.5pt'>日内送至承检机构，特殊情况下根据实际填写。“寄送样品地址”，抽样人员自行送达承检机构的，填写“<span
										lang=EN-US>/</span>”<span lang=EN-US>,</span>寄送样品的，需填写样品接受单位和地址。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>18</span><span
										style='font-size: 10.5pt'>．“抽样单位信息”按抽样参加人员所在单位的具体情况填写。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left" v>
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>19</span><span
										style='font-size: 10.5pt'>．备注：填写其他需要说明或采集的信息，如“进口食品”、“热加工”（糕点）等，具体参照各类食品抽样检验实施细则填写。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 16.0pt; mso-line-height-rule: exactly'
									align="left">
									<span lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'>20</span><span
										style='font-size: 10.5pt'>．抽样人签名必须要两人以上，并加盖抽样单位公章；被抽样单位和生产者须有工作人员签字确认，并加盖被抽样单位公章或其他合法印章。对特殊情况可签字并加按指模确认。</span><span
										lang=EN-US
										style='font-size: 10.5pt; font-family: "Times New Roman"'><o:p></o:p></span>
								</p>
							</div>
							<div id="div3" style="display: none">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 16.0pt; font-family: 方正小标宋简体'>食品安全抽样检验工作质量及工作纪律反馈单<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><span style="mso-spacerun: yes">                                                   
									</span><span style="mso-spacerun: yes">   </span><span
										style="mso-spacerun: yes">  </span></span><span lang=EN-US
										style='mso-bidi-font-size: 10.5pt; font-family: "Monotype Corsiva"'>N</span><u><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>O</span></u><span
										lang=EN-US
										style='font-size: 7.5pt; font-family: "Monotype Corsiva"'>
									</span><u><span lang=EN-US style='mso-bidi-font-size: 10.5pt'><span
											style="mso-spacerun: yes">                   </span> <o:p></o:p></span></u>
								</p>

								<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
									width=468
									style='width: 468.0pt; margin-left: 20pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
									<tr
										style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 38.55pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样检验产品名称<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=189
											style='width: 189.0pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=62
											style='width: 62.15pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样日期<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=127
											style='width: 126.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.55pt'>
											<input type="text" id="div3cytime" readonly />
										</td>
									</tr>
									<tr style='mso-yfti-irow: 1; height: 46.1pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 46.1pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样单位名称<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 46.1pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 2; height: 38.9pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.9pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>抽样人员姓名<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.9pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 3; height: 170.4pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 170.4pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>对抽样单位抽样工作的评价<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 170.4pt'>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>1.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（□是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span>□否）抽样人员抽样前，是否出示有效工作证？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>2.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（□是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span>□否）抽样人员是否向你单位说明样品通过购买取得（或送达《食品安全抽样检验样品购置费用告知书》）？<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>3.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（□是
													<span style="mso-spacerun: yes"> </span>□否）抽样人员是否对所抽取的样品全部当场进行封样？是否对样品采取了防拆封措施？<span
													lang=EN-US><o:p></o:p></span>
												</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>4.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（□是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span>□否）抽样人员是否按产品标签中标注的保存条件及其他特殊要求对所抽取的样品进行保存？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>5.</span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（□是<span
													lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span>□否）抽样人员在抽样过程中是否廉洁公正？<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>上述选项中填写“否”的，请简要描述抽样人员的违规行为：<span
														lang=EN-US><o:p></o:p></span></span></b>
											</p>
											<p class=MsoNormal>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（本处填写不下的，可另附书面说明）</span></b><span
													lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p></o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 4; height: 100.4pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 100.4pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>对食品抽样<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>检验工作的<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>意见和建议<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 100.4pt'>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 5; mso-yfti-lastrow: yes; height: 89.0pt'>
										<td width=90
											style='width: 90.0pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 89.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>被抽样单位<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=378 colspan=3 valign=top
											style='width: 378.0pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 89.0pt'>
											<p class=MsoNormal>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>电话：<span
													lang=EN-US><span style="mso-spacerun: yes">      
													</span>-<span style="mso-spacerun: yes">                </span>E-Mail:<o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>传真：<span
													lang=EN-US><span style="mso-spacerun: yes">      
													</span>-<span style="mso-spacerun: yes">       </span> <o:p></o:p></span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>法定代表人或负责人签字：<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
													style="mso-spacerun: yes">              </span></span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>填表日期：<span
													lang=EN-US><span style="mso-spacerun: yes">       
													</span></span>年<span lang=EN-US><span style="mso-spacerun: yes">  
													</span></span>月<span lang=EN-US><span style="mso-spacerun: yes"> 
													</span></span>日<span lang=EN-US><o:p></o:p></span></span>
											</p>
											<p class=MsoNormal
												style='text-indent: 114.0pt; mso-char-indent-count: 9.5'>
												<span lang=EN-US
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
													style="mso-spacerun: yes">                </span></span><span
													style='font-size: 12.0pt; font-family: 仿宋_GB2312'>（单位公章）<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
									</tr>
								</table>

								<p class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>说明：如对抽样工作有异议，请被抽样单位将本表填写好并加盖公章后，按以下联系方式寄送或传真本表。<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>反馈受理单位：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>通讯地址及邮编：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>联系电话：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-top: 0cm; margin-right: -7.65pt; margin-bottom: 0cm; margin-left: -18.05pt; margin-bottom: .0001pt; mso-para-margin-top: 0cm; mso-para-margin-right: -.73gd; mso-para-margin-bottom: 0cm; mso-para-margin-left: -1.72gd; mso-para-margin-bottom: .0001pt; text-indent: .05pt'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>传<span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span>真：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>
							</div>
							<div id="div4" style="display: none">
								<p class=MsoNormal align=center
									style='text-align: center; text-indent: 9.0pt; mso-char-indent-count: .5; line-height: 30.0pt; mso-line-height-rule: exactly'>
									<span
										style='font-size: 18.0pt; font-family: 方正小标宋简体; mso-hansi-font-family: 宋体'>食品安全抽样检验样品购置费用告知书<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal style='line-height: 20.0pt' align="left">
									<span lang=EN-US
										style='font-size: 16.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='margin-left: -44.95pt; mso-para-margin-left: -4.28gd; line-height: 19.0pt; mso-line-height-rule: exactly'
									align="left">
									<u><span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
											style="mso-spacerun: yes">                           </span></span></u><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>：<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-left: -45.05pt; mso-para-margin-left: -4.29gd; text-indent: 24.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<u><span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
											style="mso-spacerun: yes">             </span></span></u><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>市场监督管理局在<u><span
											lang=EN-US><span style="mso-spacerun: yes">     
											</span></span></u>年依法组织食品安全抽样检验，抽样检验食品相关信息详见编号为<u><span lang=EN-US><span
												style="mso-spacerun: yes">          </span><span
												style="mso-spacerun: yes">                                 </span><span
												style="mso-spacerun: yes">      </span></span></u>的《食品安全抽样检验抽样单》。按照《中华人民共和国食品安全法》的有关规定，食品抽样检验的样品以向企业购买的方式获得。现告知如下：<span
										lang=EN-US> <o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-left: -45.05pt; mso-para-margin-left: -4.29gd; text-indent: 24.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>1.</span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>被抽样单位须提供正式发票，如果被抽样单位不能现场提供正式发票，则在样品被抽检后<span
										lang=EN-US>1</span>个月内将此告知书和被抽样品购置费（按照食品销售价格核算）的正式发票及所购样品明细邮寄到付款单位，由付款单位支付购样费（样品购置费）。
										<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='margin-left: -45.05pt; mso-para-margin-left: -4.29gd; text-indent: 24.0pt; mso-char-indent-count: 2.0; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>2.</span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>发票抬头填写：<u><span
											lang=EN-US><span style="mso-spacerun: yes">                    
											</span><span style="mso-spacerun: yes">           </span><span
												style="mso-spacerun: yes"> </span><span
												style="mso-spacerun: yes">   </span></span></u><span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>项目填写：<u><span
											lang=EN-US><span style="mso-spacerun: yes">                        
											</span><span style="mso-spacerun: yes">          </span><span
												style="mso-spacerun: yes">   </span></span></u><span lang=EN-US><span
											style="mso-spacerun: yes"> </span> <o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>税务登记号：<u><span
											lang=EN-US><span style="mso-spacerun: yes">                     
											</span><span style="mso-spacerun: yes">          </span><span
												style="mso-spacerun: yes">    </span></span></u><span lang=EN-US><span
											style="mso-spacerun: yes"> </span> <o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>开户行名称：<u><span
											lang=EN-US><span style="mso-spacerun: yes">           
											</span><span style="mso-spacerun: yes">       </span><span
												style="mso-spacerun: yes">     </span></span></u><span lang=EN-US><span
											style="mso-spacerun: yes"> </span><span
											style="mso-spacerun: yes"> </span></span>账号（含税号）：<u><span
											lang=EN-US><span style="mso-spacerun: yes">   
											</span><span style="mso-spacerun: yes">    </span><span
												style="mso-spacerun: yes">  </span><span
												style="mso-spacerun: yes">  </span><span
												style="mso-spacerun: yes">    </span><span
												style="mso-spacerun: yes">     </span> <o:p></o:p></span></u></span>
								</p>

								<p class=MsoNormal
									style='margin-left: -27.0pt; mso-para-margin-left: -2.57gd; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>3.</span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>此次抽样检验的样品购置费用：<u><span
											lang=EN-US><o:p></o:p></span></u></span>
								</p>

								<div align=center>

									<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
										style='margin-left: -39.6pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
										<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
											<td width=149
												style='width: 149.4pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>样品名称<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=95
												style='width: 94.5pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>单价（元）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=113
												style='width: 112.95pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>数量<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=90
												style='width: 89.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>金额（元）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 1'>
											<td width=149 valign=top
												style='width: 149.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=95 valign=top
												style='width: 94.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=113 valign=top
												style='width: 112.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 2'>
											<td width=149 valign=top
												style='width: 149.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=95 valign=top
												style='width: 94.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=113 valign=top
												style='width: 112.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 3'>
											<td width=149 valign=top
												style='width: 149.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=95 valign=top
												style='width: 94.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=113 valign=top
												style='width: 112.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 4'>
											<td width=149 valign=top
												style='width: 149.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=95 valign=top
												style='width: 94.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=113 valign=top
												style='width: 112.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 5'>
											<td width=149 valign=top
												style='width: 149.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=95 valign=top
												style='width: 94.5pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=113 valign=top
												style='width: 112.95pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
											<td width=357 colspan=3 valign=top
												style='width: 356.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>总计：（大写）
														<span style="mso-spacerun: yes"> </span><span lang=EN-US><span
															style="mso-spacerun: yes">  </span></span>万<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>仟<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>佰<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>拾<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>圆<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>角<span lang=EN-US><span
															style="mso-spacerun: yes">    </span></span>分<span lang=EN-US><o:p></o:p></span>
													</span>
												</p>
											</td>
											<td width=90 valign=top
												style='width: 89.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>小写：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
									</table>

								</div>

								<p class=MsoNormal
									style='margin-left: -27.0pt; mso-para-margin-left: -2.57gd; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>4.</span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>付款单位信息<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<div align=center>

									<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
										style='margin-left: -21.6pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
										<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>单位名称<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=356 colspan=3 valign=top
												style='width: 356.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 1'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>地址及邮编<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=356 colspan=3 valign=top
												style='width: 356.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 2; mso-yfti-lastrow: yes'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>联系人<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=119 valign=top
												style='width: 118.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=61 valign=top
												style='width: 61.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>电话<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=176 valign=top
												style='width: 176.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
									</table>

								</div>

								<p class=MsoNormal
									style='margin-left: -27.0pt; mso-para-margin-left: -2.57gd; line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>5.</span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>企业收款信息（由被抽样单位自行填写完整的正确信息）<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<div>

									<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
										style='margin-left: -21.6pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
										<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>企业全称<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=356 colspan=3 valign=top
												style='width: 356.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 1'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>开户行名称<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=356 colspan=3 valign=top
												style='width: 356.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 2'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>银行账号<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=356 colspan=3 valign=top
												style='width: 356.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 3; mso-yfti-lastrow: yes'>
											<td width=95 valign=top
												style='width: 95.4pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>企业联系人<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=119 valign=top
												style='width: 118.8pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
											<td width=61 valign=top
												style='width: 61.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span style='font-size: 12.0pt; font-family: 仿宋_GB2312'>电<span
														lang=EN-US><span style="mso-spacerun: yes"> 
														</span></span>话<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=176 valign=top
												style='width: 176.4pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='line-height: 19.0pt; mso-line-height-rule: exactly'>
													<span lang=EN-US
														style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
												</p>
											</td>
										</tr>
									</table>

								</div>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">    </span></span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>被抽样单位签字（盖章）<span
										lang=EN-US><span style="mso-spacerun: yes">   </span><span
											style="mso-spacerun: yes">         </span><span
											style="mso-spacerun: yes">     </span><span
											style="mso-spacerun: yes"> </span></span>抽样单位（盖章）<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'><span
										style="mso-spacerun: yes">        </span></span><span
										style='font-size: 12.0pt; font-family: 仿宋_GB2312'>年<span
										lang=EN-US><span style="mso-spacerun: yes">   </span></span>月<span
										lang=EN-US><span style="mso-spacerun: yes">   </span></span>日<span
										lang=EN-US><span style="mso-spacerun: yes">            
										</span><span style="mso-spacerun: yes">        </span><span
											style="mso-spacerun: yes">    </span></span>年<span lang=EN-US><span
											style="mso-spacerun: yes">   </span></span>月<span lang=EN-US><span
											style="mso-spacerun: yes">   </span></span>日<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 19.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US
										style='mso-bidi-font-size: 10.5pt; font-family: 仿宋_GB2312'><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							<div id="div5" style="display: none">
								<p class=MsoNormal>
									<b style='mso-bidi-font-weight: normal'><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span></b>
								</p>

								<p class=MsoNormal>
									<b style='mso-bidi-font-weight: normal'><span
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>现场检查笔录</span></b><b
										style='mso-bidi-font-weight: normal'><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span></b>
								</p>




								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>被检查单位</span><span
										lang=EN-US>(</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>人</span><span
										lang=EN-US>)</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                                 
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>陪同人员</span>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                          
										</span></span></u>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查现场：</span>
									<u><span lang=EN-US><span style="mso-spacerun: yes">                                                                  </span>
											<o:p></o:p></span></u>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>法定代表人（负责人）：</span><span
										lang=EN-US>____________________________</span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>联系方式：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">         
										</span><span style="mso-spacerun: yes">   </span><span
											style="mso-spacerun: yes">     </span></span></u><span lang=EN-US><span
										style="mso-spacerun: yes"> </span><u><o:p></o:p></u></span>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查人：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                     
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>记录人：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">          
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>监督检查类别：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">             
										</span> <o:p></o:p></span></u>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检查时间：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">          
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>年</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">       
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>月</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">     
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>日</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">      
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>时</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">     
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>分至</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">      
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>时</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">     
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>分</span><u><span
										lang=EN-US><o:p></o:p></span></u>
								</p>



								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">     
									</span></span>
								</p>

								<p class=MsoNormal style='text-indent: 21.0pt' align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>我们是</span>
									<u><span lang=EN-US><span style="mso-spacerun: yes">                              </span></span></u><span
										lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>的执法人员</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">          
										</span></span></u><span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>、</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">           
										</span></span></u><span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>执法证件名称、编号是：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                                         
										</span></span></u><span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>，请你确认。</span><u><span
										lang=EN-US><o:p></o:p></span></u>
								</p>

								<p class=MsoNormal style='text-indent: 21.0pt' align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>我们依法就</span>
									<u><span lang=EN-US><span style="mso-spacerun: yes">                                                 </span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>有关问题，进行</span>
								</p>

								<p class=MsoNormal align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>现场检查，请予配合。根据《中华人民共和国行政处罚法》第三十七条第三款的规定，如果你认为检查人员与当事人有直接利害关系的，你有申请检查人员回避的权利。</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0'
									align="left">
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>问：你是否申请检查人员回避？</span>
								</p>

								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">   
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>答：</span>
								</p>
								<textarea style="resize: none; width: 600px; height: 100px;"></textarea>
								<p class=MsoNormal align="left">
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal align="left">
									<span lang=EN-US><span style="mso-spacerun: yes">   
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>现场检查记录：</span>
								</p>
								<textarea style="resize: none; width: 600px; height: 200px;">
</textarea>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal style='line-height: 150%' align="left">
									<span
										style='font-size: 10.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：本文书一式二联，第一联存档，第二联交被检查单位。被检查人在检查笔录上逐页签字，在修改处签字或者按指纹，并在笔录终了处注明对笔录真实性的意见；检查人应在笔录终了处签字。</span><span
										style='font-size: 10.0pt; mso-bidi-font-size: 11.0pt; line-height: 150%'>
										<span lang=EN-US><o:p></o:p></span>
									</span>
								</p>

							</div>
							<div id="div6" style="display: none">
								<p class=MsoNormal align=center style='text-align: center'>
									<span style='font-size: 22.0pt; font-family: 方正小标宋_GBK'>食品安全抽样检验样品信息登记表<span
										lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<span
										style='mso-bidi-font-size: 10.5pt; font-family: 仿宋_GB2312'>采样单位：（公章）<u><span
											lang=EN-US><span style="mso-spacerun: yes">                          
											</span><span style="mso-spacerun: yes">   </span></span></u><span lang=EN-US><span
											style="mso-spacerun: yes">    </span><span
											style="mso-spacerun: yes"> </span></span>采样人：<u><span lang=EN-US><span
												style="mso-spacerun: yes">            </span><span
												style="mso-spacerun: yes">                  </span></span></u><span
										lang=EN-US><span style="mso-spacerun: yes">    </span><span
											style="mso-spacerun: yes">      </span></span>采样时间：<u> <span
											style="mso-spacerun: yes"> </span><span lang=EN-US><span
												style="mso-spacerun: yes">   </span></span></u>年<u><span lang=EN-US><span
												style="mso-spacerun: yes">  </span><span
												style="mso-spacerun: yes">  </span><span
												style="mso-spacerun: yes"> </span></span></u>月<u> <span lang=EN-US><span
												style="mso-spacerun: yes">   </span><span
												style="mso-spacerun: yes"> </span></span></u>日<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
									style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
									<tr
										style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 39.35pt; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>序号<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>样品编号<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>样品名称<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>定量包装<span lang=EN-US>/</span>散装<span
													lang=EN-US>/</span>现场制作<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>生产日期<span lang=EN-US>/</span>制作日期<span
													lang=EN-US>/</span>编号<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>规格<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>被采样单位业态类型<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>生产单位<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>被采样单位名称<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 39.35pt; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span style='font-family: 黑体'>被采样单位地址<span lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 1; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 2; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 3; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 4; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 5; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 6; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 7; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 8; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 9; mso-yfti-lastrow: yes; height: 1.0cm; mso-height-rule: exactly'>
										<td width=71
											style='width: 70.85pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.85pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=71
											style='width: 70.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 1.0cm; mso-height-rule: exactly'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
								</table>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							<div id="div7" style="display: none">
								<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
									style='border-collapse: collapse; mso-table-layout-alt: fixed; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 5.4pt 0cm 0cm; margin-left: 50pt'>
									<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
										<td width=426 colspan=4 valign=top
											style='width: 426.1pt; border: none; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-size: 16.0pt; font-family: 方正小标宋_GBK; mso-bidi-font-weight: bold'>食品安全抽样检验样品移交确认单<span
													lang=EN-US><o:p></o:p></span></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 1; height: 29.5pt'>
										<td width=306 colspan=3 valign=bottom
											style='width: 305.7pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 29.5pt'>
											<p class=MsoNormal style='line-height: 150%'>
												<span lang=EN-US></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"; margin-left: -130pt'><input
													class="inputStyle">：</span><u><span lang=EN-US><o:p></o:p></span></u>
											</p>
										</td>
										<td width=120 valign=bottom
											style='width: 120.4pt; border: none; border-bottom: solid windowtext 1.0pt; mso-border-bottom-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 29.5pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 2; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>收样时间</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<input type="text" id="d7sytime" readonly />
										</td>
									</tr>
									<tr style='mso-yfti-irow: 3; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品件数（含备用样品）</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 4; height: 34.0pt'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品抽样单编号</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 5; height: 34.0pt'>
										<td width=130 rowspan=4
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品检查记录</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>封</span><span
													lang=EN-US><span style="mso-spacerun: yes">   
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>条：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>完好</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>有破损</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 6; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品包装：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>完好</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>有破损</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 7; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品数量：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>满足要求</span><span
													lang=EN-US><span style="mso-spacerun: yes">        
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>不满足</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 8; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品状态：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>正常</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>异常</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 9; height: 34.0pt'>
										<td width=130 rowspan=2
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书检查记录</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书数量：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>齐全</span><span
													lang=EN-US><span style="mso-spacerun: yes">            
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>不齐全</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 10; height: 34.0pt'>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 34.0pt'>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>文书信息：□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>与样品相符</span><span
													lang=EN-US><span style="mso-spacerun: yes">      
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>与样品不符</span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 11'>
										<td width=130
											style='width: 130.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal align=center style='text-align: center'>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品移交确认结果</span>
											</p>
										</td>
										<td width=296 colspan=3
											style='width: 295.9pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>接受</span><span
													lang=EN-US><span style="mso-spacerun: yes">     
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>□</span>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>拒收</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> 
												</span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>拒收理由：</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 12; height: 168.8pt'>
										<td width=182 colspan=2 valign=top
											style='width: 181.95pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 168.8pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>抽样单位：</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>样品移交人签字：</span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width=244 colspan=2 valign=top
											style='width: 244.15pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 168.8pt'>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><o:p>&nbsp;</o:p></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span>
											</p>
											<p class=MsoNormal>
												<span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>承检机构样品确认人签字（盖章）：</span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 13; mso-yfti-lastrow: yes; height: 23.1pt'>
										<td width=426 colspan=4
											style='width: 426.1pt; border: none; mso-border-top-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 0cm; height: 23.1pt'>
											<p class=MsoNormal>
												<span
													style='font-family: 宋体; mso-ascii-font-family: "Times New Roman"; mso-hansi-font-family: "Times New Roman"'>注：本单据一式两联，由承检机构、抽样单位分别保留。</span>
											</p>
										</td>
									</tr>
									<![if !supportMisalignedColumns]>
									<tr height=0>
										<td width=130 style='border: none'></td>
										<td width=52 style='border: none'></td>
										<td width=124 style='border: none'></td>
										<td width=120 style='border: none'></td>
									</tr>
									<![endif]>
								</table>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							<div id="div8" style="display: none">
								<div align=center>

									<table class=MsoTableGrid border=1 cellspacing=0 cellpadding=0
										style='margin-left: -10.6pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-yfti-tbllook: 480; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt'>
										<tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
											<td width=417 valign=top
												style='width: 417.2pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">  </span></span>抽样人签字：<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes">  </span><span
															style="mso-spacerun: yes">        </span></span>年<span
														lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>月<span lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>日（抽样单位盖章）<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=417 valign=top
												style='width: 417.2pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal style='line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">   </span></span>抽样人签字：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal style='line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">          </span><span
															style="mso-spacerun: yes"> </span><span
															style="mso-spacerun: yes">  </span></span>年<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>日（抽样单位盖章）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 1'>
											<td width=417 valign=top
												style='width: 417.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">  </span></span>抽样人签字：<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">            </span></span>年<span
														lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>月<span lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>日（抽样单位盖章）<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=417 valign=top
												style='width: 417.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal style='line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">   </span></span>抽样人签字：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal style='line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">           </span><span
															style="mso-spacerun: yes">  </span></span>年<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>日（抽样单位盖章）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 2'>
											<td width=417 valign=top
												style='width: 417.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">  </span></span>抽样人签字：<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">            </span></span>年<span
														lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>月<span lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>日（抽样单位盖章）<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=417 valign=top
												style='width: 417.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal style='line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">   </span></span>抽样人签字：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal style='line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes"> </span><span
															style="mso-spacerun: yes">          </span><span
															style="mso-spacerun: yes">  </span></span>年<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>日（抽样单位盖章）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
										<tr style='mso-yfti-irow: 3; mso-yfti-lastrow: yes'>
											<td width=417 valign=top
												style='width: 417.2pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">  </span></span>抽样人签字：<span lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal
													style='text-indent: 12.0pt; mso-char-indent-count: 1.0; line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">            </span></span>年<span
														lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>月<span lang=EN-US><span style="mso-spacerun: yes">  
														</span></span>日（抽样单位盖章）<span lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
											<td width=417 valign=top
												style='width: 417.2pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt'>
												<p class=MsoNormal style='line-height: 250%'>
													<span style='font-size: 12.0pt; line-height: 250%'>抽样单编号：<span
														lang=EN-US><span style="mso-spacerun: yes">           
														</span><span style="mso-spacerun: yes">      </span><span
															style="mso-spacerun: yes">   </span></span>抽样人签字：<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal align=center
													style='text-align: center; line-height: 200%'>
													<span
														style='font-size: 26.0pt; line-height: 200%; font-family: 方正小标宋简体'>食品安全抽样检验封条<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
												<p class=MsoNormal style='line-height: 200%'>
													<span style='font-size: 12.0pt; line-height: 200%'>被抽样单位签字</span><span
														style='font-size: 12.0pt; line-height: 200%; font-family: 宋体; mso-bidi-font-family: 宋体'>∕</span><span
														style='font-size: 12.0pt; line-height: 200%'>盖章：<span
														lang=EN-US><span style="mso-spacerun: yes">   
														</span><span style="mso-spacerun: yes">           </span><span
															style="mso-spacerun: yes">  </span></span>年<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>月<span lang=EN-US><span
															style="mso-spacerun: yes">   </span></span>日（抽样单位盖章）<span
														lang=EN-US><o:p></o:p></span></span>
												</p>
											</td>
										</tr>
									</table>

								</div>

								<p class=MsoNormal
									style='line-height: 1.0pt; mso-line-height-rule: exactly'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							<div id="div9" style="display: none">
								<p class=MsoNormal align=center style='text-align: center'>
									<b><span lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p>&nbsp;</o:p></span></b>
								</p>

								<p class=MsoNormal align=center style='text-align: center'>
									<b><span
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt; font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>检验结果告知书</span></b><b><span
										lang=EN-US
										style='font-size: 18.0pt; mso-bidi-font-size: 11.0pt'><o:p></o:p></span></b>
								</p>

								<p class=MsoNormal align=right
									style='margin-top: 7.8pt; margin-right: 0cm; margin-bottom: 7.8pt; margin-left: 0cm; mso-para-margin-top: .5gd; mso-para-margin-right: 0cm; mso-para-margin-bottom: .5gd; mso-para-margin-left: 0cm; text-align: right; word-break: break-all'>
									<b><span lang=EN-US><span style="mso-spacerun: yes">                         
										</span></span></b><span style='font-family: 宋体'>（<span lang=EN-US><span
											style="mso-spacerun: yes">    </span></span>）<span lang=EN-US><span
											style="mso-spacerun: yes">     </span></span>检结告〔<span lang=EN-US><span
											style="mso-spacerun: yes">     </span></span>〕<span lang=EN-US><span
											style="mso-spacerun: yes">    </span></span>号<span lang=EN-US><o:p></o:p></span></span>
								</p>

								<p class=MsoNormal>
									<!--[if gte vml 1]><v:line id="Line_x0020_11" o:spid="_x0000_s1026"
 style='position:absolute;left:0;text-align:left;z-index:251656192;
 mso-position-horizontal:center' from="0,3.05pt" to="447.85pt,3.05pt"
 strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251656192'><span
										style='left: 0px; position: absolute; left: 0px; top: -35px; width: 455px; height: 7px'><img
											width=455 height=7
											src="9%E6%A3%80%E9%AA%8C%E7%BB%93%E6%9E%9C%E5%91%8A%E7%9F%A5%E4%B9%A6.files/image001.gif"
											v:shapes="Line_x0020_11"></span></span>
									<![endif]>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal style='line-height: 150%'>
									<u><span lang=EN-US><span style="mso-spacerun: yes">                                         
										</span></span></u><span lang=EN-US><span style="mso-spacerun: yes"> </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>：</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>本机关依法对你单位</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                                        
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>进行抽样并委托有关单位进行了检验，检验报告书见附件。</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>依据</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                                     
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>的规定，如对本检验结果有异议，可在收到检验报告书之日起</span>
									<u><span style="mso-spacerun: yes"> </span><span lang=EN-US><span
											style="mso-spacerun: yes">       </span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>内向</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">                                    
										</span></span></u><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>提出书面复检申请并申明理由。逾期视为放弃该项权利。</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='text-indent: 21.0pt; mso-char-indent-count: 2.0; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>特此告知。</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 28.5pt; line-height: 150%'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><span style="mso-spacerun: yes">                                                 
									</span></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><span style="mso-spacerun: yes">                                                 
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>（公</span>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>章）</span>
								</p>

								<p class=MsoNormal
									style='line-height: 150%; mso-outline-level: 1'>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<span lang=EN-US><span style="mso-spacerun: yes">                                               
									</span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>年</span><span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>月</span><span
										lang=EN-US><span style="mso-spacerun: yes">    </span></span><span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>日</span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<span lang=EN-US style='font-family: 宋体'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<!--[if gte vml 1]><v:line id="Line_x0020_12"
 o:spid="_x0000_s1027" style='position:absolute;left:0;text-align:left;
 z-index:251657216' from="-2.8pt,.75pt" to="445.05pt,.75pt" strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251657216'><span
										style='left: 0px; position: absolute; left: -8px; top: -159px; width: 455px; height: 7px'><img
											width=455 height=7
											src="9%E6%A3%80%E9%AA%8C%E7%BB%93%E6%9E%9C%E5%91%8A%E7%9F%A5%E4%B9%A6.files/image002.gif"
											v:shapes="Line_x0020_12"></span></span>
									<![endif]>
									<span lang=EN-US style='font-family: 宋体'><o:p>&nbsp;</o:p></span>
								</p>

								<br style='mso-ignore: vglayout' clear=ALL>

								<p class=MsoNormal style='line-height: 150%'>
									<span style='font-family: 宋体'>本告知书已于<u><span
											lang=EN-US><span style="mso-spacerun: yes">     
											</span></span></u>年<u><span lang=EN-US><span
												style="mso-spacerun: yes">   </span></span></u>月<u><span lang=EN-US><span
												style="mso-spacerun: yes">   </span></span></u>日<u><span lang=EN-US><span
												style="mso-spacerun: yes">      </span></span></u>时<u><span
											lang=EN-US><span style="mso-spacerun: yes">     
											</span></span></u>分收到。
									</span>
								</p>

								<p class=MsoNormal
									style='text-indent: 278.25pt; mso-char-indent-count: 26.5; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>接收人签字：</span><u><span
										lang=EN-US><span style="mso-spacerun: yes">             
										</span> <o:p></o:p></span></u>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<!--[if gte vml 1]><v:line id="Line_x0020_13"
 o:spid="_x0000_s1028" style='position:absolute;left:0;text-align:left;
 z-index:251658240' from="-2.8pt,22.4pt" to="445.05pt,22.4pt" strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251658240'><span
										style='left: 0px; position: absolute; left: -8px; top: -160px; width: 455px; height: 7px'><img
											width=455 height=7
											src="9%E6%A3%80%E9%AA%8C%E7%BB%93%E6%9E%9C%E5%91%8A%E7%9F%A5%E4%B9%A6.files/image003.gif"
											v:shapes="Line_x0020_13"></span></span>
									<![endif]>
									<span lang=EN-US><span style="mso-spacerun: yes">                                
									</span></span>
								</p>

								<p class=MsoNormal
									style='margin-top: 3.1pt; mso-para-margin-top: .2gd; line-height: 150%'>
									<span
										style='font-family: 宋体; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri'>注：本文书一式二联，第一联存档，第二联交被抽样单位。</span>
								</p>

								<p class=MsoNormal style='line-height: 150%'>
									<!--[if gte vml 1]><v:line id="Line_x0020_14"
 o:spid="_x0000_s1029" style='position:absolute;left:0;text-align:left;
 z-index:251659264' from="-2.8pt,6.55pt" to="445.05pt,6.55pt" strokeweight="1.5pt"/><![endif]-->
									<![if !vml]>
									<span
										style='mso-ignore: vglayout; position: relative; z-index: 251659264'><span
										style='left: 0px; position: absolute; left: -8px; top: -190px; width: 455px; height: 7px'><img
											width=455 height=7
											src="9%E6%A3%80%E9%AA%8C%E7%BB%93%E6%9E%9C%E5%91%8A%E7%9F%A5%E4%B9%A6.files/image004.gif"
											v:shapes="Line_x0020_14"></span></span>
									<![endif]>
									<span lang=EN-US
										style='mso-bidi-font-size: 9.0pt; line-height: 150%'><span
										style="mso-spacerun: yes"> </span> <o:p></o:p></span>
								</p>

								<p class=MsoNormal>
									<span lang=EN-US><o:p>&nbsp;</o:p></span>
								</p>
							</div>
							<div id="div10" style="display: none">
								<p class=MsoNormal align=center
									style='text-align: center; mso-line-height-alt: 13.5pt'>
									<span
										style='font-size: 20.0pt; mso-bidi-font-size: 16.0pt; font-family: 方正小标宋_GBK; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>食品安全快速检测登记表</span><span
										lang=EN-US
										style='font-size: 9.0pt; font-family: 方正小标宋_GBK; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'><o:p></o:p></span>
								</p>

								<p class=MsoNormal style='line-height: 13.5pt'>
									<span lang=EN-US
										style='font-size: 1.0pt; mso-bidi-font-size: 14.0pt; font-family: 黑体; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
								</p>

								<p class=MsoNormal style='mso-line-height-alt: 13.5pt'>
									<span
										style='font-size: 14.0pt; font-family: 黑体; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>抽检单位：<u><span
											lang=EN-US><span style="mso-spacerun: yes">              
											</span></span></u></span><u><span lang=EN-US
										style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 黑体; color: #404040'><span
											style="mso-spacerun: yes">                              </span></span></u><u><span
										lang=EN-US
										style='font-size: 6.0pt; font-family: Tahoma; mso-fareast-font-family: 黑体; color: #404040'><o:p></o:p></span></u>
								</p>

								<table class=MsoNormalTable border=1 cellspacing=0 cellpadding=0
									width="100%"
									style='width: 100.0%; margin-left: -.4pt; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0cm 5.4pt 0cm 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
									<tr
										style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; height: 38.15pt'>
										<td width="2%"
											style='width: 2.98%; border-top: double 1.5pt; border-left: double 1.5pt; border-bottom: solid 1.5pt; border-right: solid 1.0pt; border-color: windowtext; mso-border-top-alt: double 1.5pt; mso-border-left-alt: double 1.5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>序号</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>抽检食品名称</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>规格</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><br>
												</span></b><b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>型号</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>抽检人</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>被抽检人</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>抽检</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 6.0pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><br>
												</span></b><b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>地点</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>抽检日</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><br>
												</span></b><b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-ascii-font-family: Tahoma; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>期时间</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.3%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>被抽检</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 仿宋_GB2312; color: #404040'><o:p></o:p></span></b>
											</p>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>人签字</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>检测项目</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>标准值</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>检测值</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>检测</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 6.0pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'><br>
												</span></b><b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>结果</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="7%"
											style='width: 7.8%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>检测人</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>签
														字</span></b><b style='mso-bidi-font-weight: normal'><span
													lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: solid windowtext 1.0pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: double 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid 1.5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>送检</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><br>
												</span></b><b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>情况</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: double windowtext 1.5pt; border-left: none; border-bottom: solid windowtext 1.5pt; border-right: double windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span
													style='font-size: 10.5pt; font-family: 隶书; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>备注</span></b><b
													style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 9.0pt; font-family: Tahoma; mso-fareast-font-family: 隶书; color: #404040'><o:p></o:p></span></b>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 1; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-top-alt: solid 1.5pt; mso-border-left-alt: double 1.5pt; mso-border-bottom-alt: solid .5pt; mso-border-right-alt: solid .5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>1<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: 1.5pt; mso-border-left-alt: .5pt; mso-border-bottom-alt: .5pt; mso-border-right-alt: 1.5pt; mso-border-color-alt: windowtext; mso-border-style-alt: solid; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-top-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext 1.5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-top-alt: solid 1.5pt; mso-border-left-alt: solid .5pt; mso-border-bottom-alt: solid .5pt; mso-border-right-alt: double 1.5pt; mso-border-color-alt: windowtext; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 2; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>2<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='margin-right: -5.4pt; mso-para-margin-right: -.45gd; text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 3; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>3<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 4; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>4<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 5; height: 38.15pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>5<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.15pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 6; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>6<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 7; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>7<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr style='mso-yfti-irow: 8; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>8<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
									<tr
										style='mso-yfti-irow: 9; mso-yfti-lastrow: yes; height: 38.2pt'>
										<td width="2%"
											style='width: 2.98%; border-top: none; border-left: double windowtext 1.5pt; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-left-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; line-height: 13.5pt'>
												<b style='mso-bidi-font-weight: normal'><span lang=EN-US
													style='font-size: 10.5pt; font-family: 仿宋_GB2312; mso-hansi-font-family: Tahoma; mso-bidi-font-family: Tahoma; color: #404040'>9<o:p></o:p></span></b>
											</p>
										</td>
										<td width="6%"
											style='width: 6.52%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.94%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%"
											style='width: 6.2%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="6%" valign=top
											style='width: 6.3%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="8%"
											style='width: 8.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="11%"
											style='width: 11.78%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="10%"
											style='width: 10.54%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.7%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="7%" valign=top
											style='width: 7.8%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.96%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
										<td width="4%"
											style='width: 4.88%; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: double windowtext 1.5pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; mso-border-right-alt: double windowtext 1.5pt; padding: 0cm 5.4pt 0cm 5.4pt; height: 38.2pt'>
											<p class=MsoNormal align=center
												style='text-align: center; mso-line-height-alt: 13.5pt'>
												<span lang=EN-US
													style='font-size: 16.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
											</p>
										</td>
									</tr>
								</table>

								<p class=MsoNormal style='line-height: 13.5pt'>
									<span lang=EN-US
										style='font-size: 9.0pt; font-family: Tahoma; color: #404040'><o:p>&nbsp;</o:p></span>
								</p>
							</div>

						</div>
					</div>
				</div>
			</div>


			</section>
			<!-- /.content -->
		</div>
		<!-- /.content-wrapper -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<!--  <b>唐山蓝普</b>-->
		</div>
		<strong></strong> </footer>
		<!-- Add the sidebar's background. This div must be placed
           immediately after the control sidebar -->
		<div class="control-sidebar-bg"></div>
	</div>
	<!-- ./wrapper -->
	<!-- jQuery 2.1.4 -->
	<!--<script src="../../plugins/jQuery/jQuery-2.1.4.min.js"></script>
    -->
	<!-- Bootstrap 3.3.5 -->
	<script
		src="${pageContext.request.contextPath }/bootstrap/js/bootstrap.min.js"></script>
	<!-- DataTables -->
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath }/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<!-- SlimScroll -->
	<script
		src="${pageContext.request.contextPath }/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<!-- FastClick -->
	<script
		src="${pageContext.request.contextPath }/plugins/fastclick/fastclick.min.js"></script>
	<!-- AdminLTE App -->
	<script src="${pageContext.request.contextPath }/dist/js/app.min.js"></script>
	<!-- AdminLTE for demo purposes -->
	<script src="${pageContext.request.contextPath }/dist/js/demo.js"></script>
	<!-- page script -->
	<script>
      $(function () {
        $("#example1").DataTable();
        $('#example2').DataTable({
          "paging": true,
          "lengthChange": false,
          "searching": false,
          "ordering": true,
          "info": true,
          "autoWidth": false
        });
      });
    </script>

</body>
</html>
