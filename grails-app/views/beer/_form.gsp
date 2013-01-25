<%@ page import="kegelection.Beer" %>



<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'createdBy', 'error')} ">
	<label for="createdBy">
		<g:message code="beer.createdBy.label" default="Created By" />
		
	</label>
	<g:textField name="createdBy" value="${beerInstance?.createdBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'createdTimestamp', 'error')} required">
	<label for="createdTimestamp">
		<g:message code="beer.createdTimestamp.label" default="Created Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="createdTimestamp" precision="day"  value="${beerInstance?.createdTimestamp}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="beer.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${beerInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="beer.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${beerInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'style', 'error')} required">
	<label for="style">
		<g:message code="beer.style.label" default="Style" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="style" name="style.id" from="${kegelection.BeerStyle.list()}" optionKey="id" required="" value="${beerInstance?.style?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'updatedBy', 'error')} ">
	<label for="updatedBy">
		<g:message code="beer.updatedBy.label" default="Updated By" />
		
	</label>
	<g:textField name="updatedBy" value="${beerInstance?.updatedBy}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: beerInstance, field: 'updatedTimestamp', 'error')} required">
	<label for="updatedTimestamp">
		<g:message code="beer.updatedTimestamp.label" default="Updated Timestamp" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="updatedTimestamp" precision="day"  value="${beerInstance?.updatedTimestamp}"  />
</div>

