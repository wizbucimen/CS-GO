//
//  SharedVariables.m
//  NoteApp
//
//  Created by Wizbu on 2.03.2017.
//  Copyright © 2017 Wizbu. All rights reserved.
//

#import "SharedVariables.h"

@implementation SharedVariables

static SharedVariables *_shared = nil;


+(SharedVariables *)sharedObject{
    @synchronized([SharedVariables class]){
        if(!_shared) {
            (void)[[self alloc] init];
        }
        return _shared;
    }
    return nil;
}

+(id) alloc {
    @synchronized([SharedVariables class]) {
        NSAssert(_shared == nil, @"Attempted to allocate second instance");
        _shared = [super alloc];
        return _shared;
    }
    return nil;
}

+(id) init {
    [super init];
    if(self != nil) {
    }
    return self;
}
@end
