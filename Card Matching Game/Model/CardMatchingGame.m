//
//  CardMatchingGame.m
//  Card Matching Game
//
//  Created by Алексей Теликанов on 07.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite)NSInteger score;
@property(nonatomic, strong)NSMutableArray *cards;
@end

@implementation CardMatchingGame

-(NSMutableArray *)cards
{
    if(!_cards)_cards=[[NSMutableArray alloc]init];
    return _cards;
}

-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck
{
    self = [super init]; //super disignated initializer
    if(self){
        for(int i = 0; i < count; i++){
            Card *card = [deck drawRandomCard];
            if(card){
                [self.cards addObject:card];
            }else{
                self = nil;
                break;
            }
        }
    }
    return self;
}

-(Card *)cardAtIndex:(NSUInteger)index
{
    return (index <[self.cards count])? self.cards[index] : nil;
}

static const int MATHC_PENALTI = 2;
static const int BONUS = 4;
static const int CONST_TO_CHOOSE = 1;


-(void)chooseCardAtIndex:(NSUInteger)index
{
    
    Card *card = [self cardAtIndex:index];
    
    if (!card.isMatched){
        if (card.isChoosen){
        card.choose = NO;
    }else{
        for(Card *otherCard in self.cards){
            if(otherCard.isChoosen && !otherCard.isMatched){
                int mathScore = [card match:@[otherCard]];
                if(mathScore) {
                    self.score += mathScore * BONUS;
                    otherCard.metched = YES;
                    card.metched = YES;
                    
                    
                }else{
                    self.score -=MATHC_PENALTI;
                    otherCard.choose = NO;
                }
                break;
                }
            }
            self.score -=CONST_TO_CHOOSE;
            card.choose = YES;
        }
    }
}





@end
