//
//  PlayningCardDeck.m
//  Card Matching Game
//
//  Created by Алексей Теликанов on 07.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "PlayningCardDeck.h"
#import "PlayningCard.h"

@implementation PlayningCardDeck

-(instancetype)init
{
    self = [super init];
    
    if (self){
        for(NSString *suit in [PlayningCard validSuits]){
            for(NSUInteger rank = 1; rank <= [PlayningCard maxRank]; rank++){
                PlayningCard *card = [[PlayningCard alloc]init];
                card.rank = rank;
                card.suit = suit;
                [self addCard:card];
            }
        }
    }
    return self;
}




@end
