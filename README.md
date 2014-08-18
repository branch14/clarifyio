# Clarifyio

A ruby wrapper and CLI for the Clarify API.

* http://clarify.io/

## Installation

Add this line to your application's Gemfile:

    gem 'clarifyio'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install clarifyio

## Setup

Store you bearer token in your home directory

    echo 'token: <your-token-here>' > ~/.clarifyio
    
## Usage

### Commandline

    # create a new bundle and include the given media file
    clarifyio index <url-to-media-file>

    # list all bundles and their tracks' status
    clarifyio tree

    # search, for now the results a displayed in yaml
    clarifyio search <query>

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

