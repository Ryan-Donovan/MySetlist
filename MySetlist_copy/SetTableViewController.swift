//
//  SetTableViewController.swift
//  SetList
//
//  Created by Ryan D on 6/22/17.
//  Copyright © 2017 Ryan D. All rights reserved.
//

import UIKit

class SetTableViewController: UITableViewController {
    
    @IBOutlet weak var add: UIBarButtonItem!
    
    var sets = [Set]()
    var set = Set(name: "", setlist: [])
    
    // MARK private methods
    private func loadSampleSets() {
        guard let set1 = Set(name: "Crozet", setlist: [])
            else {
                fatalError("Unable to instantiate set1")
        }
        guard let set2 = Set(name: "Formal", setlist: [])
            else {
                fatalError("Unable to instantiate set2")
        }
        sets += [set1, set2]
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSampleSets()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sets.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "SetTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SetTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SetTableViewCell.")
        }
        set = sets[indexPath.row]
        cell.nameLabel.text = set?.name
        //performSegue(withIdentifier: "mySegue", sender: Any?)
        

        return cell
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "mySegue",
            let vc = segue.destination as? SongTableViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedSet = sets[indexPath.row]
                vc.currentSet = selectedSet
            }
    }
    
    //MARK actions
    @IBAction func unwindToSetList(sender: UIStoryboardSegue) {
        if let source = sender.source as? AddSetViewController, let set = source.set {
            let newIndexPath = IndexPath(row: sets.count, section: 0)
            sets.append(set)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

     
    */

}
