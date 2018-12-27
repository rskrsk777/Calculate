//
//  ViewController.swift
//  Calculate
//
//  Created by ryosuke kubo on 2018/12/26.
//  Copyright © 2018 ryosuke kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonPlus: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonMines: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonAsterisk: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var buttonCal: UIButton!
    @IBOutlet weak var buttonDivision: UIButton!
    
    // 初期値のポジション x: 186 y:194
    @IBOutlet weak var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "シンプル計算機"
        
        
    }


}

