//
//  ViewController.swift
//  WeatherTable
//
//  Created by lee on 2018. 1. 7..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, XMLParserDelegate, UITableViewDelegate {
    
    var datalist: [[String: String]] = []
    var detailData: [String: String] = [:]
    var elementTemp: String = ""
    var blank: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
//        let dict1 = ["지역": "한국","날씨": "비"]
//        let dict2 = ["지역": "일본","날씨": "맑음"]
//        let dict3 = ["지역": "중국","날씨": "우박"]
//        let dict4 = ["지역": "스페인","날씨": "눈"]
//        let dict5 = ["지역": "미국","날씨": "우박"]
//        let dict6 = ["지역": "영국","날씨": "비"]
//        let dict7 = ["지역": "프랑스","날씨": "맑음"]
//        let dict8 = ["지역": "브라질","날씨": "흐림"]
//        let dict9 = ["지역": "스위스","날씨": "눈"]
//        let dict10 = ["지역": "덴마크","날씨": "맑음"]
//        let dict11 = ["지역": "스웨덴","날씨": "비"]
//        let dict12 = ["지역": "네델란드","날씨": "흐림"]
//        let dict13 = ["지역": "크로아티아","날씨": "흐림"]
//        let dict14 = ["지역": "필리핀","날씨": "우박"]
//        let dict15 = ["지역": "독일","날씨": "우박"]
//        let dict16 = ["지역": "헝가리","날씨":" 맑음"]
//        let dict17 = ["지역": "벨기에","날씨": "눈"]
//        let dict18 = ["지역": "핀란드","날씨": "맑음"]
//        let dict19 = ["지역": "이탈리아","날씨": "흐림"]
//        datalist = [dict1, dict2, dict3, dict4, dict5, dict6, dict7, dict8, dict9, dict10, dict11, dict12, dict13, dict14, dict15, dict16, dict17, dict18, dict19]
        
        //parsing xml
        let baseURL = "https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"
        let parser = XMLParser(contentsOf: URL(string: baseURL)!)
        
        parser!.delegate = self
        parser!.parse()
 
    }
    
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        print(elementName)
        elementTemp = elementName
        blank = true
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if blank == true && elementTemp != "local" && elementTemp != "weatherinfo" {
            detailData[elementTemp] = string
            print(string)
        }
    }
    
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        print(elementName)
        if elementName == "local" {
            datalist += [detailData]
        }
        blank = false
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datalist.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! WeatherCell
        
        var dicTemp = datalist[indexPath.row]
        print(dicTemp)
        
        
        let weatherStr = dicTemp["weather"]
        
        cell.WeatherLabel.text = weatherStr
        cell.temperatureLabel.text = dicTemp["temperature"]
        cell.countryLabel.text = dicTemp["country"]
        
        if weatherStr == "맑음" {
            cell.imgView!.image = UIImage(named: "sunny.png")
        }else if weatherStr == "비" {
            cell.imgView!.image = UIImage(named: "rainy.png")
        }else if weatherStr == "흐림" {
            cell.imgView!.image = UIImage(named: "cloudy.png")
        }else if weatherStr == "우박" {
            cell.imgView!.image = UIImage(named: "blizzard.png")
        }else if weatherStr == "눈" {
            cell.imgView!.image = UIImage(named: "snow.png")
        }
        return cell
    }
    
    


}

