//
//  ContentView.swift
//  FishGame!
//
//  Created by Verdin on 2/8/23.
//

import SwiftUI

struct CustomColor {
    static let mellowPink = Color("mellowPink")
    
}
struct ContentView: View {
 
    
    
    @State var fishNames = [Fish] ()
    @State var randomFish: Fish = Fish()
    
    
    var body: some View {
        HStack {
            
            Image("bunnyfish-1")
                .position(x: 180, y: 300)
            Image("rod")
                .position(x:-0, y: 255)
            Button("Catch Fish")
            {
                getRandomFish()
                print(randomFish.name)
                print(randomFish.imageString)
            }
            
            .frame(width: 180, height: 50)
            .background(CustomColor.mellowPink)
            .cornerRadius(25)
            .position(x:-160, y: 80)
            .buttonStyle(.borderless)
            .font(Font.custom("", size: 30))
            
            
            
            
        }
        
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
                             
                             let fishImage1 = fish["Image Gallery"] as? Array<Any>//[[String:Any]]
                             var fishImage2 = fishImage1?.first
                             
                             let fish = Fish(name: fishName as? String ?? "", imageString: fishImage2 as? AnyObject ?? Placeholder())
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

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .background(Image("bunnyfishmeadow"))
            
            
        
    }
    
    
}


