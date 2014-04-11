// --------------------------------------------------------------------------
//  Copyright 2014 Sam Deane, Elegant Chaos. All rights reserved.
//  This source code is distributed under the terms of Elegant Chaos's
//  liberal license: http://www.elegantchaos.com/license/liberal
// --------------------------------------------------------------------------

/** Licensing support for ECAquaticPrime
 *
 */

@interface ECAquaticPrime : ECLicenseChecker

- (id) initWithKey: (NSString*) key;
- (BOOL) importLicenseFromURL: (NSURL*) url;
- (void) clearLicense;
- (NSData*) licenseData;
- (BOOL) isValid;
- (NSDictionary*) info;
- (NSString*) user;
- (NSString*) email;
- (NSString*) status;
@end
