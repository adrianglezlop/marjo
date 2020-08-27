class PolizaPdf < Prawn::Document
  def initialize(credit)
    super(:margin => [0,0,0,0])
    @credit = credit 
    text_content
  end
  def text_content
    rectangle [50,750], 500, 250
    des = 0
    draw_text  "FUNDACIÓN VALOR A.C.",:size=>9, :at => [70,720+des]
    draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [70,710+des]
    draw_text  "COYOACÁN, CDMX C.P. 04100",:size=>9, :at => [70,700+des]
    draw_text  "#{Conf.last.RFC}",:size=>9, :at => [70,690+des]
    draw_text  "FUNDACIÓN: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680+des]
    
    draw_text  "Original ", :at => [460,730+des]
    draw_text  "FECHA ",:size=>9, :at => [460,710+des]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703+des]
    
    draw_text  "#{@credit.nombre_completo_deudor}", :at => [70,650+des]
    draw_text  "#{ Dinero.to_money(@credit.monto_solicitud) }", :at => [430,650+des]
    draw_text  "______________________________________________________________________", :at => [70,650+des]
    draw_text  "Reconozco que recibí de:",:size=>8, :at => [70,635+des]
    draw_text  "Moneda  nacional",:size=>8, :at => [450,635+des]
    draw_text  "(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N. )",:size=>9, :at => [70,620+des]
    draw_text  "______________________________________________________________________", :at => [70,620+des]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610+des]
    
    #image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600+des]
    
    draw_text  "_________________________", :at => [370,580+des]
    draw_text  "FIRMA APOYO DE DESARROLLO SOCIAL RECIBIDO ",:size=>8, :at => [320,570+des]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520+des]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520+des]
    draw_text  "PROMOTOR DE APOYO:  #{@credit.padre.nombre_completo}  ",:size=> 8, :at => [290,520+des]
    
    rectangle [50,350], 500, 250 
    
    
    
    des = -400 
    
    draw_text  "FUNDACIÓN VALOR A.C.",:size=>9, :at => [70,720+des]
    draw_text  "#{Conf.last.domicilio}",:size=>9, :at => [70,710+des]
    draw_text  "COYOACÁN, CDMX C.P. 04100",:size=>9, :at => [70,700+des]
    draw_text  "#{Conf.last.RFC}",:size=>9, :at => [70,690+des]
    draw_text  "FUNDACIÓN: #{@credit.padre.branch_office.nombre}",:size=>9, :at => [70,680+des]
    
    draw_text  "Original ", :at => [460,730+des]
    draw_text  "FECHA ",:size=>9, :at => [460,710+des]
    draw_text  "#{@credit.fecha_en_español}", :size=>9, :at => [430,703+des]
    
    draw_text  "#{@credit.nombre_completo_deudor}", :at => [70,650+des]
    draw_text  "#{ Dinero.to_money(@credit.monto_solicitud) }", :at => [430,650+des]
    draw_text  "______________________________________________________________________", :at => [70,650+des]
    draw_text  "Reconozco que recibí de:",:size=>8, :at => [70,635+des]
    draw_text  "Moneda  nacional",:size=>8, :at => [450,635+des]
    draw_text  "(#{Dinero.to_words(@credit.monto_solicitud)} pesos 00/100 M.N. )",:size=>9, :at => [70,620+des]
    draw_text  "______________________________________________________________________", :at => [70,620+des]
    draw_text  "La cantidad de: ",:size=>8, :at => [70,610+des]
    
    #image "#{Rails.root}/app/assets/images/logo marjo.png", width: 155, height: 45, :at => [70,600+des]
    
    draw_text  "_________________________", :at => [370,580+des]
    draw_text  "FIRMA APOYO DE DESARROLLO SOCIAL RECIBIDO ",:size=>8, :at => [320,570+des]
    
    draw_text  "BANCO:  #{@credit.padre.branch_office.banco}  ",:size=> 9, :at => [70,520+des]
    draw_text  "CUENTA:  #{@credit.padre.branch_office.cuenta}  ",:size=> 9, :at => [170,520+des]
    draw_text  "PROMOTOR DE APOYO:  #{@credit.padre.nombre_completo}  ",:size=> 8, :at => [290,520+des]
    stroke()
  end
end
