sap.ui.define(["sap/ui/core/mvc/Controller"],function(e){"use strict";return e.extend("approval2ui.controller.View1",{onInit:function(){var e=new sap.ui.model.json.JSONModel;e.setData({employee:{firstName:"test",lastName:"",country:"",hireDate:"",jobTitle:""}});this.getView().setModel(e,"employee");var t="/employee/";this.getView().bindElement("employee>"+t)},onPressSend:function(){var e=this.getView().getModel("employee").getProperty("/employee");var t=e.hireDate.getDate().toString();var o=e.hireDate.getMonth().toString();var r=e.hireDate.getFullYear().toString();if(o.length<2)o="0"+o;if(t.length<2)t="0"+t;var a=r.concat("-",o,"-",t);var n={definitionId:"workflowapproval2",context:{empData:{firstName:e.firstName,lastName:e.lastName,country:e.Country,hireDate:a,jobTitle:e.jobTitle}}};$.ajax({url:"/approval2ui/bpmworkflowruntime/v1/xsrf-token",method:"GET",headers:{"X-CSRF-Token":"Fetch"},async:false,success:function(e,t,o){var r=o.getResponseHeader("X-CSRF-Token");$.ajax({url:"/approval2ui/bpmworkflowruntime/v1/workflow-instances",type:"POST",data:JSON.stringify(n),headers:{"X-CSRF-Token":r,"Content-Type":"application/json"},async:false,success:function(e){console.log("The workflow is started")},error:function(e){console.log("Error Starting",e)}})}})}})});