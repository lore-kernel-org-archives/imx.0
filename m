Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8913EEADF;
	Mon, 27 Jul 2026 09:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785145923; cv=none; b=Wo+DwsatrWwIMFgO9MDDKIBWQr5bDmMJDgol2kiVgnl3gGzzW6ZMPLjVkRHniB17t9kk6MFbDiYifQ7eAlc4rlC7aspIPqUEBjGRqSJ9MPo22FObMGEFyRcI6+8iOHOv/LplwXHqHadvNhdqyole39JCECHmOXvpSbbwKDG3s7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785145923; c=relaxed/simple;
	bh=P0pdx3+QnPgDE00cgggUXPtRwUqSX9CsRXGmJR/786A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lqIriCc+bNGc5Abzkt6W6aPzzOocq4HGFswdNslvjaNqxmYrLKGIhtKFGkgOQrsB2bvA8eHPX6Bps9JZNkAw2HMXOpoIQPLKaW+2lm9lS4ziBK8dse6ZaGtwFLORI3mN1X2rwjSKcc1DlarS8Bjb/XH2hC50NYAD11eScOmJMjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EnvHWntS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EnvHWntS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62FC1F000E9;
	Mon, 27 Jul 2026 09:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785145912;
	bh=NqVuJQAx6YWADlxG/ItZoc/VH1kWlfd49zWvhNevbWU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EnvHWntSZSmq1p/E3j20gIcPWUfC8clolEoh47pf/e/pSsQH3XpwVRUegvkeHL3Ki
	 6e72eT91nIMZdq/z4WG0U4SzcFZA3OWovVY/eI2lHP/ykMUdUyiYWuNc2cLH77dHHQ
	 tpJx/Z4V3LAfDJvLylKpzT3afZvAa26nrVB4u50U7oG/KIxx49jPiwG/elwR3gD4ON
	 MoNNOc/yf5hGYpk4bAlHBmZ/YsVjzwVQcSuJvD2Kzd9jUkAcvqTdwunJHA4nSV77Ie
	 hsardkuNwNY8OghRa3Awboq53YeZKeVB31uOBXl63XjJqwGLSN1GbYZ43r7sgODANg
	 MQtSZH+6uPuug==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: imx8mp-skov-revc: convert to
 overlays
Reply-To: sashiko-reviews@lists.linux.dev
To: "Steffen Trumtrar" <s.trumtrar@pengutronix.de>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-3-67faa5ee0bf6@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
 <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-3-67faa5ee0bf6@pengutronix.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Jul 2026 09:51:49 +0000
Message-Id: <20260727095150.E62FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The TIAN variant overlay incorrectly uses `/ {` instead of `&{/} {=
`, meaning its root properties will not be applied to the base device tree.
- [High] The `&lcdif2` display controller node was accidentally deleted fro=
m the jutouch variant and not added to the common base DT, which will break=
 the display.
- [Medium] In the TIAN overlay, `#address-cells` and `#size-cells` were mis=
takenly added to `&lcdif2` instead of `&lvds_bridge/ports`, leaving `port@1=
` without a `reg` property.
--

--- Patch [3]: [PATCH v5 3/5] arm64: dts: imx8mp-skov-revc: convert to over=
lays ---
commit 3f7282529fd194eae3895a434d1dbbf37a64e617
Author: Steffen Trumtrar <s.trumtrar@pengutronix.de>

arm64: dts: imx8mp-skov-revc: convert to overlays

The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are similar.
This commit moves the common bindings to imx8mp-skov-revc-touch.dts and
converts both variants to use overlays.

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101=
tm023.dtso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm=
023.dtso
> index 3e320d6dea3a2..b50960879e82d 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.d=
ts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.d=
tso
[ ... ]
> @@ -42,38 +40,20 @@ touchscreen@2a {
>  	};
>  };
> =20
> -&lcdif2 {
> -	status =3D "okay";
> -};
> -

[Severity: High]
Does removing the &lcdif2 node here leave the display controller disabled?
Because this node was not moved to the common imx8mp-skov-revc-touch.dts
base tree, it appears the controller might remain disabled as defined in
the SoC base imx8mp.dtsi, which could break display output for this variant.

>  &lvds_bridge {
> -	assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_LDB>,
> -				 <&clk IMX8MP_VIDEO_PLL1>;
> -	assigned-clock-parents =3D <&clk IMX8MP_VIDEO_PLL1_OUT>;
>  	/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
>  	assigned-clock-rates =3D <0>, <506800000>;
> -	status =3D "okay";
> =20
>  	ports {
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.d=
tso b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
> index 9a562c011f2c2..4f37723dbe8a1 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
> @@ -1,8 +1,10 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> =20
>  /dts-v1/;
> +/plugin/;
> =20
> -#include "imx8mp-skov-reva.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> =20
>  / {
>  	model =3D "SKOV IMX8MP CPU revC - TIAN G07017";

[Severity: High]
Does this correctly target the base tree's root? In an overlay, using
/ { ... } defines the root node of the overlay DTB itself rather than
creating a fragment targeting the base tree. Should this use &{/} {
like the jutouch variant so properties like the model and the panel node
are properly merged into the base device tree?

> @@ -21,13 +23,9 @@ in_lvds0: endpoint {
>  	};
>  };
> =20
[ ... ]
> @@ -45,16 +43,14 @@ touchscreen@38 {
>  };
> =20
>  &lcdif2 {
> +	#address-cells =3D <1>;
> +	#size-cells =3D <0>;

[Severity: Medium]
Were these properties intended for the &lvds_bridge/ports node instead?
Adding them to &lcdif2 when there are no unit-addressed children seems
incorrect.

>  	status =3D "okay";
>  };
> =20
>  &lvds_bridge {
> -	assigned-clocks =3D <&clk IMX8MP_CLK_MEDIA_LDB>,
> -				 <&clk IMX8MP_VIDEO_PLL1>;
> -	assigned-clock-parents =3D <&clk IMX8MP_VIDEO_PLL1_OUT>;
>  	/* IMX8MP_VIDEO_PLL1 =3D IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
>  	assigned-clock-rates =3D <0>, <358400000>;
> -	status =3D "okay";
> =20
>  	ports {
>  		port@1 {

[Severity: Medium]
Does port@1 need a reg =3D <1> property? Without the #address-cells and
#size-cells on the ports node and the reg property here, this can cause
dtc warnings and might fail parsing by the display drivers.

> @@ -64,18 +60,3 @@ ldb_lvds_ch0: endpoint {
>  		};
>  	};
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260727-v7-0-topic=
-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de?part=3D3
