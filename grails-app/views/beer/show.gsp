
<%@ page import="kegelection.Beer" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'beer.label', default: 'Beer')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-beer" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-beer" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list beer">
			
				<g:if test="${beerInstance?.createdBy}">
				<li class="fieldcontain">
					<span id="createdBy-label" class="property-label"><g:message code="beer.createdBy.label" default="Created By" /></span>
					
						<span class="property-value" aria-labelledby="createdBy-label"><g:fieldValue bean="${beerInstance}" field="createdBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.createdTimestamp}">
				<li class="fieldcontain">
					<span id="createdTimestamp-label" class="property-label"><g:message code="beer.createdTimestamp.label" default="Created Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="createdTimestamp-label"><g:formatDate date="${beerInstance?.createdTimestamp}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="beer.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${beerInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="beer.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${beerInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.style}">
				<li class="fieldcontain">
					<span id="style-label" class="property-label"><g:message code="beer.style.label" default="Style" /></span>
					
						<span class="property-value" aria-labelledby="style-label"><g:link controller="beerStyle" action="show" id="${beerInstance?.style?.id}">${beerInstance?.style?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.updatedBy}">
				<li class="fieldcontain">
					<span id="updatedBy-label" class="property-label"><g:message code="beer.updatedBy.label" default="Updated By" /></span>
					
						<span class="property-value" aria-labelledby="updatedBy-label"><g:fieldValue bean="${beerInstance}" field="updatedBy"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${beerInstance?.updatedTimestamp}">
				<li class="fieldcontain">
					<span id="updatedTimestamp-label" class="property-label"><g:message code="beer.updatedTimestamp.label" default="Updated Timestamp" /></span>
					
						<span class="property-value" aria-labelledby="updatedTimestamp-label"><g:formatDate date="${beerInstance?.updatedTimestamp}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${beerInstance?.id}" />
					<g:link class="edit" action="edit" id="${beerInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
