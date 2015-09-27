#require "pogoplug_api/version"
require "PogoPlug"
require './Hikisu'

module PogoplugApi


	# Your code goes here...
  client = PogoPlug::Client.new
  client.login(Hikisu::Mail_address,Hikisu::PW)

  devices = client.devices

#  puts client.files
  puts devices.first.id
  puts devices.first.services.first.id
  fileListing = client.files(devices.first.id, devices.first.services.first.id)
  
  #puts fileListing.files.class
  #array = {}
  
  array = fileListing.files

puts array.first  


parent_directory = client.files(devices.first.id, devices.first.services.first.id).files.select { |file| file.directory? }.first
file_to_create = PogoPlug::File.new(name: 'testpogo2.txt', type: PogoPlug::File::Type::FILE, parent_id: parent_directory.id)
puts parent_directory.id
puts file_to_create


uploaded_file = client.create_file(devices.first.id, devices.first.services.first, file_to_create, File.open('testpogo.txt', 'r'))


puts uploaded_file

#downloaded_file = client.download(devices.first.id, devices.first.services.first, uploaded_file)

#puts downloaded_file

#downloaded_file = client.download(devices.first.id, devices.first.services.first, uploaded_file)

#puts downloaded_file
# array.each{ |acc | 
 
#	 puts.acc
# }

   
end
