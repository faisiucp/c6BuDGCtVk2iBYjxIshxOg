Aftership iOS SDK
=============

## Note

The project requires [AFNetworking](https://github.com/AFNetworking/AFNetworking) and [Mantle](https://github.com/Mantle/Mantle).

## Usage

Prepare the AftershipManager with an API Key.

``` objective-c
AftershipManager *manager = [AftershipManager sharedManager];
[manager registerWithApiKey:@" ===== API KEY ===== "];
```

If we need rate limit handling,

``` objective-c
[manager registerWithApiKey:@" ===== API KEY ===== "
rateLimitHandling:^(int resetTime, int limit, int remaining) {
NSLog(@"Reset time: %i", resetTime);
NSLog(@"Limit: %i", limit);
NSLog(@"Remaining: %i", remaining);

```

Get tracking

``` objective-c
[manager getTrackingWithSlug:@" ===== Slug ===== "
trackingNumber:@" ===== Tracking Number ===== "
params:nil
completion:^(AftershipRequest *request, AftershipResponse *response, 
Tracking *tracking, AftershipError *error) {
//  tracking is the result
}];
  
```

``` objective-c
[manager getTrackingWithTrackingId:@" ===== Tracking ID ===== "
params:nil
completion:^(AftershipRequest *request, AftershipResponse *response, 
Tracking *tracking, AftershipError *error) {
//  tracking is the result
}];

```

Create Tracking

``` objective-c

AftershipCreateTrackingParams *params = [AftershipCreateTrackingParams paramsWithTrackingNumber:@" ===== Tracking Number ===== "];
[params setTitle:@"Testing"];
[params setCustomFields:@{@"111": @"111", @"222": @"222"}];
[manager createTrackingWithParams:params
completion:^(AftershipRequest *request, AftershipResponse *response, 
Tracking *tracking, AftershipError *error) {
//  tracking is the new created Tracking
}];

```

