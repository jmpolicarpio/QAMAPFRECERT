

--SPS_T_MaeCertificado_Anulacion
--SPU_T_MaeSusAnular
--SPU_T_MaePolizaAnular
--SPS_T_MaeSuscripcion_Anulacion

SELECT * FROM T_MAE_PERMISO_FLUJO WHERE N_ID_PERMISO=21
--INICIO REVERSA DE UPDATE 
--UPDATE T_MAE_PERMISO_FLUJO
--SET FUNCION = 'JavaScript:ObtenerIndicadoresPlan([idPoliza],[idCertificado],[idEntidad],25,''[numPoliza]'',''[numCertificado]'',''[codProducto]'',[mcaAnulacion])'
--WHERE N_ID_PERMISO = 21
--AND N_ID_FLUJO = 1;
--FIN  REVERSA DE UPDATE 


--INICIO IMPACTO 
--UPDATE T_MAE_PERMISO_FLUJO
--SET FUNCION = 'JavaScript:ObtenerIndicadoresPlan([idPoliza],[idCertificado],[idEntidad],4,''[numPoliza]'',''[numCertificado]'',''[codProducto]'',[mcaAnulacion])'
--WHERE N_ID_PERMISO = 21
--AND N_ID_FLUJO = 1;
--FIN IMPACTO 



SELECT * FROM T_MAE_PERMISO_FLUJO WHERE N_ID_PERMISO=34
--update T_MAE_PERMISO_FLUJO
--set C_VALOR1_IGUAL_1=6
--WHERE N_ID_PERMISO=34
--AND N_ID_FLUJO=6

--INICIO REVERSA DE UPDATE 
--update T_MAE_PERMISO_FLUJO
--set FUNCION='JavaScript:ObtenerIndicadoresPlan([idPoliza],[idCertificado],[idEntidad],4,[numPoliza])'
--where N_ID_PERMISO=34
--and N_ID_FLUJO=6
--FIN  REVERSA DE UPDATE 



select
--INICIO IMPACTO 
--update T_MAE_PERMISO_FLUJO
--set FUNCION='JavaScript:ObtenerIndicadoresPlanSuscripcion([idPoliza],[idSuscripcion],[idEntidad],4,[numPoliza],''[numCertificado]'')'
--where N_ID_PERMISO=34
--and N_ID_FLUJO=6
--FIN  IMPACTO 



--SPU_T_MaePolizaAnular_BKP

--select * from T_MAE_PERMISO where N_ID_PERMISO=34
--select * from T_MAE_FLUJO where N_ID_FLUJO=6
--select * from T_MAE_PERFIL_PERMISO_OPCION where N_ID_PERFIL=1

--TENER EN CUENTA PASE 
--SPS_T_SelectResultadoEvaluacionM
--SPS_T_SelectResultadoEvaluacionMSusc