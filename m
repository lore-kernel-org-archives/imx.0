Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A200364E85;
	Mon, 24 Aug 2026 02:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787539247; cv=none; b=RoWnHX1oDud2u5m5LCiHqb2VemH/1DuFMrRr5QOAIFuShuq20ZYaDg0HmIcjI5iRp6NyMGl8dELGkC+zULAjKfaxnw5dEnxOLelSr/b9pU3nn8v4vsLNNTHM3xF3gzHXYCpG3EAMn4vyfM20/9NFruDTyS3A6j+CSo2YyYaP1Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787539247; c=relaxed/simple;
	bh=8DVdctD/JijThTDKI/V0KGbx+Gyyij0SORExsEaHFQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EBEXDxAQGGugNVKGzLbpXa1Tpjbl6q2MZHvdvklPHUTVSa0hKSwgmTSlUi2eYMOZLF5tPvFUwsBUoQ9v9prMyNC5DicK/xJGQ6yXLcRTwbdjOaoznXT4QEsDrxqqj6AiO7OSGL0QrL8t6SoZh1N3NThcCOk4AmEQNFG0dZPvpdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oZlZnsSB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oZlZnsSB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A2391F000E9;
	Mon, 24 Aug 2026 02:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787539241;
	bh=58jSCeKOvgy3apVPWjB9cjUC7+iANy6CCzBTI8YnblM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oZlZnsSBSiOU9kMkZRCXjh5nOQNh/g8kzozFiusbVQj+RNuCxbZLlibq9rdnFV+J0
	 mttA6oFcfiRS3g4EK/fFo+UZHt3+0OPyZufIarMnj+zXqXwJpGUu1dYzvtQyrMapOQ
	 zDgzbSrwq7tdH4RoZFD0+LsLfMaX8S11uISKrM56gOBi+kmAMg0DHfAAl1y5g12p0I
	 9LvVtx5dOhdLTyINMoQCn9zpWX34zspftgD9IE24rcmEErfCJvHIWd0yIn6TqZzqG4
	 53efPl2KUfMVdAHsR7Bx0rQ999GVymyqPYv4HJ0FrVV44F03bp6wCGxAQFONBV/UyM
	 5C92Km38SMZSA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 15/17] arm64: dts: imx952-evk: Add board muxes to
 select between CAN1/PDM
Reply-To: sashiko-reviews@lists.linux.dev
To: "Chancel Liu" <chancel.liu@oss.nxp.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260824022020.2812810-16-chancel.liu@oss.nxp.com>
References: <20260824022020.2812810-1-chancel.liu@oss.nxp.com>
 <20260824022020.2812810-16-chancel.liu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 24 Aug 2026 02:40:40 +0000
Message-Id: <20260824024041.1A2391F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but repeated probe d=
eferrals of devices consuming `pinctrl-multiplexer` states will cause a mem=
ory leak in the `pinctrl-generic-mux` driver.
--

--- Patch [15]: [PATCH v3 15/17] arm64: dts: imx952-evk: Add board muxes to=
 select between CAN1/PDM ---
commit 8303ed37e9ec3be6828aa6ff3d2b548e65c73826
Author: Chancel Liu <chancel.liu@nxp.com>

arm64: dts: imx952-evk: Add board muxes to select between CAN1/PDM

This commit replaces static gpio-hog settings with GPIO-controlled board
muxes. It uses the pinctrl-multiplexer framework so that conflicting
functions between CAN1 and PDM can be selected at runtime.

> diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx952-evk.dts
> index 2224b90aafe93..e9d735dc2a51b 100644
> --- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
> @@ -52,6 +52,40 @@ chosen {
>  		stdout-path =3D &lpuart1;
>  	};
> =20
> +	can1_pdm_mux: mux-controller-0 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pcal6416 10 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	mqs1_en_mux: mux-controller-1 {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		#mux-state-cells =3D <1>;
> +		mux-gpios =3D <&pcal6416 15 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	pinctrl-gpiomux {
> +		compatible =3D "pinctrl-multiplexer";

[Severity: High]
This isn't a bug introduced by this patch, but adding this multiplexer=20
reveals a pre-existing memory leak in the pinctrl-generic-mux driver.

When a consumer device (e.g., flexcan1) probes, the pinctrl core calls
mux_pinmux_dt_node_to_map() in drivers/pinctrl/pinctrl-generic-mux.c. That
function unconditionally allocates memory using devm_ APIs attached to the
provider's device:

drivers/pinctrl/pinctrl-generic-mux.c:mux_pinmux_dt_node_to_map() {
	...
	function =3D devm_kzalloc(pctldev->dev, sizeof(*function), GFP_KERNEL);
	if (!function)
		return -ENOMEM;

	group_names =3D devm_kcalloc(pctldev->dev, 1, sizeof(*group_names), GFP_KE=
RNEL);
	...
}

If the consumer defers probe, these allocations are orphaned on the
provider's devres list and aren't freed during the consumer's cleanup
path. On subsequent probe attempts, new allocations are made, leaking
memory each time.

Is there a plan to fix this in drivers/pinctrl/pinctrl-generic-mux.c so
that repeated probe deferrals don't cause unbounded memory exhaustion on
the provider device?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260824022020.2812=
810-1-chancel.liu@oss.nxp.com?part=3D15
