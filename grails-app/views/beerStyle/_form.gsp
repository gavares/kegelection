<%@ page import="kegelection.BeerStyle" %>



<div class="fieldcontain ${hasErrors(bean: beerStyleInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="beerStyle.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${beerStyleInstance?.name}"/>
</div>

