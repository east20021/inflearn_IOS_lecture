//
//  ViewController.swift
//  visualBookManager
//
//  Created by lee on 2017. 12. 27..
//  Copyright © 2017년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let bookManager = BookManager()
    
    @IBOutlet weak var bookCount: UILabel!
    @IBOutlet weak var textBox: UITextView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var genreTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let book1 = Book()
        book1.name = "햄릿"
        book1.genre = "소설"
        book1.author = "셰익스피어"
        
        let book2 = Book()
        book2.name = "부의추월차선"
        book2.genre = "자기개발서"
        book2.author = "엠제이 드마코"
        
        let book3 = Book()
        book3.name = "스위프트"
        book3.genre = "기술"
        book3.author = "야곰"
        
        
        bookManager.addBook(book1)
        bookManager.addBook(book2)
        bookManager.addBook(book3)
        
        bookCount.text = "\(bookManager.countBook())"
    }
    
    @IBAction func showAllBookAction(_ sender: Any) {
        textBox.text = bookManager.showAllBook()
        bookCount.text = "\(bookManager.countBook())"
    }
    
    @IBAction func addBookAction(_ sender: Any) {
        let bookTemp = Book()
        bookTemp.name = nameTextField.text!
        bookTemp.genre = genreTextField.text!
        bookTemp.author = authorTextField.text!
        
        bookManager.addBook(bookTemp)
        bookCount.text = "\(bookManager.countBook())"
    }
    
    @IBAction func findBookAction(_ sender: Any) {
        let resultBook = bookManager.findBook(nameTextField.text!)
        if resultBook != false {
            textBox.text = "책이 있습니다."
        } else {
            textBox.text = "책이 없습니다."
        }
        
    }
    
    @IBAction func removeBookAction(_ sender: Any) {
        let deleteBook = bookManager.removeBook(nameTextField.text!)
        if deleteBook == true {
            textBox.text = "\(nameTextField.text!) 도서가 지워 졌습니다."
            bookCount.text = "\(bookManager.countBook())"
        } else {
            textBox.text = "지울책이 없습니다"
        }
    }
    
    
    
    
}

