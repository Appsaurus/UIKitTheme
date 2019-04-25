//
//  DemoNavigationalTableViewController.swift
//  UIKitThemeDemo
//
//  Created by Brian Strobach on 4/24/19.
//  Copyright © 2019 Hyper Interaktiv AS. All rights reserved.
//

import Layman
import Swiftest
import UIKitTheme
import UIKitBase

open class DemoNavigationalTableViewController: NavigationalMenuTableViewController {
    open override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "UIThemeKit"
        addRow(title: "Color Scheme", createDestinationVC: ColorSchemeDemoViewController())
        addRow(title: "Typography Guide", createDestinationVC: TypographyGuideDemoViewController())
        addRow(title: "Text Style Guide", createDestinationVC: TextStyleGuideDemoViewController())
        addRow(title: "View Style Guide", createDestinationVC: ViewStyleGuideDemoViewController())
        addRow(title: "Shadow Style Guide", createDestinationVC: ShadowStyleGuideDemoViewController())
    }
}

public class ColorSchemeDemoViewController: BaseTableViewController {

}

class TextStyleShowcaseCell: SimpleHorizontalStackTableViewCell {
    public var fontDemoLabel = UILabel()
    public var fontDetailLabel = UILabel()

    override func style() {
        super.style()
        fontDetailLabel.apply(textStyle: .caption1(color: .textMediumLight))
    }
    override func initProperties() {
        super.initProperties()
        mainLayoutViewInsets = .constant(25)
        fontDetailLabel.wrapWords()
    }

    override func createSubviews() {
        super.createSubviews()
        stackView.addArrangedSubviews([fontDemoLabel, fontDetailLabel])
    }
}

public class TextStyleShowcaseViewController: BaseTableViewController {

    public func style(_ size: CGFloat) -> TextStyle {
        return TextStyle(color: .textDefault, font: UIFont.systemFont(ofSize: size))
    }
    public func style(_ font: UIFont) -> TextStyle {
        return TextStyle(color: .textDefault, font: font)
    }

    public func registerReusables() {
        self.tableView.register(TextStyleShowcaseCell.self)
    }

    public var styles: [(label: String, style: TextStyle)] = []

    public override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }

    public override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return styles.count
    }

    public override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: TextStyleShowcaseCell = tableView.dequeueReusableCell(indexPath)
        let model = styles[indexPath.row]
        cell.fontDemoLabel.apply(textStyle: model.style)
        cell.fontDemoLabel.text = model.label
        cell.fontDetailLabel.textAlignment = .right
        cell.fontDetailLabel.text = self.description(forItemAt: indexPath)
        return cell
    }

    public func description(forItemAt indexPath: IndexPath) -> String?{
        return nil
    }
}
public class TypographyGuideDemoViewController: NavigationalMenuTableViewController {

    public override func initProperties() {
        super.initProperties()
        tableView.automaticallySizeCellHeights(100)

    }
    public override func viewDidLoad() {
        super.viewDidLoad()
        let style = currentStyle
        addRow(title: "Font Sizing Guide", createDestinationVC: FontSizingGuideDemoViewController())
        addRow(title: "Primary Fonts", createDestinationVC: FontGuideDemoViewController(style.displayFont))
        addRow(title: "Secondary Fonts", createDestinationVC: FontGuideDemoViewController(style.font))
        addRow(title: "Dynamic UIFont.TextStyle", createDestinationVC: DynamicUIFontTextStyleDemoViewController())
    }

    class FontSizingGuideDemoViewController: TextStyleShowcaseViewController {
        override func initProperties() {
            super.initProperties()

            styles = [
                ("barButton", style(.barButton)),
                ("button", style(.button)),
                ("label", style(.label)),
                ("navigation", style(.navigationBarTitle)),
                ("smallSystem", style(.smallSystem)),
                ("system", style(.system)),
                ("icon", style(.icon))
            ]
        }

        public override func description(forItemAt indexPath: IndexPath) -> String?{
            let style = styles[indexPath.row].style
            let font = style.font
            let desc = "\(font.familyName), \(font.fontName) - \(font.pointSize)pt \(style.color.toHex())"
            print("DESC: \(desc)")
            return desc
        }
    }

    class FontGuideDemoViewController: TextStyleShowcaseViewController {
        public let guide: FontGuide
        public required init(_ guide: FontGuide){
            self.guide = guide
            super.init()
        }

        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }

        override func initProperties() {
            super.initProperties()
            styles = [
                ("ultraLightName", style(guide.ultraLight())),
                ("thinName", style(guide.thin())),
                ("lightName", style(guide.light())),
                ("regularName", style(guide.regular())),
                ("mediumName", style(guide.medium())),
                ("semiboldName", style(guide.semibold())),
                ("boldName", style(guide.bold())),
                ("heavyName", style(guide.heavy())),
                ("blackName", style(guide.black())),
                // Dynamic Types
                ("largeTitle", style(guide.largeTitle())),
                ("title1", style(guide.title1())),
                ("title2", style(guide.title2())),
                ("title3", style(guide.title3())),
                ("headline", style(guide.headline())),
                ("body", style(guide.body())),
                ("callout", style(guide.callout())),
                ("subheadline", style(guide.subheadline())),
                ("footnote", style(guide.footnote())),
                ("caption1", style(guide.caption1())),
                ("caption2", style(guide.caption2()))

            ]
        }

        public override func description(forItemAt indexPath: IndexPath) -> String?{
            let style = styles[indexPath.row].style
            let font = style.font
            let desc = "\(font.familyName)\n\(font.fontName)\n\(font.pointSize)pt\n\(style.color.toHex())"
            return desc
        }
    }

    class DynamicUIFontTextStyleDemoViewController: TextStyleShowcaseViewController {
        override func initProperties() {
            super.initProperties()
            styles = [

            ]
        }
    }
}
public class TextStyleGuideDemoViewController: BaseTableViewController {

}
public class ViewStyleGuideDemoViewController: BaseTableViewController {

}
public class ShadowStyleGuideDemoViewController: BaseTableViewController {

}
