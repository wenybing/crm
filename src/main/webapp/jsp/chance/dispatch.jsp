<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/common.jsp"%>
<%@include file="/commons/easyui.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>指派销售机会</title>
  <script type="text/javascript">
     $(function(){
       var designeeDate = $("#designeeDate").val();
       if(designeeDate == null || designeeDate == "" ){
         $("#designeeDate").val(new Date().format("yyyy-MM-dd"));
       }
       $("#save").click(function(){
         var designeeId = $("#designeeId").val();
          if(designeeId == null ||designeeId == ""){
            $.messager.alert("提示","请选择指派人！","info");
            return;
          }
         document.forms[0].submit();
       });

     });
  </script>
</head>

<body class="main">
<span class="page_title">指派销售机会</span>

<div class="button_bar">
  <button class="common_button" onclick="javascript:history.go(-1);">返回</button>
  <button id="save" class="common_button">保存</button>
</div>
<form id="chance" action="${ctx}/chance/disignee?id=${salesChance.id}" method="post">
  <%--<input id="id" name="id" type="hidden" value="2085"/>--%>
  <input type="hidden" name="_method" value="PUT">
  <table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
    <tr>
      <th>编号</th>
      <td>${salesChance.id}</td>
      <th>机会来源</th>
      <td>${salesChance.source}</td>
    </tr>
    <tr>
      <th>客户名称</th>
      <td>${salesChance.custName}</td>
      <th>成功机率%</th>
      <td>${salesChance.rate}</td>
    </tr>
    <tr>
      <th>概要</th>
      <td colspan="2">${salesChance.title}</td>
    </tr>
    <tr>
      <th>联系人</th>
      <td>${salesChance.contact}</td>
      <th>联系人电话</th>
      <td>${salesChance.contactTel}</td>
    </tr>
    <tr>
      <th>机会描述</th>
      <td colspan="3">${salesChance.description}</td>
    </tr>
    <tr>
      <th>创建人</th>
      <td>${salesChance.createBy.name}</td>
      <th>创建时间</th>
      <td><fmt:formatDate value="${salesChance.createDate}" pattern="yyyy-MM-dd"/></td>
    </tr>
  </table>
  <br />

  <table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
    <tr>
      <th>指派给</th>
      <td>
        <select id="designeeId" name="designeeId">
          <option value="">请选择</option>
          <c:forEach items="${users}" var="user">
            <option value="${user.id}">${user.name}</option>
            <%--<form:options items="${users}" itemLabel="name" itemValue="id"></form:options>--%>
          </c:forEach>
        </select>
        <span class="red_star">*</span>
      </td>
      <th>指派时间</th>
      <td>
        <input id="designeeDate" name="designeeDate" readonly="readonly" type="text" value=""/><span class="red_star">*</span>
      </td>
    </tr>
  </table>
</form>
</body>
</html>