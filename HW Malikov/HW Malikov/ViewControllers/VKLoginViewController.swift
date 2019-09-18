//
//  VKLoginViewController.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 18/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit
import WebKit

class VKLoginViewController: UIViewController, WKNavigationDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // мы создаем URL https://oauth.vk.com/authorize и добавляем ему необходимые параметры. Создаем из URL запрос – URLRequest, – согласно документации. После открываем страницу с помощью метода  webview.load(request).
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7138996"), // id моего приложения VK
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
        // Если мы сейчас авторизуемся, увидим белый экран. Это потому, что мы никак не взаимодействуем со страницей и она живет своей жизнью. Необходимый токен содержится в URL страницы, на которую нас переадресуют после успешной авторизации. Необходимо отслеживать переходы между страницами. В этом нам поможет делегат WKNavigationDelegate.
    }
    
}

// реализуем метод, который перехватывает ответы сервера при переходе
extension VKLoginViewController {
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        // Первая часть кода проверяет URL, на который было совершено перенаправление. Если это нужный нам URL (/blank.html), и в нем есть токен, приступим к его обработке, если же нет, дадим зеленый свет на переход между страницами c помощью метода decisionHandler(.allow). Дальше мы просто режем строку с параметрами на части, используя как разделители символы & и =. В результате получаем словарь с параметрами.
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            decisionHandler(.allow)
            return
        }
        
        let params = fragment
            .components(separatedBy: "&")
            .map { $0.components(separatedBy: "=") }
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
        }
        
        let session = Session.instance // наш синглтон
        
        // запоминаем user id
        if let userId = params["user_id"] {
            session.userId = userId
            print("user id: \(userId)")
        }
        
        // запоминаем token
        if let token = params["access_token"] {
            session.token = token
            print("token: \(token)")
        }
    
        decisionHandler(.cancel)
        
        // переходим на следующий контроллер
        performSegue(withIdentifier: "VKLoginSegue", sender: nil)
        
    }
}

