
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import "MOZUCommerceReturnsShipmentClient.h"
#import "MOZUCommerceReturnsShipmentURLComponents.h"
#import "MozuCommercePackage.h"
#import "MozuShipment.h"


@implementation MOZUCommerceReturnsShipmentClient

//
#pragma mark -
#pragma mark Get Operations
#pragma mark -
//

+ (MOZUClient *)clientForGetShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId {
	id url = [MOZUCommerceReturnsShipmentURLComponents URLComponentsForGetShipmentOperationWithReturnId:returnId shipmentId:shipmentId];
	id verb = @"GET";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];


	client.JSONParser = ^id(NSString *jsonResult) {
		return [[MOZUShipment alloc] initWithString:jsonResult error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Post Operations
#pragma mark -
//

+ (MOZUClient *)clientForCreatePackageShipmentsOperationWithBody:(NSArray *)body returnId:(NSString *)returnId {
	id url = [MOZUCommerceReturnsShipmentURLComponents URLComponentsForCreatePackageShipmentsOperationWithReturnId:returnId];
	id verb = @"POST";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	client.body = body;

	client.JSONParser = ^id(NSString *jsonResult) {
		NSArray *jsonAsArray = [NSJSONSerialization JSONObjectWithData:[jsonResult dataUsingEncoding:NSUTF8StringEncoding] options:kNilOptions error:nil];
		return [MOZUCommercePackage arrayOfModelsFromDictionaries:jsonAsArray error:nil];
	};

	return client;
}


//
#pragma mark -
#pragma mark Put Operations
#pragma mark -
//


//
#pragma mark -
#pragma mark Delete Operations
#pragma mark -
//

+ (MOZUClient *)clientForDeleteShipmentOperationWithReturnId:(NSString *)returnId shipmentId:(NSString *)shipmentId {
	id url = [MOZUCommerceReturnsShipmentURLComponents URLComponentsForDeleteShipmentOperationWithReturnId:returnId shipmentId:shipmentId];
	id verb = @"DELETE";
	MOZUClient *client = [[MOZUClient alloc] initWithResourceURLComponents:url verb:verb];

	return client;
}



@end