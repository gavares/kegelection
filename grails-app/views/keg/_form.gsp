<%@ page import="kegelection.Keg" %>



<div class="fieldcontain ${hasErrors(bean: kegInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="keg.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" maxlength="128" required="" value="${kegInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: kegInstance, field: 'currentBeer', 'error')} required">
	<label for="currentBeer">
		<g:message code="keg.currentBeer.label" default="Current Beer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="currentBeer" name="currentBeer.id" from="${kegelection.Beer.list()}" optionKey="id" required="" value="${kegInstance?.currentBeer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: kegInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="keg.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${kegInstance?.description}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: kegInstance, field: 'fillDate', 'error')} required">
	<label for="fillDate">
		<g:message code="keg.fillDate.label" default="Fill Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="fillDate" precision="day"  value="${kegInstance?.fillDate}"  />
</div>

