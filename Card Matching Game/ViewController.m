//
//  ViewController.m
//  Card Matching Game
//
//  Created by Алексей Теликанов on 06.09.16.
//  Copyright © 2016 Алексей Теликанов. All rights reserved.
//

#import "ViewController.h"
#import "Deck.h"
#import "PlayningCardDeck.h"
#import "CardMatchingGame.h"



@interface ViewController ()
@property(strong, nonatomic)CardMatchingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLable;
@property (strong, nonatomic) IBOutlet UISwitch *statusGameSwitch;
@property (weak, nonatomic) IBOutlet UILabel *infoStateGameLable;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *plusCardButtons;
@property (strong, nonatomic) IBOutlet UILabel *infoScoreLable;
@end

@implementation ViewController

-(CardMatchingGame *)game
{
    if(!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createDeck]];
    }
    
    return _game;
}

-(Deck *)createDeck
{
    return [[PlayningCardDeck alloc]init];
}

- (IBAction)touchCardButton:(UIButton *)sender
{
    int chooseButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chooseButtonIndex];
    [self updateUI];
    
}

-(void)updateUI
{
    for(UIButton *cardButton in self.cardButtons){
        int cardButtonIndex = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titileForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundImageForCard:card] forState:UIControlStateNormal];
        cardButton.enabled =! card.isMatched;
        self.scoreLable.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.infoScoreLable.text = [NSString stringWithFormat:@"У вас совпали %s",];
    }
}


-(NSString *)titileForCard:(Card *)card
{
    return card.isChoosen ? card.contents: @"";
}

-(UIImage *)backgroundImageForCard:(Card *)card
{
    return[UIImage imageNamed:card.isChoosen ? @"cardfront" : @"cardback"];
}
- (IBAction)statusSwitch:(UISwitch *)sender
{
    if([self.statusGameSwitch isOn])
    {
        self.infoStateGameLable.text = @"Добавить карты";
        for(UIButton *cardPlusButton in self.plusCardButtons){
            cardPlusButton.hidden = !cardPlusButton.hidden;
        }

        
    }else{
        self.infoStateGameLable.text =@"Убрать карты";
        for(UIButton *cardPlusButton in self.plusCardButtons){
            cardPlusButton.hidden = !cardPlusButton.hidden;
        }

    }
    
}


@end
