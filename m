Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1176F25B0B3;
	Mon,  3 Aug 2026 05:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785735929; cv=none; b=nH3wPcskpCSS74j5MWFk1mvb0eo4TmpKOQJG/F0QSwKbYG74ZMW+Se/38g5rxMcz/z3q1D4mZ8SY9VlZhJ2DevkbrXX8ycGLClxY0rFrdvRcZgb3Rpd3aT4J73bTjH6x/cRraBYp9RTWpLun9d7rdPYttLMTHLiduHADEV/8S0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785735929; c=relaxed/simple;
	bh=tOny/PTSdPsIZ8ySfKLaP95wssozFmoXgDA3kGAhKmc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BJ1sfd0ewnWxpWZ+4hBNrQAES81AL4W0E4kBevM583SKftoMPgR4phsTqu/y2EMbBRoLxdopzMN+7avrQKHHw+CVPT3UHFk/Q0hKX3qwZ1xH4mf178DVIR+NSYifcwV6oP7srzESUSHzSwmsk3Jh75UkBMFDmJ1K15bQVmOXj+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=ma5weV+V; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="ma5weV+V"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=48PALNf6FaW6jxdpb8NdGbAhPOU2X7FvJyVVO35TFGI=; b=ma5weV+VzGltGQtH8g6HPzdtIU
	fl58hisYeqVrPHoJYMrqjnjo66NGlNh98Wy5nKa/9kDiFFRFSDxMkFckP9Fi1soHgsK+YJd7Z8sGK
	OCejII58/JXe9l23vbHd4FKU4fhDYvvFe18P8cGDdzcc3pvltXkzms/ex+8Jg8yY5D1/9YxsmChHn
	aCUs50Dl6WHif3ORBvgsEUOqis83xbj/Qjs8JBnYbk2LPR4c2yUs/HuK3G06MkqfjzvpwLnJOM1AW
	Dlb13O8bNJv6W69jil8Kf38SrI+EJNmlt4JYkmxZh+Lju/oxSihsN0PClmfTZPQmXKjGeT0qijVHg
	IYgbyNnw==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlUJ-0006BS-1X;
	Mon, 03 Aug 2026 07:45:23 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlUI-000G1r-0p;
	Mon, 03 Aug 2026 07:45:22 +0200
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Chester Lin <chester62515@gmail.com>,
 Matthias Brugger <mbrugger@suse.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] ARM: dts: nxp: Correct white-space style
Date: Mon, 03 Aug 2026 07:45:21 +0200
Message-ID: <6019329.DvuYhMxLoT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28080/Sun Aug  2 08:24:19 2026)

