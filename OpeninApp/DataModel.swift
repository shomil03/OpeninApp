import Foundation


struct MockDataObject{
    static let emptyResponse = Response(status: false, statusCode: 200, message: "", support_whatsapp_number: "", extra_income: 423, total_links: 32, total_clicks: -1, today_clicks: 32, top_source: "", top_location: "", startTime: "", links_created_today: 32, applied_campaign: 42, data: DataObject(recent_links: [], top_links: [], favourite_links: []))
    static let sampleResponse = Response(status: true, statusCode: 123, message: "Hello", support_whatsapp_number: "983234", extra_income: 32.909, total_links: 92, total_clicks: 452, today_clicks: 234, top_source: "top_source", top_location: "kanpur", startTime: "time", links_created_today: 432, applied_campaign: 1234, data: DataObject(recent_links : [RecentLink(url_id: 146150,
                                                                                                                                                                                                                                                                                                                                                                             web_link: "https://inopenapp.com/4o5qk",
                                                                                                                                                                                                                                                                                                                                                                             smart_link: "inopenapp.com/4o5qk",
                                                                                                                                                                                                                                                                                                                                                                             title: "651   Flats for Rent in Kormangla Bangalore, Bangalore Karnataka Without Brokerage - NoBroker Rental Properties in Kormangla Bangalore Karnataka Without Brokerage",
                                                                                                                                                                                                                                                                                                                                                                             total_clicks: 259,
                                                                                                                                                                                                                                                                                                                                                                             original_image: "https://assets.nobroker.in/nb-new/public/List-Page/ogImage.png",
                                                                                                                                                                                                                                                                                                                                                                             thumbnail: nil,
                                                                                                                                                                                                                                                                                                                                                                             times_ago: "1 yr ago",
                                                                                                                                                                                                                                                                                                                                                                             created_at: "",
                                                                                                                                                                                                                                                                                                                                                                             domain_id: "inopenapp.com/",
                                                                                                                                                                                                                                                                                                                                                                             url_prefix: nil,
                                                                                                                                                                                                                                                                                                                                                                             url_suffix: "4o5qk",
                                                                                                                                                                                                                                                                                                                                                                             app: "nobroker",
                                                                                                                                                                                                                                                                                                                                                            is_favourite: false)],top_links: [], favourite_links: []))
}
struct Response: Codable {
    let status: Bool
    let statusCode: Int
    let message: String
    let support_whatsapp_number: String
    let extra_income: Double
    let total_links: Int
    let total_clicks: Int
    let today_clicks: Int
    let top_source: String
    let top_location: String
    let startTime: String
    let links_created_today: Int
    let applied_campaign: Int
    let data: DataObject
}

struct DataObject: Codable {
    let recent_links: [RecentLink]
    let top_links: [TopLink]
    let favourite_links: [FavoriteLink]
//    let overallUrlChart: String? // Assuming it's a String or a type you have for chart data
}

struct RecentLink: Codable ,Hashable {
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String?
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix: String
    let app: String
    let is_favourite: Bool
}

struct TopLink: Codable , Hashable {
    let url_id: Int
    let web_link: String
    let smart_link: String
    let title: String
    let total_clicks: Int
    let original_image: String
    let thumbnail: String?
    let times_ago: String
    let created_at: String
    let domain_id: String
    let url_prefix: String?
    let url_suffix: String
    let app: String
    let is_favourite: Bool
}

struct FavoriteLink: Codable {
    // Add properties for your favorite links
}
