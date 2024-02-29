//
//  PlayerCell.swift
//  CricketApp
//
//  Created by Netcom on 27/02/24.
//

import UIKit

class PlayerCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
        setCardShadow()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var batsmanLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var runLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ballLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fourLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sixLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var StrikeRateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .systemFont(ofSize: 12)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var playerItem: Player? {
        didSet {
            batsmanLabel.text = playerItem?.name
            StrikeRateLabel.text = "\(playerItem?.strike ?? 0)"
            ballLabel.text = "\(playerItem?.balls ?? 0)"
            runLabel.text = "\(playerItem?.runs ?? 0)"
            fourLabel.text = "\(playerItem?.fours ?? 0)"
            sixLabel.text = "\(playerItem?.sixes ?? 0)"
        }
    }
    
    var bowlerItem: Bowler? {
        didSet {
            batsmanLabel.text = bowlerItem?.name
            StrikeRateLabel.text = "\(bowlerItem?.strike ?? 0.0)"
            ballLabel.text = "\(bowlerItem?.overs ?? 0)"
            runLabel.text = "\(bowlerItem?.runsConceded ?? 0)"
            fourLabel.text = "\(bowlerItem?.maiden ?? 0)"
            sixLabel.text = "\(bowlerItem?.wickets ?? 0)"
        }
    }
    
    func dismissalType(fallen: String , wicket: Wicket?) {
        if fallen.contains("lbw".lowercased()) {
            statusLabel.text = "lbw b \(wicket?.dismissal?.bowler ?? "")"
            print(statusLabel.text as Any)
            return
        }else if fallen.contains("caught".lowercased()) {
            statusLabel.text = "c \(wicket?.dismissal?.fielder ?? "")  b \(wicket?.dismissal?.bowler ?? "") "
            print(statusLabel.text as Any)
            return
        }else if fallen.contains("runout".lowercased()) {
            statusLabel.text = " run out \(wicket?.dismissal?.fielder ?? "")"
            print(statusLabel.text as Any)
            return
        }else if fallen.contains("stumped".lowercased()) {
            statusLabel.text = "b \(wicket?.dismissal?.bowler ?? "")"
            print(statusLabel.text as Any)
            return
        }else if fallen.contains("hitwicket".lowercased()) {
            statusLabel.text = "hit wicket self"
            print(statusLabel.text as Any)
            return
        }else if fallen.contains("bowled".lowercased()) {
            statusLabel.text = "b \(wicket?.dismissal?.bowler ?? "")"
            print(statusLabel.text as Any)
            return
        }else  {
            return
        }
    }
    
    func setUpView() {
        addSubview(holderView)
        
        holderView.addSubview(batsmanLabel)
        holderView.addSubview(stackView)
        holderView.addSubview(statusView)
        
        statusView.addSubview(statusLabel)
        
        stackView.addArrangedSubview(runLabel)
        stackView.addArrangedSubview(ballLabel)
        stackView.addArrangedSubview(fourLabel)
        stackView.addArrangedSubview(sixLabel)
        stackView.addArrangedSubview(StrikeRateLabel)
        
        NSLayoutConstraint.activate([
            
            holderView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
            holderView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            holderView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
            holderView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -5),
            
            batsmanLabel.centerYAnchor.constraint(equalTo: self.holderView.centerYAnchor, constant: 0),
            batsmanLabel.leadingAnchor.constraint(equalTo: self.holderView.leadingAnchor, constant: 5),
            batsmanLabel.widthAnchor.constraint(equalToConstant: 100),
            batsmanLabel.heightAnchor.constraint(equalToConstant: 21),
            
            statusView.topAnchor.constraint(equalTo: self.holderView.topAnchor, constant: 0),
            statusView.leadingAnchor.constraint(equalTo: self.batsmanLabel.trailingAnchor, constant: 5),
            statusView.trailingAnchor.constraint(equalTo: self.stackView.leadingAnchor, constant: -2),
            statusView.bottomAnchor.constraint(equalTo: self.holderView.bottomAnchor, constant: -2),
            
            statusLabel.topAnchor.constraint(equalTo: self.statusView.topAnchor, constant: 0),
            statusLabel.leadingAnchor.constraint(equalTo: self.statusView.leadingAnchor, constant: 0),
            statusLabel.trailingAnchor.constraint(equalTo: self.statusView.trailingAnchor, constant: 0),
            statusLabel.bottomAnchor.constraint(equalTo: self.statusView.bottomAnchor, constant: 0),
            
            stackView.centerYAnchor.constraint(equalTo: self.holderView.centerYAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.holderView.trailingAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
    func setCardShadow() {
        self.holderView.layer.shadowColor   = UIColor(white: 0.0, alpha: 0.5).cgColor
        self.holderView.layer.shadowOffset  = CGSize(width: 0.0, height: 0.3)
        self.holderView.layer.shadowRadius  = 6.0
        self.holderView.layer.shadowOpacity = 0.1
        self.holderView.layer.cornerRadius = 10
    }
}
