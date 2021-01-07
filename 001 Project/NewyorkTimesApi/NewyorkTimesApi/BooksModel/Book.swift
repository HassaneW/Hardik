/* 
Copyright (c) 2020 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Book : Codable , Identifiable {
	let url : String?
	let publication_dt : String?
	let byline : String?
	let book_title : String?
	let book_author : String?
	let summary : String?
	let uuid : String?
	let uri : String?
	let isbn13 : [String]?
    let id = UUID()

	enum CodingKeys: String, CodingKey {

		case url = "url"
		case publication_dt = "publication_dt"
		case byline = "byline"
		case book_title = "book_title"
		case book_author = "book_author"
		case summary = "summary"
		case uuid = "uuid"
		case uri = "uri"
		case isbn13 = "isbn13"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		url = try values.decodeIfPresent(String.self, forKey: .url)
		publication_dt = try values.decodeIfPresent(String.self, forKey: .publication_dt)
		byline = try values.decodeIfPresent(String.self, forKey: .byline)
		book_title = try values.decodeIfPresent(String.self, forKey: .book_title)
		book_author = try values.decodeIfPresent(String.self, forKey: .book_author)
		summary = try values.decodeIfPresent(String.self, forKey: .summary)
		uuid = try values.decodeIfPresent(String.self, forKey: .uuid)
		uri = try values.decodeIfPresent(String.self, forKey: .uri)
		isbn13 = try values.decodeIfPresent([String].self, forKey: .isbn13)
	}

}
