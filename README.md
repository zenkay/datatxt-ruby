# [![Ruby Gem Icon](https://raw.githubusercontent.com/zenkay/datatxt-ruby/master/rubygem.png)](https://rubygems.org/gems/datatxt) dataTXT Ruby Gem

[![Code Climate](https://codeclimate.com/github/zenkay/datatxt-ruby/badges/gpa.svg)](https://codeclimate.com/github/zenkay/datatxt-ruby) [![Travis CI](https://travis-ci.org/zenkay/datatxt-ruby.svg?branch=master)](https://travis-ci.org/zenkay/datatxt-ruby) [![Gem Version](https://badge.fury.io/rb/datatxt.svg)](http://badge.fury.io/rb/datatxt) [![Coverage Status](https://coveralls.io/repos/zenkay/datatxt-ruby/badge.png?branch=master)](https://coveralls.io/r/zenkay/datatxt-ruby?branch=master)

## Installation

Add this line to your application's Gemfile:

```
gem 'datatxt'
```

And then execute:

```
$ bundle install
```
## Setup

Setup configuration parameters

```
Datatxt.configure do |c|
  c.app_id = "your-app-id-for-datatxt-account"
  c.app_key = "your-app-key-for-datatxt-account"
  c.endpoint = https://api.dandelion.eu/"
end
```

## Usage

_Methods references are taken from [dataTXT documentation](https://dandelion.eu/docs/)._

**dataTXT-NEX**: is a named entity extraction & linking API that performs very well even on short texts, on which many other similar services do not. dataTXT-NEX currently works on English, French, German, Italian and Portuguese texts. With this API you will be able to automatically tag your texts, extracting Wikipedia entities and enriching your data.

```
element = Datatxt::Nex.new
response = element.analyze(text: "This is a test")
```

**dataTXT-SIM**: is a semantic sentence similarity API optimized on short sentences. With this API you will be able to compare two sentences and get a score of their semantic similarity. It works even if the two sentences don't have any word in common.

```
element = Datatxt::Sim.new
response = element.analyze(text1: "This is a test", text2: "This is another test")
```

**dataTXT-LI**: is a simple language identification API; it is a tool that may be useful when dealing with texts, so we decided to open it to all our users. It currently supports more than 50 languages.

```
element = Datatxt::Li.new
response = element.analyze(text: "Questo è un test")
```
