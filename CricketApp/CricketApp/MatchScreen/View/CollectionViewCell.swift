//
//  CollectionViewCell.swift
//  CricketApp
//
//  Created by Netcom on 27/02/24.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    private lazy var holderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seriesLabel: UILabel = {
        let label = UILabel()
        label.text = "Indian Premier League"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var matchLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var leftStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var rightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var teamAView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemYellow
        return view
    }()
    
    private lazy var teamBView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemRed
        return view
    }()
    
    private lazy var vsLabel: UILabel = {
        let label = UILabel()
        label.text = "vs"
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stadiumLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sortTeamAName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var sortTeamBName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = .boldSystemFont(ofSize: 12)
        label.textColor = .black
        label.adjustsFontSizeToFitWidth = true
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fullTeamAName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var fullTeamBName: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemPink
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.cornerRadius = 10
        return view
    }()
    
    private lazy var navigationBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setImage(UIImage(named: "right_arrow_Image"), for: .normal)
        return btn
    }()
    
    var itemList: Team? {
        didSet {
            dateLabel.text = itemList?.date
            timeLabel.text = itemList?.time
            matchLabel.text = "Match \(itemList?.match ?? 0)"
            sortTeamAName.text = itemList?.name
            sortTeamBName.text = itemList?.opponent
            fullTeamAName.text = itemList?.fullname
            fullTeamBName.text = itemList?.opponentFullname
            stadiumLabel.text = itemList?.stadium
        }
    }
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpView() {
        contentView.addSubview(holderView)
        
        holderView.addSubview(timeLabel)
        holderView.addSubview(dateLabel)
        holderView.addSubview(stadiumLabel)
        holderView.addSubview(vsLabel)
        holderView.addSubview(matchLabel)
        holderView.addSubview(seriesLabel)
        holderView.addSubview(leftStackView)
        holderView.addSubview(rightStackView)
        holderView.addSubview(sortTeamAName)
        holderView.addSubview(sortTeamBName)
        holderView.addSubview(fullTeamAName)
        holderView.addSubview(fullTeamBName)
        holderView.addSubview(bottomView)
        holderView.addSubview(navigationBtn)
        holderView.addSubview(vsLabel)
        
        leftStackView.addArrangedSubview(teamAView)
        leftStackView.addArrangedSubview(fullTeamAName)
        
        rightStackView.addArrangedSubview(teamBView)
        rightStackView.addArrangedSubview(fullTeamBName)
        
        activateConstraint()
        setCardShadow()
    }
    
    func setCardShadow() {
        self.holderView.layer.shadowColor   = UIColor(white: 0.0, alpha: 0.5).cgColor
        self.holderView.layer.shadowOffset  = CGSize(width: 0.0, height: 0.3)
        self.holderView.layer.shadowRadius  = 6.0
        self.holderView.layer.shadowOpacity = 0.1
        self.holderView.layer.cornerRadius = 10
        
        self.teamAView.layer.cornerRadius = 30
        self.teamBView.layer.cornerRadius = 30
        
    }
    
    func activateConstraint() {
        NSLayoutConstraint.activate([
        
            holderView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 5),
            holderView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 5),
            holderView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -5),
            holderView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5),
            
            dateLabel.topAnchor.constraint(equalTo: self.holderView.topAnchor, constant: 5),
            dateLabel.leadingAnchor.constraint(equalTo: self.holderView.leadingAnchor, constant: 5),
            dateLabel.heightAnchor.constraint(equalToConstant: 21),
            
            timeLabel.topAnchor.constraint(equalTo: self.holderView.topAnchor, constant: 5),
            timeLabel.trailingAnchor.constraint(equalTo: self.holderView.trailingAnchor, constant: -5),
            timeLabel.heightAnchor.constraint(equalToConstant: 21),
            
            seriesLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 5),
            seriesLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            seriesLabel.heightAnchor.constraint(equalToConstant: 21),
            
            matchLabel.topAnchor.constraint(equalTo: seriesLabel.bottomAnchor, constant: 5),
            matchLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            matchLabel.heightAnchor.constraint(equalToConstant: 21),
            
            teamAView.heightAnchor.constraint(equalToConstant: 60),
            teamAView.widthAnchor.constraint(equalToConstant: 60),
            
            teamBView.heightAnchor.constraint(equalToConstant: 60),
            teamBView.widthAnchor.constraint(equalToConstant: 60),
            
            fullTeamAName.heightAnchor.constraint(equalToConstant: 21),
            fullTeamAName.widthAnchor.constraint(equalToConstant: 200),
            
            vsLabel.centerYAnchor.constraint(equalTo: holderView.centerYAnchor),
            vsLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            
            leftStackView.topAnchor.constraint(equalTo: self.matchLabel.bottomAnchor, constant: 0),
            leftStackView.leadingAnchor.constraint(equalTo: self.holderView.leadingAnchor, constant: 10),
            leftStackView.widthAnchor.constraint(equalToConstant: 120),
            
            rightStackView.topAnchor.constraint(equalTo: self.matchLabel.bottomAnchor, constant: 0),
            rightStackView.trailingAnchor.constraint(equalTo: self.holderView.trailingAnchor, constant: -15),
            rightStackView.widthAnchor.constraint(equalToConstant: 120),
            
            sortTeamAName.centerXAnchor.constraint(equalTo: self.teamAView.centerXAnchor),
            sortTeamAName.centerYAnchor.constraint(equalTo: self.teamAView.centerYAnchor),
            
            sortTeamBName.centerXAnchor.constraint(equalTo: self.teamBView.centerXAnchor),
            sortTeamBName.centerYAnchor.constraint(equalTo: self.teamBView.centerYAnchor),
            
            fullTeamAName.topAnchor.constraint(equalTo: teamAView.bottomAnchor, constant: 2),
            fullTeamAName.leadingAnchor.constraint(equalTo: holderView.leadingAnchor, constant: 10),
            fullTeamAName.heightAnchor.constraint(equalToConstant: 21),
            
            fullTeamBName.topAnchor.constraint(equalTo: teamBView.bottomAnchor, constant: 2),
            fullTeamBName.trailingAnchor.constraint(equalTo: holderView.trailingAnchor, constant: -10),
            fullTeamBName.heightAnchor.constraint(equalToConstant: 21),
            
            stadiumLabel.topAnchor.constraint(equalTo: fullTeamAName.bottomAnchor, constant: 5),
            stadiumLabel.centerXAnchor.constraint(equalTo: holderView.centerXAnchor),
            stadiumLabel.heightAnchor.constraint(equalToConstant: 21),
            
            bottomView.bottomAnchor.constraint(equalTo: self.holderView.bottomAnchor, constant: 0),
            bottomView.leadingAnchor.constraint(equalTo: self.holderView.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: self.holderView.trailingAnchor),
            bottomView.heightAnchor.constraint(equalToConstant: 21),
            
            navigationBtn.bottomAnchor.constraint(equalTo: self.holderView.bottomAnchor, constant: 0),
            navigationBtn.trailingAnchor.constraint(equalTo: self.bottomView.trailingAnchor, constant: -5),
            navigationBtn.heightAnchor.constraint(equalToConstant: 20),
            navigationBtn.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
}
