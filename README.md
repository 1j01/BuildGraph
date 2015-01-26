
*This readme represents an optimistic future for this project.*

# BuildGraph

**Grunt** is confusing and overcomplicated. Seriously.

**Gulp** has a nice piped structure and clean code, but... the accepted way to do watching... you create a seperate task (for each task you want to allow watching for) and manually specify the set of files that will trigger the task, and when any of these files change the task recompiles and rebuilds EVERYTHING. (WHICH IS SLOW.)

Same goes for cleanup. Make a task and manually tell it everything it needs to clean up.

Also, you can't use coffee. (no Gulpfile.coffee, only Gulpfile.js)

**BuildGraph** takes Gulp's piped structure, removes the need for code, and watches files automatically, cascading changes down the build tree with minimal computation.

**Anvil** (which I've never used) will also watch your source directory for changes and incrementally rebuild changed files (and any affected files).

Other build tools have CLIs; buildgraph has a CLUI that can be run in CLUI (hey tir, about this terminology?) and a standalone application.
It's a visual build tool. It looks really nice. It has physics.

### Cleanup

Gulp and grunt require manual cleanup modules. Or you can use convoluted `fs` code. Or you can just clean up yourself.

BuildGraph can clean up for itself. It has a button.

BuildGraph of course has support for multiple tasks, represented as tabs.

# Tasks

Every build system that I know of (Grunt, Gulp, Cake) has support for multiple tasks.

In BuildGraph, they're nicely represented as tabs.

### Console

BuildGraph also has a "console" where you can build a temporary graph/task/command to be executed. (with command history)

(This gives actual purpose to a js->coffee block!)

You can save commands as tasks

### Smarts

BuildGraph can infer most actions from a source and destination.

For example, `app/*.coffee -> build/*.js` means compile coffee from app/ to build/
whereas `app/*.coffee -> build/*` means just copy the coffee to build.

# # #
What about my super special code?

BuildGraph has `run` blocks.

### Blocks

Shouldn't this section be like, almost at the top or something? It's kind of important.

Nah, let's just leave it out instead.
