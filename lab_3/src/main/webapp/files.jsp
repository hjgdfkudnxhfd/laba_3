<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.io.File" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<%
    String directory = (String) request.getAttribute("path");
    File file = new File(directory);
    String parentDirectoryPath = "C:\\Users\\val_4\\Desktop\\abs";
    parentDirectoryPath = file.getParent();
%>

<html>
<head>
    <title>File</title>

    <style>
        table {
            width: 70%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid black;
            padding: 5px;
            text-align: left;
        }
    </style>
</head>
<body>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd.MM.yyyy HH:mm:ss");
    Date currentDate = new Date();
%>
<h2><%=dateFormat.format(currentDate)%></h2>

<h1>Файлы в каталоге: <%= request.getAttribute("path") %></h1>

<p><a href=<%="?path="+parentDirectoryPath%>/>Вверх</p></a>


<table>
    <tr>
        <th>Файл</th>
        <th>Размер</th>
        <th>Последнее изменение</th>
    </tr>
    <%
        File[] folders = (File[]) request.getAttribute("folder"); // папки
        for (File item : folders) {
    %>
    <tr>
        <th><a href=<%="?path="+item.getAbsolutePath()%>/><%= item.getName()%></th>
        <th></th>
        <th><%= new Date(item.lastModified())%></th>
            <% } %>
    <tr>

            <%
            File[] files = (File[]) request.getAttribute("files"); // файлы
            for (File item : files) {
        %>
    <tr>
        <th>
            <a href=<%="DownloadServlet?path="+item.getAbsolutePath()%>/><%= item.getName()%>
        </th>
        <th><%= Math.round(item.length()/1024) %> Кб</th>
        <th><%= new Date(item.lastModified())%></th>
    </tr>
    <% } %>
</table>

</body>
</html>