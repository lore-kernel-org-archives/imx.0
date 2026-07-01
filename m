Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 937523EEAC1;
	Wed,  1 Jul 2026 08:45:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782895526; cv=none; b=k72rMEGp2dVpTYviqkU8x6QWA1yyS4pBVCsf0VT5jVZuO3ey5W1Z+MCpHEh9B3FxIORZ21FRjUPde/9uOEjtRIr0VHWThIbdobXIvCe9WDZVQYGViciGw9wFGuQ7O5xtSrO9OX0vYOnQF9lfV1DoZFCvfFI5w8h3dVcogNYb0p8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782895526; c=relaxed/simple;
	bh=nNf4udYJd9MD5XZuXrbu16Cq6DvSap/ZtG4wMkqHLZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dWvkHoGbggqx7aRUEmi5WnG/vaC4uCn82UEQ+kOcOnQVXcKcRLLB8oP4fS5LcYR4aPjNRNrjwR9CZeSx7n1jdCNvzQ+Aisk4Ytv7GvVT0qwIj/IxuBHXR3eeQt9JweISxEdUzcE6s77movaESGrFXAUE0zp5j4gRrdxdSg5/bKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ePRPe1Ft; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ePRPe1Ft"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A5301F000E9;
	Wed,  1 Jul 2026 08:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782895522;
	bh=fydU5j+nWWe8iQwXeKuFpLLzQmRbVlUJZLCyaDL8nsw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ePRPe1FtAckEYhyxJq2tF0EAnnPfU/Ny6x6h+o+2lKVmm5bqClkLg2EwkE2JnUOr1
	 LtMnuFdgwWFatDz85G8qU2AtB2lAiexDhR7bzPaiUju1QNZmovJ9XRUlUueyt/i6rv
	 u1CExW0jxCyHf+oM94G/RCGftOGq2qEEOd9GcYHxavx1DlKPhtWIeqbTY0/SoeeEi1
	 LoVnQREIqgpPNFK9sYvRIFNR/ooNF6vIEBYpkWO5/PYrEMFI+joxWl45qQuOaWq5mH
	 Og8C4T3ay5mT4zTdzu3vnMTrXPwXmBIw6XD2ryP0Is/DBvhiN7FK+S3m9Wuvpj8JLE
	 P+563vogYB34w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 1/1] arm64: dts: add tqma9596la-mba95xxca
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
References: <20260701082611.3126036-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 01 Jul 2026 08:45:22 +0000
Message-Id: <20260701084522.5A5301F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Hardware components (PWM fan and 10G SFP) remain permanently unpow=
ered due to disabled regulators
- [Low] Dead code: Unreferenced `pinctrl_ethphy0` node
--

commit f54617810555494fd6b435aa3ac070a14b264e01
Author: Markus Niebel <Markus.Niebel@ew.tq-group.com>

arm64: dts: add tqma9596la-mba95xxca

This adds support for TQMa95xxLA modules, designed to be soldered
on a carrier board. MBa95xxCA is a carrier reference board / starter kit
design. Enable the external accessible PCIe controllers as host, add
clocking and reset GPIO.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts=
 b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts
> new file mode 100644
> index 0000000000000..e90f37bbdcd80
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-tqma9596la-mba95xxca.dts

[ ... ]

> +	reg_3v3a_10g: regulator-3v3a-10g {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "3V3A_10G";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&expander2 15 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us =3D <2000>;
> +		enable-active-high;
> +	};

[Severity: High]
Is this regulator missing a consumer or the regulator-always-on property?

Since the sfp_xfi node does not have a vcc-supply or vcc link to this
regulator, and there is no always-on flag, won't the regulator framework
automatically disable it, leaving the 10G SFP module unpowered?

[ ... ]

> +	fan_controller: fan-controller@2f {
> +		compatible =3D "microchip,emc2301", "microchip,emc2305";
> +		reg =3D <0x2f>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +		#pwm-cells =3D <3>;
> +		status =3D "okay";
> +
> +		fan: fan@0 {
> +			reg =3D <0x0>;
> +			pwms =3D <&fan_controller 40000 PWM_POLARITY_INVERTED 1>;
> +			#cooling-cells =3D <2>;
> +			fan-supply =3D <&reg_pwm_fan>;
> +		};
> +	};

[Severity: High]
Is reg_pwm_fan guaranteed to be enabled to power the cooling fan?

While it is referenced via fan-supply in the fan@0 node here, the
microchip,emc2305 hardware monitor driver does not parse fan-supply or mana=
ge
regulators.=20

Without regulator-always-on in the reg_pwm_fan node, won't this regulator
remain permanently disabled, preventing the fan from operating?

[ ... ]

> +	/* IRQ pin is AON GPIO, not usable */
> +	ethphy0: ethernet-phy@0 {
> +		compatible =3D "ethernet-phy-ieee802.3-c22";
> +		reg =3D <0>;
> +		reset-gpios =3D <&expander3 0 GPIO_ACTIVE_LOW>;
> +		reset-assert-us =3D <500000>;
> +		reset-deassert-us =3D <50000>;
> +		ti,rx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,tx-internal-delay =3D <DP83867_RGMIIDCTL_2_50_NS>;
> +		ti,fifo-depth =3D <DP83867_PHYCR_FIFO_DEPTH_4_B_NIB>;
> +		ti,dp83867-rxctrl-strap-quirk;
> +		ti,clk-output-sel =3D <DP83867_CLK_O_SEL_OFF>;
> +	};

[ ... ]

> +	pinctrl_ethphy0: ethphy0grp {
> +		fsl,pins =3D <IMX95_PAD_PDM_BIT_STREAM0__AONMIX_TOP_GPIO1_IO_BIT9		0x1=
100>;
> +	};

[Severity: Low]
Is this pinctrl group missing a reference?

It defines pin configuration for the ethphy0 IRQ pin, but doesn't seem to be
referenced by the ethphy0 node (e.g., via pinctrl-0) or any other node.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260701082611.3126=
036-1-alexander.stein@ew.tq-group.com?part=3D1
