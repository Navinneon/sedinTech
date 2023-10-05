//
//  HomeTableViewCell.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var createdAtLbl: UILabel!
    @IBOutlet weak var loginLbl: UILabel!
    @IBOutlet weak var avatarImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    override func layoutSubviews() {
        setupUI()
    }
    
    func setupUI() {
        DispatchQueue.main.async { [self] in
            backView.gradientXY(leftColor: UIColor(named: "themeMain") ?? .blue, rightColor: UIColor(named: "themeSub") ?? .white)
            backView.layer.cornerRadius = 12
            backView.layer.masksToBounds = true
        }
    }
    
    func configure(data: HomeModel) {
        
        titleLbl.text = data.title
        if let formattedDate = convertISO8601DateStringToDate("2023-08-24T06:50:45Z") {
            createdAtLbl.text = formattedDate
        } else {
            print("Invalid date format")
        }
        
        loginLbl.text = data.user?.login
        
        if let imageUrl = URL(string: data.user?.avatarURL ?? "") {
            loadImage(from: imageUrl) { [self] image in
                if let image = image {
                    DispatchQueue.main.async { [self] in
                        avatarImg.image = image
                    }
                } 
            }
        }
    }
    
    func convertISO8601DateStringToDate(_ dateString: String) -> String? {
        let dateFormatter = ISO8601DateFormatter()
        if let date = dateFormatter.date(from: dateString) {
            let outputFormatter = DateFormatter()
            outputFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
            let formattedDate = outputFormatter.string(from: date)
            return formattedDate
        }
        return nil
    }
    
}
