Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3D0D373C17;
	Mon, 24 Aug 2026 02:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538916; cv=none; b=ZR2kCj4V5q1j3d/hYisofNUavx1GvM22sBVo1hlN6JPAf2ac2cYkLN75Fvgudf/VN+sMUw67ImbF8PKBoFcXZGvkSJ2X/EczJQ0Msz8SiepkPwHX8+5hihO6noJNudxXw6T8+tweIjCA9TMqwB+DKNnKUdfy20HiJeKFsM014K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538916; c=relaxed/simple;
	bh=Cu2I1T72Qi4GAzpLes72SPvtj5LRPXdRPDVQ717pvZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RHkYXz3k+OPOIZbF9iVKF2FNqG+53NqceCV7KXTQhXplAF/roXsbQWtGVwI/md1iIvGyEp3XjUNG3Rwc0q4KpDaUa5fE2s9MSJUQ6rOJnaRHXqpj39IHIsRpevauWAki5z0XRBE6N5Nuqwgdqt3eid3gsOJ4YTTNahGP3W4xaT8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TlvQpnYB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TlvQpnYB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D55361F000E9;
	Mon, 24 Aug 2026 02:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787538913;
	bh=WNuAFHnQJ2v5KjJWZCte3EdFhTv/BpPOoS6Ad3cjm1k=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=TlvQpnYBdntaz72emznaYd9KtgRRsnpBts1UlapF6n6Ij/WlG/gDD7AZnXuqBqnoN
	 XH7XpICgAqsn0YW6jpdkaDiQ4tJp+oqlutSalrnrWIQINgLT6wmjFbnegBYxMaQiAl
	 8zasPHvD6f9c6D/ii+hEWVYbSZOpgpLL1a2wwkCwiM6cNW/ibeegN3oMqXzWMnOtU0
	 te0ipBVMHvjfN9KQQJJAXwZOcMjmY1wr89NAgpPWtkisbb4W39Gr9druAr9+Q2zD9E
	 6rn7GFW7ALKoHNBADKO3ykfQqtFksIc8wxXqVUsrUSUDYDftauLMNV/4yrZ053FUUs
	 IEAmVB0lLUdqw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/17] arm64: dts: imx91-11x11-evk: Add board muxes
 to select between PDM and MQS1
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260824022020.2812810-3-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
 <20260824022020.2812810-3-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:35:12 +0000
Message-Id: <20260824023512.D55361F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but repeated calls t=
o `mux_pinmux_dt_node_to_map` during probe deferral of the consumer cause u=
nbounded memory leaks on the `pinctrl-multiplexer` provider device.
--

--- Patch [2]: [PATCH v3 02/17] arm64: dts: imx91-11x11-evk: Add board muxe=
s to select between PDM and MQS1 ---
commit defaefa605b7135d708e20b9a9bb866edaa4e6a1
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx91-11x11-evk: Add board muxes to select between PDM and MQS1

This patch adds GPIO-controlled board muxes to route shared signals
between PDM and MQS1, resolving a pin conflict. It introduces the
pdm_mqs1_mux and pinctrl-gpiomux nodes, and updates the micfil pinctrl.

> diff --git a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts b/arch/arm=
64/boot/dts/freescale/imx91-11x11-evk.dts
> index 5716febb5a50f..4d1ada6a3942b 100644
> --- a/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts

[ ... ]

> @@ -484,7 +503,7 @@ bluetooth {
> =20
>  &micfil {
>  	pinctrl-names =3D "default", "sleep";
> -	pinctrl-0 =3D <&pinctrl_pdm>;
> +	pinctrl-0 =3D <&pinctrl_pdm>, <&pdm_fun>;

[Severity: High]
This isn't a bug introduced by this patch, but adding this multiplexer to
the consumer could expose a devres leak in the provider if the consumer
defers probe.

When the micfil consumer evaluates its pinctrl-0 properties, it triggers
mux_pinmux_dt_node_to_map() in drivers/pinctrl/pinctrl-generic-mux.c.
This function allocates resources bound to the provider device rather than
the consumer:

drivers/pinctrl/pinctrl-generic-mux.c:mux_pinmux_dt_node_to_map() {
    ...
    function =3D devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
    ...
    group_names =3D devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP=
_KERNEL);
    ...
    function->mux_state =3D devm_mux_state_get_from_np(pctldev->dev, NULL, =
np_config);
    ...
}

Because these devm_* allocations are bound to pctldev->dev (the provider
device), they are not freed if the micfil consumer defers probe.

Could this result in an unbounded memory and mux state leak on the provider
device for every probe retry?

>  	pinctrl-1 =3D <&pinctrl_pdm_sleep>;
>  	assigned-clocks =3D <&clk IMX93_CLK_PDM>;
>  	assigned-clock-parents =3D <&clk IMX93_CLK_AUDIO_PLL>;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824022020.2812=
810-1-chancel.liu@oss.nxp.com?part=3D2
