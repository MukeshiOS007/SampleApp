//
//  teamListController.swift
//  CricketApp
//
//  Created by Netcom on 27/02/24.
//

import Foundation
import UIKit

class TeamListController: NSObject {
    
    var controller = UIViewController()
    var jsonResult: Empty?
    
    init(controller: UIViewController = UIViewController()) {
        self.controller = controller
        super.init()
        jsonResult = getResponse()
    }
 
    func getResponse() -> Empty? {
        if let path = Bundle.main.path(forResource: "cricketData", ofType: "json") {
            let url = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: url) else { return nil }
            do {
                let result = try JSONDecoder().decode(Empty.self, from: data)
                print(result as Any)
                return result
            }catch let error {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

extension TeamListController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonResult?.matchDetails?.teams?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.itemList = jsonResult?.matchDetails?.teams?[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 220)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vC = PlayerViewController()
        vC.setViewModel.playerItem = jsonResult?.matchDetails?.teams?[indexPath.row]
        vC.setViewModel.wicketFall = jsonResult?.matchDetails?.fallOfWickets?[indexPath.row]
        controller.navigationController?.pushViewController(vC, animated: false)
    }
}
