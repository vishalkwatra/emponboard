{
	"contents": {
		"1def3ac6-0184-4c39-8a82-93ff7cf0ae87": {
			"classDefinition": "com.sap.bpm.wfs.Model",
			"id": "workflowapproval2",
			"subject": "workflowapproval2",
			"name": "workflowapproval2",
			"documentation": "",
			"lastIds": "62d7f4ed-4063-4c44-af8b-39050bd44926",
			"events": {
				"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
					"name": "StartEvent1"
				},
				"acfb9b3b-fc38-4b39-b354-f1b0a2b48edd": {
					"name": "EndEvent10"
				},
				"83bf8261-b6e2-42ed-8d5f-30c28ca8da03": {
					"name": "EndEvent11"
				}
			},
			"activities": {
				"d1031e70-0773-4f2b-901b-9f5c517bbc5d": {
					"name": "Approve Employee"
				},
				"eb68acdc-82cb-4bee-bdbb-5ec36733d923": {
					"name": "Set Decision"
				},
				"df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0": {
					"name": "ExclusiveGateway3"
				},
				"f0c4199f-3554-448b-9d09-b90cd781e44d": {
					"name": "Rejected Mail"
				},
				"2f4eb986-41b5-41e6-a231-86653a95b8b4": {
					"name": "Set Payload"
				},
				"9d5c20ef-afbd-408f-bfd0-87eb083e7636": {
					"name": "Update Table entries"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"281a13ac-86c8-4328-b3b9-d2c42bac913b": {
					"name": "SequenceFlow12"
				},
				"a504be90-002c-41e8-87c3-783930676e4b": {
					"name": "SequenceFlow13"
				},
				"14ed5275-0871-422a-b80e-dc27a0b09e22": {
					"name": "no"
				},
				"c8c285f4-0160-4bb6-b9c0-b660c9cd6ac1": {
					"name": "SequenceFlow17"
				},
				"bb96e59c-be76-42c4-baff-764e7e3d5da0": {
					"name": "yes"
				},
				"a06e6a6d-1b68-49f2-b2da-0eab96d6852a": {
					"name": "SequenceFlow19"
				},
				"87c6898a-ae0a-4a9f-9273-89db5fa27637": {
					"name": "SequenceFlow20"
				}
			},
			"diagrams": {
				"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {}
			}
		},
		"11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3": {
			"classDefinition": "com.sap.bpm.wfs.StartEvent",
			"id": "startevent1",
			"name": "StartEvent1"
		},
		"acfb9b3b-fc38-4b39-b354-f1b0a2b48edd": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent10",
			"name": "EndEvent10"
		},
		"83bf8261-b6e2-42ed-8d5f-30c28ca8da03": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent11",
			"name": "EndEvent11"
		},
		"d1031e70-0773-4f2b-901b-9f5c517bbc5d": {
			"classDefinition": "com.sap.bpm.wfs.UserTask",
			"subject": "Approve Employee for ${context.empData.firstName} ${context.empData.lastName}",
			"description": "Manager approves the newly onboarded employee",
			"priority": "MEDIUM",
			"isHiddenInLogForParticipant": false,
			"supportsForward": false,
			"userInterface": "sapui5://comsapbpmworkflow.comsapbpmwusformplayer/com.sap.bpm.wus.form.player",
			"recipientUsers": "${info.startedBy}",
			"formReference": "/forms/workflowapproval2/approvalform.form",
			"userInterfaceParams": [{
				"key": "formId",
				"value": "approvalform"
			}, {
				"key": "formRevision",
				"value": "1.0"
			}],
			"id": "usertask1",
			"name": "Approve Employee"
		},
		"eb68acdc-82cb-4bee-bdbb-5ec36733d923": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/workflowapproval2/SetDescisionContext.js",
			"id": "scripttask1",
			"name": "Set Decision"
		},
		"df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway3",
			"name": "ExclusiveGateway3",
			"default": "14ed5275-0871-422a-b80e-dc27a0b09e22"
		},
		"f0c4199f-3554-448b-9d09-b90cd781e44d": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"id": "mailtask3",
			"name": "Rejected Mail",
			"documentation": "Rejected Mail",
			"mailDefinitionRef": "3b5af3c3-2b16-47e2-9d5c-53dfcb5f9794"
		},
		"2f4eb986-41b5-41e6-a231-86653a95b8b4": {
			"classDefinition": "com.sap.bpm.wfs.ScriptTask",
			"reference": "/scripts/workflowapproval2/Payload.js",
			"id": "scripttask2",
			"name": "Set Payload"
		},
		"9d5c20ef-afbd-408f-bfd0-87eb083e7636": {
			"classDefinition": "com.sap.bpm.wfs.ServiceTask",
			"destination": "emponboard2",
			"path": "/employee/Employees",
			"httpMethod": "POST",
			"requestVariable": "${context.request.payload}",
			"responseVariable": "${context.response}",
			"headers": [{
				"name": "Content-Type",
				"value": "application/json"
			}],
			"id": "servicetask1",
			"name": "Update Table entries"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "d1031e70-0773-4f2b-901b-9f5c517bbc5d"
		},
		"281a13ac-86c8-4328-b3b9-d2c42bac913b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow12",
			"name": "SequenceFlow12",
			"sourceRef": "d1031e70-0773-4f2b-901b-9f5c517bbc5d",
			"targetRef": "eb68acdc-82cb-4bee-bdbb-5ec36733d923"
		},
		"a504be90-002c-41e8-87c3-783930676e4b": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow13",
			"name": "SequenceFlow13",
			"sourceRef": "eb68acdc-82cb-4bee-bdbb-5ec36733d923",
			"targetRef": "df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0"
		},
		"14ed5275-0871-422a-b80e-dc27a0b09e22": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow16",
			"name": "no",
			"sourceRef": "df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0",
			"targetRef": "f0c4199f-3554-448b-9d09-b90cd781e44d"
		},
		"c8c285f4-0160-4bb6-b9c0-b660c9cd6ac1": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow17",
			"name": "SequenceFlow17",
			"sourceRef": "f0c4199f-3554-448b-9d09-b90cd781e44d",
			"targetRef": "acfb9b3b-fc38-4b39-b354-f1b0a2b48edd"
		},
		"bb96e59c-be76-42c4-baff-764e7e3d5da0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${context.usertaskinfo.decision == \"approve\"}",
			"id": "sequenceflow18",
			"name": "yes",
			"sourceRef": "df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0",
			"targetRef": "2f4eb986-41b5-41e6-a231-86653a95b8b4"
		},
		"a06e6a6d-1b68-49f2-b2da-0eab96d6852a": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow19",
			"name": "SequenceFlow19",
			"sourceRef": "2f4eb986-41b5-41e6-a231-86653a95b8b4",
			"targetRef": "9d5c20ef-afbd-408f-bfd0-87eb083e7636"
		},
		"87c6898a-ae0a-4a9f-9273-89db5fa27637": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow20",
			"name": "SequenceFlow20",
			"sourceRef": "9d5c20ef-afbd-408f-bfd0-87eb083e7636",
			"targetRef": "83bf8261-b6e2-42ed-8d5f-30c28ca8da03"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"633e1fca-81aa-462b-bedd-8fa9cb62788a": {},
				"9c09241a-c95d-429b-a0e9-a518f360c4f6": {},
				"dcb293c6-a466-4914-ad5a-2f3f7ea2c770": {},
				"bc521cad-cbac-4c1d-aaad-9405163abae9": {},
				"2a27d32f-e1b8-45bc-9d58-5ff70de53ff5": {},
				"4ad4f3f2-00d3-4e98-9d21-6565afc1404f": {},
				"1d3f7d5c-71b4-4794-a39a-4b23bfb3b958": {},
				"86a0b727-febb-4399-8b5e-c0e96eadb24d": {},
				"db4998cc-305a-4df4-9ec7-e948534aa776": {},
				"8872ed04-39f2-4d0c-801a-6102a159acee": {},
				"52256c2b-d7fa-430b-a8b1-86e55962e1bb": {},
				"e60e298e-8ca1-4200-83f2-b83696320828": {},
				"0373332f-e0a5-421e-b306-01ee98c7894e": {},
				"a01b8a59-287f-4b59-b4e8-95460858d53f": {},
				"3afd6a53-8a05-4eea-b03b-79930db5b4ae": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 81,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,97 94,97",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "633e1fca-81aa-462b-bedd-8fa9cb62788a",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"633e1fca-81aa-462b-bedd-8fa9cb62788a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 94,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "d1031e70-0773-4f2b-901b-9f5c517bbc5d"
		},
		"9c09241a-c95d-429b-a0e9-a518f360c4f6": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 244,
			"y": 67,
			"width": 100,
			"height": 60,
			"object": "eb68acdc-82cb-4bee-bdbb-5ec36733d923"
		},
		"dcb293c6-a466-4914-ad5a-2f3f7ea2c770": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,97 244,97",
			"sourceSymbol": "633e1fca-81aa-462b-bedd-8fa9cb62788a",
			"targetSymbol": "9c09241a-c95d-429b-a0e9-a518f360c4f6",
			"object": "281a13ac-86c8-4328-b3b9-d2c42bac913b"
		},
		"bc521cad-cbac-4c1d-aaad-9405163abae9": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 394,
			"y": 76,
			"object": "df6f1c3c-2864-49a8-ae4b-b52ffb4e60b0"
		},
		"2a27d32f-e1b8-45bc-9d58-5ff70de53ff5": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "344,97 394,97",
			"sourceSymbol": "9c09241a-c95d-429b-a0e9-a518f360c4f6",
			"targetSymbol": "bc521cad-cbac-4c1d-aaad-9405163abae9",
			"object": "a504be90-002c-41e8-87c3-783930676e4b"
		},
		"4ad4f3f2-00d3-4e98-9d21-6565afc1404f": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 505.9999988079071,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "f0c4199f-3554-448b-9d09-b90cd781e44d"
		},
		"1d3f7d5c-71b4-4794-a39a-4b23bfb3b958": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,97 470.99999940395355,97 470.99999940395355,42 505.9999988079071,42",
			"sourceSymbol": "bc521cad-cbac-4c1d-aaad-9405163abae9",
			"targetSymbol": "4ad4f3f2-00d3-4e98-9d21-6565afc1404f",
			"object": "14ed5275-0871-422a-b80e-dc27a0b09e22"
		},
		"86a0b727-febb-4399-8b5e-c0e96eadb24d": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 675.9999976158142,
			"y": 24.5,
			"width": 35,
			"height": 35,
			"object": "acfb9b3b-fc38-4b39-b354-f1b0a2b48edd"
		},
		"db4998cc-305a-4df4-9ec7-e948534aa776": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,42 675.9999976158142,42",
			"sourceSymbol": "4ad4f3f2-00d3-4e98-9d21-6565afc1404f",
			"targetSymbol": "86a0b727-febb-4399-8b5e-c0e96eadb24d",
			"object": "c8c285f4-0160-4bb6-b9c0-b660c9cd6ac1"
		},
		"8872ed04-39f2-4d0c-801a-6102a159acee": {
			"classDefinition": "com.sap.bpm.wfs.ui.ScriptTaskSymbol",
			"x": 505.9999988079071,
			"y": 122,
			"width": 100,
			"height": 60,
			"object": "2f4eb986-41b5-41e6-a231-86653a95b8b4"
		},
		"52256c2b-d7fa-430b-a8b1-86e55962e1bb": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "436,97 470.99999940395355,97 470.99999940395355,152 505.9999988079071,152",
			"sourceSymbol": "bc521cad-cbac-4c1d-aaad-9405163abae9",
			"targetSymbol": "8872ed04-39f2-4d0c-801a-6102a159acee",
			"object": "bb96e59c-be76-42c4-baff-764e7e3d5da0"
		},
		"e60e298e-8ca1-4200-83f2-b83696320828": {
			"classDefinition": "com.sap.bpm.wfs.ui.ServiceTaskSymbol",
			"x": 675.9999976158142,
			"y": 109.5,
			"width": 100,
			"height": 60,
			"object": "9d5c20ef-afbd-408f-bfd0-87eb083e7636"
		},
		"0373332f-e0a5-421e-b306-01ee98c7894e": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "605.9999988079071,152 640.9999982118607,152 640.9999982118607,139.5 675.9999976158142,139.5",
			"sourceSymbol": "8872ed04-39f2-4d0c-801a-6102a159acee",
			"targetSymbol": "e60e298e-8ca1-4200-83f2-b83696320828",
			"object": "a06e6a6d-1b68-49f2-b2da-0eab96d6852a"
		},
		"a01b8a59-287f-4b59-b4e8-95460858d53f": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 845.9999964237213,
			"y": 79.5,
			"width": 35,
			"height": 35,
			"object": "83bf8261-b6e2-42ed-8d5f-30c28ca8da03"
		},
		"3afd6a53-8a05-4eea-b03b-79930db5b4ae": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "775.9999976158142,139.5 810.9999970197678,139.5 810.9999970197678,97 845.9999964237213,97",
			"sourceSymbol": "e60e298e-8ca1-4200-83f2-b83696320828",
			"targetSymbol": "a01b8a59-287f-4b59-b4e8-95460858d53f",
			"object": "87c6898a-ae0a-4a9f-9273-89db5fa27637"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 4,
			"maildefinition": 3,
			"sequenceflow": 20,
			"startevent": 1,
			"endevent": 11,
			"usertask": 1,
			"servicetask": 1,
			"scripttask": 2,
			"mailtask": 3,
			"exclusivegateway": 3
		},
		"3b5af3c3-2b16-47e2-9d5c-53dfcb5f9794": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition3",
			"to": "test@gmail.com",
			"subject": "Rejected",
			"text": "Rejected",
			"ignoreInvalidRecipients": true,
			"id": "maildefinition3"
		}
	}
}