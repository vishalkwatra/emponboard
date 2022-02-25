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
				"5df0ae6d-4569-4363-9054-d80ca0a86564": {
					"name": "EndEvent2"
				},
				"da2914d9-e485-4377-bd30-2e3a6eb7d7a6": {
					"name": "EndEvent"
				}
			},
			"activities": {
				"d1031e70-0773-4f2b-901b-9f5c517bbc5d": {
					"name": "Approve Employee"
				},
				"61c32e85-5c5f-4f0d-9480-a1883c32b3ec": {
					"name": "ExclusiveGateway1"
				},
				"a7486d66-8e51-4b2f-a385-0b6113d02bd1": {
					"name": "Reject Mail"
				}
			},
			"sequenceFlows": {
				"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
					"name": "SequenceFlow1"
				},
				"31800791-e21b-426b-b806-d204af96c2e0": {
					"name": "SequenceFlow2"
				},
				"5e29f4dd-cc7d-4842-96a2-741a3fb1f5b5": {
					"name": "No"
				},
				"7575ee5a-3e5b-49f8-9002-6adc6188a422": {
					"name": "SequenceFlow5"
				},
				"431afef0-f7d1-4c76-b452-8af97cbc6a63": {
					"name": "Yes"
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
		"5df0ae6d-4569-4363-9054-d80ca0a86564": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent2",
			"name": "EndEvent2",
			"eventDefinitions": {
				"156653d5-f210-43a1-86e5-b1d7483cbc7d": {}
			}
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
		"61c32e85-5c5f-4f0d-9480-a1883c32b3ec": {
			"classDefinition": "com.sap.bpm.wfs.ExclusiveGateway",
			"id": "exclusivegateway1",
			"name": "ExclusiveGateway1",
			"default": "5e29f4dd-cc7d-4842-96a2-741a3fb1f5b5"
		},
		"a7486d66-8e51-4b2f-a385-0b6113d02bd1": {
			"classDefinition": "com.sap.bpm.wfs.MailTask",
			"id": "mailtask1",
			"name": "Reject Mail",
			"documentation": "Reject Mail",
			"mailDefinitionRef": "04afecda-b481-4588-8ea4-4af16e839ca4"
		},
		"c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow1",
			"name": "SequenceFlow1",
			"sourceRef": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3",
			"targetRef": "d1031e70-0773-4f2b-901b-9f5c517bbc5d"
		},
		"31800791-e21b-426b-b806-d204af96c2e0": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow2",
			"name": "SequenceFlow2",
			"sourceRef": "d1031e70-0773-4f2b-901b-9f5c517bbc5d",
			"targetRef": "61c32e85-5c5f-4f0d-9480-a1883c32b3ec"
		},
		"5e29f4dd-cc7d-4842-96a2-741a3fb1f5b5": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow4",
			"name": "No",
			"sourceRef": "61c32e85-5c5f-4f0d-9480-a1883c32b3ec",
			"targetRef": "a7486d66-8e51-4b2f-a385-0b6113d02bd1"
		},
		"7575ee5a-3e5b-49f8-9002-6adc6188a422": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"id": "sequenceflow5",
			"name": "SequenceFlow5",
			"sourceRef": "a7486d66-8e51-4b2f-a385-0b6113d02bd1",
			"targetRef": "5df0ae6d-4569-4363-9054-d80ca0a86564"
		},
		"42fa7a2d-c526-4a02-b3ba-49b5168ba644": {
			"classDefinition": "com.sap.bpm.wfs.ui.Diagram",
			"symbols": {
				"df898b52-91e1-4778-baad-2ad9a261d30e": {},
				"6bb141da-d485-4317-93b8-e17711df4c32": {},
				"633e1fca-81aa-462b-bedd-8fa9cb62788a": {},
				"c5f64981-fee7-4fe2-8948-af65eb5715ce": {},
				"e53c28e6-e4ef-4d32-a67f-9b4c3a853881": {},
				"a53f87e8-5d80-4e5e-9912-b2e5ef84ca7f": {},
				"d1c39896-15c1-44bd-ab03-4020b4f661ff": {},
				"72032652-c08d-4774-9138-7bda706a67f1": {},
				"69781f72-5803-45df-b22e-e9f01bda6404": {},
				"b3337c3f-0b43-4594-ab88-b824cbdc2a9f": {},
				"4882c4c7-f5e5-4e07-951b-b99aff3c89d7": {}
			}
		},
		"df898b52-91e1-4778-baad-2ad9a261d30e": {
			"classDefinition": "com.sap.bpm.wfs.ui.StartEventSymbol",
			"x": 12,
			"y": 68.5,
			"width": 32,
			"height": 32,
			"object": "11a9b5ee-17c0-4159-9bbf-454dcfdcd5c3"
		},
		"6bb141da-d485-4317-93b8-e17711df4c32": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "44,84.5 94,84.5",
			"sourceSymbol": "df898b52-91e1-4778-baad-2ad9a261d30e",
			"targetSymbol": "633e1fca-81aa-462b-bedd-8fa9cb62788a",
			"object": "c6b99f32-5fe6-4ab6-b60a-80fba1b9ae0f"
		},
		"633e1fca-81aa-462b-bedd-8fa9cb62788a": {
			"classDefinition": "com.sap.bpm.wfs.ui.UserTaskSymbol",
			"x": 94,
			"y": 54.5,
			"width": 100,
			"height": 60,
			"object": "d1031e70-0773-4f2b-901b-9f5c517bbc5d"
		},
		"c5f64981-fee7-4fe2-8948-af65eb5715ce": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "194,84.5 244,84.5",
			"sourceSymbol": "633e1fca-81aa-462b-bedd-8fa9cb62788a",
			"targetSymbol": "e53c28e6-e4ef-4d32-a67f-9b4c3a853881",
			"object": "31800791-e21b-426b-b806-d204af96c2e0"
		},
		"e53c28e6-e4ef-4d32-a67f-9b4c3a853881": {
			"classDefinition": "com.sap.bpm.wfs.ui.ExclusiveGatewaySymbol",
			"x": 244,
			"y": 63.5,
			"object": "61c32e85-5c5f-4f0d-9480-a1883c32b3ec"
		},
		"a53f87e8-5d80-4e5e-9912-b2e5ef84ca7f": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 525.9999976158142,
			"y": 67,
			"width": 35,
			"height": 35,
			"object": "5df0ae6d-4569-4363-9054-d80ca0a86564"
		},
		"d1c39896-15c1-44bd-ab03-4020b4f661ff": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "286,84.5 320.99999940395355,84.5 320.99999940395355,42 355.9999988079071,42",
			"sourceSymbol": "e53c28e6-e4ef-4d32-a67f-9b4c3a853881",
			"targetSymbol": "72032652-c08d-4774-9138-7bda706a67f1",
			"object": "5e29f4dd-cc7d-4842-96a2-741a3fb1f5b5"
		},
		"72032652-c08d-4774-9138-7bda706a67f1": {
			"classDefinition": "com.sap.bpm.wfs.ui.MailTaskSymbol",
			"x": 355.9999988079071,
			"y": 12,
			"width": 100,
			"height": 60,
			"object": "a7486d66-8e51-4b2f-a385-0b6113d02bd1"
		},
		"69781f72-5803-45df-b22e-e9f01bda6404": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "455.9999988079071,42 490.99999821186066,42 490.99999821186066,84.5 525.9999976158142,84.5",
			"sourceSymbol": "72032652-c08d-4774-9138-7bda706a67f1",
			"targetSymbol": "a53f87e8-5d80-4e5e-9912-b2e5ef84ca7f",
			"object": "7575ee5a-3e5b-49f8-9002-6adc6188a422"
		},
		"62d7f4ed-4063-4c44-af8b-39050bd44926": {
			"classDefinition": "com.sap.bpm.wfs.LastIDs",
			"terminateeventdefinition": 2,
			"maildefinition": 1,
			"sequenceflow": 6,
			"startevent": 1,
			"endevent": 4,
			"usertask": 1,
			"mailtask": 1,
			"exclusivegateway": 1
		},
		"156653d5-f210-43a1-86e5-b1d7483cbc7d": {
			"classDefinition": "com.sap.bpm.wfs.TerminateEventDefinition",
			"id": "terminateeventdefinition1"
		},
		"04afecda-b481-4588-8ea4-4af16e839ca4": {
			"classDefinition": "com.sap.bpm.wfs.MailDefinition",
			"name": "maildefinition1",
			"to": "test@gmail.com",
			"subject": "Reject Mail",
			"text": "Reject Mail",
			"id": "maildefinition1"
		},
		"da2914d9-e485-4377-bd30-2e3a6eb7d7a6": {
			"classDefinition": "com.sap.bpm.wfs.EndEvent",
			"id": "endevent4",
			"name": "EndEvent"
		},
		"b3337c3f-0b43-4594-ab88-b824cbdc2a9f": {
			"classDefinition": "com.sap.bpm.wfs.ui.EndEventSymbol",
			"x": 355.9999988079071,
			"y": 122,
			"width": 35,
			"height": 35,
			"object": "da2914d9-e485-4377-bd30-2e3a6eb7d7a6"
		},
		"431afef0-f7d1-4c76-b452-8af97cbc6a63": {
			"classDefinition": "com.sap.bpm.wfs.SequenceFlow",
			"condition": "${usertasks.usertask1.last.decision==\"accept\"}",
			"id": "sequenceflow6",
			"name": "Yes",
			"sourceRef": "61c32e85-5c5f-4f0d-9480-a1883c32b3ec",
			"targetRef": "da2914d9-e485-4377-bd30-2e3a6eb7d7a6"
		},
		"4882c4c7-f5e5-4e07-951b-b99aff3c89d7": {
			"classDefinition": "com.sap.bpm.wfs.ui.SequenceFlowSymbol",
			"points": "286,84.5 320.99999940395355,84.5 320.99999940395355,139.5 355.9999988079071,139.5",
			"sourceSymbol": "e53c28e6-e4ef-4d32-a67f-9b4c3a853881",
			"targetSymbol": "b3337c3f-0b43-4594-ab88-b824cbdc2a9f",
			"object": "431afef0-f7d1-4c76-b452-8af97cbc6a63"
		}
	}
}