//@ui5-bundle approval2ui/Component-preload.js
jQuery.sap.registerPreloadedModules({
"version":"2.0",
"modules":{
	"approval2ui/Component.js":function(){sap.ui.define(["sap/ui/core/UIComponent","sap/ui/Device","approval2ui/model/models"],function(e,i,t){"use strict";return e.extend("approval2ui.Component",{metadata:{manifest:"json"},init:function(){e.prototype.init.apply(this,arguments);this.getRouter().initialize();this.setModel(t.createDeviceModel(),"device")}})});
},
	"approval2ui/controller/View1.controller.js":function(){sap.ui.define(["sap/ui/core/mvc/Controller"],function(e){"use strict";return e.extend("approval2ui.controller.View1",{onInit:function(){var e=new sap.ui.model.json.JSONModel;e.setData({employee:{firstName:"test",lastName:"",country:"",hireDate:"",jobTitle:""}});this.getView().setModel(e,"employee");var t="/employee/";this.getView().bindElement("employee>"+t)},onPressSend:function(){var e=this.getView().getModel("employee").getProperty("/employee");var t=e.hireDate.getDate().toString();var o=e.hireDate.getMonth().toString();var r=e.hireDate.getFullYear().toString();if(o.length<2)o="0"+o;if(t.length<2)t="0"+t;var a=r.concat("-",o,"-",t);var n={definitionId:"workflowapproval2",context:{empData:{firstName:e.firstName,lastName:e.lastName,country:e.Country,hireDate:a,jobTitle:e.jobTitle}}};$.ajax({url:"/approval2ui/bpmworkflowruntime/v1/xsrf-token",method:"GET",headers:{"X-CSRF-Token":"Fetch"},async:false,success:function(e,t,o){var r=o.getResponseHeader("X-CSRF-Token");$.ajax({url:"/approval2ui/bpmworkflowruntime/v1/workflow-instances",type:"POST",data:JSON.stringify(n),headers:{"X-CSRF-Token":r,"Content-Type":"application/json"},async:false,success:function(e){console.log("The workflow is started")},error:function(e){console.log("Error Starting",e)}})}})}})});
},
	"approval2ui/i18n/i18n.properties":'# This is the resource bundle for approval2ui\n\n#Texts for manifest.json\n\n#XTIT: Application name\nappTitle=Employee approval\n\n#YDES: Application description\nappDescription=Employee approval\n#XTIT: Main view title\ntitle=Employee approval\n\nflpTitle=Employee Approval\n\nflpSubtitle=\n',
	"approval2ui/manifest.json":'{"_version":"1.32.0","sap.app":{"id":"approval2ui","type":"application","i18n":"i18n/i18n.properties","applicationVersion":{"version":"0.0.1"},"title":"{{appTitle}}","description":"{{appDescription}}","dataSources":{"mainService":{"uri":"employee/","type":"OData","settings":{"annotations":[],"localUri":"localService/metadata.xml","odataVersion":"4.0"}}},"crossNavigation":{"inbounds":{"approval2ui-inbound":{"signature":{"parameters":{},"additionalParameters":"allowed"},"semanticObject":"EmployeeApproval","action":"create","title":"{{flpTitle}}","subTitle":"{{flpSubtitle}}","icon":""}}}},"sap.ui":{"technology":"UI5","icons":{"icon":"","favIcon":"","phone":"","phone@2":"","tablet":"","tablet@2":""},"deviceTypes":{"desktop":true,"tablet":true,"phone":true}},"sap.ui5":{"flexEnabled":true,"dependencies":{"minUI5Version":"1.98.0","libs":{"sap.ui.core":{}}},"contentDensities":{"compact":true,"cozy":true},"models":{"i18n":{"type":"sap.ui.model.resource.ResourceModel","settings":{"bundleName":"approval2ui.i18n.i18n"}},"":{"dataSource":"mainService","preload":true,"settings":{"synchronizationMode":"None","operationMode":"Server","autoExpandSelect":true,"earlyRequests":true,"groupId":"$direct"}}},"resources":{"css":[{"uri":"css/style.css"}]},"routing":{"config":{"routerClass":"sap.m.routing.Router","viewType":"XML","async":true,"viewPath":"approval2ui.view","controlAggregation":"pages","controlId":"app","clearControlAggregation":false},"routes":[{"name":"RouteView1","pattern":"RouteView1","target":["TargetView1"]}],"targets":{"TargetView1":{"viewType":"XML","transition":"slide","clearControlAggregation":false,"viewId":"View1","viewName":"View1"}}},"rootView":{"viewName":"approval2ui.view.View1","type":"XML","async":true,"id":"View1"}}}',
	"approval2ui/model/models.js":function(){sap.ui.define(["sap/ui/model/json/JSONModel","sap/ui/Device"],function(e,n){"use strict";return{createDeviceModel:function(){var i=new e(n);i.setDefaultBindingMode("OneWay");return i}}});
},
	"approval2ui/utils/locate-reuse-libs.js":'(function(e){var t=function(e){var t=e;var n="";var r=["sap.apf","sap.base","sap.chart","sap.collaboration","sap.f","sap.fe","sap.fileviewer","sap.gantt","sap.landvisz","sap.m","sap.ndc","sap.ovp","sap.rules","sap.suite","sap.tnt","sap.ui","sap.uiext","sap.ushell","sap.uxap","sap.viz","sap.webanalytics","sap.zen"];function a(e,t){Object.keys(e).forEach(function(e){if(!r.some(function(t){return e===t||e.startsWith(t+".")})){if(t.length>0){t=t+","+e}else{t=e}}});return t}return new Promise(function(r,i){$.ajax(t).done(function(e){if(e){if(e["sap.ui5"]&&e["sap.ui5"].dependencies){if(e["sap.ui5"].dependencies.libs){n=a(e["sap.ui5"].dependencies.libs,n)}if(e["sap.ui5"].dependencies.components){n=a(e["sap.ui5"].dependencies.components,n)}}if(e["sap.ui5"]&&e["sap.ui5"].componentUsages){n=a(e["sap.ui5"].componentUsages,n)}}r(n)}).fail(function(t){i(new Error("Could not fetch manifest at \'"+e))})})};e.registerComponentDependencyPaths=function(e){return t(e).then(function(e){if(e&&e.length>0){var t="/sap/bc/ui2/app_index/ui5_app_info?id="+e;var n=jQuery.sap.getUriParameters().get("sap-client");if(n&&n.length===3){t=t+"&sap-client="+n}return $.ajax(t).done(function(e){if(e){Object.keys(e).forEach(function(t){var n=e[t];if(n&&n.dependencies){n.dependencies.forEach(function(e){if(e.url&&e.url.length>0&&e.type==="UI5LIB"){jQuery.sap.log.info("Registering Library "+e.componentId+" from server "+e.url);jQuery.sap.registerModulePath(e.componentId,e.url)}})}})}})}})}})(sap);var scripts=document.getElementsByTagName("script");var currentScript=document.getElementById("locate-reuse-libs");if(!currentScript){currentScript=document.currentScript}var manifestUri=currentScript.getAttribute("data-sap-ui-manifest-uri");var componentName=currentScript.getAttribute("data-sap-ui-componentName");var useMockserver=currentScript.getAttribute("data-sap-ui-use-mockserver");sap.registerComponentDependencyPaths(manifestUri).catch(function(e){jQuery.sap.log.error(e)}).finally(function(){sap.ui.getCore().attachInit(function(){jQuery.sap.require("jquery.sap.resources");var e=sap.ui.getCore().getConfiguration().getLanguage();var t=jQuery.sap.resources({url:"i18n/i18n.properties",locale:e});document.title=t.getText("appTitle")});if(componentName&&componentName.length>0){if(useMockserver&&useMockserver==="true"){sap.ui.getCore().attachInit(function(){sap.ui.require([componentName.replace(/\\./g,"/")+"/localService/mockserver"],function(e){e.init();sap.ushell.Container.createRenderer().placeAt("content")})})}else{sap.ui.require(["sap/ui/core/ComponentSupport"]);sap.ui.getCore().attachInit(function(){jQuery.sap.require("jquery.sap.resources");var e=sap.ui.getCore().getConfiguration().getLanguage();var t=jQuery.sap.resources({url:"i18n/i18n.properties",locale:e});document.title=t.getText("appTitle")})}}else{sap.ui.getCore().attachInit(function(){sap.ushell.Container.createRenderer().placeAt("content")})}});sap.registerComponentDependencyPaths(manifestUri);',
	"approval2ui/view/View1.view.xml":'<mvc:View\n    controllerName="approval2ui.controller.View1"\n     xmlns:mvc="sap.ui.core.mvc"\n    displayBlock="true"\n    xmlns="sap.m"\n    xmlns:l="sap.ui.layout"\n    xmlns:f="sap.ui.layout.form"\n    xmlns:core="sap.ui.core"\n><Shell id="shell"><App id="app"><pages><Page id="page" title="{i18n>title}"><content><f:SimpleForm id="idEmployeeForm"\n                            editable="true"\n                            layout="ResponsiveGridLayout"\n                            labelSpanXL="3"\n                            labelSpanL="3"\n                            labelSpanM="3"\n                            labelSpanS="12"\n                            adjustLabelSpan="false"\n                            emptySpanXL="4"\n                            emptySpanL="4"\n                            emptySpanM="4"\n                            emptySpanS="0"\n                            columnsXL="1"\n                            columnsL="1"\n                            columnsM="1"\n                            singleContainerFullSize="false" ><f:content><Label text="First Name" /><Input id="firstName" value="{employee>firstName}" /><Label text="Last Name" /><Input value="{employee>lastName}"></Input><Label text="Country" /><Input value="{employee>country}"/><Label text="Hire Date" /><DatePicker\n                            id="hireDate"\n                            placeholder="Enter Hire Date"\n                            change="handleChangeDate"\n                            valueFormat="yyyy-MM-dd"\n                            value="{path:\'employee>hireDate\', type:\'sap.ui.model.type.Date\',formatOptions: { style: \'medium\', strictParsing: true}}"\n                            class="sapUiSmallMarginBottom"/><Label text="Job Title" /><Input value="{employee>jobTitle}"/><Label text="" /><Button id="idBtnSend" press="onPressSend" text="Send for approval" type="Emphasized"></Button><Button id="idBtnReset" press="onPressReset" text="Reset Data"/></f:content></f:SimpleForm></content></Page></pages></App></Shell></mvc:View>\n'
}});
