//
//  FavoritesViewController.m
//  photoApp
//
//  Created by mkdev on 13/03/16.
//  Copyright © 2016 Monitron. All rights reserved.
//

#import "FavoritesViewController.h"
#import "../extensions/AppScreen.h"
#import "../extensions/AppColors.h"

@implementation FavoritesViewController


- (void)viewDidLoad{
    [self setupControllerTab];
    [self fetchPhotosList];
    NSLog(@"%@",self.photosList[0]);
}

- (void)setupControllerTab{
    self.title = @"Favorites";
    self.view.backgroundColor = [AppColors blueBackground];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.photosList count];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
    }
    
    NSDictionary *imageData = [self.photosList objectAtIndex: indexPath.row];
    NSData *currentImage = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: imageData[@"url"]]];
    UIImage *imagePayload = [[UIImage alloc] initWithData:currentImage];
    cell.textLabel.text = imageData[@"name"];
    cell.imageView.image = imagePayload;
    return cell;
}

- (void)fetchPhotosList{
    self.photosList = @[ @{@"name": @"image1", @"url": @"https://s3.amazonaws.com/uifaces/faces/twitter/talhaconcepts/128.jpg"},
                         @{@"name": @"image2", @"url": @"https://s3.amazonaws.com/uifaces/faces/twitter/talhaconcepts/128.jpg"},
                         @{@"name": @"image3", @"url": @"https://s3.amazonaws.com/uifaces/faces/twitter/talhaconcepts/128.jpg"}
                        ];
}



@end
