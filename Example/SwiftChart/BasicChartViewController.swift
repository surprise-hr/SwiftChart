//
//  BasicChartViewController.swift
//  SwiftChart
//
//  Created by Giampaolo Bellavite on 07/11/14.
//  Copyright (c) 2014 Giampaolo Bellavite. All rights reserved.
//

import UIKit
import SwiftChart

class BasicChartViewController: UIViewController, ChartDelegate {


    @IBOutlet weak var chart: Chart!
    var selectedChart = 0
    
    override func viewDidLoad() {
        
        // Draw the chart selected from the TableViewController
        
        chart.delegate = self

        switch selectedChart {
        case 0:
            
            // Simple chart
          let data = [
            (x: 0, y: 0),
            (x: 3, y: 2.5),
            (x: 4, y: 2),
            (x: 5, y: 2.3),
            (x: 7, y: 3),
            (x: 8, y: 2.2),
            (x: 9, y: 2.5)
          ]
          let series = ChartSeries(data: data)
          series.area = true
          chart.xLabels = [0, 3, 6, 9, 12, 15, 18, 21, 24]
          chart.xLabelsFormatter = { String(Int(round($1))) + "h" }
          chart.add(series)
//          let series = ChartSeries(data: data)
//          chart.add(series)

            
        case 1:
            
            // Example with multiple series, the first two with area enabled
            
            let series1 = ChartSeries([0, 6, 2, 7, 3, 10])
            series1.color = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.8980392157, alpha: 1)

            let series2 = ChartSeries([1, 0, 3, 5, 6, 8])
            series2.color = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8666666667, alpha: 1)

            let series3 = ChartSeries([5, 8, 7, 6, 9, 10])
            series3.color = #colorLiteral(red: 1, green: 0.8980392157, blue: 0.9607843137, alpha: 1)

            let series4 = ChartSeries([4, 2, 5, 8, 7, 8])
            series4.color = #colorLiteral(red: 0.9921568627, green: 0.9176470588, blue: 0.8509803922, alpha: 1)

            let series5 = ChartSeries([3, 6, 2, 7, 9, 9])
            series5.color = #colorLiteral(red: 0.937254902, green: 0.8901960784, blue: 0.9803921569, alpha: 1)

            let series6 = ChartSeries([2, 5, 4, 7, 5, 10])
            series6.color = #colorLiteral(red: 0.07843137255, green: 0.4901960784, blue: 0.9803921569, alpha: 1)

            let series7 = ChartSeries([2, 5, 4, 7, 5, 10])
            series7.color = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            
            chart.add([series1, series2, series3, series4, series5, series6, series7])
            
        case 2:
            
            // Chart with y-min, y-max and y-labels formatter
            let data: [Double] = [0, -2, -2, 3, -3, 4, 1, 0, -1]
            
            let series = ChartSeries(data)
            series.colors = (
              above: ChartColors.greenColor(),
              below: ChartColors.yellowColor(),
              zeroLevel: -1
            )
            series.area = true
            
            chart.add(series)
            
            // Set minimum and maximum values for y-axis
            chart.minY = -7
            chart.maxY = 7
            
            // Format y-axis, e.g. with units
            chart.yLabelsFormatter = { String(Int($1)) +  "ºC" }
        
        case 3:
            // Create a new series specifying x and y values
            let data = [(x: 0, y: 0), (x: 0.5, y: 3.1), (x: 1.2, y: 2), (x: 2.1, y: -4.2), (x: 2.6, y: 1.1)]
            let series = ChartSeries(data: data)
            chart.add(series)
            
        default: break;
            
        }

        chart.lineWidth = 5
        chart.showXLabelsAndGrid = false
        chart.showYLabelsAndGrid = false
    }
    
    // Chart delegate
    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Double, left: CGFloat) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)

        var rect = chart.maskLayer.frame
        rect.size.width = chart.frame.width - left
        rect.origin.x = left
        chart.maskLayer.frame = rect

        CATransaction.commit()
    }
    
    func didFinishTouchingChart(_ chart: Chart) {

    }
    
    func didEndTouchingChart(_ chart: Chart) {

    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        super.viewWillTransition(to: size, with: coordinator)
        
        // Redraw chart on rotation
        chart.setNeedsDisplay()
        
    }
    
}
