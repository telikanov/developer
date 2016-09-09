//
//  PlayningCard.h
//  Card Matching Game
//
//  Created by Алексей Теликанов on 06.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "Card.h"

@interface PlayningCard : Card

@property(strong, nonatomic)NSString *suit; //масть
@property(nonatomic)NSUInteger rank;
@property(nonatomic)NSString *infoScore;

+(NSArray *)validSuits;
+(NSUInteger) maxRank;
@end
