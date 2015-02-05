//
//  Arrange.swift
//  Showpp
//
//  Created by Luis Diego Conejo Mora on 1/25/15.
//  Copyright (c) 2015 Luis Diego Conejo Mora. All rights reserved.
//

import Foundation

class Arrange{
    var db: Array<AnyObject> = [];
    
    var dbRating : Array<AnyObject> = [];
    var dbSeen : Array<AnyObject> = [];
    var dbBuy : Array<AnyObject> = [];
    var dbCart : Array<AnyObject> = [];
    var dbRandom : Array<AnyObject> = [];
    
    init(){
        
    }
    
    init(db : Array<AnyObject>){
        self.db = db;
        
        self.dbRating = arrangeProducts("rating");
        self.dbSeen = arrangeProducts("tSeen");
        self.dbBuy = arrangeProducts("tBuy");
        self.dbCart = arrangeProducts("tCart");
        self.dbRandom = arrangeProducts("random");
    }

    func arrangeProducts(action : String) -> Array<AnyObject>{
        //When loaded, before reloadProduct, this arrange the self.db according to the parameter, it could be by rating, by tSeen, by tBuy, by tCart or random
        if (action == "rating"){
            self.db = sorted(self.db,arrangeRating);
            return self.db;
        }else if (action == "random"){
            self.db.shuffle();
            return self.db;
        }else if (action == "tSeen"){
            self.db = sorted(self.db,arrangeSeen);
            return self.db;
        }else if (action == "tCart"){
            self.db = sorted(self.db,arrangeCart);
            return self.db;
        }else if (action == "tBuy"){
            self.db = sorted(self.db,arrangeBuy);
            return self.db;
        }else{
            return self.db;
        }
    }
    
    func arrangeRating(s1 : AnyObject, s2 : AnyObject) -> Bool{
        var a : Int = s1[5] as Int
        var b : Int = s2[5] as Int
        return a > b
    };
    
    func arrangeSeen(s1 : AnyObject, s2 : AnyObject) -> Bool{
        var a : Int = s1[6][0] as Int
        var b : Int = s2[6][0] as Int
        return a > b
    };
    
    func arrangeCart(s1 : AnyObject, s2 : AnyObject) -> Bool{
        var a : Int = s1[6][1] as Int
        var b : Int = s2[6][1] as Int
        return a > b
    };
    
    func arrangeBuy(s1 : AnyObject, s2 : AnyObject) -> Bool{
        var a : Int = s1[6][2] as Int
        var b : Int = s2[6][2] as Int
        
        return a > b
    };

    
    
    
    
}