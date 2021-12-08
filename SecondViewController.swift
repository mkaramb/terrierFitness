//
//  SecondViewController.swift
//  Fitness_APP
//
//  Created by Kfir Flank on 12/5/21.
//
import DropDown
import UIKit

class SecondViewController: UIViewController {

    let menu: DropDown = {
        let menu = DropDown()
        menu.dataSource = [
            "drop_down1",
            "drop_down2",
            "drop_down3",
            "drop_down4",
            "drop_down5",
            "drop_down6"
        ]
        return menu
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let myView = UIView(frame: navigationController?.navigationBar.frame ?? .zero)
        myView.backgroundColor = .blue
        navigationController?.navigationBar.topItem?.titleView = myView
        guard let topView = navigationController?.navigationBar.topItem?.titleView else {
            return}
        menu.anchorView = topView
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapTopItem))
        gesture.numberOfTapsRequired = 1
        gesture.numberOfTouchesRequired = 1
        topView.addGestureRecognizer(gesture)
        
        
        // Do any additional setup after loading the view.
    }
    @objc func didTapTopItem() {
        menu.show()
    }
    
    @IBOutlet weak var height: UITextField!
    @IBOutlet weak var age: UITextField!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var Label2_Controller2: UILabel!
    @IBOutlet weak var Text_field_controller2: UITextField!
    @IBAction func Secondcontroller(_ sender: Any) {
        if let name = Text_field_controller2.text {
            var weight = Double(Text_field_controller2.text!)
            if let name1 = height.text {
                 var heightvar  = Double(height.text!)
                 heightvar! = heightvar! * heightvar!
                 var height =  (703 * weight!) / heightvar!
                Label2_Controller2.text! = "BMI is: " + String(format: "%.1f", height)
               /* if let name2 = age.text {
                    var agevar = Double(age.text!)
                    heightvar! = heightvar! / heightvar!
                    var bmr = (weight! * 4.536) + (15.88 * heightvar!) - (5 * agevar!) + 5
                    label3.text! = "Calorie intake per day should be: " + String(format: "%.0f", bmr)
                }*/
             }
            
        }
    }
    @IBAction func DeleteButton(_ sender: Any) {
        Label2_Controller2.text = nil
    }
}
