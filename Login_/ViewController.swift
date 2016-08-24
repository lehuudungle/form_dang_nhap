//
//  ViewController.swift
//  Login_
//
//  Created by Admin on 8/24/16.
//  Copyright © 2016 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    @IBOutlet weak var tf_User: UITextField!
    @IBOutlet weak var tf_Passwrok: UITextField!
    
    @IBOutlet weak var lbl_message: UILabel!
    
    @IBOutlet weak var tview_dsach: UITextView!
    
    var users = ["1":"1",
    "binh":"abc","thang":"ok"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        for user in users{
            print(user)
        }
        
    }

    @IBAction func acction_login(sender: UIButton) {
        //reset thong diep
        reset_message()
        tf_User.resignFirstResponder()
        tf_Passwrok.resignFirstResponder()// cach 1
//        self.view.endEditing(true)//cach 2
        check_empty()
        if let passwork  = users[tf_User.text!]{
            if(passwork == tf_Passwrok.text){
                print("dang nhap thanh cong")
                lbl_message.text = "dang nhap thanh cong"
                
            }else{
                print("sai mat khau")
            }
            
            
        }else{
            print("dang nhap khong thanh cong")
        }
        
    }
    func reset_message(){
        lbl_message.text = ""
        tview_dsach.text = ""
        
        
    }
    func check_empty(){
        if(tf_User.text == "" && tf_Passwrok.text == ""){
            lbl_message.text = "Bạn cần nhập user và passwrok"
            
        }else if(tf_Passwrok.text == ""){
            lbl_message.text = "Bạn cần nhập passwrok"
        }else if(tf_User.text == ""){
            lbl_message.text = "Bạn cần nhập user"
        }
        lbl_message.lineBreakMode = .ByWordWrapping
        lbl_message.numberOfLines = 0
    }
    @IBAction func acction_register(sender: UIButton) {
        reset_message()
        tf_User.resignFirstResponder()
        tf_Passwrok.resignFirstResponder()
        check_empty()
        if(check_user()){
            users[tf_User.text!] = tf_Passwrok.text
        }
        print(users)
    }
    func check_user()->Bool{
        for use in users{
            if(use.0 == tf_User.text){
                lbl_message.text = "Tên đăng ký đã sử dụng"
                return false
            }
        }
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func acction_dsach(sender: UIButton) {
        reset_message()
        
        var stringText = ""
        for use in users{
            stringText += use.0 + "\n"
            
        }
        tview_dsach.text = stringText;
//        tview_dsach.lineBreakMode = .ByWordWrapping
//        tview_dsach.numberOfLines = 0
    }
    
    
    // khi ta click ra ngoai ô text field thì bàn phím sẽ bị ẩn đi
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        tf_Passwrok.resignFirstResponder()
        tf_User.resignFirstResponder()
        
    }


}

