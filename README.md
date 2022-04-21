

# ESGame IOS SDK !

This document demonstrades ESGame SDK for IOS.


# Prequiresites

- Xcode
- ESGame client id
- ESGame client secret
- Google service json file
- Facebook id and facebook client token
- Appsflyer development key
# Functionality
SDK provide some functionality below:
- ESGame normal login: use email/account and password
- Fast login : use deviceId 
- Sign-in with Apple
- Log-in with Facebook
- Log-in with Google
- Google in-app billing
- Apple in-app purchase
- Third-party payment (should only use with non Google version)
- Analystic ( Firebase, Facebook, Appslyer)

# SDK Config

## es_property.plist
ESGame has few parameters
|Property               |Description                          |Provider                         |
|----------------|-------------------------------|-----------------------------|
|es_appflyer_dev_key|`Appsflyer development key`            |ESGame|
|es_client_id|`Esgame client id`            |ESGame|
|es_client_secret|`Esgame client secret`            |ESGame|
|es_gg_client_id|`Google client id, we can get it from key CLIENT_ID from google info plist file with`            |ESGame|

# Info.plist
You need modify some attributes in Info.plist

- Add facebook schema (format fb+ facebookId) and google resversed id (you can get it from key REVERSED_CLIENT_ID in GoogleService-Info.plist) to  CFBundleURLSchemes , for example
		
		<array>
		<dict>
			<key>CFBundleURLSchemes</key>
			<array>
				<string>fb682118789108627</string>
				<string>com.googleusercontent.apps.1034628364602-0sbkc4vbcrp2uj1cpedbfroj8f89vv51</string>
			</array>
		</dict>
		</array>

- Add facebook's id to FacebookAppID, for example :

		<key>FacebookAppID</key>
		<string>682118789108627</string>
		<key>FacebookDisplayName</key>
		<string>$(PRODUCT_NAME)</string>
- Add Facebook application queries schemas:

		<key>LSApplicationQueriesSchemes</key>
		<array>
		<string>fbapi</string>
		<string>fbapi20130214</string>
		<string>fbapi20130410</string>
		<string>fbapi20130702</string>
		<string>fbapi20131010</string>
		<string>fbapi20131219</string>
		<string>fbapi20140410</string>
		<string>fbapi20140116</string>
		<string>fbapi20150313</string>
		<string>fbapi20150629</string>
		<string>fbapi20160328</string>
		<string>fbauth</string>
		<string>fb-messenger-share-api</string>
		<string>fbauth2</string>
		<string>fbshareextension</string>
		</array>
- Add NSCameraUsageDescription,NSUserTrackingUsageDescription,SKAdNetworkItems:
	
		<key>NSCameraUsageDescription</key>
		<string>Chúng tôi sử dụng camera để update avatar ingame và tính năng báo lỗi.</string>
		<key>NSUserTrackingUsageDescription</key>
		<string>$(PRODUCT_NAME) cần xin quyền AppTrackingTransparency để giúp bạn trải nghiệm trò chơi tốt hơn và chia sẻ nội dung cập nhật mới nhất thông qua quảng cáo cá nhân</string>
		<key>SKAdNetworkItems</key>
		<array>
			<dict>
				<key>SKAdNetworkIdentifier</key>
				<string>v9wttpbfk9.skadnetwork</string>
			</dict>
			<dict>
				<key>SKAdNetworkIdentifier</key>
				<string>n38lu8286q.skadnetwork</string>
			</dict>
		</array>


# Intergration

- Copy esgameparameters.xml to your project
- Merge proguard-rules.pro to your project.
- Import google-service.json to your project.
- Merge AndroidManifest.xml to your project.
- Merge gradle.build to your project.

## Coding
Init sdk:

    protected void onCreate(Bundle var1) {  
    this.requestWindowFeature(1);  
	 super.onCreate(var1);  
	 ...
	 ESGameSDK.init(this, this);  
	 ESGameSDK.getInstance().handleIntent(getIntent());  
	 ...
	}
	@Override  
	protected void onDestroy() {  
    super.onDestroy();  
	  ESGameSDK.getInstance().onDestroy();  
	}  
  
	@Override  
	protected void onActivityResult(int requestCode, int resultCode, @Nullable Intent data) {  
    super.onActivityResult(requestCode, resultCode, data); 
	ESGameSDK.getInstance().onActivityResult(requestCode, resultCode, data);  
	}

Implement ESGame's callback:

> void onLoginSuccess(String message, int code, User user)

Login success callback

|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|message|String            |message from server|
|code|Integer            |response code from server|
|user|User            |User information|

> void onLoginFailure(String message, int code)

Log-in failure callback
|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|message|String            |message of error from server|
|code|Integer            |error code from server|

> void onLogout()

Log-out callback

> void onGGBillingResult(boolean success, String sku, String orderId)

Google billing  callback
|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|success|Boolean            |Transaction success or not|
|sku|String            |product's identifier|
|orderId|String            |Order's identifier|

> void onWebBillingResult(String itemId, int price)

Thirt-party payment  callback
|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|itemId|String            |product's identifier|
|price|Integer            |Product's price|

> void onUserInfoChange(User user)

User's information  callback
|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|itemId|String            |product's identifier|
|price|Integer            |Product's price|


## Command

ESGame'SDK provide some methods:

- ESGameSDK.getInstance().login()
ESGame will open Login view if user was not login in the past, or let user login.
- ESGameSDK.getInstance().logout()
Let user log-out.
- ESGameSDK.getInstance().inAppBillingWithSkuType(productID, sku_type ,server_id, player_id,extra_data);
Google billing payment method.

|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|productID|String            |product's identifier|
|sku_type|BillingClient.SkuType            |Product's type|
|server_id|String            |Server' identifier|
|player_id|String            |ESGame Player's identifier|
|extra_data|String            |ESGame Transaction's information|

- ESGameSDK.getInstance().inAppBillingWeb(productID ,server_id, player_id,extra_data);
Web payment method.

|Property               |Type                          |Description                         |
|----------------|-------------------------------|-----------------------------|
|productID|String            |product's identifier|
|server_id|String            |Server' identifier|
|player_id|String            |ESGame Player's identifier|
|extra_data|String            |ESGame Transaction's information|
```
  
