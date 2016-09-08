
*NOTE: This readme represents an optimistic future for this project, which is basically just an idea.*

# BuildGraph

**Grunt** is confusing and overcomplicated. Seriously.

**Gulp** has a nice piped structure and clean code, but you have to install and setup plugins to get incremental building, and to do watching at all you have to create a separate task for each task you want to allow watching for and manually specify the set of files that will trigger the task.

Same goes for cleanup. Make a task and manually tell it everything it needs to clean up.

**BuildGraph** takes Gulp's piped structure, watches files automatically, cascading changes down the build tree with minimal computation, and lets you define your build tasks without code (except where you need it).

(**[Anvil](https://github.com/anviljs/anvil.js/)** also claims incremental rebuilding of changed files and affected files.)

Other build tools have CLIs; BuildGraph can be run as a command-line GUI or a standalone application.

BuildGraph lets you define your tasks by typing out simple conversion commands.
You get autocomplete for files and folders, as well as common conversions.

Conversions get expanded to blocks as you type.
There are source blocks, conversion blocks (step blocks? pass blocks? build blocks? compiler blocks?), and destination blocks.

You create a node graph with connections between blocks.
Connections that transfer streams of files are wires, and connections that handle source maps are represented as doubled wires.

### Conversion

BuildGraph can infer most actions from a source and destination.

For example, `app/*.coffee -> build/*.js` means compile coffee from app/ to build/
whereas `app/*.coffee -> build/*` means just copy the files to build.

See [Conversions.MD](./Conversions.MD) for a list of possible conversions.

(Conversions are defined by plugins, of course.)

### Tasks

Every build system that I know of (Grunt, Gulp, Cake) has support for multiple tasks.

In BuildGraph, they're nicely represented as tabs.

### Cleanup

Gulp and grunt require manual cleanup modules. Or you can use convoluted `fs` code. Or you can just clean up yourself.

BuildGraph knows what files are originative or not and can clean up for itself at the click of a button.

### Console

BuildGraph also has a "console" where you can build a temporary graph/task/command to be executed. (with command history)

This is great for one-off transpilation like [js->coffee](http://js2.coffee) block!)

You can save commands as tasks.

### Custom Code

What about my super special code?

BuildGraph has Run Blocks.
Run Blocks can be standalone, but they can also be source blocks, destination blocks, or conversion blocks.

#### Say you want to match files based on rot13'd regexes

You'd return a list of files, and then pipe the run block into some other block(s).

#### Say you want to download the latest tarball of a project on [Launchpad](launchpad.net)

You'd make a run block to [scrape the webpage to find the tarball URL](https://github.com/1j01/elementary.css/blob/b6b7a08906af194556cd5a49f3e44da1c934fbaa/Cakefile#L37-L44)
and then just pipe that to a directory to download and extract it.
Okay actually that might just download it and place it in the folder.
Worse case senario you'd have to pipe it to a file first, but hopefully you can express that you want extraction easily.
It's a little tricky since a URL could return just about anything.
Maybe you'd have to start typing out "extract" to explicitly create an extraction block.
You'd need to be able to do that sort of thing for plugins that don't have source/destination clues, like "strip comments" etc.

### build-graph

**build-graph** is a cascading build system.

**BuildGraph** is a visual node-graph based cascading build system.

You include `build-graph` in your `scripts` to run it with `npm run build`, but you edit it with the nice GUI.

build-graph might actually be able to use gulp internally; it does have [plugins for incremental rebuilding](https://github.com/gulpjs/gulp#incremental-builds) and there's [gulp-watch](https://www.npmjs.com/package/gulp-watch) (I don't know if that's redundant or what)
