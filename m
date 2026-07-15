Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BAE9436BC0;
	Wed, 15 Jul 2026 12:42:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119329; cv=none; b=rGm6vKtBmdPnkEeyjg35qN72pf+lknDSOYfXF4ebTQ0Yzs6N5IdM5QYl6v9ZPxTGXfW2J/P/fnEFxa2D2K42Dig116XD3YB2G9r0S0FOq8HixS6i9edD4TJYxz83OqtotYtAU76Glg0A4oiQdan+YqICfOOIPA/8aISg/+crGZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119329; c=relaxed/simple;
	bh=6fFH+s0jN5wime8evHyfj3XDDN+78kBPugUVeowomMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QA+E9jbxcZ51qH8ByAlo/CtHzkEs4W3ieERg5CeZnuzA6+ojWRKxXEsvMSD6kcXF/LZGmDkJarVPZ5EIEyLtuy6G7cIYwXVqmGMSpcBXtLEGwUWN6+VsIUNB8WJShRl5a6UW4jwkIEdjPVcCCs3bCaev9o+VPG2kPv1byoq6D6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=csTK6+Ea; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="csTK6+Ea"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B48C1F000E9;
	Wed, 15 Jul 2026 12:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784119328;
	bh=DpqBU29TSftE1N665eaPOolOLYzkC8zsSqxlteZLO10=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=csTK6+Ea+LDtbI5h7g/3pr99r9vYFPDLVr66vv5ReNrX7rlj6B5aWEeUJSbLmilo0
	 2Cxstfpz9jpAhc1l4Jbt0yo9QVcAqVR1K24AdcN3wQzCtUEKWi2ArlpHSmhew4L2VU
	 fy9Bl3yLKeyR4i60nIRK/XCOsgIKt3d5dWGjob8jdrbgsnw+j6Qs/7OMGj4Zqpr+6O
	 Pok03bHTEox02ICkZXLQO7SlDSzXejaCU+juFckFGQf6vB4vd70UenBNCssTgY2zX4
	 pM6HJ88L83UBG9UkBqdVKUYLCP59MkB0Aeur9tT/b48o+hvj1w1azAaqWqdeLMRToy
	 M73DqenhFPGag==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/9] arm64: dts: imx8ulp: Add I3C2 controller node
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?UGVuZyBGYW4gKE9TUyk=?= <peng.fan@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260715-imx8ulp-dts-v1-2-19651358b599@nxp.com>
References: <20260715-imx8ulp-dts-v1-0-19651358b599@nxp.com>
 <20260715-imx8ulp-dts-v1-2-19651358b599@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 15 Jul 2026 12:42:07 +0000
Message-Id: <20260715124208.2B48C1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The device tree assigns a dummy clock for 'slow_clk', contradict=
ing the commit message which states it is configured to use the 24 MHz PCC3=
-gated clock.
--

--- Patch [2]: [PATCH 2/9] arm64: dts: imx8ulp: Add I3C2 controller node ---
commit 56028cef3837517bbf3f1ac9d58c6983788955ee
Author: Peng Fan <peng.fan@nxp.com>

arm64: dts: imx8ulp: Add I3C2 controller node

This commit adds the I3C2 node to the imx8ulp device tree using the
Silvaco I3C master IP. It also configures the controller's interrupts=20
and clock sources.

> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot=
/dts/freescale/imx8ulp.dtsi
> index 5438958176985..c82c3388cbe79 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
[ ... ]
> @@ -361,6 +361,22 @@ tpm5: tpm@29340000 {
[ ... ]
> +			i3c2: i3c@29360000 {
> +				compatible =3D "silvaco,i3c-master-v1";
> +				reg =3D <0x29360000 0x10000>;
> +				interrupts =3D <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>;
> +				#address-cells =3D <3>;
> +				#size-cells =3D <0>;
> +				clocks =3D <&pcc3 IMX8ULP_CLK_I3C2>,
> +					 <&pcc3 IMX8ULP_CLK_I3C2>,
> +					 <&cgc1 IMX8ULP_CLK_DUMMY>;
> +				clock-names =3D "pclk", "fast_clk", "slow_clk";

[Severity: Medium]
Does this clock assignment match the intention described in the commit mess=
age?

The commit message states that the PCC3-gated clock is configured "for pclk,
fast_clk and slow_clk". However, the device tree node assigns the dummy clo=
ck
(&cgc1 IMX8ULP_CLK_DUMMY) for slow_clk instead.

Should slow_clk be using &pcc3 IMX8ULP_CLK_I3C2 as described, or should the
commit message be updated to reflect the use of the dummy clock?

> +				assigned-clocks =3D <&pcc3 IMX8ULP_CLK_I3C2>;
> +				assigned-clock-parents =3D <&cgc1 IMX8ULP_CLK_SOSC_DIV2>;
> +				assigned-clock-rates =3D <24000000>;
> +				status =3D "disabled";
> +			};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260715-imx8ulp-dt=
s-v1-0-19651358b599@nxp.com?part=3D2
