//
//  AboutVC.swift
//  Hegg
//
//  Created by Mamdouh El Nakeeb on 8/1/17.
//  Copyright © 2017 Mamdouh El Nakeeb. All rights reserved.
//

import UIKit
import GoogleMaps

class AboutVC: UIViewController, UIGestureRecognizerDelegate {

    let lat = 21.4151678
    let lon = 39.8789227
    let campName = "شركة أهالي القصيم"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
        
        let image = UIImage(named:"sideMenuIcon")?.withRenderingMode(.alwaysTemplate)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(SSASideMenu.presentRightMenuViewController))
        
       
        initDesc()
        initMap()
        initHeaderView()
        initSocialMedia()
        
    }

    func initMap(){
        
        let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: lon, zoom: 18.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.settings.compassButton = true
        mapView.settings.scrollGestures = true
        mapView.settings.zoomGestures = true
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        let markerIcon = UIImage(named: "markerIcon")!.withRenderingMode(.alwaysTemplate)
        let markerIconView = UIImageView(image: markerIcon)
        markerIconView.tintColor = UIColor(red: 74/255, green: 174/255, blue: 106/255, alpha: 1)
        markerIconView.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        marker.iconView = markerIconView
        
        marker.position = CLLocationCoordinate2D(latitude: lat, longitude: lon)
        marker.title = campName
        marker.map = mapView
        
        mapView.frame = CGRect(x: 0, y: (self.view.frame.height * 2 / 3), width: self.view.frame.width, height: self.view.frame.height / 3)
        
        self.view.addSubview(mapView)
        
    }
    
    func initHeaderView(){
        let margin: CGFloat = 30
        let logoIV = UIImageView(image: UIImage(named: "logo_icon"))
        
        logoIV.frame = CGRect(x: self.view.frame.width - margin * 4, y: 30, width: 80, height: 80)
        
        let appNameLbl = UILabel(frame: CGRect(x: self.view.frame.width - margin * 4, y: 120, width: 80, height: 15))
        appNameLbl.text = "تطبيق الحج"
        appNameLbl.font = UIFont(name: "GE SS Two", size: 14)
        appNameLbl.textAlignment = .center
        appNameLbl.textColor = UIColor.white
        
        let line1 = UIView(frame: CGRect(x: margin , y: 150, width: self.view.frame.width - 2 * margin, height: 1))
        line1.backgroundColor = UIColor.white
        
        line1.alpha = 0.3
        
        let aboutUsLbl = UILabel(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 40))
        aboutUsLbl.text = "من نحن"
        aboutUsLbl.font = UIFont(name: "GE SS Two", size: 20)
        aboutUsLbl.textAlignment = .center
        aboutUsLbl.textColor = UIColor.white
        
        let line2 = UIView(frame: CGRect(x: margin , y: 190, width: self.view.frame.width - 2 * margin, height: 1))
        
        line2.backgroundColor = UIColor.white
        
        line2.alpha = 0.3
        
        
        self.view.addSubview(logoIV)
        self.view.addSubview(appNameLbl)
        self.view.addSubview(line1)
        self.view.addSubview(aboutUsLbl)
        self.view.addSubview(line2)
    }
    
    func initSocialMedia(){
        
        let smHeight: CGFloat = 40
        
        let viewSize = CGSize(width: self.view.frame.width / 3, height: smHeight)
        
        let greenV = UIView(frame: CGRect(x: 0, y: 210, width: self.view.frame.width, height: smHeight))
        greenV.backgroundColor = UIColor.primaryColor()
        
        let fbVCenter = CGPoint(x: (self.view.frame.width / 6) - 10, y: 0)
        let fbBtnTitle = UILabel(frame: CGRect(origin: fbVCenter, size: viewSize))
        fbBtnTitle.textColor = UIColor.white
        fbBtnTitle.font = UIFont(name: fbBtnTitle.font.fontName, size: 14)
        fbBtnTitle.text = "Facebook"
        
        let fbIcon = UIImage(named: "fbIcon")!.withRenderingMode(.alwaysTemplate)
        let fbBtnImg = UIImageView(image: fbIcon)
        
        fbBtnImg.tintColor = UIColor.white
        fbBtnImg.frame = CGRect(x: fbBtnTitle.frame.minX - 40, y: 0, width: 25, height: smHeight)
        fbBtnImg.contentMode = .scaleAspectFit
        
        
        let twtVCenter = CGPoint(x: (self.view.frame.width / 2) - 10, y: 0)
        
        let twtBtnTitle = UILabel(frame: CGRect(origin: twtVCenter, size: viewSize))
        twtBtnTitle.textColor = UIColor.white
        twtBtnTitle.font = UIFont(name: twtBtnTitle.font.fontName, size: 14)
        twtBtnTitle.text = "Twitter"
        
        let twtIcon = UIImage(named: "twitter_icon")!.withRenderingMode(.alwaysTemplate)
        let twtBtnImg = UIImageView(image: twtIcon)
        
        twtBtnImg.tintColor = UIColor.white
        twtBtnImg.frame = CGRect(x: twtBtnTitle.frame.minX - 40, y: 0, width: 25, height: smHeight)
        twtBtnImg.contentMode = .scaleAspectFit

        
        //let siteVCenter = CGPoint(x: (self.view.frame.width / 6 * 5) - 10, y: 0)
        let siteBtnTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: smHeight))
        siteBtnTitle.textColor = UIColor.white
        siteBtnTitle.textAlignment = .center
        siteBtnTitle.font = UIFont(name: siteBtnTitle.font.fontName, size: 14)
        siteBtnTitle.text = "www.ahalyalqassim.com"

        let siteIcon = UIImage(named: "siteIcon")!.withRenderingMode(.alwaysTemplate)
        let siteBtnImg = UIImageView(image: siteIcon)

        siteBtnImg.tintColor = UIColor.white
        siteBtnImg.frame = CGRect(x: 20, y: 0, width: 25, height: smHeight)
        siteBtnImg.contentMode = .scaleAspectFit
        
        let siteBtnTap = UITapGestureRecognizer(target: self, action: #selector(openSite))
        siteBtnTap.delegate = self
        greenV.addGestureRecognizer(siteBtnTap)
        
        let greenV1 = UIView(frame: CGRect(x: 0, y: greenV.frame.maxY, width: self.view.frame.width, height: smHeight))
        greenV1.backgroundColor = UIColor.primaryColor()
        
        let mobBtnTitle = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: smHeight))
        mobBtnTitle.textColor = UIColor.white
        mobBtnTitle.textAlignment = .right
        mobBtnTitle.font = UIFont(name: siteBtnTitle.font.fontName, size: 14)
        mobBtnTitle.text = "0555145983 / "
        
        let mobBtnTitle2 = UILabel(frame: CGRect(x: mobBtnTitle.frame.maxX, y: 0, width: self.view.frame.width / 2, height: smHeight))
        mobBtnTitle2.textColor = UIColor.white
        mobBtnTitle2.textAlignment = .left
        mobBtnTitle2.font = UIFont(name: siteBtnTitle.font.fontName, size: 14)
        mobBtnTitle2.text = " 0163263091"
        
        let mobIcon = UIImage(named: "contactIcon")!.withRenderingMode(.alwaysTemplate)
        let mobBtnImg = UIImageView(image: mobIcon)
        
        mobBtnImg.tintColor = UIColor.white
        mobBtnImg.frame = CGRect(x: 20, y: 0, width: 25, height: smHeight)
        mobBtnImg.contentMode = .scaleAspectFit
        
        let mobBtnTap = UITapGestureRecognizer(target: self, action: #selector(openMob))
        mobBtnTap.delegate = self
        let mobBtnTap2 = UITapGestureRecognizer(target: self, action: #selector(openMob2))
        mobBtnTap2.delegate = self
        mobBtnTitle.addGestureRecognizer(mobBtnTap)
        mobBtnTitle2.addGestureRecognizer(mobBtnTap2)
        
        greenV1.addSubview(mobBtnImg)
        greenV1.addSubview(mobBtnTitle)
        greenV1.addSubview(mobBtnTitle2)
        
        greenV.addSubview(siteBtnImg)
        greenV.addSubview(siteBtnTitle)
        
        self.view.addSubview(greenV)
        self.view.addSubview(greenV1)
        
    }
    
    func initDesc(){
        
        let whiteView = UIView(frame: CGRect(x: 0, y: 290, width: self.view.frame.width, height: self.view.frame.height - 290))
        whiteView.backgroundColor = UIColor.white
        
        let descLbl = UILabel(frame: CGRect(x: 20, y: 0, width: self.view.frame.width - 40, height: whiteView.frame.height - 190))
        
        descLbl.textColor = UIColor.lightGray
        descLbl.numberOfLines = 8
        descLbl.textAlignment = .center
        descLbl.font = UIFont(name: "GE SS Two", size: 15)
        descLbl.text = "شركة حملة أهالي القصيم إحدى الشركات التي تقدم أرقى الخدمات لضيوف الرحمن، لحجاج الداخل من مواطنين ومقيمين وبأسعار منافسة" + "\n" + "تقديم خدمة متكاملة لحجاج بيت الله الحرام والتفاني في ذلك ليتفرغ الحاج لعبادته ويؤديها كما أراد الله سبحانه وتعالى وعلى منهج المصطفي صلى الله عليه و سلم"

        whiteView.addSubview(descLbl)
        
        self.view.addSubview(whiteView)
    }
    
    func openSite (){
        
        UIApplication.tryURL(urls: [
            Urls.website
            ])
    }
    
    func openMob(){
        UIApplication.tryURL(urls: [
            "tel:0555145983"
            ])
    }
    
    func openMob2(){
        UIApplication.tryURL(urls: [
            "tel:0163263091"
            ])
    }
    
}



