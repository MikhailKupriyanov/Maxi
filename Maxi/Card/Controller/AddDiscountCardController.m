//
//  AddDiscountCardController.m
//  Maxi
//
//  Created by mpkupriyanov on 03.07.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "AddDiscountCardController.h"

// Model
#import "MaxiQRCodeKit.h"

// Pod
#import <NSStringMask/UITextFieldMask.h>

// Common
#import "Common.h"

@interface AddDiscountCardController () <UITextFieldDelegate>
{
    CardManager *_cardManager;
}
@property (weak, nonatomic) IBOutlet UITextFieldMask *tfInputCardNumber;
@property (weak, nonatomic) IBOutlet UITextView *tvNote;
@property (weak, nonatomic) IBOutlet UISwitch *swAgree;
@property (weak, nonatomic) IBOutlet UIButton *btSubmitCard;
@end

@implementation AddDiscountCardController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"КАРТА ПОКУПАТЕЛЯ";
    [self initialize];
    
}

- (void)initialize {
    _tfInputCardNumber.layer.cornerRadius = 6.0;
    _tfInputCardNumber.layer.borderWidth = 1.0;
    _tfInputCardNumber.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    _tfInputCardNumber.mask = [[NSStringMask alloc] initWithPattern:@"(\\d{2}) (\\d{2}) (\\d{2}) (\\d{2})" placeholder:@"_"];
    _tfInputCardNumber.delegate = self;
    
    _tvNote.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, -15);

    _btSubmitCard.layer.cornerRadius = 3.0;
    
    _cardManager = [CardManager new];

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap)];
    [self.view addGestureRecognizer:tap];
    
//    [self setupButton:_btSubmitCard];
//    [self setupButton:_btRemoveCard];
//    
//    [self updateUI];
}

- (void)handleTap {
    [self.view endEditing:YES];
}

// Привязываем карту
- (IBAction)submitCardNumber:(id)sender {
    if (_tfInputCardNumber.text.length == 0) {
        [self showErrorMessage:@"Введите номер карты"];
        return;
    }
    
    if (!_swAgree.isOn) {
        [self showErrorMessage:@"Подтвердите, что Вы - владелец указанной выше карты."];
        return;
    }
    
    NSString *code = _tfInputCardNumber.text;
    [_cardManager addCardNumber:code];
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)showErrorMessage:(NSString *) message {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [okAction setValue:maxiBackgroundColor forKey:@"titleTextColor"];
    [alert addAction:okAction];
    [self presentViewController:alert animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
