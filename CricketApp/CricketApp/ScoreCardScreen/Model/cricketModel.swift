import Foundation

// MARK: - Empty
struct Empty: Codable {
    let matchDetails: MatchDetails?
}

// MARK: - MatchDetails
struct MatchDetails: Codable {
    let format, toss, tossDecision: String?
    let teams: [Team]?
    let fallOfWickets: [FallOfWicket]?

    enum CodingKeys: String, CodingKey {
        case format, toss
        case tossDecision = "toss_decision"
        case teams, fallOfWickets
    }
}

// MARK: - FallOfWicket
struct FallOfWicket: Codable {
    let id, team: String?
    let wickets: [Wicket]?
}

// MARK: - Wicket
struct Wicket: Codable {
    let player: String?
    let score: Int?
    let overs: Double?
    let dismissal: Dismissal?
}

// MARK: - Dismissal
struct Dismissal: Codable {
    let type: String?
    let fielder: String?
    let bowler: String?
}

// MARK: - Team
struct Team: Codable {
    let id, fullname, name: String?
    let match: Int?
    let date, time, stadium, opponent: String?
    let opponentFullname: String?
    let players: [Player]?
    let bowlers: [Bowler]?

    enum CodingKeys: String, CodingKey {
        case id, fullname, name, match, date, time, stadium, opponent
        case opponentFullname = "opponent_fullname"
        case players, bowlers
    }
}

// MARK: - Bowler
struct Bowler: Codable {
    let strike: Double?
    let maiden: Int?
    let name: String?
    let overs, runsConceded, wickets: Int?
}

// MARK: - Player
struct Player: Codable {
    let strike: Int?
    let name: String?
    let runs, balls, fours, sixes: Int?
    let dismissal: Dismissal?
}

