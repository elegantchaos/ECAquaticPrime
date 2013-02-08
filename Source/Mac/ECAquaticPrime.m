// --------------------------------------------------------------------------
//  Copyright 2013 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

#import "ECAquaticPrime.h"

#include "AquaticPrime.h"

@implementation ECAquaticPrime

- (id) initWithKey: (NSString*) key
{
	if ((self = [super init]) != nil)
	{
		APSetKey((CFStringRef) key);
	}
	
	return self;
}

- (BOOL) importLicenseFromURL: (NSURL*) url
{
	NSData* data = [NSData dataWithContentsOfURL: url];
	BOOL valid = APVerifyLicenseData((CFDataRef) data);
	if (valid)
	{
		[[NSUserDefaults standardUserDefaults] setValue: data forKey: @"License"];
	}
	return valid;
}

- (void) clearLicense
{
	[[NSUserDefaults standardUserDefaults] removeObjectForKey: @"License"];

}

- (NSData*) licenseData
{
	NSData* data = [[NSUserDefaults standardUserDefaults] objectForKey: @"License"];
	
	return data;
}
- (BOOL) isValid
{
	return APVerifyLicenseData((CFDataRef) [self licenseData]);
}

- (NSDictionary*) info
{
	NSDictionary* info = (NSDictionary*) APCreateDictionaryForLicenseData((CFDataRef) [self licenseData]);
	
	return [info autorelease];
}

- (NSString*) user
{
	NSString* user = nil;

	NSDictionary* info = [self info];
	if (info)
	{
		user = info[@"Name"];
	}
	
	return user;
}

- (NSString*) email
{
	NSString* email = nil;
	
	NSDictionary* info = [self info];
	if (info)
	{
		email = info[@"Email"];
	}
	
	return email;	
}

- (NSString*) status
{
    NSString* status;
    
    if ([self isValid])
    {
        NSDictionary* info = [self info];
        status = [NSString stringWithFormat: @"Licensed to %@ (%@)", info[@"Name"], info[@"Email"]];
    }
    else
    {
        status = [super status];
    }
    
    return status;
}


@end
