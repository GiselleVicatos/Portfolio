from tkinter import *

from tkinter import messagebox

from collections import defaultdict

class Books():
    def __init__(self, book_ID, title, author, year, publisher, av_copies, pub_date, timer):
        self.book_ID=book_ID
        self.title=title
        self.author=author
        self.year=year
        self.publisher=publisher
        self.av_copies=av_copies
        self.pub_date=pub_date
        self.timer=timer

    #returns book ID
    def book_book_ID(self, book):
         return book.book_ID
        
    #returns book title
    def book_title(self, book):
        return book.title
    
    #returns book year
    def book_author(self, book):
        return book.author    
    
    #returns book author
    def book_year(self, book):
        return book.year
    
    #returns book publisher
    def book_publisher(self, book):
        return book.publisher
    
    #returns books available copies
    def book_av_copies(self, book):
        return book.av_copies

    #returns books publication date
    def book_pub_date(self, book):
        return book.pub_date

    #update book ID
    def change_book_ID(self, book):
        try:
            while True:
                update_book_ID=input('please enter updated book ID: ')
                if not update_book_ID: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the books ID: {}'.format(book.book_ID))
                    book.book_ID=update_book_ID                
                    print('This is the new book ID: {}'.format(book.book_ID))
                    return book.book_ID
                    break
        except:
            print('error')
    
    #update book title
    def change_title(self, book):
        try:
            while True:
                update_title=input('please enter updated book title: ')
                if not update_title: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the books title: {}'.format(book.title))
                    book.title=update_title                
                    print('This is the new book title: {}'.format(book.title))
                    return book.title
                    break
        except:
            print('error')

    #update book author
    def change_author(self, book):
        try:
            while True:
                update_author=input('please enter updated book author: ')
                if not update_author: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the books author: {}'.format(book.author))
                    book.author=update_author                
                    print('This is the new books author: {}'.format(book.author))
                    return book.author
                    break
        except:
            print('error')

    #update book year
    def change_year(self, book):
        try:
            while True:
                try: #deals with invalid and blank entries                   
                    update_year=int(input('please enter updated book year: '))
                    print('This was the books year: {}'.format(book.year))
                    book.year=update_year               
                    print('This is the new book year: {}'.format(book.year))
                    return book.year
                    break
                except:
                    print('Invalid entry! Try again')
        except:
            print('error')
            
    #update book publisher
    def change_publisher(self, book):
        try:
            while True:
                update_publisher=input('please enter updated book publisher: ')
                if not update_publisher: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the books publisher: {}'.format(book.publisher))
                    book.publisher=update_publisher              
                    print('This is the new book publisher: {}'.format(book.publisher))
                    return book.publisher
                    break
        except:
            print('error')
    
    #update number of available copies
    def change_av_copies(self, book):
        try:
            while True:
                try: #deals with invalid and blank entries
                    update_av_copies=int(input('please enter updated number of available copies: '))
                    print('This was the number of available copies: {}'.format(book.av_copies))
                    book.av_copies=update_av_copies              
                    print('This is the new number of availble copies: {}'.format(book.av_copies))
                    return book.av_copies
                    break
                except:
                    print('Invalid entry! Try again')
        except:
            print('error')

    #update publication date
    def change_pub_date(self, book):
        try:
            while True:
                try: #deals with invalid and blank entries
                    update_pub_date=int(input('please enter updated publication date: '))
                    print('This was the books publication date: {}'.format(book.pub_date))
                    book.pub_date=update_pub_date             
                    print('This is the new publication date: {}'.format(book.pub_date))
                    return book.pub_date
                    break
                except:
                    print('Invalid entry! Try again')                
        except:
            print('error')
            
