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
                        <td>
                            <button id="cancel" name="cancel" onclick="location.href='books'" type="reset"
                                    value="cancel">
                                Отмена
                            </button>
                        </td>
                    </tr>
                </table>
            </form:form>
        </td>
    </tr>
    <tr>
        <td>
            <b>Результат поиска:</b>
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
                        <td class="booklist">${book.id}</td>
                        <td  class="booklist">
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

        </td>
    </tr>
</table>
</body>
</html>
