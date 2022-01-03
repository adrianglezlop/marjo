json.array!(@companies) do |company|
  json.extract! company, :id, :clave, :nombre_de_empresa, :razon_social, :calle, :numero_exterior, :numero_interior, :colonia, :codigo_postal, :municipio, :estado, :apellido_paterno, :apellido_materno, :nombre_1, :nombre_2, :telefono_de_oficina, :telefono_celular, :correo_electronico_1, :correo_electronico_2, :cuenta_bacaria, :banco, :comicion_por_cobranza, :comicion_por_colocacion, :monto_maximo_de_prestamo, :permitir_prestamo_multiple
  json.nombre_completo company.nombre_completo
  json.url company_url(company, format: :json)
end
