<%@ page import="kegelection.Election" %>



<div class="fieldcontain ${hasErrors(bean: electionInstance, field: 'beers', 'error')} ">
	<label for="beers">
		<g:message code="election.beers.label" default="Beers" />
		
	</label>
	<g:select name="beers" from="${kegelection.Beer.list()}" multiple="multiple" optionKey="id" size="5" value="${electionInstance?.beers*.id}" class="many-to-many"/>
</div>

<div class="fieldcontain ${hasErrors(bean: electionInstance, field: 'endDate', 'error')} required">
	<label for="endDate">
		<g:message code="election.endDate.label" default="End Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="endDate" precision="day"  value="${electionInstance?.endDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: electionInstance, field: 'keg', 'error')} required">
	<label for="keg">
		<g:message code="election.keg.label" default="Keg" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="keg" name="keg.id" from="${kegelection.Keg.list()}" optionKey="id" required="" value="${electionInstance?.keg?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: electionInstance, field: 'startDate', 'error')} required">
	<label for="startDate">
		<g:message code="election.startDate.label" default="Start Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="startDate" precision="day"  value="${electionInstance?.startDate}"  />
</div>

<div class="fieldcontain ${hasErrors(bean: electionInstance, field: 'votes', 'error')} ">
	<label for="votes">
		<g:message code="election.votes.label" default="Votes" />
		
	</label>
	<g:select name="votes" from="${kegelection.Vote.list()}" multiple="multiple" optionKey="id" size="5" value="${electionInstance?.votes*.id}" class="many-to-many"/>
</div>

