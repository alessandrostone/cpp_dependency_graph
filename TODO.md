# TODO Items

- [ ] Documentation
  - [ ] Screencast of how to use tool on projects
  - [ ] Create a github.io homepage
  - [ ] Add interactive `html` or `svg` examples to homepage
  - [ ] Add a [CONTRIBUTING.md](https://github.com/nayafia/contributing-template/blob/master/CONTRIBUTING-template.md)
  - [ ] Ruby gem docs
  - [ ] Add example visualisations for "good" vs "bad" architectures
- [ ] Progress messages
  - [ ] Progress bar?
- [x] Allow user to specify a single component and the tool should print only that component
- [x] Print out dependency graphs for all components by default if no single component is specified
- [ ] Use a compiler to get the includes for a file rather than manually scanning the contents
  - [ ] Command to generate overall file/class dependency graph if a project doesn't have many components
  - [ ] Command to generate individual file/class dependency graph
  - [ ] Manual scanning does not work when #includes are #ifdef'ed out for example
  - [ ] <system> include vs "project" include (how will this work for third party sources that are not part of the codebase?)
  - [ ] Work with any type of include relative includes ('blah.h') vs absolute includes ('/path/blah.h') vs relative with path includes ('blah/blah.h')
  - [ ] Look at https://github.com/Sarcasm/compdb to see if it can generate dependencies
- [ ] Parallelise dependency scanning as much as possible to get the best possible performance
  - [ ] Use a threadpool? Look at reference implementations
- [ ] Open up the graph automatically after generating an individual graph
- [ ] Work with any sort of project structure
  - [ ] Header only projects
  - [x] source and header files for component in same directory
  - [ ] source files in same directory but header files in a separate `inc` directory
  - [x] source files in same directory but header files in a global `inc` directory (all project header files in one place)
  - [ ] source files and header files don't have matching names (i.e. there's an `api.h` header file and various source files implement them)
  - [ ] Try it out on various small/large C/C++ open source projects
- [ ] Provide coupling/cohesion metrics, lookup metrics from Clean Architecture and [this](https://softwareengineering.stackexchange.com/questions/151004/are-there-metrics-for-cohesion-and-coupling)
- [ ] Ignore list? Some components may not want to be seen
- [ ] Use a yaml config file? A pain to pass a whole heap of arguments every time
- [ ] Make the tool incremental? Only generate parts of the new graph if something has changed. Something to think about
- [ ] Handling `duplicate` component names? Use a unique identifier (perhaps the path?)
- [ ] Visualisation
  - [ ] Highlight strongly coupled components (i.e. have lots of outgoing/incoming dependencies). How to visualise strongly coupled components?
  - [ ] Interface vs implementation coupling (interface is worse!). Highlighting interface vs implementation coupling between components on graph?
  - [ ] Hierarchy diagram for components with no cycles? (https://bl.ocks.org/mbostock/4339184)
  - [ ] Pack diagram for just visualising components (https://bl.ocks.org/mbostock/ca5b03a33affa4160321)
  - [ ] Look at using subgraphs of the dot/svg language to cluster component dependencies in the graph
  - [ ] Create a d3 donut graph with relative sizes of components in project? This'll probably show which components need to be further split up (something like this https://blog.kathyreid.id.au/2016/12/29/linux-australia-expense-breakdown-a-data-visualisation-in-d3-js/)
  - [ ] Node size - base it on how many source files (or lines of code) or how many connections going in/out of node?
  - [ ] Provide a 'zoom' slider on the visualisation to zoom in/out of the view (high level dependencies to low-level dependencies)
  - [ ] Visualise components matching user provided regex only
  - [ ] 3D visualisation using something like https://github.com/ggeoffrey/cljs-gravity
