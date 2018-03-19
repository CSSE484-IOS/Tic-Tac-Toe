//
//  ViewController.swift
//  Tic-Tac-Toe
//
//  Created by FengYizhi on 2018/3/15.
//  Copyright © 2018年 FengYizhi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var gameBoardBtns: [UIButton]!
    @IBOutlet weak var gameStateLabel: UILabel!
    @IBOutlet weak var gameStateNavBar: UINavigationBar!
    @IBOutlet weak var gameStateImageView: UIImageView!
    
    var game = TicTacToeGame()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameStateNavBar.titleTextAttributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 34)]
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            print("Using iPhone board")
            gameStateImageView.image = #imageLiteral(resourceName: "iPhone_board")
        } else {
            print("Using iPad board")
            gameStateImageView.image = #imageLiteral(resourceName: "iPad_board")
        }
        updateView()
    }
    
    @IBAction func presssedNewGame(_ sender: Any) {
        print("You pressed new game")
        game = TicTacToeGame()
        updateView()
    }
    
    @IBAction func pressedGameBoardButton(_ sender: Any) {
//        guard let gameBoardBtn = sender as? UIButton else {
//            return;
//        }
        let gameBoardBtn = sender as! UIButton
        print(gameBoardBtn.tag)
        game.pressedSquare(gameBoardBtn.tag)
        updateView()
    }
    
    func updateView() {
        var xImage: UIImage
        var oImage: UIImage
        
        if traitCollection.horizontalSizeClass == UIUserInterfaceSizeClass.compact {
            gameStateLabel.text = game.gameState.rawValue
            xImage = #imageLiteral(resourceName: "iPhone_X")
            oImage = #imageLiteral(resourceName: "iPhone_O")
        } else {
            gameStateNavBar.topItem?.title = game.gameState.rawValue
            xImage = #imageLiteral(resourceName: "iPad_X")
            oImage = #imageLiteral(resourceName: "iPad_O")
        }
        
        for i in 0..<9 {
            let btn = gameBoardBtns[i]
            switch game.gameBoard[i] {
            case .x:
                btn.setImage(xImage, for: UIControlState.normal)
            case .o:
                btn.setImage(oImage, for: UIControlState.normal)
            case .none:
                btn.setImage(nil, for: UIControlState.normal)
            }
        }
    }
    
}

