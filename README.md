# Assets

A repo containing assets such as images and gifs used in my GitHub project's README files.

I'm storing non-code assets here because assets increase the Git repo size and are not easily removable from Git history. This means that clone sizes are permanently inflated; this grows quickly if ever an image is swapped out or removed, it remains in the history. By storing assets separately, we can easily swap the files whenever we want and keep Git repo sizes smaller.

## Usage

Simply add assets to a folder under `src` named the same as the repo to which they belong and then reference them with a link such as:

```
https://raw.githubusercontent.com/justintime50/assets/main/src/repo-name/showcase.png
```

## Development

**Assets**

It's important to optimize assets for the web. This will help load times as well as keep sizes small. Here are a few things to keep in mind:

1. When possible, images should be `png` to support transparency. This will make them load well on a README
1. Images should pop and have a nice color-palette. This is especially true now that GitHub supports light and dark themes. Dark icons will not show up well on the GitHub dark theme
1. Showcase images that appear on README files should have `20-30 pixels of padding` around the image and the canvas size should traditionally not exceed `256x256` pixels

**BFG Repo Cleaner**

During the process of switching assets over from being housed in a repo to being housed here, use the [BFG Repo Cleaner](https://docs.github.com/en/github/authenticating-to-github/keeping-your-account-and-data-secure/removing-sensitive-data-from-a-repository) tool to clean up Git history and reduce the sizes of repos (effectively clearing these assets from the repos history. Take care to do this properly as changing git history can be dangerous.)

## Attribution

* Icons made by <a href="https://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Icons made by <a href="https://www.flaticon.com/free-icon/chemist_2646063?term=chemist&related_id=2646063" title="ultimatearm">ultimatearm</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Icons made by <a href="https://www.flaticon.com/authors/becris" title="Becris">Becris</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
* Icons made by <a href="" title="srip">srip</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Icons made by <a href="" title="xnimrodx">xnimrodx</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Icons made by <a href="https://www.flaticon.com/authors/pixel-perfect" title="Pixel perfect">Pixel perfect</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Icons made by <a href="https://www.flaticon.com/authors/smashicons" title="Smashicons">Smashicons</a> from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a>
* Docker logo used without modification
* Golang logo used without modification
* Laravel logo used without modification
* Python logo used without modification
