<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>

<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/styles.css" type="text/css">
    <title>Книжная полка</title>
</head>
<body>
<table border="0" width="80%" style="margin: auto">
    <tr>
        <td>
            <form:form method="POST" action="find" modelAttribute="book">
                <table width="100%" tyle="margin: auto">
                    <tr>
                        <td>Автор:</td>
                        <td><form:input path="author" maxlength="100" size="100"/></td>
                    </tr>
                    <tr>
                        <td>Название:</td>
                        <td><form:input path="title" maxlength="100" size="100"/></td>
                    </tr>
                    <tr>
                        <td>Год издания:</td>
                        <td><form:input path="printYear" maxlength="4" size="20"/></td>
                    </tr>
                    <tr>
                        <td>Новая</td>
                        <td><form:checkbox path="readAlready"/></td>
                    </tr>
                    <tr>
                        <td><form:button name="submit">Искать</form:button></td>
                        <td></td>
                    </tr>
                </table>
            </form:form>
        </td>
    </tr>
    <tr>
        <td>
            <a href="<c:url value="/add"/>">Добавить новую книгу</a>
            <br> <br>
        </td>
    </tr>
    <tr>
        <td>
            <table class="booklist">
                <thead class="booklist">
                <tr>
                    <td class="booklist">ID</td>
                    <td class="booklist">Автор</td>
                    <td class="booklist">Название</td>
                    <td class="booklist">Описание</td>
                    <td class="booklist">Год издания</td>
                    <td class="booklist">Статус</td>
                </tr>
                </thead>
                <c:forEach items="${listBooks}" var="book">
                    <tr class="booklist">
                        <td class="booklist">&nbsp;&nbsp;${book.id}&nbsp;</td>
                        <td class="booklist">
                            <a href="<c:url value="/show/${book.id}"/>">${book.author}</a>
                        </td>
                        <td class="title">${book.title}</td>
                        <td class="description"><c:out value="${book.description}" escapeXml="true"/></td>
                        <td class="booklist">${book.printYear}</td>
                        <td class="booklist">
                                ${!book.readAlready && !book.reading ? "новая" : ""}
                                ${book.reading ? "отсутствует" : ""}
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <br>
        </td>
    </tr>
    <tr>
        <td>
            <div id="pagination" style="text-align: center;">
                <c:url value="books" var="prev">
                    <c:param name="page" value="${page-1}"/>
                </c:url>
                <c:if test="${page > 1}">
                    <a href="<c:out value="${prev}" />" class="prev"><<<</a>&nbsp;
                </c:if>
                <c:forEach begin="1" end="${maxPages}" step="1" varStatus="i">
                    <c:choose>
                        <c:when test="${page == i.index}">
                            <span style="font-weight: bold; font-size: x-large">&nbsp;${i.index}&nbsp;</span>
                        </c:when>

                        <c:otherwise>
                            <c:url value="books" var="url">
                                <c:param name="page" value="${i.index}"/>
                            </c:url>
                            &nbsp;<a href='<c:out value="${url}"/>'>${i.index}</a>&nbsp;
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
                <c:url value="books" var="next">
                    <c:param name="page" value="${page + 1}"/>
                </c:url>
                <c:if test="${page + 1 <= maxPages}">
                    &nbsp;<a href='<c:out value="${next}"/>' class="next">>>></a>
                </c:if>
            </div>
        </td>
    </tr>
</table>
</body>
</html>
