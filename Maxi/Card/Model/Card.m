//
//  Card.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "Card.h"

@interface Card ()
@property (nonatomic, strong, readwrite) NSString *numberCard;
@end

@implementation Card

- (instancetype)initCardWithNumber:(NSString *) numberCard {
    if (self = [super init]) {
        _numberCard = numberCard;
    }
    return self;
}

@end
