//
//  PlayerDetailController.swift
//  CricketApp
//
//  Created by Netcom on 28/02/24.
//

import Foundation
import UIKit

class PlayerDetailController: NSObject {
    
    var controller = UIViewController()
    var playerItem: Team?
    var wicketFall: FallOfWicket?
    
    init(controller: UIViewController = UIViewController()) {
        self.controller = controller
    }
}

extension PlayerDetailController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return section == 0 ? playerItem?.players?.count ?? 0 : playerItem?.bowlers?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PlayerCell", for: indexPath) as! PlayerCell
        if indexPath.section == 0 {
            cell.playerItem = playerItem?.players?[indexPath.row]
            cell.dismissalType(fallen: wicketFall?.wickets?[indexPath.row].dismissal?.type?.lowercased() ?? "", wicket: wicketFall?.wickets?[indexPath.row])
        }else {
            cell.bowlerItem = playerItem?.bowlers?[indexPath.row]
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: String(describing: HeaderView.self), for: indexPath) as! HeaderView
        header.type = (indexPath.section == 0) ? .batsman : .bowler
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}

enum playerType {
    case batsman
    case bowler
}
