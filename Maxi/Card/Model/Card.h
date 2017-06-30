//
//  Card.h
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject

@property (nonatomic, strong, readonly) NSString *numberCard;

- (instancetype)initCardWithNumber:(NSString *) numberCard;

@end
