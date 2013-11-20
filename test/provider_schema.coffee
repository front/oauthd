module.exports =
	id: "https://oauth.io/provider-schema#"
	"$schema": "http://json-schema.org/draft-04/schema#"
	title: "OAuth.io provider's OAuths description"
	type: "object"
	additionalProperties: false
	properties:
		"name":
			description: "The provider's displayed name"
			type: "string"
		"url":
			description: "The base absolute url to use in sub-parts"
			type: "string"
			format: "uri"
		"oauth1":
			description: "The OAuth 1.0/1.0a description"
			type: "object"
			additionalProperties: false
			required: ["request_token", "authorize", "access_token"]
			properties:
				"request_token":
					description: "The request token endpoint for OAuth 1"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
						}
					]
				"authorize":
					description: "The authorize endpoint for OAuth 1"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"ignore_verifier":
									description: "Set ignore_verifier to true if you are using the old OAuth 1.0"
									type: "boolean"
								"query":
									type: "object"
						}
					]
				"access_token":
					description: "The access token endpoint for OAuth 1"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
						}
					]
				"request":
					description: "The authorizing API requests description"
					oneOf: [
						{type: "string"},
						{type: "boolean"},
						{
							type: "object"
							additionalProperties: false
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
								"headers":
									type: "object"
						}
					]
				"parameters":
					$ref: "#/definitions/parameters"
					description: "Parameters used only in OAuth 1"
		"oauth2":
			description: "The OAuth 2.0 description"
			type: "object"
			additionalProperties: false
			required: ["authorize", "access_token"]
			properties:
				"authorize":
					description: "The authorize endpoint for OAuth 2"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
						}
					]
				"access_token":
					description: "The access token endpoint for OAuth 2"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"method":
									type: "string"
									enum: ["get", "post"]
								"extra":
									type: "array"
									items:
										type: "string"
								"format":
									description: "force the response content type"
									type: "string"
									enum: ["json", "url", "application/json", "application/x-www-form-urlencoded"]
								"query":
									type: "object"
						}
					]
				"refresh":
					description: "The refresh token endpoint for OAuth 2"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"method":
									type: "string"
									enum: ["get", "post"]
								"format":
									description: "force the response content type"
									type: "string"
									enum: ["json", "url", "application/json", "application/x-www-form-urlencoded"]
								"query":
									type: "object"
						}
					]
				"revoke":
					description: "The revoke application endpoint for OAuth 2"
					oneOf: [
						{type: "string"},
						{
							type: "object"
							additionalProperties: false
							required: ["url"]
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
								"method":
									type: "string"
									enum: ["get", "post", "delete"]
								"headers":
									type: "object"
						}
					]
				"request":
					description: "The authorizing API requests description"
					oneOf: [
						{type: "string"},
						{type: "boolean"},
						{
							type: "object"
							additionalProperties: false
							properties:
								"url":
									type: "string"
									format: "uri"
								"query":
									type: "object"
								"cors":
									description: "Set to true if the API accepts CORS requests. Defaults to false"
									type: "boolean"
								"headers":
									type: "object"
						}
					]
				"parameters":
					$ref: "#/definitions/parameters"
					description: "Parameters used only in OAuth 2"
		"parameters":
			$ref: "#/definitions/parameters"
			description: "Global parameters used in both OAuth 1 and 2"
		"href":
			description: "Useful links related to the provider"
			type: "object"
			properties:
				"keys":
					description: "A link to the app creation"
					type: "string"
					format: "uri"
				"apps":
					description: "A link to the existing apps list"
					type: "string"
					format: "uri"
				"docs":
					description: "A link to the authentication documentation"
					type: "string"
					format: "uri"
	definitions:
		"parameters":
			description: "Parameters used in both OAuth 1 and 2"
			type: "object"
			patternProperties:
				"^.*$":
					oneOf: [{
						type: "string"
						enum: ["string"]
					}, {
						type: "object"
						additionalProperties: false
						required: ["values"]
						properties:
							"values":
								type: "object"
								patternProperties:
									"^.*$":
										type: "string"
							"cardinality":
								type: "string"
								enum: ["*", "1"]
							"separator":
								type: "string"
							"type":
								type: "string"
								enum: ["string"]
					}]
	required: ["name", "url"]
	additionalProperties: false