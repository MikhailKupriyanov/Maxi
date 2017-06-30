//
//  TodayViewController.m
//  MaxiWidget
//
//  Created by mpkupriyanov on 30.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

// Model
#import "MaxiQRCodeKit.h"

@interface TodayViewController () <NCWidgetProviding>
{
    CardManager *_cardManager;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgQRCode;
@property (weak, nonatomic) IBOutlet UILabel *lblNote;
@property (weak, nonatomic) IBOutlet UIButton *btOpenApp;

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _cardManager = [CardManager new];
    [self updateUI];
}

- (void)showCardNumber {
    [self updateUI];
    Card *card = _cardManager.card;
    _imgQRCode.image = card.qrCode;
}

- (IBAction)openApplication:(id)sender {
    NSURL *url = [NSURL URLWithString:@"maxi://"];
    [self.extensionContext openURL:url completionHandler:nil];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    [self showCardNumber];
    
    completionHandler(NCUpdateResultNewData);
}

- (void)updateUI {
    _lblNote.hidden = _btOpenApp.hidden = _cardManager.hasCard;
}

@end