#extra assignment            
  
    def GUI_update_title(self, picked_book):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #Gets the result from Entry and return it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Book title was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates book title 
                picked_book.title=result
                print(picked_book.title)
        
            #create go buton    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #Create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #label.config( text=)
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change book title", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()


    def GUI_update_author(self, picked_book):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #Gets the result from Entry and return it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Book author was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates book title 
                picked_book.author=result
                print(picked_book.author)
        
            #create go buton    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #Create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #label.config( text=)
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change book author", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()
        

    def GUI_update_year(self, picked_book):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #Gets the result from Entry and return it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Book year was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates book title 
                picked_book.year=result
                print(picked_book.year)
        
            #create go buton    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #Create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #label.config( text=)
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change book year", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()

    def GUI_update_publisher(self, picked_book):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #Gets the result from Entry and return it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Book publisher was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates book title 
                picked_book.publisher=result
                print(picked_book.publisher)
        
            #create go buton    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #Create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #label.config( text=)
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change book publisher", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()

    def GUI_update_av_copies(self, picked_book):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #Gets the result from Entry and return it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Number of available book copies\n was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates book title 
                picked_book.av_copies=result
                print(picked_book.av_copies)
        
            #create go buton    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #Create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #label.config( text=)
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change no. of book copies", command=user_entry)
        button1.place(x = 50,y = 40)

        #call GUI
        top.mainloop()
    

bookx=Books('S11','Sweets','A. Smith',2000,'Bloomsbury', 1,2000,170)
bookx=Books('C22','Chocolate','B. Barry',2001,'Harper',1,2002,180)
bookx=Books('C33','Cooking','C. Chaplin',2005,'Puffin',1,2006,30)
bookx=Books('B44','Baking','R. Rover',2004,'Penguin',1,2004,16)

bookx1=Books('S11','Sweets','A. Smith',2000,'Bloomsbury', 1,2000, 170)
#print(bookx.book_book_ID(bookx1))
#print(bookx.book_title(bookx1))
#print(bookx.book_author(bookx1))
#print(bookx.book_year(bookx1))
#print(bookx.book_publisher(bookx1))
#print(bookx.book_pub_date(bookx1))

#print(bookx.change_book_ID(bookx1))
#print(bookx.change_title(bookx1))
#print(bookx.change_author(bookx1))
#print(bookx.change_year(bookx1))
#print(bookx.change_publisher(bookx1))
#print(bookx.chagne_pub_date(bookx1))
#print(bookx.change_book_ID(bookx1))
 

class BookList():
    
    #creates a list for all the books 
    def __init__(self,booklist=[]):
        self.booklist=booklist
        
    #adds a book to the booklist of the library
    def add_book(self,book):
        self.booklist.append(book)

    #displays all the books in the booklist
    def view_all_books(self):
        for book in self.booklist:
            print('BookID: {}, Title: {}, Author: {}, Year: {}, \nPublisher: {}, Available Copies: {}, Publication Date: {}\nTimer: {}\n'.format(book.book_ID, book.title, book.author, book.year, book.publisher, book.av_copies, book.pub_date, book.timer))

    #finds a book by the title from the booklist  
    def print_book(self):
        try:
            on=True #deals with invalid and blank entries
            while on:
                title_choice=input('Please enter the title of book you want to find: ')
                for book in self.booklist:
                    if title_choice.lower()==book.title.lower():                    
                        print('BookID: {}, Title: {}, Author: {}, Year: {}, \nPublisher: {}, Available Copies: {}, Publication Date: {}\nTimer: {}'.format(book.book_ID, book.title, book.author, book.year, book.publisher, book.av_copies, book.pub_date, book.timer))
                        return book
                        on=False
        except:
            print('error')
            
    #removes a book from the booklist            
    def remove_book(self):
        try:
            on=True #deals with invalid and blank entries
            while on:
                borrow=input('Please enter the title of the book that will be taken out of the library: ')
                for book in self.booklist:
                    if borrow.lower()==book.title.lower():
                        self.booklist.remove(book)
                        return book
                        on=False
        except:
            print('error')            
                    
    #counts books stored in booklist
    def count(self):
        for book in self.booklist:           
            count_books=len(self.booklist)
        print('Total number of books in library are: {}\n'.format(count_books))
            
    
