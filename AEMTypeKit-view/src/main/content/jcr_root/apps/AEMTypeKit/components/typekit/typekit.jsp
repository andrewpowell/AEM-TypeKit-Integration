<%--
TypeKit Integration -- This component is used in headlibs.jsp file of the TypeKitPage component.  It can be used on its
own in your own page components as well.  If you do not use the TypeKitPage, you need the properties "enableTypeKit" (boolean)
and "typeKitId" (String) in your page's properties.
--%>
<%@include file="/libs/foundation/global.jsp" %>
<cq:defineObjects/>
<%
    final String PROPERTY_ENABLE_TYPEKIT = "enableTypeKit";
    final String PROPERTY_TYPEKIT_ID = "typeKitId";
    boolean useTypeKit = false;
    String typeKitId = "";

    try
    {
        useTypeKit = pageProperties.getInherited(PROPERTY_ENABLE_TYPEKIT,Boolean.class);
        typeKitId = pageProperties.getInherited(PROPERTY_TYPEKIT_ID,String.class);
    }
    catch(Exception e)
    {}
%>
<c:set var="useTypeKit"     value="<%=useTypeKit%>"/>
<c:set var="typeKitId"      value="<%=typeKitId%>"/>

<c:if test="${useTypeKit && fn:length(typeKitId)>0}">
    <script type="text/javascript">
        (function() {
            var config = {
                kitId: '<c:out value="${typeKitId}"/>',
                scriptTimeout: 3000
            };
            var h=document.getElementsByTagName("html")[0];
            h.className+=" wf-loading";
            var t=setTimeout(function(){
                h.className=h.className.replace(/(\s|^)wf-loading(\s|$)/g," ");
                h.className+=" wf-inactive";
            },config.scriptTimeout);
            var tk=document.createElement("script"),d=false;
            tk.src='//use.typekit.net/'+config.kitId+'.js';
            tk.type="text/javascript";
            tk.async="true";
            tk.onload=tk.onreadystatechange=function(){
                var a=this.readyState;
                if(d||a && a!="complete" && a!="loaded")
                    return;
                d=true;clearTimeout(t);
                try{
                    Typekit.load(config)
                }
                catch(b){

                }
            };
            var s=document.getElementsByTagName("script")[0];
            s.parentNode.insertBefore(tk,s)
        })();
    </script>
</c:if>


