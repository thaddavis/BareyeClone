//
//  People_ContactsVC.swift
//  Test
//
//  Created by Thad Duval on 1/4/17.
//  Copyright © 2017 Thad Duval. All rights reserved.
//

import UIKit
import Contacts

class People_ContactsVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {
    
    @IBOutlet weak var searchBarForContacts: UISearchBar!
    
    @IBOutlet weak var contactsCollectionView: UICollectionView!
    
    var contacts = [CNContact]()
    var filteredContacts = [CNContact]()
    var inSearchMode = false
    
    var selectedRecipient = ""
    var selectedRecipientImage: Data?
    
    var screenSize: CGRect!
    var screenWidth: CGFloat!
    var screenHeight: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsCollectionView.dataSource = self
        contactsCollectionView.delegate = self
        searchBarForContacts.delegate = self
        
        searchBarForContacts.returnKeyType = UIReturnKeyType.done
        searchBarForContacts.enablesReturnKeyAutomatically = false
        
        // Fetch Contacts asynchronously
        DispatchQueue.global(qos: .background).async {
            self.contacts = self.findContacts()
            
            DispatchQueue.main.async() {
                
                self.contactsCollectionView.reloadData()
                
            }
        
        }
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        // Do any additional setup after loading the view, typically from a nib
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: screenWidth / 3 - 2, height: 180 - 2 )
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        
        contactsCollectionView.collectionViewLayout = layout
        contactsCollectionView.backgroundColor = UIColor.white
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //----------********** UICollectionViewDelegate CODE
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        // unwind to root & select For whom?
        if !inSearchMode {
            self.selectedRecipient = self.contacts[indexPath.row].givenName + " " + self.contacts[indexPath.row].middleName + " " + contacts[indexPath.row].familyName
        
            if (self.contacts[indexPath.row].imageData != nil) {
                self.selectedRecipientImage = self.contacts[indexPath.row].imageData
            } else {
                self.selectedRecipientImage = nil
            }
        } else {
            self.selectedRecipient = self.filteredContacts[indexPath.row].givenName + " " + self.filteredContacts[indexPath.row].middleName + " " + filteredContacts[indexPath.row].familyName
            
            if (self.filteredContacts[indexPath.row].imageData != nil) {
                self.selectedRecipientImage = self.filteredContacts[indexPath.row].imageData
            } else {
                self.selectedRecipientImage = nil
            }
        }
        
        self.performSegue(withIdentifier: "unwindToBuyDrinksHome", sender: self)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "contactCollectionCell", for: indexPath) as? ContactCollectionCell {
            
            var CE: CNContact!
            
            if !inSearchMode {
                CE = self.contacts[indexPath.row]
            } else {
                CE = self.filteredContacts[indexPath.row]
            }
            
            cell.layer.borderWidth = 0.5
            cell.frame.size.width = screenWidth / 3 - 8
            cell.frame.size.height = 172
            
            
            cell.configureCell(CE)
            
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if !inSearchMode {
            return self.contacts.count
        } else {
            return self.filteredContacts.count
        }
        
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: self.view.frame.size.width/3 - 8, height: 180)
    }
    
    //----------********** SEARCH BAR DELEGATE CODE
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if (searchBar.text == nil || searchBar.text == "") {
            inSearchMode = false
            contactsCollectionView.reloadData()
            view.endEditing(true)
            
        } else {
            inSearchMode = true
            
            let lower = searchBar.text!.lowercased()
            
            filteredContacts = contacts.filter(
                {
                    $0.givenName.lowercased().range(of: lower) != nil ||
                    $0.middleName.lowercased().range(of: lower) != nil ||
                    $0.familyName.lowercased().range(of: lower) != nil
                }
            )
            
            contactsCollectionView.reloadData()
        }
    }
    
    //----------********** Find Contacts from CNContactStore
    func findContacts() -> [CNContact] {
        
        let store = CNContactStore()
        
        let keysToFetch = [
                CNContactFormatter.descriptorForRequiredKeys(for: .fullName),
                CNContactEmailAddressesKey,
                CNContactPhoneNumbersKey,
                CNContactImageDataAvailableKey,
                CNContactThumbnailImageDataKey,
                CNContactImageDataKey
            ] as [Any]
        
        let fetchRequest = CNContactFetchRequest(keysToFetch: keysToFetch as! [CNKeyDescriptor])
        
        var contacts = [CNContact]()
        
        do {
            try store.enumerateContacts(with: fetchRequest, usingBlock: { ( contact, stop) -> Void in
                contacts.append(contact)
            })
        }
        catch let error as NSError {
            
            print(error.localizedDescription)
        } 
        
        return contacts
    }
    
//    func createCNContactForCurrentUser(_ firstName: String, image: UIImage?) {
//        // create contact with mandatory values: first and last name
//        let newContact = CNMutableContact()
//        newContact.givenName = firstName
//        //newContact.familyName = lastName
//        
//        // image
//        if image != nil {
//            newContact.imageData = UIImageJPEGRepresentation(image!, 0.9)
//        }
//        
//        do {
//            let newContactRequest = CNSaveRequest()
//            newContactRequest.add(newContact, toContainerWithIdentifier: nil)
//            try CNContactStore().execute(newContactRequest)
//            self.presentingViewController?.dismiss(animated: true, completion: nil)
//        } catch {
//            self.showAlertMessage("I was unable to create the new contact. An error occurred.")
//        }
//    }
    
}
