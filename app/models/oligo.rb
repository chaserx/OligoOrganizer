class Oligo < ActiveRecord::Base
  require 'bio'
  
  belongs_to :user
  
  validates_presence_of :name, :sequence
  
  validates_format_of :sequence, :with => /\D\S/
  
  before_save :calculate_sequence_info 
  before_update :calculate_sequence_info
  
  private
  def calculate_sequence_info
    my_sequence = Bio::Sequence.auto(self.sequence)
    self.sequence = self.sequence.downcase
    self.gcpercentage = my_sequence.gc_percent
    self.length = my_sequence.size.to_i
    
    
    #need Tm calculation here
    #Salt adjusted calculation
    #Tm =  81.5°C  +  16.6°C  x  (log10[Na+] + [K+])  +  0.41°C  x  (%GC)  –  675/N
    
    #self.tm = 81.5 + 16.6 * Math.log10(0.05) + 0.41 * my_sequence.gc_percent - 675/my_sequence.size.to_i
    
    #Other calculation for primers longer than 13bp from biophp.org
    #Tm= 64.9 +41*(yG+zC-16.4)/(wA+xT+yG+zC)
    #assumes 50 nM primer, 50 mM Na+, and pH 7.0.
    
    self.tm = 64.9 + 41 * (((my_sequence.size.to_i * (my_sequence.gc_percent.to_f/100))-16.4)/my_sequence.size.to_i)
    
  end
end
