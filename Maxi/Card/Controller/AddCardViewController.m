//
//  AddCardViewController.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "AddCardViewController.h"

// Model
#import "MaxiQRCodeKit.h"

const NSUInteger kCardNumberLength = 8;

@interface AddCardViewController () <UITextFieldDelegate>
{
    CardManager *_cardManager;
}
@property (weak, nonatomic) IBOutlet UITextField *tfInputCardNumber;
@property (weak, nonatomic) IBOutlet UIButton *btSubmitCard;
@property (weak, nonatomic) IBOutlet UIButton *btRemoveCard;
@property (weak, nonatomic) IBOutlet UIImageView *imgQRCode;
@property (weak, nonatomic) IBOutlet UILabel *lblCardNumber;

@end

@implementation AddCardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tfInputCardNumber.delegate = self;
    _cardManager = [CardManager new];
    [self setupButton:_btSubmitCard];
    [self setupButton:_btRemoveCard];
    [self updateUI];
}

- (void)setupButton:(UIButton *) button {
    button.layer.cornerRadius = 6.0;
    button.layer.borderWidth = 1.0;
    button.layer.borderColor = [UIColor darkTextColor].CGColor;
    
}

// Привязываем карту
- (IBAction)submitCardNumber:(id)sender {
    NSString *code = _tfInputCardNumber.text;
    [_cardManager addCardNumber:code];
    [self updateUI];
    [self showCardNumber];
}

// Отвязываем карту
- (IBAction)removeCardNumber:(id)sender {
    [_cardManager removeCard];
    _imgQRCode.image = nil;
    _lblCardNumber.text = nil;
    [self updateUI];
}

- (void)showCardNumber {
    Card *card = _cardManager.card;
    _imgQRCode.image = card.qrCode;
    _lblCardNumber.text = card.numberCard;
}

- (void)updateUI {
    _tfInputCardNumber.text = @"";
    if (_cardManager.hasCard) {
        [self showCardNumber];
        _tfInputCardNumber.hidden = YES;
        _btSubmitCard.hidden = YES;
        _btRemoveCard.hidden = NO;
        [_tfInputCardNumber resignFirstResponder];
    } else {
        _tfInputCardNumber.hidden = NO;
        _btSubmitCard.hidden = NO;
        _btSubmitCard.enabled = NO;
        _btRemoveCard.hidden = YES;
        [_tfInputCardNumber becomeFirstResponder];
        _imgQRCode.image = [UIImage imageNamed:@"maxi-icon"];
    }
}

// MARK: UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSUInteger newLength = textField.text.length + string.length - range.length;
    
    if (newLength <= kCardNumberLength) {
        if (newLength == kCardNumberLength) {
            _btSubmitCard.enabled = YES;
        } else {
            _btSubmitCard.enabled = NO;
        }
        return YES;
    }
    return NO;
}

@end
