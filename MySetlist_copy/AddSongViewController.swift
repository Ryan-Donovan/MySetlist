//
//  AddSongViewController.swift
//  SetList
//
//  Created by Ryan D on 6/26/17.
//  Copyright © 2017 Ryan D. All rights reserved.
//

import UIKit
import os.log

class AddSongViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var artistTextField: UITextField!
    @IBOutlet weak var keyPickerField: UIPickerView!
    @IBOutlet weak var save: UIBarButtonItem!
    @IBAction func cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    var song: Song?
    var pickerData: [String] = [String]()
    
    //MARK Nav
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === save else {
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let name = nameTextField.text ?? ""
        let artist = artistTextField.text ?? ""
        let set = Set(name:"mySet", setlist: [])
        let key = pickerData[self.keyPickerField.selectedRow(inComponent: 0)]
        song = Song(name: name, artist: artist, key: key, playCount: 1,  set: set!)
    }
    
    // MARK UITextFieldDelegate
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        if textField.tag == 2 {
            artistTextField.text = textField.text
        }
        nameTextField.text = textField.text
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    // MARK Private methods
    private func updateSaveButtonState() {
        // Disable the Save button if the text field is empty.
        let name = nameTextField.text ?? ""
        let artist = artistTextField.text ?? ""
        
        save.isEnabled = !name.isEmpty //&& !artist.isEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        artistTextField.delegate = self
        self.keyPickerField.delegate = self
        self.keyPickerField.dataSource = self
        pickerData = ["A", "Am", "Bb", "Bbm", "B", "Bm", "C", "Cm", "Db", "Dbm", "D", "Dm", "Eb", "Ebm", "E", "Em", "F", "Fm", "F#", "F#m", "G", "Gm", "Ab", "Abm"]
        updateSaveButtonState()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // The number of rows of data
    func pickerView(_ _pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return for the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