books=BookList()
books.add_book(Books('S11','Sweets','A. Smith',2000,'Bloomsbury', 1,2000,170))
books.add_book(Books('C22','Chocolate','B. Barry',2001,'Harper',1,2002,180))
books.add_book(Books('C33','Cooking','C. Chaplin',2005,'Puffin',1,2006,30))
books.add_book(Books('B44','Baking','R. Rover',2004,'Penguin',1,2004,16))

#books.view_all_books()
#books.print_book()
#books.remove_book()
#books.view_all_books()
#books.count()


class User():
    def __init__(self, username, firstname, surname, house_number, street_name, postcode, email,DOB):
        self.username=username
        self.firstname=firstname
        self.surname=surname
        self.house_number=house_number
        self.street_name=street_name
        self.postcode=postcode
        self.email=email
        self.DOB=DOB

    #returns person's username
    def user_username(self, person):
         return person.username
        
    #returns person's firstname
    def user_firstname(self, person):
        return person.firstname
    
    #returns person's surname
    def user_surname(self, person):
        return person.surname
    
    #returns person's house number
    def user_house_number(self, person):
        return person.house_number
    
    #returns person's street name
    def user_street_name(self, person):
        return person.street_name

    #returns person's postcode
    def user_postcode(self, person):
        return person.postcode
    
    #returns person's email
    def user_email(self, person):
        return person.email
    
    #returns person's date of birth
    def user_DOB(self, person):
        return person.DOB      
    

    #changes firstname
    def change_firstname(self, person):       
        try:
            while True: 
                update_firstname==input('please enter your updated firstname: ')                    
                if not update_firstname: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the persons old firstname: {}'.format(person.firstname))
                    person.firstname=update_firstname                
                    print('This is the persons new firstname: {}'.format(person.firstname))
                    return person.firstname
                    break
        except:
            print('error')
            
    #changes surname
    def change_surname(self, person):
        try:
            while True: 
                update_surname=input('please enter your updated surname: ')
                if not update_surname: #deals with blank entries
                    print('Invalid entry! Try again')                
                else:
                    print('This was the persons old surname: {}'.format(person.surname))
                    person.surname=update_surname
                    print('This is the persons new surname: {}'.format(person.surname))
                    return person.surname
                    break
        except:
            print('error')
    
    #changes email
    def change_email(self, person):
        try:
            while True: 
                update_email=input('please enter your updated email: ')
                if not update_email: #deals with blank entries
                    print('Invalid entry! Try again')                
                else:
                    print('This was the persons old email: {}'.format(person.email))
                    person.email=update_email
                    print('This is the persons new email: {}'.format(person.email))
                    return person.email
                    break
        except:
            print('error')
    
    #changes date of birth
    def change_DOB(self, person):
        try:
            while True: 
                update_DOB=input('please enter your updated DOB dd/mm/yy: ')
                if not update_DOB: #deals with blank entries
                    print('Invalid entry! Try again')
                else:
                    print('This was the persons old DOB: {}'.format(person.DOB))
                    person.DOB=update_DOB
                    print('This is the persons new DOB: {}'.format(person.DOB))
                    return person.DOB
                    break
        except:
            print('error')
           
