Feature: All base steps

   Feature Description

   Scenario: setup steps
        Given I use "<precondition name in utils folder>" precondition    
        Given I get token for "<user name>" user
	    Given I make authorization as "<user name>" user

    Scenario: CRUD operations steps
        When I create an object for "<path to apitTestObject in apiMap>" with default data

        When I create an object for "<path to apiTestObject in apiMap>" with such updated fields
	        | Field Name     		| Value 		             |
	        | some field name 1 	| value for current field    |
		    | some field name 2 	| value for current field    |

        # step that returns not data but error in http error code and custom error message
        When I try to create an object for "<path to apiTestObject in apiMap>" with default data

        # step with using data from (MEMORY - data storage for global variables (globalVars)
	    When I create an object for "<path to apiTestObject in apiMap>" with such updated fields
	        | Field Name 		    		| Value 		             |
	        | $MEMORY > saved field name 	| value for current field    |

        When I select data from "<path to apiTestObject in apiMap>"

        When I select data from "<path to apiTestObject in apiMap>" by search params
	        | Field Name			| Value			 |
	        | some field name 1 	| current value	 |
	        | some field name 2 	| current value	 |

        When I try to select data from "<path to apiTestObject in apiMap>" by search params
	        | Field Name			| Value			  |
	        | some field name 1 	| current value	  |
	
        When I filter data from "<path to apiTestObject in apiMap>" by "<fieldName>" and "<field value>"

        When I get the first object after select with ordering in "<path>" for "<fieldName>" by "<(asc|desc)>" method

        When I select with ordering in "<path to object>" for "<fieldName>" by "<(asc|desc)>" method

        When I update data in "<path to apiTestObject>" for "<searched value>" by such params
            | Field Name			| Value			 |
	        | some field name 1 	| current value  |
	        | some field name 2 	| current value  |

		When I delete "<id>" in "<path to apiTestObject>"

		When I try to delete "<id>" in "<path to apiTestObject>"

		When I post data to "<path to apiTestObject>"
			| Field Name			| Value			 |
			| some field name 1 	| current value  |
			| some field name 2 	| current value  |

		When I try to post data to "<path to apiTestObject>"
			| Field Name			| Value			 |
			| some field name 1 	| current value  |
			| some field name 2 	| current value  |

		When I execute "<pathToApiTestObject>" with such params
			| Field Name			| Value			 |
			| some field name 1 	| current value  |
			| some field name 2 	| current value  |

		When I try to execute "<path to apiTestObject>" with such params
			| Field Name			| Value			 |
			| some field name 1 	| current value  |
			| some field name 2 	| current value  |
    
	
	Scenario: validation steps

		Then I see that response should be as follows
			| Field Name 					| Value		  	 |
			| some field1 					| current value	 |
			| some field2 > child field 	| current value	 |

		Then I see that response should match to such requirements
			| Field Name					| Assertion method	 	| Value 	  	 |
			| some field1					| equals 				| current value	 |
			| some field2 > child field	    | match					| regexp rule    |
			| some field3					| exists 				| true			 |
			| Some field4 					| more then 			| current value	 |

		Then I see that fields of “path to field in object” in response should match to such requirements
			| Field Name					| Assertion method	 	| Value 			 |
			| some field1					| equals 				| current value		 |
			| some field2 > child field	    | match					| regexp rule 	  	 |

		Then I see that response contains status code "<code number>" and status text "<text>"

		Then I see that response contains status code 400 and system error message "<error message>"

		Then I see that response is sorted by "<fieldName>" in "<(asc|desc)>" way
