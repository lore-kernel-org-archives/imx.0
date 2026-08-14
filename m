Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDEC3DA5B2;
	Fri, 14 Aug 2026 07:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692981; cv=none; b=DSvF2/BEfVVlw2aFc6Nhoi/AnCIgrjbxDwNm0lwldDY0zuD9xApLMhVFVI7cHpPB/YWvftmdDI0Yc+9ncnwCFh/Ek9hO466FpHGX8mFsnTN0nUimfVDD6HtjXrrnBiNXJNknoqrTPBB+qq5IpCG/MWY4FAZP3Fmp+H2UAAJmQps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692981; c=relaxed/simple;
	bh=5BTKs0e7jxQZ7rln0AlarN311if1GIj59OmZToG7jAA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DK0+eW7n8589njBU/+cXOlwSrGWg85PCn1RokuwjrfslI/lhVm0EOaE5afGXhjOBIA6uskPM66zAOevz3Zhf86p63HUb9Jeh4Bfn+QTYMVmUrrG2zmh802PH48fgrfcBJ3pu/7dT5D6xhgVUJSODxnu2iNj9P0LrH8CuOjQnx0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zk0v61qJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zk0v61qJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0B21F000E9;
	Fri, 14 Aug 2026 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692972;
	bh=Ep761jV9/LO3P40JeWW3q0g/S1k+fRa14+6yh0UiWgo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Zk0v61qJ5oohG7JHJSspds744WSclStK+9V1ACvAivD51ZW5xLw3UyP2Lq3tnZlK6
	 JZEZ6bQWl4tigqFx5L/Q3LsUj3HAbesVJ/V1AbR/m4iYfV0EgVoTPQE997G6/98L/A
	 JWWz+GRRrrz8OUZvIjfiEaoHYKWGw9QTFdfomf39phcnru8mwAGxYjxZF7/Rhr/6q5
	 JqfYSkR82dubOS0ASbMfWUR58vn5+meloBBawgjE/fvlToi9cIf6DQpnZSw716lpO0
	 KM+tGgfHl6XMhMbXSRXlNw9AWC4CnulFFMu0lqnNMOepBQD+e4U15ibwCWhVdBmaBH
	 1AfrWKa7pX1dw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 13/17] arm64: dts: imx95-15x15-evk: Add pinmux and mark
 conflicting devices for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260814072022.4064009-14-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-14-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:36:07 +0000
Message-Id: <20260814073612.6E0B21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The commit silently modifies the `&sai1` node to add `pll8k` and=
 `pll11k` clocks and their associated names, without any mention in the com=
mit message. The commit message strictly claims to add the MQS1 pinmux and =
label conflicting devices for a future overlay.
--

--- Patch [13]: [PATCH 13/17] arm64: dts: imx95-15x15-evk: Add pinmux and m=
ark conflicting devices for MQS1 ---
commit df407242391b2a2d45fd52f25207318251e36b7f
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx95-15x15-evk: Add pinmux and mark conflicting devices for MQ=
S1

This commit adds the MQS1 pinctrl group and labels conflicting devices for
a shared imx9-mqs overlay.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts b/arch/arm=
64/boot/dts/freescale/imx95-15x15-evk.dts
> index aaa2608793bf6..1013bbfc08b31 100644
> --- a/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts

[ ... ]

> @@ -592,6 +597,11 @@ &pcie0_port0 {
>  };
> =20
>  &sai1 {
> +	clocks =3D <&scmi_clk IMX95_CLK_BUSAON>, <&dummy>,
> +		 <&scmi_clk IMX95_CLK_SAI1>, <&dummy>,
> +		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
> +		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
> +	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pl=
l11k";

[Severity: Medium]
This isn't a bug, but could the commit message be updated to mention these
additions to &sai1?

The commit message strictly claims to add the MQS1 pinmux and label
conflicting devices for a future overlay. It does not mention adding the
pll8k and pll11k clocks and their associated names to the &sai1 node.

Does this omission mask a change in the dynamic clock switching behavior
of the fsl_sai driver?

Should these clock additions be split into a separate patch, or documented
in the commit message for this one?

>  	assigned-clocks =3D <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
>  			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
>  			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D13
