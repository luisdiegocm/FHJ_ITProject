//
//  PopulateDataBase.swift
//  Showpp
//
//  Created by Luis Diego Conejo Mora on 1/9/15.
//  Copyright (c) 2015 Luis Diego Conejo Mora. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    
    var products : [NSManagedObject] = []
    
    init(){
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Product")
        
        //3
        var error: NSError?
        
        let fetchedResults =
        managedContext.executeFetchRequest(fetchRequest,
            error: &error) as [NSManagedObject]?
        
        self.products = fetchedResults!;
        
        if fetchedResults?.count == 0 {
            addRegisters()
        }
        
        
    }
    
    func addRegisters(){
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as AppDelegate
        
        let managedContext = appDelegate.managedObjectContext!
        
        //2
        let entity =  NSEntityDescription.entityForName("Product",
            inManagedObjectContext:
            managedContext)
        
        addRegister(1,entity:entity!,managedContext : managedContext,name: "PS4",image: "image1.jpeg",price: 300,rating: 4,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(2,entity:entity!,managedContext : managedContext,name: "iPod",image: "image2.jpeg",price: 250,rating: 3,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(3,entity:entity!,managedContext : managedContext,name: "Skype",image: "image3.png",price: 50,rating: 5,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(4,entity:entity!,managedContext : managedContext,name: "Whatsapp",image: "image4.jpeg",price: 10,rating: 2,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(5, entity:entity!,managedContext : managedContext,name: "Facebook",image: "image5.jpeg",price: 69,rating: 5,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(6,entity:entity!,managedContext : managedContext,name: "LinkedIn",image: "image6.png",price: 150,rating: 3,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(7,entity:entity!,managedContext : managedContext,name: "Twitter",image: "image7.jpeg",price: 20,rating: 1,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(8,entity:entity!,managedContext : managedContext,name: "Telegram",image: "image8.jpeg",price: 70,rating: 5,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(9,entity:entity!,managedContext : managedContext,name: "iTunes",image: "image9.jpeg",price: 200,rating: 4,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
        
        addRegister(10,entity : entity!,managedContext : managedContext,name: "Gmail",image: "image10.jpeg",price: 240,rating: 2,descr: "Lorem ipsum ad his scripta blandit partiendo, eum fastidii accumsan euripidis in, eum liber hendrerit an. Qui ut wisi vocibus suscipiantur, quo dicit ridens inciderint id. Quo mundi lobortis reformidans eu, legimus senserit definiebas an eos.")
        
    }
    
    func addRegister(id : Int, entity : NSEntityDescription, managedContext : NSManagedObjectContext,
        name : String, image : String, price : NSNumber, rating : NSDecimalNumber, descr : String){
            
            let product = NSManagedObject(entity: entity,
                insertIntoManagedObjectContext:managedContext)
            
            let entityInd =  NSEntityDescription.entityForName("Indicator",
                inManagedObjectContext:
                managedContext)
            
            let indicator = NSManagedObject(entity: entityInd!, insertIntoManagedObjectContext : managedContext);
            
            indicator.setValue(id, forKey: "idProduct")
            indicator.setValue(Int(arc4random_uniform(3000)), forKey: "t_Seen")
            indicator.setValue(Int(arc4random_uniform(300)),forKey:"t_Cart")
            indicator.setValue(Int(arc4random_uniform(100)),forKey:"t_Buy")
            //3
            product.setValue(id, forKey: "id")
            product.setValue(name, forKey: "name")
            product.setValue(image, forKey: "image")
            product.setValue(descr, forKey: "descr")
            product.setValue(price, forKey: "price")
            product.setValue(rating, forKey: "rating")
            product.setValue(indicator,forKey: "product_indicator")
            
            //4
            var error: NSError?
            if !managedContext.save(&error) {
                println("Could not save \(error), \(error?.userInfo)")
            }
            self.products.append(product);
    }
    
    func createLocalDB() ->  Array<AnyObject>{
        var db : Array<AnyObject> = [];
        
        for i in self.products{
            let id = i.valueForKey("id") as NSNumber?;
            let name = i.valueForKey("name") as String?;
            let image = i.valueForKey("image") as String?;
            let price = i.valueForKey("price") as NSNumber?
            let descr = i.valueForKey("descr") as String?;
            let rating = i.valueForKey("rating") as NSNumber?;
            
            let indicators = i.valueForKey("product_indicator") as Indicator
            
            let t_seen = indicators.t_Seen;
            let t_cart = indicators.t_Cart;
            let t_buy = indicators.t_Buy;
            
            var indDB = [t_seen,t_cart,t_buy];
            
            var thisProduct : Array<AnyObject> = [id!,name!,image!,price!,descr!,rating!,[t_seen,t_cart,t_buy]];
            //thisProduct.append(id!);
            //thisProduct.append(name!)
            //thisProduct.append(image!)
            //thisProduct.append(price!)
            //thisProduct.append(descr!)
            //thisProduct.append(rating!)
            //thisProduct.append(indDB)
            
            //println(thisProduct);
            
            db.append(thisProduct);
        }
        
        //println(db)
        //println(db[0][6])
        return db;
        
    }
    
}