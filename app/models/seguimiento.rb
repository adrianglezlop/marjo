class Seguimiento < ActiveRecord::Base
    belongs_to :payment
    
    def update(xcred,xcob, xfecha)
        #self.update(cobrado: 0).where("credit_id= ? and fecha_corte= ?",xcob,xcred, xfecha)
        s=Seguimiento.where("credit_id= ? and fecha_corte= ?", xcred, xfecha)
        #return s
        s.cobrado = xcob.to_f
        #s.save()
    end
end