Am Samstag, 1. August 2026, 23:04:21 CEST schrieb Krzysztof Kozlowski:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/nxp/imx/e60k02.dtsi                |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi                |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts           |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts        |  4 ++--
>  arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts      |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts |  8 ++++----
>  arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts            |  2 +-
>  arch/arm/boot/dts/nxp/imx/imx7s-warp.dts             |  2 +-
>  arch/arm/boot/dts/nxp/ls/ls1021a.dtsi                | 10 +++++-----
>  9 files changed, 26 insertions(+), 26 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi b/arch/arm/boot/dts/nx=
p/imx/e60k02.dtsi
> index aac7b9ef7627..ed59b27834a6 100644
> --- a/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e60k02.dtsi
> @@ -240,13 +240,13 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -259,7 +259,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -310,7 +310,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-boot-on;
>  			};
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nx=
p/imx/e70k02.dtsi
> index 3bb11c5a6353..dc7ff108aa85 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -243,13 +243,13 @@ regulator-state-mem {
>  				};
>  			};
> =20
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -262,7 +262,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -311,7 +311,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-boot-on;
>  			};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts b/arch/arm/boot/d=
ts/nxp/imx/imx6dl-mamoj.dts
> index ec5a9bf40677..30275319902e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-mamoj.dts
> @@ -151,7 +151,7 @@ reg_usb_host: regulator-usb-vbus {
>  		enable-active-high;
>  	};
> =20
> -	reg_wl18xx_vmmc:  regulator-wl18xx-vmcc {
> +	reg_wl18xx_vmmc: regulator-wl18xx-vmcc {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "vwl1807";
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts b/arch/arm/boo=
t/dts/nxp/imx/imx6q-bosch-acc.dts
> index 929def2bb35e..20b6cc74f622 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-bosch-acc.dts
> @@ -177,7 +177,7 @@ reg_usb_h2_vbus: regulator-usb-h2-vbus {
>  		regulator-name =3D "usb_h2_vbus";
>  		regulator-min-microvolt =3D <5000000>;
>  		regulator-max-microvolt =3D <5000000>;
> -		vin-supply =3D <&reg_5p0> ;
> +		vin-supply =3D <&reg_5p0>;
>  		regulator-always-on;
>  	};
> =20
> @@ -207,7 +207,7 @@ reg_dac: regulator-dac {
>  		regulator-name =3D "vref_dac";
>  		regulator-min-microvolt =3D <20000>;
>  		regulator-max-microvolt =3D <20000>;
> -		vin-supply =3D <&reg_5p0> ;
> +		vin-supply =3D <&reg_5p0>;
>  		regulator-boot-on;
>  	};
> =20
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> index 657d0f1b6115..47b05207574e 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-kobo-aura2.dts
> @@ -211,14 +211,14 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-always-on;
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -231,7 +231,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -282,7 +282,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-always-on;
>  				regulator-boot-on;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts b/arch/=
arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> index 4c655579f43e..64a74719c216 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-shine2hd.dts
> @@ -276,13 +276,13 @@ regulator-state-mem {
>  			};
> =20
>  			/* IR_3V3 */
> -			ldo1_reg: LDO1  {
> +			ldo1_reg: LDO1 {
>  				regulator-name =3D "LDO1";
>  				regulator-boot-on;
>  			};
> =20
>  			/* Core1_3V3 */
> -			ldo2_reg: LDO2  {
> +			ldo2_reg: LDO2 {
>  				regulator-name =3D "LDO2";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -295,7 +295,7 @@ regulator-state-mem {
>  			};
> =20
>  			/* Core5_1V2 */
> -			ldo3_reg: LDO3  {
> +			ldo3_reg: LDO3 {
>  				regulator-name =3D "LDO3";
>  				regulator-always-on;
>  				regulator-boot-on;
> @@ -346,7 +346,7 @@ ldo10_reg: LDO10 {
>  				regulator-boot-on;
>  			};
> =20
> -			ldortc1_reg: LDORTC1  {
> +			ldortc1_reg: LDORTC1 {
>  				regulator-name =3D "LDORTC1";
>  				regulator-always-on;
>  				regulator-boot-on;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts b/arch/arm/boot/dt=
s/nxp/imx/imx6sll-evk.dts
> index 814401486792..d20d2735cab5 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-evk.dts
> @@ -633,7 +633,7 @@ MX6SLL_PAD_PWM1__PWM1_OUT   0x110b0
>  		>;
>  	};
> =20
> -	pinctrl_wdog1: wdog1grp	{
> +	pinctrl_wdog1: wdog1grp {
>  		fsl,pins =3D <
>  			MX6SLL_PAD_WDOG_B__WDOG1_B   0x170b0
>  		>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts b/arch/arm/boot/dts=
/nxp/imx/imx7s-warp.dts
> index 25f38acc5350..b1989013c1a4 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7s-warp.dts
> @@ -272,7 +272,7 @@ &uart1 {
>  	status =3D "okay";
>  };
> =20
> -&uart3  {
> +&uart3 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_uart3>;
>  	assigned-clocks =3D <&clks IMX7D_UART3_ROOT_SRC>;
> diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi b/arch/arm/boot/dts/nx=
p/ls/ls1021a.dtsi
> index e0b9ea6dd510..af518fc08809 100644
> --- a/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
> +++ b/arch/arm/boot/dts/nxp/ls/ls1021a.dtsi
> @@ -721,7 +721,7 @@ queue-group@2d10000 {
>  					<GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d14000  {
> +			queue-group@2d14000 {
>  				reg =3D <0x0 0x2d14000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>,
> @@ -740,14 +740,14 @@ enet1: ethernet@2d50000 {
>  			ranges;
>  			dma-coherent;
> =20
> -			queue-group@2d50000  {
> +			queue-group@2d50000 {
>  				reg =3D <0x0 0x2d50000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 150 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 153 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d54000  {
> +			queue-group@2d54000 {
>  				reg =3D <0x0 0x2d54000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 154 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>,
> @@ -766,14 +766,14 @@ enet2: ethernet@2d90000 {
>  			ranges;
>  			dma-coherent;
> =20
> -			queue-group@2d90000  {
> +			queue-group@2d90000 {
>  				reg =3D <0x0 0x2d90000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 157 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 158 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 159 IRQ_TYPE_LEVEL_HIGH>;
>  			};
> =20
> -			queue-group@2d94000  {
> +			queue-group@2d94000 {
>  				reg =3D <0x0 0x2d94000 0x0 0x1000>;
>  				interrupts =3D <GIC_SPI 160 IRQ_TYPE_LEVEL_HIGH>,
>  					<GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>,
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


