

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
    var expressionArray:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "シンプル計算機"
        label.text = ""
        label.adjustsFontSizeToFitWidth = true
        buttonOne.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonTwo.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonThree.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonFour.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonFive.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonSix.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonSeven.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonEight.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonNine.addTarget(self, action: #selector(self.tappedNumber(_:)), for: .touchDown)
        buttonPlus.addTarget(self, action: #selector(self.tappedSymbol(_:)), for: .touchDown)
        buttonMines.addTarget(self, action: #selector(self.tappedSymbol(_:)), for: .touchDown)
        buttonAsterisk.addTarget(self, action: #selector(self.tappedSymbol(_:)), for: .touchDown)
        buttonDivision.addTarget(self, action: #selector(self.tappedSymbol(_:)), for: .touchDown)
        buttonCal.addTarget(self, action: #selector(self.tappedCal(_:)), for: .touchDown)
        buttonCancel.addTarget(self, action: #selector(self.tappendCancel(_:)), for: .touchDown)
    }
    
    @objc func tappedNumber (_ sender: UIButton) {
        if label.text == "+" || label.text == "-" || label.text == "*" || label.text == "/" {
            expressionArray.append(label.text!)
            label.text = ""
        }
        
        
        
        switch sender.titleLabel?.text! {
        case "1":
            label.text = label.text! + "1"
        case "2":
            label.text = label.text! + "2"
        case "3":
            label.text = label.text! + "3"
        case "4":
            label.text = label.text! + "4"
        case "5":
            label.text = label.text! + "5"
        case "6":
            label.text = label.text! + "6"
        case "7":
            label.text = label.text! + "7"
        case "8":
            label.text = label.text! + "8"
        case "9":
            label.text = label.text! + "9"
        default:
            print("0")
        }
    }
    
    @objc func tappedSymbol(_ sender: UIButton) {

        if label.text == "" || label.text == nil || label.text == "+" || label.text == "-" || label.text == "*" || label.text == "/"{
            return
        } else {
            expressionArray.append(label.text!)
        }
        
        switch sender.titleLabel?.text! {
        case "+":
            label.text = "+"
        case "-":
            label.text = "-"
        case "*":
            label.text = "*"
        case "/":
            label.text = "/"
        case .none:
            print("none")
        case .some(_):
            print("some")
        }
    }

    @objc func tappedCal(_ sender: UIButton) {
        expressionArray.append(label.text!)
        if let text = Int(expressionArray[expressionArray.count - 1]) {
            // 逆ポーランド記法にする
            var leftNum = 0
            var rightNum = 0
            var numberArray = [Int]()
            var symbolArray = [String]()
            for i in 0..<expressionArray.count {
                if let j = Int(expressionArray[i]) {
                    numberArray.append(j)
                } else {
                    symbolArray.append(expressionArray[i])
                }
            }
            var answer = 0
            var i = 0
            while i < numberArray.count {
                leftNum = numberArray[i]
                rightNum = numberArray[i + 1]
                let symbol = symbolArray[i]
                switch symbol {
                case "+":
                    answer = leftNum + rightNum
                case "-":
                    answer = leftNum - rightNum
                case "*":
                    answer = leftNum * rightNum
                case "/":
                    if leftNum == 0 || rightNum == 0 {
                        answer = leftNum / rightNum
                    }
                default:
                    print("Can't")
                }
                i += 2
            }
            label.text = String(answer)
            print(numberArray, symbolArray)
            expressionArray.removeAll()
            return
        } else {
            print("Cannot Calculate")
        }
        print(expressionArray)
        label.text = ""
        expressionArray = []
    }
    
    @objc func tappendCancel(_ sender: UIButton) {
        if let text = Int(label.text!), Int(label.text!)! > 10 {
            label.text = String(text / 10)
        } else {
            label.text = ""
        }
    }
}

