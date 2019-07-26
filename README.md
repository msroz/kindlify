# 📚 kindlify

CLI for Send to Kindle

## Installation

### homebrew

```console
$ brew tap msroz/wax/kindlify
$ brew intall msroz/wax/kindlify
```

### git clone

```
$ git clone git@github.com:msroz/kindlify.git
$ cd kindlify
$ make install
```

## Usage

```console
$ kindlify --file want-to-send-to-kindle.pdf
```

for more details as:

```console
$ kindlify --help

  📚 CLI for Send-to-Kindle 📚

  Usage:

    kindlify [options]

  Options:

    -c CONFIG_FILE, --config=CONFIG_FILE
                                     Configuration file path. [type:String] [default:"$HOME/.config/kindlify.yml"]
    -f FILE, --file=FILE             File to be sent to kindle. [type:String]
    --help                           Show this help.
    -v, --version                    Show version.
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://github.com/your-github-user/kindlify/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [msroz](https://github.com/your-github-user) - creator and maintainer
