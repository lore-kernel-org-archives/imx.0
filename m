Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792786019;
	b=z5Lprox7H3dIWX0uq8sOVGue8S18X3nrzjvIV1Jtld28p8Wca+563wLqOH5bUUmG5F4G
	 0sBv8xXAjVmcvnEhKQdOwD0+Ow9mR7qzLshAFEbyQTCzQDPhxHocySFF1LNV2GjkoPutg
	 gpyggFpWhxBXFqqPmLYSXa5N3pNY0FypiIGWCpRqwyLLysNvYfqM9l/ykCYOgR49IA3FH
	 P8/VM98WRZRYBmbcWCceGhQfCmEIePEHstwi46/WdAvBac5pB/+/zgyvVWOG/448lW7Jr
	 XUk/WjAUxxMy6l8JUjWcvxlY9QxkYPtVg4y1S3KDytasO9FS1koe1G4KFQwfFIV+mbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792786019;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=1xbW0gED+/2J2YzZoOddp/9wnZ2oY4IZ+JT4oKEW64k=;
	b=KfGjO07NHxsK1PI5V7+RpRbMKaomywe4Ihcq8R9735qjS1+0Y4YJPAu+HOAcsslK541o
	 md5avK2RMkGZ3B1PMWBYy/V7d9xtl4Mh6Dl7xHKPcy6M6lZpdHlDUZjpKAz4AmMgM+UrW
	 FiPpGb3Id7G65y9O0vyoL+cKga+ZbkOjsv5O/iHGUfPZSk9bu8k0QY4oo3pefjgggrllJ
	 tmt8ZcdfAhl1wKCx2UnXiVzE4EqX4jfHSBgBg6gaaxt0OJ2aJwACalEeLVIu3Tv66IwEp
	 ktnrG+X1o5sjKZGpxOHMcj6LANiATdXUl5v8LzxBuKLa9Rzwb3V6A79M0k3l/+BUGEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJoC3vVC;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BBF606A31D;
	Fri, 23 Oct 2026 20:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RJoC3vVC
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ACB81F01825;
	Fri, 23 Oct 2026 20:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792786018;
	bh=1xbW0gED+/2J2YzZoOddp/9wnZ2oY4IZ+JT4oKEW64k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RJoC3vVCeOAvr6Y0LTDZs0R5EARa4oY8zuQ93BY/41wC8RF521CTdXoLb5l/ZivWH
	 O2Hd8tKZcaEip1pqMwuGuxwU0hVW/aC8CysQ32qxGfxGiG/9dAIs9glGfugMXY9TDX
	 Srsuwqu8yzC6u/D2GQqNnzQkIzHpOMeA/DmAv3Vbvi9h8Oa+g63PWc2LkKOqkTxp4R
	 VU9D9oOf6DyIOSFBpp3bUxfn5q8lpExes8SmGJZclqbWdDghoK1rgitCcgLiAiGW6g
	 P3SLFetjYq5S7ZDyGsv1sn6cPBHwMI0SIyCp9ZxmZ1vge1TN725x+IrcKpMmIxjVkB
	 wr7Twzrg2WLhg==
Message-ID: <sashiko-outbox-183160@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: imx8dxl-evk: add lcdif overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261023-dxl_lcdif-v4-7-4ae8395a4b23@nxp.com>
References: <20261023-dxl_lcdif-v4-0-4ae8395a4b23@nxp.com>
 <20261023-dxl_lcdif-v4-7-4ae8395a4b23@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 23 Oct 2026 20:06:57 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] arm64: dts: imx8dxl-evk: invalid and ignored bus-width in adma_l=
cdif endpoint
- [Medium] arm64: dts: imx8dxl-evk: lcdif overlay leaves broken audio consu=
mers enabled
--

commit 19a4bb9fef78514466afe51bb1b962f7fabf9e20
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8dxl-evk: add lcdif overlay

This commit adds a device tree overlay to support the waiken,101wx001-wct L=
CD
panel on imx8dxl-evk boards, enabling adma_lcdif and disabling conflicting
peripherals that share pins with the 18-bit LCDIF interface.

