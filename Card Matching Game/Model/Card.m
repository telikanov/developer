//
//  Card.m
//  Card Matching Game
//
//  Created by Алексей Теликанов on 06.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "Card.h"

@implementation Card

-(int)match:(NSArray *)otherCards{
    int score = 0;
    
    for(Card *card in otherCards)
        if([card.contents isEqualToString:self.contents]){
            score = 1;
        }
    return score;
}



@end
