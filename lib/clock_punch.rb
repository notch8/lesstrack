require 'rubygems'
require 'activeresource'

class ClockPunch < ActiveResource::Base
  self.site = "https://lesstimespent.com"
  self.user = "notch8"
  self.password = "132311"

end
