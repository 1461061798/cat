<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="a" uri="/WEB-INF/app.tld"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="res" uri="http://www.unidal.org/webres"%>
<%@ taglib prefix="w" uri="http://www.unidal.org/web/core"%>
<jsp:useBean id="ctx" type="com.dianping.cat.report.page.server.Context" scope="request"/>
<jsp:useBean id="payload" type="com.dianping.cat.report.page.server.Payload" scope="request"/>
<jsp:useBean id="model" type="com.dianping.cat.report.page.server.Model" scope="request"/>

<a:serverBody>
	<res:useJs value="${res.js.local['jquery.validate.min.js']}" target="head-js" />
	<res:useJs value="${res.js.local['editor.js']}" target="head-js" />
	<script src='${model.webapp}/assets/js/editor/ace.js'></script>

	<form name="configUpdate" id="form" method="post" action="${model.pageUri}?op=serverMetricConfigUpdate">
		<table class="table table-striped table-condensed table-hover">
			<tr>
				<td>
					<input id="content" name="content" value="" type="hidden"/>
					<div id="editor" class="editor">${model.config}</div>
				</td>
			</tr>
			<tr>
				<td  style="text-align:center"><input class='btn btn-primary' id="addOrUpdateEdgeSubmit"
					type="submit" name="submit" value="提交" />
				</td>
			</tr>
		</table>
	</form>
	<h4 class="text-center text-danger" id="state">&nbsp;</h4>
	<script type="text/javascript">
		$(document).ready(function() {
			$('#serverConfig').addClass('active open');
			$('#serverMetric').addClass('active');
			var state = '${model.opState}';
			if(state=='Success'){
				$('#state').html('操作成功');
			}else{
				$('#state').html('操作失败');
			}
			setInterval(function(){
				$('#state').html('&nbsp;');
			},3000);
		});
	</script>
</a:serverBody>