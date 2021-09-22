
#make an interactive quiz with 10 questions

import random 

#list of questions and corresponding answers.
questions_and_answers=[{'what is 1+1?':2},
                       {'what is 5+5?':10},
                       {'what is 10+10?':20},
                       {'what is 15+1?':16},
                       {'what is 27-2?':25},
                       {'what is 12-5?':7},
                       {'what is 3+3?':6},
                       {'what is 15+15?':30},
                       {'what is 14-4?':10},
                       {'what is 11-2?':9}]
      
#for display purposes
print('Simple Math Quiz')

#function that deals with user's name, asking/answering questions and displaying output stats.
def main():
    

    total_scores={}
    player=1
    
    #get player to input name
    while True:        
        on=True #loop deals with invalid entry name
        while on:
            name=input('you are user no.{}. please enter your name: '.format(player))
            if name:
                print('Hi {} welcome to the quiz'. format(name))
                on=False
            else:
                print('you did not type in a name.')
                on=True

        #links to function that asks user to choose the number of questions to answer
        number_choice=no_of_questions()

        #randomly shuffles qustions so that the same questions won't get asked for user no.2.
        random.shuffle(questions_and_answers)

        #start the quiz
        input('Press enter to start: ') # will be able to deal with any kind of entry
        print() # empty space for layout effect

        #asks questions to user
        score=0
        got_right=[]
        got_wrong={}        
        for item in questions_and_answers[0:number_choice]: #iterates through list
            for x,y in item.items(): #iterates through dictionary inside of list
                successful=True 
                while successful: #loop deals with invalid entry types for answers
                    try:
                        if y==int(input('{}: '.format(x))):
                            score+=1
                            got_right.append(x)
                            successful=False
                        else:                            
                            got_wrong.update({x:y})                            
                            successful=False
                    except:
                        print('Invalid entry, please try again.')         
              
                
        #displays right/wrong user answers and scores 
        total_scores.update({name:int((score/number_choice)*100)})
        print('you got', str(score),'/{} correct which is'.format(number_choice),
              int((score/number_choice)*100),'%')
        print('these are the questions you got right', got_right)
        print('these are the questions you got wrong along with their answer', got_wrong)
                
        # links to function that deals with additional users or exits quiz
        if multi_player()=='yes':     
            player+=1
        else:
            break
        
    #displays overall user/users stats
    #displays overall scores     
    print('these are the final scores in %', total_scores)

    #displays highest score:
    max_value=max(total_scores.values())
    max_key=max(total_scores, key=total_scores.get)    
    print('highest score:', max_key, '-', max_value, '%')

    #dispays average value    
    average_value=[]
    for y in total_scores.values():
        average_value.append(y)
    print('average value of scores:',int(sum(average_value)/len(average_value)), '%')



#function that deals with multi-users       
def multi_player():
    
    player_on=True 
    while player_on: # loop deals with invalid additional user answers
            try:
                new_player=input('Is there another user who wants to take the quiz Yes/No?: ')
                if new_player[0].lower()=='y':
                    return 'yes'
                elif new_player[0].lower()=='n':
                    return 'no'
                else:
                    print('Invalid entry. Try again.')
                    player_on=True
            except:
                print('Invalid entry. Try again.')
                player_on=True
    
#function deals with number of questions wanted                
def no_of_questions():    
    
    on=True 
    while on: # loop deals with invalid entries including out of range entries
        try:
            question_amount=int(input('how many questions (max 10) would you like to answer?: '))            
            if question_amount in range(1,11):                                   
                return question_amount 
            else:
                print('Invalid entry. Try again')
                on=True
        except:
            print('Invalid entry. Try again')
            on=True      

                 
#call function and start game
main()


                
                 
