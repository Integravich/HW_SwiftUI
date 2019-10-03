//
//  LoginFormViewController.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 04/08/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit
import RealmSwift

class LoginFormViewController: UIViewController {
    
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var vkImage: UIImageView!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var statusCircle1: UIView!
    @IBOutlet weak var statusCircle2: UIView!
    @IBOutlet weak var statusCircle3: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        passwordTextField.text = ""

        // Жест нажатия
        let hideKeyboardGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        // Присваиваем его UIScrollVIew
        scrollView?.addGestureRecognizer(hideKeyboardGesture)
        
        // Do any additional setup after loading the view.
        
        // удаляем базу данных realm
        let realmURL = Realm.Configuration.defaultConfiguration.fileURL!
        let realmURLs = [
            realmURL,
            realmURL.appendingPathExtension("lock"),
            realmURL.appendingPathExtension("note"),
            realmURL.appendingPathExtension("management")
        ]
        for URL in realmURLs {
            do {
                try FileManager.default.removeItem(at: URL)
            } catch {
                print(error)
            }
        }
        
        // загружаем друзей из VK
        //netService.getFriends()
        
    }
    

    // переопределение метода - выясняем необходимость перехода (проверка учетных данных)
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        let session = Session.instance // наш синглтон
        if (loginTextField.text == session.login) && (passwordTextField.text == session.password) {
            print("Правильный логин/пароль")
            return true
        } else {
            print("Неправильный логин/пароль")
            let alert = UIAlertController(title: "Ошибка", message: "Неправильный логин или пароль", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .default)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            return false
        }
    }
    
    
    // Когда клавиатура появляется
    @objc func keyboardWasShown(notification: Notification) {
        
        // Получаем размер клавиатуры
        let info = notification.userInfo! as NSDictionary
        let kbSize = (info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue).cgRectValue.size
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: kbSize.height, right: 0.0)
        
        // Добавляем отступ внизу UIScrollView, равный размеру клавиатуры
        self.scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    //Когда клавиатура исчезает
    @objc func keyboardWillBeHidden(notification: Notification) {
        // Устанавливаем отступ внизу UIScrollView, равный 0
        let contentInsets = UIEdgeInsets.zero
        scrollView?.contentInset = contentInsets
        scrollView?.scrollIndicatorInsets = contentInsets
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // делаем кружочки индикатора загрузки
        statusCircle1.layer.cornerRadius = 7 // скругляем
        statusCircle1.layer.masksToBounds = true // обрезаем
        statusCircle2.layer.cornerRadius = 7 // скругляем
        statusCircle2.layer.masksToBounds = true // обрезаем
        statusCircle3.layer.cornerRadius = 7 // скругляем
        statusCircle3.layer.masksToBounds = true // обрезаем
        
        // Подписываемся на два уведомления: одно приходит при появлении клавиатуры
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWasShown), name: UIResponder.keyboardWillShowNotification, object: nil)
        // Второе — когда она пропадает
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillBeHidden(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        // Анимация
        // начальная точка названия
        self.loginLabel.transform = CGAffineTransform(translationX: 0,
                                                      y: -self.view.bounds.height/2)
        // начальная точка кнопки
        self.button.transform = CGAffineTransform(translationX: 0, y: self.view.bounds.height/2)
        // начальная точка - сдвинутое состояние (логин и пароль)
        let offset = view.bounds.width
        loginTextField.transform = CGAffineTransform(translationX: -offset, y: 0)
        passwordTextField.transform = CGAffineTransform(translationX: offset, y: 0)
        // прячем лого
        UIView.animate(withDuration: 0, animations: {
            self.vkImage.alpha = 0
        })
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        // Анимация
        // статус загрузки мигает
        UIView.animate(withDuration: 0.9,
                       delay: 0,
                       options: [.repeat, .autoreverse],
                       animations: { self.statusCircle1.alpha = 0 })
        UIView.animate(withDuration: 0.9,
                       delay: 0.4,
                       options: [.repeat, .autoreverse],
                       animations: { self.statusCircle2.alpha = 0 })
        UIView.animate(withDuration: 0.9,
                       delay: 0.8,
                       options: [.repeat, .autoreverse],
                       animations: { self.statusCircle3.alpha = 0 })
        // статус загрузки исчезает
        UIView.animate(withDuration: 0,
                       delay: 0 + 0.9 * 5,
                       animations: { self.statusCircle1.backgroundColor = .none })
        UIView.animate(withDuration: 0,
                       delay: 0.4 + 0.9 * 5,
                       animations: { self.statusCircle2.backgroundColor = .none })
        UIView.animate(withDuration: 0,
                       delay: 0.8 + 0.9 * 5,
                       animations: { self.statusCircle3.backgroundColor = .none })
        
        
        // конечная точка названия
        UIView.animate(withDuration: 1,
                       delay: 5.5,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0,
                       options: .curveEaseOut,
                       animations: {
                        self.loginLabel.transform = .identity
                        self.button.transform = .identity
        },
                       completion: nil)
        // конечная точка (логин и пароль)
        UIView.animate(withDuration: 0.5,
                       delay: 6.0,
                       options: .curveEaseOut,
                       animations: {
                        self.loginTextField.transform = .identity
                        self.passwordTextField.transform = .identity
        },
                       completion: nil)
        // появление лого
        UIView.animate(withDuration: 2,
                       delay: 0.5,
                       options: .curveEaseInOut,
                       animations: {self.vkImage.alpha = 1},
                       completion: nil)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // метод отписки от уведомлений при исчезновении контроллера с экрана
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    // исчезновение клавиатуры
    @objc func hideKeyboard() {
        self.scrollView?.endEditing(true)
    }
    
}
