USE [Mapfreqoa]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_PlanCotizaSeguroVidaGrupoParticular]    Script Date: 31/03/2025 17:57:20 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_PlanCotizaSeguroVidaGrupoParticular]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeEvaluacionDPSVidaPiuraValidarSuscripcion]    Script Date: 31/03/2025 17:57:20 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_MaeEvaluacionDPSVidaPiuraValidarSuscripcion]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_DetCtrlTecnicoValidarVidaGrupoParticular]    Script Date: 31/03/2025 17:57:20 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_DetCtrlTecnicoValidarVidaGrupoParticular]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_DetCtrlTecnicoValidarVidaGrupoParticular]    Script Date: 31/03/2025 17:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC SPS_T_DetCtrlTecnicoValidarVidaGrupoParticular 18, '10/10/1992'
CREATE PROCEDURE [dbo].[SPS_T_DetCtrlTecnicoValidarVidaGrupoParticular](
	@pi_id_producto INT = 0,
	@pi_fec_nacimiento CHAR(10)
)
AS
BEGIN
	
	DECLARE @v_valor_edad SMALLINT = 0
	DECLARE @v_result_eval_emin DECIMAL(9,4)
	DECLARE @v_result_eval_emax DECIMAL(9,4)
	DECLARE @cod_result INT = 1
	DECLARE @msg_result VARCHAR(100) = ''

	SET @v_valor_edad = DATEDIFF(YEAR,CONVERT(DATETIME,@pi_fec_nacimiento,103),GETDATE())-(CASE WHEN DATEADD(YYYY,DATEDIFF(YEAR,CONVERT(DATETIME,@pi_fec_nacimiento,103),GETDATE()),CONVERT(DATETIME,@pi_fec_nacimiento,103))>GETDATE() THEN 1 ELSE 0 END)
	;

	WITH T_1 AS (
		SELECT  N_ID_PRODUCTO, N_ID_CTRLTECNICO, N_VAL_CTRLTECNICO
		FROM T_DET_PRODUCTOCTRLTECNICO PCT WITH(NOLOCK) 
		WHERE PCT.N_ID_PRODUCTO = @pi_id_producto AND PCT.N_IND_ACTIVO = 1 AND PCT.N_ID_ESTADO = 8
	), T_EdadMin AS (
		SELECT N_ID_PRODUCTO, (N_VAL_CTRLTECNICO - @v_valor_edad) VAL_EDADMIN
		FROM T_1 
		WHERE N_ID_CTRLTECNICO = 15
	), T_EdadMax AS (
		SELECT N_ID_PRODUCTO, (N_VAL_CTRLTECNICO - @v_valor_edad) VAL_EDADMAX
		FROM T_1 
		WHERE N_ID_CTRLTECNICO = 16
	), T_2 AS (
		SELECT TMIN.VAL_EDADMIN, TMAX.VAL_EDADMAX
		FROM T_EdadMin TMIN INNER JOIN T_EdadMax TMAX
		ON TMIN.N_ID_PRODUCTO = TMAX.N_ID_PRODUCTO
	)

	SELECT  @v_result_eval_emin = VAL_EDADMIN,
			@v_result_eval_emax = VAL_EDADMAX
	FROM T_2
	;

	IF @v_result_eval_emin > 0
		BEGIN
			SET @cod_result = 0
			SET @msg_result = 'El asegurado no cumple con la edad mínima configurado para el producto.'
		END
	IF @v_result_eval_emax < 0
		BEGIN
			SET @cod_result = 0
			SET @msg_result = 'El asegurado no cumple con la edad máxima configurado para el producto.'
		END

	SELECT  @cod_result AS COD_RESULT, 
			@msg_result AS MSG_RESULT

END

GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeEvaluacionDPSVidaPiuraValidarSuscripcion]    Script Date: 31/03/2025 17:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	Emisión
Objetivo 		:	Validar el cuestionario de una suscripción
Elaborado por	:	Global TPA
Fecha Creación 	:   01/08/2024

