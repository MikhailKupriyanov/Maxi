//
//  CardManager.h
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import <Foundation/Foundation.h>

// Model
@class Card;

@interface CardManager : NSObject

@property (nonatomic, assign, readonly) bool hasCard;

@property (nonatomic, strong, readonly) Card *card;

/**
 Добавляем номер дисконтной карты

 @param cardNumber Номер карты
 */
- (void)addCardNumber:(NSString *) cardNumber;


/**
 Отвязываем дисконтную карту
 */
- (void)removeCard;

@end
