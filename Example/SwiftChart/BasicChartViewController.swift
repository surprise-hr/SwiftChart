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
        super.viewDidLoad()

        let minValue: Double = 50
        let maxValue: Double = 100

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
            let metadata = ["Dec 1, 2021", "Dec 2, 2021", "Dec 3, 2021", "Dec 4, 2021", "Dec 5, 2021", "Dec 6, 2021"]

            let series1 = ChartSeries([55, 81, 59, 86, 67, 95])
            series1.color = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.8980392157, alpha: 1)
            series1.highlightColor = #colorLiteral(red: 1, green: 0.3529411765, blue: 0.7647058824, alpha: 1)

            let series2 = ChartSeries([63, 58, 79, 64, 78, 91])
            series2.color = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.8666666667, alpha: 1)
            series2.highlightColor = #colorLiteral(red: 1, green: 0.7843137255, blue: 0.1764705882, alpha: 1)

            let series3 = ChartSeries([67, 91, 85, 77, 98, 55])
            series3.color = #colorLiteral(red: 1, green: 0.8784313725, blue: 0.8980392157, alpha: 1)
            series3.highlightColor = #colorLiteral(red: 1, green: 0.2352941176, blue: 0.3529411765, alpha: 1)

            let series4 = ChartSeries([62, 66, 80, 90, 86, 92])
            series4.color = #colorLiteral(red: 0.9921568627, green: 0.9176470588, blue: 0.8509803922, alpha: 1)
            series4.highlightColor = #colorLiteral(red: 0.9568627451, green: 0.4941176471, blue: 0.06666666667, alpha: 1)

            let series5 = ChartSeries([71, 75, 69, 89, 93, 97])
            series5.color = #colorLiteral(red: 0.937254902, green: 0.8901960784, blue: 0.9803921569, alpha: 1)
            series5.highlightColor = #colorLiteral(red: 0.6078431373, green: 0.3176470588, blue: 0.8784313725, alpha: 1)

            let series6Data: [Double] = [59, 69, 64, 81, 86, 79]
            let series6 = ChartSeries(series6Data)
            series6.color = #colorLiteral(red: 0.8509803922, green: 0.9176470588, blue: 0.9960784314, alpha: 1)
            series6.highlightColor = #colorLiteral(red: 0.07843137255, green: 0.4901960784, blue: 0.9803921569, alpha: 1)

            chart.add([series1, series2, series3, series4, series5, series6])
            chart.seriesMetadata = metadata
            chart.minY = minValue
            chart.maxY = maxValue
            chart.applyStyle()
            
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


        addSwitchButton()
    }

    func addSwitchButton() {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(switchChart), for: .touchUpInside)
        button.setTitle("Switch Chart", for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(button)
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.topAnchor.constraint(equalTo: chart.bottomAnchor, constant: 30)
        ])
    }

    @objc func switchChart() {
        if chart.highlightedChartIndex == chart.series.count - 1 {
            chart.highlightedChartIndex = 0
        } else {
            chart.highlightedChartIndex! += 1
        }
    }

    // Chart delegate
    
    func didTouchChart(_ chart: Chart, indexes: Array<Int?>, x: Double, left: CGFloat) {

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
