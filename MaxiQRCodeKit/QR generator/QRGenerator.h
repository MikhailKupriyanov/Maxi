//
//  QRGenerator.h
//  Maxi
//
//  Created by mpkupriyanov on 30.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface QRGenerator : NSObject

+ (UIImage *)createQRCodeWithCardNumber:(NSString *) cardNumber;

@end
