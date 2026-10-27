Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793114295;
	b=Vr9J4TfwB4i732CYdzNQthYNDRwtEDQ3kVEzXOK53zlEOiriiwV8AY3orOGeKBTvXV3H
	 LGsHoS3hyP1k4V694FgZSfr9mNsAqE1RsYGZkf3jKgtMSpL89jt7Z65zFjFd9aSfe62ip
	 adrFYDqwPS+c3cWIfH+w33zTqDzRguLtv6vcCoIVx+KFW0sLKzXGLNnk16q+1n96sg8yb
	 fUXCsbBmcKomlP2cLB5k7GgSKWty0xkIrAv+8tQ13llcUKEocV58E6xZhAP9e3fij6YzW
	 X0ZK99Rk2hcpsSOCCsl33Csr2/t3wT2xJ01kgBKG80lq/NDM8ai6We7STUrEzKTahhg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793114295;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=AKkm0LV33vDlBsloylBYBTqyU1ed18mGo6I08Uzb52A=;
	b=JYfyPngp/wA2+5Oq/gvGhz3cTlF0fpH0duE/EoVxlXarA0oiZlSFk8FvbqbwrVTyRc+m
	 OgS/5PVOII8vlC3m9nO1NsnTHfK0WUYyLnuMURXEXFI4R9YuqSq2Q87ILoYVCA4AUftRs
	 af3U4Z7MeUA6x3GgDI4YOye/nCS4P8b2ajujytuiFwIlaiDcPs1iJOdiHYD8vZ81qPXWz
	 2BVfH3VaLqJcwq2N/Ioek/qm/Sepk7p4wfHNKbpg9AzbvRscz/L18WeyukebmOZ2q3w+4
	 F7hO6ezZW/kiXmbdHfDOvLMWsoxoPGtrzF37x2VFsf8kKzB04OG9wXWqd/y/fkS/tbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFvyUZyo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B8A8606A31B;
	Tue, 27 Oct 2026 15:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gFvyUZyo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B973E1F01829;
	Tue, 27 Oct 2026 15:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793114295;
	bh=AKkm0LV33vDlBsloylBYBTqyU1ed18mGo6I08Uzb52A=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gFvyUZyouEU5KNx4bfgw3N3nZwv52kpZkNnnrkJgRWJcHRGp8fYC1vOCUASk6fG2O
	 2BnNIen9McqOZYmRjJ0zEN0M/RXdemrP+e2dfg+Hu86GnhGR8El6W9vo6UWeKqETCN
	 B6p0QdoEBkUu9RqMhgBb4K7+xeHcawX4ik1BDUmnixCgkkPab5kDmuKvtvabvxRsBw
	 8ywIevTKk0rBFy9UDtbWPR6QUu8X4Gt+FNQC6tWjSuEkQs4UQW5VQ17RgIvj6e0d+2
	 reRi79jyqJffHOZ0ffpC2j4cP8iflWmOk6gRjftk+rjkVYNq9DmjWmid1pKKw0CHst
	 +iWh7UePXG8Ew==
Message-ID: <sashiko-outbox-186823@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 7/7] arm64: dts: imx8dxl-evk: add lcdif overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: Frank.Li@oss.nxp.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261027-dxl_lcdif-v5-7-3a974e4b94b2@nxp.com>
References: <20261027-dxl_lcdif-v5-0-3a974e4b94b2@nxp.com>
 <20261027-dxl_lcdif-v5-7-3a974e4b94b2@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 27 Oct 2026 15:18:14 +0000
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
- [Medium] arm64: dts: imx8dxl-evk: invalid and unparsed lcdif endpoint bus=
-width
- [Medium] arm64: dts: imx8dxl-evk: disabling acm and codecs breaks audio c=
onsumers
--

commit cfee436980bc9bed627f94a41d5e90946202
Author: Frank Li <Frank.Li@nxp.com>

arm64: dts: imx8dxl-evk: add lcdif overlay

This commit adds a device tree overlay to support the waiken,101wx001-wct
LCD panel on the i.MX8DXL EVK board, enabling adma_lcdif and disabling
peripherals that share pins with the LCDIF interface.

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
Does setting bus-width =3D <18> on the lcdif_out endpoint work with the
fsl,lcdif binding and the mxsfb driver?

In Documentation/devicetree/bindings/display/fsl,lcdif.yaml, the port
property is defined as:

  port:
    $ref: /schemas/graph.yaml#/properties/port
    description: The LCDIF output port

Because it references /schemas/graph.yaml#/properties/port directly without
referencing video-interfaces.yaml on the endpoint, endpoint sets
additionalProperties: false and only allows reg, remote-endpoint, and
phandle. Adding bus-width =3D <18> causes dtbs_check schema validation to f=
ail.

Furthermore, at runtime neither mxsfb, drm_panel_bridge, nor panel-simple
parses bus-width from the endpoint node. When mxsfb_crtc_atomic_enable()
calls mxsfb_set_formats() in drivers/gpu/drm/mxsfb/mxsfb_kms.c, it selects
the bus width strictly from bus_format:

  switch (bus_format) {
  case MEDIA_BUS_FMT_RGB565_1X16:
          ctrl |=3D CTRL_BUS_WIDTH_16;
          break;
  case MEDIA_BUS_FMT_RGB666_1X18:
          ctrl |=3D CTRL_BUS_WIDTH_18;
          break;
  case MEDIA_BUS_FMT_RGB888_1X24:
          ctrl |=3D CTRL_BUS_WIDTH_24;
          break;

Since waiken_101wx001_wct_panel in drivers/gpu/drm/panel/panel-simple.c
advertises MEDIA_BUS_FMT_RGB888_1X24, mxsfb programs CTRL_BUS_WIDTH_24
even though only 18 data lines (ADMA_LCDIF_D00 through ADMA_LCDIF_D17) are
routed on the board.

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
Should the remaining audio nodes and sound cards in imx8dxl-evk.dts and
imx8-ss-audio.dtsi also be disabled when &acm, &sai0, &sai1, and
&wm8960_1..3 are disabled?

In the base device tree, several enabled nodes depend on &acm and the
disabled codecs/SAIs:

1. The audio LPCG clock nodes (sai0_lpcg through sai3_lpcg, spdif0_lpcg,
mclkout0_lpcg, mclkout1_lpcg, and mqs0_lpcg) take parent clocks from &acm.
With &acm disabled, imx8qxp_lpcg_clk_probe() ->
imx_lpcg_parse_clks_from_dt() in drivers/clk/imx/clk-imx8qxp-lpcg.c fails to
resolve parent clock names via of_clk_parent_fill():

  ret =3D of_clk_parent_fill(np, parent_names, count);
  if (ret !=3D count) {
          dev_err(&pdev->dev, "failed to get clock parent names\n");
          return count;
  }

2. &asrc0 remains enabled in imx8dxl-evk.dts and directly consumes clocks
from &acm, causing fsl_asrc_probe() to fail with -ENOENT.

3. &sai2 and &sai3 remain enabled in imx8dxl-evk.dts and consume clocks from
sai2_lpcg and sai3_lpcg, causing fsl_sai_probe() to fail clock acquisition
and defer probe indefinitely.

4. The root sound card nodes (sound-bt-sco, sound-wm8960-1, sound-wm8960-2,
and sound-wm8960-3) remain enabled in imx8dxl-evk.dts while referencing the
disabled &sai0, &sai1, &wm8960_1..3, and failing &asrc0/&sai2/&sai3 nodes,
leaving their drivers in permanent probe deferral.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261027-dxl_lcdif-=
v5-0-3a974e4b94b2@nxp.com?part=3D7
