USE [Mapfreqoa]
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeDesaprobarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_U_MaeDesaprobarPoliza]
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeAprobarRechazarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_U_MaeAprobarRechazarPoliza]
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeAprobarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_U_MaeAprobarPoliza]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesSusc]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectListaExamenesSusc]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesMSusc]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectListaExamenesMSusc]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesM]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectListaExamenesM]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenes]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectListaExamenes]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectHistorialesSusc]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectHistorialesSusc]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectHistoriales]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_SelectHistoriales]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_RepSuscripcion]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepProduccion_v2]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_RepProduccion_v2]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepProduccion_new_v4]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_RepProduccion_new_v4]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeAprobacionRechazo]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_MaeAprobacionRechazo]
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MultiriesgoPyme]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPI_T_MultiriesgoPyme]
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MaeTerceroSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPI_T_MaeTerceroSuscripcion]
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MaeSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPI_T_MaeSuscripcion]
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_INCENDIO_MAPFRE_MULTIRIESGO]    Script Date: 3/03/2025 10:48:55 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPI_T_INCENDIO_MAPFRE_MULTIRIESGO]
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_INCENDIO_MAPFRE_MULTIRIESGO]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPI_T_INCENDIO_MAPFRE_MULTIRIESGO]
	@idTipoDocIdentidad					SMALLINT = 0,
	@numDocIdentidad					VARCHAR(20) = '',
	@nombres							VARCHAR(100) = '',
	@apellidoPaterno					VARCHAR(100) = '',
	@apellidoMaterno					VARCHAR(100) = '',
	@fechaNacimiento					VARCHAR(20) = '',
	@idTipoEstadoCivil					SMALLINT = 0,
	@idTipoSexo							SMALLINT = 0,
	
	
	@celular							VARCHAR(20) = '',
	@telefono							VARCHAR(20) = '',
	@correo								VARCHAR(100) = '',

	@idDepartamento						SMALLINT = 0,
	@idProvincia						SMALLINT = 0,
	@idDistrito							SMALLINT = 0,

	@idTipoViaD							SMALLINT = 0,
	@nombreVia							VARCHAR(100) = '',
	@idTipoNumero						SMALLINT = 0,
	@numeroD							VARCHAR(20) = '',
	@idTipoInterior						SMALLINT = 0,
	@nombreInterior						VARCHAR(100) = '',
	@idTipoUrbanizacion					SMALLINT = 0,
	@nombreUrbanizacion					VARCHAR(100) = '',
	@referenciaDireccion				VARCHAR(200) = '',

	@idTipoUsoD							  SMALLINT = 0,
	@idTipoMaterialD					  SMALLINT = 0,
	@idTipoViaRiesg						  SMALLINT = 0,
	@nombreViaRiesg						  VARCHAR(100) = '',
	@idTipoNumeroRiesg					  SMALLINT = 0,
	@nombreNumeroRiesg					  VARCHAR(100) = '',
	@idDepartamentoD					  SMALLINT = 0,
	@idProvinciaD						  SMALLINT = 0,
	@idDistritoD						  SMALLINT = 0,
	@anioD								SMALLINT = 0,
	@pisosD								SMALLINT = 0,
	@sotanosD							SMALLINT = 0,
	@direccionRiesgo				    VARCHAR(100) = '',

	@contenidoD							VARCHAR(200) = '',
	@idTipoValor						SMALLINT = 0,
	@idTipoMoneda						SMALLINT = 0,
	@saldoCapital						NUMERIC(16,6) = 0,
	@nroCuotas							SMALLINT = 0,
	@idTarifaBase						SMALLINT = 0,
	@idPlanEmision						SMALLINT = 0,
	@primaNeta							NUMERIC(16,6) = 0,
	@primaBruta							NUMERIC(16,6) = 0,
	@impuestos							NUMERIC(16,6) = 0,
	@derechoEmision						NUMERIC(16,6) = 0,
	@idPersonaVendedor					INT = 0,
	@idUsuarioEmisor					INT = 0,

	@direccionD							VARCHAR(100) = '',
	
	@idTipoInteriorD					VARCHAR(20) = '',
	@bienesD							VARCHAR(100) = '',
	@existenciasD						VARCHAR(100) = '',
	@idActividadEconomica				SMALLINT = 0,
	@NumeroVia                          VARCHAR(20) = '',	
	@direccion							VARCHAR(100) = '',

	@idPoliza							INT = 0 OUTPUT,
	@idCertificado						INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @idCotizacion				INT
	DECLARE @idCuota					INT
	DECLARE @idTercero					INT = 0
	DECLARE @nroPoliza					VARCHAR(20)
	DECLARE @nroCertificado				VARCHAR(20)
	DECLARE @idCanal					SMALLINT
	DECLARE @idEstablecimiento			SMALLINT
	DECLARE @codUsuCrea					VARCHAR(20)
	DECLARE @tasa						NUMERIC(16,6)
	DECLARE @hoy						DATETIME = GETDATE()
	DECLARE @fecVigenciaIni				DATETIME
	DECLARE @fecVigenciaFin				DATETIME
	DECLARE @idCia						SMALLINT
	DECLARE @codUbigeo					VARCHAR(10)
	DECLARE @codUbigeoT					VARCHAR(10)
	DECLARE @idPersonaEmisor			INT
	DECLARE @porcentajeComision			NUMERIC(16,6)
	

	BEGIN TRANSACTION EMITIR_POLIZA_INCENDIO
	BEGIN TRY
		
		SELECT
			@porcentajeComision = N_VAL_MONTO
		FROM T_DET_PLANCOMISION
		WHERE N_ID_PLAN = @idPlanEmision

		SELECT 
			@nroPoliza = C_VAL_POLIZA
		FROM T_MAE_PLAN
		WHERE N_ID_PLAN = @idPlanEmision

		SELECT
			@nroCertificado = C_VAL_SECPOLIZA
		FROM T_MAE_PLAN
		WHERE N_ID_PLAN = @idPlanEmision

		UPDATE T_MAE_PLAN SET C_VAL_SECPOLIZA = C_VAL_SECPOLIZA + 1 WHERE N_ID_PLAN = @idPlanEmision

		SELECT
			@codUbigeo = C_COD_UBIGEO
		FROM T_MAE_UBIGEO
		WHERE N_ID_UBIGEO = @idDistritoD

		SELECT
			@codUbigeoT = C_COD_UBIGEO
		FROM T_MAE_UBIGEO
		WHERE N_ID_UBIGEO = @idDistrito


		SELECT
			@idCanal = TER.N_ID_ENTIDAD,
			@idEstablecimiento = PER.N_ID_ESTABLECIMIENTO
		FROM T_DET_PERSONA PER 
		INNER JOIN T_MAE_ESTABLECIMIENTO EST ON PER.N_ID_ESTABLECIMIENTO = EST.N_ID_ESTABLECIMIENTO
		INNER JOIN T_MAE_ZONAL PVTA ON PVTA.N_ID_ZONAL = EST.N_ID_ZONAL AND PVTA.N_ID_TIPOZONAL = 406
		INNER JOIN T_MAE_ZONAL REG ON PVTA.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND REG.N_ID_TIPOZONAL = 405
		INNER JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
		INNER JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
		WHERE PER.N_ID_PERSONA = @idPersonaVendedor

		SELECT
			@idCia = N_ID_ENTIDAD
		FROM T_MAE_PLAN PL
		INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO
		WHERE PL.N_ID_PLAN = @idPlanEmision

		SELECT
			@codUsuCrea = C_COD_USUARIO,
			@idPersonaEmisor = N_ID_PERSONA
		FROM T_MAE_USUARIO
		WHERE N_ID_USUARIO = @idUsuarioEmisor

		SELECT @tasa = N_MTO_VALOR 
		FROM T_DET_TARIFAPLANBASEVEHICULAR
		WHERE N_ID_PLAN = @idPlanEmision AND N_ID_ESTADO = 8 

		SET @fecVigenciaIni = @hoy
		SET @fecVigenciaFin = DATEADD(MM,@nroCuotas,@fecVigenciaIni)

		INSERT T_MAE_COTIZACION (			
			D_FEC_INIVIGENCIA,			
			D_FEC_FINVIGENCIA,	     
			N_ID_PLAN,
			N_ID_TIPOMONEDA,         
			N_ID_COMPSEGURO,					
			N_NUM_VALORCOMERCIAL,		
			N_NUM_IMPORTEDESCUENTOS,
			N_NUM_IMPORTERECARGADO,  
			N_NUM_IMPORTEDERECHOEMISION,		
			N_NUM_IMPORTEINTERESES,		
			N_NUM_IMPORTEIMPUESTO,
			N_NUM_PRIMABRUTA,        
			N_NUM_PRIMANETA,					
			D_FEC_COTIZACION,	
			N_IND_ACTIVO,            
			N_ID_ESTADO,          
			C_COD_USUCREACION,		 
			D_FEC_CREACION,    
			N_ID_TIPOTARIFACION)
		SELECT 
			 @fecVigenciaIni		
			,@fecVigenciaFin
			,@idPlanEmision
			,@idTipoMoneda
			,@idCia
			,@saldoCapital
			,0
			,0
			,@derechoEmision
			,0
			,@impuestos
			,@primaBruta
			,@primaNeta
			,@hoy
			,1
			,27
			,@codUsuCrea
			,@hoy
			,272

		SET @idCotizacion = SCOPE_IDENTITY()
		
		INSERT T_DET_PLANCOTIZACION (--CAMPOS VACIOS
			N_ID_COTIZACION,  
			N_ID_PLAN,  
			N_ID_TIPOMONEDA,   
			N_ID_COMPSEGURO,   
			N_NUM_VALORCOMERCIAL,
			N_NUM_IMPORTEDESCUENTOS,  
			N_NUM_IMPORTERECARGADO,	
			N_NUM_IMPORTEDERECHOEMISION,  
			N_NUM_IMPORTEINTERESES,  
			N_NUM_IMPORTEIMPUESTO,  
			N_NUM_PRIMABRUTA,  
			N_NUM_PRIMANETA,  
			N_IND_ACTIVO,  
			N_ID_ESTADO,  
			C_COD_USUCREACION,  
			D_FEC_CREACION)
		SELECT
			@idCotizacion
			,@idPlanEmision
			,@idTipoMoneda
			,@idCia
			,@saldoCapital
			,'0.00'
			,0
			,@derechoEmision
			,0
			,@impuestos
			,@primaBruta
			,@primaNeta
			,1
			,1
			,@codUsuCrea
			,@hoy

		INSERT T_MAE_POLIZA ( 
			N_ID_COTIZACION,
			N_ID_COMPSEGURO, 
			N_ID_PLAN,
			C_NUM_POLIZA,
			D_FEC_POLIZA,
			D_FEC_INIVIGENCIA,
			D_FEC_FINVIGENCIA,
			N_ID_TIPOMONEDA, 
			N_NUM_VALORCOMERCIAL, 
			N_NUM_PRIMABRUTA, 
			N_NUM_PRIMANETA, 
			N_ID_CANAL, 
			N_ID_ESTABLECIMIENTO, 
			N_ID_PEREMISOR, 
			N_ID_PERVENDEDOR, 
			N_IND_AUTOMATICO, 
			N_ID_ESTADOTRANSFERENCIA,
			C_OBS_DESCRIPTIVO,  		
			N_IND_ACTIVO, 
			N_ID_ESTADO, 
			NRO_UNICO_CARGA,
			C_COD_USUCREACION, 
			D_FEC_CREACION	)
		SELECT
			@idCotizacion
			,@idCia
			,@idPlanEmision
			,@nroPoliza		
			,@hoy
			,@fecVigenciaIni		
			,@fecVigenciaFin
			,@idTipoMoneda
			,@saldoCapital
			,@primaBruta
			,@primaNeta
			,@idCanal			
			,@idEstablecimiento	
			,@idPersonaEmisor
			,@idPersonaVendedor
			,0
			,12
			,''
			,1
			,15
			,NULL
			,@codUsuCrea
			,@hoy
		
		SET @idPoliza = SCOPE_IDENTITY()

		INSERT T_DET_COMPONENTEPLANPOLIZA (
			N_ID_COMPONENTE, 
			N_ID_PLAN, 
			N_ID_POLIZA, 
			N_ID_TIPOCOMPONENTE, 
			N_ID_TIPODETCOMPONE, 
			C_COD_COMPONENTE, 
			C_COD_REFERENCIA,
			C_DES_CORTACOMPONENTE,
			C_DES_LARGACOMPONENTE, 
			C_DES_ASEGURABLE, 
			N_MTO_ASEGURABLE, 
			N_IND_PRINCIPAL, 
			N_IND_OBLIGATORIO, 
			C_OBS_DESCRIPTIVO, 
			N_IND_ACTIVO, 
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		 SELECT 
			N_ID_COMPONENTE
			,N_ID_PLAN 
			,@idPoliza 
			,N_ID_TIPOCOMPONENTE
			,N_ID_TIPODETCOMPONE 
			,C_COD_COMPONENTE 
			,C_COD_REFERENCIA
			,C_DES_CORTACOMPONENTE 
			,C_DES_LARGACOMPONENTE 
			,C_DES_ASEGURABLE 
			,N_MTO_ASEGURABLE 
			,N_IND_PRINCIPAL
			,N_IND_OBLIGATORIO 
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO 
			,N_ID_ESTADO 
			,C_COD_USUCREACION
			,D_FEC_CREACION      
		 FROM T_DET_COMPONENTEPLAN
		 WHERE N_ID_PLAN = @idPlanEmision
		 AND N_ID_ESTADO	=8
		 AND N_IND_ACTIVO	=1
		
		DECLARE @nroSolicitud				VARCHAR(15)
		EXEC SPS_ObtenerNumeroSolicitud @CanalId = @idCanal, @nroSolicitud = @nroSolicitud OUTPUT

		INSERT T_MAE_CERTIFICADO ( --CAMPOS VACIOS
			N_ID_POLIZA
			,N_ID_COTIZACION
			,C_NUM_CERTIFICADO
			,D_FEC_CERTIFICADO
			,D_FEC_VENTA
			,D_FEC_INIVIGENCIA
			,D_FEC_FINVIGENCIA
			,N_ID_TIPOMONEDA
			,N_NUM_VALORCOMERCIAL
			,N_NUM_PRIMABRUTA
			,N_NUM_PRIMANETA
			,N_NUM_IMPORTEDERECHOEMISION
			,N_ID_CANAL
			,N_ID_ESTABLECIMIENTO
			,N_ID_PEREMISOR
			,N_ID_PERVENDEDOR
			,N_IND_OBSERVADO
			,N_ID_ESTADOTRANSFERENCIA
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,N_ID_SUSCRIPCION
			,D_FEC_DESEMBOLSO
			,C_NUM_CREDITO
			,N_VAL_TASA
			,N_NUM_IMPORTEDESCUENTOS
			,N_NUM_IMPORTERECARGADO
			,N_NUM_IMPORTEINTERESES
			,N_NUM_IMPORTEIMPUESTO
			,N_POR_RECARGO
			,C_MES_EMISION
			,N_ID_FORMAPAGO
			,N_ID_MEDIOPAGO
			,N_NUM_POR_COM_CANAL
			,N_NUM_COM_CANAL
			,C_NUM_SOLICITUD)
		SELECT
			@idPoliza
			,@idCotizacion
			,right(REPLICATE('0',10) + CONVERT(VARCHAR(10),@nroCertificado),10)
			,@hoy
			,@hoy
			,@hoy
			,DATEADD(MM,@nroCuotas,@hoy)
			,@idTipoMoneda
			,@saldoCapital
			,@primaBruta
			,@primaNeta
			,@derechoEmision
			,@idCanal
			,@idEstablecimiento
			,@idPersonaEmisor	
			,@idPersonaVendedor	
			,0
			,12
			,''
			,1
			,15
			,@codUsuCrea
			,@hoy
			,NULL
			,@hoy
			,NULL
			,@tasa
			,NULL
			,0
			,NULL
			,@impuestos
			,0
			,SUBSTRING(CONVERT(varchar,@hoy,112),1,4) + '/' + SUBSTRING(CONVERT(varchar,@hoy,112),5,2)
			,253
			,660
			,@porcentajeComision
			,@porcentajeComision*@primaBruta
			,@nroSolicitud
		
		SET @idCertificado = SCOPE_IDENTITY()
		
		INSERT T_DET_BITACORA_CERTIFICADO
			(N_ID_CERTIFICADO
			,N_ID_SECUENCIA
			,N_ID_MOTIVO
			,N_ID_MOVESTADO
			,N_ID_TIPOMONEDA
			,N_NUM_VALORCOMERCIAL
			,N_NUM_PRIMABRUTA
			,N_NUM_PRIMANETA
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION)
		SELECT
			@idCertificado
			,1
			,15
			,15
			,@idTipoMoneda
			,@saldoCapital
			,@primaBruta
			,@primaNeta
			,'Se emitió la póliza de forma satisfactoria'
			,1
			,1
			,@codUsuCrea
			,@hoy
		
		--INSERT T_DET_DATOPARTICULARCERTIFICADO
		--	(N_ID_CERTIFICADO
		--	,N_ID_TIPOMONEDA						--@idTipoMoneda
		--	,N_MTO_ASEGURABLE						--@saldoCapital
		--	,N_IND_ACTIVO
		--	,N_ID_ESTADO
		--	,C_COD_USUCREACION
		--	,D_FEC_CREACION					
		--	,N_ID_TIPOVIA							--@idTipoViaD
		--	,C_DES_TIPOVIA
		--	,N_ID_TIPONUMERO
		--	,C_NOM_NUMERO
		--	,C_DES_DIRECCIONRIESGO					--@direccionD
		--	,N_NUM_ANIOFABRINMUEBLE					--@anioD
		--	,C_NUM_NUMDIRECCION						--@numeroD + @idTipoInteriorD
		--	,C_VAL_DPTODIRECCION					--CONVERT(VARCHAR,@idDepartamentoD)			
		--	,C_COD_UBIGEORIESGO						--@codUbigeo
		--	,N_ID_TIPOMATERIALCONSTRUCCION			--@idTipoMaterialD
		--	,N_NUM_PISOS							--@pisosD
		--	,N_NUM_SOTANOS							--@sotanosD
		--	,C_DES_DETALLECONTENIDO					--@contenidoD
		--	,N_ID_TIPOBIEN							--@idTipoValor
		--	,N_ID_TIPOUSOBIEN						--@idTipoUsoD
		--	,C_VAL_BIENES							--@bienesD
		--	,C_VAL_EXISTENCIAS						--@existenciasD
		--	)
		--SELECT
		--	@idCertificado
		--	,@idTipoMoneda
		--	,@saldoCapital
		--	,1
		--	,1
		--	,@codUsuCrea
		--	,@hoy
		--	,@idTipoViaRiesg
		--	,@nombreViaRiesg
		--	,@idTipoNumeroRiesg
		--	,@nombreNumeroRiesg
		--	,@nombreViaRiesg
		--	,@direccionD + ' ' + @NumeroVia + ' ' + @idTipoInteriorD
		--	,@anioD
		--	,CONVERT(VARCHAR,@idDepartamentoD)	
		--	,@codUbigeo
		--	,@idTipoMaterialD
		--	,@pisosD
		--	,@sotanosD
		--	,@contenidoD
		--	,@idTipoValor
		--	,@idTipoUsoD
		--	,@bienesD
		--	,@existenciasD

		INSERT T_DET_DATOPARTICULARCERTIFICADO
			(N_ID_CERTIFICADO
			,N_ID_TIPOMONEDA						--@idTipoMoneda
			,N_MTO_ASEGURABLE						--@saldoCapital
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION					
			,C_COD_UBIGEORIESGO
			,N_ID_TIPOVIA
			,C_DES_TIPOVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_NUM_ANIOFABRINMUEBLE
			,N_ID_TIPOUSOBIEN 
			,N_ID_TIPOMATERIALCONSTRUCCION
			,N_NUM_PISOS
			,N_NUM_SOTANOS
			,C_DES_DIRECCIONRIESGO			
			,C_VAL_BIENES
			,C_VAL_EXISTENCIAS
			,N_ID_TIPOBIEN
			,C_DES_DETALLECONTENIDO	
			)
		SELECT
			@idCertificado
			,@idTipoMoneda
			,@saldoCapital
			,1
			,1
			,@codUsuCrea
			,@hoy
			,@codUbigeo
			,@idTipoViaRiesg
			,@direccionD
			,@idTipoNumeroRiesg
			,@NumeroVia
			,@anioD
			,@idTipoUsoD
			,@idTipoMaterialD	
			,@pisosD
			,@sotanosD
			,@direccionD + ' ' + @NumeroVia	
			,@bienesD
			,@existenciasD
			,@idTipoValor
			,@contenidoD

		
		SET @idTercero = (SELECT N_ID_TERCERO FROM T_MAE_TERCERO WHERE N_ID_TIPOIDENTIDAD = @idTipoDocIdentidad AND C_VAL_NUMIDENTIDAD = @numDocIdentidad
		and N_IND_ACTIVO = 1 and N_ID_ESTADO = 8)

		IF (@idTercero)>0
		BEGIN
			UPDATE T_MAE_TERCERO SET
				C_APE_PATERNO				= UPPER(@apellidoPaterno),	
				C_APE_MATERNO				= UPPER(@apellidoMaterno),	
				C_NOM_TERCERO				= UPPER(@nombres),
				C_NOM_COMPLETO				= @nombres + ' ' + @apellidoPaterno + ' ' + @apellidoMaterno,
				N_ID_ESTADOCIVIL			= @idTipoEstadoCivil,	
				N_ID_TIPOGENERO				= @idTipoSexo,			
				C_VAL_CELULAR				= @celular,		
				C_VAL_TELEFONO				= @telefono,			
				C_DIR_CORREO				= @correo,				
				C_DES_DIRECCION				= @nombreVia,			
				C_DES_DIRECCIONREFERENCIA	= @referenciaDireccion,
				N_ID_UBIGEODEPARTAMENTO		= @idDepartamento,		
				N_ID_UBIGEOPROVINCIA		= @idProvincia,		
				N_ID_UBIGEODISTRITO			= @idDistrito,
				N_ID_TIPOVIA				= @idTipoViaD,
				C_VAL_NUMVIA				= @NumeroVia,
				N_ID_TIPOINTERIOR			= @idTipoInterior,
				C_NOM_INTERIOR				= @nombreInterior,
				N_ID_TIPONUMERO				= @idTipoNumero,
				C_NOM_NUMERO				= @numeroD,
				N_ID_TIPOURBANIZACION		= @idTipoUrbanizacion,
				C_NOM_URBANIZACION			= @nombreUrbanizacion



			WHERE N_ID_TERCERO = @idTercero
		END
		ELSE
		BEGIN
			INSERT T_MAE_TERCERO 
				(N_ID_TIPOIDENTIDAD
				,C_VAL_NUMIDENTIDAD
				,C_APE_PATERNO
				,C_APE_MATERNO
				,C_NOM_TERCERO
				,C_NOM_COMPLETO
				,D_FEC_NACIMIENTO
				,N_ID_ESTADOCIVIL
				,N_ID_TIPOGENERO				
				,C_VAL_CELULAR				
				,C_VAL_TELEFONO				
				,C_DIR_CORREO				
				,C_DES_DIRECCION				
				,C_DES_DIRECCIONREFERENCIA	
				,N_ID_UBIGEODEPARTAMENTO		
				,N_ID_UBIGEOPROVINCIA		
				,N_ID_UBIGEODISTRITO
				,N_ID_TIPOVIA
				,C_VAL_NUMVIA
				,N_ID_TIPONUMERO
				,C_NOM_NUMERO
				,N_ID_TIPOINTERIOR		
				,C_NOM_INTERIOR			
				,N_ID_TIPOURBANIZACION	
				,C_NOM_URBANIZACION
				,N_IND_ACTIVO
				,N_ID_ESTADO
				)
			SELECT
				@idTipoDocIdentidad,
				@numDocIdentidad,
				UPPER(@apellidoPaterno),	
				UPPER(@apellidoMaterno),	
				UPPER(@nombres),
				@nombres + ' ' + @apellidoPaterno + ' ' + @apellidoMaterno,
				CONVERT(DATE,@fechaNacimiento,103),
				@idTipoEstadoCivil,	
				@idTipoSexo,			
				@celular,		
				@telefono,			
				@correo,				
				@direccion,			
				@referenciaDireccion,
				@idDepartamento,		
				@idProvincia,		
				@idDistrito,
				@idTipoViaD,
				@nombreVia,
				@idTipoNumero,
				@numeroD,
				@idTipoInterior,
				@nombreInterior,
				@idTipoUrbanizacion,
				@nombreUrbanizacion,
				1,
				8				
			SET @idTercero = SCOPE_IDENTITY()
		END
		
		--CONTRATANTE EN COTIZACION
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO, 
			N_ID_COTIZACION, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			8
			,@idCotizacion
			,''
			,364
			,1
			,8
			,'admin'
			,@hoy

		--RESPONSABLE DE PAGO PARA COTIZACION
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO
			,N_ID_COTIZACION
			,C_DES_ROLTERCERO
			,N_ID_TIPOROLTERCERO
			,C_VAL_CELULAR
			,C_DIR_CORREO
			,C_VAL_TELEFONO
			,N_ID_UBIGEODEPARTAMENTO
			,N_ID_UBIGEOPROVINCIA
			,N_ID_UBIGEODISTRITO
			,C_DES_DIRECCION			
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,C_COD_UBIGEODIRECCION
			,C_DES_DIRECCIONREFERENCIA)
		SELECT 
			@idTercero
			,@idCotizacion
			,''
			,366
			,@celular
			,@correo
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito		
			,@direccion
			,1
			,8
			,@codUsuCrea
			,@hoy
			,@codUbigeoT
			,@referenciaDireccion
		
		--ASEGURADO PARA COTIZACION
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO
			,N_ID_COTIZACION
			,C_DES_ROLTERCERO
			,N_ID_TIPOROLTERCERO
			,C_VAL_CELULAR
			,C_DIR_CORREO
			,C_VAL_TELEFONO
			,N_ID_UBIGEODEPARTAMENTO
			,N_ID_UBIGEOPROVINCIA
			,N_ID_UBIGEODISTRITO
			,C_DES_DIRECCION			
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,C_COD_UBIGEODIRECCION
			,C_DES_DIRECCIONREFERENCIA)
		SELECT 
			@idTercero
			,@idCotizacion
			,''
			,365
			,@celular
			,@correo
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito		
			,@direccion
			,1
			,8
			,@codUsuCrea
			,@hoy
			,@codUbigeoT
			,@referenciaDireccion

		--CONTRATANTE EN CERTIFICADO
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			8
			,@idCertificado
			,''
			,364
			,1
			,8
			,'admin'
			,@hoy

		--SE REGISTRA EL RESPONSABLE DE PAGO
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO, 
			N_ID_TIPOASEGURADO, 
			C_DIR_CORREO,  
			C_VAL_CELULAR, 
			C_VAL_TELEFONO, 
			N_ID_UBIGEODEPARTAMENTO, 
			N_ID_UBIGEOPROVINCIA, 
			N_ID_UBIGEODISTRITO,
			N_ID_TIPOVIA, 
			C_VAL_NUMVIA,
			C_DES_DIRECCION, 
			N_ID_TIPOTRABAJADOR,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			@idTercero
			, @idCertificado
			,''
			,366
			,NULL
			,@correo
			,@celular			
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito
			,@idTipoViaD
			,@numeroD
			,@direccion
			,@idActividadEconomica
			,1
			,8
			,@codUsuCrea
			,@hoy

		--SE REGISTRA EL ASEGURADO
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO, 
			N_ID_TIPOASEGURADO, 
			C_DIR_CORREO,  
			C_VAL_CELULAR, 
			C_VAL_TELEFONO, 
			N_ID_UBIGEODEPARTAMENTO, 
			N_ID_UBIGEOPROVINCIA, 
			N_ID_UBIGEODISTRITO,
			N_ID_TIPOVIA, 
			C_DES_DIRECCION, 
			N_ID_TIPOTRABAJADOR,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			@idTercero
			, @idCertificado
			,''
			,365
			,NULL
			,@correo
			,@celular			
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito
			,NULL
			,@direccion
			,@idActividadEconomica
			,1
			,8
			,@codUsuCrea
			,@hoy
		
		INSERT T_MAE_CUOTA (
			N_ID_CERTIFICADO
			,N_ID_POLIZA
			,N_NUM_CUOTA
			,D_FEC_VENCIMIENTO
			,D_FEC_INIVIGENCIA
			,D_FEC_FINVIGENCIA
			,N_ID_ESTADO
			,N_ID_TIPOMONEDA_CUOTA
			,N_NUM_PRIMANETA
			,N_NUM_MONTOCUOTA
			,N_IND_ACTIVO
			,D_FEC_CREACION
			,N_NUM_POR_COM_CANAL
			,N_NUM_COM_CANAL
		)
		SELECT
			@idCertificado
			,@idPoliza
			,1
			,@hoy
			,@hoy
			,DATEADD(MM,1,@hoy)
			,54
			,@idTipoMoneda
			,@primaNeta/@nroCuotas
			,@primaBruta/@nroCuotas
			,1
			,@hoy
			,@porcentajeComision
			,@porcentajeComision*@primaBruta
			
		SET @idCuota = SCOPE_IDENTITY()	
		
		INSERT T_DET_BITACORA_CUOTA(
			N_ID_CUOTA
			,N_ID_SECUENCIA
			,N_ID_TIPO_MOVIMIENTO
			,C_TIPO_MOVIMIENTO
			,N_ID_MOTIVO
			,N_ID_MOVESTADO
			,N_ID_TIPOMONEDA
			,N_NUM_PRIMATOTAL
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_OBS_DESCRIPTIVO
			,D_FEC_CREACION
		)
		SELECT
			@idCuota
			,1
			,583
			,'Pendiente'
			,NULL
			,NULL
			,@idTipoMoneda
			,@primaBruta/@nroCuotas
			,1
			,54
			,'Se registro la cuota'
			,@hoy

	COMMIT TRANSACTION EMITIR_POLIZA_INCENDIO

	END TRY
	
	BEGIN CATCH
		ROLLBACK TRANSACTION EMITIR_POLIZA_INCENDIO
		DECLARE @error_number INT, @error_state INT, @error_severity INT, @error_procedure VARCHAR(500), @error_line INT, @error_message VARCHAR(4000), @data_input VARCHAR(4000)
		SET @error_number = ERROR_NUMBER()
		SET @error_state = ERROR_STATE() 
		SET @error_severity = ERROR_SEVERITY() 
		SET @error_procedure = ERROR_PROCEDURE()
		SET @error_line = ERROR_LINE() 
		SET @error_message = ERROR_MESSAGE() 
		
		SET @data_input = '@idTipoDocIdentidad: ' + ISNULL(CONVERT(VARCHAR,@idTipoDocIdentidad),'NULL') + ';@numDocIdentidad: ' + ISNULL(CONVERT(VARCHAR,@numDocIdentidad),'NULL') 
						+ ';@nombres: ' + ISNULL(CONVERT(VARCHAR,@nombres),'NULL') + ';@apellidoPaterno: ' + ISNULL(CONVERT(VARCHAR,@apellidoPaterno),'NULL') 
						+ ';@apellidoMaterno: ' + ISNULL(CONVERT(VARCHAR,@apellidoMaterno),'NULL') + ';@fechaNacimiento: ' + ISNULL(CONVERT(VARCHAR,@fechaNacimiento),'NULL') 
						+ ';@idTipoEstadoCivil: ' + ISNULL(CONVERT(VARCHAR,@idTipoEstadoCivil),'NULL') + ';@idTipoSexo: ' + ISNULL(CONVERT(VARCHAR,@idTipoSexo),'NULL') 
						+ ';@celular: ' + ISNULL(CONVERT(VARCHAR,@celular),'NULL') + ';@telefono: ' + ISNULL(CONVERT(VARCHAR,@telefono),'NULL') 
						+ ';@correo: ' + ISNULL(CONVERT(VARCHAR,@correo),'NULL') + ';@idDepartamento: ' + ISNULL(CONVERT(VARCHAR,@idDepartamento),'NULL') 
						+ ';@idProvincia: ' + ISNULL(CONVERT(VARCHAR,@idProvincia),'NULL') + ';@idDistrito: ' + ISNULL(CONVERT(VARCHAR,@idDistrito),'NULL') 
						+ ';@idTipoViaD: ' + ISNULL(CONVERT(VARCHAR,@idTipoViaD),'NULL') + ';@nombreVia: ' + ISNULL(CONVERT(VARCHAR,@nombreVia),'NULL') 
						+ ';@idTipoNumero: ' + ISNULL(CONVERT(VARCHAR,@idTipoNumero),'NULL') + ';@numeroD: ' + ISNULL(CONVERT(VARCHAR,@numeroD),'NULL') 
						+ ';@idTipoInterior: ' + ISNULL(CONVERT(VARCHAR,@idTipoInterior),'NULL') + ';@nombreInterior: ' + ISNULL(CONVERT(VARCHAR,@nombreInterior),'NULL') 
						+ ';@idTipoUrbanizacion: ' + ISNULL(CONVERT(VARCHAR,@idTipoUrbanizacion),'NULL') + ';@nombreUrbanizacion: ' + ISNULL(CONVERT(VARCHAR,@nombreUrbanizacion),'NULL') 
						+ ';@referenciaDireccion: ' + ISNULL(CONVERT(VARCHAR,@referenciaDireccion),'NULL') + ';@idTipoUsoD: ' + ISNULL(CONVERT(VARCHAR,@idTipoUsoD),'NULL') 
						+ ';@idTipoMaterialD: ' + ISNULL(CONVERT(VARCHAR,@idTipoMaterialD),'NULL') + ';@idTipoViaRiesg: ' + ISNULL(CONVERT(VARCHAR,@idTipoViaRiesg),'NULL') 
						+ ';@nombreViaRiesg: ' + ISNULL(CONVERT(VARCHAR,@nombreViaRiesg),'NULL') + ';@idTipoNumeroRiesg: ' + ISNULL(CONVERT(VARCHAR,@idTipoNumeroRiesg),'NULL') 
						+ ';@nombreNumeroRiesg: ' + ISNULL(CONVERT(VARCHAR,@nombreNumeroRiesg),'NULL') + ';@idDepartamentoD: ' + ISNULL(CONVERT(VARCHAR,@idDepartamentoD),'NULL') 
						+ ';@idProvinciaD: ' + ISNULL(CONVERT(VARCHAR,@idProvinciaD),'NULL') + ';@idDistritoD: ' + ISNULL(CONVERT(VARCHAR,@idDistritoD),'NULL') 
						+ ';@anioD: ' + ISNULL(CONVERT(VARCHAR,@anioD),'NULL') + ';@pisosD: ' + ISNULL(CONVERT(VARCHAR,@pisosD),'NULL') 
						+ ';@sotanosD: ' + ISNULL(CONVERT(VARCHAR,@sotanosD),'NULL') + ';@direccionRiesgo: ' + ISNULL(CONVERT(VARCHAR,@direccionRiesgo),'NULL') 
						+ ';@contenidoD: ' + ISNULL(CONVERT(VARCHAR,@contenidoD),'NULL') + ';@idTipoValor: ' + ISNULL(CONVERT(VARCHAR,@idTipoValor),'NULL') 
						+ ';@idTipoMoneda: ' + ISNULL(CONVERT(VARCHAR,@idTipoMoneda),'NULL') + ';@saldoCapital: ' + ISNULL(CONVERT(VARCHAR,@saldoCapital),'NULL') 
						+ ';@nroCuotas: ' + ISNULL(CONVERT(VARCHAR,@nroCuotas),'NULL') + ';@idTarifaBase: ' + ISNULL(CONVERT(VARCHAR,@idTarifaBase),'NULL') 
						+ ';@idPlanEmision: ' + ISNULL(CONVERT(VARCHAR,@idPlanEmision),'NULL') + ';@primaNeta: ' + ISNULL(CONVERT(VARCHAR,@primaNeta),'NULL') 
						+ ';@primaBruta: ' + ISNULL(CONVERT(VARCHAR,@primaBruta),'NULL') + ';@impuestos: ' + ISNULL(CONVERT(VARCHAR,@impuestos),'NULL') 
						+ ';@derechoEmision: ' + ISNULL(CONVERT(VARCHAR,@derechoEmision),'NULL') + ';@idPersonaVendedor: ' + ISNULL(CONVERT(VARCHAR,@idPersonaVendedor),'NULL') 
						+ ';@idUsuarioEmisor: ' + ISNULL(CONVERT(VARCHAR,@idUsuarioEmisor),'NULL') + ';@direccionD: ' + ISNULL(CONVERT(VARCHAR,@direccionD),'NULL') 
						+ ';@idTipoInteriorD: ' + ISNULL(CONVERT(VARCHAR,@idTipoInteriorD),'NULL') + ';@bienesD: ' + ISNULL(CONVERT(VARCHAR,@bienesD),'NULL') 
						+ ';@existenciasD: ' + ISNULL(CONVERT(VARCHAR,@existenciasD),'NULL') + ';@idActividadEconomica: ' + ISNULL(CONVERT(VARCHAR,@idActividadEconomica),'NULL') 
						+ ';@NumeroVia: ' + ISNULL(CONVERT(VARCHAR,@NumeroVia),'NULL') + ';@direccion: ' + ISNULL(CONVERT(VARCHAR,@direccion),'NULL') 
						+ ';@idPoliza: ' + ISNULL(CONVERT(VARCHAR,@idPoliza),'NULL') + ';@idCertificado: ' + ISNULL(CONVERT(VARCHAR,@idCertificado),'NULL') 

		INSERT T_MAE_LOG_V2 (C_DATA_INPUT, C_ErrorNumber, C_ErrorState, C_ErrorSeverity, C_ErrorProcedure, C_ErrorLine, C_ErrorMessage, D_FEC_CREA)
		VALUES (@data_input, @error_number, @error_state, @error_severity, @error_procedure, @error_line, @error_message, GETDATE())

		Print 'Error en el store de emisión =>' +@error_message

	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MaeSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***************************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	Emisión
Objetivo 		:	Insertar la Suscripción
Elaborado por	:	P & P BMS
Fecha Creación 	:   15/06/2019

Test:
DECLARE @v_id_suscripcion INT
EXEC SPI_T_MaeSuscripcion 290241,0,0,0,0,0,0,0,0,0,null,'ADMIN', @pi_id_suscripcion = @v_id_suscripcion OUTPUT

SELECT * FROM T_MAE_SUSCRIPCION
***************************************************************************************************/
CREATE PROCEDURE [dbo].[SPI_T_MaeSuscripcion](
	@pi_id_plan INT = 0,
	@pi_num_suscripcion VARCHAR(20) = '',
	@pi_num_credito VARCHAR(20) = '',
	@pi_id_tipomoneda SMALLINT = 0,
	@pi_mto_credito DECIMAL(18,4) = 0,
	@pi_num_cuota SMALLINT = 0,
	@pi_saldo_anterior DECIMAL(18,4) = 0,
	@pi_prima_neta DECIMAL(18,4) = 0,
	@pi_prima_bruta DECIMAL(18,4) = 0,
	@pi_id_tiporesultadosa SMALLINT=0,
	@pi_id_tiporesultadodps SMALLINT=0,
	@pi_id_tiporesultadoedad SMALLINT=0,
	@pi_id_tiporesultadoimc SMALLINT=0,
	@pi_por_imcrecargo  DECIMAL(18,4)=0,
	@pi_nom_adjunto VARCHAR(50)='',
	@pi_obs_descriptivo VARCHAR(100)='',
	@pi_fec_vigencia VARCHAR(10) = '',
	@pi_id_estado INT=0,
	@pi_id_peremisor INT=0,
	@pi_cod_usucreacion CHAR(15)='',
	@pi_id_suscripcion INT=0 OUTPUT,
	@pi_id_tarifaPlanCategoria INT=0 OUTPUT, 
	@pi_id_pol_hibrido VARCHAR(20)=''
)
AS
BEGIN
	SET NOCOUNT ON
	SET DATEFORMAT DMY

	BEGIN TRY

	DECLARE @v_id_suscripcion INT
	DECLARE @v_ind_activo SMALLINT	
	DECLARE @v_fec_creacion DATETIME
	DECLARE @v_id_compseguro INT
	DECLARE @v_dias_vencimiento INT
	--DECLARE @v_num_primabruta DECIMAL(18,4)
	--DECLARE @v_num_primaneta DECIMAL(18,4)
	--DECLARE @pi_id_tarifaPlanCategoria INT
					
	DECLARE
	    @v_id_tipoMoneda INT,
		@v_id_tipoRamo SMALLINT,
		@v_num_primaMin DECIMAL(18, 4),
		@v_num_primaMax DECIMAL(18, 4),
		@v_monto_valor DECIMAL(18, 9),
		@v_num_importeDescuentos  DECIMAL(18,4)=0,
		@v_num_importeRecargado  DECIMAL(18,4)=0,
		@v_num_importeDerechoEmision  DECIMAL(18,4)=0,
		@v_num_importeIntereses  DECIMAL(18,4)=0,
		@v_num_importeImpuesto  DECIMAL(18,4)=0,
		@v_totalregistro_cncpto SMALLINT,
		@v_indice_cncpto SMALLINT,
		@v_id_operador INT =0,
		@v_id_valor INT =0,
		@v_val_monto DECIMAL(18, 7),
		@v_id_concepto INT,
		@v_id_tipoValor SMALLINT,
		@v_aux_concepto DECIMAL(18, 7),
		@v_fec_iniVigencia DATETIME,
		@v_fec_finVigencia DATETIME,
		@v_id_tipoVigenciaPlan SMALLINT,
		@v_num_tipoVigenciaPlan SMALLINT,
		@v_ind_suscautogenerado SMALLINT,
		@v_val_tasa DECIMAL(18, 9), 
	    @v_pol_hibrido INT;

	SELECT @v_id_suscripcion = ISNULL(MAX(N_ID_SUSCRIPCION), 0) 
	FROM T_MAE_SUSCRIPCION

	SELECT	@pi_id_tarifaPlanCategoria = N_ID_TARIFAPLANBASEVEHICULAR
	FROM T_DET_TARIFAPLANBASEVEHICULAR
	WHERE N_ID_PLAN = @pi_id_plan
	AND N_ID_ESTADO = 8
	AND N_IND_ACTIVO = 1

	SELECT	@v_id_compseguro = PRD.N_ID_ENTIDAD
	FROM T_MAE_PLAN PLN
	INNER JOIN T_MAE_PRODUCTO PRD ON PRD.N_ID_PRODUCTO = PLN.N_ID_PRODUCTO
	WHERE PLN.N_ID_PLAN = @pi_id_plan

	SELECT 
	       @v_monto_valor            =		TPC.N_MTO_VALOR,
		   @v_num_primaMin           =		PLN.N_NUM_PRIMAMIN,
		   @v_num_primaMax           =		PLN.N_NUM_PRIMAMAX,
		   @v_id_tipoMoneda          =		PLN.N_ID_TIPOMONEDA,
		   @v_fec_iniVigencia        =		PLN.D_FEC_INIVIGENCIA, 
		   @v_fec_finVigencia        =		PLN.D_FEC_FINVIGENCIA,
		   @v_id_tipoRamo            =		RAM.N_ID_TIPORAMO,
		   @v_id_tipoValor           =		TPC.N_ID_TIPOVALOR,
		   @v_id_tipoVigenciaPlan	 =		PLN.N_ID_TIPOVIGENCIA,
		   @v_num_tipoVigenciaPlan	 =		PLN.N_NUM_TIPOVIGENCIA,
		   @v_ind_suscautogenerado   =		PRD.N_IND_SUSCRIPAUTOGENERADO
	FROM T_DET_TARIFAPLANBASEVEHICULAR TPC
	INNER JOIN T_MAE_PLAN PLN ON PLN.N_ID_PLAN = TPC.N_ID_PLAN
	INNER JOIN T_MAE_PRODUCTO PRD ON PRD.N_ID_PRODUCTO = PLN.N_ID_PRODUCTO
	INNER JOIN T_MAE_RAMO RAM ON RAM.N_ID_RAMO = PRD.N_ID_RAMO
	WHERE TPC.N_ID_TARIFAPLANBASEVEHICULAR= @pi_id_tarifaPlanCategoria

	--SET @v_id_suscripcion = @v_id_suscripcion + 1
	SET @v_ind_activo = 1
	SET @v_dias_vencimiento = dbo.FNC_T_Parametro (28, 2)
	SET @v_fec_creacion = GETDATE()
	
	SET @v_fec_iniVigencia = GETDATE()
	
	IF @pi_fec_vigencia <> ''
	BEGIN
		SET @v_fec_iniVigencia = CONVERT(DATETIME, @pi_fec_vigencia, 103)
	END
	
	SET @v_fec_finVigencia = DATEADD(day,@v_dias_vencimiento,@v_fec_iniVigencia)

	IF @v_id_tipoVigenciaPlan=175 -- ANUAL
	BEGIN
		 SET @v_fec_finVigencia=DATEADD(YY,@v_num_tipoVigenciaPlan,GETDATE())
	END
	ELSE IF @v_id_tipoVigenciaPlan=176 -- BIANUAL
	BEGIN
		 SET @v_fec_finVigencia=DATEADD(YY,2,GETDATE())
	END
	ELSE IF @v_id_tipoVigenciaPlan=177 -- LIBRE
	BEGIN
		 SET @v_fec_finVigencia=NULL
	END
	ELSE IF @v_id_tipoVigenciaPlan=178 -- MENSUAL
	BEGIN
		 SET @v_fec_finVigencia=DATEADD(MM,@v_num_tipoVigenciaPlan,GETDATE())
	END
	ELSE IF @v_id_tipoVigenciaPlan=179 -- DIARIA
	BEGIN
		 SET @v_fec_finVigencia=DATEADD(DD,@v_num_tipoVigenciaPlan,GETDATE())
	END

	SET @v_fec_finVigencia=DATEADD(MM,@pi_num_cuota,GETDATE())	

	IF ISNULL(@v_ind_suscautogenerado,0) = 1
	BEGIN
		SET @pi_num_suscripcion = RIGHT('0000000000' + Ltrim(Rtrim(@v_id_suscripcion)),10)
	END	
	 

	 IF @pi_id_pol_hibrido IS NOT NULL AND LEN(@pi_id_pol_hibrido) > 0
        BEGIN
            SET @v_pol_hibrido = 1;
        END
        ELSE
        BEGIN
            SET @v_pol_hibrido = 0;
        END
	


	INSERT INTO T_MAE_SUSCRIPCION
	(
		--N_ID_SUSCRIPCION,		 
		C_NUM_SUSCRIPCION,		 N_ID_COMPSEGURO,	        N_ID_PLAN,			         N_ID_PEREMISOR,		
		D_FEC_SUSCRIPCION,	 	 D_FEC_INIVIGENCIA,			D_FEC_FINVIGENCIA,	    
		N_ID_TIPOMONEDA,         C_NUM_CREDITO,				N_MTO_CREDITO,				 N_MTO_SALDOANTERIOR,
		N_NUM_PRIMABRUTA,        N_NUM_PRIMANETA,			N_NUM_DEREMISION,			 N_NUM_IMPUESTO,
		N_NUM_CUOTA,			 N_VAL_TASA,				N_POR_RECARGOIMC,	 		 
		N_ID_RESULTADOSA,		 N_ID_RESULTADODPS,			N_ID_RESULTADOEDAD,			 N_ID_RESULTADOIMC,			
		C_NOM_ADJUNTO,			 C_OBS_DESCRIPTIVO,	  		N_IND_ACTIVO,				 N_ID_ESTADO,          
		C_COD_USUCREACION,		 D_FEC_CREACION,            ID_POL_HIBRIDO,              POL_HIBRIDO
	)
	VALUES 
	(	--@v_id_suscripcion,			
		NULL,		@v_id_compseguro,			@pi_id_plan,	    @pi_id_peremisor, 		
		@v_fec_creacion,			@v_fec_iniVigencia,				@v_fec_finVigencia,   
		@pi_id_tipomoneda,			UPPER(@pi_num_credito),			@pi_mto_credito,			  @pi_saldo_anterior,  
		@pi_prima_bruta,			@pi_prima_neta,				    @v_num_importeDerechoEmision,  @v_num_importeImpuesto,
		@pi_num_cuota,				@v_val_tasa,					@pi_por_imcrecargo,
		@pi_id_tiporesultadosa,		@pi_id_tiporesultadodps,		@pi_id_tiporesultadoedad,	   @pi_id_tiporesultadoimc,
		@pi_nom_adjunto,			@pi_obs_descriptivo,			@v_ind_activo,				   @pi_id_estado,       
		@pi_cod_usuCreacion,		@v_fec_creacion ,               @pi_id_pol_hibrido,            @v_pol_hibrido                
	)

	SET @v_id_suscripcion = SCOPE_IDENTITY()
    
	SET @pi_id_suscripcion = @v_id_suscripcion
	--SET @po_id_tarifaPlanCategoria =   @pi_id_tarifaPlanCategoria
	 
	EXEC SPI_T_MovSuscripcion @v_id_suscripcion, NULL, @pi_id_estado, @pi_obs_descriptivo, @pi_cod_usuCreacion
		
END TRY

BEGIN CATCH
	DECLARE @ERROR VARCHAR(2000)
	DECLARE @Linea VARCHAR(2000)
	SET @ERROR=ERROR_MESSAGE()
	SET @Linea=ERROR_LINE()
	SET @ERROR=@ERROR+''+@Linea

	EXEC SPI_T_MaeLog 'SPI_T_MaeSuscripcion',0, @ERROR, @pi_cod_usuCreacion
	
END CATCH


END









GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MaeTerceroSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**************************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	Emisión
Objetivo 		:	Insertar el Tercero para una Suscripción
Elaborado por	:	P & P BMS
Fecha Creación 	:   15/06/2019

Val. Retorna	:	Identificador del tercero registrado.

Test:
Exec SPI_T_MaeTerceroSuscripcion 
**************************************************************************************************/
CREATE PROCEDURE [dbo].[SPI_T_MaeTerceroSuscripcion](
    @pi_id_suscripcion INT = 0,
	@pi_id_tipoasegurado SMALLINT = 0,
	@pi_id_tipoIdentidad SMALLINT = 0,
	@pi_val_docIdentidad VARCHAR(20) = '',
	@pi_ape_paterno VARCHAR(100),
	@pi_ape_materno VARCHAR(100),
	@pi_nombre VARCHAR(100),
	@pi_nombreCompleto VARCHAR(300) = '',
	@pi_fec_nacimiento CHAR(10) = '',
	@pi_correo VARCHAR(100)= null,
	@pi_celular VARCHAR(20)= null,
	@pi_telefono VARCHAR(20)= null,
	@pi_id_ubigeoDepartamento INT = 0,
	@pi_id_ubigeoProvincia INT = 0,
	@pi_id_ubigeoDistrito INT = 0,
	@pi_id_tipoVia INT = 0, 
	@pi_des_direccion VARCHAR(100)='',
	@pi_id_tipoNumeroVia INT = null, 
	@pi_val_numVia VARCHAR(10) = null, 
	@pi_id_tipoInterior INT = null, 
	@pi_des_interior VARCHAR(100) = null,
	@pi_id_tipoUrbanizacion INT = null, 
	@pi_des_urbanizacion VARCHAR(100) = null,
	@pi_des_direccionReferencia VARCHAR(150) = '',
	@pi_peso  DECIMAL(18,4)=0,
	@pi_talla DECIMAL(18,4)=0,
	@pi_profesion VARCHAR(200) = '',
	@pi_actividad VARCHAR(200) = '',
	@pi_seniaparticular VARCHAR(500) = '',
	@pi_id_estadocivil SMALLINT = 0,
	@pi_id_tipogenero SMALLINT = 0,
	@pi_id_rolTercero INT = 0,
	@pi_ind_requieredps SMALLINT = 0,
	@pi_id_resultadoedad SMALLINT = 0,
	@pi_id_resultadoimc SMALLINT = 0,
	@pi_id_resultadodps SMALLINT = 0,
	@pi_ind_recargo SMALLINT = 0,
	@pi_por_imcrecargo  DECIMAL(18,4)=0,
	@pi_id_detevaluaciondpslan INT = NULL,
	@pi_obs_descriptivo	VARCHAR	(1000) = null,
	@pi_id_estado INT = 0,
	@pi_cod_usuCreacion CHAR(15),
	@pi_num_cigarros SMALLINT = 0, 
	@pi_id_resultadosumaasegurada SMALLINT = 0 
)
AS
BEGIN
	SET NOCOUNT ON
	SET DATEFORMAT DMY

	BEGIN TRY

	DECLARE @v_id_tercero INT,
			@v_ind_activo TINYINT=1,
			@v_id_estado INT = 8,
			@v_retorno INT,
			@v_nombrecompleto VARCHAR(300),
			@v_ind_requiereexamen SMALLINT = 0

	--SET @pi_nombreCompleto = UPPER(@pi_nombre) + ' ' + UPPER(@pi_ape_paterno) + ' ' + UPPER(@pi_ape_materno)

	SET @pi_nombreCompleto = 
    COALESCE(UPPER(@pi_nombre), '') + ' ' + 
    COALESCE(UPPER(@pi_ape_paterno), '') + 
    CASE 
        WHEN @pi_ape_materno IS NOT NULL THEN ' ' + UPPER(@pi_ape_materno) 
        ELSE '' 
    END;

	SELECT @v_ind_requiereexamen = N_IND_REQUIEREEXAMEN
	FROM T_DET_EVALUACIONDPSPLAN
	WHERE N_ID_DETEVALUACIONDPSPLAN = @pi_id_detevaluaciondpslan
	
	IF NOT EXISTS(SELECT N_ID_TERCERO
					FROM T_MAE_TERCERO 
					WHERE ISNULL(RTRIM(LTRIM(C_VAL_NUMIDENTIDAD)),0)=@pi_val_docIdentidad 
					AND N_ID_TIPOIDENTIDAD=@pi_id_tipoIdentidad 
					AND N_IND_ACTIVO=1 AND N_ID_ESTADO=8 )
	BEGIN
		INSERT INTO T_MAE_TERCERO
			   (N_ID_TIPOIDENTIDAD
			   ,C_VAL_NUMIDENTIDAD
			   ,C_APE_PATERNO
			   ,C_APE_MATERNO
			   ,C_NOM_TERCERO
			   ,C_NOM_COMPLETO
			   ,D_FEC_NACIMIENTO
			   ,C_DIR_CORREO   
			   ,C_VAL_CELULAR
			   ,C_VAL_TELEFONO
			   ,N_ID_UBIGEODEPARTAMENTO
			   ,N_ID_UBIGEOPROVINCIA
			   ,N_ID_UBIGEODISTRITO
			   ,N_ID_TIPOVIA
			   ,C_DES_DIRECCION   
			   ,N_ID_TIPONUMERO
			   ,C_VAL_NUMVIA
			   ,N_ID_TIPOINTERIOR
			   ,C_NOM_INTERIOR
			   ,N_ID_TIPOURBANIZACION
			   ,C_NOM_URBANIZACION
			   ,C_DES_DIRECCIONREFERENCIA
			   ,N_VAL_PESO 
			   ,N_VAL_TALLA
			   ,C_DES_PROFESION
			   ,C_DES_ACTIVIDAD
			   ,C_DES_SENIAPARTICULAR
			   ,N_ID_ESTADOCIVIL
			   ,N_ID_TIPOGENERO
			   ,N_IND_ACTIVO
			   ,N_ID_ESTADO
			   ,C_COD_USUCREACION
			   ,D_FEC_CREACION
			   ,C_NOM_NUMERO)
		 VALUES (
			@pi_id_tipoIdentidad, 
			@pi_val_docIdentidad,
			UPPER(@pi_ape_paterno), 
			UPPER(@pi_ape_materno),
			UPPER(@pi_nombre),
			@pi_nombreCompleto,
			@pi_fec_nacimiento,
			@pi_correo,
			@pi_celular,
			@pi_telefono,
			@pi_id_ubigeoDepartamento,
			@pi_id_ubigeoProvincia,
			@pi_id_ubigeoDistrito,
			@pi_id_tipoVia,
			@pi_des_direccion,
			@pi_id_tipoNumeroVia,
			@pi_val_numVia,
			@pi_id_tipoInterior,
			@pi_des_interior,
			@pi_id_tipoUrbanizacion,
			@pi_des_urbanizacion,
			@pi_des_direccionReferencia,
			@pi_peso, 
			@pi_talla, 
			@pi_profesion, 
			@pi_actividad, 
			@pi_seniaparticular,
			@pi_id_estadocivil,
			@pi_id_tipogenero,
			@v_ind_Activo, 
			@v_id_estado,
			@pi_cod_usuCreacion,
			GETDATE() ,
			@pi_val_numVia)
			
			SET @v_id_tercero = SCOPE_IDENTITY()
	END
	ELSE
	BEGIN
		SELECT @v_id_tercero = N_ID_TERCERO 
		FROM T_MAE_TERCERO WITH(NOLOCK)
		WHERE ISNULL(RTRIM(LTRIM(C_VAL_NUMIDENTIDAD)),0) = @pi_val_docIdentidad 
		  AND N_ID_TIPOIDENTIDAD = @pi_id_tipoIdentidad 
		  AND N_IND_ACTIVO = 1 
		  AND N_ID_ESTADO = 8

		UPDATE T_MAE_TERCERO
		SET 
			C_APE_PATERNO					= UPPER(@pi_ape_paterno),
			C_APE_MATERNO					= UPPER(@pi_ape_materno),
			C_NOM_TERCERO					= UPPER(@pi_nombre),
			C_NOM_COMPLETO					= @pi_nombreCompleto,
			D_FEC_NACIMIENTO				= @pi_fec_nacimiento,
			C_DIR_CORREO		            = @pi_correo,
			C_VAL_CELULAR		            = @pi_celular,
			C_VAL_TELEFONO					= (CASE WHEN @pi_telefono != '' THEN @pi_telefono ELSE C_VAL_TELEFONO END),
			N_ID_ESTADOCIVIL				= (CASE WHEN @pi_id_estadocivil != 0 THEN @pi_id_estadocivil ELSE N_ID_ESTADOCIVIL END),
			N_ID_TIPOGENERO					= (CASE WHEN @pi_id_tipogenero != 0 THEN @pi_id_tipogenero ELSE N_ID_TIPOGENERO END),
			N_ID_UBIGEODEPARTAMENTO			= (CASE WHEN @pi_id_ubigeoDepartamento != 0 THEN @pi_id_ubigeoDepartamento ELSE N_ID_UBIGEODEPARTAMENTO END),
			N_ID_UBIGEOPROVINCIA			= (CASE WHEN @pi_id_ubigeoProvincia != 0 THEN @pi_id_ubigeoProvincia ELSE N_ID_UBIGEOPROVINCIA END),
			N_ID_UBIGEODISTRITO				= (CASE WHEN @pi_id_ubigeoDistrito != 0 THEN @pi_id_ubigeoDistrito ELSE N_ID_UBIGEODISTRITO END),
			N_ID_TIPOVIA					= (CASE WHEN @pi_id_tipoVia != 0 THEN @pi_id_tipoVia ELSE N_ID_TIPOVIA END),
			C_DES_DIRECCION					= (CASE WHEN @pi_des_direccion != '' THEN @pi_des_direccion ELSE C_DES_DIRECCION END),
			C_VAL_NUMVIA					= (CASE WHEN @pi_val_numVia != '' THEN @pi_val_numVia ELSE C_VAL_NUMVIA END),
			N_VAL_PESO                      = (CASE WHEN @pi_peso != 0 THEN @pi_peso ELSE N_VAL_PESO END),
			N_VAL_TALLA                     = (CASE WHEN @pi_talla != 0 THEN @pi_talla ELSE N_VAL_TALLA END),
			C_DES_PROFESION                 = (CASE WHEN @pi_profesion != '' THEN @pi_profesion ELSE C_DES_PROFESION END),
			C_DES_ACTIVIDAD                 = (CASE WHEN @pi_actividad != '' THEN @pi_actividad ELSE C_DES_ACTIVIDAD END),
			C_DES_SENIAPARTICULAR           = (CASE WHEN @pi_seniaparticular != '' THEN @pi_seniaparticular ELSE C_DES_SENIAPARTICULAR END),
			C_COD_USUMODIF		            = @pi_cod_usuCreacion,
			N_ID_TIPOINTERIOR               = (CASE WHEN @pi_id_tipoInterior != '' THEN @pi_id_tipoInterior ELSE N_ID_TIPOINTERIOR END),
			C_NOM_INTERIOR                  = (CASE WHEN @pi_des_interior != '' THEN @pi_des_interior ELSE C_NOM_INTERIOR END),
			N_ID_TIPONUMERO                 = (CASE WHEN @pi_id_tipoNumeroVia != '' THEN @pi_id_tipoNumeroVia ELSE N_ID_TIPONUMERO END),
			C_NOM_NUMERO					= @pi_val_numVia,
			N_ID_TIPOURBANIZACION           = (CASE WHEN @pi_id_tipoUrbanizacion != '' THEN @pi_id_tipoUrbanizacion ELSE N_ID_TIPOURBANIZACION END),
			C_NOM_URBANIZACION              = (CASE WHEN @pi_des_urbanizacion != '' THEN @pi_des_urbanizacion ELSE C_NOM_URBANIZACION END),
			C_DES_DIRECCIONREFERENCIA       = (CASE WHEN @pi_des_direccionReferencia != '' THEN @pi_des_direccionReferencia ELSE C_DES_DIRECCIONREFERENCIA END),
			D_FEC_MODIFICACION	            = GETDATE()
		WHERE N_ID_TERCERO                  = @v_id_tercero
	END

	IF @@ROWCOUNT > 0
	   BEGIN
           IF (@pi_id_suscripcion != 0)
		      BEGIN
		         DECLARE @v_id_detRolTerceroSuscrip int
				 
				 IF @pi_id_tipoasegurado = 640 --TITULAR
					BEGIN
						--CONTRATANTE
						 INSERT T_DET_ROLTERCEROSUSCRIPCION 
						 (	N_ID_TERCERO, 
							N_ID_SUSCRIPCION, 
							N_ID_TIPOROLTERCERO,
							N_IND_ACTIVO,
							N_ID_ESTADO, 
							C_COD_USUCREACION, 
							D_FEC_CREACION	)
						VALUES
						(	8,
							@pi_id_suscripcion,
							364,
							1,
							1,
							'admin',
							GETDATE()	)

						--RESPONSABLE DE PAGO
						INSERT INTO T_DET_ROLTERCEROSUSCRIPCION
						 (	N_ID_TERCERO, 
							N_ID_SUSCRIPCION, 
							N_ID_TIPOROLTERCERO,
							D_FEC_NACIMIENTO, 
							C_DIR_CORREO,  
							C_VAL_CELULAR,	
							C_VAL_TELEFONO, 
							N_ID_UBIGEODEPARTAMENTO, 
							N_ID_UBIGEOPROVINCIA, 
							N_ID_UBIGEODISTRITO,
							N_ID_TIPOVIA, 
							C_DES_DIRECCION, 
							C_VAL_NUMVIA, 
							C_DES_PROFESION, 
							C_DES_ACTIVIDAD, 
							C_DES_SENIAPARTICULAR, 
							N_IND_ACTIVO,
							N_ID_ESTADO,
							C_COD_USUCREACION,
							D_FEC_CREACION	)
						 VALUES
						 (	@v_id_tercero, 
							@pi_id_suscripcion, 
							366,
							@pi_fec_nacimiento, 
							@pi_correo,  
							@pi_celular, 
							@pi_telefono, 
							@pi_id_ubigeoDepartamento, 
							@pi_id_ubigeoProvincia, 
							@pi_id_ubigeoDistrito,
							@pi_id_tipoVia, 
							@pi_des_direccion, 
							@pi_val_numVia, 
							@pi_profesion, 
							@pi_actividad, 
							@pi_seniaparticular,	
							@v_ind_Activo, 
							@v_ind_Activo,
							@pi_cod_usuCreacion,
							GETDATE()	)
					END
				 


					--ASEGURADO
					INSERT INTO T_DET_ROLTERCEROSUSCRIPCION
					(	N_ID_TERCERO, 
						N_ID_SUSCRIPCION, 
						N_ID_TIPOROLTERCERO,
						N_ID_TIPOASEGURADO, 
						D_FEC_NACIMIENTO, 
						C_DIR_CORREO,  
						C_VAL_CELULAR,	
						C_VAL_TELEFONO, 
						N_ID_UBIGEODEPARTAMENTO, 
						N_ID_UBIGEOPROVINCIA, 
						N_ID_UBIGEODISTRITO,
						N_ID_TIPOVIA, 
						C_DES_DIRECCION, 
						C_VAL_NUMVIA, 
						N_VAL_PESO,
						N_VAL_TALLA, 
						C_DES_PROFESION, 
						C_DES_ACTIVIDAD, 
						C_DES_SENIAPARTICULAR, 
						N_IND_REQUIEREDPS, 
						N_IND_REQUIEREEXAMEN,
						N_ID_RESULTADODPS,
						N_ID_RESULTADOIMC,
						N_ID_RESULTADOEDAD, 
						N_IND_RECARGOAUTO,
						N_POR_RECARGOIMC,
						N_ID_DETEVALUACIONDPSPLAN,
						C_OBS_DESCRIPTIVO,
						N_IND_ACTIVO,
						N_ID_ESTADO,
						C_COD_USUCREACION,
						D_FEC_CREACION,
						N_NUM_CIGARROS,
						N_ID_RESULTADOSA)
					VALUES
					(	@v_id_tercero, 
						@pi_id_suscripcion, 
						@pi_id_rolTercero,
						@pi_id_tipoasegurado, 
						@pi_fec_nacimiento, 
						@pi_correo,  
						@pi_celular, 
						@pi_telefono, 
						@pi_id_ubigeoDepartamento, 
						@pi_id_ubigeoProvincia, 
						@pi_id_ubigeoDistrito,
						@pi_id_tipoVia, 
						@pi_des_direccion, 
						@pi_val_numVia, 
						@pi_peso, 
						@pi_talla, 
						@pi_profesion, 
						@pi_actividad, 
						@pi_seniaparticular,	
						@pi_ind_requieredps, 
						@v_ind_requiereexamen, 
						@pi_id_resultadodps, 
						@pi_id_resultadoimc, 
						@pi_id_resultadoedad,	
						@pi_ind_recargo, 
						@pi_por_imcrecargo, 
						@pi_id_detevaluaciondpslan,
						@pi_obs_descriptivo, 
						@v_ind_Activo, 
						@pi_id_estado, 
						@pi_cod_usuCreacion,
						GETDATE(),
						@pi_num_cigarros,
						@pi_id_resultadosumaasegurada)
			  END

			  SET @v_id_detRolTerceroSuscrip = SCOPE_IDENTITY()

		SELECT @v_id_tercero AS N_ID_TERCERO, @v_id_detRolTerceroSuscrip AS N_ID_DETROLTERCEROSUSCRIPCION , '' AS ERROR
	END

END TRY

BEGIN CATCH	

	DECLARE @NERROR INT
	DECLARE @ERROR VARCHAR(2000)
	DECLARE @Linea VARCHAR(2000)
	SET @NERROR = ERROR_NUMBER()
	SET @ERROR=ERROR_MESSAGE()
	SET @Linea=ERROR_LINE()
	SET @ERROR=@ERROR+', LINEA: '+@Linea

	EXECUTE SPI_T_MaeLog 'SPI_T_MaeTerceroSuscripcion', @NERROR, @ERROR, @pi_cod_usuCreacion;
	
	SELECT 0 AS N_ID_TERCERO
END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[SPI_T_MultiriesgoPyme]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPI_T_MultiriesgoPyme]
	@idTipoDocIdentidad					SMALLINT = 0,
	@numDocIdentidad					VARCHAR(20) = '',
	@primerNombre						VARCHAR(100) = '',
	@segundoNombre						VARCHAR(100) = '',
	@apellidoPaterno					VARCHAR(100) = '',
	@apellidoMaterno					VARCHAR(100) = '',
	@fechaNacimiento					VARCHAR(20) = '',
	@idTipoGenero						SMALLINT = 0,
	@idTipoEstadoCivil					SMALLINT = 0,
	@idActividadEconomica				SMALLINT = 0,
	
	@correo								VARCHAR(100) = '',
	@telefono							VARCHAR(20) = '',
	@celular							VARCHAR(20) = '',


	@idDepartamento						SMALLINT = 0,
	@idProvincia						SMALLINT = 0,
	@idDistrito							SMALLINT = 0,
	@idTipoVia							SMALLINT = 0,
	@nombreVia							VARCHAR(100) = '',
	@idTipoNumero						SMALLINT = 0,
	@nombreNumero						VARCHAR(100) = '',
	@idTipoInterior						SMALLINT = 0,
	@nombreInterior						VARCHAR(100) = '',
	@idTipoUrbanizacion					SMALLINT = 0,
	@nombreUrbanizacion					VARCHAR(100) = '',
	@direccion				VARCHAR(200) = '',

	@idDepartamentoRiesg					SMALLINT = 0,
	@idProvinciaRiesg						SMALLINT = 0,
	@idDistritoRiesg						SMALLINT = 0,
	@idTipoViaRiesg							SMALLINT = 0,
	@nombreViaRiesg							VARCHAR(100) = '',
	@idTipoNumeroRiesg						SMALLINT = 0,
	@nombreNumeroRiesg						VARCHAR(100) = '',
	@anioContr								SMALLINT = 0,
	@idTipoUsoEdif							SMALLINT = 0,
	@idTipoMaterialEdif						SMALLINT = 0,
	@pisosEdif								SMALLINT = 0,
	@sotanosEdif							SMALLINT = 0,
	@direccionRiesgo							VARCHAR(100) = '',
	@sumaAsegurada							NUMERIC(16,6) = 0,
									--VARCHAR(100) = '',
	@bienesPropios							VARCHAR(100) = '',
	@existenciaPropias						VARCHAR(100) = '',

	
	@idTipoMoneda						SMALLINT = 0,
	@idTipoMedioPago					SMALLINT = 0,
	@idTipoPago							SMALLINT = 0,	
	@nroCuotas							SMALLINT = 0,
	@fechaInicioVigencia				VARCHAR(10),
	--@saldoCapital						NUMERIC(16,6) = 0,

	@idTarifaBase						SMALLINT = 0,
	@idPlanEmision						SMALLINT = 0,
	@primaNeta							NUMERIC(16,6) = 0,
	@primaBruta							NUMERIC(16,6) = 0,
	@impuestos							NUMERIC(16,6) = 0,
	@derechoEmision						NUMERIC(16,6) = 0,
	@idPersonaVendedor					INT = 0,
	@idUsuarioEmisor					INT = 0,
	@idPoliza							INT = 0 OUTPUT,
	@idCertificado						INT = 0 OUTPUT
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE @idCotizacion				INT
	DECLARE @idCuota					INT
	DECLARE @idTercero					INT = 0
	DECLARE @nroPoliza					VARCHAR(20)
	DECLARE @nroCertificado				VARCHAR(20)
	DECLARE @idCanal					SMALLINT
	DECLARE @idEstablecimiento			SMALLINT
	DECLARE @codUsuCrea					VARCHAR(20)
	DECLARE @tasa						NUMERIC(16,6)
	DECLARE @hoy						DATETIME = GETDATE()
	DECLARE @fecVigenciaIni				DATETIME
	DECLARE @fecVigenciaFin				DATETIME
	DECLARE @idCia						SMALLINT
	DECLARE @codUbigeo					VARCHAR(10)
	DECLARE @codUbigeoRiesgo			VARCHAR(10)
	DECLARE @idPersonaEmisor			INT
	DECLARE @porcentajeComision			NUMERIC(16,6)

	--BEGIN TRANSACTION EMITIR_POLIZA_PYME
	BEGIN TRY
		
		SELECT
			@porcentajeComision = N_VAL_MONTO
		FROM T_DET_PLANCOMISION
		WHERE N_ID_PLAN = @idPlanEmision

		SELECT 
			@nroPoliza = C_VAL_POLIZA,
			@nroCertificado = C_VAL_SECPOLIZA
		FROM T_MAE_PLAN
		WHERE N_ID_PLAN = @idPlanEmision


		UPDATE T_MAE_PLAN SET C_VAL_SECPOLIZA = C_VAL_SECPOLIZA + 1 WHERE N_ID_PLAN = @idPlanEmision

		SELECT
			@codUbigeo = C_COD_UBIGEO
		FROM T_MAE_UBIGEO
		WHERE N_ID_UBIGEO = @idDistrito

		SELECT
			@codUbigeoRiesgo = C_COD_UBIGEO
		FROM T_MAE_UBIGEO
		WHERE N_ID_UBIGEO = @idDistritoRiesg

		SELECT
			@idCanal = TER.N_ID_ENTIDAD,
			@idEstablecimiento = PER.N_ID_ESTABLECIMIENTO
		FROM T_DET_PERSONA PER 
		INNER JOIN T_MAE_ZONAL PVTA ON PVTA.N_ID_ESTABLECIMIENTO = PER.N_ID_ESTABLECIMIENTO AND PVTA.N_ID_TIPOZONAL = 406
		INNER JOIN T_MAE_ZONAL REG ON PVTA.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND REG.N_ID_TIPOZONAL = 405
		INNER JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
		INNER JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
		WHERE PER.N_ID_PERSONA = @idPersonaVendedor

		SELECT
			@idCia = N_ID_ENTIDAD
		FROM T_MAE_PLAN PL
		INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO
		WHERE PL.N_ID_PLAN = @idPlanEmision

		SELECT
			@codUsuCrea = C_COD_USUARIO,
			@idPersonaEmisor = N_ID_PERSONA
		FROM T_MAE_USUARIO
		WHERE N_ID_USUARIO = @idUsuarioEmisor

		SELECT @tasa = N_MTO_VALOR 
		FROM T_DET_TARIFAPLANBASEVEHICULAR
		WHERE N_ID_PLAN = @idPlanEmision AND N_ID_ESTADO = 8 

		SET @fecVigenciaIni = CONVERT(date, @fechaInicioVigencia,103)-- @hoy
		SET @fecVigenciaFin = DATEADD(MM,@nroCuotas,@fecVigenciaIni)

		INSERT T_MAE_COTIZACION (			
			D_FEC_INIVIGENCIA,			
			D_FEC_FINVIGENCIA,	     
			N_ID_PLAN,
			N_ID_TIPOMONEDA,         
			N_ID_COMPSEGURO,					
			N_NUM_VALORCOMERCIAL,		
			N_NUM_IMPORTEDESCUENTOS,
			N_NUM_IMPORTERECARGADO,  
			N_NUM_IMPORTEDERECHOEMISION,		
			N_NUM_IMPORTEINTERESES,		
			N_NUM_IMPORTEIMPUESTO,
			N_NUM_PRIMABRUTA,        
			N_NUM_PRIMANETA,					
			D_FEC_COTIZACION,	
			N_IND_ACTIVO,            
			N_ID_ESTADO,          
			C_COD_USUCREACION,		 
			D_FEC_CREACION,    
			N_ID_TIPOTARIFACION)
		SELECT 
			 @fecVigenciaIni		
			,@fecVigenciaFin
			,@idPlanEmision
			,@idTipoMoneda
			,@idCia
			,@sumaAsegurada
			,0
			,0
			,@derechoEmision
			,0
			,@impuestos
			,@primaBruta
			,@primaNeta
			,@hoy
			,1
			,27
			,@codUsuCrea
			,@hoy
			,272

		SET @idCotizacion = SCOPE_IDENTITY()
		
		INSERT T_DET_PLANCOTIZACION (--CAMPOS VACIOS
			N_ID_COTIZACION,  
			N_ID_PLAN,  
			N_ID_TIPOMONEDA,   
			N_ID_COMPSEGURO,   
			N_NUM_VALORCOMERCIAL,
			N_NUM_IMPORTEDESCUENTOS,  
			N_NUM_IMPORTERECARGADO,	
			N_NUM_IMPORTEDERECHOEMISION,  
			N_NUM_IMPORTEINTERESES,  
			N_NUM_IMPORTEIMPUESTO,  
			N_NUM_PRIMABRUTA,  
			N_NUM_PRIMANETA,  
			N_IND_ACTIVO,  
			N_ID_ESTADO,  
			C_COD_USUCREACION,  
			D_FEC_CREACION)
		SELECT
			@idCotizacion
			,@idPlanEmision
			,@idTipoMoneda
			,@idCia
			,@sumaAsegurada
			,'0.00'
			,0
			,@derechoEmision
			,0
			,@impuestos
			,@primaBruta
			,@primaNeta
			,1
			,1
			,@codUsuCrea
			,@hoy

		INSERT T_MAE_POLIZA ( 
			N_ID_COTIZACION,
			N_ID_COMPSEGURO, 
			N_ID_PLAN,
			C_NUM_POLIZA,
			D_FEC_POLIZA,
			D_FEC_INIVIGENCIA,
			D_FEC_FINVIGENCIA,
			N_ID_TIPOMONEDA, 
			N_NUM_VALORCOMERCIAL, 
			N_NUM_PRIMABRUTA, 
			N_NUM_PRIMANETA, 
			N_ID_CANAL, 
			N_ID_ESTABLECIMIENTO, 
			N_ID_PEREMISOR, 
			N_ID_PERVENDEDOR, 
			N_IND_AUTOMATICO, 
			N_ID_ESTADOTRANSFERENCIA,
			C_OBS_DESCRIPTIVO,  		
			N_IND_ACTIVO, 
			N_ID_ESTADO, 
			NRO_UNICO_CARGA,
			C_COD_USUCREACION, 
			D_FEC_CREACION	)
		SELECT
			@idCotizacion
			,@idCia
			,@idPlanEmision
			,@nroPoliza		
			,@hoy
			,@fecVigenciaIni		
			,@fecVigenciaFin
			,@idTipoMoneda
			,@sumaAsegurada
			,@primaBruta
			,@primaNeta
			,@idCanal			
			,@idEstablecimiento	
			,@idPersonaEmisor
			,@idPersonaVendedor
			,0
			,12
			,''
			,1
			,15
			,NULL
			,@codUsuCrea
			,@hoy
		
		SET @idPoliza = SCOPE_IDENTITY()

		INSERT T_DET_COMPONENTEPLANPOLIZA (
			N_ID_COMPONENTE, 
			N_ID_PLAN, 
			N_ID_POLIZA, 
			N_ID_TIPOCOMPONENTE, 
			N_ID_TIPODETCOMPONE, 
			C_COD_COMPONENTE, 
			C_COD_REFERENCIA,
			C_DES_CORTACOMPONENTE,
			C_DES_LARGACOMPONENTE, 
			C_DES_ASEGURABLE, 
			N_MTO_ASEGURABLE, 
			N_IND_PRINCIPAL, 
			N_IND_OBLIGATORIO, 
			C_OBS_DESCRIPTIVO, 
			N_IND_ACTIVO, 
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		 SELECT 
			N_ID_COMPONENTE
			,N_ID_PLAN 
			,@idPoliza 
			,N_ID_TIPOCOMPONENTE
			,N_ID_TIPODETCOMPONE 
			,C_COD_COMPONENTE 
			,C_COD_REFERENCIA
			,C_DES_CORTACOMPONENTE 
			,C_DES_LARGACOMPONENTE 
			,C_DES_ASEGURABLE 
			,N_MTO_ASEGURABLE 
			,N_IND_PRINCIPAL
			,N_IND_OBLIGATORIO 
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO 
			,N_ID_ESTADO 
			,C_COD_USUCREACION
			,D_FEC_CREACION      
		 FROM T_DET_COMPONENTEPLAN
		 WHERE N_ID_PLAN = @idPlanEmision
		 AND N_ID_ESTADO	=8
		 AND N_IND_ACTIVO	=1
		
		DECLARE @nroSolicitud				VARCHAR(15)
		EXEC SPS_ObtenerNumeroSolicitud @CanalId = @idCanal, @nroSolicitud = @nroSolicitud OUTPUT


		INSERT T_MAE_CERTIFICADO ( --CAMPOS VACIOS
			N_ID_POLIZA
			,N_ID_COTIZACION
			,C_NUM_CERTIFICADO
			,D_FEC_CERTIFICADO
			,D_FEC_VENTA
			,D_FEC_INIVIGENCIA
			,D_FEC_FINVIGENCIA
			,N_ID_TIPOMONEDA
			,N_NUM_VALORCOMERCIAL
			,N_NUM_PRIMABRUTA
			,N_NUM_PRIMANETA
			,N_NUM_IMPORTEDERECHOEMISION
			,N_ID_CANAL
			,N_ID_ESTABLECIMIENTO
			,N_ID_PEREMISOR
			,N_ID_PERVENDEDOR
			,N_IND_OBSERVADO
			,N_ID_ESTADOTRANSFERENCIA
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,N_ID_SUSCRIPCION
			,D_FEC_DESEMBOLSO
			,C_NUM_CREDITO
			,N_VAL_TASA
			,N_NUM_IMPORTEDESCUENTOS
			,N_NUM_IMPORTERECARGADO
			,N_NUM_IMPORTEINTERESES
			,N_NUM_IMPORTEIMPUESTO
			,N_POR_RECARGO
			,C_MES_EMISION			
			,N_ID_MEDIOPAGO
			,N_ID_TIPOPAGO
			,N_NUM_POR_COM_CANAL
			,N_NUM_COM_CANAL
			,C_NUM_SOLICITUD)
		SELECT
			@idPoliza
			,@idCotizacion
			,right(REPLICATE('0',10) + CONVERT(VARCHAR(10),@nroCertificado),10)
			,@hoy
			,@hoy
			,@hoy
			,DATEADD(MM,@nroCuotas,@hoy)
			,@idTipoMoneda
			,@sumaAsegurada
			,@primaBruta
			,@primaNeta
			,@derechoEmision
			,@idCanal
			,@idEstablecimiento
			,@idPersonaEmisor	
			,@idPersonaVendedor	
			,0
			,12
			,''
			,1
			,15
			,@codUsuCrea
			,@hoy
			,NULL
			,@hoy
			,NULL
			,@tasa
			,NULL
			,0
			,NULL
			,@impuestos
			,0
			,SUBSTRING(CONVERT(varchar,@hoy,112),1,4) + '/' + SUBSTRING(CONVERT(varchar,@hoy,112),5,2)
			,@idTipoMedioPago
			,@idTipoPago
			,@porcentajeComision
			,@porcentajeComision*@primaBruta
			,@nroSolicitud
		
		SET @idCertificado = SCOPE_IDENTITY()
		
		INSERT T_DET_BITACORA_CERTIFICADO
			(N_ID_CERTIFICADO
			,N_ID_SECUENCIA
			,N_ID_MOTIVO
			,N_ID_MOVESTADO
			,N_ID_TIPOMONEDA
			,N_NUM_VALORCOMERCIAL
			,N_NUM_PRIMABRUTA
			,N_NUM_PRIMANETA
			,C_OBS_DESCRIPTIVO
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION)
		SELECT
			@idCertificado
			,1
			,15
			,15
			,@idTipoMoneda
			,@sumaAsegurada
			,@primaBruta
			,@primaNeta
			,'Se emitió la póliza de forma satisfactoria'
			,1
			,1
			,@codUsuCrea
			,@hoy
		
		INSERT T_DET_DATOPARTICULARCERTIFICADO
			(N_ID_CERTIFICADO
			,N_ID_TIPOMONEDA						--@idTipoMoneda
			,N_MTO_ASEGURABLE						--@saldoCapital
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION					
			,C_COD_UBIGEORIESGO
			,N_ID_TIPOVIA
			,C_DES_TIPOVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_NUM_ANIOFABRINMUEBLE
			,N_ID_TIPOUSOBIEN 
			,N_ID_TIPOMATERIALCONSTRUCCION
			,N_NUM_PISOS
			,N_NUM_SOTANOS
			,C_DES_DIRECCIONRIESGO			
			,C_VAL_BIENES
			,C_VAL_EXISTENCIAS
			,C_DES_DETALLECONTENIDO
			)
		SELECT
			@idCertificado
			,@idTipoMoneda
			,@sumaAsegurada
			,1
			,1
			,@codUsuCrea
			,@hoy
			,@codUbigeoRiesgo
			,@idTipoViaRiesg
			,@nombreViaRiesg
			,@idTipoNumeroRiesg
			,@nombreNumeroRiesg
			,@anioContr
			,@idTipoUsoEdif
			,@idTipoMaterialEdif	
			,@pisosEdif
			,@sotanosEdif
			,@direccionRiesgo			
			,@bienesPropios
			,@existenciaPropias
			,@direccionRiesgo
		
		SET @idTercero = (SELECT N_ID_TERCERO FROM T_MAE_TERCERO WHERE N_ID_TIPOIDENTIDAD = @idTipoDocIdentidad AND C_VAL_NUMIDENTIDAD = @numDocIdentidad
		and N_IND_ACTIVO = 1 and N_ID_ESTADO = 8)

		IF (@idTercero)>0
		BEGIN
			UPDATE T_MAE_TERCERO SET
				C_APE_PATERNO				= UPPER(@apellidoPaterno),	
				C_APE_MATERNO				= UPPER(@apellidoMaterno),	
				C_NOM_TERCERO				= UPPER(@primerNombre),
				C_NOM_SEGUNDO_NOMBRE		= UPPER(@segundoNombre),
				C_NOM_COMPLETO				= @primerNombre + ' ' + @segundoNombre + ' ' + @apellidoPaterno + ' ' + @apellidoMaterno,
				N_ID_ESTADOCIVIL			= @idTipoEstadoCivil,	
				N_ID_TIPOGENERO				= @idTipoGenero,	
				N_ID_ACTIVIDAD				= @idActividadEconomica,
				C_DIR_CORREO				= @correo,	
				C_VAL_TELEFONO				= @telefono,
				C_VAL_CELULAR				= @celular,		
				N_ID_UBIGEODEPARTAMENTO		= @idDepartamento,		
				N_ID_UBIGEOPROVINCIA		= @idProvincia,		
				N_ID_UBIGEODISTRITO			= @idDistrito,		
				N_ID_TIPOVIA				= @idTipoVia,
				C_VAL_NUMVIA				= @nombreVia,
				N_ID_TIPOINTERIOR			= @idTipoInterior,
				C_NOM_INTERIOR				= @nombreInterior,
				N_ID_TIPONUMERO				= @idTipoNumero,
				C_NOM_NUMERO				= @nombreNumero,
				N_ID_TIPOURBANIZACION		= @idTipoUrbanizacion,
				C_NOM_URBANIZACION			= @nombreUrbanizacion,
				C_DES_DIRECCIONREFERENCIA	= @direccion
			WHERE N_ID_TERCERO = @idTercero			
		END
		ELSE
		BEGIN		
			INSERT T_MAE_TERCERO 
				(N_ID_TIPOIDENTIDAD
				,C_VAL_NUMIDENTIDAD
				,C_APE_PATERNO
				,C_APE_MATERNO
				,C_NOM_TERCERO
				,C_NOM_SEGUNDO_NOMBRE
				,C_NOM_COMPLETO
				,D_FEC_NACIMIENTO
				,N_ID_ESTADOCIVIL
				,N_ID_TIPOGENERO
				,N_ID_ACTIVIDAD		
				,C_DIR_CORREO			
				,C_VAL_TELEFONO			
				,C_VAL_CELULAR			
				,N_ID_UBIGEODEPARTAMENTO	
				,N_ID_UBIGEOPROVINCIA	
				,N_ID_UBIGEODISTRITO		
				,N_ID_TIPOVIA			
				,C_VAL_NUMVIA
				,N_ID_TIPONUMERO
				,C_NOM_NUMERO
				,N_ID_TIPOINTERIOR		
				,C_NOM_INTERIOR			
				,N_ID_TIPOURBANIZACION	
				,C_NOM_URBANIZACION
				,C_DES_DIRECCIONREFERENCIA
				,N_IND_ACTIVO
				,N_ID_ESTADO
				,C_COD_USUCREACION
				,D_FEC_CREACION
				)
			SELECT
				@idTipoDocIdentidad,
				@numDocIdentidad,
				UPPER(@apellidoPaterno),	
				UPPER(@apellidoMaterno),	
				UPPER(@primerNombre),
				UPPER(@segundoNombre),
				@primerNombre + ' ' + @segundoNombre + ' ' + @apellidoPaterno + ' '+ @apellidoMaterno,
				CONVERT(DATE,@fechaNacimiento,103),
				@idTipoEstadoCivil,
				@idTipoGenero,	
				@idActividadEconomica,
				@correo,	
				@telefono,
				@celular,		
				@idDepartamento,		
				@idProvincia,		
				@idDistrito,		
				@idTipoVia,
				@nombreVia,
				@idTipoNumero,
				@nombreNumero,
				@idTipoInterior,
				@nombreInterior,
				@idTipoUrbanizacion,
				@nombreUrbanizacion,
				@direccion,
				1,
				8,@codUsuCrea,GETDATE()
			SET @idTercero = SCOPE_IDENTITY()
			
		END
		
		--CONTRATANTE EN COTIZACION 8 20113604248	Caja Piura
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO, 
			N_ID_COTIZACION, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			8
			,@idCotizacion
			,''
			,364
			,1
			,8
			,'admin'
			,@hoy

		--RESPONSABLE DE PAGO PARA COTIZACION
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO
			,N_ID_COTIZACION
			,C_DES_ROLTERCERO
			,N_ID_TIPOROLTERCERO
			,C_VAL_CELULAR
			,C_DIR_CORREO
			,C_VAL_TELEFONO
			,N_ID_UBIGEODEPARTAMENTO
			,N_ID_UBIGEOPROVINCIA
			,N_ID_UBIGEODISTRITO
			,N_ID_TIPOVIA			
			,C_VAL_NUMVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_ID_TIPOINTERIOR		
			,C_NOM_INTERIOR			
			,N_ID_TIPOURBANIZACION	
			,C_NOM_URBANIZACION,		
			C_DES_DIRECCION		
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,C_COD_UBIGEODIRECCION)
		SELECT 
			@idTercero
			,@idCotizacion
			,''
			,366
			,@celular
			,@correo
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito,		
			@idTipoVia,
			@nombreVia,
			@idTipoNumero,
			@nombreNumero,
			@idTipoInterior,
			@nombreInterior,
			@idTipoUrbanizacion,
			@nombreUrbanizacion,
			@direccion
			,1
			,8
			,@codUsuCrea
			,@hoy
			,@codUbigeo			
		
		--ASEGURADO PARA COTIZACION
		INSERT T_DET_ROLTERCEROCOTIZACION
			(N_ID_TERCERO
			,N_ID_COTIZACION
			,C_DES_ROLTERCERO
			,N_ID_TIPOROLTERCERO
			,C_VAL_CELULAR
			,C_DIR_CORREO
			,C_VAL_TELEFONO
			,N_ID_UBIGEODEPARTAMENTO
			,N_ID_UBIGEOPROVINCIA
			,N_ID_UBIGEODISTRITO,
			 N_ID_TIPOVIA			
			,C_VAL_NUMVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_ID_TIPOINTERIOR		
			,C_NOM_INTERIOR			
			,N_ID_TIPOURBANIZACION	
			,C_NOM_URBANIZACION,		
			C_DES_DIRECCION		
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_COD_USUCREACION
			,D_FEC_CREACION
			,C_COD_UBIGEODIRECCION)
		SELECT 
			@idTercero
			,@idCotizacion
			,''
			,365
			,@celular
			,@correo
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito,		
			@idTipoVia,
			@nombreVia,
			@idTipoNumero,
			@nombreNumero,
			@idTipoInterior,
			@nombreInterior,
			@idTipoUrbanizacion,
			@nombreUrbanizacion,
			@direccion
			,1
			,8
			,@codUsuCrea
			,@hoy
			,@codUbigeo
		PRINT '1'
		--CONTRATANTE EN CERTIFICADO 8 20113604248	Caja Piura
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			8
			,@idCertificado
			,''
			,364
			,1
			,8
			,'admin'
			,@hoy

			PRINT '@nombreVia'
		PRINT @nombreVia
		--SE REGISTRA EL RESPONSABLE DE PAGO
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO, 
			N_ID_TIPOASEGURADO, 
			C_DIR_CORREO,  
			C_VAL_CELULAR, 
			C_VAL_TELEFONO, 
			N_ID_UBIGEODEPARTAMENTO, 
			N_ID_UBIGEOPROVINCIA, 
			N_ID_UBIGEODISTRITO,
			N_ID_TIPOVIA			
			,C_VAL_NUMVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_ID_TIPOINTERIOR		
			,C_NOM_INTERIOR
			,N_ID_TIPOURBANIZACION	
			,C_NOM_URBANIZACION,		
			C_DES_DIRECCION,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			@idTercero
			, @idCertificado
			,''
			,366
			,NULL
			,@correo
			,@celular			
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito,
			@idTipoVia,
			@nombreVia,
			@idTipoNumero,
			@nombreNumero,
			@idTipoInterior,
			@nombreInterior,
			@idTipoUrbanizacion,
			@nombreUrbanizacion,
			@direccion,
			1
			,8
			,@codUsuCrea
			,@hoy
			PRINT '2'
		--SE REGISTRA EL ASEGURADO
		INSERT T_DET_ROLTERCEROCERTIFICADO
			(N_ID_TERCERO, 
			N_ID_CERTIFICADO, 
			C_DES_ROLTERCERO, 
			N_ID_TIPOROLTERCERO, 
			N_ID_TIPOASEGURADO, 
			C_DIR_CORREO,  
			C_VAL_CELULAR, 
			C_VAL_TELEFONO, 
			N_ID_UBIGEODEPARTAMENTO, 
			N_ID_UBIGEOPROVINCIA, 
			N_ID_UBIGEODISTRITO,
			N_ID_TIPOVIA			
			,C_VAL_NUMVIA
			,N_ID_TIPONUMERO
			,C_NOM_NUMERO
			,N_ID_TIPOINTERIOR		
			,C_NOM_INTERIOR			
			,N_ID_TIPOURBANIZACION	
			,C_NOM_URBANIZACION,		
			C_DES_DIRECCION,
			N_IND_ACTIVO,
			N_ID_ESTADO, 
			C_COD_USUCREACION, 
			D_FEC_CREACION)
		SELECT
			@idTercero
			, @idCertificado
			,''
			,365
			,NULL
			,@correo
			,@celular			
			,@telefono
			,@idDepartamento	
			,@idProvincia	
			,@idDistrito,
			@idTipoVia,
			@nombreVia,
			@idTipoNumero,
			@nombreNumero,
			@idTipoInterior,
			@nombreInterior,
			@idTipoUrbanizacion,
			@nombreUrbanizacion,
			@direccion
			,1
			,8
			,@codUsuCrea
			,@hoy
		
		INSERT T_MAE_CUOTA (
			N_ID_CERTIFICADO
			,N_ID_POLIZA
			,N_NUM_CUOTA
			,D_FEC_VENCIMIENTO
			,D_FEC_INIVIGENCIA
			,D_FEC_FINVIGENCIA
			,N_ID_ESTADO
			,N_ID_TIPOMONEDA_CUOTA
			,N_NUM_PRIMANETA
			,N_NUM_MONTOCUOTA
			,N_IND_ACTIVO
			,D_FEC_CREACION
			,N_NUM_POR_COM_CANAL
			,N_NUM_COM_CANAL
		)
		SELECT
			@idCertificado
			,@idPoliza
			,1
			,@hoy
			,@hoy
			,DATEADD(MM,1,@hoy)
			,54
			,@idTipoMoneda
			,@primaNeta
			,@primaBruta
			,1
			,@hoy
			,@porcentajeComision
			,@porcentajeComision*@primaBruta
			
		SET @idCuota = SCOPE_IDENTITY()	
		
		INSERT T_DET_BITACORA_CUOTA(
			N_ID_CUOTA
			,N_ID_SECUENCIA
			,N_ID_TIPO_MOVIMIENTO
			,C_TIPO_MOVIMIENTO
			,N_ID_MOTIVO
			,N_ID_MOVESTADO
			,N_ID_TIPOMONEDA
			,N_NUM_PRIMATOTAL
			,N_IND_ACTIVO
			,N_ID_ESTADO
			,C_OBS_DESCRIPTIVO
			,D_FEC_CREACION
		)
		SELECT
			@idCuota
			,1
			,583
			,'Pendiente'
			,NULL
			,NULL
			,@idTipoMoneda
			,@primaBruta
			,1
			,54
			,'Se registro la cuota'
			,@hoy

	--COMMIT TRANSACTION EMITIR_POLIZA_PYME
	END TRY	
	BEGIN CATCH
	--	ROLLBACK TRANSACTION EMITIR_POLIZA_PYME
		DECLARE @ERROR VARCHAR(2000)
		DECLARE @Linea VARCHAR(2000)
		SET @ERROR=ERROR_MESSAGE()
		SET @Linea=ERROR_LINE()
		SET @ERROR=@ERROR+''+@Linea

		SET @idPoliza		 = 0
		SET @idCertificado	 = 0

		EXEC SPI_T_MaeLog 'SPI_T_MultiriesgoPyme',0, @ERROR, 0
		Print 'Error en el store de emisión =>' +@ERROR
	END CATCH

	SET NOCOUNT OFF
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeAprobacionRechazo]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_MaeAprobacionRechazo 2074
--EXEC SPS_T_MaeAprobacionRechazo 2077
--EXEC SPS_T_MaeAprobacionRechazo 2080
CREATE PROCEDURE [dbo].[SPS_T_MaeAprobacionRechazo](
	@pi_id_certificado int = 0
)
AS
BEGIN

SELECT
    CER.N_ID_POLIZA,
    POL.C_NUM_POLIZA,
    CER.N_ID_CERTIFICADO,
    CASE WHEN PRO.C_COD_PRODUCTO = '16' THEN 'No Aplica' ELSE CER.C_NUM_CERTIFICADO END AS C_NUM_CERTIFICADO,
    ENTI.N_ID_ENTIDAD,
    ENTI.C_NOM_ENTIDAD,
    PLA.N_ID_RAMO,
    TRAM.N_ID_TIPO AS N_ID_TIPORAMO,
    TRAM.C_DES_TIPO AS DES_RAMO,
    PLA.N_ID_PRODUCTO,
    PRO.C_DES_PRODUCTO,
    PRO.C_COD_PRODUCTO,
    PLA.N_ID_PLAN,
    PLA.C_COD_PLAN,
    PLA.C_DES_CORTAPLAN,
    PLA.C_DES_LARGAPLAN,
    PLA.N_ID_TIPOMONEDA,
    PLA.N_ID_TIPOPLAN,
    CONVERT(CHAR(10), CER.D_FEC_CERTIFICADO, 103) AS D_FEC_CERTIFICADO,
    CONVERT(CHAR(10), CER.D_FEC_INIVIGENCIA, 103) AS D_FEC_INIVIGENCIA,
    CONVERT(CHAR(10), CER.D_FEC_FINVIGENCIA, 103) AS D_FEC_FINVIGENCIA,
    CONVERT(CHAR(10), CER.D_FEC_VENTA, 103) AS D_FEC_VENTA,
    CER.C_NUM_SOLICITUD,
    CER.N_NUM_VALORCOMERCIAL,
    CER.N_NUM_PRIMABRUTA,
    FORMAT(CER.N_NUM_PRIMABRUTA, 'N', 'es-PE') AS N_NUM_PRIMABRUTA_CER,
    CER.N_NUM_PRIMANETA,
    CER.N_NUM_IMPORTEDERECHOEMISION,
    CER.N_NUM_IMPORTEIMPUESTO,
    TMON.C_DES_TIPO AS C_DES_TIPOMONEDA,
    TMON.C_ABR_TIPO AS C_ABR_TIPOMONEDA,
    CER.N_ID_ESTADO,
    EST.C_DES_ESTADO,
    CER.D_FEC_CREACION,
    CONVERT(CHAR(10), CER.D_FEC_CREACION, 103) AS D_FEC_REGISTRO,
    CER.C_NUM_CERTIFICADO AS C_NUM_CREDITO,
    TRD.C_DES_ESTADO AS DES_DPS,
    TRI.C_DES_ESTADO AS DES_IMC,
    TRE.C_DES_ESTADO AS DES_EDAD,
    TRS.C_DES_ESTADO AS DES_SA,
    (SELECT STRING_AGG(
        'EVALUACIÓN DE ' + 
        CASE 
            WHEN Observaciones.TipoObservacion = 'DPS' THEN 'DPS DEL ' 
            WHEN Observaciones.TipoObservacion = 'SA' THEN 'MONTO ASEGURADO DEL ' 
            WHEN Observaciones.TipoObservacion = 'EDAD' THEN 'EDAD DEL ' 
            WHEN Observaciones.TipoObservacion = 'IMC' THEN 'IMC DEL ' 
        END + 
        CASE 
            WHEN Observaciones.N_ID_TIPOASEGURADO = 640 THEN 'TITULAR' 
            WHEN Observaciones.N_ID_TIPOASEGURADO = 641 THEN 'CÓNYUGE' 
        END + 
        ' ESTA ' + UPPER(Observaciones.C_DES_ESTADO), ', ') 
     WITHIN GROUP (ORDER BY 
        CASE 
            WHEN Observaciones.N_ID_TIPOASEGURADO = 640 THEN 1 
            WHEN Observaciones.N_ID_TIPOASEGURADO = 641 THEN 2 
        END)
     FROM (
        SELECT ROL.N_ID_TIPOASEGURADO, 'DPS' AS TipoObservacion, TRD.C_DES_ESTADO
        FROM T_DET_ROLTERCEROSUSCRIPCION ROL
        LEFT JOIN T_MAE_ESTADO TRD ON TRD.N_ID_ESTADO = ROL.N_ID_RESULTADODPS
        WHERE ROL.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
        --AND SUS.N_ID_RESULTADODPS = 7
        AND ROL.N_ID_TIPOASEGURADO IN (640, 641)
        UNION ALL
        SELECT ROL.N_ID_TIPOASEGURADO, 'SA' AS TipoObservacion, TRS.C_DES_ESTADO
        FROM T_DET_ROLTERCEROSUSCRIPCION ROL
        LEFT JOIN T_MAE_ESTADO TRS ON TRS.N_ID_ESTADO = ROL.N_ID_RESULTADOSA
        WHERE ROL.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
         --AND SUS.N_ID_RESULTADOSA = 7 
        AND ROL.N_ID_TIPOASEGURADO IN (640, 641)
        UNION ALL
        SELECT ROL.N_ID_TIPOASEGURADO, 'EDAD' AS TipoObservacion, TRE.C_DES_ESTADO
        FROM T_DET_ROLTERCEROSUSCRIPCION ROL
        LEFT JOIN T_MAE_ESTADO TRE ON TRE.N_ID_ESTADO = ROL.N_ID_RESULTADOEDAD
        WHERE ROL.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		--AND SUS.N_ID_RESULTADOEDAD = 7 
        AND ROL.N_ID_TIPOASEGURADO IN (640, 641)
        UNION ALL
        SELECT ROL.N_ID_TIPOASEGURADO, 'IMC' AS TipoObservacion, TRI.C_DES_ESTADO
        FROM T_DET_ROLTERCEROSUSCRIPCION ROL
        LEFT JOIN T_MAE_ESTADO TRI ON TRI.N_ID_ESTADO = ROL.N_ID_RESULTADOIMC
        WHERE ROL.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		--AND SUS.N_ID_RESULTADOIMC = 7 
        AND ROL.N_ID_TIPOASEGURADO IN (640, 641)
     ) AS Observaciones
	 WHERE Observaciones.C_DES_ESTADO = 'Observado'  
    ) AS Evaluacion,
	  SUS.POL_HIBRIDO, 
	  SUS.ID_POL_HIBRIDO 
FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
INNER JOIN T_MAE_POLIZA POL WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
INNER JOIN T_MAE_PLAN AS PLA WITH(NOLOCK) ON PLA.N_ID_PLAN = POL.N_ID_PLAN
INNER JOIN T_MAE_ESTADO AS EST WITH(NOLOCK) ON EST.N_ID_ESTADO = CER.N_ID_ESTADO
INNER JOIN T_MAE_RAMO AS RAM WITH(NOLOCK) ON RAM.N_ID_RAMO = PLA.N_ID_RAMO
INNER JOIN T_MAE_PRODUCTO AS PRO WITH(NOLOCK) ON PRO.N_ID_PRODUCTO = PLA.N_ID_PRODUCTO
INNER JOIN T_MAE_ENTIDAD ENTI WITH(NOLOCK) ON ENTI.N_ID_ENTIDAD = PRO.N_ID_ENTIDAD
INNER JOIN T_MAE_TIPO TMON WITH(NOLOCK) ON TMON.N_ID_TIPO = PLA.N_ID_TIPOMONEDA
INNER JOIN T_MAE_TIPO TRAM WITH(NOLOCK) ON TRAM.N_ID_TIPO = RAM.N_ID_TIPORAMO
LEFT JOIN T_DET_DATOPARTICULARCERTIFICADO DPCER WITH(NOLOCK) ON DPCER.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO
INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION 
LEFT JOIN T_MAE_ESTADO TRD WITH(NOLOCK) ON TRD.N_ID_ESTADO = SUS.N_ID_RESULTADODPS
LEFT JOIN T_MAE_ESTADO TRI WITH(NOLOCK) ON TRI.N_ID_ESTADO = SUS.N_ID_RESULTADOIMC
LEFT JOIN T_MAE_ESTADO TRE WITH(NOLOCK) ON TRE.N_ID_ESTADO = SUS.N_ID_RESULTADOEDAD
LEFT JOIN T_MAE_ESTADO TRS WITH(NOLOCK) ON TRS.N_ID_ESTADO = SUS.N_ID_RESULTADOSA
WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
AND CER.N_IND_ACTIVO = 1;

END;


GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	Emisión
Objetivo 		:	Validar el cuestionario de una suscripción
Elaborado por	:	P & P BMS
Fecha Creación 	:   23/08/2024

EXEC SPS_T_MaeEvaluacionDPSValidarSuscripcion 1,3,220, 50000.0, '01/01/1990', 70.0, 1.77 
EXEC SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura 39,5,220, 30000.0, '01/01/1960', 70.0, 1.77 
EXEC SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura 36,5,219, 550000.0, '17/05/1966', 60.0, 1.71 
EXEC SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura 33,5,219, 850000.0, '05/05/1957', 60.0, 1.60 
EXEC SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura 33,5,219, 850000.0, '07/08/1955', 60.0, 1.60 
*************************************************************************************/
CREATE PROCEDURE [dbo].[SPS_T_MaeEvaluacionDPSValidarSuscripcion_CajaPiura](
	@pi_id_plan				INT,
	@pi_id_compania			INT=0,
	@pi_id_tipomoneda		INT=0,
	@pi_num_suma			DECIMAL(18,4)=0,
	@pi_nacimiento			CHAR(10)='',
	@pi_peso				DECIMAL(18,2)=0,
	@pi_talla				DECIMAL(18,2)=0,
	@pi_tipoGenero			INT=0
)
AS
BEGIN
	SET NOCOUNT ON 
	SET DATEFORMAT DMY

    DECLARE @v_indice SMALLINT,
			@v_totalRegistro SMALLINT,	   
			@v_fechaActual DATETIME,
			@v_id_entidad INT=0,
			@v_id_producto INT=0,
			@v_edad INT=0,
			@v_id_detevaluaciondpsplan INT=0,
			@v_id_tipomoneda SMALLINT=0,
			@v_id_ctrlTecnico INT=0,
			@v_val_ctrlTecnicoMin DECIMAL(18,2) = 0,
			@v_val_ctrlTecnicoMax DECIMAL(18,2) = 0,
			@v_num_sumaaseguradaminima DECIMAL(18,2) = 0,
			@v_num_sumaaseguradamaxima DECIMAL(18,2) = 0,
			@v_num_sumaminima DECIMAL(18,2) = 0,
			@v_num_sumamaxima DECIMAL(18,2) = 0,
			@v_num_edadminima INT=0,
			@v_num_edadmaxima INT=0,
			@v_num_imcminima DECIMAL(18,2)=0,
			@v_num_imcmaxima DECIMAL(18,2)=0,
			@v_num_imcedadminima INT=0,
			@v_num_imcedadmaxima INT=0,
			@v_ind_imcrecargo INT=0,
			@v_val_imcrecargo DECIMAL(18,2)=0,
			@v_id_tiporesultadoimc SMALLINT=0,
			@v_val_imc DECIMAL(18,2)=0,
			@v_ind_requieredps SMALLINT=0,
			@v_ind_requiereexamen SMALLINT=0,
			@v_ind_requiereimc SMALLINT=0,
			@v_ind_tipoasegurado SMALLINT=0,
			@v_ind_sumaaseguradaminima SMALLINT=2,
			@v_ind_sumaaseguradamaxima SMALLINT=2,
			@v_ind_sumaasegurada SMALLINT=1,
			@v_ind_edadminima SMALLINT=2,
			@v_ind_edadmaxima SMALLINT=2,
			@v_ind_edad SMALLINT=1,
			@v_ind_tiporesultadoimc SMALLINT=0,
			@v_ind_resultadodps SMALLINT=0

		SET @v_fechaActual = CONVERT(DATE,GETDATE(),103)	

		SELECT  @v_id_entidad = N_ID_ENTIDAD, 
				@v_id_producto = PL.N_ID_PRODUCTO,
				@v_num_sumaaseguradaminima = ISNULL(N_NUM_SUMAMIN, 0),	
				@v_num_sumaaseguradamaxima = ISNULL(N_NUM_SUMAMAX, 0)
		FROM T_MAE_PLAN PL INNER JOIN T_MAE_PRODUCTO PR 
		ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO
		WHERE PL.N_ID_PLAN = @pi_id_plan
							
		SELECT @v_edad = (0 + Convert(Char(10),@v_fechaActual,112) - Convert(Char(10),CONVERT(DATE,@pi_nacimiento,103),112)) / 10000


		--Evaluacion EDAD------------------------------------

	    SELECT  @v_id_ctrlTecnico = ISNULL(N_ID_CTRLTECNICO,0), 
				@v_val_ctrlTecnicoMin = ISNULL(N_VAL_CTRLTECNICO,0)
	    FROM T_DET_PRODUCTOCTRLTECNICO 
		WHERE N_ID_PRODUCTO= @v_id_producto
		  AND N_ID_CTRLTECNICO = 10 

	    IF @v_id_ctrlTecnico=10 -- Edad mínima del asegurado
	        BEGIN					
				IF  @v_edad >= @v_val_ctrlTecnicoMin
					SET @v_ind_edadminima = 1
				ELSE
					SET @v_ind_edadminima = 0
			END

	    SELECT  @v_id_ctrlTecnico = ISNULL(N_ID_CTRLTECNICO,0), 
				@v_val_ctrlTecnicoMax = ISNULL(N_VAL_CTRLTECNICO,0)
	    FROM T_DET_PRODUCTOCTRLTECNICO 
		WHERE N_ID_PRODUCTO= @v_id_producto
		  AND N_ID_CTRLTECNICO = 11 

	    IF @v_id_ctrlTecnico = 11 -- Edad máxima del asegurado
	        BEGIN										
				IF @v_edad < @v_val_ctrlTecnicoMax
					SET @v_ind_edadmaxima = 1
				ELSE
					SET @v_ind_edadmaxima = 0
			END

		IF (@v_ind_edadminima = 0 OR @v_ind_edadmaxima = 0)
			BEGIN
				SET @v_ind_edad = 0
			END


		--Evaluacion SUMA------------------------------------
		
		IF (@v_num_sumaaseguradaminima > 0)
			BEGIN
				IF (@v_num_sumaaseguradaminima <= @pi_num_suma)
					SET @v_ind_sumaaseguradaminima = 1
				ELSE
					SET @v_ind_sumaaseguradaminima = 0
			END

		IF (@v_num_sumaaseguradamaxima > 0)
			BEGIN
				IF (@v_num_sumaaseguradamaxima >= @pi_num_suma)
					SET @v_ind_sumaaseguradamaxima = 1
				ELSE
					SET @v_ind_sumaaseguradamaxima = 0
			END
		
		IF (@v_ind_sumaaseguradaminima = 0 OR @v_ind_sumaaseguradamaxima = 0)
			BEGIN
				SET @v_ind_sumaasegurada = 2 
			END
		

		--Evaluacion IMC------------------------------------

		SELECT  @v_num_imcminima = IMC_MIN,
				@v_num_imcmaxima = IMC_MAX
		FROM T_DET_EVALUACIONIMC 
		WHERE N_ID_TIPOGENERO = @pi_tipoGenero 
		  and ESTATURA = @pi_talla
		  and N_ID_ENTIDAD = @v_id_entidad
		  and N_ID_ESTADO = 8

		IF @pi_peso >= @v_num_imcminima AND @pi_peso <= @v_num_imcmaxima
			BEGIN
				SET @v_ind_tiporesultadoimc = 1
			END
		ELSE
			BEGIN
				SET @v_ind_tiporesultadoimc = 0
			END

		--Evaluacion DPS------------------------------------
		
		SELECT TOP 1 
				@v_id_detevaluaciondpsplan = DEDPS.N_ID_DETEVALUACIONDPSPLAN, 
				@v_id_tipomoneda = DEDPS.N_ID_TIPOMONEDA, 
				@v_num_sumaminima = DEDPS.N_NUM_SUMAMIN, 
				@v_num_sumamaxima = DEDPS.N_NUM_SUMAMAX, 
				@v_num_edadminima = DEDPS.N_NUM_EDADMIN, 
				@v_num_edadmaxima = DEDPS.N_NUM_EDADMAX,
				@v_ind_requieredps = ISNULL(DEDPS.N_IND_REQUIEREDPS, 0), 
				@v_ind_resultadodps = (CASE WHEN ISNULL(DEDPS.N_IND_REQUIEREDPS, 0) = 0 THEN 1 ELSE 0 END), 
				@v_ind_requiereexamen = ISNULL(DEDPS.N_IND_REQUIEREEXAMEN, 0),
				@v_ind_tipoasegurado = (SELECT COUNT(TASE.N_ID_DETTIPOASEGURADOPLAN)
										FROM T_DET_TIPOASEGURADOPLAN TASE
										WHERE TASE.N_ID_PLAN = DEDPS.N_ID_PLAN
										  AND TASE.N_ID_ESTADO != 9
										  AND TASE.N_IND_ACTIVO = 1)
		FROM T_DET_EVALUACIONDPSPLAN DEDPS WITH(NOLOCK)
		WHERE DEDPS.N_ID_PLAN = @pi_id_plan
		  AND DEDPS.N_ID_TIPOMONEDA = @pi_id_tipomoneda
		  AND @pi_num_suma BETWEEN DEDPS.N_NUM_SUMAMIN AND DEDPS.N_NUM_SUMAMAX
		  AND @v_edad BETWEEN DEDPS.N_NUM_EDADMIN AND DEDPS.N_NUM_EDADMAX
		  AND DEDPS.N_ID_ESTADO = 8
		  AND DEDPS.N_IND_ACTIVO = 1


		IF ISNULL(@v_id_detevaluaciondpsplan, 0) = 0 AND @v_ind_sumaasegurada = 1
			SET @v_ind_sumaasegurada = 2

		IF @v_ind_requiereexamen=1  
			SET @v_ind_sumaasegurada = 0
		
		SELECT 
			ISNULL(@v_id_detevaluaciondpsplan, 0) AS N_ID_DETEVALUACIONDPSPLAN, 
			@v_id_tipomoneda AS N_ID_TIPOMONEDA,
			@v_num_sumaminima AS N_NUM_SUMAMINIMA, 
			@v_num_sumamaxima AS N_NUM_SUMAMAXIMA,
			@v_num_edadminima AS N_NUM_EDADMINIMA,
			@v_num_edadmaxima AS N_NUM_EDADMAXIMA,
			@v_ind_requieredps AS N_IND_REQUIEREDPS, 
			@v_ind_requiereexamen AS N_IND_REQUIEREEXAMEN,
			@v_ind_resultadodps AS N_IND_RESULTADODPS, 
			@v_ind_tipoasegurado AS N_IND_TIPOASEGURADO,
			@v_num_sumaaseguradaminima AS N_NUM_SUMAASEGURADAMINIMA,
			@v_num_sumaaseguradamaxima AS N_NUM_SUMAASEGURADAMAXIMA,
			@v_ind_sumaaseguradaminima AS N_IND_SUMAASEGURADAMINIMA,
			@v_ind_sumaaseguradamaxima AS N_IND_SUMAASEGURADAMAXIMA,
			@v_ind_sumaasegurada AS N_IND_SUMAASEGURADA, --aprobado o rechazado 
			@v_val_ctrlTecnicoMin AS N_NUM_EDADMINIMA,
			@v_val_ctrlTecnicoMax AS N_NUM_EDADMAXIMA,
			@v_ind_edadminima AS N_IND_EDADMINIMA,
			@v_ind_edadmaxima AS N_IND_EDADMAXIMA,
			@v_ind_edad AS N_IND_EDAD,
			@v_ind_requiereimc AS N_IND_REQUIEREIMC,
			@v_num_imcminima AS N_NUM_IMCMINIMA, 
			@v_num_imcmaxima AS N_NUM_IMCMAXIMA,
			@v_num_imcedadminima AS N_NUM_IMCEDADMINIMA, 
			@v_num_imcedadmaxima AS N_NUM_IMCEDADMAXIMA,
			@v_ind_imcrecargo AS N_IND_IMCRECARGO,
			@v_val_imcrecargo AS N_VAL_IMCRECARGO,
			@v_id_tiporesultadoimc AS N_ID_TIPORESULTADO,
			@v_ind_tiporesultadoimc AS N_IND_TIPORESULTADOIMC

END



GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepProduccion_new_v4]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE  [dbo].[SPS_T_RepProduccion_new_v4]( 
	@pi_id_poliza INT=0,
	@pi_id_cotizacion INT=0,
	@pi_id_producto INT=0,
	@pi_id_plan INT=0,
	@pi_id_entidad INT=0,
	@pi_id_tipoMoneda SMALLINT=0,
	@pi_id_tipoFormaPago SMALLINT=0,
	@pi_id_tipoMedioPago SMALLINT=0,
	@pi_id_tipoFecha SMALLINT=0,
	@pi_fec_iniVigencia VARCHAR(30)='',
	@pi_fec_finVigencia VARCHAR(30)='',
	@pi_id_estado SMALLINT=0,
	@pi_id_estadoTransferencia SMALLINT=0,
	@pi_id_tipoPersona SMALLINT=0,
	@pi_id_tipoIdentidad SMALLINT=0,
	@pi_val_docIdentidad VARCHAR(20)='',
	@pi_apellidos VARCHAR(100)='',
	@pi_nombres VARCHAR(300)='',
	@pi_id_territorio INT=0,
	@pi_id_zona INT=0,
	@pi_id_region INT=0,
	@pi_id_canal INT=0,
	@pi_id_establecimiento INT=0,
	@pi_num_placa VARCHAR(20)='',
	@pi_num_serie VARCHAR(50)='',
	@pi_num_motor VARCHAR(50)='',
	@pi_num_poliza VARCHAR(30)='',
	@pi_num_certificado VARCHAR(30)='',
	@pi_id_ramo INT=0,
	@pi_ind_orden INT=0,
	@pi_ind_orden2 INT=0,
	@pi_ind_orden3 INT=0,
	@pi_Pagina INT=0,
	@pi_RegxPag INT=0,
	@pi_id_usuario INT = 0, 
	@pi_num_credito VARCHAR(30)='',  --210624 //nro_unico_item
	@pi_id_certificado  INT=0
	
	)
AS
BEGIN 
	
	SET @pi_id_poliza = ISNULL(@pi_id_poliza,0)
	SET @pi_id_cotizacion = ISNULL(@pi_id_cotizacion,0)
	SET @pi_id_producto = ISNULL(@pi_id_producto,0)
	SET @pi_id_plan = ISNULL(@pi_id_plan,0)
	SET @pi_id_entidad = ISNULL(@pi_id_entidad,0)
	SET @pi_id_tipoMoneda = ISNULL(@pi_id_tipoMoneda,0)
	SET @pi_id_tipoFormaPago = ISNULL(@pi_id_tipoFormaPago,0)
	SET @pi_id_tipoMedioPago = ISNULL(@pi_id_tipoMedioPago,0)
	SET @pi_id_tipoFecha = ISNULL(@pi_id_tipoFecha,0)
	SET @pi_fec_iniVigencia = ISNULL(@pi_fec_iniVigencia,'')
	SET @pi_fec_finVigencia = ISNULL(@pi_fec_finVigencia,'')
	SET @pi_id_estado = ISNULL(@pi_id_estado,0)
	SET @pi_id_estadoTransferencia = ISNULL(@pi_id_estadoTransferencia,0)
	SET @pi_id_tipoPersona = ISNULL(@pi_id_tipoPersona,0)
	SET @pi_id_tipoIdentidad = ISNULL(@pi_id_tipoIdentidad,0)
	SET @pi_val_docIdentidad = ISNULL(@pi_val_docIdentidad,'')
	SET @pi_apellidos = ISNULL(@pi_apellidos,'')
	SET @pi_nombres = ISNULL(@pi_nombres,'')
	SET @pi_id_territorio = ISNULL(@pi_id_territorio,0)
	SET @pi_id_zona = ISNULL(@pi_id_zona,0)
	SET @pi_id_region = ISNULL(@pi_id_region,0)
	SET @pi_id_canal = ISNULL(@pi_id_canal,0)
	SET @pi_id_establecimiento = ISNULL(@pi_id_establecimiento,0)
	SET @pi_num_placa = ISNULL(@pi_num_placa,'')
	SET @pi_num_serie = ISNULL(@pi_num_serie,'')
	SET @pi_num_motor = ISNULL(@pi_num_motor,'')
	SET @pi_num_poliza = ISNULL(@pi_num_poliza,'')
	SET @pi_num_certificado = ISNULL(@pi_num_certificado,'')
	SET @pi_id_ramo = ISNULL(@pi_id_ramo,0)
	SET @pi_num_credito = ISNULL(@pi_num_credito,'')
	SET @pi_id_certificado = ISNULL(@pi_id_certificado,'')
	

	DECLARE @pi_idPersona INT
	DECLARE @v_mcaVendedor INT
	DECLARE @v_fec_iniVigencia DATETIME
	DECLARE @v_fec_finVigencia DATETIME

	DECLARE @ptoVenta TABLE (N_ID_ZONAL INT)
	DECLARE @plan TABLE (N_ID_PLAN INT)


	INSERT @ptoVenta VALUES (0)
	INSERT @plan VALUES (0)

	DECLARE @v_Desde INT=0, @v_CantidadRegistro INT=0;
	declare @certificadoIds table(N_ID_CERTIFICADO int);

	SET @v_Desde	= ((@pi_Pagina -1) * @pi_RegxPag + 1 )-1;
	SET @v_CantidadRegistro	=   @pi_RegxPag;

	IF @pi_fec_iniVigencia != ''
		SET @pi_fec_iniVigencia = SUBSTRING(@pi_fec_iniVigencia,7,4)+'-'+SUBSTRING(@pi_fec_iniVigencia,4,2)+'-'+SUBSTRING(@pi_fec_iniVigencia,1,2) + ' 00:00:00.000'
		--SET @v_fec_iniVigencia = CONVERT(DATETIME, @pi_fec_iniVigencia, 103)

	IF @pi_fec_finVigencia != ''
		SET @pi_fec_finVigencia = SUBSTRING(@pi_fec_finVigencia,7,4)+'-'+SUBSTRING(@pi_fec_finVigencia,4,2)+'-'+SUBSTRING(@pi_fec_finVigencia,1,2) + ' 23:59:59.000'
		--SET @v_fec_finVigencia = CONVERT(DATETIME, @pi_fec_finVigencia + ' 23:59:59.000', 103)

	SELECT @pi_idPersona = USU.N_ID_PERSONA, @v_mcaVendedor = PER.N_ID_MCA_VENDEDOR
	FROM T_MAE_USUARIO USU
	INNER JOIN T_DET_USUARIOPERFIL DUP ON USU.N_ID_USUARIO = DUP.N_ID_USUARIO
	INNER JOIN  T_MAE_PERFIL PER ON PER.N_ID_PERFIL = DUP.N_ID_PERFIL AND DUP.N_ID_USUARIO = @pi_id_usuario

	DECLARE @script_ejecutar					NVARCHAR(MAX) = '',
			@condicional_certificado			VARCHAR(300) = '',
			@condicional_poliza					VARCHAR(300) = '',
			@condicional_plan					VARCHAR(300) = '',
			@condicional_producto				VARCHAR(300) = '',
			@condicional_estructura_plan		VARCHAR(MAX) = '',
			@condicional_estructura_ptoventa	VARCHAR(MAX) = '',
			@condicional_estructura_est			VARCHAR(MAX) = '',
			@condicional_ptoVenta				VARCHAR(300) = '',
			@condicional_region					VARCHAR(300) = '',
			@condicional_zona					VARCHAR(300) = '',
			@condicional_territorio				VARCHAR(300) = '',
			@condicional_tercero				VARCHAR(MAX) = ''

	--ESTRUCURA DE PRODUCTO
	IF ISNULL(@v_mcaVendedor,9) = 9
	BEGIN
		IF(SELECT COUNT(N_ID_PLAN)
		FROM T_MAE_USUARIO_CIA_PRODUCTO_PLAN
		WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_COMPANIA = 0 AND N_ID_PRODUCTO = 0 AND N_ID_PLAN = 0 AND N_ID_ESTADO = 8) = 0
		BEGIN
			print 'aa'
			IF @pi_id_producto != 0
			BEGIN
				IF @pi_id_plan != 0
				BEGIN
					SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
					(SELECT PL.N_ID_PLAN 
					FROM T_MAE_PLAN PL
					INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
					INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
						AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
						AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
						AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
						AND CPP.N_ID_ESTADO = 8
					WHERE PL.N_ID_PLAN = @pi_id_plan) A
				END
				ELSE
				BEGIN
					print 'z1'
					SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
					(SELECT PL.N_ID_PLAN 
					FROM T_MAE_PLAN PL
					INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
					INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
						AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
						AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
						AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
						AND CPP.N_ID_ESTADO = 8
					WHERE PRD.N_ID_PRODUCTO = @pi_id_producto) A
				END
			END
			ELSE
			BEGIN
				print 'bbb'

				SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
				(SELECT PL.N_ID_PLAN 
				FROM T_MAE_PLAN PL
				INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
				INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
					AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
					AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
					AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
					AND CPP.N_ID_ESTADO = 8) A
			END

			print '@condicional_estructura_plan'
			print @condicional_estructura_plan

			IF LEN(@condicional_estructura_plan) > 0 
			BEGIN	
				SET @condicional_estructura_plan = SUBSTRING(@condicional_estructura_plan,1,LEN(@condicional_estructura_plan)-1)	
				SET @condicional_estructura_plan = ' AND POL.N_ID_PLAN IN (' + @condicional_estructura_plan + ')'	
			END	
			ELSE
			BEGIN
				print 'xxxx'
				SET @condicional_estructura_plan = ' AND POL.N_ID_PLAN IN (0)'	
			END
		END
		ELSE
		BEGIN
			IF @pi_id_entidad != 0
			BEGIN
				IF @pi_id_producto != 0
				BEGIN
					IF @pi_id_plan != 0
					BEGIN
						SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
					END
					ELSE
					BEGIN
						SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
					END
				END
				ELSE
				BEGIN
					SET @condicional_producto = @condicional_producto + ' AND PR.N_ID_ENTIDAD = '  + CONVERT(VARCHAR(10),@pi_id_entidad)
				END
			END
		END
	END
	ELSE
	BEGIN
		IF @pi_id_entidad != 0
		BEGIN
			IF @pi_id_producto != 0
			BEGIN
				IF @pi_id_plan != 0
					SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
				ELSE
					SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
			END
			ELSE
			BEGIN
				SET @condicional_producto = @condicional_producto + ' AND PR.N_ID_ENTIDAD = '  + CONVERT(VARCHAR(10),@pi_id_entidad)
			END
		END

		SET @condicional_plan = @condicional_plan + ' AND CER.N_ID_PERVENDEDOR = ' + CONVERT(VARCHAR,@pi_idPersona)
	END

	--ESTRUCTURA COMERCIAL
	IF ISNULL(@v_mcaVendedor,9) = 9
	BEGIN
		IF(SELECT COUNT(N_ID_PUNTO_VENTA) AS V_VENTA
		FROM T_MAE_USUARIO_CANAL_PTOVENTA
		WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_CANAL = 0 AND N_ID_TERRITORIO = 0 AND N_ID_ZONA = 0 AND N_ID_REGION = 0 AND N_ID_PUNTO_VENTA = 0 AND N_ID_ESTADO = 8) = 0
		BEGIN
			IF @pi_id_canal != 0
			BEGIN
				IF @pi_id_territorio != 0
				BEGIN
					IF @pi_id_zona != 0
					BEGIN
						IF @pi_id_region != 0
						BEGIN
							IF @pi_id_establecimiento !=0
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
								JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
								JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																		AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																		AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																		AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																		AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																		AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																		AND CTZRP.N_ID_ESTADO = 8
								WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region AND PVT.N_ID_ZONAL = @pi_id_establecimiento) A
							END
							ELSE
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
								JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
								JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																		AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																		AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																		AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																		AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																		AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																		AND CTZRP.N_ID_ESTADO = 8
								WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region) A
							END
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
							JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																	AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																	AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																	AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																	AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																	AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																	AND CTZRP.N_ID_ESTADO = 8
							WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																AND CTZRP.N_ID_ESTADO = 8
						WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
															AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
															AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
															AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
															AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
															AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
															AND CTZRP.N_ID_ESTADO = 8
					WHERE TER.N_ID_ENTIDAD = @pi_id_canal) A
				END
			END
			ELSE
			BEGIN
				SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
				(SELECT PVT.N_ID_ESTABLECIMIENTO
				FROM T_MAE_ZONAL PVT
				JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
				JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
				JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
				JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
					AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
					AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
					AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
					AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
					AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
					 AND CTZRP.N_ID_ESTADO = 8) A
			END	

			IF LEN(@condicional_estructura_est) > 0 
			BEGIN	
				SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
			END	
			ELSE
			BEGIN
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (0)'	
			END
		END
		ELSE
		BEGIN
			IF @pi_id_canal != 0
			BEGIN
				IF @pi_id_territorio != 0
				BEGIN
					IF @pi_id_zona != 0
					BEGIN
						IF @pi_id_region != 0
						BEGIN
							IF @pi_id_establecimiento != 0
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
							END
							ELSE
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
							END
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
				END
			END

			IF LEN(@condicional_estructura_est) > 0 
			BEGIN	
				SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
			END	
		END
	END
	ELSE
	BEGIN
		IF @pi_id_canal != 0
		BEGIN
			IF @pi_id_territorio != 0
			BEGIN
				IF @pi_id_zona != 0
				BEGIN
					IF @pi_id_region != 0
					BEGIN
						IF @pi_id_establecimiento != 0
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
				END
			END
			ELSE
			BEGIN
				SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
			END
		END

		IF LEN(@condicional_estructura_est) > 0 
		BEGIN	
			SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
			SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
		END	
	END

	IF @pi_id_estado = 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_ESTADO IN (4,15,25,26,27)'
	ELSE 
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_ESTADO = ' + CONVERT(VARCHAR(5),@pi_id_estado)
	
	IF @pi_id_tipoFecha = 426
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_VENTA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_VENTA <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 427
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_ANULACION >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_ANULACION <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 585
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_FINVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_FINVIGENCIA <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 586
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_INIVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_INIVIGENCIA <= ''' + @pi_fec_finVigencia + ''''		
	END
	
	IF @pi_id_tipoFecha = 596
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_CERTIFICADO >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_CERTIFICADO <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_num_certificado !=''
		SET @condicional_certificado = @condicional_certificado + ' AND CER.C_NUM_CERTIFICADO =''' + @pi_num_certificado + ''''
	
	IF @pi_id_tipoFormaPago != 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_FORMAPAGO =' + CONVERT(varchar(10),@pi_id_tipoFormaPago)

	IF @pi_id_tipoMedioPago != 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_MEDIOPAGO =' + CONVERT(varchar(10),@pi_id_tipoMedioPago)

	IF @pi_id_poliza != 0
		SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_POLIZA = ' + CONVERT(VARCHAR(10),@pi_id_poliza)

	IF @pi_id_certificado !=0
		SET @condicional_certificado = @condicional_certificado + 'AND CER.N_ID_CERTIFICADO = '  +  CONVERT(VARCHAR(10),@pi_id_certificado)

	IF @pi_num_poliza != ''
		SET @condicional_poliza = @condicional_poliza + ' AND POL.C_NUM_POLIZA = ''' + CONVERT(VARCHAR(10),@pi_num_poliza) + ''''

	IF @pi_id_tipoMoneda != 0
		SET @condicional_plan = @condicional_plan +' AND PL.N_ID_TIPOMONEDA =' + CONVERT(VARCHAR(5),@pi_id_tipoMoneda)

	IF @pi_id_entidad != 0
		SET @condicional_producto = @condicional_producto +' AND PR.N_ID_ENTIDAD = ' + CONVERT(VARCHAR(5),@pi_id_entidad)
	IF @pi_id_ramo!= 0
		SET @condicional_plan = @condicional_plan +' AND PL.N_ID_RAMO =' + CONVERT(VARCHAR(5),@pi_id_ramo)
	  IF @pi_num_credito IS NOT NULL AND @pi_num_credito !=''
	  BEGIN 
		SET @condicional_certificado =  @condicional_certificado + 'AND CER.C_NUM_SOLICITUD =''' + @pi_num_credito + ''''


		END

	--@condicional_tercero

	IF @pi_id_tipoPersona != 0
	BEGIN
		DECLARE @CADENA	VARCHAR(MAX) = ''
		DECLARE @WHERE VARCHAR(MAX) = ''
		DECLARE @TABLA_X TABLE(CADENA1	VARCHAR(MAX)) 
		DECLARE @N_ID_CERTIFICADO VARCHAR(MAX)

		IF @pi_id_tipoIdentidad != 0 AND @pi_val_docIdentidad != ''
			SET @WHERE = @WHERE + ' AND TER.N_ID_TIPOIDENTIDAD = ' + CONVERT(VARCHAR(5),@pi_id_tipoIdentidad) + ' AND TER.C_VAL_NUMIDENTIDAD =''' + @pi_val_docIdentidad + ''''
	
		IF @pi_apellidos != ''
			SET @WHERE = @WHERE + ' AND (TER.C_APE_PATERNO +'' ''+ TER.C_APE_MATERNO) LIKE ''%' + @pi_apellidos +'%'''

		IF @pi_nombres != ''
			SET @WHERE = @WHERE + ' AND TER.C_NOM_TERCERO LIKE ''%' + @pi_nombres +'%'''

		SET @CADENA = '
		DECLARE @A1	VARCHAR(MAX)

		SELECT @A1 = COALESCE(@A1,'''') + CAST(N_ID_CERTIFICADO AS VARCHAR(10)) + '','' FROM (
			SELECT RT.N_ID_CERTIFICADO
			FROM T_MAE_TERCERO TER
			INNER JOIN T_DET_ROLTERCEROCERTIFICADO RT ON TER.N_ID_TERCERO = RT.N_ID_TERCERO AND RT.N_ID_TIPOROLTERCERO = ' + CONVERT(VARCHAR,@pi_id_tipoPersona) + ' AND RT.N_ID_ESTADO = 8 AND RT.N_IND_ACTIVO = 1 '
			+ @WHERE + ') A
	
		SELECT @A1
		'

		INSERT @TABLA_X
		exec (@CADENA)

		SET @condicional_tercero = (SELECT CADENA1 FROM @TABLA_X)

		IF LEN(@condicional_tercero) > 0 
		BEGIN	
			SET @condicional_tercero = SUBSTRING(@condicional_tercero,1,LEN(@condicional_tercero)-1)	
			SET @condicional_tercero = ' AND CER.N_ID_CERTIFICADO IN (' + @condicional_tercero + ')'	
		END	
	END

	SET @script_ejecutar = '
		WITH TABLA_TOTAL AS (
			SELECT COUNT(1) AS CANTIDAD
			FROM T_MAE_CERTIFICADO CER  
		INNER JOIN T_MAE_POLIZA POL ON CER.N_IND_ACTIVO = 1' + @condicional_certificado + @condicional_tercero + ' AND CER.N_ID_POLIZA = POL.N_ID_POLIZA' 
												+ @condicional_poliza + @condicional_estructura_plan + @condicional_estructura_est +
		' INNER JOIN T_MAE_PLAN PL ON POL.N_ID_PLAN = PL.N_ID_PLAN' + @condicional_plan +
		' INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO' + @condicional_producto + 
		' INNER JOIN T_MAE_ENTIDAD ENT ON PR.N_ID_ENTIDAD = ENT.N_ID_ENTIDAD)
		,TABLA_1 AS (
		SELECT 
			ROW_NUMBER() OVER (ORDER BY CER.N_ID_CERTIFICADO DESC)	AS NUMROW,
			(SELECT CANTIDAD FROM TABLA_TOTAL) AS ROW_TOTAL,
			CER.N_ID_POLIZA,
			POL.C_NUM_POLIZA,
			CER.N_ID_CERTIFICADO,
			CER.C_NUM_CERTIFICADO,
			CER.N_ID_COTIZACION,
			ENT.N_ID_ENTIDAD,
			ENT.C_NOM_ENTIDAD,
			PL.N_ID_RAMO,
			PR.N_ID_PRODUCTO,
			PR.C_DES_PRODUCTO,
			PL.N_ID_PLAN,
			PL.C_COD_PLAN,
			PL.C_DES_CORTAPLAN,
			PL.C_DES_LARGAPLAN,
			PL.C_COD_REFERENCIA,
			PL.C_COD_TRAMA,
			PL.C_VAL_SECPOLIZA,
			PL.C_VAL_POLIZA,
			PL.N_ID_TIPOPOLIZA,
			PL.N_ID_TIPOPAGOPOLIZA,  
			PL.N_ID_TIPOMONEDA,
			PL.N_ID_TIPOREGLATARIFA,
			PL.N_ID_TIPOPLAN,
			PL.N_ID_TIPOVIGENCIA,
			PL.N_ID_TIPOCLIENTE,
			ISNULL(PL.N_ID_TIPOPERSONA,0) AS N_ID_TIPOPERSONA,
			CONVERT(CHAR(10), CER.D_FEC_CERTIFICADO, 103) AS D_FEC_CERTIFICADO,
			CONVERT(CHAR(10), CER.D_FEC_INIVIGENCIA, 103) AS D_FEC_INIVIGENCIA,
			CONVERT(CHAR(10), CER.D_FEC_FINVIGENCIA, 103) AS D_FEC_FINVIGENCIA,
			CONVERT(CHAR(10), CER.D_FEC_CREACION, 103) AS D_FEC_REGISTRO,
			CONVERT(CHAR(10), CER.D_FEC_VENTA, 103) AS D_FEC_VENTA,
			CER.N_NUM_VALORCOMERCIAL,
			CER.N_NUM_PRIMABRUTA,
			CER.N_NUM_PRIMANETA,
			CER.N_NUM_COM_CANAL,
			PL.N_NUM_VERSION,
			CER.C_OBS_DESCRIPTIVO,
			0 AS N_ID_PERSONA,
			0 AS N_ID_ASEGURADO,
			CER.N_IND_ACTIVO,
			CER.N_ID_ESTADO,
			CER.C_COD_USUCREACION,
			CONVERT(CHAR(10), CER.D_FEC_CREACION, 103) AS D_FEC_CREACION,
			CER.C_COD_USUMODIF,
			CONVERT(VARCHAR,CER.D_FEC_MODIFICACION,103) AS D_FEC_MODIFICACION,
			0 AS N_ID_ESTADOTRANSFERENCIA,
			'''' AS C_DES_ESTADOTRANSFERENCIA,
			'''' AS MESHABILITADO,
			CER.N_ID_ESTABLECIMIENTO, 
			'''' AS C_VAL_CODHOMOLOGACION,
			CER.N_ID_PEREMISOR,
			CER.N_ID_PERVENDEDOR,
			ISNULL(CER.N_ID_ADJUNTOPOLIZA,0) AS N_ID_ADJUNTOPOLIZA,
			'''' AS C_MODELO_SUBMODELO,
			CONVERT(CHAR(10), CER.D_FEC_ANULACION, 103) AS D_FEC_ANULACION,
			CER.N_ID_PERANULACION,
			CER.N_ID_MOTIVOANULA,
			CASE WHEN CONVERT(DATE, CER.D_FEC_CERTIFICADO, 103) = CONVERT(DATE, GETDATE(), 103) THEN 1 ELSE 0 END AS N_IND_ANULAR,  
			CASE WHEN CONVERT(DATE, CER.D_FEC_CERTIFICADO, 103) < CONVERT(DATE, GETDATE(), 103)THEN 1 ELSE 0 END AS N_IND_CANCELAR,
			CER.N_ID_CANAL,
			CER.C_NUM_SOLICITUD AS C_NUM_CREDITO
		FROM T_MAE_CERTIFICADO CER  
		INNER JOIN T_MAE_POLIZA POL ON CER.N_IND_ACTIVO = 1' + @condicional_certificado + @condicional_tercero + ' AND CER.N_ID_POLIZA = POL.N_ID_POLIZA' 
												+ @condicional_poliza + @condicional_estructura_plan + @condicional_estructura_est +
		' INNER JOIN T_MAE_PLAN PL ON POL.N_ID_PLAN = PL.N_ID_PLAN' + @condicional_plan +
		' INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO' + @condicional_producto + 
		' INNER JOIN T_MAE_ENTIDAD ENT ON PR.N_ID_ENTIDAD = ENT.N_ID_ENTIDAD
		ORDER BY CER.N_ID_CERTIFICADO DESC
		OFFSET ' + CONVERT(VARCHAR,@v_Desde) + ' ROWS FETCH NEXT ' + CONVERT(VARCHAR,@v_CantidadRegistro) + ' ROWS ONLY
		), TABLA_1_5 AS (
		SELECT
			T1.NUMROW
			,T1.ROW_TOTAL
			,T1.N_ID_POLIZA
			,T1.C_NUM_POLIZA
			,T1.N_ID_CERTIFICADO
			,T1.C_NUM_CERTIFICADO
			,T1.N_ID_COTIZACION
			,T1.N_ID_ENTIDAD
			,T1.C_NOM_ENTIDAD
			,T1.N_ID_RAMO
			,T1.N_ID_PRODUCTO
			,T1.C_DES_PRODUCTO
			,T1.N_ID_PLAN
			,T1.C_COD_PLAN
			,T1.C_DES_CORTAPLAN
			,T1.C_DES_LARGAPLAN
			,T1.C_COD_REFERENCIA
			,T1.C_COD_TRAMA
			,T1.C_VAL_SECPOLIZA
			,T1.C_VAL_POLIZA
			,T1.N_ID_TIPOPOLIZA
			,T1.N_ID_TIPOPAGOPOLIZA
			,T1.N_ID_TIPOMONEDA
			,T1.N_ID_TIPOREGLATARIFA
			,T1.N_ID_TIPOPLAN
			,T1.N_ID_TIPOVIGENCIA
			,T1.N_ID_TIPOCLIENTE
			,T1.N_ID_TIPOPERSONA
			,T1.D_FEC_CERTIFICADO
			,T1.D_FEC_INIVIGENCIA
			,T1.D_FEC_FINVIGENCIA
			,T1.D_FEC_REGISTRO
			,T1.D_FEC_VENTA
			,T1.N_NUM_VALORCOMERCIAL
			,T1.N_NUM_PRIMABRUTA
			,T1.N_NUM_PRIMANETA
			,T1.N_NUM_COM_CANAL
			,T1.N_NUM_VERSION
			,T1.C_OBS_DESCRIPTIVO
			,T1.N_ID_PERSONA
			,T1.N_ID_ASEGURADO
			,T1.N_IND_ACTIVO
			,T1.N_ID_ESTADO
			,T1.C_COD_USUCREACION
			,T1.D_FEC_CREACION
			,T1.C_COD_USUMODIF
			,T1.D_FEC_MODIFICACION
			,T1.N_ID_ESTADOTRANSFERENCIA
			,T1.C_DES_ESTADOTRANSFERENCIA
			,T1.MESHABILITADO
			,REG.C_DES_ZONAL AS C_DES_REGION
			,ZON.C_DES_ZONAL AS C_DES_ZONA
			,T1.N_ID_ESTABLECIMIENTO
			,T1.C_VAL_CODHOMOLOGACION
			,EST.C_NOM_ESTABLECIMIENTO AS C_NOM_ESTABLECIMIENTO
			,T1.N_ID_PEREMISOR
			,T1.N_ID_PERVENDEDOR
			,T1.N_ID_ADJUNTOPOLIZA
			,T1.C_MODELO_SUBMODELO
			,T1.D_FEC_ANULACION
			,T1.N_ID_PERANULACION
			,T1.N_ID_MOTIVOANULA
			,T1.N_IND_ANULAR
			,T1.N_IND_CANCELAR
			,T1.N_ID_CANAL
			,T1.C_NUM_CREDITO
			,ENT.C_NOM_ENTIDAD AS C_NOM_CANAL
		FROM TABLA_1 T1
		INNER JOIN T_MAE_ENTIDAD ENT ON T1.N_ID_CANAL = ENT.N_ID_ENTIDAD
		LEFT JOIN T_MAE_ESTABLECIMIENTO EST ON T1.N_ID_ESTABLECIMIENTO = EST.N_ID_ESTABLECIMIENTO
		LEFT JOIN T_MAE_ZONAL PVT ON EST.N_ID_ZONAL = PVT.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 
		LEFT JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND REG.N_ID_TIPOZONAL = 405 
		LEFT JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404 
		), TABLA_2 AS (
		SELECT
			T1.NUMROW
			,T1.ROW_TOTAL
			,T1.N_ID_POLIZA
			,T1.C_NUM_POLIZA
			,T1.N_ID_CERTIFICADO
			,T1.C_NUM_CERTIFICADO			
			,COTI.N_ID_COTIZACION
			,COTI.C_NUM_COTIZACION
			,T1.N_ID_ENTIDAD
			,T1.C_NOM_ENTIDAD
			,T1.N_ID_RAMO
			,T1.N_ID_PRODUCTO
			,T1.C_DES_PRODUCTO
			,T1.N_ID_PLAN
			,T1.C_COD_PLAN
			,T1.C_DES_CORTAPLAN
			,T1.C_DES_LARGAPLAN
			,T1.C_COD_REFERENCIA
			,T1.C_COD_TRAMA
			,T1.C_VAL_SECPOLIZA
			,T1.C_VAL_POLIZA
			,T1.N_ID_TIPOPOLIZA
			,T1.N_ID_TIPOPAGOPOLIZA
			,T1.N_ID_TIPOMONEDA
			,T1.N_ID_TIPOREGLATARIFA
			,T1.N_ID_TIPOPLAN
			,T1.N_ID_TIPOVIGENCIA
			,T1.N_ID_TIPOCLIENTE
			,T1.N_ID_TIPOPERSONA
			,T1.D_FEC_CERTIFICADO
			,T1.D_FEC_INIVIGENCIA
			,T1.D_FEC_FINVIGENCIA
			,T1.D_FEC_REGISTRO
			,T1.D_FEC_VENTA
			,T1.N_NUM_VALORCOMERCIAL
			,T1.N_NUM_PRIMABRUTA
			,T1.N_NUM_PRIMANETA
			,T1.N_NUM_COM_CANAL
			,T1.N_NUM_VERSION
			,T1.C_OBS_DESCRIPTIVO
			,T1.N_ID_PERSONA
			,T1.N_ID_ASEGURADO
			,T1.N_IND_ACTIVO
			,T1.N_ID_ESTADO
			,T1.C_COD_USUCREACION
			,T1.D_FEC_CREACION
			,T1.C_COD_USUMODIF
			,T1.D_FEC_MODIFICACION
			,T1.N_ID_ESTADOTRANSFERENCIA
			,T1.C_DES_ESTADOTRANSFERENCIA
			,T1.MESHABILITADO
			,T1.C_DES_REGION
			,T1.C_DES_ZONA
			,T1.N_ID_ESTABLECIMIENTO
			,T1.C_VAL_CODHOMOLOGACION
			,T1.C_NOM_ESTABLECIMIENTO
			,T1.N_ID_PEREMISOR
			,T1.N_ID_PERVENDEDOR
			,T1.N_ID_ADJUNTOPOLIZA
			,T1.C_MODELO_SUBMODELO
			,T1.D_FEC_ANULACION
			,T1.N_ID_PERANULACION
			,T1.N_ID_MOTIVOANULA
			,T1.N_IND_ANULAR
			,T1.N_IND_CANCELAR
			,T1.N_ID_CANAL
			,T1.C_NOM_CANAL
			,T1.C_NUM_CREDITO
		FROM TABLA_1_5 T1
		LEFT JOIN T_MAE_COTIZACION COTI ON T1.N_ID_COTIZACION = COTI.N_ID_COTIZACION
	), TABLA_3 AS (
		SELECT
			T2.NUMROW
			,T2.ROW_TOTAL
			,T2.N_ID_POLIZA
			,T2.C_NUM_POLIZA
			,T2.N_ID_CERTIFICADO
			,T2.C_NUM_CERTIFICADO
			,T2.N_ID_COTIZACION
			,T2.C_NUM_COTIZACION
			,T2.N_ID_ENTIDAD
			,T2.C_NOM_ENTIDAD
			,T2.N_ID_RAMO
			,T2.N_ID_PRODUCTO
			,T2.C_DES_PRODUCTO
			,T2.N_ID_PLAN
			,T2.C_COD_PLAN
			,T2.C_DES_CORTAPLAN
			,T2.C_DES_LARGAPLAN
			,T2.C_COD_REFERENCIA
			,T2.C_COD_TRAMA
			,T2.C_VAL_SECPOLIZA
			,T2.C_VAL_POLIZA
			,T2.N_ID_TIPOPOLIZA
			,T2.N_ID_TIPOPAGOPOLIZA
			,T2.N_ID_TIPOMONEDA
			,T2.N_ID_TIPOREGLATARIFA
			,T2.N_ID_TIPOPLAN
			,T2.N_ID_TIPOVIGENCIA
			,T2.N_ID_TIPOCLIENTE
			,T2.N_ID_TIPOPERSONA
			,T2.D_FEC_CERTIFICADO
			,T2.D_FEC_INIVIGENCIA
			,T2.D_FEC_FINVIGENCIA
			,T2.D_FEC_REGISTRO
			,T2.D_FEC_VENTA
			,T2.N_NUM_VALORCOMERCIAL
			,T2.N_NUM_PRIMABRUTA
			,T2.N_NUM_PRIMANETA
			,T2.N_NUM_COM_CANAL
			,T2.N_NUM_VERSION
			,T2.C_OBS_DESCRIPTIVO
			,0 AS N_ID_PERSONA
			,TER.C_NOM_COMPLETO
			,0 AS N_ID_CONTRATANTE
			,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_CONTRATANTE
			,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_CONTRATANTE
			,TER.C_NOM_COMPLETO AS C_NOM_COMPLETO_CONTRATANTE
			,TER.N_ID_UBIGEODEPARTAMENTO
			,TER.N_ID_UBIGEOPROVINCIA
			,TER.N_ID_UBIGEODISTRITO
			,TER.N_ID_TIPOVIA
			,TER.C_DES_DIRECCION
			,TER.C_VAL_NUMVIA
			,T2.N_ID_ASEGURADO
			,T2.N_IND_ACTIVO
			,T2.N_ID_ESTADO
			,T2.C_COD_USUCREACION
			,T2.D_FEC_CREACION
			,T2.C_COD_USUMODIF
			,T2.D_FEC_MODIFICACION
			,T2.N_ID_ESTADOTRANSFERENCIA
			,T2.C_DES_ESTADOTRANSFERENCIA
			,T2.MESHABILITADO
			,T2.C_DES_REGION
			,T2.C_DES_ZONA
			,T2.N_ID_ESTABLECIMIENTO
			,T2.C_VAL_CODHOMOLOGACION
			,T2.C_NOM_ESTABLECIMIENTO
			,T2.N_ID_PEREMISOR
			,T2.N_ID_PERVENDEDOR
			,T2.N_ID_ADJUNTOPOLIZA
			,T2.C_MODELO_SUBMODELO
			,T2.D_FEC_ANULACION
			,T2.N_ID_PERANULACION
			,T2.N_ID_MOTIVOANULA
			,T2.N_IND_ANULAR
			,T2.N_IND_CANCELAR
			,T2.N_ID_CANAL
			,T2.C_NOM_CANAL
			,T2.C_NUM_CREDITO
		FROM TABLA_2 T2
		INNER JOIN T_DET_ROLTERCEROCERTIFICADO RTC ON RTC.N_ID_CERTIFICADO = T2.N_ID_CERTIFICADO AND RTC.N_ID_TIPOROLTERCERO = 364 AND RTC.N_ID_ESTADO = 8 AND RTC.N_IND_ACTIVO = 1
		LEFT JOIN T_MAE_TERCERO TER ON RTC.N_ID_TERCERO = TER.N_ID_TERCERO 
		LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
	), TABLA_4 AS (
		SELECT
			T3.NUMROW
			,T3.ROW_TOTAL
			,T3.N_ID_POLIZA
			,T3.C_NUM_POLIZA
			,T3.N_ID_CERTIFICADO
			,T3.C_NUM_CERTIFICADO
			,T3.N_ID_COTIZACION
			,T3.C_NUM_COTIZACION
			,T3.N_ID_ENTIDAD
			,T3.C_NOM_ENTIDAD
			,T3.N_ID_RAMO
			,T3.N_ID_PRODUCTO
			,T3.C_DES_PRODUCTO
			,T3.N_ID_PLAN
			,T3.C_COD_PLAN
			,T3.C_DES_CORTAPLAN
			,T3.C_DES_LARGAPLAN
			,T3.C_COD_REFERENCIA
			,T3.C_COD_TRAMA
			,T3.C_VAL_SECPOLIZA
			,T3.C_VAL_POLIZA
			,T3.N_ID_TIPOPOLIZA
			,T3.N_ID_TIPOPAGOPOLIZA
			,T3.N_ID_TIPOMONEDA
			,T3.N_ID_TIPOREGLATARIFA
			,T3.N_ID_TIPOPLAN
			,T3.N_ID_TIPOVIGENCIA
			,T3.N_ID_TIPOCLIENTE
			,T3.N_ID_TIPOPERSONA
			,T3.D_FEC_CERTIFICADO
			,T3.D_FEC_INIVIGENCIA
			,T3.D_FEC_FINVIGENCIA
			,T3.D_FEC_REGISTRO
			,T3.D_FEC_VENTA
			,T3.N_NUM_VALORCOMERCIAL
			,T3.N_NUM_PRIMABRUTA
			,T3.N_NUM_PRIMANETA
			,T3.N_NUM_COM_CANAL
			,T3.N_NUM_VERSION
			,T3.C_OBS_DESCRIPTIVO
			,T3.N_ID_PERSONA
			,T3.C_NOM_COMPLETO
			,T3.N_ID_CONTRATANTE
			,T3.C_TIPO_IDENTIDAD_CONTRATANTE
			,T3.C_NUM_IDENTIDAD_CONTRATANTE
			,T3.C_NOM_COMPLETO_CONTRATANTE
			,T3.N_ID_UBIGEODEPARTAMENTO
			,T3.N_ID_UBIGEOPROVINCIA
			,T3.N_ID_UBIGEODISTRITO
			,T3.N_ID_TIPOVIA
			,T3.C_DES_DIRECCION
			,T3.C_VAL_NUMVIA
			,T3.N_ID_ASEGURADO
			,TER.N_ID_TIPOIDENTIDAD AS N_ID_TIPO_IDENTIDAD_ASEGURADO
			,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_ASEGURADO
			,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_ASEGURADO
			,ISNULL(TER.C_APE_PATERNO,'''') AS C_APE_PATERNO_ASEGURADO
			,ISNULL(TER.C_APE_MATERNO,'''') AS C_APE_MATERNO_ASEGURADO
			,ISNULL(TER.C_NOM_TERCERO,'''') AS C_NOMBRE_ASEGURADO
			,ISNULL(TER.C_NOM_COMPLETO,'''') AS C_NOM_COMPLETO_ASEGURADO
			,ISNULL(TER.C_VAL_CELULAR,'''') AS C_CELULAR_ASEGURADO
			,ISNULL(TER.C_DIR_CORREO,'''') C_CORREO_ASEGURADO
			,T3.N_IND_ACTIVO
			,T3.N_ID_ESTADO
			,T3.C_COD_USUCREACION
			,T3.D_FEC_CREACION
			,T3.C_COD_USUMODIF
			,T3.D_FEC_MODIFICACION
			,T3.N_ID_ESTADOTRANSFERENCIA
			,T3.C_DES_ESTADOTRANSFERENCIA
			,T3.MESHABILITADO
			,T3.C_DES_REGION
			,T3.C_DES_ZONA
			,T3.N_ID_ESTABLECIMIENTO
			,T3.C_VAL_CODHOMOLOGACION
			,T3.C_NOM_ESTABLECIMIENTO
			,T3.N_ID_PEREMISOR
			,T3.N_ID_PERVENDEDOR
			,T3.N_ID_ADJUNTOPOLIZA
			,T3.C_MODELO_SUBMODELO
			,T3.D_FEC_ANULACION
			,T3.N_ID_PERANULACION
			,T3.N_ID_MOTIVOANULA
			,T3.N_IND_ANULAR
			,T3.N_IND_CANCELAR
			,T3.N_ID_CANAL
			,T3.C_NOM_CANAL
			,T3.C_NUM_CREDITO
		FROM TABLA_3 T3
		LEFT JOIN T_DET_ROLTERCEROCERTIFICADO RTA ON RTA.N_ID_CERTIFICADO = T3.N_ID_CERTIFICADO AND RTA.N_ID_TIPOROLTERCERO = 365 AND RTA.N_ID_ESTADO = 8 AND RTA.N_IND_ACTIVO = 1
		LEFT JOIN T_MAE_TERCERO TER ON RTA.N_ID_TERCERO = TER.N_ID_TERCERO 
		LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
	), TABLA_5 AS (
		SELECT
			T4.NUMROW
			,T4.ROW_TOTAL
			,T4.N_ID_POLIZA
			,T4.C_NUM_POLIZA
			,T4.N_ID_CERTIFICADO
			,T4.C_NUM_CERTIFICADO
			,T4.N_ID_COTIZACION
			,T4.C_NUM_COTIZACION
			,T4.N_ID_ENTIDAD
			,T4.C_NOM_ENTIDAD
			,T4.N_ID_RAMO
			,T4.N_ID_PRODUCTO
			,T4.C_DES_PRODUCTO
			,T4.N_ID_PLAN
			,T4.C_COD_PLAN
			,T4.C_DES_CORTAPLAN
			,T4.C_DES_LARGAPLAN
			,T4.C_COD_REFERENCIA
			,T4.C_COD_TRAMA
			,T4.C_VAL_SECPOLIZA
			,T4.C_VAL_POLIZA
			,T4.N_ID_TIPOPOLIZA
			,T4.N_ID_TIPOPAGOPOLIZA
			,T4.N_ID_TIPOMONEDA
			,T4.N_ID_TIPOREGLATARIFA
			,T4.N_ID_TIPOPLAN
			,T4.N_ID_TIPOVIGENCIA
			,T4.N_ID_TIPOCLIENTE
			,T4.N_ID_TIPOPERSONA
			,T4.D_FEC_CERTIFICADO
			,T4.D_FEC_INIVIGENCIA
			,T4.D_FEC_FINVIGENCIA
			,T4.D_FEC_REGISTRO
			,T4.D_FEC_VENTA
			,T4.N_NUM_VALORCOMERCIAL
			,T4.N_NUM_PRIMABRUTA
			,T4.N_NUM_PRIMANETA
			,T4.N_NUM_COM_CANAL
			,T4.N_NUM_VERSION
			,T4.C_OBS_DESCRIPTIVO
			,T4.N_ID_PERSONA
			,T4.C_NOM_COMPLETO
			,T4.N_ID_CONTRATANTE
			,T4.C_TIPO_IDENTIDAD_CONTRATANTE
			,T4.C_NUM_IDENTIDAD_CONTRATANTE
			,T4.C_NOM_COMPLETO_CONTRATANTE
			,T4.N_ID_UBIGEODEPARTAMENTO
			,T4.N_ID_UBIGEOPROVINCIA
			,T4.N_ID_UBIGEODISTRITO
			,T4.N_ID_TIPOVIA
			,T4.C_DES_DIRECCION
			,T4.C_VAL_NUMVIA
			,T4.N_ID_ASEGURADO
			,T4.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T4.C_TIPO_IDENTIDAD_ASEGURADO
			,T4.C_NUM_IDENTIDAD_ASEGURADO
			,T4.C_APE_PATERNO_ASEGURADO
			,T4.C_APE_MATERNO_ASEGURADO
			,T4.C_NOMBRE_ASEGURADO
			,T4.C_NOM_COMPLETO_ASEGURADO
			,T4.C_CELULAR_ASEGURADO
			,T4.C_CORREO_ASEGURADO
			,0  AS N_ID_RESPONSABLEPAGO
			,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,TER.C_NOM_COMPLETO AS C_NOM_COMPLETO_RESPONSABLEPAGO
			,T4.N_IND_ACTIVO
			,T4.N_ID_ESTADO
			,T4.C_COD_USUCREACION
			,T4.D_FEC_CREACION
			,T4.C_COD_USUMODIF
			,T4.D_FEC_MODIFICACION
			,T4.N_ID_ESTADOTRANSFERENCIA
			,T4.C_DES_ESTADOTRANSFERENCIA
			,T4.MESHABILITADO
			,T4.C_DES_REGION
			,T4.C_DES_ZONA
			,T4.N_ID_ESTABLECIMIENTO
			,T4.C_VAL_CODHOMOLOGACION
			,T4.C_NOM_ESTABLECIMIENTO
			,T4.N_ID_PEREMISOR
			,T4.N_ID_PERVENDEDOR
			,T4.N_ID_ADJUNTOPOLIZA
			,T4.C_MODELO_SUBMODELO
			,T4.D_FEC_ANULACION
			,T4.N_ID_PERANULACION
			,T4.N_ID_MOTIVOANULA
			,T4.N_IND_ANULAR
			,T4.N_IND_CANCELAR
			,T4.N_ID_CANAL
			,T4.C_NOM_CANAL
			,T4.C_NUM_CREDITO
		FROM TABLA_4 T4
		LEFT JOIN T_DET_ROLTERCEROCERTIFICADO RTR ON RTR.N_ID_CERTIFICADO = T4.N_ID_CERTIFICADO AND RTR.N_ID_TIPOROLTERCERO = 366 AND RTR.N_ID_ESTADO = 8 AND RTR.N_IND_ACTIVO = 1
		LEFT JOIN T_MAE_TERCERO TER ON RTR.N_ID_TERCERO = TER.N_ID_TERCERO 
		LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
	), TABLA_6 AS (
		SELECT
			T5.NUMROW
			,T5.ROW_TOTAL
			,T5.N_ID_POLIZA
			,T5.C_NUM_POLIZA
			,T5.N_ID_CERTIFICADO
			,T5.C_NUM_CERTIFICADO
			,T5.N_ID_COTIZACION
			,T5.C_NUM_COTIZACION
			,T5.N_ID_ENTIDAD
			,T5.C_NOM_ENTIDAD
			,T5.N_ID_RAMO
			,T5.N_ID_PRODUCTO
			,T5.C_DES_PRODUCTO
			,T5.N_ID_PLAN
			,T5.C_COD_PLAN
			,T5.C_DES_CORTAPLAN
			,T5.C_DES_LARGAPLAN
			,T5.C_COD_REFERENCIA
			,T5.C_COD_TRAMA
			,T5.C_VAL_SECPOLIZA
			,T5.C_VAL_POLIZA
			,T5.N_ID_TIPOPOLIZA
			,T5.N_ID_TIPOPAGOPOLIZA
			,T5.N_ID_TIPOMONEDA
			,T5.N_ID_TIPOREGLATARIFA
			,T5.N_ID_TIPOPLAN
			,T5.N_ID_TIPOVIGENCIA
			,T5.N_ID_TIPOCLIENTE
			,T5.N_ID_TIPOPERSONA
			,T5.D_FEC_CERTIFICADO
			,T5.D_FEC_INIVIGENCIA
			,T5.D_FEC_FINVIGENCIA
			,T5.D_FEC_REGISTRO
			,T5.D_FEC_VENTA
			,T5.N_NUM_VALORCOMERCIAL
			,T5.N_NUM_PRIMABRUTA
			,T5.N_NUM_PRIMANETA
			,T5.N_NUM_COM_CANAL
			,T5.N_NUM_VERSION
			,T5.C_OBS_DESCRIPTIVO
			,T5.N_ID_PERSONA
			,T5.C_NOM_COMPLETO
			,T5.N_ID_CONTRATANTE
			,T5.C_TIPO_IDENTIDAD_CONTRATANTE
			,T5.C_NUM_IDENTIDAD_CONTRATANTE
			,T5.C_NOM_COMPLETO_CONTRATANTE
			,T5.N_ID_UBIGEODEPARTAMENTO
			,T5.N_ID_UBIGEOPROVINCIA
			,T5.N_ID_UBIGEODISTRITO
			,T5.N_ID_TIPOVIA
			,T5.C_DES_DIRECCION
			,T5.C_VAL_NUMVIA
			,T5.N_ID_ASEGURADO
			,T5.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T5.C_TIPO_IDENTIDAD_ASEGURADO
			,T5.C_NUM_IDENTIDAD_ASEGURADO
			,T5.C_APE_PATERNO_ASEGURADO
			,T5.C_APE_MATERNO_ASEGURADO
			,T5.C_NOMBRE_ASEGURADO
			,T5.C_NOM_COMPLETO_ASEGURADO
			,T5.C_CELULAR_ASEGURADO
			,T5.C_CORREO_ASEGURADO
			,T5.N_ID_RESPONSABLEPAGO
			,T5.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T5.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T5.C_NOM_COMPLETO_RESPONSABLEPAGO
			,TMO.C_DES_TIPO AS C_DES_TIPOMONEDA
			,TMO.C_ABR_TIPO AS C_ABR_TIPOMONEDA
			,T5.N_IND_ACTIVO
			,T5.N_ID_ESTADO
			,T5.C_COD_USUCREACION
			,T5.D_FEC_CREACION
			,T5.C_COD_USUMODIF
			,T5.D_FEC_MODIFICACION
			,T5.N_ID_ESTADOTRANSFERENCIA
			,T5.C_DES_ESTADOTRANSFERENCIA
			,T5.MESHABILITADO
			,T5.C_DES_REGION
			,T5.C_DES_ZONA
			,T5.N_ID_ESTABLECIMIENTO
			,T5.C_VAL_CODHOMOLOGACION
			,T5.C_NOM_ESTABLECIMIENTO
			,T5.N_ID_PEREMISOR
			,T5.N_ID_PERVENDEDOR
			,T5.N_ID_ADJUNTOPOLIZA
			,T5.C_MODELO_SUBMODELO
			,T5.D_FEC_ANULACION
			,T5.N_ID_PERANULACION
			,T5.N_ID_MOTIVOANULA
			,T5.N_IND_ANULAR
			,T5.N_IND_CANCELAR
			,T5.N_ID_CANAL
			,T5.C_NOM_CANAL
			,T5.C_NUM_CREDITO
		FROM TABLA_5 T5
		INNER JOIN T_MAE_TIPO TMO ON T5.N_ID_TIPOMONEDA = TMO.N_ID_TIPO
	), TABLA_7 AS (
		SELECT
			T6.NUMROW
			,T6.ROW_TOTAL
			,T6.N_ID_POLIZA
			,T6.C_NUM_POLIZA
			,T6.N_ID_CERTIFICADO
			,T6.C_NUM_CERTIFICADO
			,T6.N_ID_COTIZACION
			,T6.C_NUM_COTIZACION
			,T6.N_ID_ENTIDAD
			,T6.C_NOM_ENTIDAD
			,T6.N_ID_RAMO
			,T6.N_ID_PRODUCTO
			,T6.C_DES_PRODUCTO
			,T6.N_ID_PLAN
			,T6.C_COD_PLAN
			,T6.C_DES_CORTAPLAN
			,T6.C_DES_LARGAPLAN
			,T6.C_COD_REFERENCIA
			,T6.C_COD_TRAMA
			,T6.C_VAL_SECPOLIZA
			,T6.C_VAL_POLIZA
			,T6.N_ID_TIPOPOLIZA
			,T6.N_ID_TIPOPAGOPOLIZA
			,T6.N_ID_TIPOMONEDA
			,TVIG.C_DES_TIPO AS C_DES_TIPOVIGENCIA
			,T6.N_ID_TIPOREGLATARIFA
			,T6.N_ID_TIPOPLAN
			,T6.N_ID_TIPOVIGENCIA
			,T6.N_ID_TIPOCLIENTE
			,T6.N_ID_TIPOPERSONA
			,T6.D_FEC_CERTIFICADO
			,T6.D_FEC_INIVIGENCIA
			,T6.D_FEC_FINVIGENCIA
			,T6.D_FEC_REGISTRO
			,T6.D_FEC_VENTA
			,T6.N_NUM_VALORCOMERCIAL
			,T6.N_NUM_PRIMABRUTA
			,T6.N_NUM_PRIMANETA
			,T6.N_NUM_COM_CANAL
			,T6.N_NUM_VERSION
			,T6.C_OBS_DESCRIPTIVO
			,T6.N_ID_PERSONA
			,T6.C_NOM_COMPLETO
			,T6.N_ID_CONTRATANTE
			,T6.C_TIPO_IDENTIDAD_CONTRATANTE
			,T6.C_NUM_IDENTIDAD_CONTRATANTE
			,T6.C_NOM_COMPLETO_CONTRATANTE
			,T6.N_ID_UBIGEODEPARTAMENTO
			,T6.N_ID_UBIGEOPROVINCIA
			,T6.N_ID_UBIGEODISTRITO
			,T6.N_ID_TIPOVIA
			,T6.C_DES_DIRECCION
			,T6.C_VAL_NUMVIA
			,T6.N_ID_ASEGURADO
			,T6.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T6.C_TIPO_IDENTIDAD_ASEGURADO
			,T6.C_NUM_IDENTIDAD_ASEGURADO
			,T6.C_APE_PATERNO_ASEGURADO
			,T6.C_APE_MATERNO_ASEGURADO
			,T6.C_NOMBRE_ASEGURADO
			,T6.C_NOM_COMPLETO_ASEGURADO
			,T6.C_CELULAR_ASEGURADO
			,T6.C_CORREO_ASEGURADO
			,T6.N_ID_RESPONSABLEPAGO
			,T6.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T6.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T6.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T6.C_DES_TIPOMONEDA
			,T6.C_ABR_TIPOMONEDA
			,T6.N_IND_ACTIVO
			,T6.N_ID_ESTADO
			,T6.C_COD_USUCREACION
			,T6.D_FEC_CREACION
			,T6.C_COD_USUMODIF
			,T6.D_FEC_MODIFICACION
			,T6.N_ID_ESTADOTRANSFERENCIA
			,T6.C_DES_ESTADOTRANSFERENCIA
			,T6.MESHABILITADO
			,T6.C_DES_REGION
			,T6.C_DES_ZONA
			,T6.N_ID_ESTABLECIMIENTO
			,T6.C_VAL_CODHOMOLOGACION
			,T6.C_NOM_ESTABLECIMIENTO
			,T6.N_ID_PEREMISOR
			,T6.N_ID_PERVENDEDOR
			,T6.N_ID_ADJUNTOPOLIZA
			,T6.C_MODELO_SUBMODELO
			,T6.D_FEC_ANULACION
			,T6.N_ID_PERANULACION
			,T6.N_ID_MOTIVOANULA
			,T6.N_IND_ANULAR
			,T6.N_IND_CANCELAR
			,T6.N_ID_CANAL
			,T6.C_NOM_CANAL
			,T6.C_NUM_CREDITO
		FROM TABLA_6 T6
		INNER JOIN T_MAE_TIPO TVIG ON TVIG.N_ID_TIPO=T6.N_ID_TIPOVIGENCIA
	), TABLA_8 AS (
		SELECT
			T7.NUMROW
			,T7.ROW_TOTAL
			,T7.N_ID_POLIZA
			,T7.C_NUM_POLIZA
			,T7.N_ID_CERTIFICADO
			,T7.C_NUM_CERTIFICADO
			,T7.N_ID_COTIZACION
			,T7.C_NUM_COTIZACION
			,T7.N_ID_ENTIDAD
			,T7.C_NOM_ENTIDAD
			,T7.N_ID_RAMO
			,T7.N_ID_PRODUCTO
			,T7.C_DES_PRODUCTO
			,T7.N_ID_PLAN
			,T7.C_COD_PLAN
			,T7.C_DES_CORTAPLAN
			,T7.C_DES_LARGAPLAN
			,T7.C_COD_REFERENCIA
			,T7.C_COD_TRAMA
			,T7.C_VAL_SECPOLIZA
			,T7.C_VAL_POLIZA
			,T7.N_ID_TIPOPOLIZA
			,T7.N_ID_TIPOPAGOPOLIZA
			,T7.N_ID_TIPOMONEDA
			,T7.C_DES_TIPOVIGENCIA
			,T7.N_ID_TIPOREGLATARIFA
			,T7.N_ID_TIPOPLAN
			,T7.N_ID_TIPOVIGENCIA
			,T7.N_ID_TIPOCLIENTE
			,T7.N_ID_TIPOPERSONA
			,T7.D_FEC_CERTIFICADO
			,T7.D_FEC_INIVIGENCIA
			,T7.D_FEC_FINVIGENCIA
			,T7.D_FEC_REGISTRO
			,T7.D_FEC_VENTA
			,T7.N_NUM_VALORCOMERCIAL
			,T7.N_NUM_PRIMABRUTA
			,T7.N_NUM_PRIMANETA
			,T7.N_NUM_COM_CANAL
			,T7.N_NUM_VERSION
			,T7.C_OBS_DESCRIPTIVO
			,T7.N_ID_PERSONA
			,T7.C_NOM_COMPLETO
			,T7.N_ID_CONTRATANTE
			,T7.C_TIPO_IDENTIDAD_CONTRATANTE
			,T7.C_NUM_IDENTIDAD_CONTRATANTE
			,T7.C_NOM_COMPLETO_CONTRATANTE
			,T7.N_ID_UBIGEODEPARTAMENTO
			,T7.N_ID_UBIGEOPROVINCIA
			,T7.N_ID_UBIGEODISTRITO
			,T7.N_ID_TIPOVIA
			,T7.C_DES_DIRECCION
			,T7.C_VAL_NUMVIA
			,T7.N_ID_ASEGURADO
			,T7.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T7.C_TIPO_IDENTIDAD_ASEGURADO
			,T7.C_NUM_IDENTIDAD_ASEGURADO
			,T7.C_APE_PATERNO_ASEGURADO
			,T7.C_APE_MATERNO_ASEGURADO
			,T7.C_NOMBRE_ASEGURADO
			,T7.C_NOM_COMPLETO_ASEGURADO
			,T7.C_CELULAR_ASEGURADO
			,T7.C_CORREO_ASEGURADO
			,T7.N_ID_RESPONSABLEPAGO
			,T7.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T7.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T7.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T7.C_DES_TIPOMONEDA
			,T7.C_ABR_TIPOMONEDA
			,T7.N_IND_ACTIVO
			,T7.N_ID_ESTADO
			,T7.C_COD_USUCREACION
			,T7.D_FEC_CREACION
			,T7.C_COD_USUMODIF
			,T7.D_FEC_MODIFICACION
			,T7.N_ID_ESTADOTRANSFERENCIA
			,T7.C_DES_ESTADOTRANSFERENCIA
			,T7.MESHABILITADO
			,T7.C_DES_REGION
			,T7.C_DES_ZONA
			,T7.N_ID_ESTABLECIMIENTO
			,T7.C_VAL_CODHOMOLOGACION
			,T7.C_NOM_ESTABLECIMIENTO
			,T7.N_ID_PEREMISOR
			,PERSE.C_NOM_COMPLETO AS C_NOM_COMPLETO_EMISOR
			,T7.N_ID_PERVENDEDOR
			,T7.N_ID_ADJUNTOPOLIZA
			,T7.C_MODELO_SUBMODELO
			,T7.D_FEC_ANULACION
			,T7.N_ID_PERANULACION
			,T7.N_ID_MOTIVOANULA
			,T7.N_IND_ANULAR
			,T7.N_IND_CANCELAR
			,T7.N_ID_CANAL
			,T7.C_NOM_CANAL
			,T7.C_NUM_CREDITO
		FROM TABLA_7 T7
		LEFT JOIN T_MAE_PERSONA PERSE ON PERSE.N_ID_PERSONA = T7.N_ID_PEREMISOR
	), TABLA_9 AS (
		SELECT
			T8.NUMROW
			,T8.ROW_TOTAL
			,T8.N_ID_POLIZA
			,T8.C_NUM_POLIZA
			,T8.N_ID_CERTIFICADO
			,T8.C_NUM_CERTIFICADO
			,T8.N_ID_COTIZACION
			,T8.C_NUM_COTIZACION
			,T8.N_ID_ENTIDAD
			,T8.C_NOM_ENTIDAD
			,T8.N_ID_RAMO
			,T8.N_ID_PRODUCTO
			,T8.C_DES_PRODUCTO
			,T8.N_ID_PLAN
			,T8.C_COD_PLAN
			,T8.C_DES_CORTAPLAN
			,T8.C_DES_LARGAPLAN
			,T8.C_COD_REFERENCIA
			,T8.C_COD_TRAMA
			,T8.C_VAL_SECPOLIZA
			,T8.C_VAL_POLIZA
			,T8.N_ID_TIPOPOLIZA
			,T8.N_ID_TIPOPAGOPOLIZA
			,T8.N_ID_TIPOMONEDA
			,T8.C_DES_TIPOVIGENCIA
			,T8.N_ID_TIPOREGLATARIFA
			,T8.N_ID_TIPOPLAN
			,T8.N_ID_TIPOVIGENCIA
			,T8.N_ID_TIPOCLIENTE
			,T8.N_ID_TIPOPERSONA
			,T8.D_FEC_CERTIFICADO
			,T8.D_FEC_INIVIGENCIA
			,T8.D_FEC_FINVIGENCIA
			,T8.D_FEC_REGISTRO
			,T8.D_FEC_VENTA
			,T8.N_NUM_VALORCOMERCIAL
			,T8.N_NUM_PRIMABRUTA
			,T8.N_NUM_PRIMANETA
			,T8.N_NUM_COM_CANAL
			,T8.N_NUM_VERSION
			,T8.C_OBS_DESCRIPTIVO
			,T8.N_ID_PERSONA
			,T8.C_NOM_COMPLETO
			,T8.N_ID_CONTRATANTE
			,T8.C_TIPO_IDENTIDAD_CONTRATANTE
			,T8.C_NUM_IDENTIDAD_CONTRATANTE
			,T8.C_NOM_COMPLETO_CONTRATANTE
			,T8.N_ID_UBIGEODEPARTAMENTO
			,T8.N_ID_UBIGEOPROVINCIA
			,T8.N_ID_UBIGEODISTRITO
			,T8.N_ID_TIPOVIA
			,T8.C_DES_DIRECCION
			,T8.C_VAL_NUMVIA
			,T8.N_ID_ASEGURADO
			,T8.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T8.C_TIPO_IDENTIDAD_ASEGURADO
			,T8.C_NUM_IDENTIDAD_ASEGURADO
			,T8.C_APE_PATERNO_ASEGURADO
			,T8.C_APE_MATERNO_ASEGURADO
			,T8.C_NOMBRE_ASEGURADO
			,T8.C_NOM_COMPLETO_ASEGURADO
			,T8.C_CELULAR_ASEGURADO
			,T8.C_CORREO_ASEGURADO
			,T8.N_ID_RESPONSABLEPAGO
			,T8.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T8.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T8.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T8.C_DES_TIPOMONEDA
			,T8.C_ABR_TIPOMONEDA
			,T8.N_IND_ACTIVO
			,T8.N_ID_ESTADO
			,T8.C_COD_USUCREACION
			,T8.D_FEC_CREACION
			,T8.C_COD_USUMODIF
			,T8.D_FEC_MODIFICACION
			,T8.N_ID_ESTADOTRANSFERENCIA
			,T8.C_DES_ESTADOTRANSFERENCIA
			,T8.MESHABILITADO
			,T8.C_DES_REGION
			,T8.C_DES_ZONA
			,T8.N_ID_ESTABLECIMIENTO
			,T8.C_VAL_CODHOMOLOGACION
			,T8.C_NOM_ESTABLECIMIENTO
			,T8.N_ID_PEREMISOR
			,T8.C_NOM_COMPLETO_EMISOR
			,T8.N_ID_PERVENDEDOR
			,PERSV.C_VAL_CODREFERENCIA
			,PERSV.C_NOM_COMPLETO AS C_NOM_COMPLETO_VENDEDOR
			,UPPER(TIPOVE.C_DES_TIPO) AS C_TIPO_FUNCIONARIO 
			,T8.N_ID_ADJUNTOPOLIZA
			,T8.C_MODELO_SUBMODELO
			,T8.D_FEC_ANULACION
			,T8.N_ID_PERANULACION
			,T8.N_ID_MOTIVOANULA
			,T8.N_IND_ANULAR
			,T8.N_IND_CANCELAR
			,T8.N_ID_CANAL
			,T8.C_NOM_CANAL
			,T8.C_NUM_CREDITO
		FROM TABLA_8 T8
		LEFT JOIN T_MAE_PERSONA PERSV ON PERSV.N_ID_PERSONA = T8.N_ID_PERVENDEDOR  
		LEFT JOIN T_DET_PERSONA DTPERV ON PERSV.N_ID_PERSONA = DTPERV.N_ID_PERSONA 
		LEFT JOIN T_MAE_TIPO TIPOVE ON TIPOVE.N_ID_TIPO=DTPERV.N_ID_TIPOROL  
	), TABLA_10 AS (
		SELECT
			T9.NUMROW
			,T9.ROW_TOTAL
			,T9.N_ID_POLIZA
			,T9.C_NUM_POLIZA
			,T9.N_ID_CERTIFICADO
			,T9.C_NUM_CERTIFICADO
			,T9.N_ID_COTIZACION
			,T9.C_NUM_COTIZACION
			,T9.N_ID_ENTIDAD
			,T9.C_NOM_ENTIDAD
			,T9.N_ID_RAMO
			,T9.N_ID_PRODUCTO
			,T9.C_DES_PRODUCTO
			,T9.N_ID_PLAN
			,T9.C_COD_PLAN
			,T9.C_DES_CORTAPLAN
			,T9.C_DES_LARGAPLAN
			,T9.C_COD_REFERENCIA
			,T9.C_COD_TRAMA
			,T9.C_VAL_SECPOLIZA
			,T9.C_VAL_POLIZA
			,T9.N_ID_TIPOPOLIZA
			,T9.N_ID_TIPOPAGOPOLIZA
			,T9.N_ID_TIPOMONEDA
			,T9.C_DES_TIPOVIGENCIA
			,T9.N_ID_TIPOREGLATARIFA
			,T9.N_ID_TIPOPLAN
			,T9.N_ID_TIPOVIGENCIA
			,T9.N_ID_TIPOCLIENTE
			,T9.N_ID_TIPOPERSONA
			,T9.D_FEC_CERTIFICADO
			,T9.D_FEC_INIVIGENCIA
			,T9.D_FEC_FINVIGENCIA
			,T9.D_FEC_REGISTRO
			,T9.D_FEC_VENTA
			,T9.N_NUM_VALORCOMERCIAL
			,T9.N_NUM_PRIMABRUTA
			,T9.N_NUM_PRIMANETA
			,T9.N_NUM_COM_CANAL
			,T9.N_NUM_VERSION
			,T9.C_OBS_DESCRIPTIVO
			,T9.N_ID_PERSONA
			,T9.C_NOM_COMPLETO
			,T9.N_ID_CONTRATANTE
			,T9.C_TIPO_IDENTIDAD_CONTRATANTE
			,T9.C_NUM_IDENTIDAD_CONTRATANTE
			,T9.C_NOM_COMPLETO_CONTRATANTE
			,T9.N_ID_UBIGEODEPARTAMENTO
			,T9.N_ID_UBIGEOPROVINCIA
			,T9.N_ID_UBIGEODISTRITO
			,T9.N_ID_TIPOVIA
			,T9.C_DES_DIRECCION
			,T9.C_VAL_NUMVIA
			,T9.N_ID_ASEGURADO
			,T9.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T9.C_TIPO_IDENTIDAD_ASEGURADO
			,T9.C_NUM_IDENTIDAD_ASEGURADO
			,T9.C_APE_PATERNO_ASEGURADO
			,T9.C_APE_MATERNO_ASEGURADO
			,T9.C_NOMBRE_ASEGURADO
			,T9.C_NOM_COMPLETO_ASEGURADO
			,T9.C_CELULAR_ASEGURADO
			,T9.C_CORREO_ASEGURADO
			,T9.N_ID_RESPONSABLEPAGO
			,T9.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T9.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T9.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T9.C_DES_TIPOMONEDA
			,T9.C_ABR_TIPOMONEDA
			,T9.N_IND_ACTIVO
			,T9.N_ID_ESTADO
			,T9.C_COD_USUCREACION
			,T9.D_FEC_CREACION
			,T9.C_COD_USUMODIF
			,T9.D_FEC_MODIFICACION
			,T9.N_ID_ESTADOTRANSFERENCIA
			,T9.C_DES_ESTADOTRANSFERENCIA
			,T9.MESHABILITADO
			,T9.C_DES_REGION
			,T9.C_DES_ZONA
			,T9.N_ID_ESTABLECIMIENTO
			,T9.C_VAL_CODHOMOLOGACION
			,T9.C_NOM_ESTABLECIMIENTO
			,T9.N_ID_PEREMISOR
			,T9.C_NOM_COMPLETO_EMISOR
			,T9.N_ID_PERVENDEDOR
			,T9.C_VAL_CODREFERENCIA
			,T9.C_NOM_COMPLETO_VENDEDOR
			,T9.C_TIPO_FUNCIONARIO
			,T9.N_ID_ADJUNTOPOLIZA
			,ISNULL(ADJP.C_DES_ADJUNTO,'''') AS C_DES_ADJUNTOPOLIZA
			,T9.C_MODELO_SUBMODELO
			,T9.D_FEC_ANULACION
			,T9.N_ID_PERANULACION
			,T9.N_ID_MOTIVOANULA
			,T9.N_IND_ANULAR
			,T9.N_IND_CANCELAR
			,T9.N_ID_CANAL
			,T9.C_NOM_CANAL
			,T9.C_NUM_CREDITO
		FROM TABLA_9 T9
		LEFT JOIN T_MAE_ADJUNTO ADJP ON ADJP.N_ID_ADJUNTO = T9.N_ID_ADJUNTOPOLIZA   
	),TABLA_11 AS (
		SELECT
			T10.NUMROW
			,T10.ROW_TOTAL
			,T10.N_ID_POLIZA
			,T10.C_NUM_POLIZA
			,T10.N_ID_CERTIFICADO
			,T10.C_NUM_CERTIFICADO
			,T10.N_ID_COTIZACION
			,T10.C_NUM_COTIZACION
			,T10.N_ID_ENTIDAD
			,T10.C_NOM_ENTIDAD
			,T10.N_ID_RAMO
			,T10.N_ID_PRODUCTO
			,T10.C_DES_PRODUCTO
			,T10.N_ID_PLAN
			,T10.C_COD_PLAN
			,T10.C_DES_CORTAPLAN
			,T10.C_DES_LARGAPLAN
			,T10.C_COD_REFERENCIA
			,T10.C_COD_TRAMA
			,T10.C_VAL_SECPOLIZA
			,T10.C_VAL_POLIZA
			,T10.N_ID_TIPOPOLIZA
			,T10.N_ID_TIPOPAGOPOLIZA
			,T10.N_ID_TIPOMONEDA
			,T10.C_DES_TIPOVIGENCIA
			,T10.N_ID_TIPOREGLATARIFA
			,T10.N_ID_TIPOPLAN
			,T10.N_ID_TIPOVIGENCIA
			,T10.N_ID_TIPOCLIENTE
			,T10.N_ID_TIPOPERSONA
			,T10.D_FEC_CERTIFICADO
			,T10.D_FEC_INIVIGENCIA
			,T10.D_FEC_FINVIGENCIA
			,T10.D_FEC_REGISTRO
			,T10.D_FEC_VENTA
			,T10.N_NUM_VALORCOMERCIAL
			,T10.N_NUM_PRIMABRUTA
			,T10.N_NUM_PRIMANETA
			,T10.N_NUM_COM_CANAL
			,T10.N_NUM_VERSION
			,T10.C_OBS_DESCRIPTIVO
			,T10.N_ID_PERSONA
			,T10.C_NOM_COMPLETO
			,T10.N_ID_CONTRATANTE
			,T10.C_TIPO_IDENTIDAD_CONTRATANTE
			,T10.C_NUM_IDENTIDAD_CONTRATANTE
			,T10.C_NOM_COMPLETO_CONTRATANTE
			,T10.N_ID_UBIGEODEPARTAMENTO
			,T10.N_ID_UBIGEOPROVINCIA
			,T10.N_ID_UBIGEODISTRITO
			,T10.N_ID_TIPOVIA
			,T10.C_DES_DIRECCION
			,T10.C_VAL_NUMVIA
			,T10.N_ID_ASEGURADO
			,T10.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T10.C_TIPO_IDENTIDAD_ASEGURADO
			,T10.C_NUM_IDENTIDAD_ASEGURADO
			,T10.C_APE_PATERNO_ASEGURADO
			,T10.C_APE_MATERNO_ASEGURADO
			,T10.C_NOMBRE_ASEGURADO
			,T10.C_NOM_COMPLETO_ASEGURADO
			,T10.C_CELULAR_ASEGURADO
			,T10.C_CORREO_ASEGURADO
			,T10.N_ID_RESPONSABLEPAGO
			,T10.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T10.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T10.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T10.C_DES_TIPOMONEDA
			,T10.C_ABR_TIPOMONEDA
			,T10.N_IND_ACTIVO
			,T10.N_ID_ESTADO
			,T10.C_COD_USUCREACION
			,T10.D_FEC_CREACION
			,T10.C_COD_USUMODIF
			,T10.D_FEC_MODIFICACION
			,T10.N_ID_ESTADOTRANSFERENCIA
			,T10.C_DES_ESTADOTRANSFERENCIA
			,T10.MESHABILITADO
			,T10.C_DES_REGION
			,T10.C_DES_ZONA
			,T10.N_ID_ESTABLECIMIENTO
			,T10.C_VAL_CODHOMOLOGACION
			,T10.C_NOM_ESTABLECIMIENTO
			,T10.N_ID_PEREMISOR
			,T10.C_NOM_COMPLETO_EMISOR
			,T10.N_ID_PERVENDEDOR
			,T10.C_VAL_CODREFERENCIA
			,T10.C_NOM_COMPLETO_VENDEDOR
			,T10.C_TIPO_FUNCIONARIO
			,T10.N_ID_ADJUNTOPOLIZA
			,T10.C_DES_ADJUNTOPOLIZA
			,T10.C_MODELO_SUBMODELO
			,T10.D_FEC_ANULACION
			,T10.N_ID_PERANULACION
			,PER.C_NOM_COMPLETO AS C_PER_ANULACION
			,T10.N_ID_MOTIVOANULA
			,T10.N_IND_ANULAR
			,T10.N_IND_CANCELAR
			,T10.N_ID_CANAL
			,T10.C_NOM_CANAL
			,T10.C_NUM_CREDITO
		FROM TABLA_10 T10
		LEFT JOIN T_MAE_PERSONA PER ON T10.N_ID_PERANULACION = PER.N_ID_PERSONA
	), TABLA_12 AS (
		SELECT
			T11.NUMROW
			,T11.ROW_TOTAL
			,T11.N_ID_POLIZA
			,T11.C_NUM_POLIZA
			,T11.N_ID_CERTIFICADO
			,T11.C_NUM_CERTIFICADO
			,T11.N_ID_COTIZACION
			,T11.C_NUM_COTIZACION
			,T11.N_ID_ENTIDAD
			,T11.C_NOM_ENTIDAD
			,T11.N_ID_RAMO
			,T11.N_ID_PRODUCTO
			,T11.C_DES_PRODUCTO
			,T11.N_ID_PLAN
			,T11.C_COD_PLAN
			,T11.C_DES_CORTAPLAN
			,T11.C_DES_LARGAPLAN
			,T11.C_COD_REFERENCIA
			,T11.C_COD_TRAMA
			,T11.C_VAL_SECPOLIZA
			,T11.C_VAL_POLIZA
			,T11.N_ID_TIPOPOLIZA
			,T11.N_ID_TIPOPAGOPOLIZA
			,T11.N_ID_TIPOMONEDA
			,T11.N_ID_TIPOREGLATARIFA
			,T11.N_ID_TIPOPLAN
			,T11.N_ID_TIPOVIGENCIA
			,T11.N_ID_TIPOCLIENTE
			,T11.N_ID_TIPOPERSONA
			,T11.D_FEC_CERTIFICADO
			,T11.D_FEC_INIVIGENCIA
			,T11.D_FEC_FINVIGENCIA
			,T11.D_FEC_REGISTRO
			,T11.D_FEC_VENTA
			,T11.N_NUM_VALORCOMERCIAL
			,T11.N_NUM_PRIMABRUTA
			,T11.N_NUM_PRIMANETA
			,T11.N_NUM_COM_CANAL
			,T11.N_NUM_VERSION
			,T11.C_OBS_DESCRIPTIVO
			,T11.N_ID_PERSONA
			,T11.C_NOM_COMPLETO
			,T11.N_ID_CONTRATANTE
			,T11.C_TIPO_IDENTIDAD_CONTRATANTE
			,T11.C_NUM_IDENTIDAD_CONTRATANTE
			,T11.C_NOM_COMPLETO_CONTRATANTE
			,T11.N_ID_UBIGEODEPARTAMENTO
			,T11.N_ID_UBIGEOPROVINCIA
			,T11.N_ID_UBIGEODISTRITO
			,T11.N_ID_TIPOVIA
			,T11.C_DES_DIRECCION
			,T11.C_VAL_NUMVIA
			,T11.N_ID_ASEGURADO
			,T11.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T11.C_TIPO_IDENTIDAD_ASEGURADO
			,T11.C_NUM_IDENTIDAD_ASEGURADO
			,T11.C_APE_PATERNO_ASEGURADO
			,T11.C_APE_MATERNO_ASEGURADO
			,T11.C_NOMBRE_ASEGURADO
			,T11.C_NOM_COMPLETO_ASEGURADO
			,T11.C_CELULAR_ASEGURADO
			,T11.C_CORREO_ASEGURADO
			,T11.N_ID_RESPONSABLEPAGO
			,T11.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T11.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T11.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T11.C_DES_TIPOMONEDA
			,T11.C_ABR_TIPOMONEDA
			,T11.C_DES_TIPOVIGENCIA
			,T11.N_IND_ACTIVO
			,T11.N_ID_ESTADO
			,T11.C_COD_USUCREACION
			,T11.D_FEC_CREACION
			,T11.C_COD_USUMODIF
			,T11.D_FEC_MODIFICACION
			,T11.N_ID_ESTADOTRANSFERENCIA
			,T11.C_DES_ESTADOTRANSFERENCIA
			,T11.MESHABILITADO
			,T11.C_DES_REGION
			,T11.C_DES_ZONA
			,T11.N_ID_ESTABLECIMIENTO
			,T11.C_VAL_CODHOMOLOGACION
			,T11.C_NOM_ESTABLECIMIENTO
			,T11.N_ID_PEREMISOR
			,T11.C_NOM_COMPLETO_EMISOR
			,T11.N_ID_PERVENDEDOR
			,T11.C_VAL_CODREFERENCIA
			,T11.C_NOM_COMPLETO_VENDEDOR
			,T11.C_TIPO_FUNCIONARIO
			,T11.N_ID_ADJUNTOPOLIZA
			,T11.C_DES_ADJUNTOPOLIZA
			,T11.C_MODELO_SUBMODELO
			,T11.D_FEC_ANULACION
			,T11.N_ID_PERANULACION
			,T11.C_PER_ANULACION
			,MOA.C_DES_TIPO AS C_DES_MOTIVOANULACION
			,T11.N_IND_ANULAR
			,T11.N_IND_CANCELAR
			,T11.N_ID_CANAL
			,T11.C_NOM_CANAL
			,T11.C_NUM_CREDITO
		FROM TABLA_11 T11
		LEFT JOIN T_MAE_TIPO MOA ON T11.N_ID_MOTIVOANULA = MOA.N_ID_TIPO
	)

		SELECT			
			T12.NUMROW
			,T12.ROW_TOTAL
			,T12.N_ID_POLIZA
			,T12.C_NUM_POLIZA
			,T12.N_ID_CERTIFICADO
			,T12.C_NUM_CERTIFICADO
			,T12.N_ID_COTIZACION
			,T12.C_NUM_COTIZACION
			,T12.N_ID_ENTIDAD
			,T12.C_NOM_ENTIDAD
			,T12.N_ID_RAMO
			,T12.N_ID_PRODUCTO
			,T12.C_DES_PRODUCTO
			,T12.N_ID_PLAN
			,T12.C_COD_PLAN
			,T12.C_DES_CORTAPLAN
			,T12.C_DES_LARGAPLAN
			,T12.C_COD_REFERENCIA
			,T12.C_COD_TRAMA
			,T12.C_VAL_SECPOLIZA
			,T12.C_VAL_POLIZA
			,T12.N_ID_TIPOPOLIZA
			,T12.N_ID_TIPOPAGOPOLIZA
			,T12.N_ID_TIPOMONEDA
			,T12.N_ID_TIPOREGLATARIFA
			,T12.N_ID_TIPOPLAN
			,T12.N_ID_TIPOVIGENCIA
			,T12.N_ID_TIPOCLIENTE
			,T12.N_ID_TIPOPERSONA
			,T12.D_FEC_CERTIFICADO
			,T12.D_FEC_INIVIGENCIA
			,T12.D_FEC_FINVIGENCIA
			,T12.D_FEC_REGISTRO
			,T12.D_FEC_VENTA
			,T12.N_NUM_VALORCOMERCIAL
			,T12.N_NUM_PRIMABRUTA
			,T12.N_NUM_PRIMANETA
			,T12.N_NUM_COM_CANAL
			,T12.N_NUM_VERSION
			,T12.C_OBS_DESCRIPTIVO
			,T12.N_ID_PERSONA
			,T12.C_NOM_COMPLETO
			,T12.N_ID_CONTRATANTE
			,T12.C_TIPO_IDENTIDAD_CONTRATANTE
			,T12.C_NUM_IDENTIDAD_CONTRATANTE
			,T12.C_NOM_COMPLETO_CONTRATANTE
			,T12.N_ID_UBIGEODEPARTAMENTO
			,T12.N_ID_UBIGEOPROVINCIA
			,T12.N_ID_UBIGEODISTRITO
			,T12.N_ID_TIPOVIA
			,T12.C_DES_DIRECCION
			,T12.C_VAL_NUMVIA
			,T12.N_ID_ASEGURADO
			,T12.N_ID_TIPO_IDENTIDAD_ASEGURADO
			,T12.C_TIPO_IDENTIDAD_ASEGURADO
			,T12.C_NUM_IDENTIDAD_ASEGURADO
			,T12.C_APE_PATERNO_ASEGURADO
			,T12.C_APE_MATERNO_ASEGURADO
			,T12.C_NOMBRE_ASEGURADO
			,T12.C_NOM_COMPLETO_ASEGURADO
			,T12.C_CELULAR_ASEGURADO
			,T12.C_CORREO_ASEGURADO
			,T12.N_ID_RESPONSABLEPAGO
			,T12.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T12.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T12.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T12.C_DES_TIPOMONEDA
			,T12.C_ABR_TIPOMONEDA
			,T12.C_DES_TIPOVIGENCIA
			,T12.N_IND_ACTIVO
			,T12.N_ID_ESTADO
			,EST.C_DES_ESTADO
			,T12.C_COD_USUCREACION
			,T12.D_FEC_CREACION
			,T12.C_COD_USUMODIF
			,T12.D_FEC_MODIFICACION
			,T12.N_ID_ESTADOTRANSFERENCIA
			,T12.C_DES_ESTADOTRANSFERENCIA
			,T12.MESHABILITADO
			,T12.C_DES_REGION
			,T12.C_DES_ZONA
			,T12.N_ID_ESTABLECIMIENTO
			,T12.C_VAL_CODHOMOLOGACION
			,T12.C_NOM_ESTABLECIMIENTO
			,T12.N_ID_PEREMISOR
			,T12.C_NOM_COMPLETO_EMISOR
			,T12.N_ID_PERVENDEDOR
			,T12.C_VAL_CODREFERENCIA
			,T12.C_NOM_COMPLETO_VENDEDOR
			,T12.C_TIPO_FUNCIONARIO
			,T12.N_ID_ADJUNTOPOLIZA
			,T12.C_DES_ADJUNTOPOLIZA
			,T12.C_MODELO_SUBMODELO
			,T12.D_FEC_ANULACION
			,T12.N_ID_PERANULACION
			,T12.C_PER_ANULACION
			,T12.C_DES_MOTIVOANULACION
			,T12.N_IND_ANULAR
			,T12.N_IND_CANCELAR
			,T12.N_ID_CANAL
			,T12.C_NOM_CANAL
			,T12.C_NUM_CREDITO
		FROM TABLA_12 T12
		INNER JOIN T_MAE_ESTADO EST ON T12.N_ID_ESTADO = EST.N_ID_ESTADO
		ORDER BY 1
	'
	print @script_ejecutar
	EXEC (@script_ejecutar)
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepProduccion_v2]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE  [dbo].[SPS_T_RepProduccion_v2](
	@pi_id_poliza INT=0,
	@pi_id_cotizacion INT=0,
	@pi_id_producto INT=0,
	@pi_id_plan INT=0,
	@pi_id_entidad INT=0,
	@pi_id_tipoMoneda SMALLINT=0,
	@pi_id_tipoFormaPago SMALLINT=0,
	@pi_id_tipoMedioPago SMALLINT=0,
	@pi_id_tipoFecha SMALLINT=0,
	@pi_fec_iniVigencia VARCHAR(30)='',
	@pi_fec_finVigencia VARCHAR(30)='',
	@pi_id_estado SMALLINT=0,
	@pi_id_estadoTransferencia SMALLINT=0,
	@pi_id_tipoPersona SMALLINT=0,
	@pi_id_tipoIdentidad SMALLINT=0,
	@pi_val_docIdentidad VARCHAR(20)='',
	@pi_apellidos VARCHAR(100)='',
	@pi_nombres VARCHAR(300)='',
	@pi_id_territorio INT=0,
	@pi_id_zona INT=0,
	@pi_id_region INT=0,
	@pi_id_canal INT=0,
	@pi_id_establecimiento INT=0,
	@pi_num_placa VARCHAR(20)='',
	@pi_num_serie VARCHAR(50)='',
	@pi_num_motor VARCHAR(50)='',
	@pi_num_poliza VARCHAR(30)='',
	@pi_num_certificado VARCHAR(30)='',
	@pi_id_ramo INT=0,
	@pi_num_unico VARCHAR(30)='',
	@pi_ind_orden INT=0,
	@pi_ind_orden2 INT=0,
	@pi_ind_orden3 INT=0,
	@pi_id_usuario INT=0,
	@pi_num_solicitud VARCHAR(30)=''
	)

AS
BEGIN

	SET @pi_id_poliza = ISNULL(@pi_id_poliza,0)
	SET @pi_id_cotizacion = ISNULL(@pi_id_cotizacion,0)
	SET @pi_id_producto = ISNULL(@pi_id_producto,0)
	SET @pi_id_plan = ISNULL(@pi_id_plan,0)
	SET @pi_id_entidad = ISNULL(@pi_id_entidad,0)
	SET @pi_id_tipoMoneda = ISNULL(@pi_id_tipoMoneda,0)
	SET @pi_id_tipoFormaPago = ISNULL(@pi_id_tipoFormaPago,0)
	SET @pi_id_tipoMedioPago = ISNULL(@pi_id_tipoMedioPago,0)
	SET @pi_id_tipoFecha = ISNULL(@pi_id_tipoFecha,0)
	SET @pi_fec_iniVigencia = ISNULL(@pi_fec_iniVigencia,'')
	SET @pi_fec_finVigencia = ISNULL(@pi_fec_finVigencia,'')
	SET @pi_id_estado = ISNULL(@pi_id_estado,0)
	SET @pi_id_estadoTransferencia = ISNULL(@pi_id_estadoTransferencia,0)
	SET @pi_id_tipoPersona = ISNULL(@pi_id_tipoPersona,0)
	SET @pi_id_tipoIdentidad = ISNULL(@pi_id_tipoIdentidad,0)
	SET @pi_val_docIdentidad = ISNULL(@pi_val_docIdentidad,'')
	SET @pi_apellidos = ISNULL(@pi_apellidos,'')
	SET @pi_nombres = ISNULL(@pi_nombres,'')
	SET @pi_id_territorio = ISNULL(@pi_id_territorio,0)
	SET @pi_id_zona = ISNULL(@pi_id_zona,0)
	SET @pi_id_region = ISNULL(@pi_id_region,0)
	SET @pi_id_canal = ISNULL(@pi_id_canal,0)
	SET @pi_id_establecimiento = ISNULL(@pi_id_establecimiento,0)
	SET @pi_num_placa = ISNULL(@pi_num_placa,'')
	SET @pi_num_serie = ISNULL(@pi_num_serie,'')
	SET @pi_num_motor = ISNULL(@pi_num_motor,'')
	SET @pi_num_poliza = ISNULL(@pi_num_poliza,'')
	SET @pi_num_certificado = ISNULL(@pi_num_certificado,'')
	SET @pi_id_ramo = ISNULL(@pi_id_ramo,0)
	SET @pi_num_solicitud = ISNULL(@pi_num_solicitud,'')

	DECLARE @pi_idPersona INT
	DECLARE @v_mcaVendedor INT
	DECLARE @v_fec_iniVigencia DATETIME
	DECLARE @v_fec_finVigencia DATETIME

	DECLARE @ptoVenta TABLE (N_ID_ZONAL INT)
	DECLARE @plan TABLE (N_ID_PLAN INT)


	INSERT @ptoVenta VALUES (0)
	INSERT @plan VALUES (0)

	DECLARE @v_Desde INT=0, @v_CantidadRegistro INT=0;
	declare @certificadoIds table(N_ID_CERTIFICADO int);

	IF @pi_fec_iniVigencia != ''
		SET @pi_fec_iniVigencia = SUBSTRING(@pi_fec_iniVigencia,7,4)+'-'+SUBSTRING(@pi_fec_iniVigencia,4,2)+'-'+SUBSTRING(@pi_fec_iniVigencia,1,2) + ' 00:00:00.000'
		--SET @v_fec_iniVigencia = CONVERT(DATETIME, @pi_fec_iniVigencia, 103)

	IF @pi_fec_finVigencia != ''
		SET @pi_fec_finVigencia = SUBSTRING(@pi_fec_finVigencia,7,4)+'-'+SUBSTRING(@pi_fec_finVigencia,4,2)+'-'+SUBSTRING(@pi_fec_finVigencia,1,2) + ' 23:59:59.000'
		--SET @v_fec_finVigencia = CONVERT(DATETIME, @pi_fec_finVigencia + ' 23:59:59.000', 103)
	
	SELECT @pi_idPersona = USU.N_ID_PERSONA, @v_mcaVendedor = PER.N_ID_MCA_VENDEDOR
	FROM T_MAE_USUARIO USU
	INNER JOIN T_DET_USUARIOPERFIL DUP ON USU.N_ID_USUARIO = DUP.N_ID_USUARIO
	INNER JOIN  T_MAE_PERFIL PER ON PER.N_ID_PERFIL = DUP.N_ID_PERFIL AND DUP.N_ID_USUARIO = @pi_id_usuario

	DECLARE @script_ejecutar					NVARCHAR(MAX) = '',
			@condicional_certificado			VARCHAR(300) = '',
			@condicional_poliza					VARCHAR(300) = '',
			@condicional_plan					VARCHAR(300) = '',
			@condicional_producto				VARCHAR(300) = '',
			@condicional_estructura_plan		VARCHAR(MAX) = '',
			@condicional_estructura_ptoventa	VARCHAR(MAX) = '',
			@condicional_estructura_est			VARCHAR(MAX) = '',
			@condicional_ptoVenta				VARCHAR(300) = '',
			@condicional_region					VARCHAR(300) = '',
			@condicional_zona					VARCHAR(300) = '',
			@condicional_territorio				VARCHAR(300) = '',
			@condicional_tercero				VARCHAR(MAX) = ''

	--ESTRUCURA DE PRODUCTO
	IF ISNULL(@v_mcaVendedor,9) = 9
	BEGIN
		IF(SELECT COUNT(N_ID_PLAN)
		FROM T_MAE_USUARIO_CIA_PRODUCTO_PLAN
		WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_COMPANIA = 0 AND N_ID_PRODUCTO = 0 AND N_ID_PLAN = 0 AND N_ID_ESTADO = 8) = 0
		BEGIN
			IF @pi_id_producto != 0
			BEGIN
				IF @pi_id_plan != 0
				BEGIN
					SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
					(SELECT PL.N_ID_PLAN 
					FROM T_MAE_PLAN PL
					INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
					INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
						AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
						AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
						AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
						AND CPP.N_ID_ESTADO = 8
					WHERE PL.N_ID_PLAN = @pi_id_plan) A
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
					(SELECT PL.N_ID_PLAN 
					FROM T_MAE_PLAN PL
					INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
					INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
						AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
						AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
						AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
						AND CPP.N_ID_ESTADO = 8
					WHERE PRD.N_ID_PRODUCTO = @pi_id_producto) A
				END
			END
			ELSE
			BEGIN
				SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM 
				(SELECT PL.N_ID_PLAN 
				FROM T_MAE_PLAN PL
				INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
				INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
					AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD 
					AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
					AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
					AND CPP.N_ID_ESTADO = 8) A
			END

			IF LEN(@condicional_estructura_plan) > 0 
			BEGIN	
				SET @condicional_estructura_plan = SUBSTRING(@condicional_estructura_plan,1,LEN(@condicional_estructura_plan)-1)	
				SET @condicional_estructura_plan = ' AND POL.N_ID_PLAN IN (' + @condicional_estructura_plan + ')'	
			END	
			ELSE
			BEGIN
				SET @condicional_estructura_plan = ' AND POL.N_ID_PLAN IN (0)'	
			END
		END
		ELSE
		BEGIN
			IF @pi_id_entidad != 0
			BEGIN
				IF @pi_id_producto != 0
				BEGIN
					IF @pi_id_plan != 0
					BEGIN
						SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
					END
					ELSE
					BEGIN
						SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
					END
				END
				ELSE
				BEGIN
					SET @condicional_producto = @condicional_producto + ' AND PR.N_ID_ENTIDAD = '  + CONVERT(VARCHAR(10),@pi_id_entidad)
				END
			END
		END
	END
	ELSE
	BEGIN
		IF @pi_id_entidad != 0
		BEGIN
			IF @pi_id_producto != 0
			BEGIN
				IF @pi_id_plan != 0
					SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
				ELSE
					SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
			END
			ELSE
			BEGIN
				SET @condicional_producto = @condicional_producto + ' AND PR.N_ID_ENTIDAD = '  + CONVERT(VARCHAR(10),@pi_id_entidad)
			END
		END

		SET @condicional_plan = @condicional_plan + ' AND CER.N_ID_PERVENDEDOR = ' + CONVERT(VARCHAR,@pi_idPersona)
	END

	--ESTRUCTURA COMERCIAL
	IF ISNULL(@v_mcaVendedor,9) = 9
	BEGIN
		IF(SELECT COUNT(N_ID_PUNTO_VENTA) AS V_VENTA
		FROM T_MAE_USUARIO_CANAL_PTOVENTA
		WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_CANAL = 0 AND N_ID_TERRITORIO = 0 AND N_ID_ZONA = 0 AND N_ID_REGION = 0 AND N_ID_PUNTO_VENTA = 0 AND N_ID_ESTADO = 8) = 0
		BEGIN
			IF @pi_id_canal != 0
			BEGIN
				IF @pi_id_territorio != 0
				BEGIN
					IF @pi_id_zona != 0
					BEGIN
						IF @pi_id_region != 0
						BEGIN
							IF @pi_id_establecimiento !=0
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
								JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
								JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																		AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																		AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																		AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																		AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																		AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																		AND CTZRP.N_ID_ESTADO = 8
								WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region AND PVT.N_ID_ZONAL = @pi_id_establecimiento) A
							END
							ELSE
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
								JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
								JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																		AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																		AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																		AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																		AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																		AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																		AND CTZRP.N_ID_ESTADO = 8
								WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region) A
							END
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
							JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																	AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																	AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																	AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																	AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																	AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																	AND CTZRP.N_ID_ESTADO = 8
							WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
																AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
																AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
																AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
																AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
																AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
																AND CTZRP.N_ID_ESTADO = 8
						WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
															AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
															AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
															AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
															AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
															AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
															AND CTZRP.N_ID_ESTADO = 8
					WHERE TER.N_ID_ENTIDAD = @pi_id_canal) A
				END


			END
			ELSE
			BEGIN
				SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
				(SELECT PVT.N_ID_ESTABLECIMIENTO
				FROM T_MAE_ZONAL PVT
				JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
				JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
				JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
				JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
					AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
					AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
					AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
					AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
					AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
					 AND CTZRP.N_ID_ESTADO = 8) A
			END	

			IF LEN(@condicional_estructura_est) > 0 
			BEGIN	
				SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
			END	
			
			ELSE
			BEGIN
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (0)'	
			END
		END
		ELSE
		BEGIN
			IF @pi_id_canal != 0
			BEGIN
				IF @pi_id_territorio != 0
				BEGIN
					IF @pi_id_zona != 0
					BEGIN
						IF @pi_id_region != 0
						BEGIN
							IF @pi_id_establecimiento != 0
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
							END
							ELSE
							BEGIN
								SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
								(SELECT PVT.N_ID_ESTABLECIMIENTO
								FROM T_MAE_ZONAL PVT
								JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
								WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
							END
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
				END
			END

			IF LEN(@condicional_estructura_est) > 0 
			BEGIN	
				SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
				SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
			END	
		END
	END
	ELSE
	BEGIN
		IF @pi_id_canal != 0
		BEGIN
			IF @pi_id_territorio != 0
			BEGIN
				IF @pi_id_zona != 0
				BEGIN
					IF @pi_id_region != 0
					BEGIN
						IF @pi_id_establecimiento != 0
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
						END
						ELSE
						BEGIN
							SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
						END
					END
					ELSE
					BEGIN
						SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
							(SELECT PVT.N_ID_ESTABLECIMIENTO
							FROM T_MAE_ZONAL PVT
							JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
							JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
							WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
					END
				END
				ELSE
				BEGIN
					SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
						(SELECT PVT.N_ID_ESTABLECIMIENTO
						FROM T_MAE_ZONAL PVT
						JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
						JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
						JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
						WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
				END
			END
			ELSE
			BEGIN
				SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM 
					(SELECT PVT.N_ID_ESTABLECIMIENTO
					FROM T_MAE_ZONAL PVT
					JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
					JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
					JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
					WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
			END
		END

		IF LEN(@condicional_estructura_est) > 0 
		BEGIN	
			SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)	
			SET @condicional_estructura_est = ' AND CER.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'	
		END	
	END

	IF @pi_id_estado = 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_ESTADO IN (4,15,25,26,27)'
	ELSE 
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_ESTADO = ' + CONVERT(VARCHAR(5),@pi_id_estado)
	
	IF @pi_id_tipoFecha = 426
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_VENTA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_VENTA <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 427
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_ANULACION >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_ANULACION <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 585
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_FINVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_FINVIGENCIA <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_id_tipoFecha = 586
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_INIVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_INIVIGENCIA <= ''' + @pi_fec_finVigencia + ''''		
	END
	
	IF @pi_id_tipoFecha = 596
	BEGIN
		IF @pi_fec_iniVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_CERTIFICADO >= ''' + @pi_fec_iniVigencia + ''''

		IF @pi_fec_finVigencia != ''
			SET @condicional_certificado = @condicional_certificado + ' AND CER.D_FEC_CERTIFICADO <= ''' + @pi_fec_finVigencia + ''''		
	END

	IF @pi_num_certificado !=''
		SET @condicional_certificado = @condicional_certificado + ' AND CER.C_NUM_CERTIFICADO =''' + @pi_num_certificado + ''''
	
	IF @pi_id_tipoFormaPago != 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_FORMAPAGO =' + CONVERT(varchar(10),@pi_id_tipoFormaPago)

	IF @pi_id_tipoMedioPago != 0
		SET @condicional_certificado = @condicional_certificado + ' AND CER.N_ID_MEDIOPAGO =' + CONVERT(varchar(10),@pi_id_tipoMedioPago)

	IF @pi_id_poliza != 0
		SET @condicional_poliza = @condicional_poliza + ' AND POL.N_ID_POLIZA = ' + CONVERT(VARCHAR(10),@pi_id_poliza)

	IF @pi_num_poliza != ''
		SET @condicional_poliza = @condicional_poliza + ' AND POL.C_NUM_POLIZA = ''' + CONVERT(VARCHAR(10),@pi_num_poliza) + ''''

	IF @pi_id_tipoMoneda != 0
		SET @condicional_plan = @condicional_plan +' AND PL.N_ID_TIPOMONEDA =' + CONVERT(VARCHAR(5),@pi_id_tipoMoneda)

	IF @pi_id_entidad != 0
		SET @condicional_producto = @condicional_producto +' AND PR.N_ID_ENTIDAD = ' + CONVERT(VARCHAR(5),@pi_id_entidad)
	 
	 IF @pi_num_solicitud IS NOT NULL AND @pi_num_solicitud !=''
	  BEGIN 
		SET @condicional_certificado =  @condicional_certificado + 'AND CER.C_NUM_SOLICITUD =''' + @pi_num_solicitud + ''''
		END
	
	IF @pi_id_tipoPersona != 0
	BEGIN
		DECLARE @CADENA	VARCHAR(MAX) = ''
		DECLARE @WHERE VARCHAR(MAX) = ''
		DECLARE @TABLA_X TABLE(CADENA1	VARCHAR(MAX)) 
		DECLARE @N_ID_CERTIFICADO VARCHAR(MAX)

		IF @pi_id_tipoIdentidad != 0 AND @pi_val_docIdentidad != ''
			SET @WHERE = @WHERE + ' AND TER.N_ID_TIPOIDENTIDAD = ' + CONVERT(VARCHAR(5),@pi_id_tipoIdentidad) + ' AND TER.C_VAL_NUMIDENTIDAD =''' + @pi_val_docIdentidad + ''''
	
		IF @pi_apellidos != ''
			SET @WHERE = @WHERE + ' AND (TER.C_APE_PATERNO +'' ''+ TER.C_APE_MATERNO) LIKE ''%' + @pi_apellidos +'%'''

		IF @pi_nombres != ''
			SET @WHERE = @WHERE + ' AND TER.C_NOM_TERCERO LIKE ''%' + @pi_nombres +'%'''

		SET @CADENA = '
		DECLARE @A1	VARCHAR(MAX)

		SELECT @A1 = COALESCE(@A1,'''') + CAST(N_ID_CERTIFICADO AS VARCHAR(10)) + '','' FROM (
			SELECT RT.N_ID_CERTIFICADO
			FROM T_MAE_TERCERO TER
			INNER JOIN T_DET_ROLTERCEROCERTIFICADO RT ON TER.N_ID_TERCERO = RT.N_ID_TERCERO AND RT.N_ID_TIPOROLTERCERO = ' + CONVERT(VARCHAR,@pi_id_tipoPersona) + ' AND RT.N_ID_ESTADO = 8 AND RT.N_IND_ACTIVO = 1 '
			+ @WHERE + ') A
	
		SELECT @A1
		'

		INSERT @TABLA_X
		EXEC (@CADENA)

		SET @condicional_tercero = (SELECT CADENA1 FROM @TABLA_X)

		IF LEN(@condicional_tercero) > 0 
		BEGIN	
			SET @condicional_tercero = SUBSTRING(@condicional_tercero,1,LEN(@condicional_tercero)-1)	
			SET @condicional_tercero = ' AND CER.N_ID_CERTIFICADO IN (' + @condicional_tercero + ')'	
		END	
	END

	SET @script_ejecutar = '
		WITH TABLA_1 AS (
		SELECT 
			CER.N_ID_CERTIFICADO,
			POL.N_ID_POLIZA,
			CER.N_ID_COTIZACION,
			POL.C_NUM_POLIZA,
			CER.C_NUM_CERTIFICADO,
			ENT.C_NOM_ENTIDAD,
			PR.C_DES_PRODUCTO,
			CONVERT(CHAR(10), CER.D_FEC_VENTA, 103) AS D_FEC_VENTA,
			CONVERT(CHAR(10), CER.D_FEC_CREACION, 103) AS D_FEC_REGISTRO,
			CONVERT(CHAR(10), CER.D_FEC_INIVIGENCIA, 103) AS D_FEC_INIVIGENCIA,
			CONVERT(CHAR(10), CER.D_FEC_FINVIGENCIA, 103) AS D_FEC_FINVIGENCIA,
			CER.N_NUM_PRIMANETA,
			CER.N_NUM_PRIMABRUTA,
			CER.N_ID_ESTADO,
			CER.N_ID_ESTABLECIMIENTO, 
			CER.N_ID_PEREMISOR,
			CER.N_ID_PERVENDEDOR,
			CER.N_ID_PERANULACION, 
			PL.C_DES_CORTAPLAN ,
			TIPR.C_DES_TIPO AS C_ABR_RAMO, 
			CER.N_ID_CANAL ,
			CER.C_NUM_SOLICITUD,
			CASE WHEN CER.N_ID_TIPOMONEDA=219 THEN 1 ELSE 2 END AS COD_MON,
			(SELECT COUNT(DATOPARTS.N_ID_CERTIFICADO)
			FROM T_DET_DATOPARTICULARCERTIFICADO DATOPARTS
			WHERE DATOPART.N_ID_DATOPARTICULAR =DATOPARTS.N_ID_DATOPARTICULAR) AS NRO_RIESGOS,
			CER.N_NUM_IMPORTEDERECHOEMISION AS DER_EMISION,
			ISNULL(CER.N_NUM_IMPORTEDESCUENTOS,''0.0000'') AS DESCUENTOS ,
			CER.N_NUM_IMPORTERECARGADO  AS IMPORTE_RECARGO, 
			ISNULL(CER.N_NUM_IMPORTEINTERESES,''0.0000'')  AS IMPORTE_INTERES,
			ISNULL(CER.N_NUM_IMPORTEIMPUESTO,''0.0000'')  AS IMPORTE_IMPUESTO,
			(SELECT COUNT(CUO.N_ID_CUOTA)
			FROM  T_MAE_CUOTA CUO 
			WHERE CUO.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO) AS NUMERO_CUOTA,
			CONVERT(CHAR(10), CER.D_FEC_INIVIGENCIA, 103) AS FECHA_INIVIGENCIA,
			CONVERT(CHAR(10), CER.D_FEC_FINVIGENCIA, 103) AS FECHA_FINVIGENCIA,
			''0'' AS NUMERO_CUOTAS_CALCULADAS ,
			''''   AS  IMP_COM_AGT,
			''''   AS  IMP_COM_AGT2,
			''''   AS  IMP_COM_AGT3,
			''CANAL''    AS  TIP_GESTOR,
			(SELECT COUNT(CUO.N_ID_CUOTA)
			FROM  T_MAE_CUOTA CUO 
			WHERE CUO.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO) AS  COBRANZAS_NUMCUOTAS,
			(SELECT FORMAT(ROUND(MIN(CU.N_NUM_MONTOCUOTA), 2), ''N2'')
			FROM T_MAE_CUOTA CU 
			WHERE CU.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO) AS COBRANZAS_VALOR_CUOTA, 
		    FORMAT(0, ''N2'') AS COBRANZAS_IMP_REC_PAG,
		    FORMAT(CER.N_NUM_PRIMABRUTA, ''N2'') AS COBRANZAS_IMP_REC_PENDG,
			FORMAT(0, ''N2'')     AS  COBRANZAS_IMP_REC_DEV,	
			''0''        AS  PRIMA_TECNICA_ULTIMA,
			''0''        AS  DESCUENTOS_ULTIMA,
			''0''        AS  IMPORTE_RECARGO_ULTIMA,
			''0''        AS  DERECHO_EMISION_ULTIMA,
			''0''        AS  INTERERESE_ULTIMA,
			''0''        AS  IMPUESTOS_ULTIMA,
			''0''        AS  PRIMA_TOTAL_ULTIMA,
		    ISNULL(TIP.C_ABR_TIPO,'''')  AS COD_MOTIVO_ANULACION,
			ISNULL(DATOPART.C_VAL_BIENES, '''') AS BIENES, 
			ISNULL(DATOPART.C_VAL_EXISTENCIAS, '''') AS EXISTENCIAS 
		FROM T_MAE_CERTIFICADO CER  
		INNER JOIN T_MAE_POLIZA POL ON CER.N_IND_ACTIVO = 1' + @condicional_certificado + @condicional_tercero + ' AND CER.N_ID_POLIZA = POL.N_ID_POLIZA' 
												+ @condicional_poliza + @condicional_estructura_plan + @condicional_estructura_est +
		' INNER JOIN T_MAE_PLAN PL ON POL.N_ID_PLAN = PL.N_ID_PLAN' + @condicional_plan +
		' INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO' + @condicional_producto + 
		' INNER JOIN T_MAE_ENTIDAD ENT ON PR.N_ID_ENTIDAD = ENT.N_ID_ENTIDAD '+
		' INNER JOIN T_MAE_RAMO   RA ON PL.N_ID_RAMO = RA.N_ID_RAMO'+
		' INNER JOIN T_DET_DATOPARTICULARCERTIFICADO DATOPART WITH(NOLOCK) ON CER.N_ID_CERTIFICADO=DATOPART.N_ID_CERTIFICADO'+
		' LEFT JOIN T_MAE_TIPO TIP ON CER.N_ID_MOTIVOANULA =TIP.N_ID_TIPO'+
		' INNER JOIN T_MAE_TIPO TIPR ON	  TIPR.N_ID_TIPO = RA.N_ID_TIPORAMO AND TIPR.N_ID_TIPOPADRE=271
		ORDER BY CER.N_ID_CERTIFICADO DESC
		OFFSET 0 ROWS FETCH NEXT 200000 ROWS ONLY
		), TABLA_2 AS (
		SELECT
			T1.N_ID_CERTIFICADO
			,T1.N_ID_POLIZA
			,T1.N_ID_COTIZACION
			,T1.C_NUM_POLIZA
			,T1.C_NUM_CERTIFICADO
			,T1.C_NOM_ENTIDAD
			,T1.C_DES_PRODUCTO
			,T1.D_FEC_VENTA
			,T1.D_FEC_REGISTRO
			,T1.D_FEC_INIVIGENCIA
			,T1.D_FEC_FINVIGENCIA
			,T1.N_NUM_PRIMANETA
			,T1.N_NUM_PRIMABRUTA
			,PVT.C_COD_ZONAL
			,PVT.C_DES_ZONAL
			,T1.N_ID_ESTADO
			,T1.N_ID_ESTABLECIMIENTO
			,T1.N_ID_PEREMISOR
			,T1.N_ID_PERVENDEDOR
			,T1.N_ID_PERANULACION
			,T1.C_DES_CORTAPLAN
			,T1.C_ABR_RAMO
			,T1.N_ID_CANAL
			,T1.C_NUM_SOLICITUD
			,T1.NRO_RIESGOS
			,T1.COD_MON
			,T1.DER_EMISION
			,T1.DESCUENTOS
			,T1.IMPORTE_RECARGO
			,T1.IMPORTE_INTERES
			,T1.IMPORTE_IMPUESTO
			,T1.NUMERO_CUOTA
			,T1.FECHA_INIVIGENCIA
			,T1.FECHA_FINVIGENCIA
			,T1.NUMERO_CUOTAS_CALCULADAS
			,T1.IMP_COM_AGT
			,T1.IMP_COM_AGT2
			,T1.IMP_COM_AGT3
			,T1.TIP_GESTOR
			,T1.COBRANZAS_NUMCUOTAS
			,T1.COBRANZAS_VALOR_CUOTA
			,T1.COBRANZAS_IMP_REC_PAG
			,T1.COBRANZAS_IMP_REC_PENDG
			,T1.COBRANZAS_IMP_REC_DEV
			,T1.PRIMA_TECNICA_ULTIMA
			,T1.DESCUENTOS_ULTIMA
			,T1.IMPORTE_RECARGO_ULTIMA
			,T1.DERECHO_EMISION_ULTIMA
			,T1.INTERERESE_ULTIMA
			,T1.IMPUESTOS_ULTIMA
			,T1.PRIMA_TOTAL_ULTIMA
			,T1.COD_MOTIVO_ANULACION
			,ENTI.C_NOM_ENTIDAD  AS CANAL
			,T1.BIENES
			,T1.EXISTENCIAS
		FROM TABLA_1 T1
		LEFT JOIN T_MAE_ESTABLECIMIENTO EST ON T1.N_ID_ESTABLECIMIENTO = EST.N_ID_ESTABLECIMIENTO
		LEFT JOIN T_MAE_ZONAL PVT ON EST.N_ID_ZONAL = PVT.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 
		LEFT JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE=REG.N_ID_ZONAL   --REGION 
		LEFT JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE=ZON.N_ID_ZONAL -- ZONA 
		LEFT JOIN T_MAE_ZONAL TERR ON ZON.N_ID_ZONALPADRE =TERR.N_ID_ZONAL --TERRITORIO 
		LEFT JOIN T_MAE_ENTIDAD ENTI ON ENTI.N_ID_ENTIDAD=TERR.N_ID_ENTIDAD
		),TABLA_3 AS (
		SELECT
			T2.N_ID_CERTIFICADO
			,T2.N_ID_POLIZA
			,T2.N_ID_COTIZACION
			,T2.C_NUM_POLIZA
			,T2.C_NUM_CERTIFICADO
			,T2.C_NOM_ENTIDAD
			,T2.C_DES_PRODUCTO
			,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_ASEGURADO
			,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_ASEGURADO
			,ISNULL(TER.C_NOM_COMPLETO,'''') AS C_NOM_COMPLETO_ASEGURADO
			,T2.D_FEC_VENTA
			,T2.D_FEC_REGISTRO
			,T2.D_FEC_INIVIGENCIA
			,T2.D_FEC_FINVIGENCIA
			,T2.N_NUM_PRIMANETA
			,T2.N_NUM_PRIMABRUTA
			,T2.C_COD_ZONAL
			,T2.C_DES_ZONAL
			,T2.N_ID_ESTADO
			,T2.N_ID_ESTABLECIMIENTO
			,T2.N_ID_PEREMISOR
			,T2.N_ID_PERVENDEDOR
			,T2.N_ID_PERANULACION
			,T2.C_DES_CORTAPLAN
			,T2.C_ABR_RAMO
			,T2.N_ID_CANAL
			,T2.C_NUM_SOLICITUD
			,T2.NRO_RIESGOS
			,T2.COD_MON
			,T2.DER_EMISION
			,T2.DESCUENTOS
			,T2.IMPORTE_RECARGO
			,T2.IMPORTE_INTERES
			,T2.IMPORTE_IMPUESTO
			,T2.NUMERO_CUOTA
			,T2.FECHA_INIVIGENCIA
			,T2.FECHA_FINVIGENCIA
			,T2.NUMERO_CUOTAS_CALCULADAS
			,T2.IMP_COM_AGT
			,T2.IMP_COM_AGT2
			,T2.IMP_COM_AGT3
			,T2.TIP_GESTOR
			,T2.COBRANZAS_NUMCUOTAS
			,T2.COBRANZAS_VALOR_CUOTA
			,T2.COBRANZAS_IMP_REC_PAG
			,T2.COBRANZAS_IMP_REC_PENDG
			,T2.COBRANZAS_IMP_REC_DEV
			,T2.PRIMA_TECNICA_ULTIMA
			,T2.DESCUENTOS_ULTIMA
			,T2.IMPORTE_RECARGO_ULTIMA
			,T2.DERECHO_EMISION_ULTIMA
			,T2.INTERERESE_ULTIMA
			,T2.IMPUESTOS_ULTIMA
			,T2.PRIMA_TOTAL_ULTIMA
			,T2.COD_MOTIVO_ANULACION
			,CANAL
			,T2.BIENES
			,T2.EXISTENCIAS
		FROM TABLA_2 T2
		LEFT JOIN T_DET_ROLTERCEROCERTIFICADO RTA ON RTA.N_ID_CERTIFICADO = T2.N_ID_CERTIFICADO AND RTA.N_ID_TIPOROLTERCERO = 365 AND RTA.N_ID_ESTADO = 8 AND RTA.N_IND_ACTIVO = 1
		LEFT JOIN T_MAE_TERCERO TER ON RTA.N_ID_TERCERO = TER.N_ID_TERCERO 
		LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
		), TABLA_4 AS (
		SELECT
			T3.N_ID_CERTIFICADO
			,T3.N_ID_POLIZA
			,T3.N_ID_COTIZACION
			,T3.C_NUM_POLIZA
			,T3.C_NUM_CERTIFICADO
			,T3.C_NOM_ENTIDAD
			,T3.C_DES_PRODUCTO
			,T3.C_TIPO_IDENTIDAD_ASEGURADO
			,T3.C_NUM_IDENTIDAD_ASEGURADO
			,T3.C_NOM_COMPLETO_ASEGURADO
			,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,TER.C_NOM_COMPLETO AS C_NOM_COMPLETO_RESPONSABLEPAGO
			,CANAL
			,T3.D_FEC_VENTA
			,T3.D_FEC_REGISTRO
			,T3.D_FEC_INIVIGENCIA
			,T3.D_FEC_FINVIGENCIA
			,T3.N_NUM_PRIMANETA
			,T3.N_NUM_PRIMABRUTA
			,T3.C_COD_ZONAL
			,T3.C_DES_ZONAL
			,T3.N_ID_ESTADO
			,T3.N_ID_ESTABLECIMIENTO
			,T3.N_ID_PEREMISOR
			,T3.N_ID_PERVENDEDOR
			,T3.N_ID_PERANULACION
			,T3.C_DES_CORTAPLAN
			,T3.C_ABR_RAMO
			,T3.N_ID_CANAL
			,T3.C_NUM_SOLICITUD
			,T3.NRO_RIESGOS
			,T3.COD_MON
			,T3.DER_EMISION
			,T3.DESCUENTOS
			,T3.IMPORTE_RECARGO
			,T3.IMPORTE_INTERES
			,T3.IMPORTE_IMPUESTO
			,T3.NUMERO_CUOTA
			,T3.FECHA_INIVIGENCIA
			,T3.FECHA_FINVIGENCIA
			,T3.NUMERO_CUOTAS_CALCULADAS
			,T3.IMP_COM_AGT
			,T3.IMP_COM_AGT2
			,T3.IMP_COM_AGT3
			,T3.TIP_GESTOR
			,T3.COBRANZAS_NUMCUOTAS
			,T3.COBRANZAS_VALOR_CUOTA
			,T3.COBRANZAS_IMP_REC_PAG
			,T3.COBRANZAS_IMP_REC_PENDG
			,T3.COBRANZAS_IMP_REC_DEV
			,T3.PRIMA_TECNICA_ULTIMA
			,T3.DESCUENTOS_ULTIMA
			,T3.IMPORTE_RECARGO_ULTIMA
			,T3.DERECHO_EMISION_ULTIMA
			,T3.INTERERESE_ULTIMA
			,T3.IMPUESTOS_ULTIMA
			,T3.PRIMA_TOTAL_ULTIMA
			,T3.COD_MOTIVO_ANULACION
			,T3.BIENES
			,T3.EXISTENCIAS
		FROM TABLA_3 T3
		INNER JOIN T_DET_ROLTERCEROCERTIFICADO RTR ON RTR.N_ID_CERTIFICADO = T3.N_ID_CERTIFICADO AND RTR.N_ID_TIPOROLTERCERO = 364 AND RTR.N_ID_ESTADO = 8 AND RTR.N_IND_ACTIVO = 1
		LEFT JOIN T_MAE_TERCERO TER ON RTR.N_ID_TERCERO = TER.N_ID_TERCERO 
		LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
		), TABLA_5 AS (
		SELECT
			 T4.N_ID_CERTIFICADO
			,T4.N_ID_POLIZA
			,T4.N_ID_COTIZACION
			,T4.C_NUM_POLIZA
			,T4.C_NUM_CERTIFICADO
			,T4.C_NOM_ENTIDAD
			,T4.C_DES_PRODUCTO
			,T4.C_TIPO_IDENTIDAD_ASEGURADO
			,T4.C_NUM_IDENTIDAD_ASEGURADO
			,T4.C_NOM_COMPLETO_ASEGURADO
			,T4.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T4.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T4.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T4.D_FEC_VENTA
			,T4.D_FEC_REGISTRO
			,T4.D_FEC_INIVIGENCIA
			,T4.D_FEC_FINVIGENCIA
			,T4.N_NUM_PRIMANETA
			,T4.N_NUM_PRIMABRUTA
			,T4.C_COD_ZONAL
			,T4.C_DES_ZONAL
			,T4.N_ID_ESTADO
			,ISNULL(PERSE.C_VAL_CODREFERENCIA,'''') AS C_VAL_CODREFERENCIA_VENDEDOR
			,PERSE.C_NOM_COMPLETO AS C_NOM_COMPLETO_VENDEDOR
			,T4.N_ID_PERVENDEDOR
			,T4.N_ID_PERANULACION
			,T4.C_DES_CORTAPLAN
			,T4.C_ABR_RAMO
			,T4.N_ID_CANAL
			,T4.C_NUM_SOLICITUD
			,T4.NRO_RIESGOS
			,T4.COD_MON
			,T4.DER_EMISION
			,T4.DESCUENTOS
			,T4.IMPORTE_RECARGO
			,T4.IMPORTE_INTERES
			,T4.IMPORTE_IMPUESTO
			,T4.NUMERO_CUOTA
			,T4.FECHA_INIVIGENCIA
			,T4.FECHA_FINVIGENCIA
			,T4.NUMERO_CUOTAS_CALCULADAS
			,T4.IMP_COM_AGT
			,T4.IMP_COM_AGT2
			,T4.IMP_COM_AGT3
			,T4.TIP_GESTOR
			,T4.COBRANZAS_NUMCUOTAS
			,T4.COBRANZAS_VALOR_CUOTA
			,T4.COBRANZAS_IMP_REC_PAG
			,T4.COBRANZAS_IMP_REC_PENDG
			,T4.COBRANZAS_IMP_REC_DEV
			,T4.PRIMA_TECNICA_ULTIMA
			,T4.DESCUENTOS_ULTIMA
			,T4.IMPORTE_RECARGO_ULTIMA
			,T4.DERECHO_EMISION_ULTIMA
			,T4.INTERERESE_ULTIMA
			,T4.IMPUESTOS_ULTIMA
			,T4.PRIMA_TOTAL_ULTIMA
			,CANAL
			,T4.COD_MOTIVO_ANULACION
			,T4.BIENES
			,T4.EXISTENCIAS
		FROM TABLA_4 T4
		LEFT JOIN T_MAE_PERSONA PERSE ON PERSE.N_ID_PERSONA = T4.N_ID_PEREMISOR
		), TABLA_6 AS (
		SELECT
			 T5.N_ID_CERTIFICADO
			,T5.N_ID_POLIZA
			,T5.N_ID_COTIZACION
			,T5.C_NUM_POLIZA
			,T5.C_NUM_CERTIFICADO
			,T5.C_NOM_ENTIDAD
			,T5.C_DES_PRODUCTO
			,T5.C_TIPO_IDENTIDAD_ASEGURADO
			,T5.C_NUM_IDENTIDAD_ASEGURADO
			,T5.C_NOM_COMPLETO_ASEGURADO
			,T5.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T5.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T5.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T5.D_FEC_VENTA
			,T5.D_FEC_REGISTRO
			,T5.D_FEC_INIVIGENCIA
			,T5.D_FEC_FINVIGENCIA
			,T5.N_NUM_PRIMANETA
			,T5.N_NUM_PRIMABRUTA
			,T5.C_COD_ZONAL
			,T5.C_DES_ZONAL
			,T5.N_ID_ESTADO
			,ISNULL(PERVE.C_VAL_CODREFERENCIA,'''') AS C_VAL_CODREFERENCIA
			,PERVE.C_NOM_COMPLETO AS C_NOM_COMPLETO_VENDEDOR
			,T5.C_VAL_CODREFERENCIA_VENDEDOR	
			,T5.N_ID_PERVENDEDOR
			,T5.N_ID_PERANULACION
			,T5.C_DES_CORTAPLAN
			,T5.C_ABR_RAMO
			,T5.N_ID_CANAL
			,T5.C_NUM_SOLICITUD
			,T5.NRO_RIESGOS
			,T5.COD_MON
			,T5.DER_EMISION
			,T5.DESCUENTOS
			,T5.IMPORTE_RECARGO
			,T5.IMPORTE_INTERES
			,T5.IMPORTE_IMPUESTO
			,T5.NUMERO_CUOTA
			,T5.FECHA_INIVIGENCIA
			,T5.FECHA_FINVIGENCIA
			,T5.NUMERO_CUOTAS_CALCULADAS
			,T5.IMP_COM_AGT
			,T5.IMP_COM_AGT2
			,T5.IMP_COM_AGT3
			,T5.TIP_GESTOR
			,T5.COBRANZAS_NUMCUOTAS
			,T5.COBRANZAS_VALOR_CUOTA
			,T5.COBRANZAS_IMP_REC_PAG
			,T5.COBRANZAS_IMP_REC_PENDG
			,T5.COBRANZAS_IMP_REC_DEV
			,T5.PRIMA_TECNICA_ULTIMA
			,T5.DESCUENTOS_ULTIMA
			,T5.IMPORTE_RECARGO_ULTIMA
			,T5.DERECHO_EMISION_ULTIMA
			,T5.INTERERESE_ULTIMA
			,T5.IMPUESTOS_ULTIMA
			,T5.PRIMA_TOTAL_ULTIMA
			,CANAL
			,T5.COD_MOTIVO_ANULACION
			,T5.BIENES
			,T5.EXISTENCIAS
		FROM TABLA_5 T5
		LEFT JOIN T_MAE_PERSONA PERVE ON PERVE.N_ID_PERSONA = T5.N_ID_PERVENDEDOR
		LEFT JOIN T_DET_PERSONA DTPERV ON PERVE.N_ID_PERSONA = DTPERV.N_ID_PERSONA 
		LEFT JOIN T_MAE_TIPO TIPOVE ON TIPOVE.N_ID_TIPO=DTPERV.N_ID_TIPOROL  

		), TABLA_7 AS (
		SELECT
			T6.N_ID_CERTIFICADO
			,T6.N_ID_POLIZA
			,T6.N_ID_COTIZACION
			,T6.C_NUM_POLIZA
			,T6.C_NUM_CERTIFICADO
			,T6.C_NOM_ENTIDAD
			,T6.C_DES_PRODUCTO
			,T6.C_TIPO_IDENTIDAD_ASEGURADO
			,T6.C_NUM_IDENTIDAD_ASEGURADO
			,T6.C_NOM_COMPLETO_ASEGURADO
			,T6.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T6.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T6.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T6.D_FEC_VENTA
			,T6.D_FEC_REGISTRO
			,T6.D_FEC_INIVIGENCIA
			,T6.D_FEC_FINVIGENCIA
			,T6.N_NUM_PRIMANETA
			,T6.N_NUM_PRIMABRUTA
			,T6.C_COD_ZONAL
			,T6.C_DES_ZONAL
			,T6.N_ID_ESTADO
			,T6.C_VAL_CODREFERENCIA_VENDEDOR
			,T6.C_NOM_COMPLETO_VENDEDOR
			,ISNULL(PERAN.C_VAL_CODREFERENCIA,'''') AS C_VAL_CODREFERENCIA_ANULADOR
			,T6.C_DES_CORTAPLAN
			,T6.C_ABR_RAMO
			,T6.N_ID_CANAL
			,T6.N_ID_PERVENDEDOR
			,T6.C_NUM_SOLICITUD
			,T6.NRO_RIESGOS
			,T6.COD_MON
			,T6.DER_EMISION
			,T6.DESCUENTOS
			,T6.IMPORTE_RECARGO
			,T6.IMPORTE_INTERES
			,T6.IMPORTE_IMPUESTO
			,T6.NUMERO_CUOTA
			,T6.FECHA_INIVIGENCIA
			,T6.FECHA_FINVIGENCIA
			,T6.NUMERO_CUOTAS_CALCULADAS
			,T6.IMP_COM_AGT
			,T6.IMP_COM_AGT2
			,T6.IMP_COM_AGT3
			,T6.TIP_GESTOR
			,T6.COBRANZAS_NUMCUOTAS
			,T6.COBRANZAS_VALOR_CUOTA
			,T6.COBRANZAS_IMP_REC_PAG
			,T6.COBRANZAS_IMP_REC_PENDG
			,T6.COBRANZAS_IMP_REC_DEV
			,T6.PRIMA_TECNICA_ULTIMA
			,T6.DESCUENTOS_ULTIMA
			,T6.IMPORTE_RECARGO_ULTIMA
			,T6.DERECHO_EMISION_ULTIMA
			,T6.INTERERESE_ULTIMA
			,T6.IMPUESTOS_ULTIMA
			,T6.PRIMA_TOTAL_ULTIMA
			,CANAL
			,T6.COD_MOTIVO_ANULACION
			,T6.BIENES
			,T6.EXISTENCIAS
		FROM TABLA_6 T6
		LEFT JOIN T_MAE_PERSONA PERAN ON PERAN.N_ID_PERSONA = T6.N_ID_PERANULACION	
		)
		SELECT 
			T7.N_ID_POLIZA
			,T7.N_ID_COTIZACION
			,T7.C_NUM_POLIZA
			,T7.C_NUM_CERTIFICADO
			,T7.C_NOM_ENTIDAD
			,T7.C_DES_PRODUCTO
			,T7.C_TIPO_IDENTIDAD_ASEGURADO
			,T7.C_NUM_IDENTIDAD_ASEGURADO
			,T7.C_NOM_COMPLETO_ASEGURADO
			,T7.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
			,T7.C_NUM_IDENTIDAD_RESPONSABLEPAGO
			,T7.C_NOM_COMPLETO_RESPONSABLEPAGO
			,T7.D_FEC_VENTA
			,T7.D_FEC_REGISTRO
			,T7.D_FEC_INIVIGENCIA
			,T7.D_FEC_FINVIGENCIA
			,T7.N_NUM_PRIMANETA
			,T7.N_NUM_PRIMABRUTA
			,T7.C_COD_ZONAL
			,T7.C_DES_ZONAL
			,T7.C_VAL_CODREFERENCIA_VENDEDOR
			,T7.C_NOM_COMPLETO_VENDEDOR
			,T7.C_VAL_CODREFERENCIA_ANULADOR
			,EST.C_DES_ESTADO
			,T7.C_DES_CORTAPLAN   
			,T7.C_ABR_RAMO   
			,T7.N_ID_CANAL 
			,T7.N_ID_PERVENDEDOR
			,ISNULL(T7.C_NUM_SOLICITUD,'''') AS N_UNICO
			,T7.NRO_RIESGOS
			,T7.COD_MON
			,T7.D_FEC_VENTA AS FEC_EMISION
			,T7.DER_EMISION
			,T7.DESCUENTOS
			,T7.IMPORTE_RECARGO
			,T7.IMPORTE_INTERES
			,T7.IMPORTE_IMPUESTO
			,T7.NUMERO_CUOTA
			,T7.FECHA_INIVIGENCIA
			,T7.FECHA_FINVIGENCIA
			,T7.NUMERO_CUOTAS_CALCULADAS
			,T7.IMP_COM_AGT
			,T7.IMP_COM_AGT2
			,T7.IMP_COM_AGT3
			,T7.TIP_GESTOR
			,T7.COBRANZAS_NUMCUOTAS
			,T7.COBRANZAS_VALOR_CUOTA
			,T7.COBRANZAS_IMP_REC_PAG
			,T7.COBRANZAS_IMP_REC_PENDG
			,T7.COBRANZAS_IMP_REC_DEV
			,T7.PRIMA_TECNICA_ULTIMA
			,T7.DESCUENTOS_ULTIMA
			,T7.IMPORTE_RECARGO_ULTIMA
			,T7.DERECHO_EMISION_ULTIMA
			,T7.INTERERESE_ULTIMA
			,T7.IMPUESTOS_ULTIMA
			,T7.PRIMA_TOTAL_ULTIMA
			,CANAL
			,T7.COD_MOTIVO_ANULACION
			,T7.BIENES
			,T7.EXISTENCIAS
		FROM TABLA_7 T7
		INNER JOIN T_MAE_ESTADO EST ON T7.N_ID_ESTADO = EST.N_ID_ESTADO
		ORDER BY T7.N_ID_CERTIFICADO DESC
	'
	--SELECT @script_ejecutar
	print @script_ejecutar
	EXEC (@script_ejecutar)

END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_RepSuscripcion]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SPS_T_RepSuscripcion @pi_id_poliza=0,@pi_num_poliza=NULL,@pi_num_certificado=NULL,@pi_id_suscripcion=0,@pi_id_tipoPersona=0,@pi_id_tipoIdentidad=0,@pi_val_docIdentidad=NULL,@pi_apellidos=NULL,@pi_nombres=NULL,@pi_id_tipoFecha=0,@pi_fec_iniVigencia=NULL,@pi_fec_finVigencia=NULL,@pi_id_estado=0,@pi_id_canal=3,@pi_id_territorio=0,@pi_id_zona=0,@pi_id_region=0,@pi_id_establecimiento=0,@pi_id_vendedor=0,@pi_id_ramo=2,@pi_id_producto=0,@pi_id_plan=0,@pi_Pagina=1,@pi_RegxPag=25,@pi_id_usuario=1,@pi_num_solicitud=NULL
CREATE PROCEDURE  [dbo].[SPS_T_RepSuscripcion]
    @pi_id_poliza INT = 0,
    @pi_num_poliza VARCHAR(30) = '',
    @pi_num_certificado VARCHAR(30) = '',
    @pi_id_suscripcion VARCHAR(30) = '',
    @pi_id_tipoPersona SMALLINT = 0,
    @pi_id_tipoIdentidad SMALLINT = 0,
    @pi_val_docIdentidad VARCHAR(20) = '',
    @pi_apellidos VARCHAR(300) = '',
    @pi_nombres VARCHAR(300) = '',
    @pi_id_tipoFecha SMALLINT = 0,
    @pi_fec_iniVigencia VARCHAR(30) = '',
    @pi_fec_finVigencia VARCHAR(30) = '',
    @pi_id_estado SMALLINT = 0,
    @pi_id_canal INT = 0,
    @pi_id_territorio INT = 0,
    @pi_id_zona INT = 0,
    @pi_id_region INT = 0,
    @pi_id_establecimiento INT = 0,
    @pi_id_vendedor INT = 0,
    @pi_id_ramo INT = 2,
    @pi_id_producto INT = 0,
    @pi_id_plan INT = 0,
    @pi_Pagina INT = 0,
    @pi_RegxPag INT = 0,
    @pi_id_usuario INT = 0,
      @pi_num_solicitud VARCHAR(30)=''

AS
BEGIN
      
      SET @pi_id_poliza = ISNULL(@pi_id_poliza,0)
      SET @pi_num_poliza = ISNULL(@pi_num_poliza,'')
      SET @pi_num_certificado = ISNULL(@pi_num_certificado,'')
    SET @pi_id_suscripcion = ISNULL(@pi_id_suscripcion,0)
    SET @pi_id_tipoPersona = ISNULL(@pi_id_tipoPersona,0)
      SET @pi_id_tipoIdentidad = ISNULL(@pi_id_tipoIdentidad,0)
      SET @pi_val_docIdentidad = ISNULL(@pi_val_docIdentidad,'')
      SET @pi_apellidos = ISNULL(@pi_apellidos,'')
      SET @pi_nombres = ISNULL(@pi_nombres,'')
      SET @pi_id_tipoFecha = ISNULL(@pi_id_tipoFecha,0)
      SET @pi_fec_iniVigencia = ISNULL(@pi_fec_iniVigencia,'')
      SET @pi_fec_finVigencia = ISNULL(@pi_fec_finVigencia,'')
      SET @pi_id_estado = ISNULL(@pi_id_estado,0)
      SET @pi_id_canal = ISNULL(@pi_id_canal,0)
      SET @pi_id_territorio = ISNULL(@pi_id_territorio,0)
      SET @pi_id_zona = ISNULL(@pi_id_zona,0)
      SET @pi_id_region = ISNULL(@pi_id_region,0)
      SET @pi_id_establecimiento = ISNULL(@pi_id_establecimiento,0)
    SET @pi_id_vendedor = ISNULL(@pi_id_vendedor,0)
    SET @pi_id_ramo = ISNULL(@pi_id_ramo, 2)
    SET @pi_id_producto = ISNULL(@pi_id_producto,0)
      SET @pi_id_plan = ISNULL(@pi_id_plan,0)
      SET @pi_num_solicitud = ISNULL(@pi_num_solicitud,'')
      

      DECLARE @v_idPersona INT
      DECLARE @v_mcaVendedor INT
      DECLARE @v_fec_iniVigencia DATETIME
      DECLARE @v_fec_finVigencia DATETIME

      DECLARE @v_Desde INT = 0
    DECLARE @v_CantidadRegistro INT = 0;
      
      SET @v_Desde = ((@pi_Pagina -1) * @pi_RegxPag + 1 )-1;
      SET @v_CantidadRegistro = @pi_RegxPag;

      IF @pi_fec_iniVigencia != ''
            SET @pi_fec_iniVigencia = SUBSTRING(@pi_fec_iniVigencia,7,4)+'-'+SUBSTRING(@pi_fec_iniVigencia,4,2)+'-'+SUBSTRING(@pi_fec_iniVigencia,1,2) + ' 00:00:00.000'

      IF @pi_fec_finVigencia != ''
            SET @pi_fec_finVigencia = SUBSTRING(@pi_fec_finVigencia,7,4)+'-'+SUBSTRING(@pi_fec_finVigencia,4,2)+'-'+SUBSTRING(@pi_fec_finVigencia,1,2) + ' 23:59:59.000'

      
    IF @pi_id_vendedor != 0
        SET @v_idPersona = @pi_id_vendedor
    ELSE
        BEGIN
            SELECT  @v_idPersona = USU.N_ID_PERSONA,
                    @v_mcaVendedor = PER.N_ID_MCA_VENDEDOR
            FROM T_MAE_USUARIO USU
            INNER JOIN T_DET_USUARIOPERFIL DUP ON USU.N_ID_USUARIO = DUP.N_ID_USUARIO
            INNER JOIN  T_MAE_PERFIL PER ON PER.N_ID_PERFIL = DUP.N_ID_PERFIL AND DUP.N_ID_USUARIO = @pi_id_usuario
        END
   

      DECLARE @script_ejecutar                              NVARCHAR(MAX) = '',
                  @condicional_certificado                  VARCHAR(300) = '',
                  @condicional_poliza                             VARCHAR(300) = '',
                  @condicional_plan                         VARCHAR(300) = '',
                  @condicional_producto                     VARCHAR(300) = '',
                  @condicional_estructura_plan        VARCHAR(MAX) = '',
                  @condicional_estructura_ptoventa    VARCHAR(MAX) = '',
                  @condicional_estructura_est               VARCHAR(MAX) = '',
                  @condicional_ptoVenta                     VARCHAR(300) = '',
                  @condicional_region                             VARCHAR(300) = '',
                  @condicional_zona                         VARCHAR(300) = '',
                  @condicional_territorio                   VARCHAR(300) = '',
                  @condicional_tercero                      VARCHAR(MAX) = ''

      --ESTRUCURA DE PRODUCTO
      IF ISNULL(@v_mcaVendedor,9) = 9
      BEGIN
            IF(SELECT COUNT(N_ID_PLAN)
            FROM T_MAE_USUARIO_CIA_PRODUCTO_PLAN
            WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_COMPANIA = 0 AND N_ID_PRODUCTO = 0 AND N_ID_PLAN = 0 AND N_ID_ESTADO = 8) = 0
            BEGIN
                  IF @pi_id_producto != 0
                  BEGIN
                        IF @pi_id_plan != 0
                        BEGIN
                              SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM
                              (SELECT PL.N_ID_PLAN
                              FROM T_MAE_PLAN PL
                              INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
                              INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
                                    AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD
                                    AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
                                    AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
                                    AND CPP.N_ID_ESTADO = 8
                              WHERE PL.N_ID_PLAN = @pi_id_plan) A
                        END
                        ELSE
                        BEGIN
                              SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM
                              (SELECT PL.N_ID_PLAN
                              FROM T_MAE_PLAN PL
                              INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
                              INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
                                    AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD
                                    AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
                                    AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
                                    AND CPP.N_ID_ESTADO = 8
                              WHERE PRD.N_ID_PRODUCTO = @pi_id_producto) A
                        END
                  END
                  ELSE
                  BEGIN
                        SELECT @condicional_estructura_plan =  COALESCE(@condicional_estructura_plan,'') + CAST(N_ID_PLAN AS VARCHAR(10)) + ',' FROM
                        (SELECT PL.N_ID_PLAN
                        FROM T_MAE_PLAN PL
                        INNER JOIN T_MAE_PRODUCTO PRD ON PL.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO
                        INNER JOIN T_MAE_USUARIO_CIA_PRODUCTO_PLAN CPP ON CPP.N_ID_USUARIO = @pi_id_usuario
                              AND CPP.N_ID_COMPANIA = PRD.N_ID_ENTIDAD
                              AND (CPP.N_ID_PRODUCTO = 0 OR CPP.N_ID_PRODUCTO = PRD.N_ID_PRODUCTO)
                              AND (CPP.N_ID_PLAN = 0 OR CPP.N_ID_PLAN = PL.N_ID_PLAN)
                              AND CPP.N_ID_ESTADO = 8) A
                  END

                  IF LEN(@condicional_estructura_plan) > 0
                  BEGIN 
                        SET @condicional_estructura_plan = SUBSTRING(@condicional_estructura_plan,1,LEN(@condicional_estructura_plan)-1)  
                        SET @condicional_estructura_plan = ' AND SUS.N_ID_PLAN IN (' + @condicional_estructura_plan + ')'     
                  END   
                  ELSE
                  BEGIN
                        SET @condicional_estructura_plan = ' AND SUS.N_ID_PLAN IN (0)'    
                  END
            END
            ELSE
            BEGIN
            IF @pi_id_producto != 0
            BEGIN
                IF @pi_id_plan != 0
                BEGIN
                    SET @condicional_poliza = @condicional_poliza + ' AND SUS.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
                END
                ELSE
                BEGIN
                    SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
                END
            END
            END
      END
      ELSE
      BEGIN
        IF @pi_id_producto != 0
        BEGIN
            IF @pi_id_plan != 0
                SET @condicional_poliza = @condicional_poliza + ' AND SUS.N_ID_PLAN = ' + CONVERT(VARCHAR(10),@pi_id_plan)
            ELSE
                SET @condicional_plan = @condicional_plan + ' AND PL.N_ID_PRODUCTO = '  + CONVERT(VARCHAR(10),@pi_id_producto)
        END

            SET @condicional_plan = @condicional_plan + ' AND SUS.N_ID_PEREMISOR = ' + CONVERT(VARCHAR,@v_idPersona)
      END
      --ESTRUCTURA COMERCIAL
      IF ISNULL(@v_mcaVendedor,9) = 9
      BEGIN
            IF(SELECT COUNT(N_ID_PUNTO_VENTA) AS V_VENTA
            FROM T_MAE_USUARIO_CANAL_PTOVENTA
            WHERE N_ID_USUARIO = @pi_id_usuario AND N_ID_CANAL = 0 AND N_ID_TERRITORIO = 0 AND N_ID_ZONA = 0 AND N_ID_REGION = 0 AND N_ID_PUNTO_VENTA = 0 AND N_ID_ESTADO = 8) = 0
            BEGIN
                  IF @pi_id_canal != 0
                  BEGIN
                        IF @pi_id_territorio != 0
                        BEGIN
                              IF @pi_id_zona != 0
                              BEGIN
                                    IF @pi_id_region != 0
                                    BEGIN
                                          IF @pi_id_establecimiento !=0
                                          BEGIN
                                                SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                                (SELECT PVT.N_ID_ESTABLECIMIENTO
                                                FROM T_MAE_ZONAL PVT
                                                JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                                JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                                JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                                JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                                                                                                            AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                                                                                                            AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                                                                                                            AND CTZRP.N_ID_ESTADO = 8
                                                WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region AND PVT.N_ID_ZONAL = @pi_id_establecimiento) A
                                          END
                                          ELSE
                                          BEGIN
                                                SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                                (SELECT PVT.N_ID_ESTABLECIMIENTO
                                                FROM T_MAE_ZONAL PVT
                                                JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                                JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                                JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                                JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                                                                                                            AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                                                                                                            AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                                                                                                            AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                                                                                                            AND CTZRP.N_ID_ESTADO = 8
                                                WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona AND REG.N_ID_ZONAL = @pi_id_region) A
                                          END
                                    END
                                    ELSE
                                    BEGIN
                                          SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                          (SELECT PVT.N_ID_ESTABLECIMIENTO
                                          FROM T_MAE_ZONAL PVT
                                          JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                          JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                          JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                          JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                                                                                                      AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                                                                                                      AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                                                                                                      AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                                                                                                      AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                                                                                                      AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                                                                                                      AND CTZRP.N_ID_ESTADO = 8
                                          WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio AND ZON.N_ID_ZONAL = @pi_id_zona) A
                                    END
                              END
                              ELSE
                              BEGIN
                                    SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                    (SELECT PVT.N_ID_ESTABLECIMIENTO
                                    FROM T_MAE_ZONAL PVT
                                    JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                    JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                    JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                    JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                                                                                                AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                                                                                                AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                                                                                                AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                                                                                                AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                                                                                                AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                                                                                                AND CTZRP.N_ID_ESTADO = 8
                                    WHERE TER.N_ID_ENTIDAD = @pi_id_canal AND TER.N_ID_ZONAL = @pi_id_territorio) A
                              END
                        END
                        ELSE
                        BEGIN
                              SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                              (SELECT PVT.N_ID_ESTABLECIMIENTO
                              FROM T_MAE_ZONAL PVT
                              JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                              JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                              JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                              JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                                                                                          AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                                                                                          AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                                                                                          AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                                                                                          AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                                                                                          AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                                                                                          AND CTZRP.N_ID_ESTADO = 8
                              WHERE TER.N_ID_ENTIDAD = @pi_id_canal) A
                        END
                  END
                  ELSE
                  BEGIN
                        SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                        (SELECT PVT.N_ID_ESTABLECIMIENTO
                        FROM T_MAE_ZONAL PVT
                        JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                        JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                        JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                        JOIN T_MAE_USUARIO_CANAL_PTOVENTA CTZRP ON CTZRP.N_ID_USUARIO = @pi_id_usuario
                              AND CTZRP.N_ID_CANAL = TER.N_ID_ENTIDAD
                              AND (CTZRP.N_ID_TERRITORIO = 0 OR CTZRP.N_ID_TERRITORIO = TER.N_ID_ZONAL)
                              AND (CTZRP.N_ID_ZONA = 0 OR CTZRP.N_ID_ZONA = ZON.N_ID_ZONAL)
                              AND (CTZRP.N_ID_REGION = 0 OR CTZRP.N_ID_REGION = REG.N_ID_ZONAL)
                              AND (CTZRP.N_ID_PUNTO_VENTA = 0 OR CTZRP.N_ID_PUNTO_VENTA = PVT.N_ID_ZONAL)
                               AND CTZRP.N_ID_ESTADO = 8) A
                  END   

                  IF LEN(@condicional_estructura_est) > 0
                  BEGIN 
                        SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)     
                        SET @condicional_estructura_est = ' AND SUS.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'  
                  END   
                  ELSE
                  BEGIN
                        --SET @condicional_estructura_est = ' AND SUS.N_ID_ESTABLECIMIENTO IN (0)'    
                        IF @pi_id_canal <> 0
                              SET @condicional_estructura_est = ' AND SUS.N_ID_CANAL = ' + RTRIM(STR(@pi_id_canal)) + ' '     
                  END
            END
            ELSE
            BEGIN
                  IF @pi_id_canal != 0
                  BEGIN
                        IF @pi_id_territorio != 0
                        BEGIN
                              IF @pi_id_zona != 0
                              BEGIN
                                    IF @pi_id_region != 0
                                    BEGIN
                                          IF @pi_id_establecimiento != 0
                                          BEGIN
                                                SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                                (SELECT PVT.N_ID_ESTABLECIMIENTO
                                                FROM T_MAE_ZONAL PVT
                                                WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
                                          END
                                          ELSE
                                          BEGIN
                                                SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                                (SELECT PVT.N_ID_ESTABLECIMIENTO
                                                FROM T_MAE_ZONAL PVT
                                                JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                                WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
                                          END
                                    END
                                    ELSE
                                    BEGIN
                                          SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                          (SELECT PVT.N_ID_ESTABLECIMIENTO
                                          FROM T_MAE_ZONAL PVT
                                          JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                          JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                          WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
                                    END
                              END
                              ELSE
                              BEGIN
                                    SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                    (SELECT PVT.N_ID_ESTABLECIMIENTO
                                    FROM T_MAE_ZONAL PVT
                                    JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                    JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                    JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                    WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
                              END
                        END
                        ELSE
                        BEGIN
                              PRINT 'TEST'
                              PRINT @condicional_estructura_est
                              PRINT 'TEST'
                              SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                              (SELECT PVT.N_ID_ESTABLECIMIENTO
                              FROM T_MAE_ZONAL PVT
                              JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                              JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                              JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                              WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
                              PRINT @condicional_estructura_est
                        END
                  END

                  IF LEN(@condicional_estructura_est) > 0
                  BEGIN 
                        SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)     
                        SET @condicional_estructura_est = ' AND SUS.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'  
                  END
                  ELSE
                  BEGIN
                        IF @pi_id_canal <> 0
                              SET @condicional_estructura_est = ' AND SUS.N_ID_CANAL = ' + RTRIM(STR(@pi_id_canal)) + ' '     
                  END
            END
      END
      ELSE
      BEGIN
      print 'a'
            IF @pi_id_canal != 0
            BEGIN
                  IF @pi_id_territorio != 0
                  BEGIN
                        IF @pi_id_zona != 0
                        BEGIN
                              IF @pi_id_region != 0
                              BEGIN
                                    IF @pi_id_establecimiento != 0
                                    BEGIN
                                          SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                          (SELECT PVT.N_ID_ESTABLECIMIENTO
                                          FROM T_MAE_ZONAL PVT
                                          WHERE PVT.N_ID_ZONAL = @pi_id_establecimiento) A
                                    END
                                    ELSE
                                    BEGIN
                                          SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                          (SELECT PVT.N_ID_ESTABLECIMIENTO
                                          FROM T_MAE_ZONAL PVT
                                          JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                          WHERE PVT.N_ID_ZONALPADRE = @pi_id_region) A
                                    END
                              END
                              ELSE
                              BEGIN
                                    SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                          (SELECT PVT.N_ID_ESTABLECIMIENTO
                                          FROM T_MAE_ZONAL PVT
                                          JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                          JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                          WHERE REG.N_ID_ZONALPADRE = @pi_id_zona) A
                              END
                        END
                        ELSE
                        BEGIN
                              SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                                    (SELECT PVT.N_ID_ESTABLECIMIENTO
                                    FROM T_MAE_ZONAL PVT
                                    JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                                    JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                                    JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                                    WHERE ZON.N_ID_ZONALPADRE = @pi_id_territorio) A
                        END
                  END
                  ELSE
                  BEGIN
                        SELECT @condicional_estructura_est =  COALESCE(@condicional_estructura_est,'') + CAST(N_ID_ESTABLECIMIENTO AS VARCHAR(10)) + ',' FROM
                              (SELECT PVT.N_ID_ESTABLECIMIENTO
                              FROM T_MAE_ZONAL PVT
                              JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406 AND REG.N_ID_TIPOZONAL = 405
                              JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
                              JOIN T_MAE_ZONAL TER ON ZON.N_ID_ZONALPADRE = TER.N_ID_ZONAL AND TER.N_ID_TIPOZONAL = 403
                              WHERE ZON.N_ID_ENTIDAD = @pi_id_canal) A
                  END
            END

            IF LEN(@condicional_estructura_est) > 0
            BEGIN 
                  SET @condicional_estructura_est = SUBSTRING(@condicional_estructura_est,1,LEN(@condicional_estructura_est)-1)     
                  SET @condicional_estructura_est = ' AND SUS.N_ID_ESTABLECIMIENTO IN (' + @condicional_estructura_est + ')'  
            END   
      END

      IF @pi_id_estado = 0
            SET @condicional_certificado = @condicional_certificado + ' AND SUS.N_ID_ESTADO IN (6,7,18,25)'
      ELSE
            SET @condicional_certificado = @condicional_certificado + ' AND SUS.N_ID_ESTADO = ' + CONVERT(VARCHAR(5),@pi_id_estado)

      IF @pi_id_tipoFecha = 585
      BEGIN
            IF @pi_fec_iniVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_FINVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

            IF @pi_fec_finVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_FINVIGENCIA <= ''' + @pi_fec_finVigencia + ''''           
      END

      IF @pi_id_tipoFecha = 586
      BEGIN
            IF @pi_fec_iniVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_INIVIGENCIA >= ''' + @pi_fec_iniVigencia + ''''

            IF @pi_fec_finVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_INIVIGENCIA <= ''' + @pi_fec_finVigencia + ''''           
      END
      
      IF @pi_id_tipoFecha = 596
      BEGIN
            IF @pi_fec_iniVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_SUSCRIPCION >= ''' + @pi_fec_iniVigencia + ''''

            IF @pi_fec_finVigencia != ''
                  SET @condicional_certificado = @condicional_certificado + ' AND SUS.D_FEC_SUSCRIPCION <= ''' + @pi_fec_finVigencia + ''''           
      END

      IF @pi_num_certificado !=''
            SET @condicional_certificado = @condicional_certificado + ' AND SUS.C_NUM_CERTIFICADO =''' + @pi_num_certificado + ''''
   
    IF @pi_id_suscripcion != 0
        SET @condicional_certificado = @condicional_certificado + ' AND SUS.N_ID_SUSCRIPCION = ' + CONVERT(VARCHAR(10),@pi_id_suscripcion)
   
    IF @pi_id_poliza != 0
            SET @condicional_poliza = @condicional_poliza + ' AND SUS.N_ID_SUSCRIPCION = ' + CONVERT(VARCHAR(10),@pi_id_poliza)
   
    IF @pi_num_poliza != ''
            SET @condicional_poliza = @condicional_poliza + ' AND SUS.C_NUM_POLIZA = ''' + CONVERT(VARCHAR(10),@pi_num_poliza) + ''''
   
    IF @pi_id_ramo != 0
        SET @condicional_producto = @condicional_producto + ' AND PR.N_ID_RAMO = ' + + CONVERT(VARCHAR(10),@pi_id_ramo)
     
      IF @pi_num_solicitud IS NOT NULL AND @pi_num_solicitud !=''
      BEGIN
            SET @condicional_certificado =  @condicional_certificado + 'AND CER.C_NUM_SOLICITUD =''' + @pi_num_solicitud + ''''
      END

      
      --@condicional_tercero

      IF @pi_id_tipoPersona != 0
      BEGIN
            DECLARE @CADENA   VARCHAR(MAX) = ''
            DECLARE @WHERE VARCHAR(MAX) = ''
            DECLARE @TABLA_X TABLE(CADENA1      VARCHAR(MAX))
            DECLARE @N_ID_CERTIFICADO VARCHAR(MAX)

            IF @pi_id_tipoIdentidad != 0 AND @pi_val_docIdentidad != ''
                  SET @WHERE = @WHERE + ' AND TER.N_ID_TIPOIDENTIDAD = ' + CONVERT(VARCHAR(5),@pi_id_tipoIdentidad) + ' AND TER.C_VAL_NUMIDENTIDAD =''' + @pi_val_docIdentidad + ''''
      
            IF @pi_apellidos != ''
                  SET @WHERE = @WHERE + ' AND (TER.C_APE_PATERNO +'' ''+ TER.C_APE_MATERNO) LIKE ''%' + @pi_apellidos +'%'''

            IF @pi_nombres != ''
                  SET @WHERE = @WHERE + ' AND TER.C_NOM_TERCERO LIKE ''%' + @pi_nombres +'%'''

            SET @CADENA = '
            DECLARE @A1 VARCHAR(MAX)

            SELECT @A1 = COALESCE(@A1,'''') + CAST(N_ID_SUSCRIPCION AS VARCHAR(10)) + '','' FROM (
                  SELECT RT.N_ID_SUSCRIPCION
                  FROM T_MAE_TERCERO TER
                  INNER JOIN T_DET_ROLTERCEROSUSCRIPCION RT ON TER.N_ID_TERCERO = RT.N_ID_TERCERO AND RT.N_ID_TIPOROLTERCERO = ' + CONVERT(VARCHAR,@pi_id_tipoPersona) + '/* AND RT.N_ID_ESTADO = 8 */
                  AND RT.N_IND_ACTIVO = 1 '
                  + @WHERE + ') A
      
            SELECT @A1
            '

            INSERT @TABLA_X
            exec (@CADENA)

            SET @condicional_tercero = (SELECT CADENA1 FROM @TABLA_X)

            IF LEN(@condicional_tercero) > 0
            BEGIN 
                  SET @condicional_tercero = SUBSTRING(@condicional_tercero,1,LEN(@condicional_tercero)-1)  
                  SET @condicional_tercero = ' AND SUS.N_ID_SUSCRIPCION IN (' + @condicional_tercero + ')'  
            END   
      END
      PRINT @CADENA
      print @condicional_tercero

      SET @script_ejecutar = '
            WITH TABLA_TOTAL AS (
                  SELECT COUNT(1) AS CANTIDAD
            FROM T_MAE_SUSCRIPCION SUS  
			LEFT JOIN T_MAE_CERTIFICADO CER ON CER.N_IND_ACTIVO = 1 AND SUS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
            LEFT JOIN T_MAE_PLAN PL ON SUS.N_ID_PLAN = PL.N_ID_PLAN ' + @condicional_plan  +  '
            INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO ' + @condicional_producto + '
            LEFT JOIN T_MAE_ENTIDAD ENT ON PR.N_ID_ENTIDAD = ENT.N_ID_ENTIDAD
            WHERE SUS.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION  AND SUS.C_NUM_POLIZA IS NOT NULL ' + @condicional_certificado + @condicional_tercero + @condicional_poliza + @condicional_estructura_plan + @condicional_estructura_est + ')
            ,TABLA_1 AS (
            SELECT
                  ROW_NUMBER() OVER (ORDER BY SUS.N_ID_SUSCRIPCION DESC)      AS NUMROW,
                  (SELECT CANTIDAD FROM TABLA_TOTAL) AS ROW_TOTAL,
                  CER.N_ID_POLIZA,
                  SUS.C_NUM_POLIZA,
                  CER.N_ID_CERTIFICADO,
                  SUS.C_NUM_CERTIFICADO,
                  CER.N_ID_COTIZACION,
				  SUS.N_ID_SUSCRIPCION,
                  CER.C_NUM_SOLICITUD,
                  SUS.C_NUM_CREDITO,
                  ENT.N_ID_ENTIDAD,
                  ENT.C_NOM_ENTIDAD,
                  PL.N_ID_RAMO,
                  PR.N_ID_PRODUCTO,
                  PR.C_DES_PRODUCTO,
                  PL.N_ID_PLAN,
                  PL.C_COD_PLAN,
                  PL.C_DES_CORTAPLAN,
                  PL.C_DES_LARGAPLAN,
                  PL.C_COD_REFERENCIA,
                  PL.C_COD_TRAMA,
                  PL.C_VAL_SECPOLIZA,
                  PL.C_VAL_POLIZA,
                  PL.N_ID_TIPOPOLIZA,
                  PL.N_ID_TIPOPAGOPOLIZA,  
                  PL.N_ID_TIPOMONEDA,
                  PL.N_ID_TIPOREGLATARIFA,
                  PL.N_ID_TIPOPLAN,
                  PL.N_ID_TIPOVIGENCIA,
                  PL.N_ID_TIPOCLIENTE,
                  ISNULL(PL.N_ID_TIPOPERSONA,0) AS N_ID_TIPOPERSONA,
                  CONVERT(CHAR(10), SUS.D_FEC_SUSCRIPCION, 103) AS D_FEC_CERTIFICADO,
                  CONVERT(CHAR(10), SUS.D_FEC_INIVIGENCIA, 103) AS D_FEC_INIVIGENCIA,
                  CONVERT(CHAR(10), SUS.D_FEC_FINVIGENCIA, 103) AS D_FEC_FINVIGENCIA,
                  CONVERT(CHAR(10), SUS.D_FEC_CREACION, 103) AS D_FEC_REGISTRO,
                  CONVERT(CHAR(10), CER.D_FEC_VENTA, 103) AS D_FEC_VENTA,
                  SUS.N_MTO_CREDITO AS N_NUM_VALORCOMERCIAL,
                  SUS.N_NUM_PRIMABRUTA,
                  SUS.N_NUM_PRIMANETA,
                  CER.N_NUM_COM_CANAL,
                  PL.N_NUM_VERSION,
                  CER.C_OBS_DESCRIPTIVO,
                  0 AS N_ID_PERSONA,
                  0 AS N_ID_ASEGURADO,
                  SUS.N_IND_ACTIVO,
                  SUS.N_ID_ESTADO,
                  CER.C_COD_USUCREACION,
                  CONVERT(CHAR(10), CER.D_FEC_CREACION, 103) AS D_FEC_CREACION,
                  CER.C_COD_USUMODIF,
                  CONVERT(VARCHAR,CER.D_FEC_MODIFICACION,103) AS D_FEC_MODIFICACION,
                  0 AS N_ID_ESTADOTRANSFERENCIA,
                  '''' AS C_DES_ESTADOTRANSFERENCIA,
                  '''' AS MESHABILITADO,
                  SUS.N_ID_CANAL,
                  SUS.N_ID_ESTABLECIMIENTO,
                  '''' AS C_VAL_CODHOMOLOGACION,
                  CASE WHEN CER.N_ID_PEREMISOR IS NULL THEN SUS.N_ID_PEREMISOR
                         ELSE CER.N_ID_PEREMISOR END AS N_ID_PEREMISOR,
                  CASE WHEN CER.N_ID_PERVENDEDOR IS NULL THEN SUS.N_ID_PEREMISOR
                         ELSE CER.N_ID_PERVENDEDOR END AS N_ID_PERVENDEDOR,
                  ISNULL(CER.N_ID_ADJUNTOPOLIZA,0) AS N_ID_ADJUNTOPOLIZA,
                  '''' AS C_MODELO_SUBMODELO,
                  CONVERT(CHAR(10), CER.D_FEC_ANULACION, 103) AS D_FEC_ANULACION,
                  CER.N_ID_PERANULACION,
                  CER.N_ID_MOTIVOANULA,
                  CASE WHEN CONVERT(DATE, CER.D_FEC_CERTIFICADO, 103) = CONVERT(DATE, GETDATE(), 103) THEN 1 ELSE 0 END AS N_IND_ANULAR,  
                  CASE WHEN CONVERT(DATE, CER.D_FEC_CERTIFICADO, 103) < CONVERT(DATE, GETDATE(), 103)THEN 1 ELSE 0 END AS N_IND_CANCELAR
            FROM T_MAE_SUSCRIPCION SUS
            LEFT JOIN T_MAE_CERTIFICADO CER ON CER.N_IND_ACTIVO = 1 AND SUS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
            LEFT JOIN T_MAE_PLAN PL ON SUS.N_ID_PLAN = PL.N_ID_PLAN ' + @condicional_plan + '
            INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO '+ @condicional_producto + '
            LEFT JOIN T_MAE_ENTIDAD ENT ON PR.N_ID_ENTIDAD = ENT.N_ID_ENTIDAD
            WHERE SUS.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION AND SUS.C_NUM_POLIZA IS NOT NULL ' + @condicional_certificado + @condicional_tercero + @condicional_poliza + @condicional_estructura_plan + @condicional_estructura_est + '
            ORDER BY SUS.N_ID_SUSCRIPCION DESC
            OFFSET ' + CONVERT(VARCHAR,@v_Desde) + ' ROWS FETCH NEXT ' + CONVERT(VARCHAR,@v_CantidadRegistro) + ' ROWS ONLY
            ), TABLA_1_5 AS (
            SELECT
                  T1.NUMROW
                  ,T1.ROW_TOTAL
                  ,T1.N_ID_POLIZA
                  ,T1.C_NUM_POLIZA
                  ,T1.N_ID_CERTIFICADO
                  ,T1.C_NUM_CERTIFICADO
                  ,T1.N_ID_COTIZACION
				  ,T1.N_ID_SUSCRIPCION
                  ,T1.C_NUM_SOLICITUD
                  ,T1.C_NUM_CREDITO
                  ,T1.N_ID_ENTIDAD
                  ,T1.C_NOM_ENTIDAD
                  ,T1.N_ID_RAMO
                  ,T1.N_ID_PRODUCTO
                  ,T1.C_DES_PRODUCTO
                  ,T1.N_ID_PLAN
                  ,T1.C_COD_PLAN
                  ,T1.C_DES_CORTAPLAN
                  ,T1.C_DES_LARGAPLAN
                  ,T1.C_COD_REFERENCIA
                  ,T1.C_COD_TRAMA
                  ,T1.C_VAL_SECPOLIZA
                  ,T1.C_VAL_POLIZA
                  ,T1.N_ID_TIPOPOLIZA
                  ,T1.N_ID_TIPOPAGOPOLIZA
                  ,T1.N_ID_TIPOMONEDA
                  ,T1.N_ID_TIPOREGLATARIFA
                  ,T1.N_ID_TIPOPLAN
                  ,T1.N_ID_TIPOVIGENCIA
                  ,T1.N_ID_TIPOCLIENTE
                  ,T1.N_ID_TIPOPERSONA
                  ,T1.D_FEC_CERTIFICADO
                  ,T1.D_FEC_INIVIGENCIA
                  ,T1.D_FEC_FINVIGENCIA
                  ,T1.D_FEC_REGISTRO
                  ,T1.D_FEC_VENTA
                  ,T1.N_NUM_VALORCOMERCIAL
                  ,T1.N_NUM_PRIMABRUTA
                  ,T1.N_NUM_PRIMANETA
                  ,T1.N_NUM_COM_CANAL
                  ,T1.N_NUM_VERSION
                  ,T1.C_OBS_DESCRIPTIVO
                  ,T1.N_ID_PERSONA
                  ,T1.N_ID_ASEGURADO
                  ,T1.N_IND_ACTIVO
                  ,T1.N_ID_ESTADO
                  ,T1.C_COD_USUCREACION
                  ,T1.D_FEC_CREACION
                  ,T1.C_COD_USUMODIF
                  ,T1.D_FEC_MODIFICACION
                  ,T1.N_ID_ESTADOTRANSFERENCIA
                  ,T1.C_DES_ESTADOTRANSFERENCIA
                  ,T1.MESHABILITADO
                  ,T1.N_ID_CANAL
                  ,ENT.C_NOM_ENTIDAD AS C_NOM_CANAL
                  ,REG.C_DES_ZONAL AS C_DES_REGION
                  ,ZON.C_DES_ZONAL AS C_DES_ZONA
                  ,T1.N_ID_ESTABLECIMIENTO
                  ,T1.C_VAL_CODHOMOLOGACION
                  ,EST.C_NOM_ESTABLECIMIENTO AS C_NOM_ESTABLECIMIENTO
                  ,T1.N_ID_PEREMISOR
                  ,T1.N_ID_PERVENDEDOR
                  ,T1.N_ID_ADJUNTOPOLIZA
                  ,T1.C_MODELO_SUBMODELO
                  ,T1.D_FEC_ANULACION
                  ,T1.N_ID_PERANULACION
                  ,T1.N_ID_MOTIVOANULA
                  ,T1.N_IND_ANULAR
                  ,T1.N_IND_CANCELAR
            FROM TABLA_1 T1
            LEFT JOIN T_MAE_ENTIDAD ENT ON T1.N_ID_CANAL = ENT.N_ID_ENTIDAD
            LEFT JOIN T_MAE_ESTABLECIMIENTO EST ON T1.N_ID_ESTABLECIMIENTO = EST.N_ID_ESTABLECIMIENTO
            LEFT JOIN T_MAE_ZONAL PVT ON EST.N_ID_ZONAL = PVT.N_ID_ZONAL AND PVT.N_ID_TIPOZONAL = 406
            LEFT JOIN T_MAE_ZONAL REG ON PVT.N_ID_ZONALPADRE = REG.N_ID_ZONAL AND REG.N_ID_TIPOZONAL = 405
            LEFT JOIN T_MAE_ZONAL ZON ON REG.N_ID_ZONALPADRE = ZON.N_ID_ZONAL AND ZON.N_ID_TIPOZONAL = 404
            ), TABLA_2 AS (
            SELECT
                  T1.NUMROW
                  ,T1.ROW_TOTAL
                  ,T1.N_ID_POLIZA
                  ,T1.C_NUM_POLIZA
                  ,T1.N_ID_CERTIFICADO
                  ,T1.C_NUM_CERTIFICADO               
                  ,COTI.N_ID_COTIZACION
                  ,COTI.C_NUM_COTIZACION
            ,T1.N_ID_SUSCRIPCION
                  ,T1.C_NUM_SOLICITUD
            ,T1.C_NUM_CREDITO
                  ,T1.N_ID_ENTIDAD
                  ,T1.C_NOM_ENTIDAD
                  ,T1.N_ID_RAMO
                  ,T1.N_ID_PRODUCTO
                  ,T1.C_DES_PRODUCTO
                  ,T1.N_ID_PLAN
                  ,T1.C_COD_PLAN
                  ,T1.C_DES_CORTAPLAN
                  ,T1.C_DES_LARGAPLAN
                  ,T1.C_COD_REFERENCIA
                  ,T1.C_COD_TRAMA
                  ,T1.C_VAL_SECPOLIZA
                  ,T1.C_VAL_POLIZA
                  ,T1.N_ID_TIPOPOLIZA
                  ,T1.N_ID_TIPOPAGOPOLIZA
                  ,T1.N_ID_TIPOMONEDA
                  ,T1.N_ID_TIPOREGLATARIFA
                  ,T1.N_ID_TIPOPLAN
                  ,T1.N_ID_TIPOVIGENCIA
                  ,T1.N_ID_TIPOCLIENTE
                  ,T1.N_ID_TIPOPERSONA
                  ,T1.D_FEC_CERTIFICADO
                  ,T1.D_FEC_INIVIGENCIA
                  ,T1.D_FEC_FINVIGENCIA
                  ,T1.D_FEC_REGISTRO
                  ,T1.D_FEC_VENTA
                  ,T1.N_NUM_VALORCOMERCIAL
                  ,T1.N_NUM_PRIMABRUTA
                  ,T1.N_NUM_PRIMANETA
                  ,T1.N_NUM_COM_CANAL
                  ,T1.N_NUM_VERSION
                  ,T1.C_OBS_DESCRIPTIVO
                  ,T1.N_ID_PERSONA
                  ,T1.N_ID_ASEGURADO
                  ,T1.N_IND_ACTIVO
                  ,T1.N_ID_ESTADO
                  ,T1.C_COD_USUCREACION
                  ,T1.D_FEC_CREACION
                  ,T1.C_COD_USUMODIF
                  ,T1.D_FEC_MODIFICACION
                  ,T1.N_ID_ESTADOTRANSFERENCIA
                  ,T1.C_DES_ESTADOTRANSFERENCIA
                  ,T1.MESHABILITADO
                  ,T1.N_ID_CANAL
                  ,T1.C_NOM_CANAL
                  ,T1.C_DES_REGION
                  ,T1.C_DES_ZONA
                  ,T1.N_ID_ESTABLECIMIENTO
                  ,T1.C_VAL_CODHOMOLOGACION
                  ,T1.C_NOM_ESTABLECIMIENTO
                  ,T1.N_ID_PEREMISOR
                  ,T1.N_ID_PERVENDEDOR
                  ,T1.N_ID_ADJUNTOPOLIZA
                  ,T1.C_MODELO_SUBMODELO
                  ,T1.D_FEC_ANULACION
                  ,T1.N_ID_PERANULACION
                  ,T1.N_ID_MOTIVOANULA
                  ,T1.N_IND_ANULAR
                  ,T1.N_IND_CANCELAR
            FROM TABLA_1_5 T1
            LEFT JOIN T_MAE_COTIZACION COTI ON T1.N_ID_COTIZACION = COTI.N_ID_COTIZACION
      ), TABLA_3 AS (
            SELECT
                  T2.NUMROW
                  ,T2.ROW_TOTAL
                  ,T2.N_ID_POLIZA
                  ,T2.C_NUM_POLIZA
                  ,T2.N_ID_CERTIFICADO
                  ,T2.C_NUM_CERTIFICADO
                  ,T2.N_ID_COTIZACION
                  ,T2.C_NUM_COTIZACION
            ,T2.N_ID_SUSCRIPCION
                  ,T2.C_NUM_SOLICITUD
            ,T2.C_NUM_CREDITO
                  ,T2.N_ID_ENTIDAD
                  ,T2.C_NOM_ENTIDAD
                  ,T2.N_ID_RAMO
                  ,T2.N_ID_PRODUCTO
                  ,T2.C_DES_PRODUCTO
                  ,T2.N_ID_PLAN
                  ,T2.C_COD_PLAN
                  ,T2.C_DES_CORTAPLAN
                  ,T2.C_DES_LARGAPLAN
                  ,T2.C_COD_REFERENCIA
                  ,T2.C_COD_TRAMA
                  ,T2.C_VAL_SECPOLIZA
                  ,T2.C_VAL_POLIZA
                  ,T2.N_ID_TIPOPOLIZA
                  ,T2.N_ID_TIPOPAGOPOLIZA
                  ,T2.N_ID_TIPOMONEDA
                  ,T2.N_ID_TIPOREGLATARIFA
                  ,T2.N_ID_TIPOPLAN
                  ,T2.N_ID_TIPOVIGENCIA
                  ,T2.N_ID_TIPOCLIENTE
                  ,T2.N_ID_TIPOPERSONA
                  ,T2.D_FEC_CERTIFICADO
                  ,T2.D_FEC_INIVIGENCIA
                  ,T2.D_FEC_FINVIGENCIA
                  ,T2.D_FEC_REGISTRO
                  ,T2.D_FEC_VENTA
                  ,T2.N_NUM_VALORCOMERCIAL
                  ,T2.N_NUM_PRIMABRUTA
                  ,T2.N_NUM_PRIMANETA
                  ,T2.N_NUM_COM_CANAL
                  ,T2.N_NUM_VERSION
                  ,T2.C_OBS_DESCRIPTIVO
                  ,0 AS N_ID_PERSONA
                  ,TER.C_NOM_COMPLETO
                  ,0 AS N_ID_CONTRATANTE
                  ,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_CONTRATANTE
                  ,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_CONTRATANTE
                  ,TER.C_NOM_COMPLETO AS C_NOM_COMPLETO_CONTRATANTE
                  ,TER.N_ID_UBIGEODEPARTAMENTO
                  ,TER.N_ID_UBIGEOPROVINCIA
                  ,TER.N_ID_UBIGEODISTRITO
                  ,TER.N_ID_TIPOVIA
                  ,TER.C_DES_DIRECCION
                  ,TER.C_VAL_NUMVIA
                  ,T2.N_ID_ASEGURADO
                  ,T2.N_IND_ACTIVO
                  ,T2.N_ID_ESTADO
                  ,T2.C_COD_USUCREACION
                  ,T2.D_FEC_CREACION
                  ,T2.C_COD_USUMODIF
                  ,T2.D_FEC_MODIFICACION
                  ,T2.N_ID_ESTADOTRANSFERENCIA
                  ,T2.C_DES_ESTADOTRANSFERENCIA
                  ,T2.MESHABILITADO
                  ,T2.N_ID_CANAL
                  ,T2.C_NOM_CANAL
                  ,T2.C_DES_REGION
                  ,T2.C_DES_ZONA
                  ,T2.N_ID_ESTABLECIMIENTO
                  ,T2.C_VAL_CODHOMOLOGACION
                  ,T2.C_NOM_ESTABLECIMIENTO
                  ,T2.N_ID_PEREMISOR
                  ,T2.N_ID_PERVENDEDOR
                  ,T2.N_ID_ADJUNTOPOLIZA
                  ,T2.C_MODELO_SUBMODELO
                  ,T2.D_FEC_ANULACION
                  ,T2.N_ID_PERANULACION
                  ,T2.N_ID_MOTIVOANULA
                  ,T2.N_IND_ANULAR
                  ,T2.N_IND_CANCELAR
            FROM TABLA_2 T2
            LEFT JOIN T_DET_ROLTERCEROSUSCRIPCION RTC ON RTC.N_ID_SUSCRIPCION = T2.N_ID_SUSCRIPCION AND RTC.N_ID_TIPOROLTERCERO = 364  AND RTC.N_IND_ACTIVO = 1
            LEFT JOIN T_MAE_TERCERO TER ON RTC.N_ID_TERCERO = TER.N_ID_TERCERO
            LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
      ), TABLA_4 AS (
            SELECT
                  T3.NUMROW
                  ,T3.ROW_TOTAL
                  ,T3.N_ID_POLIZA
                  ,T3.C_NUM_POLIZA
                  ,T3.N_ID_CERTIFICADO
                  ,T3.C_NUM_CERTIFICADO
                  ,T3.N_ID_COTIZACION
                  ,T3.C_NUM_COTIZACION
            ,T3.N_ID_SUSCRIPCION
                  ,T3.C_NUM_SOLICITUD
            ,T3.C_NUM_CREDITO
                  ,T3.N_ID_ENTIDAD
                  ,T3.C_NOM_ENTIDAD
                  ,T3.N_ID_RAMO
                  ,T3.N_ID_PRODUCTO
                  ,T3.C_DES_PRODUCTO
                  ,T3.N_ID_PLAN
                  ,T3.C_COD_PLAN
                  ,T3.C_DES_CORTAPLAN
                  ,T3.C_DES_LARGAPLAN
                  ,T3.C_COD_REFERENCIA
                  ,T3.C_COD_TRAMA
                  ,T3.C_VAL_SECPOLIZA
                  ,T3.C_VAL_POLIZA
                  ,T3.N_ID_TIPOPOLIZA
                  ,T3.N_ID_TIPOPAGOPOLIZA
                  ,T3.N_ID_TIPOMONEDA
                  ,T3.N_ID_TIPOREGLATARIFA
                  ,T3.N_ID_TIPOPLAN
                  ,T3.N_ID_TIPOVIGENCIA
                  ,T3.N_ID_TIPOCLIENTE
                  ,T3.N_ID_TIPOPERSONA
                  ,T3.D_FEC_CERTIFICADO
                  ,T3.D_FEC_INIVIGENCIA
                  ,T3.D_FEC_FINVIGENCIA
                  ,T3.D_FEC_REGISTRO
                  ,T3.D_FEC_VENTA
                  ,T3.N_NUM_VALORCOMERCIAL
                  ,T3.N_NUM_PRIMABRUTA
                  ,T3.N_NUM_PRIMANETA
                  ,T3.N_NUM_COM_CANAL
                  ,T3.N_NUM_VERSION
                  ,T3.C_OBS_DESCRIPTIVO
                  ,T3.N_ID_PERSONA
                  ,T3.C_NOM_COMPLETO
                  ,T3.N_ID_CONTRATANTE
                  ,T3.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T3.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T3.C_NOM_COMPLETO_CONTRATANTE
                  ,T3.N_ID_UBIGEODEPARTAMENTO
                  ,T3.N_ID_UBIGEOPROVINCIA
                  ,T3.N_ID_UBIGEODISTRITO
                  ,T3.N_ID_TIPOVIA
                  ,T3.C_DES_DIRECCION
                  ,T3.C_VAL_NUMVIA
                  ,T3.N_ID_ASEGURADO
                  ,TER.N_ID_TIPOIDENTIDAD AS N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_ASEGURADO
                  ,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_ASEGURADO
                  ,ISNULL(TER.C_APE_PATERNO,'''') AS C_APE_PATERNO_ASEGURADO
                  ,ISNULL(TER.C_APE_MATERNO,'''') AS C_APE_MATERNO_ASEGURADO
                  ,ISNULL(TER.C_NOM_TERCERO,'''') AS C_NOMBRE_ASEGURADO
                  ,ISNULL(TER.C_NOM_COMPLETO,'''') AS C_NOM_COMPLETO_ASEGURADO
                  ,ISNULL(TER.C_VAL_CELULAR,'''') AS C_CELULAR_ASEGURADO
                  ,ISNULL(TER.C_DIR_CORREO,'''') C_CORREO_ASEGURADO
                  ,T3.N_IND_ACTIVO
                  ,T3.N_ID_ESTADO
                  ,T3.C_COD_USUCREACION
                  ,T3.D_FEC_CREACION
                  ,T3.C_COD_USUMODIF
                  ,T3.D_FEC_MODIFICACION
                  ,T3.N_ID_ESTADOTRANSFERENCIA
                  ,T3.C_DES_ESTADOTRANSFERENCIA
                  ,T3.MESHABILITADO
                  ,T3.N_ID_CANAL
                  ,T3.C_NOM_CANAL
                  ,T3.C_DES_REGION
                  ,T3.C_DES_ZONA
                  ,T3.N_ID_ESTABLECIMIENTO
                  ,T3.C_VAL_CODHOMOLOGACION
                  ,T3.C_NOM_ESTABLECIMIENTO
                  ,T3.N_ID_PEREMISOR
                  ,T3.N_ID_PERVENDEDOR
                  ,T3.N_ID_ADJUNTOPOLIZA
                  ,T3.C_MODELO_SUBMODELO
                  ,T3.D_FEC_ANULACION
                  ,T3.N_ID_PERANULACION
                  ,T3.N_ID_MOTIVOANULA
                  ,T3.N_IND_ANULAR
                  ,T3.N_IND_CANCELAR
            FROM TABLA_3 T3
            LEFT JOIN T_DET_ROLTERCEROSUSCRIPCION RTA ON RTA.N_ID_SUSCRIPCION = T3.N_ID_SUSCRIPCION AND RTA.N_ID_TIPOROLTERCERO = 365 AND RTA.N_IND_ACTIVO = 1 --AND RTA.N_ID_ESTADO=8
            LEFT JOIN T_MAE_TERCERO TER ON RTA.N_ID_TERCERO = TER.N_ID_TERCERO
            LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
      ), TABLA_5 AS (
            SELECT
                  T4.NUMROW
                  ,T4.ROW_TOTAL
                  ,T4.N_ID_POLIZA
                  ,T4.C_NUM_POLIZA
                  ,T4.N_ID_CERTIFICADO
                  ,T4.C_NUM_CERTIFICADO
                  ,T4.N_ID_COTIZACION
                  ,T4.C_NUM_COTIZACION
            ,T4.N_ID_SUSCRIPCION
                  ,T4.C_NUM_SOLICITUD
            ,T4.C_NUM_CREDITO
                  ,T4.N_ID_ENTIDAD
                  ,T4.C_NOM_ENTIDAD
                  ,T4.N_ID_RAMO
                  ,T4.N_ID_PRODUCTO
                  ,T4.C_DES_PRODUCTO
                  ,T4.N_ID_PLAN
                  ,T4.C_COD_PLAN
                  ,T4.C_DES_CORTAPLAN
                  ,T4.C_DES_LARGAPLAN
                  ,T4.C_COD_REFERENCIA
                  ,T4.C_COD_TRAMA
                  ,T4.C_VAL_SECPOLIZA
                  ,T4.C_VAL_POLIZA
                  ,T4.N_ID_TIPOPOLIZA
                  ,T4.N_ID_TIPOPAGOPOLIZA
                  ,T4.N_ID_TIPOMONEDA
                  ,T4.N_ID_TIPOREGLATARIFA
                  ,T4.N_ID_TIPOPLAN
                  ,T4.N_ID_TIPOVIGENCIA
                  ,T4.N_ID_TIPOCLIENTE
                  ,T4.N_ID_TIPOPERSONA
                  ,T4.D_FEC_CERTIFICADO
                  ,T4.D_FEC_INIVIGENCIA
                  ,T4.D_FEC_FINVIGENCIA
                  ,T4.D_FEC_REGISTRO
                  ,T4.D_FEC_VENTA
                  ,T4.N_NUM_VALORCOMERCIAL
                  ,T4.N_NUM_PRIMABRUTA
                  ,T4.N_NUM_PRIMANETA
                  ,T4.N_NUM_COM_CANAL
                  ,T4.N_NUM_VERSION
                  ,T4.C_OBS_DESCRIPTIVO
                  ,T4.N_ID_PERSONA
                  ,T4.C_NOM_COMPLETO
                  ,T4.N_ID_CONTRATANTE
                  ,T4.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T4.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T4.C_NOM_COMPLETO_CONTRATANTE
                  ,T4.N_ID_UBIGEODEPARTAMENTO
                  ,T4.N_ID_UBIGEOPROVINCIA
                  ,T4.N_ID_UBIGEODISTRITO
                  ,T4.N_ID_TIPOVIA
                  ,T4.C_DES_DIRECCION
                  ,T4.C_VAL_NUMVIA
                  ,T4.N_ID_ASEGURADO
                  ,T4.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T4.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T4.C_NUM_IDENTIDAD_ASEGURADO
                  ,T4.C_APE_PATERNO_ASEGURADO
                  ,T4.C_APE_MATERNO_ASEGURADO
                  ,T4.C_NOMBRE_ASEGURADO
                  ,T4.C_NOM_COMPLETO_ASEGURADO
                  ,T4.C_CELULAR_ASEGURADO
                  ,T4.C_CORREO_ASEGURADO
                  ,0  AS N_ID_RESPONSABLEPAGO
                  ,TDO.C_DES_TIPO AS C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,TER.C_VAL_NUMIDENTIDAD AS C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,TER.C_NOM_COMPLETO AS C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T4.N_IND_ACTIVO
                  ,T4.N_ID_ESTADO
                  ,T4.C_COD_USUCREACION
                  ,T4.D_FEC_CREACION
                  ,T4.C_COD_USUMODIF
                  ,T4.D_FEC_MODIFICACION
                  ,T4.N_ID_ESTADOTRANSFERENCIA
                  ,T4.C_DES_ESTADOTRANSFERENCIA
                  ,T4.MESHABILITADO
                  ,T4.N_ID_CANAL
                  ,T4.C_NOM_CANAL
                  ,T4.C_DES_REGION
                  ,T4.C_DES_ZONA
                  ,T4.N_ID_ESTABLECIMIENTO
                  ,T4.C_VAL_CODHOMOLOGACION
                  ,T4.C_NOM_ESTABLECIMIENTO
                  ,T4.N_ID_PEREMISOR
                  ,T4.N_ID_PERVENDEDOR
                  ,T4.N_ID_ADJUNTOPOLIZA
                  ,T4.C_MODELO_SUBMODELO
                  ,T4.D_FEC_ANULACION
                  ,T4.N_ID_PERANULACION
                  ,T4.N_ID_MOTIVOANULA
                  ,T4.N_IND_ANULAR
                  ,T4.N_IND_CANCELAR
            FROM TABLA_4 T4
            LEFT JOIN T_DET_ROLTERCEROSUSCRIPCION RTR ON RTR.N_ID_SUSCRIPCION = T4.N_ID_SUSCRIPCION AND RTR.N_ID_TIPOROLTERCERO = 366  AND RTR.N_IND_ACTIVO = 1 --AND  RTR.N_ID_ESTADO=8
            LEFT JOIN T_MAE_TERCERO TER ON RTR.N_ID_TERCERO = TER.N_ID_TERCERO
            LEFT JOIN T_MAE_TIPO TDO ON TER.N_ID_TIPOIDENTIDAD = TDO.N_ID_TIPO
      ), TABLA_6 AS (
            SELECT
                  T5.NUMROW
                  ,T5.ROW_TOTAL
                  ,T5.N_ID_POLIZA
                  ,T5.C_NUM_POLIZA
                  ,T5.N_ID_CERTIFICADO
                  ,T5.C_NUM_CERTIFICADO
                  ,T5.N_ID_COTIZACION
                  ,T5.C_NUM_COTIZACION
            ,T5.N_ID_SUSCRIPCION
            ,T5.C_NUM_SOLICITUD
                  ,T5.C_NUM_CREDITO
                  ,T5.N_ID_ENTIDAD
                  ,T5.C_NOM_ENTIDAD
                  ,T5.N_ID_RAMO
                  ,T5.N_ID_PRODUCTO
                  ,T5.C_DES_PRODUCTO
                  ,T5.N_ID_PLAN
                  ,T5.C_COD_PLAN
                  ,T5.C_DES_CORTAPLAN
                  ,T5.C_DES_LARGAPLAN
                  ,T5.C_COD_REFERENCIA
                  ,T5.C_COD_TRAMA
                  ,T5.C_VAL_SECPOLIZA
                  ,T5.C_VAL_POLIZA
                  ,T5.N_ID_TIPOPOLIZA
                  ,T5.N_ID_TIPOPAGOPOLIZA
                  ,T5.N_ID_TIPOMONEDA
                  ,T5.N_ID_TIPOREGLATARIFA
                  ,T5.N_ID_TIPOPLAN
                  ,T5.N_ID_TIPOVIGENCIA
                  ,T5.N_ID_TIPOCLIENTE
                  ,T5.N_ID_TIPOPERSONA
                  ,T5.D_FEC_CERTIFICADO
                  ,T5.D_FEC_INIVIGENCIA
                  ,T5.D_FEC_FINVIGENCIA
                  ,T5.D_FEC_REGISTRO
                  ,T5.D_FEC_VENTA
                  ,T5.N_NUM_VALORCOMERCIAL
                  ,T5.N_NUM_PRIMABRUTA
                  ,T5.N_NUM_PRIMANETA
                  ,T5.N_NUM_COM_CANAL
                  ,T5.N_NUM_VERSION
                  ,T5.C_OBS_DESCRIPTIVO
                  ,T5.N_ID_PERSONA
                  ,T5.C_NOM_COMPLETO
                  ,T5.N_ID_CONTRATANTE
                  ,T5.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T5.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T5.C_NOM_COMPLETO_CONTRATANTE
                  ,T5.N_ID_UBIGEODEPARTAMENTO
                  ,T5.N_ID_UBIGEOPROVINCIA
                  ,T5.N_ID_UBIGEODISTRITO
                  ,T5.N_ID_TIPOVIA
                  ,T5.C_DES_DIRECCION
                  ,T5.C_VAL_NUMVIA
                  ,T5.N_ID_ASEGURADO
                  ,T5.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T5.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T5.C_NUM_IDENTIDAD_ASEGURADO
                  ,T5.C_APE_PATERNO_ASEGURADO
                  ,T5.C_APE_MATERNO_ASEGURADO
                  ,T5.C_NOMBRE_ASEGURADO
                  ,T5.C_NOM_COMPLETO_ASEGURADO
                  ,T5.C_CELULAR_ASEGURADO
                  ,T5.C_CORREO_ASEGURADO
                  ,T5.N_ID_RESPONSABLEPAGO
                  ,T5.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T5.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T5.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,TMO.C_DES_TIPO AS C_DES_TIPOMONEDA
                  ,TMO.C_ABR_TIPO AS C_ABR_TIPOMONEDA
                  ,T5.N_IND_ACTIVO
                  ,T5.N_ID_ESTADO
                  ,T5.C_COD_USUCREACION
                  ,T5.D_FEC_CREACION
                  ,T5.C_COD_USUMODIF
                  ,T5.D_FEC_MODIFICACION
                  ,T5.N_ID_ESTADOTRANSFERENCIA
                  ,T5.C_DES_ESTADOTRANSFERENCIA
                  ,T5.MESHABILITADO
                  ,T5.N_ID_CANAL
                  ,T5.C_NOM_CANAL
                  ,T5.C_DES_REGION
                  ,T5.C_DES_ZONA
                  ,T5.N_ID_ESTABLECIMIENTO
                  ,T5.C_VAL_CODHOMOLOGACION
                  ,T5.C_NOM_ESTABLECIMIENTO
                  ,T5.N_ID_PEREMISOR
                  ,T5.N_ID_PERVENDEDOR
                  ,T5.N_ID_ADJUNTOPOLIZA
                  ,T5.C_MODELO_SUBMODELO
                  ,T5.D_FEC_ANULACION
                  ,T5.N_ID_PERANULACION
                  ,T5.N_ID_MOTIVOANULA
                  ,T5.N_IND_ANULAR
                  ,T5.N_IND_CANCELAR
            FROM TABLA_5 T5
            INNER JOIN T_MAE_TIPO TMO ON T5.N_ID_TIPOMONEDA = TMO.N_ID_TIPO
      ), TABLA_7 AS (
            SELECT
                  T6.NUMROW
                  ,T6.ROW_TOTAL
                  ,T6.N_ID_POLIZA
                  ,T6.C_NUM_POLIZA
                  ,T6.N_ID_CERTIFICADO
                  ,T6.C_NUM_CERTIFICADO
                  ,T6.N_ID_COTIZACION
                  ,T6.C_NUM_COTIZACION
            ,T6.N_ID_SUSCRIPCION
                  ,T6.C_NUM_SOLICITUD
            ,T6.C_NUM_CREDITO
                  ,T6.N_ID_ENTIDAD
                  ,T6.C_NOM_ENTIDAD
                  ,T6.N_ID_RAMO
                  ,T6.N_ID_PRODUCTO
                  ,T6.C_DES_PRODUCTO
                  ,T6.N_ID_PLAN
                  ,T6.C_COD_PLAN
                  ,T6.C_DES_CORTAPLAN
                  ,T6.C_DES_LARGAPLAN
                  ,T6.C_COD_REFERENCIA
                  ,T6.C_COD_TRAMA
                  ,T6.C_VAL_SECPOLIZA
                  ,T6.C_VAL_POLIZA
                  ,T6.N_ID_TIPOPOLIZA
                  ,T6.N_ID_TIPOPAGOPOLIZA
                  ,T6.N_ID_TIPOMONEDA
                  ,TVIG.C_DES_TIPO AS C_DES_TIPOVIGENCIA
                  ,T6.N_ID_TIPOREGLATARIFA
                  ,T6.N_ID_TIPOPLAN
                  ,T6.N_ID_TIPOVIGENCIA
                  ,T6.N_ID_TIPOCLIENTE
                  ,T6.N_ID_TIPOPERSONA
                  ,T6.D_FEC_CERTIFICADO
                  ,T6.D_FEC_INIVIGENCIA
                  ,T6.D_FEC_FINVIGENCIA
                  ,T6.D_FEC_REGISTRO
                  ,T6.D_FEC_VENTA
                  ,T6.N_NUM_VALORCOMERCIAL
                  ,T6.N_NUM_PRIMABRUTA
                  ,T6.N_NUM_PRIMANETA
                  ,T6.N_NUM_COM_CANAL
                  ,T6.N_NUM_VERSION
                  ,T6.C_OBS_DESCRIPTIVO
                  ,T6.N_ID_PERSONA
                  ,T6.C_NOM_COMPLETO
                  ,T6.N_ID_CONTRATANTE
                  ,T6.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T6.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T6.C_NOM_COMPLETO_CONTRATANTE
                  ,T6.N_ID_UBIGEODEPARTAMENTO
                  ,T6.N_ID_UBIGEOPROVINCIA
                  ,T6.N_ID_UBIGEODISTRITO
                  ,T6.N_ID_TIPOVIA
                  ,T6.C_DES_DIRECCION
                  ,T6.C_VAL_NUMVIA
                  ,T6.N_ID_ASEGURADO
                  ,T6.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T6.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T6.C_NUM_IDENTIDAD_ASEGURADO
                  ,T6.C_APE_PATERNO_ASEGURADO
                  ,T6.C_APE_MATERNO_ASEGURADO
                  ,T6.C_NOMBRE_ASEGURADO
                  ,T6.C_NOM_COMPLETO_ASEGURADO
                  ,T6.C_CELULAR_ASEGURADO
                  ,T6.C_CORREO_ASEGURADO
                  ,T6.N_ID_RESPONSABLEPAGO
                  ,T6.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T6.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T6.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T6.C_DES_TIPOMONEDA
                  ,T6.C_ABR_TIPOMONEDA
                  ,T6.N_IND_ACTIVO
                  ,T6.N_ID_ESTADO
                  ,T6.C_COD_USUCREACION
                  ,T6.D_FEC_CREACION
                  ,T6.C_COD_USUMODIF
                  ,T6.D_FEC_MODIFICACION
                  ,T6.N_ID_ESTADOTRANSFERENCIA
                  ,T6.C_DES_ESTADOTRANSFERENCIA
                  ,T6.MESHABILITADO
                  ,T6.N_ID_CANAL
                  ,T6.C_NOM_CANAL
                  ,T6.C_DES_REGION
                  ,T6.C_DES_ZONA
                  ,T6.N_ID_ESTABLECIMIENTO
                  ,T6.C_VAL_CODHOMOLOGACION
                  ,T6.C_NOM_ESTABLECIMIENTO
                  ,T6.N_ID_PEREMISOR
                  ,T6.N_ID_PERVENDEDOR
                  ,T6.N_ID_ADJUNTOPOLIZA
                  ,T6.C_MODELO_SUBMODELO
                  ,T6.D_FEC_ANULACION
                  ,T6.N_ID_PERANULACION
                  ,T6.N_ID_MOTIVOANULA
                  ,T6.N_IND_ANULAR
                  ,T6.N_IND_CANCELAR
            FROM TABLA_6 T6
            INNER JOIN T_MAE_TIPO TVIG ON TVIG.N_ID_TIPO=T6.N_ID_TIPOVIGENCIA
      ), TABLA_8 AS (
            SELECT
                  T7.NUMROW
                  ,T7.ROW_TOTAL
                  ,T7.N_ID_POLIZA
                  ,T7.C_NUM_POLIZA
                  ,T7.N_ID_CERTIFICADO
                  ,T7.C_NUM_CERTIFICADO
                  ,T7.N_ID_COTIZACION
                  ,T7.C_NUM_COTIZACION
            ,T7.N_ID_SUSCRIPCION
                  ,T7.C_NUM_SOLICITUD
            ,T7.C_NUM_CREDITO
                  ,T7.N_ID_ENTIDAD
                  ,T7.C_NOM_ENTIDAD
                  ,T7.N_ID_RAMO
                  ,T7.N_ID_PRODUCTO
                  ,T7.C_DES_PRODUCTO
                  ,T7.N_ID_PLAN
                  ,T7.C_COD_PLAN
                  ,T7.C_DES_CORTAPLAN
                  ,T7.C_DES_LARGAPLAN
                  ,T7.C_COD_REFERENCIA
                  ,T7.C_COD_TRAMA
                  ,T7.C_VAL_SECPOLIZA
                  ,T7.C_VAL_POLIZA
                  ,T7.N_ID_TIPOPOLIZA
                  ,T7.N_ID_TIPOPAGOPOLIZA
                  ,T7.N_ID_TIPOMONEDA
                  ,T7.C_DES_TIPOVIGENCIA
                  ,T7.N_ID_TIPOREGLATARIFA
                  ,T7.N_ID_TIPOPLAN
                  ,T7.N_ID_TIPOVIGENCIA
                  ,T7.N_ID_TIPOCLIENTE
                  ,T7.N_ID_TIPOPERSONA
                  ,T7.D_FEC_CERTIFICADO
                  ,T7.D_FEC_INIVIGENCIA
                  ,T7.D_FEC_FINVIGENCIA
                  ,T7.D_FEC_REGISTRO
                  ,T7.D_FEC_VENTA
                  ,T7.N_NUM_VALORCOMERCIAL
                  ,T7.N_NUM_PRIMABRUTA
                  ,T7.N_NUM_PRIMANETA
                  ,T7.N_NUM_COM_CANAL
                  ,T7.N_NUM_VERSION
                  ,T7.C_OBS_DESCRIPTIVO
                  ,T7.N_ID_PERSONA
                  ,T7.C_NOM_COMPLETO
                  ,T7.N_ID_CONTRATANTE
                  ,T7.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T7.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T7.C_NOM_COMPLETO_CONTRATANTE
                  ,T7.N_ID_UBIGEODEPARTAMENTO
                  ,T7.N_ID_UBIGEOPROVINCIA
                  ,T7.N_ID_UBIGEODISTRITO
                  ,T7.N_ID_TIPOVIA
                  ,T7.C_DES_DIRECCION
                  ,T7.C_VAL_NUMVIA
                  ,T7.N_ID_ASEGURADO
                  ,T7.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T7.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T7.C_NUM_IDENTIDAD_ASEGURADO
                  ,T7.C_APE_PATERNO_ASEGURADO
                  ,T7.C_APE_MATERNO_ASEGURADO
                  ,T7.C_NOMBRE_ASEGURADO
                  ,T7.C_NOM_COMPLETO_ASEGURADO
                  ,T7.C_CELULAR_ASEGURADO
                  ,T7.C_CORREO_ASEGURADO
                  ,T7.N_ID_RESPONSABLEPAGO
                  ,T7.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T7.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T7.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T7.C_DES_TIPOMONEDA
                  ,T7.C_ABR_TIPOMONEDA
                  ,T7.N_IND_ACTIVO
                  ,T7.N_ID_ESTADO
                  ,T7.C_COD_USUCREACION
                  ,T7.D_FEC_CREACION
                  ,T7.C_COD_USUMODIF
                  ,T7.D_FEC_MODIFICACION
                  ,T7.N_ID_ESTADOTRANSFERENCIA
                  ,T7.C_DES_ESTADOTRANSFERENCIA
                  ,T7.MESHABILITADO
                  ,T7.N_ID_CANAL
                  ,T7.C_NOM_CANAL
                  ,T7.C_DES_REGION
                  ,T7.C_DES_ZONA
                  ,T7.N_ID_ESTABLECIMIENTO
                  ,T7.C_VAL_CODHOMOLOGACION
                  ,T7.C_NOM_ESTABLECIMIENTO
                  ,T7.N_ID_PEREMISOR
                  ,PERSE.C_NOM_COMPLETO AS C_NOM_COMPLETO_EMISOR
                  ,T7.N_ID_PERVENDEDOR
                  ,T7.N_ID_ADJUNTOPOLIZA
                  ,T7.C_MODELO_SUBMODELO
                  ,T7.D_FEC_ANULACION
                  ,T7.N_ID_PERANULACION
                  ,T7.N_ID_MOTIVOANULA
                  ,T7.N_IND_ANULAR
                  ,T7.N_IND_CANCELAR
            FROM TABLA_7 T7
            LEFT JOIN T_MAE_PERSONA PERSE ON PERSE.N_ID_PERSONA = T7.N_ID_PEREMISOR
      ), TABLA_9 AS (
            SELECT
                  T8.NUMROW
                  ,T8.ROW_TOTAL
                  ,T8.N_ID_POLIZA
                  ,T8.C_NUM_POLIZA
                  ,T8.N_ID_CERTIFICADO
                  ,T8.C_NUM_CERTIFICADO
                  ,T8.N_ID_COTIZACION
                  ,T8.C_NUM_COTIZACION
                  ,T8.N_ID_SUSCRIPCION
                  ,T8.C_NUM_SOLICITUD
            ,T8.C_NUM_CREDITO
            ,T8.N_ID_ENTIDAD
                  ,T8.C_NOM_ENTIDAD
                  ,T8.N_ID_RAMO
                  ,T8.N_ID_PRODUCTO
                  ,T8.C_DES_PRODUCTO
                  ,T8.N_ID_PLAN
                  ,T8.C_COD_PLAN
                  ,T8.C_DES_CORTAPLAN
                  ,T8.C_DES_LARGAPLAN
                  ,T8.C_COD_REFERENCIA
                  ,T8.C_COD_TRAMA
                  ,T8.C_VAL_SECPOLIZA
                  ,T8.C_VAL_POLIZA
                  ,T8.N_ID_TIPOPOLIZA
                  ,T8.N_ID_TIPOPAGOPOLIZA
                  ,T8.N_ID_TIPOMONEDA
                  ,T8.C_DES_TIPOVIGENCIA
                  ,T8.N_ID_TIPOREGLATARIFA
                  ,T8.N_ID_TIPOPLAN
                  ,T8.N_ID_TIPOVIGENCIA
                  ,T8.N_ID_TIPOCLIENTE
                  ,T8.N_ID_TIPOPERSONA
                  ,T8.D_FEC_CERTIFICADO
                  ,T8.D_FEC_INIVIGENCIA
                  ,T8.D_FEC_FINVIGENCIA
                  ,T8.D_FEC_REGISTRO
                  ,T8.D_FEC_VENTA
                  ,T8.N_NUM_VALORCOMERCIAL
                  ,T8.N_NUM_PRIMABRUTA
                  ,T8.N_NUM_PRIMANETA
                  ,T8.N_NUM_COM_CANAL
                  ,T8.N_NUM_VERSION
                  ,T8.C_OBS_DESCRIPTIVO
                  ,T8.N_ID_PERSONA
                  ,T8.C_NOM_COMPLETO
                  ,T8.N_ID_CONTRATANTE
                  ,T8.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T8.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T8.C_NOM_COMPLETO_CONTRATANTE
                  ,T8.N_ID_UBIGEODEPARTAMENTO
                  ,T8.N_ID_UBIGEOPROVINCIA
                  ,T8.N_ID_UBIGEODISTRITO
                  ,T8.N_ID_TIPOVIA
                  ,T8.C_DES_DIRECCION
                  ,T8.C_VAL_NUMVIA
                  ,T8.N_ID_ASEGURADO
                  ,T8.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T8.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T8.C_NUM_IDENTIDAD_ASEGURADO
                  ,T8.C_APE_PATERNO_ASEGURADO
                  ,T8.C_APE_MATERNO_ASEGURADO
                  ,T8.C_NOMBRE_ASEGURADO
                  ,T8.C_NOM_COMPLETO_ASEGURADO
                  ,T8.C_CELULAR_ASEGURADO
                  ,T8.C_CORREO_ASEGURADO
                  ,T8.N_ID_RESPONSABLEPAGO
                  ,T8.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T8.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T8.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T8.C_DES_TIPOMONEDA
                  ,T8.C_ABR_TIPOMONEDA
                  ,T8.N_IND_ACTIVO
                  ,T8.N_ID_ESTADO
                  ,T8.C_COD_USUCREACION
                  ,T8.D_FEC_CREACION
                  ,T8.C_COD_USUMODIF
                  ,T8.D_FEC_MODIFICACION
                  ,T8.N_ID_ESTADOTRANSFERENCIA
                  ,T8.C_DES_ESTADOTRANSFERENCIA
                  ,T8.MESHABILITADO
                  ,T8.N_ID_CANAL
                  ,T8.C_NOM_CANAL
                  ,T8.C_DES_REGION
                  ,T8.C_DES_ZONA
                  ,T8.N_ID_ESTABLECIMIENTO
                  ,T8.C_VAL_CODHOMOLOGACION
                  ,T8.C_NOM_ESTABLECIMIENTO
                  ,T8.N_ID_PEREMISOR
                  ,T8.C_NOM_COMPLETO_EMISOR
                  ,T8.N_ID_PERVENDEDOR
                  ,PERSV.C_VAL_CODREFERENCIA
                  ,PERSV.C_NOM_COMPLETO AS C_NOM_COMPLETO_VENDEDOR
                  ,UPPER(TIPOVE.C_DES_TIPO) AS C_TIPO_FUNCIONARIO
                  ,T8.N_ID_ADJUNTOPOLIZA
                  ,T8.C_MODELO_SUBMODELO
                  ,T8.D_FEC_ANULACION
                  ,T8.N_ID_PERANULACION
                  ,T8.N_ID_MOTIVOANULA
                  ,T8.N_IND_ANULAR
                  ,T8.N_IND_CANCELAR
            FROM TABLA_8 T8
            LEFT JOIN T_MAE_PERSONA PERSV ON PERSV.N_ID_PERSONA = T8.N_ID_PERVENDEDOR  
            LEFT JOIN T_DET_PERSONA DTPERV ON PERSV.N_ID_PERSONA = DTPERV.N_ID_PERSONA
            LEFT JOIN T_MAE_TIPO TIPOVE ON TIPOVE.N_ID_TIPO=DTPERV.N_ID_TIPOROL  
      ), TABLA_10 AS (
            SELECT
                  T9.NUMROW
                  ,T9.ROW_TOTAL
                  ,T9.N_ID_POLIZA
                  ,T9.C_NUM_POLIZA
                  ,T9.N_ID_CERTIFICADO
                  ,T9.C_NUM_CERTIFICADO
                  ,T9.N_ID_COTIZACION
                  ,T9.C_NUM_COTIZACION
            ,T9.N_ID_SUSCRIPCION
                  ,T9.C_NUM_SOLICITUD
            ,T9.C_NUM_CREDITO
                  ,T9.N_ID_ENTIDAD
                  ,T9.C_NOM_ENTIDAD
                  ,T9.N_ID_RAMO
                  ,T9.N_ID_PRODUCTO
                  ,T9.C_DES_PRODUCTO
                  ,T9.N_ID_PLAN
                  ,T9.C_COD_PLAN
                  ,T9.C_DES_CORTAPLAN
                  ,T9.C_DES_LARGAPLAN
                  ,T9.C_COD_REFERENCIA
                  ,T9.C_COD_TRAMA
                  ,T9.C_VAL_SECPOLIZA
                  ,T9.C_VAL_POLIZA
                  ,T9.N_ID_TIPOPOLIZA
                  ,T9.N_ID_TIPOPAGOPOLIZA
                  ,T9.N_ID_TIPOMONEDA
                  ,T9.C_DES_TIPOVIGENCIA
                  ,T9.N_ID_TIPOREGLATARIFA
                  ,T9.N_ID_TIPOPLAN
                  ,T9.N_ID_TIPOVIGENCIA
                  ,T9.N_ID_TIPOCLIENTE
                  ,T9.N_ID_TIPOPERSONA
                  ,T9.D_FEC_CERTIFICADO
                  ,T9.D_FEC_INIVIGENCIA
                  ,T9.D_FEC_FINVIGENCIA
                  ,T9.D_FEC_REGISTRO
                  ,T9.D_FEC_VENTA
                  ,T9.N_NUM_VALORCOMERCIAL
                  ,T9.N_NUM_PRIMABRUTA
                  ,T9.N_NUM_PRIMANETA
                  ,T9.N_NUM_COM_CANAL
                  ,T9.N_NUM_VERSION
                  ,T9.C_OBS_DESCRIPTIVO
                  ,T9.N_ID_PERSONA
                  ,T9.C_NOM_COMPLETO
                  ,T9.N_ID_CONTRATANTE
                  ,T9.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T9.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T9.C_NOM_COMPLETO_CONTRATANTE
                  ,T9.N_ID_UBIGEODEPARTAMENTO
                  ,T9.N_ID_UBIGEOPROVINCIA
                  ,T9.N_ID_UBIGEODISTRITO
                  ,T9.N_ID_TIPOVIA
                  ,T9.C_DES_DIRECCION
                  ,T9.C_VAL_NUMVIA
                  ,T9.N_ID_ASEGURADO
                  ,T9.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T9.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T9.C_NUM_IDENTIDAD_ASEGURADO
                  ,T9.C_APE_PATERNO_ASEGURADO
                  ,T9.C_APE_MATERNO_ASEGURADO
                  ,T9.C_NOMBRE_ASEGURADO
                  ,T9.C_NOM_COMPLETO_ASEGURADO
                  ,T9.C_CELULAR_ASEGURADO
                  ,T9.C_CORREO_ASEGURADO
                  ,T9.N_ID_RESPONSABLEPAGO
                  ,T9.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T9.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T9.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T9.C_DES_TIPOMONEDA
                  ,T9.C_ABR_TIPOMONEDA
                  ,T9.N_IND_ACTIVO
                  ,T9.N_ID_ESTADO
                  ,T9.C_COD_USUCREACION
                  ,T9.D_FEC_CREACION
                  ,T9.C_COD_USUMODIF
                  ,T9.D_FEC_MODIFICACION
                  ,T9.N_ID_ESTADOTRANSFERENCIA
                  ,T9.C_DES_ESTADOTRANSFERENCIA
                  ,T9.MESHABILITADO
                  ,T9.N_ID_CANAL
                  ,T9.C_NOM_CANAL
                  ,T9.C_DES_REGION
                  ,T9.C_DES_ZONA
                  ,T9.N_ID_ESTABLECIMIENTO
                  ,T9.C_VAL_CODHOMOLOGACION
                  ,T9.C_NOM_ESTABLECIMIENTO
                  ,T9.N_ID_PEREMISOR
                  ,T9.C_NOM_COMPLETO_EMISOR
                  ,T9.N_ID_PERVENDEDOR
                  ,T9.C_VAL_CODREFERENCIA
                  ,T9.C_NOM_COMPLETO_VENDEDOR
                  ,T9.C_TIPO_FUNCIONARIO
                  ,T9.N_ID_ADJUNTOPOLIZA
                  ,ISNULL(ADJP.C_DES_ADJUNTO,'''') AS C_DES_ADJUNTOPOLIZA
                  ,T9.C_MODELO_SUBMODELO
                  ,T9.D_FEC_ANULACION
                  ,T9.N_ID_PERANULACION
                  ,T9.N_ID_MOTIVOANULA
                  ,T9.N_IND_ANULAR
                  ,T9.N_IND_CANCELAR
            FROM TABLA_9 T9
            LEFT JOIN T_MAE_ADJUNTO ADJP ON ADJP.N_ID_ADJUNTO = T9.N_ID_ADJUNTOPOLIZA  
      ),TABLA_11 AS (
            SELECT
                  T10.NUMROW
                  ,T10.ROW_TOTAL
                  ,T10.N_ID_POLIZA
                  ,T10.C_NUM_POLIZA
                  ,T10.N_ID_CERTIFICADO
                  ,T10.C_NUM_CERTIFICADO
                  ,T10.N_ID_COTIZACION
                  ,T10.C_NUM_COTIZACION
            ,T10.N_ID_SUSCRIPCION
                  ,T10.C_NUM_SOLICITUD
            ,T10.C_NUM_CREDITO
                  ,T10.N_ID_ENTIDAD
                  ,T10.C_NOM_ENTIDAD
                  ,T10.N_ID_RAMO
                  ,T10.N_ID_PRODUCTO
                  ,T10.C_DES_PRODUCTO
                  ,T10.N_ID_PLAN
                  ,T10.C_COD_PLAN
                  ,T10.C_DES_CORTAPLAN
                  ,T10.C_DES_LARGAPLAN
                  ,T10.C_COD_REFERENCIA
                  ,T10.C_COD_TRAMA
                  ,T10.C_VAL_SECPOLIZA
                  ,T10.C_VAL_POLIZA
                  ,T10.N_ID_TIPOPOLIZA
                  ,T10.N_ID_TIPOPAGOPOLIZA
                  ,T10.N_ID_TIPOMONEDA
                  ,T10.C_DES_TIPOVIGENCIA
                  ,T10.N_ID_TIPOREGLATARIFA
                  ,T10.N_ID_TIPOPLAN
                  ,T10.N_ID_TIPOVIGENCIA
                  ,T10.N_ID_TIPOCLIENTE
                  ,T10.N_ID_TIPOPERSONA
                  ,T10.D_FEC_CERTIFICADO
                  ,T10.D_FEC_INIVIGENCIA
                  ,T10.D_FEC_FINVIGENCIA
                  ,T10.D_FEC_REGISTRO
                  ,T10.D_FEC_VENTA
                  ,T10.N_NUM_VALORCOMERCIAL
                  ,T10.N_NUM_PRIMABRUTA
                  ,T10.N_NUM_PRIMANETA
                  ,T10.N_NUM_COM_CANAL
                  ,T10.N_NUM_VERSION
                  ,T10.C_OBS_DESCRIPTIVO
                  ,T10.N_ID_PERSONA
                  ,T10.C_NOM_COMPLETO
                  ,T10.N_ID_CONTRATANTE
                  ,T10.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T10.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T10.C_NOM_COMPLETO_CONTRATANTE
                  ,T10.N_ID_UBIGEODEPARTAMENTO
                  ,T10.N_ID_UBIGEOPROVINCIA
                  ,T10.N_ID_UBIGEODISTRITO
                  ,T10.N_ID_TIPOVIA
                  ,T10.C_DES_DIRECCION
                  ,T10.C_VAL_NUMVIA
                  ,T10.N_ID_ASEGURADO
                  ,T10.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T10.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T10.C_NUM_IDENTIDAD_ASEGURADO
                  ,T10.C_APE_PATERNO_ASEGURADO
                  ,T10.C_APE_MATERNO_ASEGURADO
                  ,T10.C_NOMBRE_ASEGURADO
                  ,T10.C_NOM_COMPLETO_ASEGURADO
                  ,T10.C_CELULAR_ASEGURADO
                  ,T10.C_CORREO_ASEGURADO
                  ,T10.N_ID_RESPONSABLEPAGO
                  ,T10.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T10.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T10.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T10.C_DES_TIPOMONEDA
                  ,T10.C_ABR_TIPOMONEDA
                  ,T10.N_IND_ACTIVO
                  ,T10.N_ID_ESTADO
                  ,T10.C_COD_USUCREACION
                  ,T10.D_FEC_CREACION
                  ,T10.C_COD_USUMODIF
                  ,T10.D_FEC_MODIFICACION
                  ,T10.N_ID_ESTADOTRANSFERENCIA
                  ,T10.C_DES_ESTADOTRANSFERENCIA
                  ,T10.MESHABILITADO
                  ,T10.N_ID_CANAL
                  ,T10.C_NOM_CANAL
                  ,T10.C_DES_REGION
                  ,T10.C_DES_ZONA
                  ,T10.N_ID_ESTABLECIMIENTO
                  ,T10.C_VAL_CODHOMOLOGACION
                  ,T10.C_NOM_ESTABLECIMIENTO
                  ,T10.N_ID_PEREMISOR
                  ,T10.C_NOM_COMPLETO_EMISOR
                  ,T10.N_ID_PERVENDEDOR
                  ,T10.C_VAL_CODREFERENCIA
                  ,T10.C_NOM_COMPLETO_VENDEDOR
                  ,T10.C_TIPO_FUNCIONARIO
                  ,T10.N_ID_ADJUNTOPOLIZA
                  ,T10.C_DES_ADJUNTOPOLIZA
                  ,T10.C_MODELO_SUBMODELO
                  ,T10.D_FEC_ANULACION
                  ,T10.N_ID_PERANULACION
                  ,PER.C_NOM_COMPLETO AS C_PER_ANULACION
                  ,T10.N_ID_MOTIVOANULA
                  ,T10.N_IND_ANULAR
                  ,T10.N_IND_CANCELAR
            FROM TABLA_10 T10
            LEFT JOIN T_MAE_PERSONA PER ON T10.N_ID_PERANULACION = PER.N_ID_PERSONA
      ), TABLA_12 AS (
            SELECT
                  T11.NUMROW
                  ,T11.ROW_TOTAL
                  ,T11.N_ID_POLIZA
                  ,T11.C_NUM_POLIZA
                  ,T11.N_ID_CERTIFICADO
                  ,T11.C_NUM_CERTIFICADO
                  ,T11.N_ID_COTIZACION
                  ,T11.C_NUM_COTIZACION
            ,T11.N_ID_SUSCRIPCION
                  ,T11.C_NUM_SOLICITUD
            ,T11.C_NUM_CREDITO
                  ,T11.N_ID_ENTIDAD
                  ,T11.C_NOM_ENTIDAD
                  ,T11.N_ID_RAMO
                  ,T11.N_ID_PRODUCTO
                  ,T11.C_DES_PRODUCTO
                  ,T11.N_ID_PLAN
                  ,T11.C_COD_PLAN
                  ,T11.C_DES_CORTAPLAN
                  ,T11.C_DES_LARGAPLAN
                  ,T11.C_COD_REFERENCIA
                  ,T11.C_COD_TRAMA
                  ,T11.C_VAL_SECPOLIZA
                  ,T11.C_VAL_POLIZA
                  ,T11.N_ID_TIPOPOLIZA
                  ,T11.N_ID_TIPOPAGOPOLIZA
                  ,T11.N_ID_TIPOMONEDA
                  ,T11.N_ID_TIPOREGLATARIFA
                  ,T11.N_ID_TIPOPLAN
                  ,T11.N_ID_TIPOVIGENCIA
                  ,T11.N_ID_TIPOCLIENTE
                  ,T11.N_ID_TIPOPERSONA
                  ,T11.D_FEC_CERTIFICADO
                  ,T11.D_FEC_INIVIGENCIA
                  ,T11.D_FEC_FINVIGENCIA
                  ,T11.D_FEC_REGISTRO
                  ,T11.D_FEC_VENTA
                  ,T11.N_NUM_VALORCOMERCIAL
                  ,T11.N_NUM_PRIMABRUTA
                  ,T11.N_NUM_PRIMANETA
                  ,T11.N_NUM_COM_CANAL
                  ,T11.N_NUM_VERSION
                  ,T11.C_OBS_DESCRIPTIVO
                  ,T11.N_ID_PERSONA
                  ,T11.C_NOM_COMPLETO
                  ,T11.N_ID_CONTRATANTE
                  ,T11.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T11.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T11.C_NOM_COMPLETO_CONTRATANTE
                  ,T11.N_ID_UBIGEODEPARTAMENTO
                  ,T11.N_ID_UBIGEOPROVINCIA
                  ,T11.N_ID_UBIGEODISTRITO
                  ,T11.N_ID_TIPOVIA
                  ,T11.C_DES_DIRECCION
                  ,T11.C_VAL_NUMVIA
                  ,T11.N_ID_ASEGURADO
                  ,T11.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T11.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T11.C_NUM_IDENTIDAD_ASEGURADO
                  ,T11.C_APE_PATERNO_ASEGURADO
                  ,T11.C_APE_MATERNO_ASEGURADO
                  ,T11.C_NOMBRE_ASEGURADO
                  ,T11.C_NOM_COMPLETO_ASEGURADO
                  ,T11.C_CELULAR_ASEGURADO
                  ,T11.C_CORREO_ASEGURADO
                  ,T11.N_ID_RESPONSABLEPAGO
                  ,T11.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T11.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T11.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T11.C_DES_TIPOMONEDA
                  ,T11.C_ABR_TIPOMONEDA
                  ,T11.C_DES_TIPOVIGENCIA
                  ,T11.N_IND_ACTIVO
                  ,T11.N_ID_ESTADO
                  ,T11.C_COD_USUCREACION
                  ,T11.D_FEC_CREACION
                  ,T11.C_COD_USUMODIF
                  ,T11.D_FEC_MODIFICACION
                  ,T11.N_ID_ESTADOTRANSFERENCIA
                  ,T11.C_DES_ESTADOTRANSFERENCIA
                  ,T11.MESHABILITADO
                  ,T11.N_ID_CANAL
                  ,T11.C_NOM_CANAL
                  ,T11.C_DES_REGION
                  ,T11.C_DES_ZONA
                  ,T11.N_ID_ESTABLECIMIENTO
                  ,T11.C_VAL_CODHOMOLOGACION
                  ,T11.C_NOM_ESTABLECIMIENTO
                  ,T11.N_ID_PEREMISOR
                  ,T11.C_NOM_COMPLETO_EMISOR
                  ,T11.N_ID_PERVENDEDOR
                  ,T11.C_VAL_CODREFERENCIA
                  ,T11.C_NOM_COMPLETO_VENDEDOR
                  ,T11.C_TIPO_FUNCIONARIO
                  ,T11.N_ID_ADJUNTOPOLIZA
                  ,T11.C_DES_ADJUNTOPOLIZA
                  ,T11.C_MODELO_SUBMODELO
                  ,T11.D_FEC_ANULACION
                  ,T11.N_ID_PERANULACION
                  ,T11.C_PER_ANULACION
                  ,MOA.C_DES_TIPO AS C_DES_MOTIVOANULACION
                  ,T11.N_IND_ANULAR
                  ,T11.N_IND_CANCELAR
            FROM TABLA_11 T11
            LEFT JOIN T_MAE_TIPO MOA ON T11.N_ID_MOTIVOANULA = MOA.N_ID_TIPO
      )

            SELECT                  
                  T12.NUMROW
                  ,T12.ROW_TOTAL
                  ,ISNULL(T12.N_ID_POLIZA,'''') AS N_ID_POLIZA
                  ,ISNULL(T12.C_NUM_POLIZA,'''') AS C_NUM_POLIZA
                  ,ISNULL(T12.N_ID_CERTIFICADO,'''') AS N_ID_CERTIFICADO
                  ,ISNULL(T12.C_NUM_CERTIFICADO,'''') AS C_NUM_CERTIFICADO
                  ,ISNULL(T12.N_ID_COTIZACION,'''') AS N_ID_COTIZACION
                  ,ISNULL(T12.C_NUM_COTIZACION,'''') AS C_NUM_COTIZACION
            ,T12.N_ID_SUSCRIPCION
                  ,ISNULL(T12.C_NUM_SOLICITUD,'''') AS C_NUM_SOLICITUD
            ,ISNULL(T12.C_NUM_CREDITO,'''') AS C_NUM_CREDITO
                  ,T12.N_ID_ENTIDAD
                  ,T12.C_NOM_ENTIDAD
                  ,T12.N_ID_RAMO
                  ,T12.N_ID_PRODUCTO
                  ,T12.C_DES_PRODUCTO
                  ,T12.N_ID_PLAN
                  ,T12.C_COD_PLAN
                  ,T12.C_DES_CORTAPLAN
                  ,T12.C_DES_LARGAPLAN
                  ,T12.C_COD_REFERENCIA
                  ,T12.C_COD_TRAMA
                  ,T12.C_VAL_SECPOLIZA
                  ,T12.C_VAL_POLIZA
                  ,T12.N_ID_TIPOPOLIZA
                  ,T12.N_ID_TIPOPAGOPOLIZA
                  ,T12.N_ID_TIPOMONEDA
                  ,T12.N_ID_TIPOREGLATARIFA
                  ,T12.N_ID_TIPOPLAN
                  ,T12.N_ID_TIPOVIGENCIA
                  ,T12.N_ID_TIPOCLIENTE
                  ,T12.N_ID_TIPOPERSONA
                  ,T12.D_FEC_CERTIFICADO
                  ,T12.D_FEC_INIVIGENCIA
                  ,T12.D_FEC_FINVIGENCIA
                  ,T12.D_FEC_REGISTRO
                  ,T12.D_FEC_VENTA
                  ,T12.N_NUM_VALORCOMERCIAL
                  ,T12.N_NUM_PRIMABRUTA
                  ,T12.N_NUM_PRIMANETA
                  ,T12.N_NUM_COM_CANAL
                  ,T12.N_NUM_VERSION
                  ,T12.C_OBS_DESCRIPTIVO
                  ,T12.N_ID_PERSONA
                  ,T12.C_NOM_COMPLETO
                  ,T12.N_ID_CONTRATANTE
                  ,T12.C_TIPO_IDENTIDAD_CONTRATANTE
                  ,T12.C_NUM_IDENTIDAD_CONTRATANTE
                  ,T12.C_NOM_COMPLETO_CONTRATANTE
                  ,T12.N_ID_UBIGEODEPARTAMENTO
                  ,T12.N_ID_UBIGEOPROVINCIA
                  ,T12.N_ID_UBIGEODISTRITO
                  ,T12.N_ID_TIPOVIA
                  ,T12.C_DES_DIRECCION
                  ,T12.C_VAL_NUMVIA
                  ,T12.N_ID_ASEGURADO
                  ,T12.N_ID_TIPO_IDENTIDAD_ASEGURADO
                  ,T12.C_TIPO_IDENTIDAD_ASEGURADO
                  ,T12.C_NUM_IDENTIDAD_ASEGURADO
                  ,T12.C_APE_PATERNO_ASEGURADO
                  ,T12.C_APE_MATERNO_ASEGURADO
                  ,T12.C_NOMBRE_ASEGURADO
                  ,T12.C_NOM_COMPLETO_ASEGURADO
                  ,T12.C_CELULAR_ASEGURADO
                  ,T12.C_CORREO_ASEGURADO
                  ,T12.N_ID_RESPONSABLEPAGO
                  ,T12.C_TIPO_IDENTIDAD_RESPONSABLEPAGO
                  ,T12.C_NUM_IDENTIDAD_RESPONSABLEPAGO
                  ,T12.C_NOM_COMPLETO_RESPONSABLEPAGO
                  ,T12.C_DES_TIPOMONEDA
                  ,T12.C_ABR_TIPOMONEDA
                  ,T12.C_DES_TIPOVIGENCIA
                  ,T12.N_IND_ACTIVO
                  ,T12.N_ID_ESTADO
                  ,EST.C_DES_ESTADO
                  ,T12.C_COD_USUCREACION
                  ,T12.D_FEC_CREACION
                  ,T12.C_COD_USUMODIF
                  ,T12.D_FEC_MODIFICACION
                  ,T12.N_ID_ESTADOTRANSFERENCIA
                  ,T12.C_DES_ESTADOTRANSFERENCIA
                  ,T12.MESHABILITADO
                  ,T12.N_ID_CANAL
                  ,T12.C_NOM_CANAL
                  ,T12.C_DES_REGION
                  ,T12.C_DES_ZONA
                  ,T12.N_ID_ESTABLECIMIENTO
                  ,T12.C_VAL_CODHOMOLOGACION
                  ,T12.C_NOM_ESTABLECIMIENTO
                  ,T12.N_ID_PEREMISOR
                  ,T12.C_NOM_COMPLETO_EMISOR
                  ,T12.N_ID_PERVENDEDOR
                  ,T12.C_VAL_CODREFERENCIA
                  ,T12.C_NOM_COMPLETO_VENDEDOR
                  ,T12.C_TIPO_FUNCIONARIO
                  ,T12.N_ID_ADJUNTOPOLIZA
                  ,T12.C_DES_ADJUNTOPOLIZA
                  ,T12.C_MODELO_SUBMODELO
                  ,T12.D_FEC_ANULACION
                  ,T12.N_ID_PERANULACION
                  ,T12.C_PER_ANULACION
                  ,T12.C_DES_MOTIVOANULACION
                  ,T12.N_IND_ANULAR
                  ,T12.N_IND_CANCELAR
            FROM TABLA_12 T12
            LEFT JOIN T_MAE_ESTADO EST ON T12.N_ID_ESTADO = EST.N_ID_ESTADO
            ORDER BY N_ID_SUSCRIPCION DESC
      '

      --SELECT @script_ejecutar
      EXEC (@script_ejecutar)
END

GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectHistoriales]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SPS_T_SelectHistoriales 1838 
CREATE PROCEDURE [dbo].[SPS_T_SelectHistoriales]
    @pi_id_certificado INT
AS
BEGIN
    SELECT
       FORMAT(MSUS.D_FEC_CREACION, 'dd/MM/yyyy')  AS Fecha,
        PER.C_NOM_COMPLETO AS Agente,
        CASE WHEN MSUS.N_ID_MOVESTADO=7 THEN 'Observado' ELSE 'Vigente' END AS Descripcion,
        NULL AS Nota
         FROM T_MAE_CERTIFICADO CER
    INNER JOIN T_MAE_SUSCRIPCION SUS ON SUS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
    INNER JOIN (
        SELECT N_ID_SUSCRIPCION, MAX(D_FEC_CREACION) AS MaxFecha
        FROM T_MOV_SUSCRIPCION
        GROUP BY N_ID_SUSCRIPCION
    ) AS LatestMSUS ON LatestMSUS.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
    INNER JOIN T_MOV_SUSCRIPCION MSUS ON MSUS.N_ID_SUSCRIPCION = LatestMSUS.N_ID_SUSCRIPCION AND MSUS.D_FEC_CREACION = LatestMSUS.MaxFecha
    INNER JOIN T_MAE_USUARIO USU ON USU.C_COD_USUARIO = MSUS.C_COD_USUCREACION
    INNER JOIN T_MAE_PERSONA PER ON PER.N_ID_PERSONA = USU.N_ID_PERSONA
    WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado;
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectHistorialesSusc]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_SelectHistorialesSusc 4360
CREATE PROCEDURE [dbo].[SPS_T_SelectHistorialesSusc]
    @pi_id_suscripcion INT
AS
BEGIN
    SELECT
       FORMAT(MSUS.D_FEC_CREACION, 'dd/MM/yyyy')  AS Fecha,
        PER.C_NOM_COMPLETO AS Agente,
        CASE WHEN MSUS.N_ID_MOVESTADO=7 THEN 'Observado' ELSE 'Vigente' END AS Descripcion,
        NULL AS Nota
          FROM T_MAE_SUSCRIPCION SUS 
		  INNER JOIN T_MAE_CERTIFICADO CER ON SUS.N_ID_SUSCRIPCION= CER.N_ID_SUSCRIPCION
		  INNER JOIN (
        SELECT N_ID_SUSCRIPCION, MAX(D_FEC_CREACION) AS MaxFecha
        FROM T_MOV_SUSCRIPCION
        GROUP BY N_ID_SUSCRIPCION
		 ) AS LatestMSUS ON LatestMSUS.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		  INNER JOIN T_MOV_SUSCRIPCION MSUS ON MSUS.N_ID_SUSCRIPCION = LatestMSUS.N_ID_SUSCRIPCION AND MSUS.D_FEC_CREACION = LatestMSUS.MaxFecha
		  INNER JOIN T_MAE_USUARIO USU ON USU.C_COD_USUARIO=MSUS.C_COD_USUCREACION
		  INNER JOIN T_MAE_PERSONA PER ON PER.N_ID_PERSONA=USU.N_ID_PERSONA
		  WHERE SUS.N_ID_SUSCRIPCION = @pi_id_suscripcion;
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenes]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SPS_T_SelectListaExamenes 1878
CREATE PROCEDURE [dbo].[SPS_T_SelectListaExamenes] --[SPS_T_SelectListaExamenes] 1762
    @pi_id_certificado INT
AS
BEGIN
    --SELECT
    --    'Examen Médico' AS TipoExamen
    --FROM T_MAE_CERTIFICADO WHERE N_ID_CERTIFICADO IN (1,2)
    SELECT DISTINCT
		EXA.C_DES_EXAMEN AS TipoExamen,
		CER.N_ID_ESTADO
	FROM 
	T_MAE_CERTIFICADO CER
	INNER JOIN T_MAE_SUSCRIPCION SUS ON SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
	INNER JOIN T_DET_ROLTERCEROSUSCRIPCION TDSP ON TDSP.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION
	INNER JOIN T_DET_EVALUACIONDPSEXAMENPLAN DPE ON DPE.N_ID_DETEVALUACIONDPSPLAN=TDSP.N_ID_DETEVALUACIONDPSPLAN
	INNER JOIN T_MAE_EXAMEN EXA ON EXA.N_ID_EXAMEN = DPE.N_ID_EXAMEN
	INNER JOIN T_MAE_ESTADO EST ON EST.N_ID_ESTADO = DPE.N_ID_ESTADO
	WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado 
	AND DPE.N_ID_ESTADO = 1 AND N_ID_TIPOASEGURADO =640
	AND DPE.N_IND_ACTIVO = 1

	
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesM]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SPS_T_SelectListaExamenesM] --[SPS_T_SelectListaExamenes] 367
    @pi_id_certificado INT
AS
BEGIN
    --SELECT
    --    'Examen Médico' AS TipoExamen
    --FROM T_MAE_CERTIFICADO WHERE N_ID_CERTIFICADO IN (1,2)
    SELECT 
		EXA.C_DES_EXAMEN AS TipoExamen,
		CER.N_ID_ESTADO
	FROM 
	T_MAE_CERTIFICADO CER
	INNER JOIN T_MAE_SUSCRIPCION SUS ON SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
	INNER JOIN T_DET_ROLTERCEROSUSCRIPCION TDSP ON TDSP.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION
	INNER JOIN T_DET_EVALUACIONDPSEXAMENPLAN DPE ON DPE.N_ID_DETEVALUACIONDPSPLAN=TDSP.N_ID_DETEVALUACIONDPSPLAN
	INNER JOIN T_MAE_EXAMEN EXA ON EXA.N_ID_EXAMEN = DPE.N_ID_EXAMEN
	INNER JOIN T_MAE_ESTADO EST ON EST.N_ID_ESTADO = DPE.N_ID_ESTADO
	WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado 
	AND DPE.N_ID_ESTADO = 1 AND N_ID_TIPOASEGURADO =641
	AND DPE.N_IND_ACTIVO = 1

	
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesMSusc]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_SelectListaExamenesMSusc 785
CREATE PROCEDURE [dbo].[SPS_T_SelectListaExamenesMSusc] --[SPS_T_SelectListaExamenes] 367
    @pi_id_suscripcion INT
AS
BEGIN
    --SELECT
    --    'Examen Médico' AS TipoExamen
    --FROM T_MAE_CERTIFICADO WHERE N_ID_CERTIFICADO IN (1,2)
    SELECT 
		EXA.C_DES_EXAMEN AS TipoExamen,
		SUS.N_ID_ESTADO
	FROM 
	T_MAE_SUSCRIPCION SUS
	INNER JOIN T_MAE_CERTIFICADO CER ON SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
	INNER JOIN T_DET_ROLTERCEROSUSCRIPCION TDSP ON TDSP.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION
	INNER JOIN T_DET_EVALUACIONDPSEXAMENPLAN DPE ON DPE.N_ID_DETEVALUACIONDPSPLAN=TDSP.N_ID_DETEVALUACIONDPSPLAN
	INNER JOIN T_MAE_EXAMEN EXA ON EXA.N_ID_EXAMEN = DPE.N_ID_EXAMEN
	INNER JOIN T_MAE_ESTADO EST ON EST.N_ID_ESTADO = DPE.N_ID_ESTADO
 
	WHERE SUS.N_ID_SUSCRIPCION = @pi_id_suscripcion 
	AND DPE.N_ID_ESTADO = 1 AND N_ID_TIPOASEGURADO =641
	--AND DPE.N_IND_ACTIVO = 1
 
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_SelectListaExamenesSusc]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_SelectListaExamenesSusc 4377  
CREATE PROCEDURE [dbo].[SPS_T_SelectListaExamenesSusc] --[SPS_T_SelectListaExamenesSusc] 4327  
    @pi_id_suscripcion INT  
AS  
BEGIN  
    --SELECT  
    --    'Examen Médico' AS TipoExamen  
    --FROM T_MAE_CERTIFICADO WHERE N_ID_CERTIFICADO IN (1,2)  
    SELECT DISTINCT  
  EXA.C_DES_EXAMEN AS TipoExamen,
  SUS.N_ID_ESTADO
 FROM   
 T_MAE_SUSCRIPCION SUS  
 INNER JOIN T_MAE_CERTIFICADO CER ON SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION  
 LEFT JOIN T_DET_ROLTERCEROSUSCRIPCION TDSP ON TDSP.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION  
 LEFT JOIN T_DET_EVALUACIONDPSEXAMENPLAN DPE ON DPE.N_ID_DETEVALUACIONDPSPLAN=TDSP.N_ID_DETEVALUACIONDPSPLAN  
 LEFT JOIN T_MAE_EXAMEN EXA ON EXA.N_ID_EXAMEN = DPE.N_ID_EXAMEN  
 LEFT JOIN T_MAE_ESTADO EST ON EST.N_ID_ESTADO = DPE.N_ID_ESTADO  
  
 WHERE SUS.N_ID_SUSCRIPCION = @pi_id_suscripcion   
 AND N_ID_TIPOASEGURADO =640 --AND DPE.N_ID_ESTADO = 1   
 AND DPE.N_IND_ACTIVO = 1  
  
END  
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeAprobarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_U_MaeAprobarPoliza](
	@pi_id_certificado int = 0,
	@pi_id_control VARCHAR(100) = '',
	@flagPolHibrido INT = 0,
    @idPolizaHibrido VARCHAR(20) = ''
)
AS
BEGIN
/*
 IF @flagPolHibrido = 1 AND @idPolizaHibrido <> ''
        BEGIN
		UPDATE SUS
				SET  N_ID_ESTADO = 6
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				WHERE ID_POL_HIBRIDO = @idPolizaHibrido

		
				UPDATE POL
				SET N_ID_ESTADO = 15
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido

				UPDATE CER 
				SET N_ID_ESTADO = 15
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK) 
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido
		END 
		ELSE 
		BEGIN 
		UPDATE SUS
			SET N_ID_ESTADO = 6
		FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
		INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		WHERE SUS.N_ID_ESTADO=7 AND CER.N_ID_CERTIFICADO=CAST(@pi_id_certificado AS VARCHAR)

		UPDATE T_MAE_CERTIFICADO 
			SET N_ID_ESTADO = 15
			WHERE N_ID_CERTIFICADO = @pi_id_certificado;

		UPDATE POL
			SET N_ID_ESTADO = 15
			FROM T_MAE_POLIZA POL WITH(NOLOCK)
			INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
			WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado;


END 
*/
DECLARE @RESULTADO INT = 0

SELECT
	@RESULTADO = @RESULTADO +COUNT(SUS.N_ID_RESULTADODPS)
FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
AND SUS.N_ID_RESULTADODPS = 7
AND CER.N_IND_ACTIVO = 1

SELECT
	@RESULTADO = @RESULTADO +COUNT(SUS.N_ID_RESULTADOEDAD)
FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
AND SUS.N_ID_RESULTADOEDAD = 7
AND CER.N_IND_ACTIVO = 1

SELECT
	@RESULTADO = @RESULTADO+ COUNT(SUS.N_ID_RESULTADOIMC)
FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
AND SUS.N_ID_RESULTADOIMC = 7
AND CER.N_IND_ACTIVO = 1

SELECT
	@RESULTADO = @RESULTADO+ COUNT(SUS.N_ID_RESULTADOSA)
FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
AND SUS.N_ID_RESULTADOIMC = 7
AND CER.N_IND_ACTIVO = 1

SELECT @RESULTADO AS N_ID_RESULTADO

END
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeAprobarRechazarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_U_MaeAprobarRechazarPoliza]
(
    @pi_id_certificado INT = 0,
    @pi_id_usuario INT = 0,
    @des_motivo_rechazo VARCHAR(200) = NULL, 
    @idcontrol VARCHAR(100) = '',
    @flagPolHibrido INT = 0,
    @idPolizaHibrido VARCHAR(20) = ''
)
AS
BEGIN
    SET NOCOUNT ON;
    SET DATEFORMAT DMY;

    BEGIN TRY
        BEGIN TRANSACTION ACTUALIZA_POLIZA;

        DECLARE @ESTADO_ID INT,
                @ESTADO_IDSUS INT,
				@N_ID_MOTIVO INT, 
				@OBSERVACION VARCHAR(200),
                @cod_usu VARCHAR(100);

        SELECT @cod_usu = C_COD_USUARIO
        FROM T_MAE_USUARIO WITH(NOLOCK)
        WHERE N_ID_ESTADO = 8 
        AND N_IND_ACTIVO = 1 
        AND N_ID_USUARIO = @pi_id_usuario;


		IF @des_motivo_rechazo IS NOT NULL AND @des_motivo_rechazo <> ''
			BEGIN
				PRINT 'RECHAZO';
				SET @ESTADO_ID = 18 -- RECHAZADO
				SET @ESTADO_IDSUS = 18
				SET @N_ID_MOTIVO=43
				SET @OBSERVACION = 'Rechazo de Póliza por el módulo de Aprobación y Rechazo - Motivo: ' + ISNULL(@des_motivo_rechazo, 'Sin motivo');

			END
		ELSE
			BEGIN
				PRINT 'APROBADO';
				SET @ESTADO_ID = 15 -- VIGENTE
				SET @ESTADO_IDSUS = 6
				SET @N_ID_MOTIVO=44
				SET @OBSERVACION = 'Aprobación de Póliza en el módulo de Aprobación y Rechazo';
			END

		IF @flagPolHibrido = 0
		BEGIN
				UPDATE T_MAE_CERTIFICADO 
				SET N_ID_ESTADO = @ESTADO_ID
				WHERE N_ID_CERTIFICADO = @pi_id_certificado;

				UPDATE POL
				SET N_ID_ESTADO = @ESTADO_ID
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado;

				UPDATE SUS
				SET N_ID_ESTADO = @ESTADO_IDSUS
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON SUS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
				WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado;

			-- BITÁCORA
            INSERT INTO T_DET_BITACORA_CERTIFICADO (N_ID_CERTIFICADO, N_ID_SECUENCIA, N_ID_MOTIVO, N_ID_MOVESTADO, N_ID_TIPOMONEDA, N_NUM_PRIMANETA, N_NUM_PRIMABRUTA, C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, C_COD_USUCREACION, D_FEC_CREACION)
            SELECT TOP 1
                N_ID_CERTIFICADO,
                ISNULL(MAX(N_ID_SECUENCIA), 0) + 1,
                @N_ID_MOTIVO,
                @ESTADO_ID,
                N_ID_TIPOMONEDA,
                N_NUM_PRIMANETA,
                N_NUM_PRIMABRUTA,
                @OBSERVACION,
                1,
                1,
                @cod_usu,
                GETDATE()
            FROM T_DET_BITACORA_CERTIFICADO WITH(NOLOCK)
            WHERE N_ID_CERTIFICADO = @pi_id_certificado
            GROUP BY N_ID_CERTIFICADO, N_ID_TIPOMONEDA, N_NUM_PRIMANETA, N_NUM_PRIMABRUTA;

            INSERT INTO T_MOV_SUSCRIPCION (N_ID_SUSCRIPCION, N_ID_SECUENCIA, N_ID_MOVESTADO, N_ID_TIPOMOTIVO, C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, C_COD_USUCREACION, D_FEC_CREACION, C_COD_USUMODIF, D_FEC_MODIFICACION)
            SELECT TOP 1
                MS.N_ID_SUSCRIPCION,
                ISNULL(MAX(N_ID_SECUENCIA), 0) + 1,
                @ESTADO_IDSUS,
                NULL,
                @OBSERVACION,
                1,
                1,
                @cod_usu,
                GETDATE(),
                NULL,
                NULL
            FROM T_MOV_SUSCRIPCION MS WITH(NOLOCK)
            INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON MS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
            WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado
            GROUP BY MS.N_ID_SUSCRIPCION;

		END

		IF @flagPolHibrido = 1 AND @idPolizaHibrido <> ''
			BEGIN
				DECLARE @CERTIFICADOS TABLE (N_ID_CERTIFICADO INT);

				INSERT INTO @CERTIFICADOS (N_ID_CERTIFICADO)
				SELECT CER.N_ID_CERTIFICADO
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido;

				UPDATE POL
				SET N_ID_ESTADO = @ESTADO_ID
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido

				UPDATE CER 
				SET N_ID_ESTADO = @ESTADO_ID
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK) 
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido

				UPDATE SUS
				SET  N_ID_ESTADO = @ESTADO_IDSUS
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				WHERE ID_POL_HIBRIDO = @idPolizaHibrido
		
		INSERT INTO T_DET_BITACORA_CERTIFICADO (
            N_ID_CERTIFICADO, N_ID_SECUENCIA, N_ID_MOTIVO, N_ID_MOVESTADO, 
            N_ID_TIPOMONEDA, N_NUM_PRIMANETA, N_NUM_PRIMABRUTA, 
            C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, C_COD_USUCREACION, D_FEC_CREACION)
        SELECT 
            CER.N_ID_CERTIFICADO,
            ISNULL(MAX(BIT.N_ID_SECUENCIA), 0) + 1, 
            @N_ID_MOTIVO,
            @ESTADO_ID,
            CER.N_ID_TIPOMONEDA,
            CER.N_NUM_PRIMANETA,
            CER.N_NUM_PRIMABRUTA,
            @OBSERVACION,
            1,
            1, 
            @cod_usu,
            GETDATE()
        FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
        LEFT JOIN T_DET_BITACORA_CERTIFICADO BIT WITH(NOLOCK) ON CER.N_ID_CERTIFICADO = BIT.N_ID_CERTIFICADO
        INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
        WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido
        GROUP BY CER.N_ID_CERTIFICADO, CER.N_ID_TIPOMONEDA, CER.N_NUM_PRIMANETA, CER.N_NUM_PRIMABRUTA;

		
        INSERT INTO T_MOV_SUSCRIPCION (
            N_ID_SUSCRIPCION, N_ID_SECUENCIA, N_ID_MOVESTADO, N_ID_TIPOMOTIVO, 
            C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, 
            C_COD_USUCREACION, D_FEC_CREACION, C_COD_USUMODIF, D_FEC_MODIFICACION)
        SELECT 
            SUS.N_ID_SUSCRIPCION,
            ISNULL(MAX(MOV.N_ID_SECUENCIA), 0) + 1, 
            @ESTADO_IDSUS, 
            NULL, 
            @OBSERVACION, 
            1, 
            1, 
            @cod_usu,
            GETDATE(), 
            NULL, 
            NULL 
        FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
        LEFT JOIN T_MOV_SUSCRIPCION MOV WITH(NOLOCK) ON SUS.N_ID_SUSCRIPCION = MOV.N_ID_SUSCRIPCION
        WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido
        GROUP BY SUS.N_ID_SUSCRIPCION;

		END 

        COMMIT TRANSACTION ACTUALIZA_POLIZA;
        SELECT 1 AS N_ID_RESULTADO;
    END TRY
    BEGIN CATCH
        SELECT 0 AS N_ID_RESULTADO;
        ROLLBACK TRANSACTION ACTUALIZA_POLIZA;
		declare @ERROR varchar(200)
		set @ERROR=ERROR_MESSAGE() + CAST(ERROR_LINE() AS VARCHAR(10));
		EXEC SPI_T_MaeLog 'SPS_U_MaeAprobarRechazarPoliza',0, @ERROR, 0
       
    END CATCH;
END
GO
/****** Object:  StoredProcedure [dbo].[SPS_U_MaeDesaprobarPoliza]    Script Date: 3/03/2025 10:48:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SPS_U_MaeDesaprobarPoliza](
	@pi_id_certificado int = 0,
	@pi_id_control VARCHAR(100) = '',
	@des_motivo_rechazo VARCHAR(200)=NULL,
	@pi_id_usuario INT,
	@flagPolHibrido INT = 0,
    @idPolizaHibrido VARCHAR(20) = ''
)
AS
BEGIN
/*
DECLARE @SQL VARCHAR(MAX)
		IF @flagPolHibrido = 1 AND @idPolizaHibrido <> ''
		BEGIN
	
			UPDATE SUS
			SET N_ID_ESTADO= 18
			FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
			WHERE SUS.N_ID_ESTADO=7 AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido
		END 
		ELSE 
		BEGIN 

			UPDATE SUS
			SET N_ID_ESTADO= 18 --RECHAZADO
			FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
			INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
			WHERE SUS.N_ID_ESTADO=7 AND CER.N_ID_CERTIFICADO=CAST(@pi_id_certificado AS VARCHAR)

			UPDATE T_MAE_CERTIFICADO 
			SET N_ID_ESTADO = 18
			WHERE N_ID_CERTIFICADO = @pi_id_certificado;

		UPDATE POL
			SET N_ID_ESTADO = 18
			FROM T_MAE_POLIZA POL WITH(NOLOCK)
			INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
			WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado;

END 
EXEC (@SQL)

--UPDATE SUS SET
--	N_ID_RESULTADODPS=52
--FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
--INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
--WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado

*/




EXEC [SPS_U_MaeAprobarRechazarPoliza] @pi_id_certificado = @pi_id_certificado,@pi_id_usuario = @pi_id_usuario, @des_motivo_rechazo = @des_motivo_rechazo ,@flagPolHibrido = @flagPolHibrido, @idPolizaHibrido = @idPolizaHibrido
END
GO
