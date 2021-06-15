//
//  ViewController.swift
//  SNSAuthen
//
//  Created by Trinh Thai on 14/06/2021.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class ViewController: UIViewController, LoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = AccessToken.current, !token.isExpired {
            // User is logged in, do work such as go to next view controller. }
            print("user logged in")
        }
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        loginButton.delegate = self
        loginButton.permissions = ["public_profile", "email"]
        view.addSubview(loginButton)
    }
    
    private func getUserInfo(token: String) {
        //        let request = FBSDKLoginKit.GraphRequest(graphPath: "me",
        //                                                 parameters: ["fields": "email, name"],
        //                                                 tokenString: token,
        //                                                 version: nil,
        //                                                 httpMethod: .get)
        //        NetworkManager().send(request: LoginRequest(token: token)) { result in
        //            switch result {
        //            case .success(let res):
        //                print(res)
        //            case .failure(let err):
        //                print(err)
        //            }
        //        }
        //        request.start { (connection, result, error) in
        //            do {
        //                guard let userInfo = result as? [String : AnyObject],
        //                      let name = userInfo["name"] as? String,
        //                      let email = userInfo["email"] as? String else {
        //                    return
        //                }
        //
        //                NetworkManager().send(request: LoginRequest(token)) { result in
        //                            switch result {
        //                            case .success(let res):
        //                                print(res)
        //                            case .failure(let err):
        //                                print(err)
        //                            }
        //                        }
        //            } catch {
        //                print(error.localizedDescription)
        //            }
        //        }
    }
    
    func loginButton(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
        guard let token = result?.token?.tokenString else { return }
        print(token)
        //Next step: Call with postman
    }
    func loginButtonWillLogin(_ loginButton: FBLoginButton) -> Bool {
        return true
    }
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("DidLogOut")
    }
}

