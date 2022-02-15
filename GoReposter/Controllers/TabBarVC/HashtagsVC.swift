import UIKit


struct Hastags {
    var nameHashtag: String
    var discriptionHashtag: [String]
   
}

class HashtagsVC: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
   
    
    
    private var hashtags = [Hastags(nameHashtag: "love",
                                    discriptionHashtag: ["#love", "#instagood", "#like", "#follow", "#instagram", "#photooftheday", "#photography", "#beautiful", "#fashion", "#picoftheday", "#bhfyp", "#happy", "#smile", "#art", "#life", "#me", "#likeforlikes", "#instadaily", "#cute", "#followme", "#likes", "#style", "#nature", "#instalike", "#myself", "#followforfollowback", "#beauty", "#photo", "#l"]),
                            Hastags(nameHashtag: "instagood",
                                    discriptionHashtag: ["#instagood", "#love", "#instagram", "#like", "#photooftheday", "#follow", "#photography", "#instadaily", "#picoftheday", "#beautiful", "#fashion", "#instalike", "#likeforlikes", "#followme", "#me", "#smile", "#bhfyp", "#happy", "#likes", "#art", "#style", "#myself", "#followforfollowback", "#nature", "#photo", "#l", "#cute", "#life", "#f"]),
                            Hastags(nameHashtag: "fashion",
                                    discriptionHashtag: ["#l", "#girl", "#likeforfollow", "#f", "#likeforlike", "#makeup", "#fashionista", "#followers", "#followback", "#nature", "#instafashion", "#followforfollow", "#fashionstyle", "#comment", "#photoshoot", "#life", "#selfie", "#portrait", "#likesforlikes", "#lifestyle", "#photographer", "#travel", "#shopping", "#summer", "#outfit", "#look", "#dress", "#design", "#handmade", "#onlineshopping"]),
                            Hastags(nameHashtag: "art",
                                    discriptionHashtag: ["#instadaily", "#life", "#arte", "#beauty", "#music", "#likeforlikes", "#portrait", "#draw", "#travel", "#girl", "#followme", "#photographer", "#fanart", "#instaart", "#artoftheday", "#selfie", "#instalike", "#contemporaryart", "#anime", "#handmade", "#photoshoot", "#creative", "#makeup", "#likes", "#sketchbook", "#ink", "#fun", "#tattoo", "#followforfollowback", "#naturephotography"]),
                            Hastags(nameHashtag: "beatiful",
                                    discriptionHashtag: ["#likeforfollow", "#life", "#likeforlike", "#f", "#followback", "#followers", "#travel", "#followforfollow", "#comment", "#selfie", "#photographer", "#makeup", "#likesforlikes", "#photoshoot", "#portrait", "#fun", "#naturephotography", "#summer", "#amazing", "#pretty", "#lifestyle", "#friends", "#tbt", "#travelphotography", "#girls", "#sunset", "#sky", "#artist", "#fitness", "#landscape"]),
                            Hastags(nameHashtag: "happy",
                                    discriptionHashtag: ["#likeforfollow", "#life", "#likeforlike", "#f", "#followback", "#followers", "#travel", "#followforfollow", "#comment", "#selfie", "#photographer", "#makeup", "#likesforlikes", "#photoshoot", "#portrait", "#fun", "#naturephotography", "#summer", "#amazing", "#pretty", "#lifestyle", "#friends", "#tbt", "#travelphotography", "#girls", "#sunset", "#sky", "#artist", "#fitness", "#landscape"]),
                            Hastags(nameHashtag: "follow",
                                    discriptionHashtag: ["#likeforfollow", "#life", "#likeforlike", "#f", "#followback", "#followers", "#travel", "#followforfollow", "#comment", "#selfie", "#photographer", "#makeup", "#likesforlikes", "#photoshoot", "#portrait", "#fun", "#naturephotography", "#summer", "#amazing", "#pretty", "#lifestyle", "#friends", "#tbt", "#travelphotography", "#girls", "#sunset", "#sky", "#artist", "#fitness", "#landscape"]),
                            Hastags(nameHashtag: "nature",
                                    discriptionHashtag: ["#likeforfollow", "#life", "#likeforlike", "#f", "#followback", "#followers", "#travel", "#followforfollow", "#comment", "#selfie", "#photographer", "#makeup", "#likesforlikes", "#photoshoot", "#portrait", "#fun", "#naturephotography", "#summer", "#amazing", "#pretty", "#lifestyle", "#friends", "#tbt", "#travelphotography", "#girls", "#sunset", "#sky", "#artist", "#fitness", "#landscape"]),
                            Hastags(nameHashtag: "followme",
                                    discriptionHashtag: ["#cute", "#art", "#likesforlikes", "#photo", "#girl", "#life", "#selfie", "#nature", "#fun", "#model", "#igers", "#beauty", "#tbt", "#travel", "#amazing", "#friends", "#bestoftheday", "#following", "#food", "#instafollow", "#instamood", "#insta", "#summer", "#makeup", "#look", "#follower", "#music", "#photographer", "#follows", "#instacool"]),
                            Hastags(nameHashtag: "instadaily",
                                    discriptionHashtag: ["#photo", "#followforfollow", "#life", "#comment", "#instamood", "#cute", "#likesforlikes", "#selfie", "#girl", "#insta", "#model", "#igers", "#fun", "#travel", "#beauty", "#instapic", "#bestoftheday", "#photographer", "#loveyourself", "#photoshoot", "#lifestyle", "#amazing", "#food", "#naturephotography", "#instafashion", "#friends", "#summer", "#motivation", "#tbt", "#instafollow"]),
                            Hastags(nameHashtag: "selfie",
                                    discriptionHashtag: ["#bhfyp", "#likeforlikes", "#music", "#insta", "#portrait", "#lifestyle", "#travel", "#likes", "#summer", "#friends", "#instamood", "#igers", "#k", "#memes", "#f", "#lfl", "#following", "#loveyourself", "#viral", "#tbt", "#likeforlikeback", "#selfietime", "#likeback", "#fitness", "#india", "#photographer", "#photoshoot", "#instaselfie", "#likeforlike", "#followforfollowback"]),
                            Hastags(nameHashtag: "fitness",
                                    discriptionHashtag: ["#bhfyp", "#likeforlikes", "#music", "#insta", "#portrait", "#lifestyle", "#travel", "#likes", "#summer", "#friends", "#instamood", "#igers", "#k", "#memes", "#f", "#lfl", "#following", "#loveyourself", "#viral", "#tbt", "#likeforlikeback", "#selfietime", "#likeback", "#fitness", "#india", "#photographer", "#photoshoot", "#instaselfie", "#likeforlike", "#followforfollowback"])
                                    ]
    
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = self
        tableView.delegate = self
    }
    
    @IBAction private func didTapSetting() {
        
        let nextVC = SettingViewController.getVC(storyboard: .main)

       present(nextVC, animated: true, completion: nil)
        
    }

   
}

extension HashtagsVC: UITableViewDataSource, UITableViewDelegate {
            
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hashtags.count
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "HastagsTableViewCell",for: indexPath) as? HastagsTableViewCell
        
        cell?.nameHashtag.text = hashtags[indexPath.row].nameHashtag
        cell?.discriptionHashtag.text = hashtags[indexPath.row].discriptionHashtag.joined()
        cell?.cellView.layer.cornerRadius = 10.0
        

        return cell ?? UITableViewCell()
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
  
    
    
}
