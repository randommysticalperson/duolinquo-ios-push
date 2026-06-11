# Duolinquo iOS Push

This project is a tiny iOS wrapper that politely convinces a web app to live inside an iPhone. Think of it as a pocket-sized browser wearing a fake mustache and insisting it has always been a native app.

The original project called itself a bacteriophage for HTML. This fork keeps that charmingly suspicious science-fiction energy, but aims for a friendlier mission: **wrap your website, ship your app, and try not to summon the App Store review goblin**.

Here is the classic architecture diagram, because every serious project deserves at least one diagram that looks like it escaped from biology class.

![architecture](https://user-images.githubusercontent.com/208884/66493299-ce0bb580-ea83-11e9-9489-d394b0622bbf.png)

## Application types

There are two flavors of web app you can sneak into this wrapper. Both are valid; one just depends on the internet, and the other brings snacks from home.

| Type | What it does | Vibe check |
| --- | --- | --- |
| Hosted website | Loads a URL from the real, chaotic internet. | Great when your app lives on a server and enjoys Wi-Fi. |
| Static / local website | Loads bundled files from inside the app. | Great when your app wants to be self-sufficient and mysterious. |

## Instructions

Regardless of which route you choose, start with these common steps. They are not glamorous, but neither is debugging a blank white screen at midnight.

1. Fork or clone this repository.
2. Update `AppIcon.appiconset` with your app icon, because the default icon is not legally required to have personality.
3. If this is not a [BIFFUD](https://biffud.com) project, update `BIF Logo.imageset` with your own loading art, mascot, logo, or tasteful rectangle of destiny.

Instructions shift slightly from here, like a raccoon discovering a second trash can.

### Pathway A: Static site

To create an iOS application that renders a static or local web application, do the following:

1. Replace the content of `iOSVirus/Website` with your website's assets.
2. Make sure `index.html` exists. It is the front door; without it, the app stands outside looking confused.
3. Build and publish.

> **Note:** `index.html` is the entry point. Treat it kindly. It has seen things.

### Pathway B: Hosted site

To create an iOS application that renders a hosted website, do the following:

1. Update `iOSVirus/Views/WebViewController.swift` by commenting the local-file lines that load `index.html`.
2. In that same file, uncomment the remote URL lines.
3. Update `appUrl` to the URL you want to host. Choose wisely; your app will follow it with the loyalty of a golden retriever and the caching behavior of a tiny browser.

## Built-in comic relief

The error screen now offers a gentler, sillier failure message for the inevitable moment when the internet trips over its own shoelaces. The Swift comments were also lightly seasoned with jokes, but no app behavior was changed.

| Area | Humor added | Behavior changed? |
| --- | --- | --- |
| README | Friendlier setup language and playful metaphors. | No. |
| Error screen | More whimsical failure and retry copy. | No. |
| Swift comments | Clearer comments with mild jokes. | No. |

## Other Notes

If you use this project, please consider giving a shout out to Bad Idea Factory. Also consider giving yourself a shout out, because shipping apps is basically wizardry with provisioning profiles.
