class ContratoPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
        text "Original",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE APOYO ECONÓMICO      
   " , :align  => :center, :style=> :bold
 
  
      text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de apoyo económico, por una parte el(la) #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico a 'El Beneficiario' y este dá en garantia un pagaré por el monto total del apoyo. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a 6 meses  a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de apoyo al el beneficiario, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} #{@credit.product.payout.periocidad}. La tasa de interes del apoyo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar la línea de apoyo establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 días, independientemente de su apoyo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de apoyo otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el el beneficiario demuestre para la apertura del presente contrato de apertura de apoyo.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de apoyo, debiendo 'La Fundación' exigir a 'El Beneficiario'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Beneficiario' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text"
    "
  
    start_new_page
    
    
    
   text"Copia 1",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE APOYO ECONÓMICO      
   " , :align  => :center, :style=> :bold
 
  
      text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico a 'El Beneficiario' y este dá en garantia un pagaré por el monto total del apoyo. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10     
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de préstamo al cliente, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del apoyo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar la línea de apoyo establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 días, independientemente de su apoyo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de apoyo otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el el beneficiario demuestre para la apertura del presente contrato de apertura de apoyo.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de apoyo, debiendo 'La Fundación' exigir a 'El Beneficiario'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: EN ESPERA DE REDACCION",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text"
    "
   
  start_new_page
    
    
   text"Copia 2",:size =>8,:align  => :right
   text "CONTRATO DE APERTURA DE APOYO ECONÓMICO      
   " , :align  => :center, :style=> :bold
 
  
     text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente contrato de credito y garantía, por una parte el(la) #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} de la ciudad de  CULIACÁN, SINALOA  a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el Sr(a) #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de las siguientes:
",:size =>10,:align => :justify 
    text "CLAUSULAS" , :align  => :center, :style=> :bold
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico a 'El Beneficiario' y este dá en garantia un pagaré por el monto total del apoyo. ",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este contrato, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas.",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a #{@credit.product.numero_de_pagos_a_realizar/2} meses a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de apoyo al el beneficiario, deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/12)} #{@credit.product.payout.periocidad}. La tasa de interes del apoyo es del #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar la línea de apoyo establecida que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 días, independientemente de su apoyo será menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" La línea de apoyo otorgada jamás podrá exceder a la cantidad que resulte de 2 meses de sueldo que el el beneficiario demuestre para la apertura del presente contrato de apertura de apoyo.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera, se dará por vencido este contrato, y en consecuencia se suspenderá la linea de apoyo, debiendo 'La Fundación' exigir a 'El Beneficiario'",:size =>10,:align => :justify 
    text" A. Interes moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La resición de este contrato y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Beneficiario' o las personas autorizadas por él, al firmar el recibo o el documento hacen constar que recibió el o los artículos descritos en su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente contrato, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text"
    "
   
start_new_page
    

end
