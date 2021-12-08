//
//  SecondViewController.swift
//  Fitness_APP
//
//  Created by Kfir Flank on 12/5/21.
//
import DropDown
import UIKit



class SecondViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        }
        
        // Do any additional setup after loading the view.
    
   
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
    

    @IBOutlet weak var list: UILabel!    //drag the label outlet from story board
    
    
    @IBAction func SaveButton(_ sender: Any) {         //save button from story
        
    UserDefaults.standard.set(list.text, forKey: "cool text")

    }
    
    //retreive button
    @IBAction func restore(_ sender: Any) {    //restore button from story 
        list.text = UserDefaults.standard.object(forKey: "cool text") as? String

    }
    
    
}
