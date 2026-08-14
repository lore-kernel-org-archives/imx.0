Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CFB741F355;
	Fri, 14 Aug 2026 07:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786692825; cv=none; b=qDg6QG9BQaxdyzDR+Hwk0AaEuTdIKtKPyXEzCqYs6cazO6UYgOIqdhfgDZJxceSCUk96gOnd7UMujhK0i/xlAS5EQRGekcKin0BKFXJPK8mmI/uN6fdtXC6zIeseSJnUzDDUOMWJ6IW6nVmGWcmwcoPCPAFatYLYnrWsK+MEc9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786692825; c=relaxed/simple;
	bh=HujHw2zbLhKB6iGbYZSDm4w+ekM56Ibk9MZBtaVZ2g8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qGllupuJUSzzVNY3VPSOIhwlYhb0SeBRfirw+qllojpLxdQkA8m6bbC6nunSnk+9pP0D+jgoPmpQo5z9WIuMUHYNeuKVON+3nprFYi6HsA5QuOGLaLwdOkCR6j59TjRZwuCAd5SKELOKfgkOaV1Zo58CN07h1qvMkZbzCpRFzMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kX7OafnX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kX7OafnX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA1B1F00A3D;
	Fri, 14 Aug 2026 07:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786692814;
	bh=UyPEn4g8IBvWso6MvvyoqhGCnyX4P+/JJ9lX4lFo56c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kX7OafnXLmiilM6/Iftt/fKk1O7QfNjNPIaMfhYDRiVXrR8zk3fbwzqACVBsHXzOX
	 Cbfqb8AKhAuhnNGoo8t831Bq2AimONW+4yO9kieiZh9AwaJhuVWy57MH5EHZJgTVGG
	 zMBBpMW048a8YCij8ESlFKq7EksD/8hS+TxOZBHZ0ydge9VWa+FV7ykhFIVpEpWLLh
	 +5WM5/XsUN1jO2zeBNpLgS6mfS/HmCe7AVQKqNFkvK7xlU7zb63SAlOWIQmwKqiy50
	 /D7JJ1xN16b/jdP7651xpga/YcHdEJNhh2eh+78gkvWLhufzRUyiY4/2mKhpdq6Px1
	 Kqj4azBKmvF2Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 05/17] arm64: dts: imx93-11x11-evk: Add pinmux and mark
 conflicting devices for MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org
In-Reply-To: <20260814072022.4064009-6-chancel.liu@oss.nxp.com>
References: <20260814072022.4064009-1-chancel.liu@oss.nxp.com>
 <20260814072022.4064009-6-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 14 Aug 2026 07:33:33 +0000
Message-Id: <20260814073334.5FA1B1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Undocumented Functional Change: The patch silently modifies the =
&sai1 node by adding clocks and clock-names (including pll8k).
- [Medium] Incomplete Conflict Handling: The sound-micfil audio card is not=
 labeled as a conflicting device, leading to infinite probe deferrals when =
&micfil is disabled.
--

--- Patch [5]: [PATCH 05/17] arm64: dts: imx93-11x11-evk: Add pinmux and ma=
rk conflicting devices for MQS1 ---
commit cd0bb14467afd18f66a4e88a88eba385a4784c70
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx93-11x11-evk: Add pinmux and mark conflicting devices for MQ=
S1

This commit adds the MQS1 pinctrl group and labels conflicting devices so
that an upcoming overlay can disable them. It also updates the clocks and
clock-names for the SAI1 interface.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts b/arch/arm=
64/boot/dts/freescale/imx93-11x11-evk.dts
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-evk.dts
> @@ -105,7 +105,7 @@ cpu {
>  	};
>  };
> =20
> -&micfil {
> +mqs1_conflict_dev: &micfil {

[Severity: Medium]
When the future overlay disables this device, what happens to the sound-mic=
fil
audio card?

The sound-micfil node depends on the micfil device for its CPU DAI:

sound-micfil {
	...
	pri-dai-link {
		...
		cpu {
			sound-dai =3D <&micfil>;
		};
	};
};

If sound-micfil isn't also labeled as a conflict and disabled by the overlay
alongside this node, will the ALSA SoC core continuously fail to find the C=
PU
DAI, leading to endless probe deferrals and kernel log spam?

>  	pinctrl-names =3D "default", "sleep";
>  	pinctrl-0 =3D <&pinctrl_pdm>, <&pdm_fun>;

[ ... ]

> @@ -127,6 +132,10 @@ &sai1 {
>  	pinctrl-names =3D "default", "sleep";
>  	pinctrl-0 =3D <&pinctrl_sai1>;
>  	pinctrl-1 =3D <&pinctrl_sai1_sleep>;
> +	clocks =3D <&clk IMX93_CLK_SAI1_IPG>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_SAI1_GATE>, <&clk IMX93_CLK_DUMMY>,
> +		 <&clk IMX93_CLK_DUMMY>, <&clk IMX93_CLK_AUDIO_PLL>;
> +	clock-names =3D "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k";

[Severity: Medium]
Could the commit message be updated to mention these changes to the SAI1 no=
de?

The addition of the "pll8k" clock alters how the fsl_sai ALSA driver comput=
es
audio rates at runtime, as the driver explicitly checks for this clock to
reparent clocks.

Since this changes the functional behavior of the existing SAI1 configurati=
on,
should it be documented in the commit message or split into a separate patc=
h?

>  	assigned-clocks =3D <&clk IMX93_CLK_SAI1>;
>  	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260814072022.4064=
009-1-chancel.liu@oss.nxp.com?part=3D5
