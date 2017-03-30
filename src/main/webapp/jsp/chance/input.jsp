<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/commons/common.jsp"%>
<%@include file="/commons/easyui.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <title>新建销售机会</title>
  <script type="text/javascript" src="${ctx}/commons/common.js"></script>
  <script type="text/javascript">
    $(function(){
      var val = $("#createDate").val();

      if(val == null || val == ""){
        $("#createDate").val(new Date().format("yyyy-MM-dd"));
      }
      $("#save").click(function(){
        debugger;
        var cusName = $("#custName").val();

        if(cusName == "" || cusName == null){
          $.messager.alert('提示消息','保存失败，请填写完整信息','info');
          return;
        }else{
          $("#chanceForm").submit();
          $.messager.alert('提示消息','保存成功','info');
        }
      });
       /** var params = $("#chance").serialize();
        params = decodeURIComponent(params,true);
        $.ajax({
          type: "POST",
          url: "${ctx}/chance/save",
          data: params = decodeURIComponent($("#chance").serialize()),
          contentType : "text/html",
          error:function(data){
            $.messager.alert('提示消息','请求失败','info');
            alert(data);
          },
          success: function(data){
            $.messager.alert('提示消息','保存成功','info');
          }
        });
        */

    });

  </script>

</head>
<body class="main">
<span class="page_title">新建/修改销售机会</span>
<div class="button_bar">
  <button class="common_button" onclick="javascript:history.go(-1);">返回</button>
  <button class="common_button" id="save">保存</button>
</div>
${salesChance.custName}
<%--<form id="chance" method="POST">--%>
<form id="chanceForm" action="${ctx}/chance/save" method="POST">
  <table class="query_form_table" border="0" cellPadding="3" cellSpacing="0">
    <tr>
      <th>编号</th>
      <td>
        <input id="id" name="id" readonly="readonly" type="text" value="${salesChance.id}"/>
        &nbsp;
      </td>
      <th>机会来源</th>
      <td><input id="source" name="source" type="text" value="${salesChance.source}"/></td>
    </tr>
    <tr>
      <th>客户名称</th>
      <td><input id="custName" name="custName" type="text" value="${salesChance.custName}"/><span class="red_star">*</span></td>
      <th>成功机率（%）<br />填入数字，0~100</th>
      <td><input id="rate" name="rate" type="text" value="${salesChance.rate}"/><span class="red_star">*</span></td>
    </tr>
    <tr>
      <th>概要</th>
      <td colspan="2"><input id="title" name="title" type="text" value="${salesChance.title}"/><span class="red_star">*</span></td>
    </tr>
    <tr>
      <th>联系人</th>
      <td><input id="contact" name="contact" type="text" value="${salesChance.contact}"/></td>
      <th>联系人电话</th>
      <td><input id="contactTel" name="contactTel" type="text" value="${salesChance.contactTel}"/></td>
    </tr>
    <tr>
      <th>机会描述</th>
      <td colspan="3">
        <textarea id="description" name="description" rows="6" cols="50" >${salesChance.description}</textarea>
        <span class="red_star">*</span>
      </td>
    </tr>
    <tr>
      <th>创建人</th>
      <td>
        <input name="createById" type="hidden" value="${user.id}">
        <input id="createBy" name="createBy" type="text" value="${user.name}(${user.role.name})">
      </td>
      <th>创建时间</th>
      <td><input id="createDate" name="createDate" readonly="readonly" type="text" value=""/><span class="red_star">*</span></td>
    </tr>
  </table>
  <br /><br>
</form>
</body>
</html>