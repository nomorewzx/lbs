<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<body>
	<form id="form1" name="form1" method="post"
		action="servlet/LoginServlet">
		<table width="260" border="1" align="center">
			<tr>
				<td width="64">�û���</td>
				<td width="180"><input type="text" name="username" /></td>
			</tr>
			<tr>
				<td>���룺</td>
				<td><input type="password" name="userpass" /></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" name="Submit2" value="��¼" /> <input
					type="reset" name="Submit" value="����" /></td>
			</tr>
		</table>
	</form>
</body>