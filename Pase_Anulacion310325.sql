USE [Mapfreqoa]
GO
/****** Object:  StoredProcedure [dbo].[SPU_T_MaeSusAnular]    Script Date: 31/03/2025 10:32:45 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPU_T_MaeSusAnular]
GO
/****** Object:  StoredProcedure [dbo].[SPU_T_MaePolizaAnular]    Script Date: 31/03/2025 10:32:45 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPU_T_MaePolizaAnular]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeSuscripcion_Anulacion]    Script Date: 31/03/2025 10:32:45 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_MaeSuscripcion_Anulacion]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeCertificado_Anulacion]    Script Date: 31/03/2025 10:32:45 ******/
DROP PROCEDURE IF EXISTS [dbo].[SPS_T_MaeCertificado_Anulacion]
GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeCertificado_Anulacion]    Script Date: 31/03/2025 10:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_MaeCertificado_Anulacion 3135
CREATE PROCEDURE [dbo].[SPS_T_MaeCertificado_Anulacion](  
 @pi_id_certificado INT
)  
AS  
BEGIN 
	SET LANGUAGE Spanish;
	SELECT
		CER.N_ID_POLIZA  
		,POL.C_NUM_POLIZA  
		,CER.N_ID_CERTIFICADO
		,CER.C_NUM_CERTIFICADO
		,ENTI.N_ID_ENTIDAD  
		,ENTI.C_NOM_ENTIDAD  
		,PLA.N_ID_RAMO  
		,PLA.N_ID_PRODUCTO  
		,UPPER(PRO.C_DES_PRODUCTO) AS DESC_PRODUCTO  
		,PRO.C_COD_PRODUCTO  
		,PRO.N_IND_ANULACION  
		,PRO.N_IND_CAMBIO  
		,PRO.N_IND_CANCELACION  
		,PLA.N_ID_PLAN  
		,PLA.C_COD_PLAN  
		,CONVERT(VARCHAR(10), CER.D_FEC_ANULACION, 103) AS FECHA_ANULACION
		,CER.C_NUM_SOLICITUD 
		,'Lima ' + RIGHT('0' + CAST(DAY(CER.D_FEC_ANULACION) AS VARCHAR(2)), 2) + ' de ' + DATENAME(MONTH, CER.D_FEC_ANULACION) + ' del ' + 
		CAST(YEAR(CER.D_FEC_ANULACION) AS VARCHAR(4)) AS ANULACION_FECHA,
		ISNULL(TER.C_NOM_COMPLETO,'''') AS C_NOM_COMPLETO_ASEGURADO
   FROM T_MAE_CERTIFICADO CER  
    INNER JOIN T_MAE_POLIZA POL ON POL.N_ID_POLIZA = CER.N_ID_POLIZA  
	INNER JOIN T_MAE_PLAN AS PLA ON PLA.N_ID_PLAN = POL.N_ID_PLAN  
	INNER JOIN T_MAE_PRODUCTO AS PRO ON PRO.N_ID_PRODUCTO = PLA.N_ID_PRODUCTO  
	INNER JOIN T_MAE_ENTIDAD ENTI ON ENTI.N_ID_ENTIDAD=PRO.N_ID_ENTIDAD
	INNER JOIN T_DET_ROLTERCEROCERTIFICADO RTA ON RTA.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO AND RTA.N_ID_TIPOROLTERCERO = 365 AND RTA.N_ID_ESTADO = 8 AND RTA.N_IND_ACTIVO = 1
	INNER JOIN T_MAE_TERCERO TER ON RTA.N_ID_TERCERO = TER.N_ID_TERCERO 
	WHERE CER.N_ID_CERTIFICADO=@pi_id_certificado
END  

GO
/****** Object:  StoredProcedure [dbo].[SPS_T_MaeSuscripcion_Anulacion]    Script Date: 31/03/2025 10:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC SPS_T_MaeSuscripcion_Anulacion 5599
CREATE PROCEDURE [dbo].[SPS_T_MaeSuscripcion_Anulacion](  
 @pi_id_suscripcion varchar (20) =  '' 
)  
AS  
BEGIN 
	SET LANGUAGE Spanish;
	SELECT
		CER.N_ID_POLIZA  
		,POL.C_NUM_POLIZA  
		,CER.N_ID_CERTIFICADO
		,CER.C_NUM_CERTIFICADO
		,ENTI.N_ID_ENTIDAD  
		,ENTI.C_NOM_ENTIDAD  
		,PLA.N_ID_RAMO  
		,PLA.N_ID_PRODUCTO  
		,UPPER(PRO.C_DES_PRODUCTO) AS DESC_PRODUCTO  
		,PRO.C_COD_PRODUCTO  
		,PRO.N_IND_ANULACION  
		,PRO.N_IND_CAMBIO  
		,PRO.N_IND_CANCELACION  
		,PLA.N_ID_PLAN  
		,PLA.C_COD_PLAN  
		,CONVERT(VARCHAR(10), CER.D_FEC_ANULACION, 103) AS FECHA_ANULACION
		,CER.C_NUM_SOLICITUD 
		,'Lima ' + RIGHT('0' + CAST(DAY(CER.D_FEC_ANULACION) AS VARCHAR(2)), 2) + ' de ' + DATENAME(MONTH, CER.D_FEC_ANULACION) + ' del ' + 
		CAST(YEAR(CER.D_FEC_ANULACION) AS VARCHAR(4)) AS ANULACION_FECHA,
		ISNULL(TER.C_NOM_COMPLETO,'''') AS C_NOM_COMPLETO_ASEGURADO
   FROM T_MAE_SUSCRIPCION SUS  
   INNER JOIN T_MAE_CERTIFICADO CER ON SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
    INNER JOIN T_MAE_POLIZA POL ON POL.N_ID_POLIZA = CER.N_ID_POLIZA  
	INNER JOIN T_MAE_PLAN AS PLA ON PLA.N_ID_PLAN = POL.N_ID_PLAN  
	INNER JOIN T_MAE_PRODUCTO AS PRO ON PRO.N_ID_PRODUCTO = PLA.N_ID_PRODUCTO  
	INNER JOIN T_MAE_ENTIDAD ENTI ON ENTI.N_ID_ENTIDAD=PRO.N_ID_ENTIDAD
	INNER JOIN T_DET_ROLTERCEROCERTIFICADO RTA ON RTA.N_ID_CERTIFICADO = CER.N_ID_CERTIFICADO AND RTA.N_ID_TIPOROLTERCERO = 365 AND RTA.N_ID_ESTADO = 8 AND RTA.N_IND_ACTIVO = 1
	INNER JOIN T_MAE_TERCERO TER ON RTA.N_ID_TERCERO = TER.N_ID_TERCERO 
	WHERE SUS.N_ID_SUSCRIPCION=@pi_id_suscripcion
END  
GO
/****** Object:  StoredProcedure [dbo].[SPU_T_MaePolizaAnular]    Script Date: 31/03/2025 10:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	General
Objetivo 		:	Actualizar el estado a la Póliza
Elaborado por	:	P & P BMS
Fecha Creación 	:   01/06/2018

Test:
EXEC [SPU_T_MaePolizaEstado] 4,99,15,1,'','admin'

BEGIN TRANSACION
EXEC [SPU_T_MaePolizaEstado] 44,44,0,17,1,NULL,'admin'
ROLLBACK
BEGIN TRANSACION
EXEC [SPU_T_MaePolizaAnular] 'PLATFORM','10','0000001569',25,'nueva','02/05/2022','admin',4
ROLLBACK
exec SPU_T_MaePolizaAnular @pi_apiLlamada='PLATFORM',@pi_cod_producto='',@pi_id_certificado='709',@pi_num_certificado='',@pi_id_tipoMotivo=24,@pi_val_motivo='Emision de Prueba',@pi_fec_anulacion='08/11/2024',@pi_cod_usuModif='admin',@pi_id_estado=25,@pi_num_importeDevolver=0
**************************************************************************************************/
CREATE PROCEDURE [dbo].[SPU_T_MaePolizaAnular](
	@pi_apiLlamada VARCHAR(15)='',
	@pi_cod_producto VARCHAR(20)='',
	@pi_id_certificado INT=0,
	@pi_num_certificado VARCHAR(20)='',
	@pi_id_tipoMotivo int=0,
	@pi_val_motivo VARCHAR(150)='',	
	@pi_fec_anulacion VARCHAR(10)='',	
	@pi_cod_usuModif VARCHAR (25),
	@pi_id_estado smallint=0,
	@pi_num_importeDevolver DECIMAL(18,8)=0,
	@pi_apiCancela INT=0
)
AS
BEGIN
	SET NOCOUNT ON
	SET DATEFORMAT DMY

	
	BEGIN TRY
		Declare @v_CodError	SMALLINT =0,	
				--@pi_id_estado int=0,
				@v_Mensaje VARCHAR(200)=''
		DECLARE @v_fec_modificacion DATETIME
		DECLARE @v_id_perAnulacion					INT=2 --POR DEFINIR
		DECLARE @v_fec_actual DATE
		DECLARE @v_num_secpoliza INT
		DECLARE @v_id_estado SMALLINT
		DECLARE @v_id_cotizacion INT

		DECLARE @v_id_estadoPoliza SMALLINT,
				@v_id_certificado INT,
				@v_id_poliza INT,
				@v_id_suscripcion INT, ---08--11--24 
				@v_des_estado VARCHAR(100),
				@v_fec_anulacion date,	
				@v_id_tipomoneda SMALLINT=0
		DECLARE @v_id_tipoMovimiento SMALLINT=0, 
				@v_desc_movimiento VARCHAR(50)=''
		DECLARE @v_id_secuencia int
		DECLARE @v_num_anulacion VARCHAR (30)
		DECLARE @v_val_secuencial INT
		DECLARE @v_val_producto_id	SMALLINT

		DECLARE @flagPolHibrido int
		DECLARE @idPolizaHibrido VARCHAR(20) = ''

		SET @v_fec_modificacion = GETDATE()		
		SET @v_fec_actual  = GETDATE()		
			SET @v_Mensaje=''
	
	IF @pi_apiLlamada='WEBAPI'
	BEGIN

		SELECT	@v_id_certificado		=		N_ID_CERTIFICADO,	
				@v_id_poliza			=		CER.N_ID_POLIZA,
				@v_id_suscripcion       =       CER.N_ID_SUSCRIPCION, ---08-11-24 
				@v_id_estadoPoliza		=		CER.N_ID_ESTADO	,
				@v_des_estado			=		EST.C_DES_ESTADO,
				@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
				@flagPolHibrido			=		SUS.POL_HIBRIDO,
				@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
		FROM T_MAE_CERTIFICADO CER
		INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
		INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
		INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
		INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
		INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		WHERE CER.C_NUM_CERTIFICADO		=	@pi_num_certificado
			--AND PROD.C_COD_PRODUCTOWS	=	@pi_cod_producto
			AND CER.N_IND_ACTIVO	=	1

		IF ISNULL(@v_id_certificado,0)=0
		BEGIN
	
			SET @v_CodError=1
			SET @v_Mensaje	= @v_Mensaje + ' * El número de certificado no existe'
			--SELECT @v_Mensaje
		END
	
		IF ISNULL(@v_id_estadoPoliza,0)>0
		BEGIN		
			IF ISNULL(@v_id_estadoPoliza,0)!=1
			BEGIN 
				SET @v_CodError	=	1
				SET @v_Mensaje	= @v_Mensaje +' * No puede anular la póliza en el estado actual ' + @v_des_estado
			END
		END
		SET @v_fec_anulacion=CONVERT(date, CONVERT(date, @pi_fec_anulacion), 103)

	END
	ELSE IF @pi_apiLlamada='PLATFORM'
	BEGIN
	
		SET @v_id_perAnulacion=0

		SELECT @v_id_perAnulacion=N_ID_PERSONA 
		FROM T_MAE_USUARIO 
		WHERE N_ID_ESTADO=8 
		AND N_IND_ACTIVO=1 
		AND UPPER(C_COD_USUARIO)=UPPER(@pi_cod_usuModif)

		IF @pi_cod_producto IN ('16')
		BEGIN
			SET @pi_num_certificado	=	''
		END

		IF ISNULL(@pi_id_certificado ,0) != 0
		BEGIN
			SELECT
						@v_id_poliza			=		CER.N_ID_POLIZA,
						@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
						@v_des_estado			=		EST.C_DES_ESTADO,
						@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
						@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
						@flagPolHibrido        =		SUS.POL_HIBRIDO,
						@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
			FROM T_MAE_CERTIFICADO CER
			INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
			INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
			INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
			INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
			INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
			WHERE CER.N_ID_CERTIFICADO		=	@pi_id_certificado
			AND CER.N_IND_ACTIVO	=	1

			SET @v_id_certificado	=	@pi_id_certificado
		END
		ELSE
		BEGIN
			IF ISNULL(@pi_num_certificado,'')!='' and  ISNULL(@pi_num_certificado,'')!='0' -- para cuando no envía número de certificado.
			BEGIN
				PRINT '1'
					SELECT	@v_id_certificado		=		N_ID_CERTIFICADO,	
							@v_id_poliza			=		CER.N_ID_POLIZA,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
							@flagPolHibrido         =	    SUS.POL_HIBRIDO,
							@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE CER.C_NUM_CERTIFICADO		=	@pi_num_certificado
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1
			END
			ELSE
			BEGIN
				PRINT '2'
				SELECT
							@v_id_poliza			=		CER.N_ID_POLIZA,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
								@flagPolHibrido =				SUS.POL_HIBRIDO,
								@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE CER.N_ID_CERTIFICADO		=	@pi_id_certificado
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1

					--08-11-2024 
				PRINT '3'
				SELECT
							@v_id_suscripcion			=	CER.N_ID_SUSCRIPCION,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
							@flagPolHibrido =				SUS.POL_HIBRIDO,
							@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		 ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS ON     CER.N_ID_SUSCRIPCION= SUS.N_ID_SUSCRIPCION
				INNER JOIN T_MAE_PLAN PLN		 ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	 ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		 ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				WHERE CER.N_ID_CERTIFICADO		=	@pi_id_certificado
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1
				
				SET @v_id_certificado	=	@pi_id_certificado
			END
		END

		if @pi_fec_anulacion!=''
		begin
			SET @v_fec_anulacion=CONVERT(DATE, @pi_fec_anulacion, 103)		
		END
		ELSE
			SET @v_fec_anulacion=CONVERT(DATE, GETDATE(), 103)	
	END
	IF CAST(@v_fec_actual AS DATE) < CAST(@v_fec_anulacion AS DATE)
	BEGIN
		SET @v_CodError=1
		SET @v_Mensaje	= @v_Mensaje +	' * La fecha de anulación no puede ser mayor a la fecha actual'
	END
	IF @v_CodError=0
	BEGIN
		IF @pi_apiLlamada='WEBAPI'
		BEGIN

			--PRINT 'ACTUALIZADO'
			SET @v_id_estado=18

			UPDATE T_MAE_CERTIFICADO
			SET 			
				D_FEC_ANULACION=@v_fec_anulacion,
				N_ID_PERANULACION=@v_id_perAnulacion,
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_CERTIFICADO = @v_id_certificado	  
		
			UPDATE T_MAE_POLIZA
			SET 
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_POLIZA = @v_id_poliza	
			
			SET @v_id_tipoMovimiento =570
			SET	@v_desc_movimiento ='Rechazo del Certificado'

			EXEC SPI_T_BitacoraCertificado @v_id_certificado,@v_id_tipoMovimiento,@v_desc_movimiento, @pi_id_tipoMotivo, @v_id_estado, '', @pi_cod_usuModif		

			--EXEC SPI_T_MovCertificado @v_id_certificado, @pi_id_tipoMotivo, @v_id_estado, @pi_val_motivo, @pi_cod_usuModif
		END
		ELSE IF @pi_apiLlamada='PLATFORM'
		BEGIN

				SELECT @v_id_secuencia = ISNULL(MAX(N_ID_SECUENCIA), 0)+1 
				FROM T_DET_BITACORA_CERTIFICADO
				WHERE N_ID_CERTIFICADO = @v_id_certificado



			SET @v_id_estado=@pi_id_estado

			IF @flagPolHibrido = 1   AND @idPolizaHibrido <> ''
			BEGIN 

			DECLARE @CERTIFICADOS TABLE (N_ID_CERTIFICADO INT);

			INSERT INTO @CERTIFICADOS (N_ID_CERTIFICADO)
				SELECT CER.N_ID_CERTIFICADO
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido;


				UPDATE POL
				SET N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido

				UPDATE CER 
				SET 
				 D_FEC_ANULACION = @v_fec_anulacion,
                N_ID_PERANULACION = @v_id_perAnulacion,
                N_ID_ESTADO = @v_id_estado,
                C_COD_USUMODIF = @pi_cod_usuModif,
                D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK) 
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido


				UPDATE SUS
				SET 
				N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				WHERE ID_POL_HIBRIDO = @idPolizaHibrido

				DECLARE @N_ID_CERTIFICADO INT;
				DECLARE @NewSecuencia INT;

				-- Cursor para iterar sobre los certificados
				DECLARE cert_cursor CURSOR FOR
				SELECT DISTINCT CER.N_ID_CERTIFICADO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido;
				
				OPEN cert_cursor;
				FETCH NEXT FROM cert_cursor INTO @N_ID_CERTIFICADO;
				
				-- Iterar sobre cada certificado
				WHILE @@FETCH_STATUS = 0
				BEGIN
				    -- Obtener el último valor de secuencia para este certificado
				    SELECT @NewSecuencia = ISNULL(MAX(N_ID_SECUENCIA), 0) + 1
				    FROM T_DET_BITACORA_CERTIFICADO
				    WHERE N_ID_CERTIFICADO = @N_ID_CERTIFICADO;
				
				    -- Insertar en la bitácora para este certificado
				    INSERT INTO T_DET_BITACORA_CERTIFICADO (
				        N_ID_CERTIFICADO, N_ID_SECUENCIA, N_ID_MOTIVO, N_ID_MOVESTADO, 
				        N_ID_TIPOMONEDA, N_NUM_VALORCOMERCIAL, N_NUM_PRIMANETA, N_NUM_PRIMABRUTA, 
				        C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, C_COD_USUCREACION, D_FEC_CREACION
				    )
				    SELECT 
				        CER.N_ID_CERTIFICADO,
				        @NewSecuencia,
				        @pi_id_tipoMotivo,
				        @pi_id_estado,
				        CER.N_ID_TIPOMONEDA,
				        0,
				        @pi_num_importeDevolver,
				        0,
				        @pi_val_motivo,
				        1,
				        1, 
				        @pi_cod_usuModif,
				        GETDATE()
				    FROM T_MAE_CERTIFICADO CER
				    INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				    WHERE CER.N_ID_CERTIFICADO = @N_ID_CERTIFICADO;
				
				    -- Obtener el siguiente certificado
				    FETCH NEXT FROM cert_cursor INTO @N_ID_CERTIFICADO;
				END
				
				-- Cerrar y liberar el cursor
				CLOSE cert_cursor;
				DEALLOCATE cert_cursor;
			END 
			ELSE 
			BEGIN 

			UPDATE T_MAE_CERTIFICADO
			SET 			
				D_FEC_ANULACION=@v_fec_anulacion,
				N_ID_PERANULACION=@v_id_perAnulacion,
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_CERTIFICADO = @v_id_certificado	 


			UPDATE T_MAE_POLIZA
			SET 
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_POLIZA = @v_id_poliza	 

			print 'sussss'
			UPDATE SUS
			SET N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
			INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON SUS.N_ID_SUSCRIPCION = CER.N_ID_SUSCRIPCION
			WHERE CER.N_ID_CERTIFICADO = @pi_id_certificado

				INSERT INTO T_DET_BITACORA_CERTIFICADO
				(
					N_ID_CERTIFICADO,				N_ID_SECUENCIA,				N_ID_MOTIVO,		N_ID_MOVESTADO,
					N_ID_TIPOMONEDA,				N_NUM_VALORCOMERCIAL,		N_NUM_PRIMABRUTA,	N_NUM_PRIMANETA,
					C_OBS_DESCRIPTIVO,				N_IND_ACTIVO,				N_ID_ESTADO, 		C_COD_USUCREACION, 
					D_FEC_CREACION
				)
				VALUES
				(
					@v_id_certificado,				@v_id_secuencia,			@pi_id_tipoMotivo,			@pi_id_estado,
					@v_id_tipomoneda,				0,							@pi_num_importeDevolver,	0,
					@pi_val_motivo,					1,							1,							@pi_cod_usuModif,
					getdate()
				)

			END 

			PRINT 'SUS 1 '
			IF @pi_id_estado=4
			BEGIN
				SET @v_id_tipoMovimiento =566 -- CANCELADO
				SET	@v_desc_movimiento ='Cancelación del Certificado'
				PRINT '---'
				PRINT @v_id_certificado
				PRINT @v_id_suscripcion
				
				--INSERT INTO T_DET_BITACORA_CERTIFICADO
				--(
				--	N_ID_CERTIFICADO,				N_ID_SECUENCIA,				N_ID_MOTIVO,		N_ID_MOVESTADO,
				--	N_ID_TIPOMONEDA,				N_NUM_VALORCOMERCIAL,		N_NUM_PRIMABRUTA,	N_NUM_PRIMANETA,
				--	C_OBS_DESCRIPTIVO,				N_IND_ACTIVO,				N_ID_ESTADO, 		C_COD_USUCREACION, 
				--	D_FEC_CREACION
				--)
				--VALUES
				--(
				--	@v_id_certificado,				@v_id_secuencia,			@pi_id_tipoMotivo,			@pi_id_estado,
				--	@v_id_tipomoneda,				0,							@pi_num_importeDevolver,	0,
				--	@pi_val_motivo,					1,							1,							@pi_cod_usuModif,
				--	getdate()
				--)
			
			END
			ELSE 
			BEGIN
				IF @pi_id_estado=18
				BEGIN
					SET @v_id_tipoMovimiento =570
					SET	@v_desc_movimiento ='Rechazo del Certificado'

			
					EXEC SPI_T_BitacoraCertificado @v_id_certificado,@v_id_tipoMovimiento,@v_desc_movimiento, @pi_id_tipoMotivo, @v_id_estado, '', @pi_cod_usuModif		
				END
			END
		END	
	END			   
	
	IF @pi_apiCancela=0
		SELECT	@v_CodError	 AS COD_ERROR,
			LTRIM(RTRIM(@v_Mensaje)) AS MENSAJE
