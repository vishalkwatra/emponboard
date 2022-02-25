sap.ui.define([
    "sap/ui/core/mvc/Controller"
],
    /**
     * @param {typeof sap.ui.core.mvc.Controller} Controller
     */
    function (Controller) {
        "use strict";

        return Controller.extend("approval2ui.controller.View1", {
            onInit: function () {
                var oModel = new sap.ui.model.json.JSONModel();
                oModel.setData({
                    employee: {
                        "firstName": "test",
                        "lastName": "",
                        "country": "",
                        "hireDate": new Date,
                        "jobTitle": ""
                    }
                });
                this.getView().setModel(oModel, "employee");
                var sPath = "/employee/";
                this.getView().bindElement('employee>' + sPath);
            },
            onPressSend: function () {
                $.ajax({
                    url: "/approval2ui/bpmworkflowruntime/v1/xsrf-token",
                    method: "GET",
                    headers: {
                        "X-CSRF-Token": "Fetch"
                    },
                    async: false,
                    success: function (result, xhr, data) {
                        console.log(result);
                        console.log(data);
                    }
                });
                var dataPayLoad =
                {
                    "definitionId": "workflowapproval2",
                    "context": {
                        "empData": {
                            "firstName": "Carla",
                            "lastName": "Grant",
                            "country": "India",
                            "hireDate": "2020-07-11",
                            "jobTitle": "General Manager, Industries"
                        }
                    }
                };
                $.ajax({
                    url: "/emponboard/bpmworkflowruntime/v1/workflow-instances",
                    type: "POST",
                    data: JSON.stringify(dataPayLoad),
                    headers: {
                        "X-CSRF-Token": token,
                        "Content-Type": "application/json"
                    },
                    async: false,
                    success: function (data) {
                        console.log("The workflow is started");
                    },
                    error: function (data) {
                        console.log("Error Starting", data);
                    }
                });
            }
        });
    });
