
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
#import "MOZUSubscribingTenant.h"



@protocol MOZUSubscription
@end


/**
	The subscription entity used to provide event notifications for third-parties.
*/
@interface MOZUSubscription : JSONModel<MOZUSubscription>

/**
ApiVersion
*/
@property(nonatomic) NSString * apiVersion;

/**
Unique identifier of an app available in your Mozu tenant or within Mozu Dev Center. This ID is unique across all apps installed, initialized, and enabled in the Mozu Admin and those in development through the Dev Center Console.
*/
@property(nonatomic) NSString * appId;

/**
A boolean value that indicates if the subscription endpoint has been confirmed
*/
@property(nonatomic) NSNumber * confirmed;

/**
Content type of the payload that will be delivered.  This is utilized in combination with the notification delivery type.  Example:  A HTTP Post (notification delivery type) is performed with a JSON representation of the event data (content type).
*/
@property(nonatomic) NSString * contentType;

/**
Identifier of the user that created the object. System created and read only.
*/
@property(nonatomic) NSString * createBy;

/**
The date time in UTC format set when the object was created. 
*/
@property(nonatomic) NSDate * createDate;

/**
The delivery endpoint that will receive notifications when events concerning the specified topics on the subscription occur.  The format of the endpoint may differ depending on the notification type.  For example, the endpoint may be a URL in some cases and an email address in others if multiple notification types are available.
*/
@property(nonatomic) NSString * endpoint;

/**
Unique identifier of the source product property. For a product field it will be the name of the field. For a product attribute it will be the Attribute FQN. 
*/
@property(nonatomic) NSString * id;

/**
Indicates if the object or feature is active. This indicator is used for subscriptions (at the site or tenant level), customer accounts, products and variations.
*/
@property(nonatomic) NSNumber * isActive;

/**
A boolean value that indicates if events should be delivered that resulted from an API call by the application.  If true, any events that occur as a result of a direct API call by the same application will not be delivered. This can prevent an endless loop in certain scenarios.
*/
@property(nonatomic) NSNumber * noCallback;

/**
Notification delivery type which is a string representation of an enumeration of values.  Example: Http (this is case insensitive, so http may also be passed in)
*/
@property(nonatomic) NSString * notificationDeliveryType;

/**
A list of topics that the subscription relates to
*/
@property(nonatomic) NSArray *topics;

/**
Identifier of the user that updated the entity most recently.
*/
@property(nonatomic) NSString * updateBy;

/**
The date and time the object was updated most recently. The date is in UTC format.
*/
@property(nonatomic) NSDate * updateDate;

/**
This is a tenant that is associated with a subscription.
*/
@property(nonatomic) NSArray<MOZUSubscribingTenant> *subscribingTenants;

@end

