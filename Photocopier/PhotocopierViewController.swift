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
        
        backspaceButton = UIImageView(image: UIImage(named: "backButton"))
        backspaceButton.contentMode = .scaleAspectFit

        view.addSubview(backspaceButton)
        backspaceButton.snp.makeConstraints { (make) in
            make.centerY.equalTo(zeroLabel.snp.centerY)
            make.centerX.equalTo(sevenLabel.snp.centerX)
            make.height.equalTo(45)
        }
        
        backspaceButton.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.accountCode != "" {
                    self?.accountCode.remove(at: self!.accountCode.index(before: self!.accountCode.endIndex))
                    self?.updateAccountDisplay()
                }
            })
            .disposed(by: disposeBag)
        
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
                        self?.accountCode.append(contentsOf: number.text!)
                        self?.animateNumberPad(label: number)
                        self?.updateAccountDisplay()
                        if self?.accountCode.count == 4 {
                            self?.didCancel = false
                            self?.animateNumberPadExit()
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
        accountNameLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
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
                self?.didCancel = true
                self?.numberOfCopies = 1
                self?.pageBrightness = 0
                self?.paperSource = "A"
                self?.sides = "1-1"
                self?.separatorPage = "None"
                self?.transitionToLoggedOut()
            })
        .disposed(by: disposeBag)
    }
    
    private func displayNumberOfCopies() {
        numCopiesDescrLabel = UILabel()
        numCopiesDescrLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
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
        brightnessDescrLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
        brightnessDescrLabel.textColor = .white
        brightnessDescrLabel.text = "Page Brightness"
        brightnessDescrLabel.sizeToFit()
        brightnessDescrLabel.alpha = 0
        
        view.addSubview(brightnessDescrLabel)
        brightnessDescrLabel.snp.makeConstraints { (make) in
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(50)
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
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(50)
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
            make.top.equalTo(numCopiesSlider.snp.bottom).offset(50)
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
        
        startLabel.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.transitionToPrinting()
            })
        .disposed(by: disposeBag)
    }
    
    private func displayPageSource() {
        pageSourceLabel = UILabel()
        pageSourceLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
        pageSourceLabel.textColor = .white
        pageSourceLabel.text = "Paper Source"
        pageSourceLabel.sizeToFit()
        pageSourceLabel.alpha = 0
        
        view.addSubview(pageSourceLabel)
        pageSourceLabel.snp.makeConstraints { (make) in
            make.top.equalTo(seperatorLabel.snp.top)
            make.left.equalTo(titleLabel.snp.left)
        }
        
        pageSrcABackgroundView = RoundShadowView(frame: CGRect(x: 50, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        pageSrcABackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        pageSrcABackgroundView.layer.cornerRadius = 75/2
        pageSrcABackgroundView.alpha = 0
        
        view.addSubview(pageSrcABackgroundView)
        
        pageSrcALabel = UILabel()
        pageSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        pageSrcALabel.textColor = .white
        pageSrcALabel.text = "Tray A"
        pageSrcALabel.sizeToFit()
        pageSrcALabel.alpha = 0
        
        view.addSubview(pageSrcALabel)
        pageSrcALabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(pageSrcABackgroundView.snp.centerX)
            make.centerY.equalTo(pageSrcABackgroundView.snp.centerY)
        }
        
        pageSrcABackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.paperSource != "A" {
                    self?.paperSource = "A"
                    self?.pageSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.pageSrcALabel.textColor = .white
                    self?.pageSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcALabel)
                    self?.pageSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcBLabel.textColor = .lightGray
                    self?.pageSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcBLabel)
                    self?.pageSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcCLabel.textColor = .lightGray
                    self?.pageSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcCLabel)
                }
            })
            .disposed(by: disposeBag)
        
        pageSrcBBackgroundView = RoundShadowView(frame: CGRect(x: 50 + 100 + 30, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        pageSrcBBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        pageSrcBBackgroundView.layer.cornerRadius = 75/2
        pageSrcBBackgroundView.alpha = 0
        
        view.addSubview(pageSrcBBackgroundView)
        
        pageSrcBLabel = UILabel()
        pageSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        pageSrcBLabel.textColor = .lightGray
        pageSrcBLabel.text = "Tray B"
        pageSrcBLabel.sizeToFit()
        pageSrcBLabel.alpha = 0
        
        view.addSubview(pageSrcBLabel)
        pageSrcBLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(pageSrcBBackgroundView.snp.centerX)
            make.centerY.equalTo(pageSrcBBackgroundView.snp.centerY)
        }
        
        pageSrcBBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.paperSource != "B" {
                    self?.paperSource = "B"
                    self?.pageSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.pageSrcBLabel.textColor = .white
                    self?.pageSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcBLabel)
                    self?.pageSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcALabel.textColor = .lightGray
                    self?.pageSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcALabel)
                    self?.pageSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcCLabel.textColor = .lightGray
                    self?.pageSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcCLabel)
                }
            })
        .disposed(by: disposeBag)
        
        pageSrcCBackgroundView = RoundShadowView(frame: CGRect(x: 50 + 200 + 60, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        pageSrcCBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        pageSrcCBackgroundView.layer.cornerRadius = 75/2
        pageSrcCBackgroundView.alpha = 0
        
        view.addSubview(pageSrcCBackgroundView)
        
        pageSrcCLabel = UILabel()
        pageSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        pageSrcCLabel.textColor = .lightGray
        pageSrcCLabel.text = "Tray C"
        pageSrcCLabel.sizeToFit()
        pageSrcCLabel.alpha = 0
        
        view.addSubview(pageSrcCLabel)
        pageSrcCLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(pageSrcCBackgroundView.snp.centerX)
            make.centerY.equalTo(pageSrcCBackgroundView.snp.centerY)
        }
        
        pageSrcCBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.paperSource != "C" {
                    self?.paperSource = "C"
                    self?.pageSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.pageSrcCLabel.textColor = .white
                    self?.pageSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcCLabel)
                    self?.pageSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcALabel.textColor = .lightGray
                    self?.pageSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcALabel)
                    self?.pageSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.pageSrcBLabel.textColor = .lightGray
                    self?.pageSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.pageSrcBLabel)
                }
            })
        .disposed(by: disposeBag)
    }
    
    private func displaySides() {
        sidesLabel = UILabel()
        sidesLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
        sidesLabel.textColor = .white
        sidesLabel.text = "Sides"
        sidesLabel.sizeToFit()
        sidesLabel.alpha = 0
        
        view.addSubview(sidesLabel)
        sidesLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.view.snp.centerX).offset(50)
            make.centerY.equalTo(numCopiesLabel.snp.centerY)
        }
        
        oneToOneBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50, y: 250, width: 225, height: 100), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)

        oneToOneBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        oneToOneBackgroundView.layer.cornerRadius = 75/2
        oneToOneBackgroundView.alpha = 0
        
        view.addSubview(oneToOneBackgroundView)
        
        oneToOneBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.sides != "1-1" {
                    self?.sides = "1-1"
                    self?.oneToOneImageView.alpha = 1
                    self?.oneToTwoImageView.alpha = 0.25
                    self?.twoToOneImageView.alpha = 0.25
                    self?.twoToTwoImageView.alpha = 0.25
                }
            })
            .disposed(by: disposeBag)
        
        twoToTwoBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width - 50 - 225, y: 250, width: 225, height: 100), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)

        twoToTwoBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        twoToTwoBackgroundView.layer.cornerRadius = 75/2
        twoToTwoBackgroundView.alpha = 0
        
        view.addSubview(twoToTwoBackgroundView)
        
        twoToTwoBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.sides != "2-2" {
                    self?.sides = "2-2"
                    self?.oneToOneImageView.alpha = 0.25
                    self?.oneToTwoImageView.alpha = 0.25
                    self?.twoToOneImageView.alpha = 0.25
                    self?.twoToTwoImageView.alpha = 1
                }
            })
            .disposed(by: disposeBag)
        
        oneToTwoBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50, y: 375, width: 225, height: 100), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)

        oneToTwoBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        oneToTwoBackgroundView.layer.cornerRadius = 75/2
        oneToTwoBackgroundView.alpha = 0
        
        view.addSubview(oneToTwoBackgroundView)
        
        oneToTwoBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.sides != "1-2" {
                    self?.sides = "1-2"
                    self?.oneToOneImageView.alpha = 0.25
                    self?.oneToTwoImageView.alpha = 1
                    self?.twoToOneImageView.alpha = 0.25
                    self?.twoToTwoImageView.alpha = 0.25
                }
            })
            .disposed(by: disposeBag)
        
        twoToOneBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width - 50 - 225, y: 375, width: 225, height: 100), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)

        twoToOneBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        twoToOneBackgroundView.layer.cornerRadius = 75/2
        twoToOneBackgroundView.alpha = 0
        
        view.addSubview(twoToOneBackgroundView)
        
        twoToOneBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.sides != "2-1" {
                    self?.sides = "2-1"
                    self?.oneToOneImageView.alpha = 0.25
                    self?.oneToTwoImageView.alpha = 0.25
                    self?.twoToOneImageView.alpha = 1
                    self?.twoToTwoImageView.alpha = 0.25
                }
            })
            .disposed(by: disposeBag)
        
        oneToOneImageView = UIImageView(image: UIImage(named: "oneToOne"))
        oneToOneImageView.contentMode = .scaleAspectFit
        oneToOneImageView.alpha = 0
        
        view.addSubview(oneToOneImageView)
        oneToOneImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.oneToOneBackgroundView.snp.centerX)
            make.centerY.equalTo(self.oneToOneBackgroundView.snp.centerY)
            make.width.equalTo(175)
        }
        
        twoToTwoImageView = UIImageView(image: UIImage(named: "twoToTwo"))
        twoToTwoImageView.contentMode = .scaleAspectFit
        twoToTwoImageView.alpha = 0
        
        view.addSubview(twoToTwoImageView)
        twoToTwoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.twoToTwoBackgroundView.snp.centerX)
            make.centerY.equalTo(self.twoToTwoBackgroundView.snp.centerY)
            make.width.equalTo(175)
        }
        
        oneToTwoImageView = UIImageView(image: UIImage(named: "oneToTwo"))
        oneToTwoImageView.contentMode = .scaleAspectFit
        oneToTwoImageView.alpha = 0
        
        view.addSubview(oneToTwoImageView)
        oneToTwoImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.oneToTwoBackgroundView.snp.centerX)
            make.centerY.equalTo(self.oneToTwoBackgroundView.snp.centerY)
            make.width.equalTo(175)
        }
        
        twoToOneImageView = UIImageView(image: UIImage(named: "twoToOne"))
        twoToOneImageView.contentMode = .scaleAspectFit
        twoToOneImageView.alpha = 0
        
        view.addSubview(twoToOneImageView)
        twoToOneImageView.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.twoToOneBackgroundView.snp.centerX)
            make.centerY.equalTo(self.twoToOneBackgroundView.snp.centerY)
            make.width.equalTo(175)
        }
    }
    
    private func displaySeparatorPage() {
        seperatorLabel = UILabel()
        seperatorLabel.font = UIFont.systemFont(ofSize: 36, weight: .thin)
        seperatorLabel.textColor = .white
        seperatorLabel.text = "Separator Page"
        seperatorLabel.sizeToFit()
        seperatorLabel.alpha = 0
        
        view.addSubview(seperatorLabel)
        seperatorLabel.snp.makeConstraints { (make) in
            make.top.equalTo(oneToTwoBackgroundView.snp.bottom).offset(50)
            make.left.equalTo(sidesLabel.snp.left)
        }
        
        noSrcBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        noSrcBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        noSrcBackgroundView.layer.cornerRadius = 75/2
        noSrcBackgroundView.alpha = 0
        
        view.addSubview(noSrcBackgroundView)
        
        noSrcLabel = UILabel()
        noSrcLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        noSrcLabel.textColor = .white
        noSrcLabel.text = "None"
        noSrcLabel.sizeToFit()
        noSrcLabel.alpha = 0
        
        view.addSubview(noSrcLabel)
        noSrcLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(noSrcBackgroundView.snp.centerX)
            make.centerY.equalTo(noSrcBackgroundView.snp.centerY)
        }
        
        noSrcBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.separatorPage != "None" {
                    self?.separatorPage = "None"
                    self?.sepSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcCLabel.textColor = .lightGray
                    self?.sepSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcCLabel)
                    self?.sepSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcALabel.textColor = .lightGray
                    self?.sepSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcALabel)
                    self?.sepSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcBLabel.textColor = .lightGray
                    self?.sepSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcBLabel)
                    self?.noSrcLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.noSrcLabel.textColor = .white
                    self?.noSrcLabel.sizeToFit()
                    self?.view.addSubview(self!.noSrcLabel)
                }
            })
        .disposed(by: disposeBag)
        
        sepSrcABackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50 + 100 + 30, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        sepSrcABackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        sepSrcABackgroundView.layer.cornerRadius = 75/2
        sepSrcABackgroundView.alpha = 0
        
        view.addSubview(sepSrcABackgroundView)
        
        sepSrcALabel = UILabel()
        sepSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        sepSrcALabel.textColor = .lightGray
        sepSrcALabel.text = "Tray A"
        sepSrcALabel.sizeToFit()
        sepSrcALabel.alpha = 0
        
        view.addSubview(sepSrcALabel)
        sepSrcALabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(sepSrcABackgroundView.snp.centerX)
            make.centerY.equalTo(sepSrcABackgroundView.snp.centerY)
        }
        
        sepSrcABackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.separatorPage != "A" {
                    self?.separatorPage = "A"
                    self?.sepSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.sepSrcALabel.textColor = .white
                    self?.sepSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcALabel)
                    self?.sepSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcBLabel.textColor = .lightGray
                    self?.sepSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcALabel)
                    self?.sepSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcCLabel.textColor = .lightGray
                    self?.sepSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcCLabel)
                    self?.noSrcLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.noSrcLabel.textColor = .lightGray
                    self?.noSrcLabel.sizeToFit()
                    self?.view.addSubview(self!.noSrcLabel)
                }
            })
            .disposed(by: disposeBag)
        
        sepSrcBBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50 + 200 + 60, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        sepSrcBBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        sepSrcBBackgroundView.layer.cornerRadius = 75/2
        sepSrcBBackgroundView.alpha = 0
        
        view.addSubview(sepSrcBBackgroundView)
        
        sepSrcBLabel = UILabel()
        sepSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        sepSrcBLabel.textColor = .lightGray
        sepSrcBLabel.text = "Tray B"
        sepSrcBLabel.sizeToFit()
        sepSrcBLabel.alpha = 0
        
        view.addSubview(sepSrcBLabel)
        sepSrcBLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(sepSrcBBackgroundView.snp.centerX)
            make.centerY.equalTo(sepSrcBBackgroundView.snp.centerY)
        }
        
        sepSrcBBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.separatorPage != "B" {
                    self?.separatorPage = "B"
                    self?.sepSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.sepSrcBLabel.textColor = .white
                    self?.sepSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcBLabel)
                    self?.sepSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcALabel.textColor = .lightGray
                    self?.sepSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcALabel)
                    self?.sepSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcCLabel.textColor = .lightGray
                    self?.sepSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcCLabel)
                    self?.noSrcLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.noSrcLabel.textColor = .lightGray
                    self?.noSrcLabel.sizeToFit()
                    self?.view.addSubview(self!.noSrcLabel)
                }
            })
        .disposed(by: disposeBag)
        
        sepSrcCBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 + 50 + 300 + 90, y: self.view.frame.height - 50 - 195, width: 100, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)
        sepSrcCBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        sepSrcCBackgroundView.layer.cornerRadius = 75/2
        sepSrcCBackgroundView.alpha = 0
        
        view.addSubview(sepSrcCBackgroundView)
        
        sepSrcCLabel = UILabel()
        sepSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
        sepSrcCLabel.textColor = .lightGray
        sepSrcCLabel.text = "Tray C"
        sepSrcCLabel.sizeToFit()
        sepSrcCLabel.alpha = 0
        
        view.addSubview(sepSrcCLabel)
        sepSrcCLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(sepSrcCBackgroundView.snp.centerX)
            make.centerY.equalTo(sepSrcCBackgroundView.snp.centerY)
        }
        
        sepSrcCBackgroundView.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                if self?.separatorPage != "C" {
                    self?.separatorPage = "C"
                    self?.sepSrcCLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
                    self?.sepSrcCLabel.textColor = .white
                    self?.sepSrcCLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcCLabel)
                    self?.sepSrcALabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcALabel.textColor = .lightGray
                    self?.sepSrcALabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcALabel)
                    self?.sepSrcBLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.sepSrcBLabel.textColor = .lightGray
                    self?.sepSrcBLabel.sizeToFit()
                    self?.view.addSubview(self!.sepSrcBLabel)
                    self?.noSrcLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
                    self?.noSrcLabel.textColor = .lightGray
                    self?.noSrcLabel.sizeToFit()
                    self?.view.addSubview(self!.noSrcLabel)
                }
            })
        .disposed(by: disposeBag)
    }
    
    private func displayCancelButton() {
        cancelBackgroundView = RoundShadowView(frame: CGRect(x: self.view.frame.width/2 - 100, y: self.view.frame.height - 50 - 75, width: 200, height: 75), cornerRadius: 75/2, shadowRadius: 4, shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 0.85, shadowColor: UIColor.clear.cgColor)

        cancelBackgroundView.backgroundColor = UIColor(red: 39/255, green: 41/255, blue: 45/255, alpha: 1.0)
        cancelBackgroundView.layer.cornerRadius = 75/2
        cancelBackgroundView.alpha = 0
        
        view.addSubview(cancelBackgroundView)
        
        cancelLabel = UILabel()
        cancelLabel.font = UIFont.systemFont(ofSize: 36, weight: .regular)
        cancelLabel.textColor = .red
        cancelLabel.text = "Cancel"
        cancelLabel.sizeToFit()
        cancelLabel.alpha = 0
        
        view.addSubview(cancelLabel)
        cancelLabel.snp.makeConstraints { (make) in
            make.centerX.equalTo(cancelBackgroundView.snp.centerX)
            make.centerY.equalTo(cancelBackgroundView.snp.centerY)
        }
        
        cancelLabel.rx
            .tapGesture()
            .when(.recognized)
            .subscribe(onNext: { [weak self] _ in
                self?.didCancel = true
            })
        .disposed(by: disposeBag)
    }
    
    private func displayPrintStatus() {
        statusLabel = UILabel()
        statusLabel.font = UIFont.systemFont(ofSize: 64, weight: .thin)
        statusLabel.text = "Printing copy 1 of \(self.numberOfCopies)"
        statusLabel.textColor = .white
        statusLabel.sizeToFit()

        view.addSubview(statusLabel)
        statusLabel.snp.makeConstraints { (make) in
            make.bottom.equalTo(self.view.snp.centerY).offset(-12.5)
            make.centerX.equalTo(self.view.snp.centerX)
        }
        
        progressView = UIProgressView()
        progressView.progress = 0.0
        progressView.progressTintColor = .green
        progressView.progressViewStyle = .default
        progressView.alpha = 0
        
        view.addSubview(progressView)
        progressView.snp.makeConstraints { (make) in
            make.top.equalTo(self.statusLabel.snp.bottom).offset(25)
            make.centerX.equalTo(self.view.snp.centerX)
            make.width.equalTo(self.statusLabel.snp.width)
        }
    }
    
    private func updatePrintStatus() {
        var runCount = 1

        Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { timer in
            self.statusLabel.text = "Printing copy " + String(runCount) + " of " + String(self.numberOfCopies)
            self.progressView.setProgress(Float(runCount)/Float(self.numberOfCopies), animated: true)
            runCount += 1
            
            if self.didCancel {
                timer.invalidate()
                self.animateLoggedInExit()
                self.transitionToLoggedIn()
                self.numberOfCopies = 1
                self.pageBrightness = 0
                self.paperSource = "A"
                self.sides = "1-1"
                self.separatorPage = "None"
                self.didCancel = false
            } else {
                if runCount == (self.numberOfCopies+1) {
                    timer.invalidate()
                    self.animateLoggedInExit()
                    self.numberOfCopies = 1
                    self.pageBrightness = 0
                    self.paperSource = "A"
                    self.sides = "1-1"
                    self.separatorPage = "None"
                    self.transitionToLoggedIn()
                }
            }
        }
    }

    
    // MARK: - Transition
    
    private func transitionToLoggedOut() {
        animateLoggedOutEntrance()
    }
    
    private func transitionToLoggedIn() {
        // Menu
        displayHeader()
        displayNumberOfCopies()
        displayBrightness()
        displayStartButton()
        displaySides()
        displaySeparatorPage()
        displayPageSource()
        animateMenuEntrance()
    }
    
    private func transitionToPrinting() {
        animateLoggedInExit()
        
        displayCancelButton()
        displayPrintStatus()
        animatePrintingEntrance()
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
            self.backspaceButton.alpha = 0
        })
        
        animator.addCompletion { _ in
            self.borderLine.removeFromSuperview()
            self.enterLabel.removeFromSuperview()
            self.accountLabel.removeFromSuperview()
            for label in self.numberPad {
                label.removeFromSuperview()
            }
            self.numberPad = []
            self.backspaceButton.removeFromSuperview()
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
            self.pageSrcALabel.alpha = 1
            self.pageSrcBBackgroundView.alpha = 1
            self.pageSrcBLabel.alpha = 1
            self.pageSrcCBackgroundView.alpha = 1
            self.pageSrcCLabel.alpha = 1
            self.sidesLabel.alpha = 1
            self.oneToOneBackgroundView.alpha = 1
            self.twoToTwoBackgroundView.alpha = 1
            self.oneToTwoBackgroundView.alpha = 1
            self.twoToOneBackgroundView.alpha = 1
            self.oneToOneImageView.alpha = 1
            self.twoToTwoImageView.alpha = 0.25
            self.oneToTwoImageView.alpha = 0.25
            self.twoToOneImageView.alpha = 0.25
            self.seperatorLabel.alpha = 1
            self.noSrcLabel.alpha = 1
            self.noSrcBackgroundView.alpha = 1
            self.sepSrcALabel.alpha = 1
            self.sepSrcBLabel.alpha = 1
            self.sepSrcCLabel.alpha = 1
            self.sepSrcABackgroundView.alpha = 1
            self.sepSrcBBackgroundView.alpha = 1
            self.sepSrcCBackgroundView.alpha = 1
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
    
    private func animateLoggedInExit() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeOut, animations: {
            for view in self.view.subviews {
                if view != self.titleLabel && view != self.accountNameLabel && view != self.logoutLabel {
                    view.alpha = 0
                }
            }
        })

        animator.startAnimation()
    }
    
    private func animatePrintingEntrance() {
        let animator = UIViewPropertyAnimator(duration: 0.5, curve: .easeIn, animations: {
            self.cancelBackgroundView.alpha = 1
            self.cancelLabel.alpha = 1
            self.statusLabel.alpha = 1
            self.progressView.alpha = 1
        })
        
        animator.addCompletion { _ in
            self.updatePrintStatus()
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
    private var backspaceButton: UIImageView!
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
    
    // Paper Source
    private var pageSourceLabel: UILabel!
    private var pageSrcALabel: UILabel!
    private var pageSrcABackgroundView: RoundShadowView!
    private var pageSrcBLabel: UILabel!
    private var pageSrcBBackgroundView: RoundShadowView!
    private var pageSrcCLabel: UILabel!
    private var pageSrcCBackgroundView: RoundShadowView!
    
    // Sides
    private var sidesLabel: UILabel!
    private var oneToOneImageView: UIImageView!
    private var oneToOneBackgroundView: RoundShadowView!
    private var oneToTwoImageView: UIImageView!
    private var oneToTwoBackgroundView: RoundShadowView!
    private var twoToTwoImageView: UIImageView!
    private var twoToTwoBackgroundView: RoundShadowView!
    private var twoToOneImageView: UIImageView!
    private var twoToOneBackgroundView: RoundShadowView!
    
    // Separator Page
    private var seperatorLabel: UILabel!
    private var sepSrcALabel: UILabel!
    private var sepSrcABackgroundView: RoundShadowView!
    private var sepSrcBLabel: UILabel!
    private var sepSrcBBackgroundView: RoundShadowView!
    private var sepSrcCLabel: UILabel!
    private var sepSrcCBackgroundView: RoundShadowView!
    private var noSrcLabel: UILabel!
    private var noSrcBackgroundView: RoundShadowView!
    
    // Cancel Button
    private var cancelBackgroundView: RoundShadowView!
    private var cancelLabel: UILabel!
    private var didCancel: Bool = false
    
    // Printing Status
    private var statusLabel: UILabel!
    private var progressView: UIProgressView!
    
    // Animation + Interaction
    private var generator = UIImpactFeedbackGenerator(style: .heavy)
    
    // Rx
    private let disposeBag = DisposeBag()
}

