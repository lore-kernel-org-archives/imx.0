Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C49C40F8D0;
	Fri, 14 Aug 2026 07:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786693357; cv=none; b=pkPfpHpW01Fl+S2S2GH+svMYHSF3ZovlRx/hStP+SMQ9Du+Ideo4UDDB+jihMcqPA5Iy31mYpywyvYOloYpGKwih4qvbzDCW33kfP/E2+Ti8oFKwN5rDXY1qNOpQlLQ3e5WqdaJPpFw6N7onv9rawI97OBY4fKDojp5dFYfTEY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786693357; c=relaxed/simple;
	bh=h3tlIfhDspgStYU58VPPq1CUIWdW0TwJAoBGmjAm0Lg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UHCUNdSU1LcBwj+q8XbsJoTsGz24GssU3uxNyIR4kN26BXhd8WdQ6KqyPWRetDY2srkvMugEIHusb5jGHEnOY76svD5zHmekKgVNlnRg3jWoGUZ23giodjfoQhehPUFieE/IS4jfb63sCRsX8hBxOnBgKnc7VfNXes83ooOnuNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKX3bRME; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKX3bRME"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89E871F000E9;
	Fri, 14 Aug 2026 07:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786693348;
	bh=hbtnNWBf3/XoWiJ91yP6BV0a4oaoSY4JNk7nCG8IpsM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YKX3bRME0z0bf2H8pFyi/2vNd+upMGie0S9W6VRivzT2Q+Wgu7LFxDh+sp570O6DX
	 RygT8pK+5m/yg9FQNoVj9OOHr3YtumFhpWxSrlUy2oXCna7jN8VDVdFbW9ESlY+dla
	 FqIZRXlLHh5QhMB1HVDgj9NAxL59WSTNJ9xR4Zpgj45JdQZA9Z3rI6rNkRFB3e/OCZ
	 uP4Dqvx9fZXKY6ohAs084ZifXopJRcFKwVNoGyXeQPXqt8r89lW3dTj0+j3ACB7esh
	 krZXVb4vMuQIMYI70DrIz4BDd3RsWe88HoexWiMrbajX3VXGKftKrnkosWn7wrrisC
	 J6EGLzFp/CFFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 16/17] arm64: dts: imx952-evk: Add pinmux and mark
 conflicting devices for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260814072022.4064009-17-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-17-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:42:24 +0000
Message-Id: <20260814074228.89E871F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The patch silently modifies the `&sai1` node to append SoC-level=
 clock definitions (`pll8k` and `pll11k`) in a board-specific `.dts` file, =
violating Devicetree abstractions and the commit message's stated scope.
--

--- Patch [16]: [PATCH 16/17] arm64: dts: imx952-evk: Add pinmux and mark c=
onflicting devices for MQS1 ---
commit 8ad36d874036617823df79dfb507cb8569fd6f0b
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx952-evk: Add pinmux and mark conflicting devices for MQS1

This commit adds the MQS1 pinctrl group and labels the conflicting device a=
nd
sound card so the shared imx9-mqs overlay can disable them.

> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index e9d735dc2a51b..522c6cb9abf28 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts

[ ... ]

> @@ -519,11 +519,21 @@ &micfil {
>  	status =3D "okay";
>  };
> =20
> +&mqs1 {
> +	pinctrl-0 =3D <&pinctrl_mqs1>, <&mqs1_enable>;
> +	pinctrl-names =3D "default";
> +};
> +
>  &mu7 {
>  	status =3D "okay";
>  };
> =20
>  &sai1 {
> +	clocks =3D <&scmi_clk IMX952_CLK_BUSAON>, <&clk_dummy>,
> +		 <&scmi_clk IMX952_CLK_SAI1>, <&clk_dummy>,
> +		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
> +		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
> +	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pl=
l11k";

[Severity: Medium]
Is it intentional to place these SoC-level clock definitions in the
board-specific .dts file rather than the base SoC .dtsi file?

The added clocks (IMX952_CLK_AUDIOPLL1 and IMX952_CLK_AUDIOPLL2) appear to =
be
internal SoC clocks. Wiring these to the sai1 peripheral seems like an
SoC-level integration detail, and placing it here might force other boards
using sai1 to duplicate this wiring.

Additionally, this change is not mentioned in the commit message. Could the
commit message be updated to document this, or should this modification be
split into a separate patch?

>  	assigned-clocks =3D <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
>  			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
>  			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D16
