//
//  SBGoogleLocation.h
//  Spacebib
//
//  Created by lizh on 2020/5/28.
//  Copyright © 2020 Spacebib. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

//typedef void (^locationCompletion) (CLLocation* coor,NSString *city);

@interface SBGoogleLocation : NSObject

@property (nonatomic, strong) locationCompletion completion;

+ (SBGoogleLocation *)shared;

- (void) startLocationCompletion:(locationCompletion) completion;

@end

NS_ASSUME_NONNULL_END
