//
//  Repo.swift
//  Repositories Applications
//
//  Created by mariam adly on 25/10/2023.
//

import Foundation

struct Repos : Codable {
    var id: Int?
    var nodeID, name, fullName: String?
    var welcomePrivate: Bool?
    var owner: Owner?
    var htmlURL: String?
    var description: String?
    var fork: Bool?
    var url, forksURL: String?
    var keysURL, collaboratorsURL: String?
    var teamsURL, hooksURL: String?
    var issueEventsURL: String?
    var eventsURL: String?
    var assigneesURL, branchesURL: String?
    var tagsURL: String?
    var blobsURL, gitTagsURL, gitRefsURL, treesURL: String?
    var statusesURL: String?
    var languagesURL, stargazersURL, contributorsURL, subscribersURL: String?
    var subscriptionURL: String?
    var commitsURL, gitCommitsURL, commentsURL, issueCommentURL: String?
    var contentsURL, compareURL: String?
    var mergesURL: String?
    var archiveURL: String?
    var downloadsURL: String?
    var issuesURL, pullsURL, milestonesURL, notificationsURL: String?
    var labelsURL, releasesURL: String?
    var deploymentsURL: String?
    var createdAt, updatedAt: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case welcomePrivate = "private"
        case owner
        case htmlURL = "html_url"
        case description, fork, url
        case forksURL = "forks_url"
        case keysURL = "keys_url"
        case collaboratorsURL = "collaborators_url"
        case teamsURL = "teams_url"
        case hooksURL = "hooks_url"
        case issueEventsURL = "issue_events_url"
        case eventsURL = "events_url"
        case assigneesURL = "assignees_url"
        case branchesURL = "branches_url"
        case tagsURL = "tags_url"
        case blobsURL = "blobs_url"
        case gitTagsURL = "git_tags_url"
        case gitRefsURL = "git_refs_url"
        case treesURL = "trees_url"
        case statusesURL = "statuses_url"
        case languagesURL = "languages_url"
        case stargazersURL = "stargazers_url"
        case contributorsURL = "contributors_url"
        case subscribersURL = "subscribers_url"
        case subscriptionURL = "subscription_url"
        case commitsURL = "commits_url"
        case gitCommitsURL = "git_commits_url"
        case commentsURL = "comments_url"
        case issueCommentURL = "issue_comment_url"
        case contentsURL = "contents_url"
        case compareURL = "compare_url"
        case mergesURL = "merges_url"
        case archiveURL = "archive_url"
        case downloadsURL = "downloads_url"
        case issuesURL = "issues_url"
        case pullsURL = "pulls_url"
        case milestonesURL = "milestones_url"
        case notificationsURL = "notifications_url"
        case labelsURL = "labels_url"
        case releasesURL = "releases_url"
        case deploymentsURL = "deployments_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}


struct Owner: Codable {
    var login: String?
    var id: Int?
    var nodeID: String?
    var avatarURL: String?
    var gravatarID: String?
    var url, htmlURL, followersURL: String?
    var followingURL, gistsURL, starredURL: String?
    var subscriptionsURL, organizationsURL, reposURL: String?
    var eventsURL: String?
    var receivedEventsURL: String?
    var type: TypeEnum?
    var siteAdmin: Bool?

    enum CodingKeys: String, CodingKey {
        case login, id
        case nodeID = "node_id"
        case avatarURL = "avatar_url"
        case gravatarID = "gravatar_id"
        case url
        case htmlURL = "html_url"
        case followersURL = "followers_url"
        case followingURL = "following_url"
        case gistsURL = "gists_url"
        case starredURL = "starred_url"
        case subscriptionsURL = "subscriptions_url"
        case organizationsURL = "organizations_url"
        case reposURL = "repos_url"
        case eventsURL = "events_url"
        case receivedEventsURL = "received_events_url"
        case type
        case siteAdmin = "site_admin"
    }
}

enum TypeEnum: String, Codable {
    case organization = "Organization"
    case user = "User"
}


struct RepoDate: Codable {
      var login: String?
      var id: Int?
      var nodeID: String?
      var avatarURL: String?
      var gravatarID: String?
      var url, htmlURL, followersURL: String?
      var followingURL, gistsURL, starredURL: String?
      var subscriptionsURL, organizationsURL, reposURL: String?
      var eventsURL: String?
      var receivedEventsURL: String?
      var type: String?
      var siteAdmin: Bool?
      var name, company: String?
      var blog: String?
      var location: String?
      var email, hireable, bio: JSONNull?
      var twitterUsername: String?
      var publicRepos, publicGists, followers, following: Int?
      var createdAt, updatedAt: String?

      enum CodingKeys: String, CodingKey {
          case login, id
          case nodeID = "node_id"
          case avatarURL = "avatar_url"
          case gravatarID = "gravatar_id"
          case url
          case htmlURL = "html_url"
          case followersURL = "followers_url"
          case followingURL = "following_url"
          case gistsURL = "gists_url"
          case starredURL = "starred_url"
          case subscriptionsURL = "subscriptions_url"
          case organizationsURL = "organizations_url"
          case reposURL = "repos_url"
          case eventsURL = "events_url"
          case receivedEventsURL = "received_events_url"
          case type
          case siteAdmin = "site_admin"
          case name, company, blog, location, email, hireable, bio
          case twitterUsername = "twitter_username"
          case publicRepos = "public_repos"
          case publicGists = "public_gists"
          case followers, following
          case createdAt = "created_at"
          case updatedAt = "updated_at"
      }
  }

  // MARK: - Encode/decode helpers

  class JSONNull: Codable, Hashable {

      public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
          return true
      }

      public var hashValue: Int {
          return 0
      }

      public init() {}

      public required init(from decoder: Decoder) throws {
          let container = try decoder.singleValueContainer()
          if !container.decodeNil() {
              throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
          }
      }

      public func encode(to encoder: Encoder) throws {
          var container = encoder.singleValueContainer()
          try container.encodeNil()
      }
}

