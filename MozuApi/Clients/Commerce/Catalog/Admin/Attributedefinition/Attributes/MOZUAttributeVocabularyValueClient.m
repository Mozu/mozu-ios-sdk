
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUAttributeVocabularyValueClient.h"
#import "MOZUAttributeVocabularyValueURLComponents.h"
#import "MozuAdminAttributeVocabularyValue.h"
#import "MozuAttributeVocabularyValueLocalizedContent.h"


@implementation MOZUAttributeVocabularyValueClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetAttributeVocabularyValuesOperationWithAttributeFQN:(NSString *)attributeFQN {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForGetAttributeVocabularyValuesOperationWithAttributeFQN:attributeFQN];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray *jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUAdminAttributeVocabularyValue arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAttributeVocabularyValueLocalizedContentsOperationWithAttributeFQN:(NSString *)attributeFQN value:(NSString *)value {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForGetAttributeVocabularyValueLocalizedContentsOperationWithAttributeFQN:attributeFQN value:value];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray *jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUAttributeVocabularyValueLocalizedContent arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForGetAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:attributeFQN value:value localeCode:localeCode responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttributeVocabularyValueLocalizedContent alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForGetAttributeVocabularyValueOperationWithAttributeFQN:(NSString *)attributeFQN value:(NSString *)value responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForGetAttributeVocabularyValueOperationWithAttributeFQN:attributeFQN value:value responseFields:responseFields];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminAttributeVocabularyValue alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForAddAttributeVocabularyValueLocalizedContentOperationWithBody:(MOZUAttributeVocabularyValueLocalizedContent *)body attributeFQN:(NSString *)attributeFQN value:(NSString *)value responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForAddAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:attributeFQN value:value responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttributeVocabularyValueLocalizedContent alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForAddAttributeVocabularyValueOperationWithBody:(MOZUAdminAttributeVocabularyValue *)body attributeFQN:(NSString *)attributeFQN responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForAddAttributeVocabularyValueOperationWithAttributeFQN:attributeFQN responseFields:responseFields];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminAttributeVocabularyValue alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//

+ (MOZUClient *)clientForUpdateAttributeVocabularyValuesOperationWithBody:(NSArray<MOZUAdminAttributeVocabularyValue> *)body attributeFQN:(NSString *)attributeFQN {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForUpdateAttributeVocabularyValuesOperationWithAttributeFQN:attributeFQN];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray *jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUAdminAttributeVocabularyValue arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForUpdateAttributeVocabularyValueLocalizedContentsOperationWithBody:(NSArray<MOZUAttributeVocabularyValueLocalizedContent> *)body attributeFQN:(NSString *)attributeFQN value:(NSString *)value {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForUpdateAttributeVocabularyValueLocalizedContentsOperationWithAttributeFQN:attributeFQN value:value];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray *jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUAttributeVocabularyValueLocalizedContent arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForUpdateAttributeVocabularyValueLocalizedContentOperationWithBody:(MOZUAttributeVocabularyValueLocalizedContent *)body attributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForUpdateAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:attributeFQN value:value localeCode:localeCode responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAttributeVocabularyValueLocalizedContent alloc] initWithString:jsonResult error:nil];
	};

	return client;
}

+ (MOZUClient *)clientForUpdateAttributeVocabularyValueOperationWithBody:(MOZUAdminAttributeVocabularyValue *)body attributeFQN:(NSString *)attributeFQN value:(NSString *)value responseFields:(NSString *)responseFields {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForUpdateAttributeVocabularyValueOperationWithAttributeFQN:attributeFQN value:value responseFields:responseFields];
	id verb = @"PUT";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUAdminAttributeVocabularyValue alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteAttributeVocabularyValueOperationWithAttributeFQN:(NSString *)attributeFQN value:(NSString *)value {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForDeleteAttributeVocabularyValueOperationWithAttributeFQN:attributeFQN value:value];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}

+ (MOZUClient *)clientForDeleteAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:(NSString *)attributeFQN value:(NSString *)value localeCode:(NSString *)localeCode {
	id url = [MOZUAttributeVocabularyValueURLComponents URLComponentsForDeleteAttributeVocabularyValueLocalizedContentOperationWithAttributeFQN:attributeFQN value:value localeCode:localeCode];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}



@end