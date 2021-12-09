//
//  ViewController.swift
//  Fitness_APP_2
//
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var myInput: UITextField!
    @IBOutlet weak var myList: UITableView!
    
    let stringArraySaved = UserDefaults.standard.object(forKey: "savedUserInputs") as? [String] ?? [String]()
    
    var stringArray = [String]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view
        if stringArraySaved.count > 0 {
            stringArray = stringArraySaved
        }
    }
    
    var i = 0
    var chestList = ["Bench Press","incline Bench Press", "declined dumbell fly", "cable chest press", "pushups","floor press", "declined bench press","inclined dumbell press"].shuffled()
    @IBAction func ChestPreset(_ sender: Any) {
        if i <= 7 {
        myInput.text = chestList[i]
        i+=1
            
        }
    }
    
    var legList = ["medicine ball squat","walking lunge","glute bridges","lateral band walk","stadning calf raise","squats","hack squats", "leg extensions", "RDL","leg curls","hex bar deadlifts","bulgarian split sqauts","box jumps","pistol squats"].shuffled()
    @IBAction func LegPreset(_ sender: Any) {
        if i <= 12 {
        myInput.text = legList[i]
        i+=1
            
        }
    
    }
    
    var armList = ["lying chest fly","lying tricep fly","bicep curl","overhead tricp extensions","skull crushers","overhead press","seated shoulder press","lateral raises","hammer curls","trice pull downs"].shuffled()
    @IBAction func ArmPreset(_ sender: Any) {
    
    if i <= 9 {
    myInput.text = armList[i]
    i+=1
        
        }
    }
    
    
    
    var backList = ["Pull-ups","chin-ups","trap bar deadlifts","one arm dumbell row","back extension","reverse cable fly"].shuffled()
  
    
    @IBAction func BackPreset(_ sender: Any) {
        if i <= 5 {
        myInput.text = backList[i]
        i+=1
            
        }
    }
    
    
    
    
    var coreList = ["plank","side plank","crunches","situps","bicycles","russian twists","hollow holds","ab roller","hanging leg raise"].shuffled()
    
    @IBAction func CorePreset(_ sender: Any) {
    
    if i <= 8 {
    myInput.text = coreList[i]
    i+=1
        
        }
    }
    
    
    

    
    
    @IBAction func tapAddButton(_ sender: Any) {
        if let txt = myInput.text, !txt.isEmpty {
            self.stringArray.insert(txt, at: 0)
            myList.beginUpdates()
            myList.insertRows(at: [IndexPath(row: 0, section: 0)], with: .fade)
            myList.endUpdates()
            
            myInput.text = nil
        }
        else {
            let alert = UIAlertController(title: "Enter an exercise!", message: "Type in your own exercise or tap the kind of exercise you want.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        UserDefaults.standard.set(stringArray, forKey: "savedUserInputs")
    }
    
    @IBAction func tapDeleteButton(_ sender: UIButton) {
        let point = sender.convert(CGPoint.zero, to: myList)
        guard let indexpath = myList.indexPathForRow(at: point) else {return}
        stringArray.remove(at: indexpath.row)
        myList.beginUpdates()
        myList.deleteRows(at: [IndexPath(row: indexpath.row, section: 0)], with: .fade)
        myList.endUpdates()
        UserDefaults.standard.set(stringArray, forKey: "savedUserInputs")
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myList.dequeueReusableCell(withIdentifier: "EditTableViewCell", for: indexPath) as? EditTableViewCell else {return UITableViewCell()}
        cell.labelText.text = stringArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
