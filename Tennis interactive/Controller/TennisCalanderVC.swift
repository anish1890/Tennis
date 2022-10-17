//
//  TennisCalanderVC.swift
//  TennisInteractive
//
//  Created by Anish on 10/12/22.
//

import UIKit
import KRProgressHUD
import Alamofire
import SwiftyJSON
import FSCalendar



class TennisCalanderVC: UIViewController,FSCalendarDelegate,UITableViewDelegate,UITableViewDataSource {
 
    
    
    @IBOutlet weak var calendarTableView: UITableView!
    @IBOutlet weak var calendar: FSCalendar!
    
    
    var match = [Match]()
    var finalMatch = [Match]()
  
    var selectionDate = ""
    var firstDate: Date?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        // Do any additional setup after loading the view.
       
        
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        //2022-09-21 19:00:00 +0000
        self.finalMatch = self.match
        let formatterFC = DateFormatter()
        formatterFC.dateFormat = "yyyy-MM-dd"
        let stringDate = formatterFC.string(from: date)
//        self.filterdArray =  finalMatch.filter { $0.date == stringDate }
//        self.calendarTableView.reloadData()
        self.getMatches(date: stringDate)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalMatch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HomeMatchCell
        cell.setValues(match: finalMatch[indexPath.row])
        //cell.awayTeamHistoryBtn.tag = indexPath.row
        //cell.homeTeamHistoryBtn.tag = indexPath.row
       // cell.homeTeamHistoryBtn.addTarget(self, action: #selector(historyBtnTappedHome(sender:)), for: .touchUpInside)
       // cell.awayTeamHistoryBtn.addTarget(self, action: #selector(historyBtnTappedAway(sender:)), for: .touchUpInside)
        return cell
    }

}
extension TennisCalanderVC {
    func getMatches(date: String) {
        KRProgressHUD.show()
        Alamofire.request("https://api.sportradar.com/tennis/trial/v3/en/schedules/\(date)/summaries.json?api_key=v5mprf2qxypr3vveem32tq6d", method: .get, encoding: JSONEncoding.default, headers: HEADER).responseJSON { response in
            if response.result.isSuccess {
                let data : JSON = JSON(response.result.value!)
                //print(data)
                self.parseMatches(json: data["summaries"])
            }else {
                KRProgressHUD.dismiss()
            }
        }
    }
    func parseMatches(json:JSON) {
        self.match.removeAll()
        self.finalMatch.removeAll()
        for item in json {
            if item.1["sport_event_status"]["status"].string ?? "" == "not_started" {
                let homeTeamName : String = item.1["sport_event"]["competitors"][0]["name"].string ?? ""
                let awayTeamName : String = item.1["sport_event"]["competitors"][1]["name"].string ?? ""
                let matchStartTime = item.1["sport_event"]["start_time"].string ?? ""
                
                let matchData =  Match(matchId: "", homeTeamId: "", homeTeamName: homeTeamName, awayTeamId: "", awayTeamName: awayTeamName, matchStartTime: matchStartTime, matchDay: "")
                self.match.append(matchData)
            }
        }
        self.finalMatch = self.match
        self.calendarTableView.reloadData()
        KRProgressHUD.dismiss()
    }
}


