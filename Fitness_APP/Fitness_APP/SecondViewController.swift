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
    
    //drop down menu
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
        
        menu.selectionAction = {index, title in print("index \(index) and \(title)")
         
            
        }
        
        // Do any additional setup after loading the view.
    }
    @objc func didTapTopItem() {
        menu.show()
    }
    @IBOutlet weak var Label2_Controller2: UILabel!       //set the user input for adding a workout
    @IBOutlet weak var Text_field_controller2: UITextField!      //link
    @IBOutlet weak var MondaySetsLabel: UILabel!       //monday for sets
    @IBAction func SetsMonday(_ sender: UIStepper) {
        MondaySetsLabel.text = Int(sender.value).description //assign sets
    }
    @IBOutlet weak var RepsLabelMonday: UILabel!           //set label for reps
    @IBAction func RepsMonday(_ sender: UIStepper) {
        RepsLabelMonday.text = Int(sender.value).description //assign label for reps
    }
    var placeholder = ""
    
    var backList = ["Pull-ups","chin-ups","trap bar deadlifts","one arm dumbell row","back extension","reverse cable fly"].shuffled()
    var i = 0
    @IBAction func backPreset(_ sender: Any) {
        if i <= 5 {
        Text_field_controller2.text = backList[i]
        i+=1
            
    }
    }
    @IBAction func Secondcontroller(_ sender: Any) {
        if let name = Text_field_controller2.text {
            placeholder = Label2_Controller2.text!
            Label2_Controller2.text! += Text_field_controller2.text! +  " - " + MondaySetsLabel.text! + " sets, " +  RepsLabelMonday.text! + " reps\n"        //specifying reps and sets
            Label2_Controller2.numberOfLines = 0
            
        }
        Text_field_controller2.text = ""      //add more then one workout at a time into the text field
    }
    
    
    @IBAction func clearButton(_ sender: Any) {
        Label2_Controller2.text! = placeholder           //clear workouts that have been added
    }
    
    
    

    }

