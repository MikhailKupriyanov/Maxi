//
//  QRGenerator.m
//  Maxi
//
//  Created by mpkupriyanov on 30.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "QRGenerator.h"
#import <CoreImage/CoreImage.h>

NSString * const kQRCodeType = @"CIQRCodeGenerator";
CGFloat const kQRCodeSize = 200.0;

@implementation QRGenerator

+ (UIImage *)createQRCodeWithCardNumber:(NSString *) cardNumber {
    NSData *data = [cardNumber dataUsingEncoding:NSASCIIStringEncoding];
    CIFilter *qrCodeFilter = [CIFilter filterWithName:kQRCodeType];
    [qrCodeFilter setValue:data forKey:@"inputMessage"];
    [qrCodeFilter setValue:@"M" forKey:@"inputCorrectionLevel"]; //default of L,M,Q & H modes
    
    CIImage *qrCodeImage = qrCodeFilter.outputImage;
    CGRect imageSize = CGRectIntegral(qrCodeImage.extent);
    CGSize outputSize = CGSizeMake(kQRCodeSize, kQRCodeSize);
    CIImage *imageByTransform = [qrCodeImage imageByApplyingTransform:CGAffineTransformMakeScale(outputSize.width/CGRectGetWidth(imageSize), outputSize.height/CGRectGetHeight(imageSize))];
    
    return [UIImage imageWithCIImage:imageByTransform];
}

@end
