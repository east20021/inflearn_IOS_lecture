//
//  BookManager.swift
//  BookManager
//
//  Created by lee on 2017. 12. 27..
//  Copyright © 2017년 smith. All rights reserved.
//

import Foundation

class BookManager {
    var bookList = [Book]()
    
    func addBook(book: Book) {
        bookList.append(book)
        print("added book :", book.name)
    }
    
    func showAllBook() -> String {
        var tempStr = "Book: "
        for bookName in bookList {
            tempStr += bookName.name + " "
        }
        return tempStr
    }
    
    func countBook() -> Int {
        return bookList.count
    }
    
    func findBook(book: String) -> Bool {
        for bookTemp in bookList {
            if bookTemp.name == book {
                return true
            }
        }
        return false
    }
    
    func removeBook(book: String) {
        for bookTemp in bookList {
            if bookTemp.name == book {
                let index = (bookList as NSArray).index(of: bookTemp)
                bookList.remove(at: index)
            }
        }
    }
    
}
