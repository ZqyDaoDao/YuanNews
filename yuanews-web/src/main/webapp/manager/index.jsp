<%@ page import="yuan.ssm.common.constant.ManagerConstant" %>
<%@ page import="yuan.ssm.vo.UserVo" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: yuan
  Date: 16-4-5
  Time: 下午12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% UserVo userVo= (UserVo) session.getAttribute(ManagerConstant.MANAGER_USER_NAME); %>
<%  String projectPath=request.getContextPath(); %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8"/>
  <title>新闻推荐-后台管理系统</title>
  <meta name="author" content="DeathGhost" />
  <link rel="stylesheet" type="text/css" href="css/style.css"/>

  <!--[if lt IE 9]>
  <script src="js/html5.js"></script>
  <![endif]-->
  <script src="js/jquery.js"></script>
  <script src="js/jquery.mCustomScrollbar.concat.min.js"></script>

  <!-- 分页插件－simplePagination -->
  <link  rel="stylesheet" type="text/css" href="css/simplePagination.css" />
  <script src="js/simplePagination.js"></script>

  <script>
    (function($){
      $(window).load(function(){

        $("a[rel='load-content']").click(function(e){
          e.preventDefault();
          var url=$(this).attr("href");
          $.get(url,function(data){
            $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
            //scroll-to appended content
            $(".content").mCustomScrollbar("scrollTo","h2:last");
          });
        });

        $(".content").delegate("a[href='top']","click",function(e){
          e.preventDefault();
          $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
        });

      });
    })(jQuery);


    //网络请求方法提取
    function dataRequest(typeurl,arr,type) {
      console.log(arr);
      $.ajax({
         url:typeurl,
         data:arr,
         type:'post',
         cache:true,
         dataType:'json',
         success:function (data,status) {
            console.log(data);
            if(status=="success"){

            }else {
            }
         }
      });
    }

  </script>
</head>
<body>
<!--header-->
<header>
  <h1><img src="images/admin_logo.png"/></h1>
  <!-- 初始化 ：　管理员信息-->
  <ul class="rt_nav">
    <li><a href="<%=projectPath%>/CustomerIndex.action" target="_blank" class="website_icon">站点首页</a></li>
    <li><a href="#" class="admin_icon"><%=userVo.getNick()%></a></li>
    <li><a href="#" class="set_icon">个人中心</a></li>
    <li><a href="<%=projectPath%>/manager/managerLoginOut.action" class="quit_icon">安全退出</a></li>
  </ul>
</header>

<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
  <h2><a href="<%=projectPath%>/manager/managerIndex.action" class="active">首页</a></h2>
  <ul>
    <li>
      <dl>
        <dt>用户信息</dt>
        <!--当前链接则添加class:active-->
        <dd><a href="<%=projectPath%>/manager/managerUserPage.action?p=1">用户列表</a></dd>
        <dd><a href="<%=projectPath%>/manager/managerTastePage.action?p=1">用户兴趣</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>新闻信息</dt>
        <dd><a href="<%=projectPath%>/manager/managerNewsPage.action?p=1">新闻列表</a></dd>
        <dd><a href="<%=projectPath%>/manager/managerCatePage.action">分类管理</a></dd>
        <dd><a href="<%=projectPath%>/manager/managerSourcePage.action?p=1">来源管理</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>评论信息</dt>
        <dd><a href="<%=projectPath%>/manager/managerCommentPage.action?p=1">评论管理</a></dd>
        <dd><a href="<%=projectPath%>/manager/managerLikedPage.action?p=1">点赞管理</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>Api设计</dt>
        <dd><a href="<%=projectPath%>/manager/managerApi.jsp"　target="_blank">新闻推荐API</a></dd>
      </dl>
    </li>
    <li>
      <dl>
        <dt>关于</dt>
        <dd><a href="<%=projectPath%>/manager/managerPersent.jsp">站点介绍</a></dd>
        <dd><a href="<%=projectPath%>/manager/aboutMe.jsp">关于我</a></dd>
      </dl>
    </li>

    <li>
      <p class="btm_infor">© Yuan 版权所有</p>
    </li>
  </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
  <div class="rt_content" style="margin-top: 10px;">

   <h1> hi,<%=userVo.getNick()%> ！欢迎登陆 新闻推荐后台管理系统　v１.0 !</h1><hr>
   <div style="min-height:200px;">

      <div style="border-right:5px solid #0c9c6e;float: left;width: 20%;height:180px;margin:10px;text-align:center;">
         <img src="<%=userVo.getHead()%>" style="width:120px;vertical-align:middle;border-radius:60px"/>
         <h1 style="color: #818181;">ID: <%=userVo.getUnum()%></h1>
      </div>

      <div style="float: right;width: 75%;height:180px;margin:10px;text-align:left;">
        <p><h1 style="color: purple"><%=userVo.getNick()%> </h1> <h1><%=userVo.getSex()==0?"男":"女"%>　/　<%=userVo.getStatus()==0?"用户":"管理员"%></h1></p>
        <div style="line-height:120px;height:80%;text-align: center;font-style: italic;color: #818181;">积极的人在每一次忧患中都看到一个机会，而消极的人则在每个机会都看 到某种忧患。</div>
      </div>
      <div style="clear: both;"></div>
   </div>

   <div style="border-top:2px solid #0c9c6e;min-height:300px;margin-top: 10px;">
      <div style="text-align: center;float: left;border: 1px solid purple;width:24%;height: 300px;margin-top: 10px;">

        <img src="<%=userVo.getHead()%>" style="width:60px;vertical-align:middle;border-radius:60px"/>
        <h1 style="color: #818181;">新闻总数</h1>

      </div>
      <div style="text-align: center;float: left;border: 1px solid purple;width: 24%;height: 300px;margin-left: 10px;margin-top: 10px;">
　
        <img src="<%=userVo.getHead()%>" style="width:60px;vertical-align:middle;border-radius:60px"/>
        <h1 style="color: #818181;"> 标签总数</h1>　


      </div>

      <div style="text-align: center;float: left;border: 1px solid purple;width: 24%;height: 300px;margin-left: 10px;margin-top: 10px;">

        <img src="<%=userVo.getHead()%>" style="width:60px;vertical-align:middle;border-radius:60px"/>
        <h1 style="color: #818181;"> 评论总数</h1>　
     </div>

     <div style="text-align: center;float: left;border: 1px solid purple;width: 24%;height: 300px;margin-left: 10px;margin-top: 10px;">

       　
       <img src="<%=userVo.getHead()%>" style="width:60px;vertical-align:middle;border-radius:60px"/>
       <h1 style="color: #818181;"> 　用户总数</h1>　

     </div>

   </div>

  </div>
</section>
</body>
</html>
