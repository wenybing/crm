<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/commons/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>欢迎使用！</title>
  <link rel="stylesheet" type="text/css" href="${ctx}/static/css/menu.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/static/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/static/themes/icon.css">
  <link rel="stylesheet" type="text/css" href="${ctx}/static/css/demo.css">
  <script type="text/javascript" src="${ctx}/static/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="${ctx}/static/jquery/jquery.easyui.min.js"></script>
  <script type="text/javascript">
    $(function(){
      $('#tt').tree({
        onClick: function(node){
          //alert(node.text);  // 在用户点击的时候提示
          if(node.attributes.url){
            //alert(node.attributes.url);
            window.parent.document.getElementById("content").src=node.attributes.url;
          }
        }
      });

//        $("#tt").click(function(){
//          alert("HH");
//        })
    });
  </script>
</head>
<body>
  <ul id="tt" class="easyui-tree" data-options="url:'${ctx}/commons/tree_data1.json',method:'get',animate:true"></ul>
</body>
</html>