//
//  PhotocopierViewController.swift
//  Photocopier
//
//  Created by Varun Iyer on 11/12/19.
//  Copyright © 2019 ATeam. All rights reserved.
//

import UIKit
import SnapKit
import RxSwift
import RxGesture

class PhotocopierViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black

        // Login Screen
        displayTitle()
        displayEnter()
        displayNumberPad()
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Login Views
    
    private func displayTitle() {
        titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 100, weight: .bold)
        titleLabel.text = "Copy"
        titleLabel.textColor = .white
        titleLabel.sizeToFit()
        
        view.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(50)
            make.left.equalTo(self.view.snp.left).offset(50)
        }
    }
    
    private func displayEnter() {
        enterLabel = UILabel()
        enterLabel.font = UIFont.systemFont(ofSize: 48, weight: .thin)
        enterLabel.textColor = .white
        enterLabel.text = "Enter your account code"
        enterLabel.sizeToFit()
        
        view.addSubview(enterLabel)
        enterLabel.snp.makeConstraints { (make) in
            make.right.equalTo(self.view.snp.right).offset(-50)
            make.bottom.equalTo(self.titleLabel.snp.bottom)
        }
    }
    
    private func displayNumberPad() {
        borderLine = UIView()
        borderLine.layer.cornerRadius = 0.25
        borderLine.backgroundColor = .white
        
        view.addSubview(borderLine)
        borderLine.snp.makeConstraints { (make) in
            make.left.equalTo(self.enterLabel.snp.left)
            make.right.equalTo(self.enterLabel.snp.right)
            make.top.equalTo(self.enterLabel.snp.bottom).offset(25)
            make.height.equalTo(0.5)
        }
        
        accountLabel = UILabel()
        accountLabel.font = UIFont.systemFont(ofSize: 100, weight: .thin)
        accountLabel.textColor = .white
        accountLabel.text = accountCode
        accountLabel.addCharacterSpacing()
        accountLabel.sizeToFit()
        accountLabel.alpha = 1
        
        view.addSubview(accountLabel)
        accountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.snp.centerY)
            make.left.equalTo(titleLabel.snp.left).offset(100)
        }
        
        let twoLabel = UILabel()
        twoLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        twoLabel.textColor = .white
        twoLabel.text = "2"
        twoLabel.sizeToFit()
        
        view.addSubview(twoLabel)
        twoLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(borderLine.snp.centerX)
            make.top.equalTo(borderLine.snp.bottom).offset(50)
        }
        
        let oneLabel = UILabel()
        oneLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        oneLabel.textColor = .white
        oneLabel.text = "1"
        oneLabel.sizeToFit()
        
        view.addSubview(oneLabel)
        oneLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(twoLabel.snp.centerY)
            make.right.equalTo(twoLabel.snp.left).offset(-100)
        }
        
        let threeLabel = UILabel()
        threeLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        threeLabel.textColor = .white
        threeLabel.text = "3"
        threeLabel.sizeToFit()
        
        view.addSubview(threeLabel)
        threeLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(twoLabel.snp.centerY)
            make.left.equalTo(twoLabel.snp.right).offset(100)
        }
        
        let fiveLabel = UILabel()
        fiveLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        fiveLabel.textColor = .white
        fiveLabel.text = "5"
        fiveLabel.sizeToFit()
        
        view.addSubview(fiveLabel)
        fiveLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(twoLabel.snp.centerX)
            make.top.equalTo(twoLabel.snp.bottom).offset(75)
        }
        
        let fourLabel = UILabel()
        fourLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        fourLabel.textColor = .white
        fourLabel.text = "4"
        fourLabel.sizeToFit()
        
        view.addSubview(fourLabel)
        fourLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(fiveLabel.snp.centerY)
            make.right.equalTo(fiveLabel.snp.left).offset(-100)
        }
        
        let sixLabel = UILabel()
        sixLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        sixLabel.textColor = .white
        sixLabel.text = "6"
        sixLabel.sizeToFit()
        
        view.addSubview(sixLabel)
        sixLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(fiveLabel.snp.centerY)
            make.left.equalTo(fiveLabel.snp.right).offset(100)
        }
        
        let eightLabel = UILabel()
        eightLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        eightLabel.textColor = .white
        eightLabel.text = "8"
        eightLabel.sizeToFit()
        
        view.addSubview(eightLabel)
        eightLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(fiveLabel.snp.centerX)
            make.top.equalTo(fiveLabel.snp.bottom).offset(75)
        }
        
        let sevenLabel = UILabel()
        sevenLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        sevenLabel.textColor = .white
        sevenLabel.text = "7"
        sevenLabel.sizeToFit()
        
        view.addSubview(sevenLabel)
        sevenLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(eightLabel.snp.centerY)
            make.right.equalTo(eightLabel.snp.left).offset(-100)
        }
        
        let nineLabel = UILabel()
        nineLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        nineLabel.textColor = .white
        nineLabel.text = "9"
        nineLabel.sizeToFit()
        
        view.addSubview(nineLabel)
        nineLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(eightLabel.snp.centerY)
            make.left.equalTo(eightLabel.snp.right).offset(100)
        }
        
        let zeroLabel = UILabel()
        zeroLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        zeroLabel.textColor = .white
        zeroLabel.text = "0"
        zeroLabel.sizeToFit()
        
        view.addSubview(zeroLabel)
        zeroLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(eightLabel.snp.centerX)
            make.top.equalTo(eightLabel.snp.bottom).offset(75)
        }
        
        let backspaceLabel = UILabel()

        backspaceLabel.font = UIFont.systemFont(ofSize: 48, weight: .regular)
        backspaceLabel.textColor = .red
        backspaceLabel.text = "<"
        backspaceLabel.sizeToFit()

        view.addSubview(backspaceLabel)
        backspaceLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(zeroLabel.snp.centerY)
            make.right.equalTo(zeroLabel.snp.left).offset(-100)
        }
        
        numberPad.append(oneLabel)
        numberPad.append(twoLabel)
        numberPad.append(threeLabel)
        numberPad.append(fourLabel)
        numberPad.append(fiveLabel)
        numberPad.append(sixLabel)
        numberPad.append(sevenLabel)
        numberPad.append(eightLabel)
        numberPad.append(nineLabel)
        numberPad.append(zeroLabel)
        numberPad.append(backspaceLabel)
        
        for number in numberPad {
            let button = UIView()
            button.layer.cornerRadius = 50
            button.backgroundColor = .clear
            view.addSubview(button)
            button.snp.makeConstraints { (make) in
                make.centerX.equalTo(number.snp.centerX)
                make.centerY.equalTo(number.snp.centerY)
                make.height.equalTo(100)
                make.width.equalTo(100)
            }
            
            
            button.rx
                .tapGesture()
                .when(.recognized)
                .subscribe(onNext: { [weak self] _ in
                    if (self?.accountCode.count)! < 4 {
                        self?.generator.impactOccurred()
                        if number.text == "<" {
                            self?.accountCode.remove(at: self!.accountCode.index(before: self!.accountCode.endIndex))
                        } else {
                            self?.accountCode.append(contentsOf: number.text!)
                        }
                        self?.animateNumberPad(label: number)
                        self?.updateAccountDisplay()
                        if self?.accountCode.count == 4 {
                            self?.transitionToLoggedIn()
                        }
                    }
                })
            .disposed(by: disposeBag)
            
            numberPadButtons.append(button)
        }
    }
    
    private func updateAccountDisplay() {
        accountLabel.text = accountCode
        accountLabel.addCharacterSpacing()
        accountLabel.sizeToFit()
        
        view.addSubview(accountLabel)
        accountLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self.view.snp.centerY)
            make.left.equalTo(titleLabel.snp.left).offset(100)
        }
    }
    
    // MARK: - Menu Views
    
    private func displayHeader() {
        accountNameLabel = UILabel()
        accountNameLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        accountNameLabel.textColor = .white
        accountNameLabel.text = "Account Code: #\(accountCode)"
        accountNameLabel.sizeToFit()
        accountNameLabel.alpha = 0
        
        view.addSubview(accountNameLabel)
        accountNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.top).offset(5)
            make.right.equalTo(self.view.snp.right).offset(-50)
        }
        
        logoutLabel = UILabel()
        logoutLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        logoutLabel.textColor = .red
        logoutLabel.text = "Logout"
        logoutLabel.sizeToFit()
        logoutLabel.alpha = 0
        
        view.addSubview(logoutLabel)
        logoutLabel.snp.makeConstraints { (make) in
            make.top.equalTo(accountNameLabel.snp.bottom).offset(5)
            make.right.equalTo(self.view.snp.right).offset(-50)
        }
        
        logoutLabel.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.accountCode = ""
                self?.transitionToLoggedOut()
            })
        .disposed(by: disposeBag)
    }
    
    private func displayNumberOfCopies() {
        numCopiesDescrLabel = UILabel()
        numCopiesDescrLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        numCopiesDescrLabel.textColor = .white
        numCopiesDescrLabel.text = "Number of Copies"
        numCopiesDescrLabel.sizeToFit()
        numCopiesDescrLabel.alpha = 0
        
        view.addSubview(numCopiesDescrLabel)
        numCopiesDescrLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        numCopiesLabel = UILabel()
        numCopiesLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        numCopiesLabel.textColor = .white
        numCopiesLabel.text = "\(numberOfCopies)"
        numCopiesLabel.sizeToFit()
        numCopiesLabel.alpha = 0
        
        view.addSubview(numCopiesLabel)
        numCopiesLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.right.equalTo(self.view.snp.centerX).offset(-25)
        }
        
        numCopiesSlider = UISlider()
        numCopiesSlider.minimumValue = 1
        numCopiesSlider.maximumValue = 200
        numCopiesSlider.alpha = 0
        
        view.addSubview(numCopiesSlider)
        numCopiesSlider.snp.makeConstraints { (make) in
            make.top.equalTo(numCopiesDescrLabel.snp.bottom).offset(25)
            make.height.equalTo(50)
            make.left.equalTo(numCopiesDescrLabel.snp.left)
            make.right.equalTo(numCopiesLabel.snp.right)
        }
        
        numCopiesSlider.rx
            .value
            .subscribe(onNext: { [weak self] (value) in
                self?.numberOfCopies = Int(round(value))
                self?.updateNumberOfCopies()
            })
        .disposed(by: disposeBag)
    }
    
    private func updateNumberOfCopies() {
        numCopiesLabel.text = "\(numberOfCopies)"
        view.addSubview(numCopiesLabel)
        numCopiesLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(25)
            make.right.equalTo(self.view.snp.centerX).offset(-25)
        }
    }
    
    private func displayBrightness() {
        brightnessDescrLabel = UILabel()
        brightnessDescrLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        brightnessDescrLabel.textColor = .white
        brightnessDescrLabel.text = "Page Brightness"
        brightnessDescrLabel.sizeToFit()
        brightnessDescrLabel.alpha = 0
        
        view.addSubview(brightnessDescrLabel)
        brightnessDescrLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(25)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        brightnessLabel = UILabel()
        brightnessLabel.font = UIFont.systemFont(ofSize: 36, weight: .bold)
        brightnessLabel.textColor = .white
        brightnessLabel.text = "\(pageBrightness)%"
        brightnessLabel.sizeToFit()
        brightnessLabel.alpha = 0
        
        view.addSubview(brightnessLabel)
        brightnessLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(25)
            make.right.equalTo(self.view.snp.centerX).offset(-25)
        }
        
        brightnessSlider = UISlider()
        brightnessSlider.minimumValue = -100
        brightnessSlider.maximumValue = 100
        brightnessSlider.setValue(0, animated: false)
        brightnessSlider.alpha = 0
        
        view.addSubview(brightnessSlider)
        brightnessSlider.snp.makeConstraints { (make) in
            make.top.equalTo(brightnessDescrLabel.snp.bottom).offset(25)
            make.height.equalTo(50)
            make.left.equalTo(brightnessDescrLabel.snp.left)
            make.right.equalTo(brightnessLabel.snp.right)
        }
        
        brightnessSlider.rx
            .value
            .subscribe(onNext: { [weak self] (value) in
                self?.pageBrightness = Int(round(value))
                self?.updateBrightness()
            })
        .disposed(by: disposeBag)
    }
    
    private func updateBrightness() {
        brightnessLabel.text = "\(pageBrightness)%"
        view.addSubview(brightnessLabel)
        brightnessLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(25)
            make.right.equalTo(self.view.snp.centerX).offset(-25)
        }
    }
    
    private func displayStartButton() {
        startBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height - 50 - 75, width: 200, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        startBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        startBackgroundView.layer.cornerRadius = 75/2
        startBackgroundView.alpha = 0
        
        view.addSubview(startBackgroundView)
        
        startLabel = UILabel()
        startLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        startLabel.textColor = .green
        startLabel.text = "Start"
        startLabel.sizeToFit()
        startLabel.alpha = 0
        
        view.addSubview(startLabel)
        startLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(startBackgroundView.snp.centerX)
            make.centerY.equalTo(startBackgroundView.snp.centerY)
        }
    }
    
    private func displayPageSource() {
        pageSourceLabel = UILabel()
        pageSourceLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        pageSourceLabel.textColor = .white
        pageSourceLabel.text = "Page Source"
        pageSourceLabel.sizeToFit()
        pageSourceLabel.alpha = 0
        
        view.addSubview(pageSourceLabel)
        pageSourceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(brightnessSlider.snp.bottom).offset(25)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        pageSrcABackgroundView = RoundShadowView(frame: CGRect(x: 50, y: self.view.frame.height - 50 - 235, width: 150, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.green.cgColor)
        pageSrcABackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        pageSrcABackgroundView.layer.cornerRadius = 75/2
        pageSrcABackgroundView.alpha = 0
        
        view.addSubview(pageSrcABackgroundView)
    }
    
    // MARK: - Transition
    
    private func transitionToLoggedOut() {
        animateLoggedOutEntrance()
    }
    
    private func transitionToLoggedIn() {
        animateNumberPadExit()
        
        // Menu
        displayHeader()
        displayNumberOfCopies()
        displayBrightness()
        displayStartButton()
        displayPageSource()
        animateMenuEntrance()
    }
    
    // MARK: - Animation
    
    private func animateNumberPad(label: UILabel) {
        let animator1 = UIViewPropertyAnimator(duration: 0.05, curve: .easeIn, animations: {
            label.alpha = 0.5
        })
        
        let animator2 = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            label.alpha = 1.0
        })
        
        animator1.addCompletion { _ in
            animator2.startAnimation()
        }

        animator1.startAnimation()
    }
    
    private func animateNumberPadExit() {
        for button in numberPadButtons {
            button.removeFromSuperview()
        }
        
        let animator = UIViewPropertyAnimator(duration: 0.25, curve: .easeIn, animations: {
            self.borderLine.alpha = 0
            self.enterLabel.alpha = 0
            self.accountLabel.alpha = 0
            for label in self.numberPad {
                label.alpha = 0
            }
        })
        
        animator.addCompletion { _ in
            self.borderLine.removeFromSuperview()
            self.enterLabel.removeFromSuperview()
            self.accountLabel.removeFromSuperview()
            for label in self.numberPad {
                label.removeFromSuperview()
            }
            self.numberPad = []
        }
        
        animator.startAnimation()
    }
    
    private func animateMenuEntrance() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.accountNameLabel.alpha = 1
            self.logoutLabel.alpha = 1
            self.numCopiesLabel.alpha = 1
            self.numCopiesDescrLabel.alpha = 1
            self.numCopiesSlider.alpha = 1
            self.brightnessDescrLabel.alpha = 1
            self.brightnessLabel.alpha = 1
            self.brightnessSlider.alpha = 1
            self.startBackgroundView.alpha = 1
            self.startLabel.alpha = 1
            self.pageSourceLabel.alpha = 1
            self.pageSrcABackgroundView.alpha = 1
        })
        
        animator.startAnimation()
    }
    
    private func animateLoggedOutEntrance() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            for view in self.view.subviews {
                if view != self.titleLabel {
                    view.alpha = 0
                }
            }
        })
        
        animator.addCompletion { _ in
            for view in self.view.subviews {
                if view != self.titleLabel {
                    view.removeFromSuperview()
                }
            }
            self.displayEnter()
            self.displayNumberPad()
        }
        
        animator.startAnimation()
    }
    
    // MARK: - Variables
    
    private var accountCode: String = ""
    private var numberOfCopies: Int = 1
    private var pageBrightness: Int = 0
    private var paperSource: String = "A"
    private var sides: String = "1-1"
    private var separatorPage: String = "None"
    
    // Views
    private var titleLabel: UILabel!
    
    // Login
    private var enterLabel: UILabel!
    private var borderLine: UIView!
    private var numberPad: [UILabel] = []
    private var numberPadButtons: [UIView] = []
    private var accountLabel: UILabel!
    
    // Header
    private var accountNameLabel: UILabel!
    private var logoutLabel: UILabel!
    
    // Number of Copies
    private var numCopiesDescrLabel: UILabel!
    private var numCopiesLabel: UILabel!
    private var numCopiesSlider: UISlider!
    
    // Page Brightness
    private var brightnessDescrLabel: UILabel!
    private var brightnessLabel: UILabel!
    private var brightnessSlider: UISlider!
    
    // Start Button
    private var startBackgroundView: RoundShadowView!
    private var startLabel: UILabel!
    
    // Page Source
    private var pageSourceLabel: UILabel!
    private var pageSrcALabel: UILabel!
    private var pageSrcABackgroundView: RoundShadowView!
    private var pageSrcBLabel: UILabel!
    private var pageSrcBBackgroundView: RoundShadowView!
    private var pageSrcCLabel: UILabel!
    private var pageSrcCBackgroundView: RoundShadowView!
    
    // Animation + Interaction
    private var generator = UIImpactFeedbackGenerator(style: .heavy)
    
    // Rx
    private let disposeBag = DisposeBag()
}

