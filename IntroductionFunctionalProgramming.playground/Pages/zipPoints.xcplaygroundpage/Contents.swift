//: [Previous](@previous)
import UIKit
import PlaygroundSupport

class GraphView : UIView {
    var points : [CGPoint] = []
    { didSet {
        let pairs = zip (points,points.dropFirst())
        averagePoints = pairs.map {
            CGPoint(x: ($0.x + $1.x) / 2, y: ($0.y + $1.y) / 2 )}
        setNeedsDisplay(); setNeedsLayout()
        }
    }
    var averagePoints: [CGPoint] = []
    override func draw(_ rect: CGRect) {
        guard points.count > 2 else {return}
        let path = UIBezierPath(rect: rect)
        path.move(to: points.first!)
        for point in points {
            path.addLine(to: point)
        }
        path.lineWidth = 2
        path.stroke()
        let path1 = UIBezierPath(rect: rect)
        UIColor.red.setStroke()
        path1.move(to: averagePoints.first!)
        for point in averagePoints {
            path1.addLine(to: point)
        }
        path1.lineWidth = 3
        path1.stroke()
    }
    
}


class ViewController : UIViewController {
    override func loadView() {
        
        // UI
        let view = UIView()
        view.backgroundColor = .white
        let graphView = GraphView(frame: CGRect (x: 0, y: 0, width: 400, height: 200  ))
        graphView.points = [CGPoint(x: 0, y: 5), CGPoint(x: 40, y: 80), CGPoint(x: 80, y: 20), CGPoint(x: 120, y: 30), CGPoint(x: 160, y: 110), CGPoint(x: 200, y: 180), CGPoint(x: 240, y:190), CGPoint(x: 280, y: 10), CGPoint(x: 320, y: 180), CGPoint(x: 360, y: 30), CGPoint(x: 380, y: 110)]
        graphView.backgroundColor = UIColor.white
        view.addSubview(graphView)
        self.view = view
    }
    
}

PlaygroundPage.current.liveView = ViewController()


