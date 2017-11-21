//
//  ProfileViewController.m
//  FOMO
//
//  Created by admin on 10/24/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "ProfileViewController.h"
#import "CreditcardTableViewCell.h"
#import "ProfileHeaderView.h"
#import "ProfileSecondHeaderView.h"
#import "CreditcardTableViewCell.h"
#import "PaymentOptionsViewController.h"
#import "ChangeLocationViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *content;
@property (weak, nonatomic) IBOutlet UIButton *logOutButton;

@end

@implementation ProfileViewController

static NSString *cellIdentifier0 = @"cell0";
static NSString *cellIdentifier1 = @"cell1";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self setupTableview];
    [self registerCells];
}

- (void)registerCells {
    [self.tableView registerNib:[UINib nibWithNibName:@"CreditcardTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier0];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BarTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier1];
}

- (void)setupHeader{
    self.header.clipsToBounds = NO;
    self.header.layer.masksToBounds = NO;
    self.header.layer.shadowColor = [UIColor blackColor].CGColor;
    self.header.layer.shadowOpacity = 0.5f;
    self.header.layer.shadowRadius = 1.5f;
    self.header.layer.shadowOffset = CGSizeMake(0.0f, 2.0f);
    [self.view bringSubviewToFront:self.header];
}

- (void)setupTableview {
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.content = @[@"Chris", @"Jones"];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier0];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"CreditcardTableViewCell" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    } else {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier1];
        if (cell == nil) {
            NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"BarTableViewCell" owner:self options:nil];
            cell = [topLevelObjects objectAtIndex:0];
        }
        return cell;
    }
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0){
        ProfileHeaderView *backgroundView = [[ProfileHeaderView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 130)];
        return backgroundView;
    } else {
        ProfileSecondHeaderView *backgroundView = [[ProfileSecondHeaderView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 70)];
        return backgroundView;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return 130;
    } else {
        return 70;
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [self setupFooterButtonWithSection:section];
    return view;
}

- (UIView *)setupFooterButtonWithSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, 50)];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    if (section == 0){
        [button setTitle:@"PAYMENT OPTIONS" forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(paymentOptionsTapped)
         forControlEvents:UIControlEventTouchUpInside];
    } else {
        [button setTitle:@"CHANGE LOCATION" forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(changeLocationTapped)
         forControlEvents:UIControlEventTouchUpInside];
    }
    button.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:130.0/255.0 blue:0 alpha:1];
    button.frame = CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width - 20, 30.0);
    button.layer.cornerRadius = button.bounds.size.height/2;
    [view addSubview:button];
    button.center = view.center;
    view.backgroundColor = [UIColor whiteColor];
    return view;
}

- (void)paymentOptionsTapped {
    PaymentOptionsViewController * viewController = [[PaymentOptionsViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (void)changeLocationTapped {
     ChangeLocationViewController* viewController = [[ChangeLocationViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 50;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0){
        return 50;
    } else {
        return 80;
    }
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

- (IBAction)logOutButtonTapped:(id)sender {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"nah" forKey:@"didILogIn"];
    [defaults synchronize];
}

@end
