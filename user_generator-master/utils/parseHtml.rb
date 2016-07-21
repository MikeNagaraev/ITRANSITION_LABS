require 'pry'
require 'nokogiri'
require 'csv'

ENCODING =  'UTF-8'# 'WINDOWS-1251' #
html = Nokogiri::HTML(open("BY.html"), nil, ENCODING)

AREA = {
	'210' => "Витебская область",
	'211' => "Витебская область",
	'212' => "Могилевская область",
	'213' => "Могилевская область",
	'220' => "Минская область",
	'221' => "Минская область",
	'222' => "Минская область",
	'223' => "Минская область",
	'224' => "Брестская область",
	'225' => "Брестская область",
	'230' => "Гродненская область",
	'231' => "Гродненская область",
	'246' => "Гомельская область",
	'247' => "Гомельская область"
}

@data = Hash[*html.css('td').to_a.map{|i| i.text}.select{|i| i != ""}].map{|i| i += [hash[i[1][0..2]]]}
CSV.open("BY.csv", "wb") {|csv| @data.to_a.each {|elem| csv << elem} }