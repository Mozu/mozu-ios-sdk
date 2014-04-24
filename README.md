# mozu-ios-sdk

### How to install the Mozu iOS SDK.
* The easiest way is to use [CocoPods](http://cocoapods.org).
* Add this to your Podfile: (When we exit beta period we'll submit our Pod to CocoaPods so you won't need the explicit refrence to git repo)

		pod 'mozu-ios-sdk', :git => 'https://github.com/Mozu/mozu-ios-sdk.git'
* Run

		pod update

### How to authenticate your app.
* Obtain your authentication host, app secret and shared secret from the Mozu developer portal.
* Add this to your app:

		MOZUAppAuthInfo *appAuthInfo = [MOZUAppAuthInfo new];
	    appAuthInfo.ApplicationId = <YOUR APP ID>
	    appAuthInfo.SharedSecret = <YOUR SHARED SECRET>
	    NSString *authenticationHost = <YOUR AUTHENTICATION HOST DOMAIN>
	    
	    
	    [[MOZUAppAuthenticator sharedAppAuthenticator] authenticateWithAuthInfo:appAuthInfo
	                                                                    appHost:authenticationHost
	                                                                     useSSL:YES
	                                                             refeshInterval:nil
	                                                          completionHandler:^(NSHTTPURLResponse *response, MOZUAPIError *error)
	     {

	     }];

### How to authenticate your user.
* Prompt user for username (i.e. email address) and password.
* Add this to your app:

	    MOZUUserAuthInfo *userAuthInfo = [MOZUUserAuthInfo new];
	    userAuthInfo.emailAddress = emailAddress;
	    userAuthInfo.password = password;
	
		[[MOZUUserAuthenticator sharedUserAuthenticator] authenticateWithUserAuthInfo:userAuthInfo
		                                                                     scope:MOZUTenantAuthenticationScope
		                                                                identifier:nil
		                                                         completionHandler:^(MOZUAuthenticationProfile *profile, NSHTTPURLResponse *response, MOZUAPIError *error)
		{

		}];
