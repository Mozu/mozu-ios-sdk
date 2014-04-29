
/*
* <auto-generated>
*     This code was generated by a tool.     
*
*     Changes to this file may cause incorrect behavior and will be lost if
*     the code is regenerated.
* </auto-generated>
*/

#import <Foundation/Foundation.h>
#import "JSONModel.h"
#import "MOZUAuditInfo.h"
#import "MOZUChangeMessage.h"
#import "MOZUPackageItem.h"
#import "MOZUPackageMeasurements.h"



@protocol MOZUCommercePackage
@end


/**
	Properties of a physical package shipped for an order.
*/
@interface MOZUCommercePackage : JSONModel<MOZUCommercePackage>

/**
The actions that a user can perform for a package at this time.
*/
@property(nonatomic) NSArray *availableActions;

/**
The date and time the package shipped to the customer.
*/
@property(nonatomic) NSDate * fulfillmentDate;

@property(nonatomic) NSString * fulfillmentLocationCode;

/**
Unique identifier of a package.
*/
@property(nonatomic) NSString * id;

/**
The package type associated with this physical package. Possible values include Tube, Letter, Pak, Small Box (carrier_box_small), Medium Box (carrier_box_medium), Large Box (carrier_box_large), or Custom.
*/
@property(nonatomic) NSString * packagingType;

/**
Unique identifier of the shipment associated with this package.
*/
@property(nonatomic) NSString * shipmentId;

/**
The code associated with the carrier's shipping method service type. Service type codes include a prefix that indicates the carrier. For example: FEDEX_INTERNATIONAL_STANDARD
*/
@property(nonatomic) NSString * shippingMethodCode;

/**
Name of the shipping method associated with the package. For example: UPS Ground or 2nd Day Air.
*/
@property(nonatomic) NSString * shippingMethodName;

/**
Status of the package, which is "Fulfilled" or "NotFulfilled".
*/
@property(nonatomic) NSString * status;

/**
Tracking number for the package supplied by the carrier.
*/
@property(nonatomic) NSString * trackingNumber;

/**
Identifier and datetime stamp information recorded when a user or application creates, updates, or deletes a resource entity. This value is system-supplied and read-only.
*/
@property(nonatomic) MOZUAuditInfo *auditInfo;

@property(nonatomic) NSArray<MOZUChangeMessage> *changeMessages;

/**
An array list of objects in the returned collection.
*/
@property(nonatomic) NSArray<MOZUPackageItem> *items;

/**
Dimensional properties of the package.
*/
@property(nonatomic) MOZUPackageMeasurements *measurements;

@end