END TRY

BEGIN CATCH

	DECLARE @ERROR VARCHAR(2000)
	DECLARE @Linea VARCHAR(2000)
	set @ERROR=ERROR_MESSAGE()
	set @Linea=ERROR_LINE()
	Set @ERROR=@ERROR+''+@Linea

	IF @pi_apiCancela=0
		SELECT		1	 AS COD_ERROR,
			@ERROR AS MENSAJE

	EXEC SPI_T_MaeLog 'SPU_T_MaePolizaEstado',0, @ERROR, @pi_cod_usuModif

END CATCH

END
GO
/****** Object:  StoredProcedure [dbo].[SPU_T_MaeSusAnular]    Script Date: 31/03/2025 10:32:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**************************************************************************************************
Sistema 		:	SISTEMA INTEGRADO DE SEGUROS - GLOBALTPA
Módulo 			:	General
Objetivo 		:	Actualizar el estado a la Póliza
Elaborado por	:	P & P BMS
Fecha Creación 	:   01/06/2018

Test:
EXEC [SPU_T_MaePolizaEstado] 4,99,15,1,'','admin'

BEGIN TRANSACION
EXEC [SPU_T_MaePolizaEstado] 44,44,0,17,1,NULL,'admin'
ROLLBACK
BEGIN TRANSACION
EXEC [SPU_T_MaePolizaAnular] 'PLATFORM','10','0000001569',25,'nueva','02/05/2022','admin',4
ROLLBACK
exec SPU_T_MaePolizaAnular @pi_apiLlamada='PLATFORM',@pi_cod_producto='',@pi_id_certificado='709',@pi_num_certificado='',@pi_id_tipoMotivo=24,@pi_val_motivo='Emision de Prueba',@pi_fec_anulacion='08/11/2024',@pi_cod_usuModif='admin',@pi_id_estado=25,@pi_num_importeDevolver=0
**************************************************************************************************/
CREATE PROCEDURE [dbo].[SPU_T_MaeSusAnular](
	@pi_apiLlamada VARCHAR(15)='',
	@pi_cod_producto VARCHAR(20)='',
	@pi_id_suscripcion INT=0,
	@pi_num_certificado VARCHAR(20)='',
	@pi_id_tipoMotivo int=0,
	@pi_val_motivo VARCHAR(150)='',	
	@pi_fec_anulacion VARCHAR(10)='',	
	@pi_cod_usuModif VARCHAR (25),
	@pi_id_estado smallint=0,
	@pi_num_importeDevolver DECIMAL(18,8)=0,
	@pi_apiCancela INT=0
)
AS
BEGIN
	SET NOCOUNT ON
	SET DATEFORMAT DMY

	
	BEGIN TRY
		Declare @v_CodError	SMALLINT =0,	
				--@pi_id_estado int=0,
				@v_Mensaje VARCHAR(200)=''
		DECLARE @v_fec_modificacion DATETIME
		DECLARE @v_id_perAnulacion					INT=2 --POR DEFINIR
		DECLARE @v_fec_actual DATE
		DECLARE @v_num_secpoliza INT
		DECLARE @v_id_estado SMALLINT
		DECLARE @v_id_cotizacion INT

		DECLARE @v_id_estadoPoliza SMALLINT,
				@v_id_certificado INT,
				@v_id_poliza INT,
				@v_id_suscripcion INT, ---08--11--24 
				@v_des_estado VARCHAR(100),
				@v_fec_anulacion date,	
				@v_id_tipomoneda SMALLINT=0
		DECLARE @v_id_tipoMovimiento SMALLINT=0, 
				@v_desc_movimiento VARCHAR(50)=''
		DECLARE @v_id_secuencia int
		DECLARE @v_num_anulacion VARCHAR (30)
		DECLARE @v_val_secuencial INT
		DECLARE @v_val_producto_id	SMALLINT

		DECLARE @flagPolHibrido int
		DECLARE @idPolizaHibrido VARCHAR(20) = ''

		SET @v_fec_modificacion = GETDATE()		
		SET @v_fec_actual  = GETDATE()		
			SET @v_Mensaje=''
	
	IF @pi_apiLlamada='WEBAPI'
	BEGIN

		SELECT	@v_id_certificado		=		N_ID_CERTIFICADO,	
				@v_id_poliza			=		CER.N_ID_POLIZA,
				@v_id_suscripcion       =       CER.N_ID_SUSCRIPCION, ---08-11-24 
				@v_id_estadoPoliza		=		CER.N_ID_ESTADO	,
				@v_des_estado			=		EST.C_DES_ESTADO,
				@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
				@flagPolHibrido         =		SUS.POL_HIBRIDO,
				@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
		FROM T_MAE_CERTIFICADO CER
		INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
		INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
		INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
		INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
		INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
		WHERE CER.C_NUM_CERTIFICADO		=	@pi_num_certificado
			--AND PROD.C_COD_PRODUCTOWS	=	@pi_cod_producto
			AND CER.N_IND_ACTIVO	=	1

		IF ISNULL(@v_id_certificado,0)=0
		BEGIN
	
			SET @v_CodError=1
			SET @v_Mensaje	= @v_Mensaje + ' * El número de certificado no existe'
			--SELECT @v_Mensaje
		END
	
		IF ISNULL(@v_id_estadoPoliza,0)>0
		BEGIN		
			IF ISNULL(@v_id_estadoPoliza,0)!=1
			BEGIN 
				SET @v_CodError	=	1
				SET @v_Mensaje	= @v_Mensaje +' * No puede anular la póliza en el estado actual ' + @v_des_estado
			END
		END
		SET @v_fec_anulacion=CONVERT(date, CONVERT(date, @pi_fec_anulacion), 103)

	END
	ELSE IF @pi_apiLlamada='PLATFORM'
	BEGIN
	
		SET @v_id_perAnulacion=0

		SELECT @v_id_perAnulacion=N_ID_PERSONA 
		FROM T_MAE_USUARIO 
		WHERE N_ID_ESTADO=8 
		AND N_IND_ACTIVO=1 
		AND UPPER(C_COD_USUARIO)=UPPER(@pi_cod_usuModif)

		IF @pi_cod_producto IN ('16')
		BEGIN
			SET @pi_num_certificado	=	''
		END

		IF ISNULL(@pi_id_suscripcion ,0) != 0
		BEGIN
			SELECT
						@v_id_poliza			=		CER.N_ID_POLIZA,
						@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
						@v_des_estado			=		EST.C_DES_ESTADO,
						@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
						@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
						@flagPolHibrido =				SUS.POL_HIBRIDO,
						@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
			FROM T_MAE_CERTIFICADO CER
			INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
			INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
			INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
			INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
			INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
			WHERE CER.N_ID_SUSCRIPCION		=	@pi_id_suscripcion
			AND CER.N_IND_ACTIVO	=	1

			SET @v_id_certificado	=	@pi_id_suscripcion
		END
		ELSE
		BEGIN
			IF ISNULL(@pi_num_certificado,'')!='' and  ISNULL(@pi_num_certificado,'')!='0' -- para cuando no envía número de certificado.
			BEGIN
				PRINT '1'
					SELECT	@v_id_certificado		=		N_ID_CERTIFICADO,	
							@v_id_poliza			=		CER.N_ID_POLIZA,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
							@flagPolHibrido =				SUS.POL_HIBRIDO,
							@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE CER.C_NUM_CERTIFICADO		=	@pi_num_certificado
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1
			END
			ELSE
			BEGIN
				PRINT '2'
				SELECT
							@v_id_poliza			=		CER.N_ID_POLIZA,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
							@flagPolHibrido =				SUS.POL_HIBRIDO,
							@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_PLAN PLN		ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE CER.N_ID_CERTIFICADO		=	@pi_id_suscripcion
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1

					--08-11-2024 
				PRINT '3'
				SELECT
							@v_id_suscripcion			=	CER.N_ID_SUSCRIPCION,
							@v_id_estadoPoliza		=		CER.N_ID_ESTADO,
							@v_des_estado			=		EST.C_DES_ESTADO,
							@v_id_tipomoneda		=		POL.N_ID_TIPOMONEDA,
							@v_val_producto_id		=		PLN.N_ID_PRODUCTO,
							@flagPolHibrido =				SUS.POL_HIBRIDO,
							@idPolizaHibrido		=       SUS.ID_POL_HIBRIDO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_POLIZA POL		 ON		CER.N_ID_POLIZA=POL.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS ON     CER.N_ID_SUSCRIPCION= SUS.N_ID_SUSCRIPCION
				INNER JOIN T_MAE_PLAN PLN		 ON		POL.N_ID_PLAN=PLN.N_ID_PLAN
				INNER JOIN T_MAE_PRODUCTO PROD	 ON		PROD.N_ID_PRODUCTO=PLN.N_ID_PRODUCTO
				INNER JOIN T_MAE_ESTADO EST		 ON		EST.N_ID_ESTADO=CER.N_ID_ESTADO
				WHERE CER.N_ID_CERTIFICADO		=	@pi_id_suscripcion
					AND PROD.C_COD_PRODUCTO		=	@pi_cod_producto
					AND CER.N_IND_ACTIVO	=	1
				
				SET @v_id_certificado	=	@pi_id_suscripcion
			END
		END

		if @pi_fec_anulacion!=''
		begin
			SET @v_fec_anulacion=CONVERT(DATE, @pi_fec_anulacion, 103)		
		END
		ELSE
			SET @v_fec_anulacion=CONVERT(DATE, GETDATE(), 103)	
	END
	IF CAST(@v_fec_actual AS DATE) < CAST(@v_fec_anulacion AS DATE)
	BEGIN
		SET @v_CodError=1
		SET @v_Mensaje	= @v_Mensaje +	' * La fecha de anulación no puede ser mayor a la fecha actual'
	END
	IF @v_CodError=0
	BEGIN
		IF @pi_apiLlamada='WEBAPI'
		BEGIN

			--PRINT 'ACTUALIZADO'
			SET @v_id_estado=18

			UPDATE T_MAE_CERTIFICADO
			SET 			
				D_FEC_ANULACION=@v_fec_anulacion,
				N_ID_PERANULACION=@v_id_perAnulacion,
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_CERTIFICADO = @v_id_certificado	  
		
			UPDATE T_MAE_POLIZA
			SET 
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
			WHERE N_ID_POLIZA = @v_id_poliza	
			
			SET @v_id_tipoMovimiento =570
			SET	@v_desc_movimiento ='Rechazo del Certificado'

			EXEC SPI_T_BitacoraCertificado @v_id_certificado,@v_id_tipoMovimiento,@v_desc_movimiento, @pi_id_tipoMotivo, @v_id_estado, '', @pi_cod_usuModif		

			--EXEC SPI_T_MovCertificado @v_id_certificado, @pi_id_tipoMotivo, @v_id_estado, @pi_val_motivo, @pi_cod_usuModif
		END
		ELSE IF @pi_apiLlamada='PLATFORM'
		BEGIN

				SELECT @v_id_secuencia = ISNULL(MAX(N_ID_SECUENCIA), 0)+1 
				FROM T_DET_BITACORA_CERTIFICADO
				WHERE N_ID_CERTIFICADO = @v_id_certificado

			SET @v_id_estado=@pi_id_estado

			IF @flagPolHibrido = 1  AND @idPolizaHibrido <> ''
			BEGIN 

			DECLARE @CERTIFICADOS TABLE (N_ID_CERTIFICADO INT);
			INSERT INTO @CERTIFICADOS (N_ID_CERTIFICADO)
				SELECT CER.N_ID_CERTIFICADO
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido;

				UPDATE POL
				SET N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido

				UPDATE CER 
				SET 
				 D_FEC_ANULACION = @v_fec_anulacion,
                N_ID_PERANULACION = @v_id_perAnulacion,
                N_ID_ESTADO = @v_id_estado,
                C_COD_USUMODIF = @pi_cod_usuModif,
                D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK) 
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.ID_POL_HIBRIDO=@idPolizaHibrido


				UPDATE SUS
				SET 
				N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				WHERE ID_POL_HIBRIDO = @idPolizaHibrido

			 --UPDATE CER
    --        SET 
    --            D_FEC_ANULACION = @v_fec_anulacion,
    --            N_ID_PERANULACION = @v_id_perAnulacion,
    --            N_ID_ESTADO = @v_id_estado,
    --            C_COD_USUMODIF = @pi_cod_usuModif,
    --            D_FEC_MODIFICACION = @v_fec_modificacion
    --        FROM T_MAE_CERTIFICADO CER
    --        INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
    --        WHERE SUS.POL_HIBRIDO = @flagPolHibrido



			 --   UPDATE T_MAE_POLIZA
				--SET N_ID_ESTADO = @v_id_estado,
				--C_COD_USUMODIF = @pi_cod_usuModif,
				--D_FEC_MODIFICACION = @v_fec_modificacion
				--FROM T_MAE_POLIZA POL WITH(NOLOCK)
				--INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				--INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION AND SUS.POL_HIBRIDO=@flagPolHibrido

				--	UPDATE SUS
				--SET N_ID_ESTADO = @v_id_estado,
				--C_COD_USUMODIF = @pi_cod_usuModif,
				--D_FEC_MODIFICACION = @v_fec_modificacion
				--FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				--WHERE POL_HIBRIDO = @flagPolHibrido

			DECLARE @N_ID_CERTIFICADO INT;
				DECLARE @NewSecuencia INT;

				-- Cursor para iterar sobre los certificados
				DECLARE cert_cursor CURSOR FOR
				SELECT DISTINCT CER.N_ID_CERTIFICADO
				FROM T_MAE_CERTIFICADO CER
				INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				WHERE SUS.ID_POL_HIBRIDO = @idPolizaHibrido;
				
				OPEN cert_cursor;
				FETCH NEXT FROM cert_cursor INTO @N_ID_CERTIFICADO;
				
				-- Iterar sobre cada certificado
				WHILE @@FETCH_STATUS = 0
				BEGIN
				    -- Obtener el último valor de secuencia para este certificado
				    SELECT @NewSecuencia = ISNULL(MAX(N_ID_SECUENCIA), 0) + 1
				    FROM T_DET_BITACORA_CERTIFICADO
				    WHERE N_ID_CERTIFICADO = @N_ID_CERTIFICADO;
				
				    -- Insertar en la bitácora para este certificado
				    INSERT INTO T_DET_BITACORA_CERTIFICADO (
				        N_ID_CERTIFICADO, N_ID_SECUENCIA, N_ID_MOTIVO, N_ID_MOVESTADO, 
				        N_ID_TIPOMONEDA, N_NUM_VALORCOMERCIAL, N_NUM_PRIMANETA, N_NUM_PRIMABRUTA, 
				        C_OBS_DESCRIPTIVO, N_IND_ACTIVO, N_ID_ESTADO, C_COD_USUCREACION, D_FEC_CREACION
				    )
				    SELECT 
				        CER.N_ID_CERTIFICADO,
				        @NewSecuencia,
				        @pi_id_tipoMotivo,
				        @pi_id_estado,
				        CER.N_ID_TIPOMONEDA,
				        0,
				        @pi_num_importeDevolver,
				        0,
				        @pi_val_motivo,
				        1,
				        1, 
				        @pi_cod_usuModif,
				        GETDATE()
				    FROM T_MAE_CERTIFICADO CER
				    INNER JOIN T_MAE_SUSCRIPCION SUS ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
				    WHERE CER.N_ID_CERTIFICADO = @N_ID_CERTIFICADO;
				
				    -- Obtener el siguiente certificado
				    FETCH NEXT FROM cert_cursor INTO @N_ID_CERTIFICADO;
				END
				
				-- Cerrar y liberar el cursor
				CLOSE cert_cursor;
				DEALLOCATE cert_cursor;


			END
			ELSE 
			BEGIN 

				UPDATE CER 
				SET D_FEC_ANULACION=@v_fec_anulacion,
				N_ID_PERANULACION=@v_id_perAnulacion,
      			N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_CERTIFICADO CER WITH(NOLOCK) 
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION 
				WHERE CER.N_ID_SUSCRIPCION = @pi_id_suscripcion

				UPDATE T_MAE_POLIZA
				SET N_ID_ESTADO = @v_id_estado,
				C_COD_USUMODIF = @pi_cod_usuModif,
				D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_POLIZA POL WITH(NOLOCK)
				INNER JOIN T_MAE_CERTIFICADO CER WITH(NOLOCK) ON POL.N_ID_POLIZA = CER.N_ID_POLIZA
				INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION=SUS.N_ID_SUSCRIPCION 
				WHERE CER.N_ID_SUSCRIPCION = @pi_id_suscripcion	 

				UPDATE SUS
				SET  N_ID_ESTADO = @v_id_estado,
					C_COD_USUMODIF = @pi_cod_usuModif,
					D_FEC_MODIFICACION = @v_fec_modificacion
				FROM T_MAE_SUSCRIPCION SUS WITH(NOLOCK)
				WHERE N_ID_SUSCRIPCION = @pi_id_suscripcion

				INSERT INTO T_DET_BITACORA_CERTIFICADO (
			    N_ID_CERTIFICADO,                   N_ID_SECUENCIA,           N_ID_MOTIVO,        N_ID_MOVESTADO, 
			    N_ID_TIPOMONEDA,                    N_NUM_VALORCOMERCIAL,      N_NUM_PRIMANETA,    N_NUM_PRIMABRUTA, 
			    C_OBS_DESCRIPTIVO,                   N_IND_ACTIVO,              N_ID_ESTADO,       C_COD_USUCREACION,
				D_FEC_CREACION)
				SELECT 
			    CER.N_ID_CERTIFICADO,
			    ISNULL(MAX(BIT.N_ID_SECUENCIA), 0) + 1, 
			    @pi_id_tipoMotivo,
			    @pi_id_estado,
			    CER.N_ID_TIPOMONEDA,
				0,
			    @pi_num_importeDevolver,
			    0,
			    @pi_val_motivo,
			    1,
			    1, 
			    @pi_cod_usuModif,
			    GETDATE()
			FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
			LEFT JOIN T_DET_BITACORA_CERTIFICADO BIT WITH(NOLOCK) ON CER.N_ID_CERTIFICADO = BIT.N_ID_CERTIFICADO
			INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
			WHERE SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
			GROUP BY CER.N_ID_CERTIFICADO, CER.N_ID_TIPOMONEDA, CER.N_NUM_PRIMANETA, CER.N_NUM_PRIMABRUTA;

		END
			
			PRINT 'SUS 1 '
			IF @pi_id_estado=4
			BEGIN
				SET @v_id_tipoMovimiento =566 -- CANCELADO
				SET	@v_desc_movimiento ='Cancelación del Certificado'
				PRINT '---'
				PRINT @v_id_certificado
				PRINT @v_id_suscripcion
				
				--INSERT INTO T_DET_BITACORA_CERTIFICADO
				--(
				--	N_ID_CERTIFICADO,				N_ID_SECUENCIA,				N_ID_MOTIVO,		N_ID_MOVESTADO,
				--	N_ID_TIPOMONEDA,				N_NUM_VALORCOMERCIAL,		N_NUM_PRIMABRUTA,	N_NUM_PRIMANETA,
				--	C_OBS_DESCRIPTIVO,				N_IND_ACTIVO,				N_ID_ESTADO, 		C_COD_USUCREACION, 
				--	D_FEC_CREACION
				--)
				--VALUES
				--(
				--	@v_id_certificado,				@v_id_secuencia,			@pi_id_tipoMotivo,			@pi_id_estado,
				--	@v_id_tipomoneda,				0,							@pi_num_importeDevolver,	0,
				--	@pi_val_motivo,					1,							1,							@pi_cod_usuModif,
				--	getdate()
				--)

			--	INSERT INTO T_DET_BITACORA_CERTIFICADO (
			--    N_ID_CERTIFICADO,                   N_ID_SECUENCIA,           N_ID_MOTIVO,        N_ID_MOVESTADO, 
			--    N_ID_TIPOMONEDA,                    N_NUM_VALORCOMERCIAL,      N_NUM_PRIMANETA,    N_NUM_PRIMABRUTA, 
			--    C_OBS_DESCRIPTIVO,                   N_IND_ACTIVO,              N_ID_ESTADO,       C_COD_USUCREACION,
			--	D_FEC_CREACION)
			--	SELECT 
			--    CER.N_ID_CERTIFICADO,
			--    ISNULL(MAX(BIT.N_ID_SECUENCIA), 0) + 1, 
			--    @pi_id_tipoMotivo,
			--    @pi_id_estado,
			--    CER.N_ID_TIPOMONEDA,
			--	0,
			--    @pi_num_importeDevolver,
			--    0,
			--    @pi_val_motivo,
			--    1,
			--    1, 
			--    @pi_cod_usuModif,
			--    GETDATE()
			--FROM T_MAE_CERTIFICADO CER WITH(NOLOCK)
			--LEFT JOIN T_DET_BITACORA_CERTIFICADO BIT WITH(NOLOCK) ON CER.N_ID_CERTIFICADO = BIT.N_ID_CERTIFICADO
			--INNER JOIN T_MAE_SUSCRIPCION SUS WITH(NOLOCK) ON CER.N_ID_SUSCRIPCION = SUS.N_ID_SUSCRIPCION
			--WHERE SUS.N_ID_SUSCRIPCION=CER.N_ID_SUSCRIPCION
			--GROUP BY CER.N_ID_CERTIFICADO, CER.N_ID_TIPOMONEDA, CER.N_NUM_PRIMANETA, CER.N_NUM_PRIMABRUTA;

			END
			ELSE 
			BEGIN
				IF @pi_id_estado=18
				BEGIN
					SET @v_id_tipoMovimiento =570
					SET	@v_desc_movimiento ='Rechazo del Certificado'

			
					EXEC SPI_T_BitacoraCertificado @v_id_certificado,@v_id_tipoMovimiento,@v_desc_movimiento, @pi_id_tipoMotivo, @v_id_estado, '', @pi_cod_usuModif		
				END
			END
		END	
	END			   
	
	IF @pi_apiCancela=0
		SELECT	@v_CodError	 AS COD_ERROR,
			LTRIM(RTRIM(@v_Mensaje)) AS MENSAJE
END TRY

BEGIN CATCH

	DECLARE @ERROR VARCHAR(2000)
	DECLARE @Linea VARCHAR(2000)
	set @ERROR=ERROR_MESSAGE()
	set @Linea=ERROR_LINE()
	Set @ERROR=@ERROR+''+@Linea

	IF @pi_apiCancela=0
		SELECT		1	 AS COD_ERROR,
			@ERROR AS MENSAJE

	EXEC SPI_T_MaeLog 'SPU_T_MaeSusAnular',0, @ERROR, @pi_cod_usuModif

END CATCH

END
GO