> diff --git a/arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif-101wx001-wct=
.dtso b/arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif-101wx001-wct.dtso
> new file mode 100644
> index 0000000000000..39abf9b3884ea
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8dxl-evk-lcdif-101wx001-wct.dtso
[ ... ]
> +&acm {
> +	status =3D "disabled";
> +};
> +
> +&adma_lcdif {
> +	pinctrl-0 =3D <&pinctrl_lcdif>, <&lcd_0_fun>, <&lcd_1_fun>, <&lcd_2_fun=
>, <&lcd_3_fun>;
> +	pinctrl-names =3D "default";
> +	status =3D "okay";
> +
> +	port {
> +		lcdif_out: endpoint {
> +			bus-width =3D <18>;
> +			remote-endpoint =3D <&panel_in>;
> +		};
> +	};
> +};

[Severity: Medium]
Is bus-width valid or handled in the adma_lcdif endpoint node here?

In Documentation/devicetree/bindings/display/fsl,lcdif.yaml, the port node =
is
defined purely via /schemas/graph.yaml#/properties/port:

  port:
    $ref: /schemas/graph.yaml#/properties/port
    description: The LCDIF output port

Because /schemas/graph.yaml#/properties/port enforces unevaluatedProperties:
false on endpoint and does not reference video-interfaces.yaml, adding
bus-width =3D <18> causes dtbs_check validation to fail on
imx8dxl-evk-lcdif-101wx001-wct.dtb.

Furthermore, at runtime, adma_lcdif (fsl,imx8dxl-lcdif / fsl,imx6sx-lcdif) =
is
driven by mxsfb, and neither mxsfb, drm_panel_bridge, nor panel-simple pars=
es
bus-width from the endpoint node. Instead, the call chain:

  mxsfb_crtc_atomic_enable()
    -> mxsfb_crtc_mode_set_nofb()
      -> mxsfb_set_formats()

selects CTRL_BUS_WIDTH_* solely from the panel's media bus format. Since
waiken_101wx001_wct_panel in drivers/gpu/drm/panel/panel-simple.c specifies:

  .bus_format =3D MEDIA_BUS_FMT_RGB888_1X24,

mxsfb_set_formats() programs LCDC_CTRL with CTRL_BUS_WIDTH_24 instead of
CTRL_BUS_WIDTH_18, causing the controller to output 24-bit RGB888 when only=
 18
data lines (ADMA_LCDIF_D00 through ADMA_LCDIF_D17) are routed on the board.

[ ... ]
> +&sai0 {
> +	status =3D "disabled";
> +};
> +
> +&sai1 {
> +	status =3D "disabled";
> +};
> +
> +&wm8960_1 {
> +	status =3D "disabled";
> +};
> +
> +&wm8960_2 {
> +	status =3D "disabled";
> +};
> +
> +&wm8960_3 {
> +	status =3D "disabled";
> +};

[Severity: Medium]
Should this overlay also disable asrc0, sai2, sai3, and the root sound card
nodes from arch/arm64/boot/dts/freescale/imx8dxl-evk.dts?

Disabling acm, sai0, sai1, and wm8960_1..3 while leaving their consumers
enabled in the base DTB causes several probe failures and permanently defer=
red
devices at boot:

1. asrc0 remains enabled in imx8dxl-evk.dts and references <&acm
IMX_ADMA_ACM_AUD_CLK0_SEL> and <&acm IMX_ADMA_ACM_AUD_CLK1_SEL>. With acm
disabled, of_clk_get_hw_from_clkspec() returns ERR_PTR(-ENOENT), causing
fsl_asrc_probe() in sound/soc/fsl/fsl_asrc.c to fail with -ENOENT.

2. sai2 and sai3 remain enabled in imx8dxl-evk.dts even though their codecs
(wm8960_2 and wm8960_3) are disabled here. Their clock controllers (sai2_lp=
cg
and sai3_lpcg in imx8-ss-audio.dtsi) take parent clocks from acm; with acm
disabled, of_clk_parent_fill() in imx_lpcg_parse_clks_from_dt() fails to
resolve the parent clock, causing LPCG probe to fail with -ENODEV and leavi=
ng
sai2 and sai3 stuck in -EPROBE_DEFER.

3. The root sound card nodes in imx8dxl-evk.dts (sound-bt-sco, sound-wm8960=
-1,
sound-wm8960-2, and sound-wm8960-3) remain enabled while referencing the
disabled CPU, codec, and ASRC nodes, leaving all four sound card devices
permanently in -EPROBE_DEFER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261023-dxl_lcdif-=
v4-0-4ae8395a4b23@nxp.com?part=3D7
