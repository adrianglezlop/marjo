class ContratoPdf < Prawn::Document
  def initialize(credit)
    super()
    @credit = credit 
    
    text_content
  end
  def text_content
        text "Original",:size =>8,:align  => :right
   text "CONVENIO DE COLABORACIÓN PARA EL OTORGAMIENTO DE UN APOYO ECONÓMICO SOCIAL" , :size =>10, :align  => :center
   text ""
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente convenio de colaboración para el otorgamiento de un apoyo económico social, por una parte el(la) Sr(a). #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} en la ciudad de CULIACAN, SIN. a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el(la) Sr(a). #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de los siguientes antecedentes y claúsulas:",:size =>10,:align => :justify 
text ""    
    text "I.- La Fundación ___________________________, es una Organización de la Sociedad Civil que tiene como objeto el realizar las siguientes actividades de Fomento: " ,:size =>10, :align  => :justify
    text "1) Cívicas, enfocadas a promover la participación ciudadana en asuntos de interés público." , :size =>10, :align  => :justify
    text "2) Fomento de acciones para mejorar la economía popular." , :size =>10, :align  => :justify
    text "3) Prestación de servicios de apoyo a la creación y fortalecimiento d organizaciones que realicen actividades objeto de fomento." , :size =>10, :align  => :justify
    text "4) La realización de actividades de asistencia social que tengan como beneficiarios a personas, sectores y regiones de escasos recursos; que realicen actividades para lograr mejores condiciones d subsistencia y desarrollo a las comunidades indígenas y a los grupos vulnerables por edad, sexo o problemas de discapacidad, dedicadas, entre otras a: la atención a requerimientos básicos de subsistencia en materia de alimentaciín, vestido o vivienda; Orientación social , educación o capacitación para el trabajo; Aportación de servicios para la atención a grupos sociales con discapacidad; Fomento de acciones para mejorar la economía popular, entre otros. " , :size =>10, :align  => :justify
    text "II.- 'La Fundación' tiene la prohibición expresa de otorgar los apoyos materia de este convenio a sus integrantes o a sus parientes colaterales hasta el cuarto grado, situación que, se manifiesta, no se da en la presente colaboración." , :align  => :justify
    text "III.- 'El Beneficiario' comprende la importancia de la presente colaboración y se compromete a regresar el importe d las cantidades otorgadas, y los montos adicionales convenidos, consciente de que es la manera de seguir beneficiando a más personas y con la oportunidad recibida por este apoyo, sabiendo que no es una entrega económica a fondo perdido y que con su puntual cumplimiento en los montos y fechas límite de retorno del beneficio recibido, 'La Fundación' podrá seguir desarrollando sus objetivos sociales de ayuda y apoyo a diversos sectores de la población, todos ellos autorizados por la Secretaría de Hacienda y Crédito Público, a través del Servicio de Administración Tributaria." , :size =>10, :align  => :justify
    
    text "CLAUSULAS" ,:size =>10, :align  => :center
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico social a 'El Beneficiario' y este se compromete a reponer el monto total del importe recibido y las cantidades adicionales que servirán para la composición del Fondo Revolvente de 'La Fundación'. ",:size =>10,:align => :justify
    text "Como garantía de cumplimiento, junto con la firma del presente convenio, 'El Beneficiario' firmará un Título de Crédito(Pagaré) por el monto total del apoyo, así como por el monto de las cantidades adicionales para la recomposición del Fondo Revolvente.",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este convenio de colaboración, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas y solidarias responsables de la recepción y pago de dicho apoyo económico social. ",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a 6 meses  a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de apoyo a 'El Beneficiario', deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} #{@credit.product.payout.periocidad}. El beneficio que adquirirá el Fondo Revolvente de 'La Fundación' es del orden de #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar el apoyo económico establecido que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 día de atraso, independientemente de que su apoyo económico sea menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" El apoyo económico otorgado jamás podrá exceder a la cantidad que resulte de dos meses de ingreso propio que 'El Beneficiario' demuestre para la firma del presente convenio decolaboración de apoyo económico.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera cláusulas del Convenio de Colaboración, se dará por vencido este convenio, y en consecuencia se suspenderá el apoyo económico ofrecido, debiendo 'La Fundación' exigir a 'El Beneficiario' lo siguiente:",:size =>10,:align => :justify 
    text" A. Interés moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La recisión de este convenio de colaboración y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Beneficiario' o sus apoderados legales, al firmar el recibo de rcepción del APOYO ECONÓMICO SOCIAL, hacen constar que recibieron el mismo a su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente convenio de colaboración, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text" "
  
    start_new_page
    
    
    
   text"Copia 1",:size =>8,:align  => :right
   text "CONVENIO DE COLABORACIÓN PARA EL OTORGAMIENTO DE UN APOYO ECONÓMICO SOCIAL" , :size =>10, :align  => :center
   text ""
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente convenio de colaboración para el otorgamiento de un apoyo económico social, por una parte el(la) Sr(a). #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} en la ciudad de CULIACAN, SIN. a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el(la) Sr(a). #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de los siguientes antecedentes y claúsulas:",:size =>10,:align => :justify 
text ""    
    text "I.- La Fundación ___________________________, es una Organización de la Sociedad Civil que tiene como objeto el realizar las siguientes actividades de Fomento: " ,:size =>10, :align  => :justify
    text "1) Cívicas, enfocadas a promover la participación ciudadana en asuntos de interés público." , :size =>10, :align  => :justify
    text "2) Fomento de acciones para mejorar la economía popular." , :size =>10, :align  => :justify
    text "3) Prestación de servicios de apoyo a la creación y fortalecimiento d organizaciones que realicen actividades objeto de fomento." , :size =>10, :align  => :justify
    text "4) La realización de actividades de asistencia social que tengan como beneficiarios a personas, sectores y regiones de escasos recursos; que realicen actividades para lograr mejores condiciones d subsistencia y desarrollo a las comunidades indígenas y a los grupos vulnerables por edad, sexo o problemas de discapacidad, dedicadas, entre otras a: la atención a requerimientos básicos de subsistencia en materia de alimentaciín, vestido o vivienda; Orientación social , educación o capacitación para el trabajo; Aportación de servicios para la atención a grupos sociales con discapacidad; Fomento de acciones para mejorar la economía popular, entre otros. " , :size =>10, :align  => :justify
    text "II.- 'La Fundación' tiene la prohibición expresa de otorgar los apoyos materia de este convenio a sus integrantes o a sus parientes colaterales hasta el cuarto grado, situación que, se manifiesta, no se da en la presente colaboración." , :align  => :justify
    text "III.- 'El Beneficiario' comprende la importancia de la presente colaboración y se compromete a regresar el importe d las cantidades otorgadas, y los montos adicionales convenidos, consciente de que es la manera de seguir beneficiando a más personas y con la oportunidad recibida por este apoyo, sabiendo que no es una entrega económica a fondo perdido y que con su puntual cumplimiento en los montos y fechas límite de retorno del beneficio recibido, 'La Fundación' podrá seguir desarrollando sus objetivos sociales de ayuda y apoyo a diversos sectores de la población, todos ellos autorizados por la Secretaría de Hacienda y Crédito Público, a través del Servicio de Administración Tributaria." , :size =>10, :align  => :justify
    
    text "CLAUSULAS" ,:size =>10, :align  => :center
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico social a 'El Beneficiario' y este se compromete a reponer el monto total del importe recibido y las cantidades adicionales que servirán para la composición del Fondo Revolvente de 'La Fundación'. ",:size =>10,:align => :justify
    text "Como garantía de cumplimiento, junto con la firma del presente convenio, 'El Beneficiario' firmará un Título de Crédito(Pagaré) por el monto total del apoyo, así como por el monto de las cantidades adicionales para la recomposición del Fondo Revolvente.",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este convenio de colaboración, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas y solidarias responsables de la recepción y pago de dicho apoyo económico social. ",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a 6 meses  a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de apoyo a 'El Beneficiario', deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} #{@credit.product.payout.periocidad}. El beneficio que adquirirá el Fondo Revolvente de 'La Fundación' es del orden de #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar el apoyo económico establecido que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 día de atraso, independientemente de que su apoyo económico sea menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" El apoyo económico otorgado jamás podrá exceder a la cantidad que resulte de dos meses de ingreso propio que 'El Beneficiario' demuestre para la firma del presente convenio decolaboración de apoyo económico.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera cláusulas del Convenio de Colaboración, se dará por vencido este convenio, y en consecuencia se suspenderá el apoyo económico ofrecido, debiendo 'La Fundación' exigir a 'El Beneficiario' lo siguiente:",:size =>10,:align => :justify 
    text" A. Interés moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La recisión de este convenio de colaboración y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Beneficiario' o sus apoderados legales, al firmar el recibo de rcepción del APOYO ECONÓMICO SOCIAL, hacen constar que recibieron el mismo a su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente convenio de colaboración, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text" "
    
    start_new_page
    
   text"Copia 2",:size =>8,:align  => :right
   text "CONVENIO DE COLABORACIÓN PARA EL OTORGAMIENTO DE UN APOYO ECONÓMICO SOCIAL" , :size =>10, :align  => :center
   text ""
    text "En la ciudad de #{@credit.padre.municipio}, a #{@credit.fecha_en_español} comparecieron para celebrar el presente convenio de colaboración para el otorgamiento de un apoyo económico social, por una parte el(la) Sr(a). #{Conf.last.representante_legal}, representante legal de ___________________________, con domicilio en: #{Conf.last.domicilio} en la ciudad de CULIACAN, SIN. a quien en lo sucesivo se le denominará 'La Fundación', y por otra parte el(la) Sr(a). #{@credit.nombre_completo_deudor} con domicilio en #{@credit.domicilio } a quien en lo sucesivo se le denominará 'El Beneficiario', al tenor de los siguientes antecedentes y claúsulas:",:size =>10,:align => :justify 
