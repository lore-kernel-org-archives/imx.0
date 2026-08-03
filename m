Received: from www537.your-server.de (www537.your-server.de [188.40.3.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F0B301468;
	Mon,  3 Aug 2026 06:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.3.216
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785736859; cv=none; b=iD4yuQlm44WQnLqFGxCiSc8j4jRlUopFZXs0VbsxhqzwfB0940knhiHlIlVa0wqZxClsg6GuIGtiW0WUn1nPrBwcPQ1GLi3DqEVIIyXvxLA8qrfWfHBqQ6Pha1iVkVmCGBweBExWDOCJh6LwpRy2Gwz3fXKAIXYcNcGtl7Qpmp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785736859; c=relaxed/simple;
	bh=QeEcTwcITO3wHhNVdVsIJYaY0MB3bMQPWNIQLeFeHFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kRKJhmysCE+agj+9atxFbnd2To1mE87pVqJSiWboXK8clCUxcAHLACCaZ9fXzb7DPQAsnuJi+YKRO/xiTOK6uBN5L3Mxd5tRfJbFw5IhMu8ny+pdDM0ChWNphYWbRLUJLcEFpliFt/6qDQXYofql/akJlQw02ors1x5eqjJthGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=DYGyR6ql; arc=none smtp.client-ip=188.40.3.216
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="DYGyR6ql"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=ew.tq-group.com; s=default2602; h=Content-Type:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID;
	bh=udqf3X6JJaoOhkTJcbPrJRHiS3GSyYRNj03JMFkQof4=; b=DYGyR6qla2cnaP+CK+tXVjPx6S
	NYG1lULP+/Pb5B/3+I2PlN3Pxpr23hGuHq9BJHP7xn2knc+XuEX3JNIbENp0yIDq0E6EtVACvryv4
	9ptYtBEE0okdyao3JFdbRPgxQkHq/JJlI3pwsXYTutzF91PKKbUKu+cvI60/VsyMl7FU2q6pvWLUB
	xVgglktt3a6wx/WpA89+bCkx3jYkiGqwoKu5SyhiWtdyWMLee/Nbft4LVRQHyvVFaOYYZDkS2zy+Z
	aHCMsErcj7VI9SJJo27rrJFWzRht6lZQSYx897wGRcT9gpbuGUTRjzvCU9oKPhOLS5Adyl1cG4Q/n
	mypAU7oQ==;
Received: from sslproxy07.your-server.de ([78.47.199.104])
	by www537.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlTh-0005zp-1i;
	Mon, 03 Aug 2026 07:44:45 +0200
Received: from localhost ([127.0.0.1])
	by sslproxy07.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <alexander.stein@ew.tq-group.com>)
	id 1wqlTg-000BX7-0l;
	Mon, 03 Aug 2026 07:44:44 +0200
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
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Correct white-space style
Date: Mon, 03 Aug 2026 07:44:43 +0200
Message-ID: <2845758.mvXUDI8C0e@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260801210420.383984-4-krzysztof.kozlowski@oss.qualcomm.com>
References:
 <20260801210420.383984-3-krzysztof.kozlowski@oss.qualcomm.com>
 <20260801210420.383984-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Virus-Scanned: Clear (ClamAV 1.4.3/28080/Sun Aug  2 08:24:19 2026)

Am Samstag, 1. August 2026, 23:04:22 CEST schrieb Krzysztof Kozlowski:
> Correct a few white-space issues, like missing space before bracket '{'
> character or spurious space, which will be flagged by dt-check-style
> ("redundant-whitespace" warning).  No functional changes.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>

> ---
>  arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi            | 2 +-
>  .../arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi | 2 +-
>  .../boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts    | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi     | 2 +-
>  .../imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtso    | 2 +-
>  .../imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtso    | 2 +-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts   | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi         | 4 ++--
>  arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts         | 2 +-
>  arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts | 2 +-
>  arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi         | 6 +++---
>  arch/arm64/boot/dts/freescale/imx95.dtsi                  | 8 ++++----
>  arch/arm64/boot/dts/freescale/imx952.dtsi                 | 8 ++++----
>  arch/arm64/boot/dts/freescale/s32g2.dtsi                  | 2 +-
>  arch/arm64/boot/dts/freescale/s32g3.dtsi                  | 2 +-
>  15 files changed, 25 insertions(+), 25 deletions(-)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi b/arch/arm64/=
boot/dts/freescale/fsl-ls1028a.dtsi
> index f4ba3d16ab86..aeb5000fffdf 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1028a.dtsi
> @@ -105,7 +105,7 @@ osc_27m: clock-osc-27m {
>  	};
> =20
>  	firmware {
> -		optee: optee  {
> +		optee: optee {
>  			compatible =3D "linaro,optee-tz";
>  			method =3D "smc";
>  			status =3D "disabled";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi b=
/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> index ea1d5b9c6bae..94e18357e37f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-beacon-baseboard.dtsi
> @@ -49,7 +49,7 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency =3D <100000000>;
>  	};
> =20
> -	pcie0_refclk_gated:  pcie0-refclk-gated {
> +	pcie0_refclk_gated: pcie0-refclk-gated {
>  		compatible =3D "gpio-gate-clock";
>  		clocks =3D <&pcie0_refclk>;
>  		#clock-cells =3D <0>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dt=
s b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
> index a02b31c42db4..299d81a18c06 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp-edimm2.2.dts
> @@ -101,7 +101,7 @@ &usb_dwc3_1 {
>  &usdhc2 {
>  	cd-gpios =3D <&gpio2 12 GPIO_ACTIVE_LOW>;
>  	bus-width =3D <4>;
> -	pinctrl-names =3D "default" ;
> +	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&pinctrl_usdhc2>, <&pinctrl_usdhc2_gpio>;
>  	vmmc-supply =3D <&reg_usdhc2_vmmc>;
>  	status =3D "okay";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi b/arch=
/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
> index 69558ffefa9a..affcc20b20c7 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-icore-mx8mp.dtsi
> @@ -49,7 +49,7 @@ buck1: BUCK1 {
>  				regulator-ramp-delay =3D <3125>;
>  			};
> =20
> -			buck2: BUCK2  {
> +			buck2: BUCK2 {
>  				nxp,dvs-run-voltage =3D <950000>;
>  				nxp,dvs-standby-voltage =3D <850000>;
>  				regulator-always-on;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lv=
ds0-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2-lvds0-tm070jvhg33.dtso
> index 2cf1de8c05b4..9ce0744c88a8 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm0=
70jvhg33.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm0=
70jvhg33.dtso
> @@ -12,7 +12,7 @@ &backlight_lvds0 {
>  	status =3D "okay";
>  };
> =20
> -&panel_lvds0{
> +&panel_lvds0 {
>  	compatible =3D "tianma,tm070jvhg33";
>  	status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lv=
ds1-tm070jvhg33.dtso b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-sm=
arc-2-lvds1-tm070jvhg33.dtso
> index cbad0cfab292..24f5f932231f 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm0=
70jvhg33.dtso
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm0=
70jvhg33.dtso
> @@ -12,7 +12,7 @@ &backlight_lvds1 {
>  	status =3D "okay";
>  };
> =20
> -&panel_lvds1{
> +&panel_lvds1 {
>  	compatible =3D "tianma,tm070jvhg33";
>  	status =3D "okay";
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts b/ar=
ch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> index 0c3f1b20b3d7..a82af92d6085 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5-devkit.dts
> @@ -119,7 +119,7 @@ regulator-state-mem {
>  		};
>  	};
> =20
> -	reg_22v4_p: regulator-22v4-p  {
> +	reg_22v4_p: regulator-22v4-p {
>  		compatible =3D "regulator-fixed";
>  		regulator-name =3D "22v4_P";
>  		regulator-min-microvolt =3D <22400000>;
> @@ -507,7 +507,7 @@ &i2c3 {
>  	pinctrl-0 =3D <&pinctrl_i2c3>;
>  	status =3D "okay";
> =20
> -	magnetometer@1e	{
> +	magnetometer@1e {
>  		compatible =3D "st,lsm9ds1-magn";
>  		reg =3D <0x1e>;
>  		pinctrl-names =3D "default";
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm=
64/boot/dts/freescale/imx8mq-librem5.dtsi
> index f5d529c5baf3..ad7c0e7422ca 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
> @@ -1025,7 +1025,7 @@ &i2c2 {
>  	sda-gpios =3D <&gpio5 17 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
>  	status =3D "okay";
> =20
> -	magnetometer: magnetometer@1e	{
> +	magnetometer: magnetometer@1e {
>  		compatible =3D "st,lsm9ds1-magn";
>  		reg =3D <0x1e>;
>  		pinctrl-names =3D "default";
> @@ -1060,7 +1060,7 @@ proximity: prox@60 {
>  		interrupts =3D <7 IRQ_TYPE_LEVEL_LOW>;
>  	};
> =20
> -	accel_gyro: accel-gyro@6a	{
> +	accel_gyro: accel-gyro@6a {
>  		compatible =3D "st,lsm9ds1-imu";
>  		reg =3D <0x6a>;
>  		vdd-supply =3D <&reg_vdd_sen>;
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts b/arch/arm=
64/boot/dts/freescale/imx8mq-nitrogen.dts
> index 767819cce886..b91509bfc9c0 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-nitrogen.dts
> @@ -230,7 +230,7 @@ i2c@0 {
> =20
>  			hdmi-bridge@48 {
>  				compatible =3D "lontium,lt8912b";
> -				reg =3D <0x48> ;
> +				reg =3D <0x48>;
>  				reset-gpios =3D <&max7323 0 GPIO_ACTIVE_LOW>;
> =20
>  				ports {
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts b/=
arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> index c7d3073b4041..169811b5049c 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som-symphony.dts
> @@ -296,7 +296,7 @@ usb3-signal-route-hog {
>  	};
>  };
> =20
> -&pciea{
> +&pciea {
>  	phys =3D <&hsio_phy 0 PHY_TYPE_PCIE 0>;
>  	phy-names =3D "pcie-phy";
>  	status =3D "okay";
> diff --git a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi b/arch/arm=
64/boot/dts/freescale/imx8qm-var-som.dtsi
> index b11da10c5ae3..a44351133428 100644
> --- a/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8qm-var-som.dtsi
> @@ -275,15 +275,15 @@ &lpuart1 {
>  	status =3D "okay";
>  };
> =20
> -&mu_m0{
> +&mu_m0 {
>  	status =3D "okay";
>  };
> =20
> -&mu1_m0{
> +&mu1_m0 {
>  	status =3D "okay";
>  };
> =20
> -&mu2_m0{
> +&mu2_m0 {
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/d=
ts/freescale/imx95.dtsi
> index 305751046d66..5f8ab994fb34 100644
> --- a/arch/arm64/boot/dts/freescale/imx95.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
> @@ -1458,7 +1458,7 @@ lpi2c1: i2c@44340000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX> ;
> +				dmas =3D <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1472,7 +1472,7 @@ lpi2c2: i2c@44350000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX> ;
> +				dmas =3D <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1486,7 +1486,7 @@ lpspi1: spi@44360000 {
>  				clocks =3D <&scmi_clk IMX95_CLK_LPSPI1>,
>  					 <&scmi_clk IMX95_CLK_BUSAON>;
>  				clock-names =3D "per", "ipg";
> -				dmas =3D <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0> ;
> +				dmas =3D <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1500,7 +1500,7 @@ lpspi2: spi@44370000 {
>  				clocks =3D <&scmi_clk IMX95_CLK_LPSPI2>,
>  					 <&scmi_clk IMX95_CLK_BUSAON>;
>  				clock-names =3D "per", "ipg";
> -				dmas =3D <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0> ;
> +				dmas =3D <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/=
dts/freescale/imx952.dtsi
> index 020de00e8285..887abb1c4784 100644
> --- a/arch/arm64/boot/dts/freescale/imx952.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
> @@ -1164,7 +1164,7 @@ lpi2c1: i2c@44340000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX> ;
> +				dmas =3D <&edma1 12 0 0>, <&edma1 13 0 FSL_EDMA_RX>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1178,7 +1178,7 @@ lpi2c2: i2c@44350000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX> ;
> +				dmas =3D <&edma1 14 0 0>, <&edma1 15 0 FSL_EDMA_RX>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1192,7 +1192,7 @@ lpspi1: spi@44360000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0> ;
> +				dmas =3D <&edma1 16 0 FSL_EDMA_RX>, <&edma1 17 0 0>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> @@ -1206,7 +1206,7 @@ lpspi2: spi@44370000 {
>  				clock-names =3D "per", "ipg";
>  				#address-cells =3D <1>;
>  				#size-cells =3D <0>;
> -				dmas =3D <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0> ;
> +				dmas =3D <&edma1 18 0 FSL_EDMA_RX>, <&edma1 19 0 0>;
>  				dma-names =3D "tx", "rx";
>  				status =3D "disabled";
>  			};
> diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g2.dtsi
> index 8dc0c5d9f368..7a846c143ae8 100644
> --- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
> @@ -14,7 +14,7 @@ / {
>  	#address-cells =3D <2>;
>  	#size-cells =3D <2>;
> =20
> -	reserved-memory  {
> +	reserved-memory {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
>  		ranges;
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> index 24fa3057e929..771c03caafe9 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -153,7 +153,7 @@ pmu {
>  		interrupts =3D <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>  	};
> =20
> -	reserved-memory  {
> +	reserved-memory {
>  		#address-cells =3D <2>;
>  		#size-cells =3D <2>;
>  		ranges;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


