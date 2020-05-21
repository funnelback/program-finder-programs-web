<#ftl encoding="utf-8" /><#compress>
<#import "/web/templates/modernui/funnelback_classic.ftl" as s/>
<#import "/web/templates/modernui/funnelback.ftl" as fb/>
<@s.Results>
<#if s.result.class.simpleName != "TierBar" && s.result.metaData.coursesName??>
	<#assign text>${s.result.metaData.coursesName!} ${s.result.metaData.coursesDegree!} ${s.result.metaData.coursesLevel!}i ${s.result.metaData.coursesDepartment!?replace('Department','')}</#assign>
	<#assign triggers = text?lower_case?replace("[^A-Za-z0-9\\s]","","r")>
	<#assign trigger  = triggers>
	<#list triggers?split(" ") as x>
	<#if response.customData["stopwords"]?? && response.customData["stopwords"]?seq_contains(x)>
		<#assign trigger>${trigger?replace("^"+x+"\\s+","","r")}</#assign>
	<#elseif trigger??>
		"${trigger}",900,{\"title\":\"${escapeText(s.result.metaData.coursesName!)}\"\,\"department\":\"${escapeText(s.result.metaData.coursesDepartment!)}\"\,\"degree\":\"${escapeText(s.result.metaData.coursesDegree!)}\"\,\"level\":\"${escapeText(s.result.metaData.coursesLevel!)}\"},J,"",,"${s.result.clickTrackingUrl!}",U
		<#assign trigger>${trigger?replace("^"+x+"\\s+","","r")}</#assign>
	</#if>
	</#list>
</#if>
</@s.Results>
</#compress>

<#function escapeText str>
	<#return str!?chop_linebreak?trim?replace("\"", "\\\",")?replace(",", "\\,") />
</#function>
