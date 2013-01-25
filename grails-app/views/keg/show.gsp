
<%@ page import="kegelection.Keg" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'keg.label', default: 'Keg')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-keg" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-keg" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list keg">
			
				<g:if test="${kegInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="keg.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${kegInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kegInstance?.currentBeer}">
				<li class="fieldcontain">
					<span id="currentBeer-label" class="property-label"><g:message code="keg.currentBeer.label" default="Current Beer" /></span>
					
						<span class="property-value" aria-labelledby="currentBeer-label"><g:link controller="beer" action="show" id="${kegInstance?.currentBeer?.id}">${kegInstance?.currentBeer?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${kegInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="keg.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${kegInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${kegInstance?.fillDate}">
				<li class="fieldcontain">
					<span id="fillDate-label" class="property-label"><g:message code="keg.fillDate.label" default="Fill Date" /></span>
					
						<span class="property-value" aria-labelledby="fillDate-label"><g:formatDate date="${kegInstance?.fillDate}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${kegInstance?.id}" />
					<g:link class="edit" action="edit" id="${kegInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
