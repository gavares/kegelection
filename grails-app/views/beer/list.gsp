
<%@ page import="kegelection.Beer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-beer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-beer" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'beer.name.label', default: 'Name')}" />

						<th><g:message code="beer.style.label" default="Style" /></th>

						<g:sortableColumn property="description" title="${message(code: 'beer.description.label', default: 'Description')}" />

						<g:sortableColumn property="createdBy" title="${message(code: 'beer.createdBy.label', default: 'Created By')}" />
					
						<g:sortableColumn property="createdTimestamp" title="${message(code: 'beer.createdTimestamp.label', default: 'Created Timestamp')}" />
					
						<g:sortableColumn property="updatedBy" title="${message(code: 'beer.updatedBy.label', default: 'Updated By')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${beerInstanceList}" status="i" var="beerInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
					
					
						<td>${fieldValue(bean: beerInstance, field: "name")}</td>

						<td>${fieldValue(bean: beerInstance, field: "style")}</td>

						<td>${fieldValue(bean: beerInstance, field: "description")}</td>

						<td><g:link action="show" id="${beerInstance.id}">${fieldValue(bean: beerInstance, field: "createdBy")}</g:link></td>

						<td><g:formatDate date="${beerInstance.createdTimestamp}" /></td>
					
						<td>${fieldValue(bean: beerInstance, field: "updatedBy")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${beerInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
