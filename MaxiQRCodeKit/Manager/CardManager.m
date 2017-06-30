//
//  CardManager.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "CardManager.h"

// Model
#import "Card.h"

NSString * const kCardNumberName = @"customCardNumber";
NSString * const kAppGroupName = @"group.com.maxi";

@interface CardManager ()
{
    bool _hasCard;
    Card *_card;
    NSUserDefaults *_group;
}
@end

@implementation CardManager

- (instancetype)init {
    if (self = [super init]) {
        _group = [[NSUserDefaults standardUserDefaults] initWithSuiteName:@"group.com.maxi"];
        _hasCard = [self restoreCard];
    }
    return self;
}

- (void)addCardNumber:(NSString *) cardNumber {
    if (_card) {
        _card = nil;
    }
    _card = [self createCardWithNumber:cardNumber];
    [_group setObject:_card.numberCard forKey:kCardNumberName];
    _hasCard = YES;
}

- (void)removeCard {
    _card = nil;
    [_group removeObjectForKey:kCardNumberName];
    _hasCard = NO;
}

- (BOOL)restoreCard {
    NSString *cardNumber = (NSString *)[_group objectForKey:kCardNumberName];
    _card = [self createCardWithNumber:cardNumber];
    
    return _card ? YES : NO; // Если карта загружена/существует return YES
}

- (Card *)createCardWithNumber:(NSString *) cardNumber {
    if (cardNumber) {
        return [[Card alloc] initCardWithNumber:cardNumber];
    }
    return nil;
}

@end
