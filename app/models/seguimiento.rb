class Seguimiento < ActiveRecord::Base
    belongs_to :payment
    
    def update(xcred,xcob, xfecha)
        self.update(cobrado:monto).where("credit_id=xcred and fecha_corte=xfecha")
    end
end
