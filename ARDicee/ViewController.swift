//
//  ViewController.swift
//  ARDicee
//
//  Created by Steve Guédon on 14/09/2019.
//  Copyright © 2019 sguedon. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false

        //        //Create a 3D cube with size
        //        let cube = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0.01)
        //
        //        // Create the texture
        //        let material = SCNMaterial()
        //
        //        //Assign a color to the material
        //        material.diffuse.contents = UIColor.red
        //
        //        //Assign the material to the cube in array
        //        cube.materials = [material]
        //
        //        //Create a spacial point
        //        let node = SCNNode()
        //
        //        //Choose a position for the node
        //        node.position = SCNVector3(x: 0, y: 0.1, z: -0.5)
        //
        //        //Assigning geometry to the node
        //        node.geometry = cube
        //
        //        //Adding to the scene the node created
        //        sceneView.scene.rootNode.addChildNode(node)
        //
        //        //Adding light for more 3D effect impression
        //        sceneView.autoenablesDefaultLighting = true

        let diceScene = SCNScene(named: "art.scnassets/DiceTexture.scn")!

        if let diceNode = diceScene.rootNode.childNode(withName: "Dice", recursively: true) {

            diceNode.position = SCNVector3(x: 0, y: 0, z: -0.1 )

            sceneView.scene.rootNode.addChildNode(diceNode)

            sceneView.autoenablesDefaultLighting = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        configuration.planeDetection = .horizontal

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    
    /*
     // Override to create and configure nodes for anchors added to the view's session.
     func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
     let node = SCNNode()
     
     return node
     }
     */
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
}
