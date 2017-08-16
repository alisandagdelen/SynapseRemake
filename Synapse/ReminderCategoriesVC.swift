//
//  ReminderCategoriesVC.swift
//  Synapse
//
//  Created by alişan dağdelen on 14.08.2017.
//  Copyright © 2017 alisandagdeleb. All rights reserved.
//

import UIKit

enum ReminderType {
    case todo, project, travel, meeting, anniversary, medicine
}

class ReminderCategoriesVC: BaseVC {
    
    struct Reminder {
        var name:String
        var icon:UIImage
        var type:ReminderType
        init(_ name:String,_ icon:UIImage,_ type: ReminderType) {
            self.name = name
            self.icon = icon
            self.type = type
        }
    }
    @IBOutlet weak var reminderCollection: UICollectionView!
    
    var reminders:[Reminder] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminders.append(Reminder("Todo", #imageLiteral(resourceName: "todo"), .todo))
        reminders.append(Reminder("Project", #imageLiteral(resourceName: "project"), .project))
        reminders.append(Reminder("Travel", #imageLiteral(resourceName: "travel"), .travel))
        reminders.append(Reminder("Meeting", #imageLiteral(resourceName: "meeting"), .meeting))
        reminders.append(Reminder("Anniversary", #imageLiteral(resourceName: "anniversary"), .anniversary))
        reminders.append(Reminder("Medicine", #imageLiteral(resourceName: "medicine"), .medicine))
        reminderCollection.register(CCellCategories.nibFile(), forCellWithReuseIdentifier:CCellCategories.className())
    }
    
    @IBAction func actB(_ sender: Any) {
        
        print("ASDASDASDA")
    }
    @IBOutlet weak var asd: UIButton!
    
}

extension ReminderCategoriesVC:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reminders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell:CCellCategories = collectionView.dequeueReusableCell(withReuseIdentifier: CCellCategories.className(), for: indexPath) as? CCellCategories else {
            return UICollectionViewCell()
        }
        let reminder =  reminders[indexPath.row]
        cell.lblName.text = reminder.name
        cell.imgIcon.image = reminder.icon
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numberOfCells = CGFloat(2)
        let padding: CGFloat = 5.0
        let continainerWidth = collectionView.frame.width
        
        var singleItemWidth = floor(continainerWidth / numberOfCells)
        singleItemWidth -= (padding + padding) 
        return CGSize(width: singleItemWidth, height: singleItemWidth)
    }
    

}
