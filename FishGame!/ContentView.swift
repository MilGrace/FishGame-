//
//  ContentView.swift
//  FishGame!
//
//  Created by Verdin on 2/8/23.
//

import SwiftUI
import SDWebImageSwiftUI

struct CustomColor {
    static let mellowPink = Color("mellowPink")
    
}
struct ContentView: View {
 
    
    @State var fishImageURL = ""
    @State var fishNames = [Fish] ()
    @State var randomFish: Fish = Fish()
    @State var fishName = ""
    
    var body: some View {
        
        
        ZStack {
            
                
            
                      
                       
            Image("bunnyfish-1")
                .position(x: 180, y: 300)
            Image("rod")
                .position(x:275, y: 255)
            Button("Catch Fish")
            {
                getRandomFish()
                displayFishImage(fish: randomFish)
                //print(randomFish.name)
                //print(randomFish.imageString)
            }
            
            .frame(width: 180, height: 50)
            .background(CustomColor.mellowPink)
            .cornerRadius(25)
            .position(x:370, y: 80)
            .buttonStyle(.borderless)
            .font(Font.custom("", size: 30))
            WebImage(url: URL(string: fishImageURL))
                       .resizable()
                       .frame(width: 280, height: 200)
                       .aspectRatio(contentMode: .fit)
         
            Text("You caught a \(fishName)")
                .font(.title)
                .position(x:390,y:370)
                .foregroundColor(CustomColor.mellowPink)
                
            
            
        }
        .background(Image("bunnyfishmeadow"))
        
        .frame(width: 800, height: 500)
        .onAppear(perform: getFishNames)
        
        
    }
    
    func getFishNames()
    {
        let urlString = "https://www.fishwatch.gov/api/species"
        if let url = URL(string: urlString)
        {
           let task = URLSession.shared.dataTask(with: url) {
              (data, response, error) in
                 if let err = error {
                    print(err)
                    return
                 }


                 do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? [[String: Any]]
                    
                     if let fishList = json {
                         for fish in fishList {
                             let fishName = fish["Species Name"] as? String ??
                             "Angelfish"
                             
                             let fishImage1 = fish["Image Gallery"] as? [[String: Any]]//[[String:Any]]
                             
                             let imageDictionary = fishImage1?.first
                             let fishImageURL: String? = imageDictionary?["src"] as? String
//                             if let fishDictionaries = fishImage1, let fish1 = fishDictionaries.first
//                             {
//
//                             }
                             
                             
                             
                             
                             let fish = Fish(name: fishName as? String ?? "", imageString: fishImageURL ?? "")
                             fishNames.append(fish)
                             
                             
                         }
                         
                         
                     }
//                    for item in json
//                    {
//
//                    }
                   /* let theQuestion = dictionary["question"] as? String ?? "clue error"
                    self.answer = dictionary["answer"] as? String ?? "answer error"
                    DispatchQueue.main.async {
                       self.displayLabel.text = theQuestion
                       self.view.endEditing(true)
                    }
                   */
                 } catch let jsonError {
                    print(jsonError)
                 }
                        
             }
             task.resume()
          }


    }
    func getRandomFish()
    {
        randomFish = fishNames.randomElement() ?? Fish()
        
    }
    func displayFishImage(fish: Fish)
    {
        fishImageURL = fish.imageString
        print(fishImageURL)
        fishName = fish.name
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            
            
            
        
    }
    
    
}


