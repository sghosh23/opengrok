class OpengrokPagesController < ApplicationController
  before_filter :authenticate_user!
  
  def index
     @params_jbp_prod = []
     @params_jb_prod = []
     @params_jbp_main = []
     @params_main = []
     @params_jbmain_blueberry = []
     @params_jbmain_combination = []
     @params_main_strawberry = []
     @params_main_blueberry = []
     @params_main_islandpunch = []
     @params_main_combination = []
     @params_modem_prod = []
     @modem_main_blueberry = []
     @modem_main_combination = []
     @modem_main_IceMoCha = []
     @modem_main_maple = []
     @modem_main_sangria = []
     @params_main_maple = []

     @params_kk_prod =[]
     @params_kk_strawberry =[]
     @params_kk_blueberry =[]
     @params_kk_combinations =[]
     @params_kk_cinnamon=[]

    # changed directory root path  
    Dir.chdir("/home/sbrc/sukanta/opengrok") 

    Dir.glob("**/*.txt") do |file|
    
      data = IO.readlines(file)
      @params_jb_prod << [data[1], data[4]].join('@') if data[0] == "JB PROD\n" 
      @params_jbp_prod << [data[1], data[4]].join('@') if data[0] == "JBP PROD\n" 
      @params_jbp_main << [data[1], data[4]].join('@') if  data[0] == "JBP sukanta\n"
      @params_jbmain_blueberry << [data[1], data[4]].join('@') if  data[0] == "JB MAIN@BLUEBERRY\n" 
      @params_jbmain_combination << [data[1], data[4]].join('@') if  data[0] == "JB MAIN@COMBINATION\n" 
      @params_main_strawberry << [data[1], data[4]].join('@') if  data[0] == "JBP MAIN@Strawberry\n"
      @params_main_blueberry << [data[1], data[4]].join('@') if  data[0] == "JBP MAIN@Blueberry\n"
      @params_modem_prod << [data[1], data[4]].join('@') if data[0] == "MODEM PROD\n"
      @modem_main_blueberry << [data[1], data[4]].join('@') if data[0] == "MODEM MAIN BLUEBERRY\n"
      @modem_main_combination << [data[1], data[4]].join('@') if data[0] == "MODEM MAIN COMBINATION\n"
      @modem_main_IceMoCha << [data[1], data[4]].join('@') if data[0] == "MODEM MAIN ICEMOCHA\n"
      @modem_main_maple << [data[1], data[4]].join('@') if data[0] == "MODEM MAIN MAPLE\n"
      @modem_main_sangria << [data[1], data[4]].join('@') if data[0] == "MODEM MAIN SANGIRA\n"
      @params_main_maple << [data[1], data[4]].join('@') if  data[0] == "JBP MAIN MAPLE\n"
       # for kitkat
      @params_kk_prod << [data[1], data[4]].join('@') if data[0] == "Kit-Kat PROD\n"
      @params_kk_strawberry << [data[1], data[4]].join('@') if data[0] == "Kit-Kat MAIN STRAWBERRY\n"
      @params_kk_blueberry << [data[1], data[4]].join('@') if data[0] == "Kit-Kat MAIN BLUEBERRY\n"
      #@params_kk_combinations = [data[1], data[4]].join('@') if data[0] == "Kit-Kat MAIN COMBINATION\n"
      @params_kk_cinnamon << [data[1], data[4]].join('@') if data[0] == "Kit-Kat MAIN CINNAMON\n"
      @params_kk_combinations << [data[1], data[4]].join('@') if data[0] == "Kit-Kat MAIN COMBINATION\n"
 
     @token = (Digest::MD5.hexdigest "#{ActiveSupport::SecureRandom.hex(10)}-#{DateTime.now.to_s}")

     RestApi.create session_id: @token, link: ""
  end 
 end 
  

  def load
    @test = []
    @params = []
    @jb_mains = []
    @jbp_mains = []
    @jb_prods = []
    @kk_mains = []
    @kk_prods = []

  Dir.chdir("/home/sbrc/sukanta/opengrok")
   @files = []
   
   @files = Dir.glob('**/OpenGrok_info.txt').select {|f| File.file? f}

   Dir.glob('**/OpenGrok_info.txt') do |file|
    status = IO.readlines(file)
    
    @jb_mains << [status[0], status[1],File.mtime(file).strftime("%B %d, %Y")].join('@') if status[0] == "JB MAIN@BLUEBERRY\n" || status[0] == "JB MAIN@COMBINATION\n" 
    @jb_prods << [status[0], status[1],File.mtime(file)].join('@') if status[0] == "JB PROD\n"
    @jbp_mains << [status[0], status[1],File.mtime(file).strftime("%B %d, %Y")].join('@') if status[0] == "JBP MAIN@Strawberry\n" || status[0] == "JBP MAIN@Blueberry\n" || status[0] == "JBP MAIN MAPLE\n"
    
    @kk_prods << [status[4], status[1],File.mtime(file)].join('@') if status[0] == "Kit-Kat PROD\n"
    @kk_mains << [status[4], status[1],File.mtime(file)].join('@') if status[0] == "Kit-Kat MAIN STRAWBERRY\n" || status[0] == "Kit-Kat MAIN BLUEBERRY\n" || status[0] == "Kit-Kat MAIN COMBINATION\n" || status[0] == "Kit-Kat MAIN CINNAMON\n"
    #@kk_prods << status[4], status[1], File.mtime(file)].join('@') if status[0] == "KITKAT PROD\n"
    #@kk_mains << status[4], status[1],File.mtime(file)].join('@') if status[0] == "KITKAT MAIN STRAWBERRY\n" || status[0] == "KITKAT MAIN BLUEBERRY\n" || status[0] == "KITKAT MAIN COMBINATION\n" || status[0] == "KITKAT MAIN CINNAMON\n"
    #@dirs = []
    #Dir.glob("**") do |names|


    #@dirs << names unless names == "opengrok" 


   end
  end
  def test
    ###code will run here
  end
    

  
end
