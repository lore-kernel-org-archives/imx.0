Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95696370AC0;
	Mon, 24 Aug 2026 02:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787538895; cv=none; b=LHH3lSMQlST0OoYSE3KuRZ5PGCuyxNCuADoenNaQmjgJDTlfWShJp2xfOCB9VZIenwcgLMhPiOqeBvqqmt3/iMQ81rCeKyx3pWzQzRuGdy4VqNSQ0IqBwgfsafOVH6qlBojl/2edqZKBHieZHRhJUJ0jieHKTr4i+brBBX9NwG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787538895; c=relaxed/simple;
	bh=O7tNVD78ECxC4AqQzW/lJIhBBkA3sMe8CSb3wAAV78M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UMRQP45zo8ZdqqApYyL5fzy6OTQK8iD3ODZ+tpQBCE6YqA8Kf0BYWvu2Kb8q5AltF94HwTFmPFdNNWJApru/FfmwktNHaDnqRaSRZYhPZDci9lRocuG9wjrVVJyEtsMVSXnPBqcFbPYHyisbLoMoPbf2CJzaBUM0t4djwU/ome8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NfzbYtHa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NfzbYtHa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4F91F000E9;
	Mon, 24 Aug 2026 02:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787538892;
	bh=OcdCeU0aZL2eo+f/ht3i/NUPliT00vuVcPNMQeuBZ3U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NfzbYtHamXyltsNbL38ZJk1hpKer/ItiEYsL3ioClLtbirfY5pLZO/wveacHsevK4
	 QcqPpIX7h0TDmyGqBne447vqIVs6cNfxYHYk9ldNgKkPbZRayfcnJMw+DASyvVfhaR
	 w23jtiksutHVL2sSb3/6jPanm3/tuxjdwBwsraVrQa366JfbKxwy47dqT5ScT7mjIF
	 By07Rs8EYRl2kB2Y5smcjoKgGqH8YPWhDG5bkx+tOAQsRDvYVH3etKBp+kbnvXn+w9
	 AAI2iqntXcQJyTVv3eKd+GCAjflmUP1CsfZrMtVCwDh0dNww9iU3+1doPZtWmQpixx
	 Z49IE/5noqpgw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/17] arm64: dts: imx943-evk: Add board muxes to
 select between CAN1/PDM and MQS1/MIC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: conor+dt@kernel.org, imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260824022020.2812810-10-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
 <20260824022020.2812810-10-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:34:51 +0000
Message-Id: <20260824023451.BB4F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Repeated deferred probing of the `micfil` consumer causes severe d=
evres memory and reference leaks in the `pinctrl-generic-mux` provider.
--

--- Patch [9]: [PATCH v3 09/17] arm64: dts: imx943-evk: Add board muxes to =
select between CAN1/PDM and MQS1/MIC ---
commit 77c9c6202b63305da0b9143118c00d14c3943f7f
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx943-evk: Add board muxes to select between CAN1/PDM and MQS1=
/MIC

This commit replaces static gpio-hogs with GPIO-controlled board muxes
using the pinctrl-multiplexer framework. It allows runtime selection between
conflicting functions (CAN1/PDM and MQS1/MICFIL) and updates the MICFIL node
to use this new pinctrl selection.

> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx943-evk.dts
> index 64660f94f4e9c..07b782ef698ad 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts

[ ... ]

> @@ -710,7 +731,7 @@ &micfil {
>  	assigned-clock-rates =3D <3932160000>,
>  			       <3612672000>, <393216000>,
>  			       <361267200>, <49152000>;
> -	pinctrl-0 =3D <&pinctrl_pdm>;
> +	pinctrl-0 =3D <&pinctrl_pdm>, <&mic_fun>, <&pdm_fun>;

[Severity: High]
This is a pre-existing issue in the pinctrl-multiplexer driver, but routing
the micfil node to use this provider actively triggers it. Can this lead to
severe devres memory and reference leaks if the micfil consumer defers prob=
e?

Looking at mux_pinmux_dt_node_to_map() in
drivers/pinctrl/pinctrl-generic-mux.c, resources are allocated against the
provider's device (pctldev->dev):

	function =3D devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
	if (!function)
		return -ENOMEM;

	group_names =3D devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KE=
RNEL);
	if (!group_names)
		return -ENOMEM;

	function->mux_state =3D devm_mux_state_get_from_np(pctldev->dev, NULL, np_=
config);

When the micfil device defers probe after obtaining pinctrl handles (or is
unbound and rebound), the pinctrl core frees the consumer's maps. However,
these allocations remain on the provider device's devres list.

On the next probe attempt, mux_pinmux_dt_node_to_map() allocates new
structures and calls pinmux_generic_add_function(). Since the function name
already exists in the radix tree from the previous attempt, the pinctrl
core returns the old selector.=20

The newly allocated objects and the mux_chip reference acquired by
devm_mux_state_get_from_np() are abandoned on the provider's list. This
compounds the leak on every deferral and prevents the mux_chip from ever
being freed.

Should the pinctrl-generic-mux driver be fixed to tie these allocations to
the map lifecycle before we expose this path via the DTS change?

>  	pinctrl-names =3D "default";
>  	status =3D "okay";
>  };

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824022020.2812=
810-1-chancel.liu@oss.nxp.com?part=3D9
