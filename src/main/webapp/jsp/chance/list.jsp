<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@include file="/commons/common.jsp"%>
<%@include file="/commons/easyui.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>销售机会管理</title>
  <%--<link rel="stylesheet" type="text/css" href="${ctx}/jquery-easyui-1.5/themes/default/easyui.css">--%>
  <%--<link rel="stylesheet" type="text/css" href="${ctx}/jquery-easyui-1.5/themes/icon.css">--%>
  <%--<link rel="stylesheet" type="text/css" href="${ctx}/jquery-easyui-1.5/demo/demo.css">--%>
  <%--<script type="text/javascript" src="${ctx}/jquery-easyui-1.5/jquery.min.js"></script>--%>
  <%--<script type="text/javascript" src="${ctx}/jquery-easyui-1.5/jquery.easyui.min.js"></script>--%>
  <%--<script type="text/javascript" src="${ctx}/static/js/easyui.js"></script>--%>
  <script type="text/javascript">
    $(function(){
      $("#new").click(function(){
        window.location.href="${ctx}" + "/chance/create";
        return false;
      });
      /**
       * 删除销售机会
       */

      $(".op_button_del").click(function(){
            var $this = $(this);
        /**
        *客户名称
         */
        var custName = $this.parents("tr").find("td:eq(1)").html();
            $.messager.confirm('确认','您确认想要删除客户<span style="color: red">'+custName+'</span>的记录吗?',function(r){
            if (r){
              //获取链接地址
              var href =$this.attr("href");
              //提交表单
              $("#delForm").attr("action",href).submit();
            }
          });
      });


    });


  </script>
</head>

<body class="main">
<form id="delForm" action="" method="post">
  <input type="hidden" name="_method" value="DELETE">
</form>

<form id="command" action="${ctx}/chance/list" method="post">
  <div class="page_title">
    销售机会管理
  </div>
  <div class="button_bar">
    <button class="common_button" id="new">
      新建
    </button>
    <button class="common_button" onclick="document.forms[0].submit();">
      查询
    </button>
  </div>
  <table class="query_form_table" border="0" cellPadding="3"
         cellSpacing="0">
    <tr>
      <th class="input_title">
        客户名称
      </th>
      <td class="input_content">
        <input type="text" name="search_LIKE_custName" />
      </td>
      <th class="input_title">
        概要
      </th>
      <td class="input_content">
        <input type="text" name="search_LIKE_title" />
      </td>
      <th class="input_title">
        联系人
      </th>
      <td class="input_content">
        <input type="text" name="search_LIKE_contact" />
      </td>
    </tr>
  </table>
  <!-- 列表数据 -->
  <br />


  <table class="data_list_table" border="0" cellPadding="3"
         cellSpacing="0">
    <tr>
      <th>
        编号
      </th>
      <th>
        客户名称
      </th>
      <th>
        概要
      </th>
      <th>
        联系人
      </th>
      <th>
        联系人电话
      </th>
      <th>
        创建时间
      </th>
      <th>
        操作
      </th>
    </tr>
    <c:forEach items="${list}" var="salesChance">
    <tr>
      <td class="list_data_number">${salesChance.id}</td>
      <td class="list_data_text">${salesChance.custName}</td>
      <td class="list_data_text">${salesChance.title}</td>
      <td class="list_data_text">${salesChance.contact}</td>
      <td class="list_data_text">${salesChance.contactTel}</td>
      <td class="list_data_text">
        <%--格式化日期--%>
        <fmt:formatDate value="${salesChance.createDate}" pattern="yyyy-MM-dd"></fmt:formatDate>
      </td>
      <td class="list_data_op">
        <img onclick="window.location.href='${ctx}/chance/dispatch?id=${salesChance.id}'"
             title="指派" src="${ctx}/static/images/bt_linkman.gif" class="op_button" />
        <img onclick="window.location.href='${ctx}/chance/edit?id=${salesChance.id}'"
             title="编辑" src="${ctx}/static/images/bt_edit.gif"
             class="op_button" />
        <img href="${ctx}/chance/delete?id=${salesChance.id}"
             title="删除" src="${ctx}/static/images/bt_del.gif" class="op_button_del" />
      </td>
    </tr>
    </c:forEach>
  </table>


  <div style="text-align:right; padding:6px 6px 0 0;">



    共 1 条记录
    &nbsp;&nbsp;

    当前第 1 页/共 1 页
    &nbsp;&nbsp;





    转到 <input id="pageNo" size='1'/> 页
    &nbsp;&nbsp;

  </div>


</form>

</body>
</html>