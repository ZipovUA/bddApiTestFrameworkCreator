# bddApiTestFrameworkCreator
BDD API Test Framework Template + Creator + Swagger to JS api modules generator 

BDD API Test Framework Creator

BUSINESS IDEA:

	Each time each project spend a lot of time (maybe even a month) to create test framework and each time we repeat the same steps.

Goal of current project to give possibility to create BDD API Test Framework basing on standard modules, utlis, BDD steps and create map of APITestObjects basing on swagger description.
So base functionality and checks will be created not in one month, but in 2 hours - so this project will save up to 8000 USD per project (money that spends on salary of 1-2 persons + taxes + office workplace + outsourcing company fee).


WORKFLOW:

1) Install component globally (npm i bdd-api-test-framework-creator -g)
2) create folder with future project
3) execute shell command “npm init <pathToFolderWithSwaggerFiles>”
It will:
 - unpack bddApiTestFrameworkTemplate.zip to folder with etalone folders/files
  (test folder structure + common api steps + common api feature tests + common api utils) 
- execute “npm install”
 - update package.json
 - explore swagger files and create and map (tree) of apiTestObjects and create base tests (feature files) on it
 - integrate link to api map in common (standard) steps and utils
4) Change package.json and other configuration files according to project needs
5) setup base urls for each environment
6) set credentials to be able to perform login
7) set default test data objects for each endpoint
8) implement methods for api map
9) implement standard CRUD methods for API map
 (create, select, selectBy, selectWithParams, update)
10) add node_modules and reports folders to gitignore exceptions

CONGRATULATIONS! Now You are ready to implement your features in tests
PACKAGES LIST:

 Library name
 Library goal, description
Cucumber
BDD Tool
ESLint / TSLint
Checker of code clearness
Cucumber-HTML-Reporter
Nice and simple reporter
Node-fetch
Nodejs wrapper for fetch functionality that gives possibility to work with requests and responses in asynchronous way
Chai
Assertions library (gives possibility to perform test checks)
Momentjs
Gives possibility to perform actions with time
Lodash
Gives possibility to make more easy work with strings, arrays, ...
Testrail-api
Gives integration with test-cases management system Test-Rail
 

Test Folder Structure:

/root
	 /vscode (configuration for debug) 
	 /tests
	   /features/
                    /common/
                    /projectRelated/
	   /steps/
                    /common/
                    /projectRelated/
	   /support
	        /apiMap/
	        /utils/
		/configuration/
		/common/
		/projectRelated/
			/groupedPreconditions/
	/reports


apiTestObjectTemplate:

const fetch = require(‘node-fetch’);
	const testData = require(<pathToTestData>)
	const globalVars = require(<pathToGlobalVars>)
const fetchWrapper = require(<pathToFetchWrapperUtil>);

	/*
	 List of const to child endpoints classes
	/*
	Class <apiTestObjectNameForCurrentEndpoint> {
	constructor (parentEndpoint) {
		this.endpoint=`${parentEndpoint}/<currentEndpoint>`
}

	async select() {
return  await fetchWrapperUtil.select(this.endPoint);
}

async selectBy(fieldName, value) {
	Return await fetchWrapperUtil.selectBy(this.endpoint, fieldName, value);
}

async update() {
	return ‘Method is not implemented’;
}

async create() {
	return ‘Method is not implemented’;
}

async execute() {
	Return ‘Method is not implemented’;
}


/*
	Custom methods
*/
}

Module.exports = <apiTestObjectNameForCurrentEndpoint>;
LIST OF DEFAULT STEPS:

STEPS FOR SETUP OPERATIONS:

Given I use “<precondition name in utils folder>” precondition

Given I get token for <user name> user

	Or 

	Given I make authorization as <user name> user

STEPS FOR CRUD OPERATIONS:

When I create an object for “<path to apitTestObject in apiMap>” with default data

When I create an object for “<path to apiTestObject in apiMap>” with such updated fields
	| Field Name 		| Value 		 |
	| some field name 1 	| value for current field |
		| some field name 2 	| value for current field |

// step that returns not data but error in http error code and custom error message
When I try to create an object for “<path to apiTestObject in apiMap>” with default data

// step with using data from (MEMORY - data storage for global variables (globalVars)
	When I create an object for ”<path to apiTestObject in apiMap>” with such updated fields
	| Field Name 				| Value 		 |
	| $MEMORY > saved field name 	| value for current field |

When I select data from “<path to apiTestObject in apiMap>”

When I select data from “<path to apiTestObject in apiMap>” by search params
	| Field Name		| Value		 |
	| some field name 1 	| current value |
	| some field name 2 	| current value |

When I try to select data from <path to apiTestObject in apiMap> by search params
	| Field Name		| Value		  |
	| some field name 1 	| current value	  |
	
When I filter data from <path to apiTestObject in apiMap> by <fieldName> and <field value>

When I get the first object after select with ordering in <path> for <fieldName> by <(asc|desc)> method

When I select with ordering in <path to object> for <fieldName> by <(asc|desc)> method

When I update data in <path to apiTestObject> for <searched value> by such params
| Field Name		| Value		 |
	| some field name 1 	| current value  |
	| some field name 2 	| current value  |

When I delete “<id>” in “<path to apiTestObject>”

When I try to delete “<id> in “<path to apiTestObject>”

When I send data to “<path to apiTestObject>”
	| Field Name		| Value		 |
	| some field name 1 	| current value  |
	| some field name 2 	| current value  |

When I try to post data to “<path to apiTestObject>”
	| Field Name		| Value		 |
	| some field name 1 	| current value  |
	| some field name 2 	| current value  |

When I execute “<pathToApiTestObject>” with such params
| Field Name		| Value		 |
	| some field name 1 	| current value  |
	| some field name 2 	| current value  |

When I try to execute “<path to apiTestObject>” with such params
		| Field Name		| Value		 |
	| some field name 1 	| current value  |
	| some field name 2 	| current value  |

STEPS-VALIDATORS:

Then I see that response should be as follows
	| Field Name 			| Value  	  |
| some field1 			| current value |
| some field2 > child field 	| current value |

# the same as previous but for arrays
Then I see that for “response field” field each element in response should be as follows
	| Field Name 			| Value  	  |
| some field1 			| current value |
| some field2 > child field 	| current value |

Then I see that response should match to such requirements
	| Field Name			| assertion method 	| value 	  |
	| some field1			| equals 		| current value |
	| some field2 > child field    | match		| regexp rule    |
	| some field3			| exists 		| true		  |
	| Some field4 		| more then 		| current value |

# the same as previous, but for arrays
Then I see that for “field name” field each element in response should match to such requirements
	| Field Name			| assertion method 	| value 	  |
	| some field1			| equals 		| current value |
	| some field2 > child field    | match		| regexp rule    |
	| some field3			| exists 		| true		  |
	| Some field4 		| more then 		| current value |

Then I see that fields of “path to field in object” in response should match to such requirements
	| Field Name			| assertion method 	| value 	  |
	| some field1			| equals 		| current value |
	| some field2 > child field    | match		| regexp rule    |

Then I see that response contains status code <code number> and status text <text>

Then I see that response contains status code <code number> and system error message <error message>

Then I see that response is sorted by <fieldName> in <(asc|desc)> way
