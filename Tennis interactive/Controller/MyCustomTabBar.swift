//
//  MyCustomTabBar.swift
//  Soccer
//
//  Created by Anish on 9/28/22.
//

import UIKit

class MyCustomTabBar: UIViewController {

  
    @IBOutlet weak var btn1View: UIView!
    @IBOutlet weak var btn2View: UIView!
    @IBOutlet weak var btn3View: UIView!
    @IBOutlet weak var btn4View: UIView!
    @IBOutlet weak var btn5View: UIView!
    @IBOutlet weak var btn6View: UIView!
    
    //@IBOutlet var buttons:[UIButton]!
    @IBOutlet var buttons:[UIButton]!
    @IBOutlet var tabView:UIView!
    
    var footerHeight: CGFloat = 70
    var selectedIndex: Int = 0
    var previousIndex: Int = 0
    var viewControllers = [UIViewController]()
    var selectedBtnColor = UIColor(hex:"41454B")
    
    static let firstVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TennisMatchViewController")
    static let secondVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TennisBetViewController")
    static let thirdVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NewsTennisViewController")
    static let fourthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TennisNotesVC")
    
    static let fifthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TennisCalanderVC")
    static let sixthVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "GameViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewControllers.append(MyCustomTabBar.firstVC)
        viewControllers.append(MyCustomTabBar.secondVC)
        viewControllers.append(MyCustomTabBar.thirdVC)
        viewControllers.append(MyCustomTabBar.fourthVC)
        viewControllers.append(MyCustomTabBar.fifthVC)
        viewControllers.append(MyCustomTabBar.sixthVC)
        
        buttons[selectedIndex].isSelected = true
        tabChanged(sender: buttons[selectedIndex])
        
    }
    
    //MARK:- ACTIONS
    @IBAction func tabChanged(sender:UIButton) {
        previousIndex = selectedIndex
        selectedIndex = sender.tag
        
        buttons[previousIndex].isSelected = false
        
        if selectedIndex == 0 {
            self.btn1View.backgroundColor = selectedBtnColor
            self.btn2View.backgroundColor = UIColor.clear
            self.btn3View.backgroundColor = UIColor.clear
            self.btn4View.backgroundColor = UIColor.clear
            self.btn5View.backgroundColor = UIColor.clear
            self.btn6View.backgroundColor = UIColor.clear
            self.buttons[0].setImage(UIImage(named: "t1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "u2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "u3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "u4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "u5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "u6"), for: .normal)
           
        }else if selectedIndex == 1{
            self.btn1View.backgroundColor = UIColor.clear
            self.btn2View.backgroundColor = selectedBtnColor
            self.btn3View.backgroundColor = UIColor.clear
            self.btn4View.backgroundColor = UIColor.clear
            self.btn5View.backgroundColor = UIColor.clear
            self.btn6View.backgroundColor = UIColor.clear
            
            self.buttons[0].setImage(UIImage(named: "u1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "t2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "u3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "u4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "u5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "u6"), for: .normal)
            
        }else if selectedIndex == 2 {
            self.btn1View.backgroundColor = UIColor.clear
            self.btn2View.backgroundColor = UIColor.clear
            self.btn3View.backgroundColor = selectedBtnColor
            self.btn4View.backgroundColor = UIColor.clear
            self.btn5View.backgroundColor = UIColor.clear
            self.btn6View.backgroundColor = UIColor.clear
            self.buttons[0].setImage(UIImage(named: "u1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "u2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "t3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "u4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "u5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "u6"), for: .normal)
        }else if selectedIndex == 3 {
            self.btn1View.backgroundColor = UIColor.clear
            self.btn2View.backgroundColor = UIColor.clear
            self.btn3View.backgroundColor = UIColor.clear
            self.btn4View.backgroundColor = selectedBtnColor
            self.btn5View.backgroundColor = UIColor.clear
            self.btn6View.backgroundColor = UIColor.clear
            self.buttons[0].setImage(UIImage(named: "u1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "u2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "u3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "t4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "u5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "u6"), for: .normal)
        }else if selectedIndex == 4 {
            self.btn1View.backgroundColor = UIColor.clear
            self.btn2View.backgroundColor = UIColor.clear
            self.btn3View.backgroundColor = UIColor.clear
            self.btn4View.backgroundColor = UIColor.clear
            self.btn5View.backgroundColor = selectedBtnColor
            self.btn6View.backgroundColor = UIColor.clear
            self.buttons[0].setImage(UIImage(named: "u1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "u2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "u3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "u4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "t5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "u6"), for: .normal)
        }else if selectedIndex == 5 {
            self.btn1View.backgroundColor = UIColor.clear
            self.btn2View.backgroundColor = UIColor.clear
            self.btn3View.backgroundColor = UIColor.clear
            self.btn4View.backgroundColor = UIColor.clear
            self.btn5View.backgroundColor = UIColor.clear
            self.btn6View.backgroundColor = selectedBtnColor
            self.buttons[0].setImage(UIImage(named: "u1"), for: .normal)
            self.buttons[1].setImage(UIImage(named: "u2"), for: .normal)
            self.buttons[2].setImage(UIImage(named: "u3"), for: .normal)
            self.buttons[3].setImage(UIImage(named: "u4"), for: .normal)
            self.buttons[4].setImage(UIImage(named: "u5"), for: .normal)
            self.buttons[5].setImage(UIImage(named: "t6"), for: .normal)
        }
        
        let previousVC = viewControllers[previousIndex]
        
        previousVC.willMove(toParent: nil)
        previousVC.view.removeFromSuperview()
        previousVC.removeFromParent()
        
        sender.isSelected = true
        
        let vc = viewControllers[selectedIndex]
        
        vc.view.frame = UIApplication.shared.windows[0].frame
        vc.didMove(toParent: self)
        self.addChild(vc)
        self.view.addSubview(vc.view)
        
        self.view.bringSubviewToFront(tabView)
        
        
    }
    
    func hideHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: (self.view.frame.height + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
    }
    
    func showHeader() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear, animations: {
            self.tabView.frame = CGRect(x: self.tabView.frame.origin.x, y: self.view.frame.height - (self.footerHeight + self.view.safeAreaInsets.bottom + 16), width: self.tabView.frame.width, height: self.footerHeight)
        })
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
