<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>JSP QUES1</title>
</head>
<body>

<form action="JSP1i.jsp" method="post">
<h4>Enter Number of Rows:</h4>
<input type=number name=r />
<input type="submit" value="Enter" />
</form>
		<c:forEach var="i" begin="1" end="${param.r}" step="1">
			<c:forEach var="j" begin="1" end="${i}" step="1">
				<c:out value="${j}"/>
			</c:forEach>
			<br/>
		</c:forEach>

</body>
</html>