text ""    
    text "I.- La Fundación ___________________________, es una Organización de la Sociedad Civil que tiene como objeto el realizar las siguientes actividades de Fomento: " ,:size =>10, :align  => :justify
    text "1) Cívicas, enfocadas a promover la participación ciudadana en asuntos de interés público." , :size =>10, :align  => :justify
    text "2) Fomento de acciones para mejorar la economía popular." , :size =>10, :align  => :justify
    text "3) Prestación de servicios de apoyo a la creación y fortalecimiento d organizaciones que realicen actividades objeto de fomento." , :size =>10, :align  => :justify
    text "4) La realización de actividades de asistencia social que tengan como beneficiarios a personas, sectores y regiones de escasos recursos; que realicen actividades para lograr mejores condiciones d subsistencia y desarrollo a las comunidades indígenas y a los grupos vulnerables por edad, sexo o problemas de discapacidad, dedicadas, entre otras a: la atención a requerimientos básicos de subsistencia en materia de alimentaciín, vestido o vivienda; Orientación social , educación o capacitación para el trabajo; Aportación de servicios para la atención a grupos sociales con discapacidad; Fomento de acciones para mejorar la economía popular, entre otros. " , :size =>10, :align  => :justify
    text "II.- 'La Fundación' tiene la prohibición expresa de otorgar los apoyos materia de este convenio a sus integrantes o a sus parientes colaterales hasta el cuarto grado, situación que, se manifiesta, no se da en la presente colaboración." , :align  => :justify
    text "III.- 'El Beneficiario' comprende la importancia de la presente colaboración y se compromete a regresar el importe d las cantidades otorgadas, y los montos adicionales convenidos, consciente de que es la manera de seguir beneficiando a más personas y con la oportunidad recibida por este apoyo, sabiendo que no es una entrega económica a fondo perdido y que con su puntual cumplimiento en los montos y fechas límite de retorno del beneficio recibido, 'La Fundación' podrá seguir desarrollando sus objetivos sociales de ayuda y apoyo a diversos sectores de la población, todos ellos autorizados por la Secretaría de Hacienda y Crédito Público, a través del Servicio de Administración Tributaria." , :size =>10, :align  => :justify
    
    text "CLAUSULAS" ,:size =>10, :align  => :center
    text "PRIMERA: 'La Fundación' ha convenido en otorgar un apoyo económico social a 'El Beneficiario' y este se compromete a reponer el monto total del importe recibido y las cantidades adicionales que servirán para la composición del Fondo Revolvente de 'La Fundación'. ",:size =>10,:align => :justify
    text "Como garantía de cumplimiento, junto con la firma del presente convenio, 'El Beneficiario' firmará un Título de Crédito(Pagaré) por el monto total del apoyo, así como por el monto de las cantidades adicionales para la recomposición del Fondo Revolvente.",:size =>10,:align => :justify 
    text "SEGUNDA: El importe que acepta y se obliga a pagar 'El Beneficiario', será el estipulado en RECIBO expedido por 'La Fundación' y las fechas de pago, serán las estipuladas en este convenio de colaboración, dicho recibo será firmado por 'El Beneficiario' o por las personas por él autorizadas y solidarias responsables de la recepción y pago de dicho apoyo económico social. ",:size =>10,:align => :justify 
    text "TERCERA: Cada recibo emitido por 'La Fundación' deberá pagarse en un plazo no mayor a 6 meses  a partir de la fecha de su expedición, cuyo pago se efectuará mediante abonos #{@credit.product.payout.periocidad} por la cantidad de $  #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} por cada $1,000.00 que sea el apoyo, dando como ejemplo el siguiente tabulador." ,:size =>10 ,:align => :justify
    text "
                 APOYO       ABONO (#{@credit.product.payout.periocidad})" , :align  => :center,:size =>10       
    text "_________         __________ "  , :align  => :center,:size =>10          
    text "1,000.00          #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)}   " , :align  => :center,:size =>10                            
    text " 2,000.00          #{Dinero.to_money((2000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 3,000.00          #{Dinero.to_money((3000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
    text " 4,000.00          #{Dinero.to_money((4000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} " , :align  => :center,:size =>10                            
     text "
    * El tabulador que se despliega en el presente punto hace referencia a que el abono está condicionado a que por cada $1,000.00 de apoyo a 'El Beneficiario', deberá darse un abono por la cantidad de #{Dinero.to_money((1000*(1+@credit.product.taza_de_interes_ordinaria/100))/@credit.product.numero_de_pagos_a_realizar)} #{@credit.product.payout.periocidad}. El beneficio que adquirirá el Fondo Revolvente de 'La Fundación' es del orden de #{'%.2f' % @credit.product.taza_de_interes_ordinaria} % #{@credit.product.plazo}.",:size =>10,:align => :justify 
    text" Los recibos surtidos a 'La Fundación' no deberán rebasar el apoyo económico establecido que es de $ #{Dinero.to_money(@credit.monto_solicitud)}.",:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando algún recibo se encuentre con más de 1 día de atraso, independientemente de que su apoyo económico sea menor de $ #{Dinero.to_money(@credit.monto_solicitud)} " ,:size =>10,:align => :justify 
    text" 'La Fundación' tiene en todo momento el derecho de negar cualquier pedido a 'El Beneficiario' cuando su saldo sea mayor de $ #{Dinero.to_money(@credit.monto_solicitud)}, independientemente de su vencimiento.",:size =>10,:align => :justify 
    text" El apoyo económico otorgado jamás podrá exceder a la cantidad que resulte de dos meses de ingreso propio que 'El Beneficiario' demuestre para la firma del presente convenio decolaboración de apoyo económico.",:size =>10,:align => :justify 
    text" CUARTA: A falta de pago puntual de cualquier recibo emitido por 'La Fundación' de conformidad con las segunda y tercera cláusulas del Convenio de Colaboración, se dará por vencido este convenio, y en consecuencia se suspenderá el apoyo económico ofrecido, debiendo 'La Fundación' exigir a 'El Beneficiario' lo siguiente:",:size =>10,:align => :justify 
    text" A. Interés moratorios de #{'%.2f' %  @credit.product.taza_de_interes_moratoria}% por el importe de saldo insoluto vencido (mensual).",:size =>10,:align => :justify 
    text" B. Pago inmediato de la cantidad que como saldo total este adeudándole.",:size =>10,:align => :justify 
    text" C. La recisión de este convenio de colaboración y por consiguiente, el pago de las prestaciones legales a que haya lugar.",:size =>10,:align => :justify 
    text" QUINTA: 'El Beneficiario' o sus apoderados legales, al firmar el recibo de rcepción del APOYO ECONÓMICO SOCIAL, hacen constar que recibieron el mismo a su entera satisfacción.",:size =>10,:align => :justify 
    text" SEXTA: Para la interpretación del presente convenio de colaboración, las partes se someten a lo que determinen los tribunales competentes de la ciudad de #{@credit.ciudad_tribunal}, renunciando expresamente a la competencia que pudiera corresponder en razón de sus domicilios presentes o futuro o de cualquier índole.",:size =>10,:align => :justify 
    text" Para constancia y efectos legales, los contratantes firman el presente contrato en la ciudad de #{@credit.padre.municipio}, #{@credit.padre.estado}  el día de #{@credit.fecha_en_español}.",:size =>10,:align => :justify 
    text"  __________________________                                                                          ________________________",:size =>10,:align => :justify 
    text"         'La Fundación'                                                                                                             'El Beneficiario'",:size =>10,:align => :justify 
    text" "
    
    start_new_page
    
text "PAGARÉ                                                                                                     No._______ BUENO POR $ ________________",:size =>10
text" 
"
text "En ___________________________ a ____ de _____________ de 20___ ",:size =>10,:align => :right
text" 
"
text "Debo(emos) y pagaré(mos) incondicionalmente por este pagaré a la orden de __________________________________",:size =>10,:align => :justify 
text" 
"
text "______________________________________________________ el ________________________________________",:size =>10,:align => :justify 
text" 
"
text "Valor recibido a mi(nuestra) entera satisfacción. Este pagaré está sujeto a las condiciones de que al no pagarse a su vencimiento, será exigible desde la fecha de su vencimiento de este documento hasta el dia de su total liquidación, causando intereses moratorios al tipo de _____% mensual pagadero en esta ciudad juntamente con el principal.

",:size =>10,:align => :justify 
text "Nombre y datos de 'El Beneficiario'                          Nombre y datos de 'EL OBLIGADO SOLIDARIO'",:size =>10,:align => :center 
text" "
text "Nombre: _______________________________________     Nombre: _______________________________________",:size =>10,:align => :justify 
text"   "
text "Domicilio:__________________________Tel._________       Domicilio:__________________________Tel._________",:size =>10,:align => :justify 
text "Acepto(amos)                                                                           Acepto(amos)",:size =>10,:align => :left 
text" 
"
text "Firma(s)________________________________________      Firma(s)________________________________________",:size =>10,:align => :justify 
  end
end
