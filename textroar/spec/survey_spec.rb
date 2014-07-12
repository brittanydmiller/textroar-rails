require 'spec_helper'

describe Survey do 
  it 'is valid with a title, description, start, end, poll_key, and phone'
  it 'is invalid without a title'
  it 'is invalid without a start'
  it 'is invalid without an end'
  it 'is invalid without a poll key'
  it 'is invalid with a duplicate poll key'
  it 'is invalid without a phone number'
end