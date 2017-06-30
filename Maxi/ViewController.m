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

const CGFloat kMenuWidth = 260.0;
const NSInteger kMenuNumberOfSection = 1;
const NSInteger kMenuNumberOfRows = 8;
const CGFloat kMenuRowHeight = 54.0;

@interface ViewController () <VKSideMenuDelegate, VKSideMenuDataSource>
@property (nonatomic, strong) VKSideMenu *menu;
@property (weak, nonatomic) IBOutlet UITextView *tvDescription;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initialize];
}

- (void)viewDidLayoutSubviews {
    [self.tvDescription setContentOffset:CGPointZero animated:NO];
}

- (void)initialize {
    self.menu = [[VKSideMenu alloc] initWithSize:kMenuWidth andDirection:VKSideMenuDirectionFromLeft];
    self.menu.rowHeight = kMenuRowHeight;
    self.menu.textColor = [UIColor darkGrayColor];
    self.menu.hideOnSelection = NO;
    self.menu.dataSource = self;
    self.menu.delegate   = self;
    [self.menu addSwipeGestureRecognition:self.view];
    
    self.tvDescription.clipsToBounds = NO;
    self.tvDescription.scrollIndicatorInsets = UIEdgeInsetsMake(0, 0, 0, -20);
}

- (IBAction)showMenu:(id)sender {
    [self.menu show];
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
        case 0:
            item.title = @"АКЦИИ И СКИДКИ";
            item.icon  = [UIImage imageNamed:@"discount"];
            break;
            
        case 1:
            item.title = @"СПИСОК ПОКУПОК";
            item.icon  = [UIImage imageNamed:@"check-list"];
            break;
            
        case 2:
            item.title = @"КАРТА ПОКУПАТЕЛЯ";
            item.icon  = [UIImage imageNamed:@"card"];
            break;
            
        case 3:
            item.title = @"ИСТОРИЯ ПОКУПОК";
            item.icon  = [UIImage imageNamed:@"history-purchase-list"];
            break;
        
        case 4:
            item.title = @"МАГАЗИНЫ";
            item.icon  = [UIImage imageNamed:@"ic_option_4"];
            break;
            
        case 5:
            item.title = @"ОТЗЫВЫ И ПОЖЕЛАНИЯ";
            item.icon  = [UIImage imageNamed:@"ic_option_4"];
            break;
            
        case 6:
            item.title = @"ТАЙНЫЙ ПОКУПАТЕЛЬ";
            item.icon  = [UIImage imageNamed:@"ic_option_4"];
            break;
            
        case 7:
            item.title = @"НАСТРОЙКИ ПРОФИЛЯ";
            item.icon  = [UIImage imageNamed:@"ic_option_4"];
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
        case 2:
            [self performSegueWithIdentifier:@"addCardSegue" sender:nil];
            [self.menu hide];
            break;
    }
}

@end
