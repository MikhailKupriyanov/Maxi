//
//  CardViewController.m
//  Maxi
//
//  Created by mpkupriyanov on 04.07.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "CardViewController.h"

// Model
#import "MaxiQRCodeKit.h"

@interface CardViewController ()
{
    CGFloat brightness;
    CardManager *_cardManager;
}

@property (weak, nonatomic) IBOutlet UIImageView *imgQRCode;
@property (weak, nonatomic) IBOutlet UILabel *lblCardNumber;
@property (weak, nonatomic) IBOutlet UITextView *tvNote;

@end

@implementation CardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"КАРТА ПОКУПАТЕЛЯ";
    
    brightness = [UIScreen mainScreen].brightness;
    [self increaseBrightness];
    
    [self initialize];
}

- (void)initialize {
    _cardManager = [CardManager new];
    if (_cardManager.hasCard) {
        Card *card = _cardManager.card;
        _imgQRCode.image = card.qrCode;
        _lblCardNumber.text = card.numberCard;
    }
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(normalBrightness) name:UIApplicationWillResignActiveNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(increaseBrightness) name:UIApplicationDidBecomeActiveNotification object:nil];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self normalBrightness];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (void)increaseBrightness {
    [UIScreen mainScreen].brightness = 0.8;
}

- (void)normalBrightness {
    [UIScreen mainScreen].brightness = brightness;
}

@end