#extra assignment
    
    #uses a GUI to change username
    def GUI_update_username(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #gets the result from Entry widget and returns it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Username was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates username in library 
                person.username=result
                print(person.username)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config 
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change username", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()

    #uses a GUI to change firstname
    def GUI_update_firstname(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #gets the result from Entry widget and returns it to the Label
                result = myEntry.get()
                resultLabel.config(text="Firstname was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates firstname in library 
                person.firstname=result
                print(person.firstname)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config 
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change firstname", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()
        
    #uses a GUI to change firstname
    def GUI_update_surname(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
               #gets the result from Entry widget and returns it to the Label 
                result = myEntry.get()
                resultLabel.config(text="Surname was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates surname in library
                person.surname=result
                print(person.surname)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text= "change surname", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()

    #uses a GUI to change house number
    def GUI_update_house_number(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #gets the result from Entry widget and returns it to the Label 
                result = myEntry.get()
                resultLabel.config(text="House number was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates house number in library
                person.house_number=result
                print(person.house_number)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change house no.", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()
        
    #uses a GUI to change street name
    def GUI_update_street_name(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #gets the result from Entry widget and returns it to the Label  
                result = myEntry.get()
                resultLabel.config(text="Street name updated to :\n" + result)
                myEntry.delete(0,END)

                #updates street name in library 
                person.street_name=result
                print(person.street_name)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change street name", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()

    #uses a GUI to change house number
    def GUI_update_postcode(self, person):
        #GUI parameters
        top = Tk()
        top.geometry('250x250')
        top.resizable(0,0)
        top.title('Library')
                          
        def user_entry():
            def returnEntry():
        
                #gets the result from Entry widget and returns it to the Label
                result = myEntry.get()
                resultLabel.config(text="Postcode was updated to :\n" + result)
                myEntry.delete(0,END)

                #updates available copies 
                person.postcode=result
                print(person.postcode)
        
            #create enter button    
            button2 = Button(top, text="Enter", command=returnEntry)
            button2.place(x = 100,y = 120)             
                       
            #create the Entry widget
            myEntry = Entry(top, width=20)
            myEntry.focus()            
            myEntry.place(x = 60,y = 100)            
                        
            #create the lable with text from resultLabel.config
            resultLabel = Label(text = " ")
            resultLabel.place(x = 40,y = 160)            
            
        #create button
        button1 = Button(top, text="change postcode", command=user_entry)
        button1.place(x = 70,y = 40)

        #call GUI
        top.mainloop()
        
    
             
user=User('GisVic1', 'Giselle', 'Vicatos', 1, 'Cherry Lane, Constania', 7002,'gisvic1@hotmail.com', '02/04/88') 
user=User('GisFli1', 'Giselle', 'Flintstones', 1, 'Strawberry Lane, Constantia', 7002,'gisvic2#hotmail.com', '03/12/89')
user=User('SalSmi1', 'Sally', 'Smith', 1, 'Oak Park, Camps Bay',4433,'salsmi1@hotmail.com', '01/04/95')
user=User('AliRex1', 'Ali', 'ReX', 1, 'High level Road, Camps Bay', 4433,'alirex1@hotmail.com', '20/08/99')

#person1=User('GisVic1', 'Giselle', 'Vicatos', 1, 'Cherry Lane, Constania', 7002,'gisvic1@hotmail.com', '02/04/88') 
#print(user.user_DOB(person1))

#person1=User('SalSmi1', 'Sally', 'Smith', 1, 'Oak Park, Camps Bay',4433,'salsmi1@hotmail.com', '01/04/95')
#print(user.change_DOB(person1))



class UserList():

    #creates a list for all the users 
    def __init__(self, userlist=[]):
        self.userlist=userlist

    #adds a user to the library userlist of users
    def add_user(self, person):
        self.userlist.append(person)

    #Displays all the users that are in the library userlist of users
    def view_all_users(self):
        for person in self.userlist:
            print('Username: {}, Firstname: {}, Surname: {} \nStreet Number: {}, Street Name: {}, Postal Code: {}\nEmail: {}, DOB: {} \n'.format(person.username, person.firstname, person.surname, person.house_number, person.street_name, person.postcode, person.email, person.DOB))

    #finds a user that has been added into the library UserList list of users
    def view_specific_user(self):
        try:
            on=True #deals with invalid input entries
            while on:
                specific_person=input('Type in the username to search for a person: ')            
                for person in self.userlist:
                    if specific_person.lower()==person.username.lower():
                        print('Username: {}, Firstname: {}, Surname: {} \nStreet Number: {}, Street Name: {}, Postal Code: {}\nEmail: {}, DOB: {} \n'.format(person.username, person.firstname, person.surname, person.house_number, person.street_name, person.postcode, person.email, person.DOB))
                        return person
                        on=False
        except:
            print('error')
            

    #removes person from the userlist by firstname 
    def remove_user(self):
        try:
            on=True #deals with invalid input entries
            while on:
                remove_user=input('please enter the firstname of person who will be removed: ')
            
                count=0 #counts if there is more than one user with the same firstname as input name
                for person in self.userlist:                    
                    if remove_user.lower()==person.firstname.lower():                        
                        count+=1
                    
                #if there is more than one user with the same name then system promps for surname
                if count>1:
                    turn=True #deals with invalid input entries
                    while turn:
                        remove_user2=input('There is more than one person with your firstname. Enter surname as well to remove person: ')
                        for person in self.userlist:                        
                            if remove_user2.lower()==person.surname.lower() and remove_user.lower()==person.firstname.lower():
                                self.userlist.remove(person)                                
                                turn=False 
                                on=False 
                                break
                        
                #if firstname is unique, then this code is used
                elif count==1:
                    for person in self.userlist:
                        if remove_user.lower()==person.firstname.lower():
                            self.userlist.remove(person)
                            on=False
                            break
        except:
            print('error')            
           
    # counts the number of users in the library userlist of users
    def count_users(self):
        count=0
        for person in self.userlist:
            count+=1            
        print('Total number of users in library are: {}\n'.format(count))

userlist=UserList()
userlist.add_user(User('GisVic1', 'Giselle', 'Vicatos', 1, 'Cherry Lane, Constania', 7002,'gisvic1@hotmail.com', '02/04/88'))
userlist.add_user(User('GisFli1', 'Giselle', 'Flintstones', 1, 'Strawberry Lane, Constantia', 7002,'gisvic2#hotmail.com', '03/12/89'))
userlist.add_user(User('SalSmi1', 'Sally', 'Smith', 1, 'Oak Park, Camps Bay',4433,'salsmi1@hotmail.com', '01/04/95'))
userlist.add_user(User('AliRex1', 'Ali', 'ReX', 1, 'High level Road, Camps Bay', 4433,'alirex1@hotmail.com', '20/08/99'))


#userlist.view_all_users()
#userlist.view_specific_user()
#userlist.remove_user()
#userlist.view_all_users()
#userlist.count_users()



class Loans():

    #creates a dictionary of lists so that the user is the key and a list of books is the value   
    def __init__(self):
       self.booklist=defaultdict(list)      
               
    #sets a user as a key in the list
    def get_user(self, specific_person):
        self.booklist[specific_person]

    #connects a chosen book with a specific user in the list  
    def borrow_book(self, specific_person, book):        
        return self.booklist[specific_person].append(book)

     #allows a viewer to see which users have taken out which books by username and book title  
    def show_users_with_books(self):
        try:
            for person, book in self.booklist.items():
                borrowed_book_list=[]
                for items in book[0:]:                
                    borrowed_book=items.title
                    borrowed_book_list.append(borrowed_book)
                print(person.username,':', borrowed_book_list)
        except:
            print('error')

    #counts the number of books that a specific user has taken out of the library
    def count_books(self, specific_person):
        for specific_person,value in self.booklist.items():
            list_of_books=value
            count_books=len(list_of_books)
            print('{}, these are how many books you have: {}'.format(specific_person.username, count_books))
          
      
    #returns a book that is linked to a specific person to the library (a list in the BookList class) 
    def return_book(self, specific_person):
        #uses method that counts the number of books the user has borrowed before returning books
        loan.count_books(specific_person)
        try:
            on=True
            while on:#loop makes sure there are no input errors                       
                return_book=input('which book do you want to return? Enter book title: ')        
                for specific_person,value in self.booklist.items():            
                    for items in value[0:]:
                        if items.title.lower()==return_book.lower():
                            self.booklist[specific_person].remove(items)# removes book from Loans class list                        
                            books.add_book(items) #puts the book back into the BookList class list            
                            on=False
        except:
            print('error')
        #uses method that counts the number of books the user has borrowed after returning books
        loan.count_books(specific_person)
        
    
    #returns all overdue books(timer attribute in Book class. There is a 1 week limit ie 168hr) back the to library (list in BookList class). Since there is no time factor for overdue books, it is assumed that all books are overdue when user clicks this feature. 
    def return_overdue_books(self):
        try:
            for person,book in self.booklist.items():                          
                for items in book[0:]:
                    if items.timer>168:
                        self.booklist[person].remove(items)                
                        books.add_book(items)            
                        #uses method in User class to show user details
                        print ('Firstname:{} \nUsername: {} \nyour books were overdue and have been returned\n'.format(person.firstname, person.username))
        except:
             print('error')
             
    #gives the details of the user who has borrowed a specific book
    def return_user_details_of_borrowed_book(self):
        val=list(self.booklist.values())
        keys=list(self.booklist.keys())
        try:
            on=True
            while on: #deals with user input errors 
                call_book=input('Enter book title to find user: ')            
                for person,book in self.booklist.items():
                    for items in book[0:]:
                        if call_book.lower()==items.title.lower():
                            y=items
                            x=book #identifies the list(dictionary value) where the book item is held
                            on=False
        except:
            print('error')
        person=keys[val.index(x)]#finds user by getting value position and calling the key index
        #uses methods in User class to give user details and methods in Book class to give book details
        print('Details of the user who has book (book title: {}):\n\nFirstname: {} \nSurname: {} \nEmail: {}\n'.format(y.title, person.firstname, person.surname, person.email))
 
    
loan=Loans()


#A function that makes a menu list of what a person can do in the library
#It starts by calling the person from the Library's list of users (the list in the UserList class)
#The specific chosen person can then navigate what he/she wants to do
#This function also allows for multiple people to navigate the menu, while keeping the previous users actions(borrowing/returning books) saved
def main():
    yes=True  
    while yes:
        print('This is the list of users with borrowed books:')
        loan.show_users_with_books() #shows which users have taken out which books
       
        person=userlist.view_specific_user() #finds user from UserList class list via a username and displays user details   
        # creates a loop for each specific person
        
        while True:
            try:
                choose=int(input('would you like to:\n1. Borrow a book \n2. Return a book \n3. Display number of borrowed books \n4. Return all overdue books \n5. Use book title to find user \n6. View and count all library books \n7. Search for a book \n8. View and count all library users \n9. Find a user \n10. Remove book from library \n11. Remove user from library \n12. Change book details \n13. Change user details \n14. Exit \n: ')) 

                #chosen user can borrow a book
                if choose==1:        
                    loan.get_user(person) #sets a user as a key in the Loans class list
                    loan.show_users_with_books() # shows which books user have already taken out
                    bookz=books.remove_book() #removes book from library (BookList class list)
                    loan.borrow_book(person, bookz) #links removed book from library to chosen user by placing the in the Loans class list
                    loan.show_users_with_books() #shows chosen user with all borrowed books
                    books.view_all_books() #shows that borrowed book is no longer available in the library (BookList class list)

                #chosen user can return a specific borrowed book back to the library (BookList class list)   
                elif choose==2:
                    loan.show_users_with_books()#shows the chosen user which books they are borrowed
                    loan.return_book(person) #asks chosen user which book they want to return and returns book to library (BookList list)
                    loan.show_users_with_books()#shows the chosen user their updated borrowed book list  
                    books.view_all_books()#shows that the book has been returned to library (BookList list)

                #counts the number of borrowed books from chosen user
                elif choose==3:
                    loan.count_books(person)#shows chosen user how many books they have borrowed
                    loan.show_users_with_books()#displays to user which books they have borrowed

                #returns all overdue books that user has borrowed.
                #(There is no specified time factor, so this feature presumes all books linked to user are overdue and returns them to the library(BookList list))  
                elif choose==4:
                    loan.show_users_with_books()#shows user which books have been borrowed
                    loan.return_overdue_books()#automatically returns all books
                    books.view_all_books()#shows user than books have been returned to library (BookList list)

                #Gives the details of the user that has borrowed a certain book
                elif choose==5:
                    loan.return_user_details_of_borrowed_book()

                #view and count all books in library
                elif choose==6:
                    books.count() #counts the total number of books in library
                    books.view_all_books() #shows all the books in library

                #finds a book by the title from the booklist 
                elif choose==7:                   
                    books.print_book()

                #view and count all users in library
                elif choose==8:                    
                    userlist.count_users()# counts the total number of users in library
                    userlist.view_all_users() #shows all the users in library
                
                #find a user by username
                elif choose==9:
                    userlist.view_specific_user()

                #remove book from library
                elif choose==10:
                    books.remove_book() #removes book from library
                    books.view_all_books() #shows remaining books in library                    

                #remove user from library
                elif choose==11:
                    userlist.remove_user() #removes user from library
                    userlist.view_all_users() #shows remaining users in library

                #extra GUI assignment
                #changes book details
                #brings up a menu for a user to pick which detail of the book they want to change
                elif choose==12:
                    picked_book=books.print_book()#finds a book form library (BookList list) by book title.                     
                    while True:
                        try:                            
                            choose2=int(input('Would you like to change: \n1. Book title \n2. Book author \n3. Book year \n4. Book publisher \n5. Number of available book copies \n6. Back: '))

                            #changes book title
                            if choose2==1:
                                print(picked_book.title) #before change                   
                                bookx.GUI_update_title(picked_book)
                                print(picked_book.title)#after change

                            #changes book author
                            elif choose2==2:
                                print(picked_book.author)#before change 
                                bookx.GUI_update_author(picked_book)
                                print(picked_book.author)#after change

                            #changes book year
                            elif choose2==3:
                                print(picked_book.year)#before change 
                                bookx.GUI_update_year(picked_book)
                                print(picked_book.year)#after change

                            #changes book publisher
                            elif choose2==4:
                                print(picked_book.publisher)#before change 
                                bookx.GUI_update_publisher(picked_book)
                                print(picked_book.publisher)#after change

                            #changes number of available book copies
                            elif choose2==5:
                                print(picked_book.av_copies)#before change 
                                bookx.GUI_update_av_copies(picked_book)
                                print(picked_book.av_copies)#after change
                            #goes back to previous menu
                            elif choose2==6:
                                books.view_all_books() #shows all books in library (BookList class list) with updated book details
                                break
                            
                            else:
                                print('That number is not valid. Please try another number.')
                        except:
                            print('Invalid entry. Try again.')
                            
                #extra GUI assignment
                #changes user details
                #brings up a menu for a user to pick which detail of themselves they want to change
                elif choose==13:
                    while True:
                        try:
                            choose3=int(input('would you like to change: \n1. Username \n2. Firstname \n3. Surname \n4. House number \n5. Street name \n6. Postcode \n7. Back: '))

                            #changes username
                            if choose3==1:
                                print(person.username)#before change 
                                user.GUI_update_username(person)
                                print(person.username)#after change
                                
                            #changes firstname
                            elif choose3==2:
                                print(person.firstname)#before change 
                                user.GUI_update_firstname(person)
                                print(person.firstname)#after change
                                
                            #changes surname
                            elif choose3==3:
                                print(person.surname)#before change 
                                user.GUI_update_surname(person)
                                print(person.surname)#after change
                                
                            #changes the house number
                            elif choose3==4:
                                print(person.house_number)#before change 
                                user.GUI_update_house_number(person)
                                print(person.house_number)#after change
                                
                            #changes the street name
                            elif choose3==5:
                                print(person.street_name)#before change 
                                user.GUI_update_street_name(person)
                                print(person.street_name)#after change
                                
                            #changes the postcode
                            elif choose3==6:
                                print(person.postcode)#before change 
                                user.GUI_update_postcode(person)
                                print(person.postcode)#after change

                            #goes back to previous menu
                            elif choose3==7:
                                userlist.view_all_users() #shows all users in Userlist class list with updated user details
                                break
                            
                            else:
                                print('That number is not valid. Please try another number.')
                        except:
                            print('Invalid entry. Try again.')                            

                #exits menu for current user and loops back to begining to ask for the next user to enter name
                elif choose==14:
                    break

                else:
                    print('That number is not valid. Please try another number.')
                    
            except:
                print('Invalid entry. Try again.')
                

        
main()









































    
        
