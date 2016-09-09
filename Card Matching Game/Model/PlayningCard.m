//
//  PlayningCard.m
//  Card Matching Game
//
//  Created by Алексей Теликанов on 06.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "PlayningCard.h"

@interface PlayningCard()

@end

@implementation PlayningCard

-(int)match:(NSArray *)otherCards
{
    self.infoScore = @"?";
    int score = 0;
    
    if([otherCards count]==1){
        PlayningCard *otherCard = [otherCards firstObject];
        if(otherCard.rank == self.rank){
            score = 4;
            self.infoScore =[NSString stringWithFormat:@"две карты %@ за %d очков", otherCard.suit,
                             otherCard.rank ];
        }else if([otherCard.suit isEqualToString:self.suit]){
            self.infoScore = [NSString stringWithFormat:@"две карты %@", otherCard.suit];
            score = 1;
        }
        
    }
    return score;
}



-(NSString *)contents
{
    
    NSArray *rankStrings = [PlayningCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

+(NSArray *)validSuits
{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}
-(void)setSuit:(NSString *)suit
{
    if([[PlayningCard validSuits]containsObject:suit]){
        _suit=suit;
    }
}

-(NSString *)suit{
    return _suit ? _suit: @"?";
}

+(NSArray *)rankStrings {
 return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+(NSUInteger)maxRank {return [[self rankStrings]count]-1;}
-(void)setRank:(NSUInteger)rank{
    if(rank <=[PlayningCard maxRank]){
        _rank = rank;
    }
}


@end
