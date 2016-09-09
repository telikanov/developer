//
//  CardMatchingGame.h
//  Card Matching Game
//
//  Created by Алексей Теликанов on 07.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
//disignated initializer
- (instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (Card *)cardAtIndex:(NSUInteger)index;

@property(nonatomic,readonly)NSInteger score;

@end
