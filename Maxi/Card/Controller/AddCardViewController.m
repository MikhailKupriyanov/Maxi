//
//  AddCardViewController.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "AddCardViewController.h"

// Model
#import "QRGenerator.h"

#import "ViewController.h"

@interface AddCardViewController () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *tfInputCardNumber;
@property (weak, nonatomic) IBOutlet UIButton *btSubmitCard;
@property (weak, nonatomic) IBOutlet UIImageView *imgQRCode;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tfInputCardNumber becomeFirstResponder];
    _tfInputCardNumber.delegate = self;
    
}

- (IBAction)submitCardNumber:(id)sender {
    NSString *code = _tfInputCardNumber.text;
    _imgQRCode.image = [QRGenerator createQRCodeWithCardNumber:code];
}

// MARK: UITextFieldDelegate

// TODO: Проверка на количество символов в коде и что только числа

@end