EXEC SPS_T_MaeEvaluacionDPSVidaPiuraValidarSuscripcion 42, 219, 0, '04/02/1983'

*************************************************************************************/
CREATE PROCEDURE [dbo].[SPS_T_MaeEvaluacionDPSVidaPiuraValidarSuscripcion](
	@pi_id_plan			INT,
	@pi_id_tipomoneda	INT=0,
	@pi_num_suma		DECIMAL(18,4)=0,
	@pi_nacimiento		CHAR(10)=''
)
AS
BEGIN
	SET NOCOUNT ON 
	SET DATEFORMAT DMY

    DECLARE @v_fechaActual DATETIME,
			@v_id_entidad INT=0,
			@v_id_producto INT=0,
			@v_edad INT=0,
			@v_id_detevaluaciondpsplan INT=0,
			@v_id_tipomoneda SMALLINT=0,
			@v_id_ctrlTecnico INT=0,
			@v_val_ctrlTecnicoMin DECIMAL(18,2) = 0,
			@v_val_ctrlTecnicoMax DECIMAL(18,2) = 0,
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
			@v_ind_edadminima SMALLINT=2,
			@v_ind_edadmaxima SMALLINT=2,
			@v_ind_edad SMALLINT=1,
			@v_ind_tiporesultadoimc SMALLINT=0,
			@v_ind_resultadodps SMALLINT=0

		SET @v_fechaActual = CONVERT(DATE,GETDATE(),103)	

		SELECT @v_id_entidad = N_ID_ENTIDAD, @v_id_producto = PL.N_ID_PRODUCTO
		FROM T_MAE_PLAN PL
		INNER JOIN T_MAE_PRODUCTO PR ON PL.N_ID_PRODUCTO = PR.N_ID_PRODUCTO
		WHERE PL.N_ID_PLAN = @pi_id_plan
							
		SELECT @v_edad = (0 + Convert(Char(10),@v_fechaActual,112) - Convert(Char(10),CONVERT(DATE,@pi_nacimiento,103),112)) / 10000

	    SELECT @v_id_ctrlTecnico = ISNULL(N_ID_CTRLTECNICO,0), @v_val_ctrlTecnicoMin = ISNULL(N_VAL_CTRLTECNICO,0)
	    FROM T_DET_PRODUCTOCTRLTECNICO 
		WHERE N_ID_PRODUCTO = @v_id_producto
		AND N_ID_CTRLTECNICO = 15 

	    IF @v_id_ctrlTecnico = 15 -- Edad mínima del asegurado
	        BEGIN					
				IF  @v_edad > @v_val_ctrlTecnicoMin
				BEGIN
					SET @v_ind_edadminima = 1
				END
				ELSE
				BEGIN
					SET @v_ind_edadminima = 0
				END
			END

	    SELECT @v_id_ctrlTecnico = ISNULL(N_ID_CTRLTECNICO,0), @v_val_ctrlTecnicoMax = ISNULL(N_VAL_CTRLTECNICO,0)
	    FROM T_DET_PRODUCTOCTRLTECNICO 
		WHERE N_ID_PRODUCTO = @v_id_producto
		AND N_ID_CTRLTECNICO = 16 

	    IF @v_id_ctrlTecnico = 16 -- Edad máxima del asegurado
	        BEGIN										
				IF @v_edad < @v_val_ctrlTecnicoMax
				BEGIN
					SET @v_ind_edadmaxima = 1
				END
				ELSE
				BEGIN
					SET @v_ind_edadmaxima = 0
				END
			END

		IF (@v_ind_edadminima = 0 OR @v_ind_edadmaxima = 0)
		BEGIN
			SET @v_ind_edad = 0
		END

		/*
		SELECT 
			@v_num_imcminima = N_VAL_MINIMO, 
			@v_num_imcmaxima = ISNULL(N_VAL_MAXIMO, 0),
			@v_num_imcedadminima = N_EDAD_MINIMA , 
			@v_num_imcedadmaxima = N_EDAD_MAXIMA,
			@v_val_imcrecargo = N_VAL_RECARGO, 			
			@v_ind_imcrecargo = (CASE WHEN (N_ID_TIPORESULTADO = 663 AND N_VAL_RECARGO > 0) THEN 1 ELSE 0 END),		
			@v_id_tiporesultadoimc = N_ID_TIPORESULTADO,
			@v_ind_tiporesultadoimc = (CASE WHEN N_ID_TIPORESULTADO = 663 THEN 1 ELSE 0 END)
			--@v_ind_requiereimc = (CASE WHEN N_ID_IMC IS NOT NULL THEN 1 ELSE 0 END)			
		FROM T_MAE_IMC
		WHERE N_ID_ENTIDAD = @v_id_entidad
		AND @v_val_imc BETWEEN N_VAL_MINIMO AND ISNULL(N_VAL_MAXIMO, 1000)
		AND @v_edad BETWEEN N_EDAD_MINIMA AND ISNULL(N_EDAD_MAXIMA, 1000)
		*/

		SELECT TOP 1 @v_id_detevaluaciondpsplan = DEDPS.N_ID_DETEVALUACIONDPSPLAN, @v_id_tipomoneda = DEDPS.N_ID_TIPOMONEDA, 
			@v_num_sumaminima = DEDPS.N_NUM_SUMAMIN, @v_num_sumamaxima = DEDPS.N_NUM_SUMAMAX, 
			@v_num_edadminima = DEDPS.N_NUM_EDADMIN, @v_num_edadmaxima = DEDPS.N_NUM_EDADMAX,
			@v_ind_requieredps = ISNULL(DEDPS.N_IND_REQUIEREDPS, 0), 
			@v_ind_resultadodps = (CASE WHEN ISNULL(DEDPS.N_IND_REQUIEREDPS, 0) = 0 THEN 1 ELSE 0 END), 
			@v_ind_requiereexamen = ISNULL(DEDPS.N_IND_REQUIEREEXAMEN, 0),
			@v_ind_tipoasegurado = (SELECT COUNT(TASE.N_ID_DETTIPOASEGURADOPLAN)
									FROM T_DET_TIPOASEGURADOPLAN TASE
									WHERE TASE.N_ID_PLAN = DEDPS.N_ID_PLAN
									AND TASE.N_ID_ESTADO != 9
									AND TASE.N_IND_ACTIVO = 1
									)
		FROM T_DET_EVALUACIONDPSPLAN DEDPS
		WHERE DEDPS.N_ID_PLAN = @pi_id_plan
		AND DEDPS.N_ID_TIPOMONEDA = @pi_id_tipomoneda
		--AND @pi_num_suma BETWEEN DEDPS.N_NUM_SUMAMIN AND DEDPS.N_NUM_SUMAMAX
		AND @v_edad BETWEEN DEDPS.N_NUM_EDADMIN AND DEDPS.N_NUM_EDADMAX
		AND DEDPS.N_ID_ESTADO = 8
		AND DEDPS.N_IND_ACTIVO = 1
		
		SELECT 
			@v_id_detevaluaciondpsplan AS N_ID_DETEVALUACIONDPSPLAN, 
			@v_id_tipomoneda AS N_ID_TIPOMONEDA,
			@v_num_sumaminima AS N_NUM_SUMAMINIMA, 
			@v_num_sumamaxima AS N_NUM_SUMAMAXIMA,
			@v_num_edadminima AS N_NUM_EDADMINIMA,
			@v_num_edadmaxima AS N_NUM_EDADMAXIMA,
			@v_ind_requieredps AS N_IND_REQUIEREDPS, 
			@v_ind_requiereexamen AS N_IND_REQUIEREEXAMEN,
			@v_ind_resultadodps AS N_IND_RESULTADODPS, 
			@v_ind_tipoasegurado AS N_IND_TIPOASEGURADO,
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
/****** Object:  StoredProcedure [dbo].[SPS_T_PlanCotizaSeguroVidaGrupoParticular]    Script Date: 31/03/2025 17:57:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec SPS_T_PlanCotizaSeguroVidaGrupoParticular 0, 18, '15/02/1992', 0, 0
CREATE PROCEDURE [dbo].[SPS_T_PlanCotizaSeguroVidaGrupoParticular]
(
    @pi_id_plan INT = 0,
	@pi_id_producto INT = 0,
	@pi_fec_nacimiento CHAR(10)='',
	@pi_sumaAsegurada DECIMAL(18,4) = 0,
	@pi_id_usuario VARCHAR(25) = ''
)
AS
BEGIN
/* 
225		Coberturas
226		Servicios */
DECLARE @v_id_plan INT=0,
        @v_id_perfil INT=0,
        @v_val_monto DECIMAL(18, 7),
       	@v_num_orden SMALLINT =0,
       	@v_id_operador SMALLINT =0,
       	@v_id_valor SMALLINT =0,
        @v_monto_primaneta DECIMAL(18, 9),
        @v_monto_aux DECIMAL(18, 9),
        @v_primaneta_calculada DECIMAL(18, 9),        
		@TOTALREGISTRO SMALLINT,
        @INDICE SMALLINT,
		@TOTALREGISTRO_CNCPTO SMALLINT,
        @INDICE_CNCPTO SMALLINT,
		@v_num_primaMin DECIMAL(18, 4),
        @v_num_primaMax DECIMAL(18, 4),
		@v_id_concepto INT=0,
		@v_id_tipoValor SMALLINT=0,
		@v_id_producto INT= 0, -- SEGURO MULTIPLE
		@v_codProducto VARCHAR(20)='',
		@v_valor_edad SMALLINT = 0,
		@v_indCumpleCntrol SMALLINT = 1,
		@v_totalRegistro SMALLINT = 0,
		@v_indice SMALLINT,
		@v_id_ctrlTecnico SMALLINT = 0,
		@v_val_ctrlTecnico DECIMAL(18,7),
		@WHERE NVARCHAR(4000),
		@SELECT NVARCHAR(4000)

	DECLARE @temp_id INT = 0
	
	DECLARE @T_TEMP_CONCEPTOPLAN TABLE (
		N_ID_CONCEPTOPLAN int identity(1,1),
		N_ID_PLAN int NULL,
		N_ID_CONCEPTO int NULL,
		N_VAL_MONTO DECIMAL(18, 7),
		N_NUM_ORDEN int NULL,
		N_ID_TIPOOPERADOR int NULL,
		N_ID_TIPOVALOR int NULL
	)

	DECLARE @T_MAE_CTRLTECNICO TABLE ( 
		IDREGISTRO SMALLINT IDENTITY(1,1),
		N_ID_CTRLTECNICO INT,
		N_ID_PLAN INT,
		N_VAL_CTRLTECNICO	DECIMAL(18, 2)
	)

	DECLARE @T_TEMP_COTIZACION AS TABLE (
		N_ID_TEMP_COTIZACION INT IDENTITY(1,1),
		N_ID_PLAN INT NULL,
		C_DES_LARGAPLAN VARCHAR(200) NULL,
		C_DES_CORTAPLAN VARCHAR(100) NULL,
		N_ID_PRODUCTO INT NULL,
		C_DES_PRODUCTO VARCHAR(100) NULL,
		N_ID_ENTIDAD INT NULL,
		C_NOM_ENTIDAD VARCHAR(200) NULL,
		C_ARC_LOGO VARCHAR(500) NULL,
		N_ID_TIPOVALOR SMALLINT NULL,
		N_ID_TIPOMONEDA SMALLINT NULL,
		C_DES_TIPOMONEDA VARCHAR(100) NULL,
		C_ABR_TIPOMONEDA VARCHAR(20) NULL,
		N_MONTO_PRIMANETA DECIMAL(18, 9) NULL,
		N_MONTO_PRIMABRUTA DECIMAL(18, 9) NULL,
		N_NUM_IMPORTEDESCUENTOS DECIMAL(18, 4) NULL,
		N_NUM_IMPORTERECARGADO DECIMAL(18, 4) NULL,
		N_NUM_IMPORTEDERECHOEMISION DECIMAL(18, 4) NULL,
		N_NUM_IMPORTEINTERESES DECIMAL(18, 4) NULL,
		N_NUM_IMPORTEIMPUESTO DECIMAL(18, 4) NULL,
		N_SUM_ASEGURADA DECIMAL(18, 4) NULL,
		N_NUM_PRIMAMIN DECIMAL(18, 4) NULL,
		N_NUM_PRIMAMAX DECIMAL(18, 4) NULL,
		N_IND_CUMPLECTRL SMALLINT NULL
	)

	SELECT @v_valor_edad = DATEDIFF(YEAR,CONVERT(DATETIME,@pi_fec_nacimiento,103),GETDATE())-(CASE WHEN DATEADD(YYYY,DATEDIFF(YEAR,CONVERT(DATETIME,@pi_fec_nacimiento,103),GETDATE()),CONVERT(DATETIME,@pi_fec_nacimiento,103))>GETDATE() THEN 1 ELSE 0 END)

	INSERT INTO @T_TEMP_COTIZACION
	SELECT  TPC.N_ID_PLAN,
			PLN.C_DES_LARGAPLAN,
			PLN.C_DES_CORTAPLAN,
			PLN.N_ID_PRODUCTO,
			PROD.C_DES_PRODUCTO,
			PROD.N_ID_ENTIDAD,
			ENT.C_NOM_ENTIDAD,
			dbo.FNC_T_Parametro (17, 1) + ENT.C_ARC_LOGO AS C_ARC_LOGO,				
			TPC.N_ID_TIPOVALOR,		
			PLN.N_ID_TIPOMONEDA,
			TMON.C_DES_TIPO,
			TMON.C_VAL_TEXTO,
			TPC.N_MTO_TARIFA,
			NULL,
			0,0,0,0,0,0,
			PLN.N_NUM_PRIMAMIN,
			PLN.N_NUM_PRIMAMAX,
			NULL
	FROM T_DET_TARIFAPLAN TPC WITH(NOLOCK)
	INNER JOIN T_MAE_PLAN PLN WITH(NOLOCK) ON PLN.N_ID_PLAN = TPC.N_ID_PLAN	    
	INNER JOIN T_MAE_PRODUCTO PROD WITH(NOLOCK) ON PROD.N_ID_PRODUCTO = PLN.N_ID_PRODUCTO
	INNER JOIN T_MAE_ENTIDAD ENT WITH(NOLOCK) ON ENT.N_ID_ENTIDAD = PROD.N_ID_ENTIDAD	  
	INNER JOIN T_MAE_TIPO TMON WITH(NOLOCK) ON TMON.N_ID_TIPO = PLN.N_ID_TIPOMONEDA 
	WHERE PLN.N_ID_PLAN = PLN.N_ID_PLAN
	  AND PLN.N_ID_PLAN = CASE WHEN @pi_id_plan <> '' THEN @pi_id_plan ELSE PLN.N_ID_PLAN END
	  AND PLN.N_ID_PRODUCTO = CASE WHEN @pi_id_producto <> '' THEN @pi_id_producto ELSE PLN.N_ID_PRODUCTO END
	  AND PLN.N_ID_ESTADO = 8
	  AND TPC.N_ID_ESTADO = 8
	  AND TPC.N_IND_ACTIVO = 1 
	  AND CONVERT(DATE, GETDATE(), 103) BETWEEN CONVERT(DATE, PLN.D_FEC_INIVIGENCIA, 103) AND CONVERT(DATE, ISNULL(PLN.D_FEC_FINVIGENCIA, GETDATE()), 103)


	SELECT @TOTALREGISTRO = ISNULL(COUNT(N_ID_TEMP_COTIZACION), 0) 
	FROM @T_TEMP_COTIZACION

	SET @INDICE = 1

	WHILE @INDICE <= @TOTALREGISTRO
    BEGIN 
		SET @v_id_plan                = 0
	    SET @v_monto_primaneta        = 0
		SET @v_num_primaMin           = 0
		SET @v_num_primaMax           = 0
		SET @v_id_tipoValor           = 0
		
        SELECT @v_id_plan                = N_ID_PLAN,
	          @v_monto_primaneta        = N_MONTO_PRIMANETA,
			  @v_num_primaMin           = N_NUM_PRIMAMIN,
			  @v_num_primaMax           = N_NUM_PRIMAMAX,
			  @v_id_tipoValor           = N_ID_TIPOVALOR
	    FROM @T_TEMP_COTIZACION
	    WHERE N_ID_TEMP_COTIZACION = @INDICE



		INSERT INTO @T_MAE_CTRLTECNICO
		(	
			N_ID_CTRLTECNICO, N_VAL_CTRLTECNICO, N_ID_PLAN
		)
		SELECT  N_ID_CTRLTECNICO,
				N_VAL_CTRLTECNICO,
				N_ID_PLAN
		FROM T_DET_PRODUCTOCTRLTECNICO PCT WITH(NOLOCK) INNER JOIN T_MAE_PLAN PL WITH(NOLOCK) ON PL.N_ID_PRODUCTO = PCT.N_ID_PRODUCTO
		WHERE PL.N_ID_PLAN = @v_id_plan AND PCT.N_IND_ACTIVO = 1 AND PCT.N_ID_ESTADO = 8

		SELECT @v_totalRegistro = ISNULL(COUNT(IDREGISTRO), 0) FROM @T_MAE_CTRLTECNICO

		SET @v_indice=1
		SET @v_indCumpleCntrol=1

		WHILE @v_totalRegistro > 0
		BEGIN
			SET @v_id_ctrlTecnico = 0

			SELECT TOP (1) 
				@v_id_ctrlTecnico = ISNULL(N_ID_CTRLTECNICO, 0),	
				@v_val_ctrlTecnico = ISNULL(N_VAL_CTRLTECNICO, 0)
	        FROM @T_MAE_CTRLTECNICO 

			IF @v_id_ctrlTecnico = 15 -- EDAD MINIMA
			BEGIN
				SET @v_indCumpleCntrol = CASE WHEN @v_valor_edad < @v_val_ctrlTecnico THEN 0 ELSE 1 END
			END
			ELSE IF @v_id_ctrlTecnico = 16
			BEGIN
				SET @v_indCumpleCntrol = CASE WHEN @v_valor_edad < @v_val_ctrlTecnico THEN 1 ELSE 0 END
			END
			ELSE 
			BEGIN
				SET @v_indCumpleCntrol=1
			END

			DELETE TOP (1) FROM @T_MAE_CTRLTECNICO 
			SELECT @v_totalRegistro = ISNULL(COUNT(IDREGISTRO), 0) FROM @T_MAE_CTRLTECNICO

			IF @v_indCumpleCntrol=0
			BEGIN
				BREAK
			END
		END

		DELETE FROM @T_MAE_CTRLTECNICO 
		
		UPDATE @T_TEMP_COTIZACION
		SET N_IND_CUMPLECTRL = @v_indCumpleCntrol
		WHERE N_ID_TEMP_COTIZACION=@INDICE


		IF @v_indCumpleCntrol = 1
		BEGIN

			UPDATE @T_TEMP_COTIZACION
			SET N_MONTO_PRIMANETA = 1 * N_MONTO_PRIMANETA
			WHERE N_ID_TEMP_COTIZACION=@INDICE

			IF @v_id_tipoValor = 239  -- Porcentaje
			BEGIN			
				SET @v_primaneta_calculada = ROUND((@pi_sumaAsegurada * @v_monto_primaneta/100),9)			
			END
			ELSE IF @v_id_tipoValor = 238  -- Monto
			BEGIN
				SET @v_primaneta_calculada = @v_monto_primaneta
			END
	   
			UPDATE @T_TEMP_COTIZACION
			SET N_MONTO_PRIMANETA = ROUND(@v_primaneta_calculada, 9)
			WHERE N_ID_TEMP_COTIZACION = @INDICE

			INSERT INTO @T_TEMP_CONCEPTOPLAN
			(
			 N_ID_PLAN, N_ID_CONCEPTO, N_VAL_MONTO, N_NUM_ORDEN, N_ID_TIPOOPERADOR, N_ID_TIPOVALOR
			) 
			SELECT A.N_ID_PLAN, A.N_ID_CONCEPTO, A.N_VAL_MONTO, A.N_NUM_ORDEN, B.N_ID_TIPOOPERADOR, B.N_ID_TIPOVALOR
			FROM T_DET_CONCEPTOPLAN A
			INNER JOIN T_MAE_CONCEPTO B ON A.N_ID_CONCEPTO = B.N_ID_CONCEPTO
			WHERE A.N_ID_PLAN = @v_id_plan
			AND A.N_ID_ESTADO = 1
			AND A.N_IND_ACTIVO = 1 
			ORDER BY A.N_NUM_ORDEN

			SELECT @TOTALREGISTRO_CNCPTO = ISNULL(COUNT(N_ID_CONCEPTOPLAN),0) FROM @T_TEMP_CONCEPTOPLAN

			PRINT STR(@TOTALREGISTRO_CNCPTO)
			PRINT STR(@v_id_plan)


			WHILE @TOTALREGISTRO_CNCPTO > 0
			BEGIN
				PRINT STR(@INDICE_CNCPTO)
				SET @v_id_concepto = 0
				SET @v_val_monto = 0
				SET @v_id_operador = 0
				SET @v_id_valor = 0

				PRINT STR(@temp_id)
				SELECT TOP (1)
						@v_id_concepto = N_ID_CONCEPTO,
						@v_val_monto = N_VAL_MONTO, 
						@v_id_operador = N_ID_TIPOOPERADOR, 
						@v_id_valor = N_ID_TIPOVALOR  
				FROM @T_TEMP_CONCEPTOPLAN
				--WHERE N_ID_CONCEPTOPLAN = @INDICE_CNCPTO

				PRINT STR(@temp_id)
				PRINT STR(@v_id_concepto)

				IF @v_id_valor = 238 --Monto
				BEGIN
					SET @v_primaneta_calculada = @v_primaneta_calculada + @v_val_monto
				END

				IF @v_id_valor = 239 --Porcentaje
				BEGIN
					SET @v_monto_aux = ROUND((@v_primaneta_calculada * @v_val_monto/100),9)
				
					IF @v_id_operador = 341 -- Suma
					BEGIN
						PRINT STR(@v_primaneta_calculada)
						SET @v_primaneta_calculada = @v_primaneta_calculada + @v_monto_aux
					END

					IF @v_id_operador = 342 -- Resta
					BEGIN
						SET @v_primaneta_calculada = @v_primaneta_calculada - @v_monto_aux
					END
				END
			  
				DELETE TOP (1) FROM @T_TEMP_CONCEPTOPLAN 
				SELECT @TOTALREGISTRO_CNCPTO = ISNULL(COUNT(N_ID_CONCEPTOPLAN), 0) FROM @T_TEMP_CONCEPTOPLAN
			END

			DELETE FROM @T_TEMP_CONCEPTOPLAN 

       UPDATE @T_TEMP_COTIZACION
	   SET N_MONTO_PRIMABRUTA = ROUND(@v_primaneta_calculada,2)
	   WHERE N_ID_TEMP_COTIZACION = @INDICE

		END

		
	   SET @INDICE = @INDICE + 1

	END


   SELECT * FROM @T_TEMP_COTIZACION WHERE ISNULL(N_IND_CUMPLECTRL, 0) = 1

END
GO
