<%@ page import="kegelection.Vote" %>



<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'beer', 'error')} required">
	<label for="beer">
		<g:message code="vote.beer.label" default="Beer" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="beer" name="beer.id" from="${kegelection.Beer.list()}" optionKey="id" required="" value="${voteInstance?.beer?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'userName', 'error')} ">
	<label for="userName">
		<g:message code="vote.userName.label" default="User Name" />
		
	</label>
	<g:textField name="userName" value="${voteInstance?.userName}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: voteInstance, field: 'voteDate', 'error')} required">
	<label for="voteDate">
		<g:message code="vote.voteDate.label" default="Vote Date" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="voteDate" precision="day"  value="${voteInstance?.voteDate}"  />
</div>

