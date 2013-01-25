
<%@ page import="kegelection.Election" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'election.label', default: 'Election')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-election" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-election" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list election">
			
				<g:if test="${electionInstance?.beers}">
				<li class="fieldcontain">
					<span id="beers-label" class="property-label"><g:message code="election.beers.label" default="Beers" /></span>
					
						<g:each in="${electionInstance.beers}" var="b">
						<span class="property-value" aria-labelledby="beers-label"><g:link controller="beer" action="show" id="${b.id}">${b?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${electionInstance?.endDate}">
				<li class="fieldcontain">
					<span id="endDate-label" class="property-label"><g:message code="election.endDate.label" default="End Date" /></span>
					
						<span class="property-value" aria-labelledby="endDate-label"><g:formatDate date="${electionInstance?.endDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${electionInstance?.keg}">
				<li class="fieldcontain">
					<span id="keg-label" class="property-label"><g:message code="election.keg.label" default="Keg" /></span>
					
						<span class="property-value" aria-labelledby="keg-label"><g:link controller="keg" action="show" id="${electionInstance?.keg?.id}">${electionInstance?.keg?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${electionInstance?.startDate}">
				<li class="fieldcontain">
					<span id="startDate-label" class="property-label"><g:message code="election.startDate.label" default="Start Date" /></span>
					
						<span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${electionInstance?.startDate}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${electionInstance?.votes}">
				<li class="fieldcontain">
					<span id="votes-label" class="property-label"><g:message code="election.votes.label" default="Votes" /></span>
					
						<g:each in="${electionInstance.votes}" var="v">
						<span class="property-value" aria-labelledby="votes-label"><g:link controller="vote" action="show" id="${v.id}">${v?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${electionInstance?.id}" />
					<g:link class="edit" action="edit" id="${electionInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
