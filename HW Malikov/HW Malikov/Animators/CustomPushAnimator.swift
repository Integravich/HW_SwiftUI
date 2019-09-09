//
//  CustomPushAnimator.swift
//  HW Malikov
//
//  Created by Andrey Malikov on 08/09/2019.
//  Copyright © 2019 Andrey Malikov. All rights reserved.
//

import UIKit

final class CustomPushAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.6
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        // Сначала получаем текущий и следующий view controller:
        guard let source = transitionContext.viewController(forKey: .from) else { return }
        guard let destination = transitionContext.viewController(forKey: .to) else { return }
        
        // Затем добавляем следующий view controller в контейнер и задаем начальные frame и transform:
        // Изначально следующий view controller находится справа за пределами экрана
        transitionContext.containerView.addSubview(destination.view)
        destination.view.frame = source.view.frame
        destination.view.transform = CGAffineTransform(translationX: source.view.frame.width, y: 0)
        
        // Далее необходимо создать keyframe-анимацию, которая будет состоять из трех кадров:
        // ●    на первом будет удаляться текущий view controller;
        // ●    на втором следующий view controller будет немного увеличиваться и накрывать текущий;
        // ●    на последнем кадре следующий view controller полностью накроет текущий.
        
        // Осталось вставить эти keyframe в анимацию и правильно обработать completion-блок:
        UIView.animateKeyframes(withDuration: self.transitionDuration(using: transitionContext),
                                delay: 0,
                                options: .calculationModePaced,
                                animations: {
                                    // Первый:
                                    UIView.addKeyframe(withRelativeStartTime: 0,
                                                       relativeDuration: 0.75,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: -200, y: 0)
                                                        let scale = CGAffineTransform(scaleX: 0.8, y: 0.8)
                                                        source.view.transform = translation.concatenating(scale)
                                    })
                                    // Второй:
                                    UIView.addKeyframe(withRelativeStartTime: 0.2,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        let translation = CGAffineTransform(translationX: source.view.frame.width / 2, y: 0)
                                                        let scale = CGAffineTransform(scaleX: 1.2, y: 1.2)
                                                        destination.view.transform = translation.concatenating(scale)
                                    })
                                    // Третий:
                                    UIView.addKeyframe(withRelativeStartTime: 0.6,
                                                       relativeDuration: 0.4,
                                                       animations: {
                                                        destination.view.transform = .identity
                                    })
        }) { finished in
            if finished && !transitionContext.transitionWasCancelled {
                source.view.transform = .identity
            }
            transitionContext.completeTransition(finished && !transitionContext.transitionWasCancelled)
            // Заметьте, что в completion-блоке мы возвращаем текущему view прежнюю трансформацию, если анимация закончилась и переход не был отменен. Это нужно, чтобы трансформация всегда была правильной, если будем переходить с одного экрана на другой и возвращаться несколько раз.
        }
    }
    
}
