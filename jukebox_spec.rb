require 'simplecov'
SimpleCov.start
require 'json'
require 'rspec'
 
require_relative 'jukebox'
require_relative 'song'
 
describe Song do
  it 'can have a name' do
  Song.new("song name").name.should eq  ("song name")
  end

end
 
describe Jukebox do

songs_array = [
 "The Phoenix - 1901",
 "Tokyo Police Club - Wait Up",
 "Sufjan Stevens - Too Much",
 "The Naked and the Famous - Young Blood",
 "(Far From) Home - Tiga",
 "The Cults - Abducted",
 "The Phoenix - Consolation Prizes"
].map {|string| Song.new(string)}
  
  before :each do
    @jukebox = Jukebox.new(songs_array)
  end

  it 'should be able to have songs added.' do
  Jukebox.new("song").songs.should eq ("song")
  end

  it 'should default to on.' do # not working
    @jukebox.on?.should eq (true)
  end

  it 'should have a help menu' do
    @jukebox.command("help").should eq ("Please select help, list, exit, or play.")
  end

  it 'should play a requested song' do
    @jukebox.command("play abducted").should eq ("now playing abducted")
  end

  it 'should not accept random commands' do
    @jukebox.command("dance").should eq ("invalid command")
  end

  it 'should say goodbye when you type exit.' do
    @jukebox.command("exit").should eq ("Goodbye, thanks for listening!")
  end

  it 'should return a list of songs when list is input.' do
    @jukebox.command("list").should include ("Tokyo Police Club - Wait Up")
  end

end