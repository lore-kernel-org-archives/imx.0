Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AACD38947F
	for <imx@lists.linux.dev>; Mon,  1 Jun 2026 11:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780312830; cv=none; b=XLAqL+XoZRSdj2m/f7vlNEuXKAhlhkYgiz1okN632OYPiTDhxBAKzAeJKmS7P/LI9ytmrT5flHBL5fFUObDJAQB0o2nDZkvtcavkCVnA3uoSbzNtbjzfaduDlWZnreqpW0rUYLu19QvW2iRyPPCRF8GfoLkRlM4jisfd1kk9hvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780312830; c=relaxed/simple;
	bh=EyLdGsu6HchzDPHk/fFMAtANQEe1SwYJEZN/XxQKdTg=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=kmlMaJ0JfcHCbi8KijqkHzHJwJUkgktRYqv+3nJiA6TYH3oCCcPGiT1rUF3TgT4fvmWJMzprKNW9BKvfILb0VpWD2yNGkYgBno/diRLKgvUQZIE06zI1kPPu7AeCTePfh19N/qgj9HfTddU+iPabnqdereeOe1XPSQfFIdzvSsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ctwdNsWg; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ctwdNsWg"
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB8B9D5;
	Mon,  1 Jun 2026 13:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780312803;
	bh=EyLdGsu6HchzDPHk/fFMAtANQEe1SwYJEZN/XxQKdTg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ctwdNsWgZU8o4KjBqbSuZicvapSDvNqQQqjJiD9SYIZTUpNT4ixTeyY9OmRcSXqix
	 d/I5x3ov4E0nPfyjrDVqjf+L7Pz9yt9LAEB8VOMHqS0EqkjmrGyo4N9QaIpkRF/ojS
	 BGGpDrBqC3KZueC1q5flOYtbS+kmobL31LCQLnlA=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529132334.3333294-2-robby.cai@nxp.com>
References: <20260529132334.3333294-1-robby.cai@nxp.com> <20260529132334.3333294-2-robby.cai@nxp.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Frank.Li@nxp.com, Robby Cai <robby.cai@nxp.com>, conor+dt@kernel.org, festevam@gmail.com, krzk+dt@kernel.org, mchehab@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de, sakari.ailus@linux.intel.com, sebastian.krzyszkowiak@puri.sm, slongerbeam@gmail.com
Date: Mon, 01 Jun 2026 12:20:22 +0100
Message-ID: <178031282290.662668.15145642423417739969@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting Robby Cai (2026-05-29 14:23:33)
> Enable the MIPI CSI-2 host controllers and CSI bridges, and add two
> OV5640 sensors on I2C1 and I2C2, forming two media pipelines:
>=20
>   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
>   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
>=20
> On the i.MX8MQ EVK, both sensors share a single reset GPIO line,
> while each sensor has an independent powerdown (PWDN) GPIO.
>=20
> Both sensors also share the same MCLK source (CLKO2), configured
> identically as required by the hardware design.

Shouldn't these be overlays? Does *every* IMX8MQ-EVK always have 2 x
OV5640 modules attached? And never anything else ?

--
Regards

Kieran

>=20
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 150 +++++++++++++++++++
>  1 file changed, 150 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d4..7ff1a763890a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -6,6 +6,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/media/video-interfaces.h>
>  #include "imx8mq.dtsi"
> =20
>  / {
> @@ -50,6 +51,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
>                 enable-active-high;
>         };
> =20
> +       reg_1v5: regulator-1v5 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "DVDD_1V5";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +       };
> +
> +       reg_2v8: regulator-2v8 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "AVDD_2V8";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +       };
> +
>         buck2_reg: regulator-buck2 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_buck2>;
> @@ -172,6 +187,14 @@ &A53_3 {
>         cpu-supply =3D <&buck2_reg>;
>  };
> =20
> +&csi1 {
> +       status =3D "okay";
> +};
> +
> +&csi2 {
> +       status =3D "okay";
> +};
> +
>  &ddrc {
>         operating-points-v2 =3D <&ddrc_opp_table>;
>         status =3D "okay";
> @@ -330,12 +353,103 @@ vgen6_reg: vgen6 {
>                         };
>                 };
>         };
> +
> +       camera@3c {
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_camera2_pwdn>;
> +               clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +               assigned-clock-rates =3D <20000000>;
> +               powerdown-gpios =3D <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +               DOVDD-supply =3D <&sw4_reg>;
> +               AVDD-supply =3D <&reg_2v8>;
> +               DVDD-supply =3D <&reg_1v5>;
> +
> +               port {
> +                       camera2_ep: endpoint {
> +                               remote-endpoint =3D <&mipi_csi2_in_ep>;
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       clock-frequency =3D <100000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c2>;
> +       status =3D "okay";
> +
> +       camera@3c {
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_camera1_pwdn>;
> +               clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +               assigned-clock-rates =3D <20000000>;
> +               powerdown-gpios =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +               DOVDD-supply =3D <&sw4_reg>;
> +               AVDD-supply =3D <&reg_2v8>;
> +               DVDD-supply =3D <&reg_1v5>;
> +
> +               port {
> +                       camera1_ep: endpoint {
> +                               remote-endpoint =3D <&mipi_csi1_in_ep>;
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
>  };
> =20
>  &lcdif {
>         status =3D "okay";
>  };
> =20
> +&mipi_csi1 {
> +       assigned-clock-rates =3D <266000000>, <200000000>, <66000000>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       mipi_csi1_in_ep: endpoint {
> +                               remote-endpoint =3D <&camera1_ep>;
> +                               data-lanes =3D <1 2>;
> +                               bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mipi_csi2 {
> +       assigned-clock-rates =3D <266000000>, <200000000>, <66000000>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       mipi_csi2_in_ep: endpoint {
> +                               remote-endpoint =3D <&camera2_ep>;
> +                               data-lanes =3D <1 2>;
> +                               bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                       };
> +               };
> +       };
> +};
> +
>  &mipi_dsi {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
> @@ -532,12 +646,34 @@ &wdog1 {
>  };
> =20
>  &iomuxc {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mclk>, <&pinctrl_camera_reset>;
> +
>         pinctrl_buck2: vddarmgrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13              0=
x19
>                 >;
>         };
> =20
> +       pinctrl_camera1_pwdn: camera1pwdngrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3               0=
x19
> +               >;
> +       };
> +
> +       pinctrl_camera2_pwdn: camera2pwdngrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5               0=
x19
> +               >;
> +       };
> +
> +       /* Shared reset line for cameras on CSI1 and CSI2. */
> +       pinctrl_camera_reset: cameraresetgrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6               0=
x19
> +               >;
> +       };
> +
>         pinctrl_fec1: fec1grp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC                 0=
x3
> @@ -565,12 +701,26 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA                    0=
x4000007f
>                 >;
>         };
> =20
> +       pinctrl_i2c2: i2c2grp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL                  0=
x4000007f
> +                       MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA                  0=
x4000007f
> +               >;
> +       };
> +
>         pinctrl_ir: irgrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_GPIO1_IO12_GPIO1_IO12              0=
x4f
>                 >;
>         };
> =20
> +       /* Shared MCLK for cameras on CSI1 and CSI2. */
> +       pinctrl_mclk: mclkgrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2      0=
x59
> +               >;
> +       };
> +
>         pinctrl_mipi_dsi: mipidsigrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_ECSPI1_SCLK_GPIO5_IO6              0=
x16
> --=20
> 2.50.1
>
