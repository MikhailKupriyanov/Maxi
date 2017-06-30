//
//  Card.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "Card.h"

// Model
#import "QRGenerator.h"

@interface Card () <NSCoding>
@property (nonatomic, strong, readwrite) NSString *numberCard;
@property (nonatomic, strong, readwrite) UIImage *qrCode;
@end

@implementation Card

- (instancetype)initCardWithNumber:(NSString *) numberCard {
    if (self = [super init]) {
        _numberCard = numberCard;
        [self initialize];
    }
    return self;
}

- (void)initialize {
    _qrCode = [QRGenerator createQRCodeWithCardNumber:_numberCard];
}

- (instancetype)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        _numberCard = [decoder decodeObjectForKey:@"number_card"];
        [self initialize];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:_numberCard forKey:@"number_card"];
}

@end
