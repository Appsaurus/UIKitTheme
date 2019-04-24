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

public class TextStyleShowcaseViewController: BaseTableViewController {

    public func style(_ size: CGFloat) -> TextStyle {
        return TextStyle(color: .textDefault, font: UIFont.systemFont(ofSize: size))
    }
    public func style(_ font: UIFont) -> TextStyle {
        return TextStyle(color: .textDefault, font: font)
    }

    public func registerReusables() {
        self.tableView.register(UITableViewCell.self)
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
        let cell: UITableViewCell = tableView.dequeueReusableCell(indexPath)
        let model = styles[indexPath.row]
        cell.textLabel?.apply(textStyle: model.style)
        cell.textLabel?.text = model.label
        return cell
    }
}
public class TypographyGuideDemoViewController: NavigationalMenuTableViewController {


    public override func viewDidLoad() {
        super.viewDidLoad()
        let style = currentStyle
        addRow(title: "Font Sizing Guide", createDestinationVC: FontSizingGuideDemoViewController())
        addRow(title: "Primary Fonts", createDestinationVC: FontGuideDemoViewController(style.primaryFonts))
        addRow(title: "Secondary Fonts", createDestinationVC: FontGuideDemoViewController(style.secondaryFonts))
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
                ("blackName", style(guide.black()))
            ]
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
