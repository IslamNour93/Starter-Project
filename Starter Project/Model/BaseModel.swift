

import Foundation

struct BaseModel : Codable {
	let id : String?
	let created_at : String?
	let updated_at : String?
	let promoted_at : String?
	let width : Int?
	let height : Int?
	let urls : Urls?
	

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case created_at = "created_at"
		case updated_at = "updated_at"
		case promoted_at = "promoted_at"
		case width = "width"
		case height = "height"
		case urls = "urls"
		
	}

}


struct Urls : Codable {
    let raw : String?
    let full : String?
    let regular : String?
    let small : String?
    let thumb : String?
    let small_s3 : String?

    enum CodingKeys: String, CodingKey {

        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
        case small_s3 = "small_s3"
    }

}
