//
//  main.swift
//  BookManager
//
//  Created by lee on 2017. 12. 27..
//  Copyright © 2017년 smith. All rights reserved.
//

import Foundation

var bookManager = BookManager()

var book1 = Book()
book1.name = "햄릿"
book1.genre = "소설"
book1.author = "셰익스피어"

var book2 = Book()
book2.name = "부의추월차선"
book2.genre = "자기개발서"
book2.author = "엠제이 드마코"

var book3 = Book()
book3.name = "스위프트"
book3.genre = "기술"
book3.author = "야곰"

bookManager.addBook(book: book1)
bookManager.addBook(book: book2)
bookManager.addBook(book: book3)
print(bookManager.showAllBook())
print(bookManager.countBook())
print(bookManager.findBook(book: "햄릿"))
print(bookManager.findBook(book: "삼촌"))
bookManager.removeBook(book: "햄릿")
print(bookManager.showAllBook())





