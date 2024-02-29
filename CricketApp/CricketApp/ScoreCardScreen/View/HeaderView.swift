//
//  HeaderView.swift
//  CricketApp
//
//  Created by Netcom on 27/02/24.
//

import UIKit

class HeaderView: UICollectionReusableView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .lightGray.withAlphaComponent(0.8)
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
      //  stackView.spacing = 2
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var batsmanLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var runLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var ballLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fourLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sixLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var StrikeRateLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var type: playerType? {
        didSet {
            if type == .batsman {
                batsmanLabel.text = "Batsman"
                fourLabel.text = "4s"
                sixLabel.text = "6s"
                StrikeRateLabel.text = "SR"
                ballLabel.text = "B"
                runLabel.text = "R"
            }else {
                batsmanLabel.text = "Bowler"
                fourLabel.text = "M"
                sixLabel.text = "W"
                StrikeRateLabel.text = "SR"
                ballLabel.text = "0"
                runLabel.text = "R"
            }
        }
    }
    
    func setUpView() {
        addSubview(holderView)
        
        holderView.addSubview(batsmanLabel)
        holderView.addSubview(stackView)
        
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
            batsmanLabel.widthAnchor.constraint(equalToConstant: 120),
            
            stackView.centerYAnchor.constraint(equalTo: self.holderView.centerYAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: self.holderView.trailingAnchor, constant: 0),
            stackView.widthAnchor.constraint(equalToConstant: 120),
        ])
    }
    
}
