//
//  CustomNavigationController.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 08/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

// У UINavigationController два метода для реализации переходов: push и pop. У них есть анимация по умолчанию, но ее можно изменить — реализовать протокол UINavigationControllerDelegate и переопределить следующий метод navigationController
class CustomNavigationController: UINavigationController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        //Чтобы анимация заработала, нужно присвоить свойству UINavigationController.delegate нужный делегат:
        // self.navigationController?.delegate = // Объект, реализующий UINavigationControllerDelegate
        delegate = self
    }
    
    // Этот метод вызывается в момент перехода от одного экрана к другому. В качестве возвращаемого нужно передать такой же объект, который передавали для анимации обычного перехода в предыдущем разделе
    // Разберем параметры:
    //●    navigationController — это UINavigationController, который осуществляет переход;
    //●    animationControllerFor — это перечисление, обозначающее тип перехода и содержащее два значения: push и pop;
    //●    два последних параметра — это экраны, между которыми происходит переход.
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        // В зависимости от типа перехода возвращается тот или иной аниматор.
        if operation == .push {
            return CustomPushAnimator()
        } else if operation == .pop {
            return CustomPopAnimator()
        }
        return nil
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
