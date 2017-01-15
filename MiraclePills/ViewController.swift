//
//  ViewController.swift
//  MiraclePills
//
//  Created by Vahagn Gevorgyan on 1/15/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var RegionPicker: UIPickerView!  //Picker for region (view)
    @IBOutlet weak var ChooseYourRegionBtnChange: UIButton! // Button for region (view)
    
    
    @IBOutlet weak var PTP: UIPickerView!       // Picker for payment type (view)
    @IBOutlet weak var CPT: UIButton!           // Button for payment type (view)
    
    
    @IBOutlet weak var NameRegion: UILabel!  //Name Region
    @IBOutlet weak var NamePayment: UILabel! //Name Payment
    
    
    
    let regions = ["Yerevan", "Aragacotn", "Ararat", "Armavir", "Gexarquniq", "Kotayq", "Lori", "Shirak", "Syuniq", "Tavush", "Vayots Dzor"]
    
    let peymentTypes = ["Cash", "PayPall", "Arca", "Visa", "MasterCard"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        RegionPicker.dataSource = self
        RegionPicker.delegate = self
        PTP.dataSource = self
        PTP.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // Action Button for REGION(action)
    @IBAction func ChooseRegionButton(_ sender: Any) {
        
        RegionPicker.isHidden = false
        NameRegion.isHidden = true
        NamePayment.isHidden = true
        ChooseYourRegionBtnChange.isHidden = true
        CPT.isHidden = true
        
        
    }
    
    //Action Button for PAYMENT TYPE button (action)
    @IBAction func CPT(_ sender: Any) {
        
        PTP.isHidden = false
        NameRegion.isHidden = true
        NamePayment.isHidden = true
        ChooseYourRegionBtnChange.isHidden = true
        CPT.isHidden = true

    }
    
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == PTP {
            return 1
        } else {
            return 1
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == PTP {
            return peymentTypes.count
        } else {
            return regions.count
        }

    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == PTP {
            //return "0"
            return peymentTypes[row]
        } else {
            return regions[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == PTP {
            //return "0"
            CPT.setTitle(peymentTypes[row], for: UIControlState.normal)
            PTP.isHidden = true
            NameRegion.isHidden = false
            NamePayment.isHidden = false
            CPT.isHidden = false
            ChooseYourRegionBtnChange.isHidden = false

        } else {
            ChooseYourRegionBtnChange.setTitle(regions[row], for: UIControlState.normal)
            RegionPicker.isHidden = true
            NameRegion.isHidden = false
            NamePayment.isHidden = false
            ChooseYourRegionBtnChange.isHidden = false
            CPT.isHidden = false

        }
        
    }

}

