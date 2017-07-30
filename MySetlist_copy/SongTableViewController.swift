//
//  SongTableViewController.swift
//  SetList
//
//  Created by Ryan D on 6/22/17.
//  Copyright © 2017 Ryan D. All rights reserved.
//

import UIKit

class SongTableViewController: UITableViewController {
    
    @IBOutlet weak var add: UIBarButtonItem!
    
    //var songs = [Song]()
    var currentSet = Set(name: "", setlist: [])
    
    private func loadSampleSongs() {
        
        guard let song1 = Song(name: "Into the Mystic", artist: "Van Morrison", key: "Eb", playCount: 4, set: currentSet!)
            else {
            fatalError("Unable to instantiate meal1")
        }
        
        guard let song2 = Song(name: (currentSet?.name)!, artist: "Bill Withers", key: "Am", playCount: 5, set: currentSet!)
            else {
                fatalError("Unable to instantiate meal1")
        }
        
        //songs+=[song1, song2]
        currentSet?.setlist+=[song1, song2]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadSampleSongs()

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
        return (currentSet?.setlist.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "SongTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? SongTableViewCell  else {
            fatalError("The dequeued cell is not an instance of SongTableViewCell.")
        }
        
        let song = currentSet?.setlist[indexPath.row]
        cell.nameLabel.text = song?.name
        cell.artistLabel.text = song?.artist
        cell.keyLabel.text = "Key of " + (song?.key)!
        cell.playCountLabel.text = "Play Count: " + String(describing: song?.playCount)
        
        // Configure the cell...

        return cell
    }
    
    // MARK actions
    @IBAction func unwindToSongList(sender: UIStoryboardSegue) {
        if let source = sender.source as? AddSongViewController, let song = source.song {
            let newIndexPath = IndexPath(row: (currentSet?.setlist.count)!, section: 0)
            currentSet?.setlist.append(song)
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

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
