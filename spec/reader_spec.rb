require_relative '../lib/jekyll-converter'
require 'stringio'


module ReaderSpec

  describe JekyllConverter::Reader do
    context "reading in file" do
      let(:io_obj) { StringIO.new(<<-eof.gsub(/^[ \t]+/, "")) }
--- 
layout: post
title: Don Cherry's Performance of Masculinity
mt_id: 8
date: 2010-12-09 12:04:11 -05:00
categories:
  - culture
  - gender
---
Around the same time that [Don Cherry was making a mockery of democracy](http://torontoist.com/2010/12/don_cherrys_speech_to_council_transcribed.php "Transcript of Don Cherry's Speach") during Rob Ford's investiture at Toronto's City Hall, I read this great piece by [Matthew Cheney](http://mumpsimus.blogspot.com/ "Mumpsimus") at [Strange Horizons](http://www.strangehorizons.com/ "Strange Horizons") called the ["Failure of Masculinity"](http://www.strangehorizons.com/2010/20101011/cheney-c.shtml "Strange Horizons: Failure of Masculinity"). Then, the day after Don Cherry's infamous appearance in Toronto's City Hall, I came across  [this photo of Don Cherry, "Looking like a lady's handbag"](http://deadspin.com/5530094/don-cherry-looks-like-a-ladys-handbag "Don Cherry looks like a lady's handbag"), which prompted the following thoughts. Before continuing on, I strongly recommend that you take the time to read Cheney's piece. 
eof

      let(:reader) { JekyllConverter::Reader.new(io_obj) }

      it "reads the yaml from the top of the file" do
        reader.title.should match(/Don Cherry/)
        reader.tags.should == ['culture', 'gender']
      end
      
      it "reads the body from the rest of the file" do
        reader.body.should match(/I strongly recommend/)
        reader.body.should_not match(/layout: post/)
      end
    end
  end
end
