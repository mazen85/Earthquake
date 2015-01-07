//
//  ViewController.m
//  Earthquake
//
//  Created by Mazen Wadea on 1/12/14.
//  Copyright (c) 2014 Mazen Kasser. All rights reserved.
//

#import "ViewController.h"
#import "EarthquakeAPIManager.h"
#import "Earthquake.h"
#import "QuakeCell.h"
#import "MapViewController.h"

@interface ViewController () <UIActionSheetDelegate> {
    MBProgressHUD *hud;
    UIRefreshControl *refreshControl;
    NSArray *quakes;
    __weak IBOutlet UIBarButtonItem *filterIntensity;
    NSString *selectedIntensity;;
}

@end

@implementation ViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerNib:[UINib nibWithNibName:@"QuakeCell" bundle:[NSBundle mainBundle]]
        forCellReuseIdentifier:@"QuakeCell"];
    [self getEarthQuakes:kAllRange];
    [self addRefreshControl];
    filterIntensity.title = All;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)getEarthQuakes:(NSString *)query {
    
    hud = [MBProgressHUD showHUDAddedTo:self.view animated:NO];
    [EarthquakeAPIManager GETquakesWithQuery:query completionHandler:^(Earthquake *result, NSError *error) {
        if (error) {
            hud.labelText = @"Error";
            [Utilities hideCustomHUD:self.view afterDelay:3];
        } else {
            quakes = [result.earthquakes allObjects];
            [self.tableView reloadData];
            NSLog(@"earthquakes %lu", (unsigned long)quakes.count);
            [Utilities hideCustomHUD:self.view afterDelay:0];
        }
        
        if (refreshControl.isRefreshing)
            [refreshControl endRefreshing];
        
    }];
}

- (void)addRefreshControl {
    refreshControl = [[UIRefreshControl alloc] init];
    [refreshControl addTarget:self action:@selector(handleRefresh:) forControlEvents:UIControlEventValueChanged];
    refreshControl.backgroundColor = [UIColor whiteColor];
    [self.tableView addSubview:refreshControl];
}

- (void) handleRefresh:(UIRefreshControl *)refresh {
    if (!selectedIntensity) selectedIntensity = kAllRange;
    [self performSelectorInBackground:@selector(getEarthQuakes:) withObject:selectedIntensity];
}


#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 120;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return quakes.count;
}



- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell;
    cell = [self loadQuakeCell:tableView cellForRowAtIndexPath:indexPath];
    return cell;
}

- (QuakeCell *)loadQuakeCell:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"QuakeCell";
    QuakeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.quake = quakes[indexPath.row];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    MapViewController *mapVC = [self.storyboard instantiateViewControllerWithIdentifier:@"MapViewController"];
    mapVC.selectedQuake = quakes[indexPath.row];
    [self.navigationController pushViewController:mapVC animated:YES];
}



- (IBAction)filterQuakes:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"Select intensity"
                                                             delegate:self cancelButtonTitle:@"Close" destructiveButtonTitle:nil otherButtonTitles:All, Weak, Light, Moderate, Strong, Severe, nil];
    [actionSheet showFromBarButtonItem:filterIntensity animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    switch (buttonIndex) {
        case kAll:
            filterIntensity.title = All;
            selectedIntensity = kAllRange;
            break;
        case kWeak:
            filterIntensity.title = Weak;
            selectedIntensity = kWeakRange;
            break;
        case kLight:
            filterIntensity.title = Light;
            selectedIntensity = kLightRange;
            break;
        case kModerate:
            filterIntensity.title = Moderate;
            selectedIntensity = kModerateRange;
            break;
        case kStrong:
            filterIntensity.title = Strong;
            selectedIntensity = kStrongRange;
            break;
        case kSevere:
            filterIntensity.title = Severe;
            selectedIntensity = kSevereRange;
            break;
            
        default:
            return;
            break;
    }
    
    [self performSelectorInBackground:@selector(getEarthQuakes:) withObject:selectedIntensity];
}

@end
