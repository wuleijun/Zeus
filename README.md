#Zeus

This project is used to learn Swift language.

## Intro

Zeus is designed for users to manage their clients and activities.The main goal is to try swift in a real project.

The project's architecture is easy to understand, following the common software pattern MVC, separating UI, business logic and data model. Now, let's dive into the Zeus project!

Welcome any suggestions!
## Model

Zeus uses [Realm](https://realm.io) to deal with data persistence. You can checkout the `Realm/Client.swift` file to learn how to add and query client Models.

## UI(View & ViewController)

Zeus use Storyboard to join different view controllers together. You can take a glance at the `Main.storyboard` file. Thanks to the **Storyboard References** feature, we break up storyboards into a set of smaller storyboards. Easy to maintain and handle `.storyboard` files under source control, right?

At the same time, you should notice that some views are `@IBDesignable`. You can use Interface Builder, drag the view out and observe changes.

## Network

Zeus has no any network service currently.

## License

MIT

