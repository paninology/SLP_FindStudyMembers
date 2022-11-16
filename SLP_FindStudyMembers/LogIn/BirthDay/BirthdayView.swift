//
//  BirthdayView.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/09.
//

import UIKit

final class BirthdayView: LogInView {
    
    let userView: UIView = {
       let view = UIView()
        return view
    }()
    
    let yearView: UIView = {
        let view = UIView()
//        view.backgroundColor = .purple
        return view
    }()
    
    let monthView: UIView = {
        let view = UIView()
//        view.backgroundColor = .blue
        return view
    }()
    
    let dayView: UIView = {
        let view = UIView()
//        view.backgroundColor = .brown
        return view
    }()
    
    let yearLabel: UILabel = {
       let view = UILabel()
//        view.text = "1990"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .systemGray2
        return view
    }()
    
    let monthLabel: UILabel = {
       let view = UILabel()
//        view.text = "8"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .systemGray2
        return view
    }()
    
    let dayLabel: UILabel = {
       let view = UILabel()
//        view.text = "15"
        view.font = .systemFont(ofSize: 14)
        view.textColor = .systemGray2
        return view
    }()
    
    let yearTrailingLabel: UILabel = {
        let view = UILabel()
        view.text = "년"
        return view
    }()
    
    let monthTrailingLabel: UILabel = {
        let view = UILabel()
        view.text = "월"
        return view
    }()
    
    let dayTrailingLabel: UILabel = {
        let view = UILabel()
        view.text = "일"
        return view
    }()
    
    let datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        view.maximumDate = Date()
        view.locale = .current
//        view.setDate(Date(timeIntervalSince1970: 200000000), animated: true)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        mainLabel.text = "생년월일을 입력해주세요"
        confirmButton.setTitle("다음", for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func configure() {
        super.configure()
//        addSubview(stackView)
        [userView, yearView, monthView, dayView,yearLabel, yearTrailingLabel, monthLabel, dayLabel, monthTrailingLabel, dayTrailingLabel, datePicker].forEach { addSubview($0) }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        userView.snp.makeConstraints { make in
            make.top.equalTo(mainLabel.snp.bottom).offset(64)
            make.horizontalEdges.equalToSuperview().inset(16)
            make.height.equalTo(48)
        }
        yearView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(userView.snp.verticalEdges)
            make.leading.equalTo(userView.snp.leading)
            make.width.equalTo(userView.snp.width).multipliedBy(0.3)
        }
        monthView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(userView.snp.verticalEdges)
            make.centerX.equalTo(userView.snp.centerX)
            make.width.equalTo(userView.snp.width).multipliedBy(0.3)
        }
        dayView.snp.makeConstraints { make in
            make.verticalEdges.equalTo(userView.snp.verticalEdges)
            make.trailing.equalTo(userView.snp.trailing)
            make.width.equalTo(userView.snp.width).multipliedBy(0.3)
        }
        
        dateLabelsFormatter(view: yearView, label: yearLabel)
        dateLabelsFormatter(view: monthView, label: monthLabel)
        dateLabelsFormatter(view: dayView, label: dayLabel)
        
        yearTrailingLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(yearLabel)
            make.trailing.equalTo(yearView.snp.trailing).inset(8)
            make.width.equalTo(16)
        }
        
        monthTrailingLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(monthLabel)
            make.trailing.equalTo(monthView.snp.trailing).inset(8)
            make.width.equalTo(16)
        }
        
        dayTrailingLabel.snp.makeConstraints { make in
            make.verticalEdges.equalTo(dayLabel)
            make.trailing.equalTo(dayView.snp.trailing).inset(8)
            make.width.equalTo(16)
        }
        
        datePicker.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview()
            make.bottom.equalToSuperview()
        }
    }
    
    func dateLabelsFormatter(view: UIView, label: UILabel) {
        
        label.snp.makeConstraints { make in
            make.horizontalEdges.equalTo(view.snp.horizontalEdges).inset(16)
            make.verticalEdges.equalTo(view.snp.verticalEdges)
        }
    }
    
   
    
}
