//
//  HomeModel.swift
//  SLP_FindStudyMembers
//
//  Created by yongseok lee on 2022/11/23.
//

import Foundation


// MARK: - NearbySeSAC
struct NearbySeSAC: Codable {
    let fromQueueDB, fromQueueDBRequested: [FromQueueDB]
    let fromRecommend: [String]
}

// MARK: - FromQueueDB
struct FromQueueDB: Codable {
    let uid, nick: String
    let lat, long: Double
    let reputation: [Int]
    let studylist, reviews: [String]
    let gender, type, sesac, background: Int
}
