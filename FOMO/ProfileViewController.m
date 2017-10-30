//
//  ProfileViewController.m
//  FOMO
//
//  Created by admin on 10/24/17.
//  Copyright © 2017 kahshe. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@property (weak, nonatomic) IBOutlet UIView *header;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSArray *content;

@end

@implementation ProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupHeader];
    [self setupTableview];
    
    
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
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.content = @[@"Monday", @"Tuesday", @"Wednesday",@"Thursday",@"Friday",@"Saturday", @"Sunday" ];
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 0){
        UIView *v = [UIView new];
        [v setBackgroundColor:[UIColor greenColor]];
        return v;
    } else {
        UIView *v = [UIView new];
        [v setBackgroundColor:[UIColor blueColor]];
        return v;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0){
        return 140;
    } else {
        return 70;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

-  (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.content.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cellIdentifier";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text =  [self.content objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

@end
