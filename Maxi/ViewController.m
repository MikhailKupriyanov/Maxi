//
//  ViewController.m
//  Maxi
//
//  Created by mpkupriyanov on 29.06.17.
//  Copyright © 2017 mpkupriyanov. All rights reserved.
//

#import "ViewController.h"

// Lib
#import "VKSideMenu.h"

// Common
#import "Common.h"

// Model
#import "MaxiQRCodeKit.h"

const CGFloat kMenuWidth = 250.0;
const NSInteger kMenuNumberOfSection = 1;
const NSInteger kMenuNumberOfRows = 8;
const CGFloat kMenuRowHeight = 54.0;

typedef NS_ENUM(NSInteger, SideMenuItem) {
    PromoutionAndDiscountItem,
    ShoppingListItem,
    ClientCardItem,
    HistoryOfPurchaseItem,
    ShopsItem,
    CommentsAndWishesItem,
    MysteryShopperItem,
    ProfileSettingsItem
};

@interface ViewController () <VKSideMenuDelegate, VKSideMenuDataSource>
{
    CardManager *_cardManager;
}
@property (nonatomic, strong) VKSideMenu *menu;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@property (weak, nonatomic) IBOutlet UIButton *btShowCard;
@property (weak, nonatomic) IBOutlet UIImageView *imgDiscountCard;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initialize];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _cardManager = [CardManager new];
    if (_cardManager.hasCard) {
        _imgDiscountCard.hidden = NO;
        _btShowCard.enabled = YES;
    } else {
        _imgDiscountCard.hidden = YES;
        _btShowCard.enabled = NO;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    _cardManager = nil;
}

- (void)initialize {
    self.title = @"О КОМПАНИИ";
    
    [_btShowCard addTarget:self action:@selector(showDiscountCard) forControlEvents:UIControlEventTouchUpInside];
    
    self.menu = [[VKSideMenu alloc] initWithSize:kMenuWidth andDirection:VKSideMenuDirectionFromLeft];
    self.menu.rowHeight = kMenuRowHeight;
    self.menu.textColor = [UIColor whiteColor];
    self.menu.hideOnSelection = NO;
    self.menu.dataSource = self;
    self.menu.delegate   = self;
    [self.menu addSwipeGestureRecognition:self.view];
}

- (IBAction)showMenu:(id)sender {
    [self.menu show];
    [self setupMenu];
}

- (void)setupMenu {
    self.menu.tableView.backgroundColor = maxiBackgroundColor;
    self.menu.tableView.bounces = NO;
}

// Показываем экран добавления карты
- (void)showAddDiscountCard {
    [self performSegueWithIdentifier:@"addCardSegue" sender:nil];
}

// Показываем экран с qr code
- (void)showDiscountCard {
    [self performSegueWithIdentifier:@"discountCardSegue" sender:nil];
}

// MARK: VKSideMenuDataSource

- (NSInteger)numberOfSectionsInSideMenu:(VKSideMenu *)sideMenu {
    return kMenuNumberOfSection;
}

- (NSInteger)sideMenu:(VKSideMenu *)sideMenu numberOfRowsInSection:(NSInteger)section {
    return kMenuNumberOfRows;
}

- (VKSideMenuItem *)sideMenu:(VKSideMenu *)sideMenu itemForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VKSideMenuItem *item = [VKSideMenuItem new];
    
    switch (indexPath.row)
    {
        case PromoutionAndDiscountItem:
            item.title = @"АКЦИИ И СКИДКИ";
            item.icon  = [UIImage imageNamed:@"stockListIcon"];
            break;
            
        case ShoppingListItem:
            item.title = @"СПИСОК ПОКУПОК";
            item.icon  = [UIImage imageNamed:@"shopListIcon"];
            break;
            
        case ClientCardItem:
            item.title = @"КАРТА ПОКУПАТЕЛЯ";
            item.icon  = [UIImage imageNamed:@"cardIcon"];
            break;
            
        case HistoryOfPurchaseItem:
            item.title = @"ИСТОРИЯ ПОКУПОК";
            item.icon  = [UIImage imageNamed:@"historyItem"];
            break;
            
        case ShopsItem:
            item.title = @"МАГАЗИНЫ";
            item.icon = [UIImage imageNamed:@"shopsIcon"];
            break;
            
        case CommentsAndWishesItem:
            item.title = @"ОТЗЫВЫ И ПОЖЕЛАНИЯ";
            item.icon = [UIImage imageNamed:@"reviewIcon"];
            break;
            
        case MysteryShopperItem:
            item.title = @"ТАЙНЫЙ ПОКУПАТЕЛЬ";
            item.icon = [UIImage imageNamed:@"spick"];
            break;
            
        case ProfileSettingsItem:
            item.title = @"НАСТРОЙКИ ПРОФИЛЯ";
            item.icon = [UIImage imageNamed:@"settingseIcon"];
            break;
            
        default:
            break;
    }
    
    return item;
}

// MARK: VKSideMenuDelegate

- (void)sideMenu:(VKSideMenu *)sideMenu didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row)
    {
        case ClientCardItem:
            if (_cardManager.hasCard) {
                [self showDiscountCard];
            } else {
                [self showAddDiscountCard];
            }
            [self.menu hide];
            break;
    }
}

@end
