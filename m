Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D767364EB1;
	Fri, 14 Aug 2026 07:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692706; cv=none; b=Ks6pUzXPmFB1K8ENgSddEQrssSK9hPnju3l41cdjsze2BDI3QKEkd5B6DmaSvLjVA82mh16A4FHQNrwKgjyL+L37CFUUdJkGlciYQNdwF+fKtEdRvA3cw3FbJ1hvnthC4TTOB461JskoH0gEs/W3P6bwcRVl7Ml6DB/BT/K+h4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692706; c=relaxed/simple;
	bh=LRL2vn7QCczJxt5pDeLk3oFo5hqxk7YssbAKGhTd/dg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fVRIrku1lRqZDLxwv2bs95qECzIS5LWwlJB6+fyqwgK55d/I6bpPVSdp5h+wVfY9i8Y7uoXPbjenqGFGim/guWJKX3bRWy0LYxwk9NjZ5FjkyUFNacSqfYenj+kCiRf14eGFrAFoRsWN7u/gRa2l8a3BtMoVmjC3yYgcSlj2f9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4x3CqF+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4x3CqF+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27F5B1F00A3A;
	Fri, 14 Aug 2026 07:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692698;
	bh=Km+ACsR+KTwvN9esycsNhh4pLchVx9TSf1jAryN9E5M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y4x3CqF+8pIOYoZATv6LL+7SmGdprbJYMcPruHWQp5M3lKoHbcGViqtoOvniRpdp0
	 D8qTUyCgADFFZhvYiaDYHBGt+MUE9n0CKnafQftnIEBEO0j6HfVyub7yJF6bcMQsIw
	 IXMiVqrbv5KOr2YOtCQfPbC8qtJRbly5uGRmXfSvuD/KsoM+J1MR+JqvBWSX9gORcb
	 hFMxbMeSHYyUhRwx6xO/YxQNHW3/UUsjE+MSPr7gJqcgHQvftjqE+74l+nBdIRxp2w
	 zgLHE8sI8MROL3b05SwiLzooWKIBnf96hnht7es68lHvW5ds0Btp35EYyKADf1pXHD
	 DkmHbtnrtCZpQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and mark
 conflicting devices for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260814072022.4064009-4-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-4-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:31:37 +0000
Message-Id: <20260814073138.27F5B1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Undocumented modification of the '&sai1' node's clock properties.
--

--- Patch [3]: [PATCH 03/17] arm64: dts: imx91-11x11-evk: Add pinmux and ma=
rk conflicting devices for MQS1 ---
commit 2ae9b14f843efe8a48368cba7c61c4f11632f83b
Author: Chancel Liu <chancel.liu@nxp.com>
arm64: dts: imx91-11x11-evk: Add pinmux and mark conflicting devices for MQ=
S1

This patch adds the MQS1 pinctrl group and labels the conflicting sound card
and micfil devices for the imx91-11x11-evk device tree. This allows the sha=
red
imx9-mqs overlay to disable these conflicting devices.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm=
64/boot/dts/freescale/imx91-11x11-evk.dts
> index 4d1ada6a3942b..4a3dfafae3773 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts

[ ... ]

> @@ -511,10 +511,19 @@ &micfil {
>  	status =3D "okay";
>  };
> =20
> +&mqs1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_mqs1>, <&mqs1_fun>;
> +};
> +
>  &sai1 {
>  	pinctrl-names =3D "default", "sleep";
>  	pinctrl-0 =3D <&pinctrl_sai1>;
>  	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> +	clocks =3D <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";

[Severity: Medium]
The commit message mentions adding the MQS1 pinctrl group and labeling
conflicting devices, but doesn't mention modifying the &sai1 node's clock
properties. Is this change to the clocks and clock-names intentional for th=
is
patch, or was it included by mistake?

If it is intended, could the commit message be updated to explain why the
pll8k clock is being added to the active SAI1 node here?

>  	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
>  	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;
>  	assigned-clock-rates =3D <12288000>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D3
