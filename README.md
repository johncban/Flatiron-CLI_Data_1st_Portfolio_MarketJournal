# Newsjournal

This project is the first Flatiron School Ruby Project, utilizing CLI and gem bundle that scrapes news articles then open's the web browser to let you open the specific article you wanted to read.

## Directory Tree
```
newsjournal
.
├── CODE_OF_CONDUCT.md
├── Gemfile
├── Gemfile.lock
├── LICENSE.txt
├── README.md
├── Rakefile
├── bin
│   ├── console
│   ├── newsjournal
│   └── setup
├── lib
│   ├── newsjournal
│   │   ├── cli.rb
│   │   ├── newsarticle.rb
│   │   ├── newsgreet.rb
│   │   ├── newsscraper.rb
│   │   └── version.rb
│   └── newsjournal.rb
├── newsjournal.gemspec
└── spec
    ├── newsjournal_spec.rb
    └── spec_helper.rb
```

# Getting Started

## Prerequisites

You're Mac or PC require's [Ruby](https://www.ruby-lang.org/en/) in order to run this gem or repo.


## Installation

#### Installing Ruby on PC
To install Ruby on PC, follow this [video instructions](https://www.youtube.com/watch?v=OzijLscV3BQ).
Here's the [Ruby Installer](https://rubyinstaller.org/) for Windows(7, 8 and 10).

NOTE: Windows 7 will [NO LONGER be supported](https://www.youtube.com/watch?v=YqhReSMb4wo) in late 2019 (or as early as 2020).

#### Installing Ruby on Mac or Linux
Installing ruby on Mac or Linux is quite easy than PC and here are the following YouTube steps:

1. [Mac or OSX](https://www.youtube.com/watch?v=IXyPLDJDxcM)
2. [Linux or Ubuntu](https://www.youtube.com/watch?v=Fm5wz74JKmo)

#### Git clone the repo
I recommend using git instead of gem as this app or project is not yet publish for gem use.

To clone this repo, just click Clone or Download this repo as Zip; otherwise if you're system have a git app installed ([Windows Steps](https://help.github.com/en/desktop/getting-started-with-github-desktop/installing-github-desktop) - [OSX Steps](https://help.github.com/en/desktop/getting-started-with-github-desktop/installing-github-desktop)) do the following in your terminal or command line:

```$ git clone https://github.com/johncban/newsjournal.git```

And then execute the following command in the repo root folder to install the necessary gems:

    $ bundle


## Running the Project

Make sure you're in the root folder of the clone repo, inside the repo run the following command:
```
    ./bin/newsjournal
```


## Built With
1. [Awesome Print](https://rubygems.org/gems/awesome_print/versions/1.8.0)
2. [Colorize](https://rubygems.org/gems/colorize)
3. [HttParty](https://rubygems.org/gems/httparty)
4. [Launchy](https://rubygems.org/gems/launchy)
5. [Nokogiri](https://rubygems.org/gems/nokogiri)


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/newsjournal. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Newsjournal project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/newsjournal/blob/master/CODE_OF_CONDUCT.md).
