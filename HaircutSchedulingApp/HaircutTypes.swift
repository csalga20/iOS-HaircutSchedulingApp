//
//  HaircutTypes.swift
//  HaircutSchedulingApp
//
//  Created by Charles Salgado on 10/7/22.
//

import Foundation

var haircutStyles = [
    haircut(type: .F,
            price: 25,
            shortDescription: "A blend from short to long all around the head.",
            longDescription: "The three most common variations of this are: low, mid, or high fade. The main difference between all three is where the fade begins. "),
    haircut(type: .B,
            price: 25,
            shortDescription: "A blend on the sides only.",
            longDescription: "The main difference between this hairstyle and a fade is that this only applies to the sides and back of your head, instead of it being all around."),
    haircut(type: .T,
            price: 25,
            shortDescription: "A smaller blend than a blowout on the sides.",
            longDescription: "A taper and a blowout are two very similar haircut styles but the small distinction between them is the size of it. A taper is blended in around the beginning of your sideburns. "),
    haircut(type: .S,
            price: 30,
            shortDescription: "No clippers used, scissors only.",
            longDescription: "Scissor work takes more time depending on the hairstyle, so please take this into consideration when selecting this option. (10-15 minutes more)"),
    haircut(type: .FH,
            price: 15,
            shortDescription: "Facial hair is the only hair to be touched up.",
            longDescription: "While many use this option just for their beards, it can also be used to sharpen the eyebrows. "),
    haircut(type: .FS,
            price: 35,
            shortDescription: "A full service haircut, can be combined with other haircut types. ",
            longDescription: "Choose this option if you would like to have both a haircut and facial hair done."),
    haircut(type: .SR,
            price: 28,
            shortDescription: "Special Request.",
            longDescription: "A special request is mainly used for precise instructions that you would like to provide to me for cutting your hair. It can also be used to do any type of fun or out of the ordinary haircut designs. "),
]

var haircutPrices = [Int] ()
var haircutTypes = [String] ()

class haircut
{
    enum hairType: String
    {
        case F = "Fade"
        case B = "Blowout"
        case T = "Taper"
        case S = "Scissors"
        case FH = "Facial Hair"
        case SR = "Special"
        case FS = "Full Service"
    }
    
    var price: Int
    var shortDescription: String
    var longDescription: String
    var type: hairType
    
    init(type: hairType, price: Int, shortDescription: String, longDescription: String)
    {
        self.type = type
        self.price = price
        self.shortDescription = shortDescription
        self.longDescription = longDescription
    }
}
