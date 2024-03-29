//
//  AccountManager.m
//  FieldWork
//
//  Created by Samir Kha on 05/01/2013.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "AccountManager.h"

NSString *kActiveUserKey = @"EncodedActiveFieldworkUser";

@implementation AccountManager

-(NSString*)accountFilename
{
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, TRUE) lastObject];
    return [documentsPath stringByAppendingPathComponent:@"FieldworkAccountInformation.dat"];
}

-(id)init
{
    self = [super init];
    
    if (self)
    {
        NSData *accountData = [[NSUserDefaults standardUserDefaults] objectForKey:kActiveUserKey];
        
        if (accountData)
        {
            _activeAccount = [NSKeyedUnarchiver unarchiveObjectWithData:accountData];
        }
        
        _savedAccounts = [NSKeyedUnarchiver unarchiveObjectWithFile:[self accountFilename]];
        
        if (_savedAccounts == nil)
            _savedAccounts = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}


+ (AccountManager*) Instance {
    static AccountManager *__sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        __sharedInstance = [[AccountManager alloc] init];
    });
    
    return __sharedInstance;
}

-(void)saveAccounts
{
    [NSKeyedArchiver archiveRootObject:_savedAccounts toFile:[self accountFilename]];
}

-(void)saveAccount
{
    NSData *data = nil;
    
    if (_activeAccount)
        data = [NSKeyedArchiver archivedDataWithRootObject:_activeAccount];
    
    if (data)
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:kActiveUserKey];
    else
        [[NSUserDefaults standardUserDefaults] removeObjectForKey:kActiveUserKey];
    
    if (_activeAccount)
    {
        [_savedAccounts setObject:_activeAccount forKey:_activeAccount.userName];
        [self saveAccounts];
    }
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark Properties

@synthesize activeAccount = _activeAccount;

-(void)setActiveAccount:(FieldWorkAccount *)activeAccount
{
    _activeAccount = activeAccount;
    
    [self saveAccount];
}

@end
