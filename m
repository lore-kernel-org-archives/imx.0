Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE71913AF2;
	Sun, 13 Sep 2026 12:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789303551; cv=none; b=a7FBB7wwpNtdA9emaCbf7gxIoE/u5HTvBxq8PUD1pqUyP9cRYD8e9IPrfobJXS+ulTJLVuzERECIuhaz+MhbSJzmOFGbqr842vmf+1puqsTQJpiQ1bfVXRsN3WxrNm3+ZF3QrzXgQm8YIM2HCWKWfQpI6XF95H1RuP14PSXA9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789303551; c=relaxed/simple;
	bh=AnYS/XrchJnWV2VpfkBtJrqZXHbc7SxHCuaXiyFKdhg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TAaYPtc9yTDvkghoYlAqIHsivWeeP28bipn9qu/v+FIM/O1jl+cTwsISpkGOfWXA0dCg69xWdBJJX9ubwM7R4N1nHnwECvnHJiR4G4xPMetiycjeblF62feFdKc0IYNzZd4T/Zjk9oh+enWTuJseQ9YqmDY9cQGWXr1k+B/67JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m5ZJubQn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m5ZJubQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB021F000FF;
	Sun, 13 Sep 2026 12:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789303549;
	bh=Xxhgae4jYlfXEztqihk14JMUo8mg7eY8qU4eItI5siA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m5ZJubQn+142NK+03RA67o9/ri3wEqAMReeLSjynRKUtdk/9s2wjpCyXa65qnt6St
	 2PdPl7qhBZKiXHKpzpL+Esz40vWp2zRj3puLeRwxsFiOJHKGM7W/G2j/PMdevmkC30
	 CW3irR7hFUBXLSkptbzQ02uJSKw4XbgUvhq12FhCSsJbsxsqokx+c29FG/OLVdj2q3
	 R0PqmbEQPwge+W9TfxdC1/1SWPJjgA3dqjYbmTqRgIDHJpHtE31bCJuUjBSGpBenIu
	 8Bf6ij3hAj85Gvi3owgfbfWmNVFURW7sxiibSz1PjvSbCqgJNR455+ofDtpqOwjt+r
	 Z6+KgN2aC22aQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: freescale: add Nodebox v3 CPU Module
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260913-for-upstream-nbxv3-dts-v6-3-058566b93ba1@free.fr>
References: <20260913-for-upstream-nbxv3-dts-v6-0-058566b93ba1@free.fr>
 <20260913-for-upstream-nbxv3-dts-v6-3-058566b93ba1@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 12:45:48 +0000
Message-Id: <20260913124548.EBB021F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Medium] Ethernet PHY nodes lack 'interrupts' and 'reset-gpios' propertie=
s despite physical lines being explicitly defined on the board.
- [Medium] Regulator polarity mismatch for `ethsw-mdio-en`.
- [Low] Duplicate GPIO line name `usb01-oc#` in `gpio3` controller.
- [Low] Missing Devicetree binding documentation for the new board compatib=
le.
--

commit 8433b3c3d1e5258b1e8b5fc1b405c85d777065d4
Author: Vincent Jardin <vjardin@free.fr>

arm64: dts: freescale: add Nodebox v3 CPU Module
   =20
The Nodebox v3 is a Free Mobile CPU module built around the NXP
LX2160A (16x Cortex-A72, DPAA2).

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts b/arch/a=
rm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
> new file mode 100644
> index 0000000000000..cc02204e9d1b4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dts
[ ... ]
> +/ {
> +	compatible =3D "freemobile,nbxv3", "fsl,lx2160a";

[Severity: Low]
Are the devicetree bindings for this new board compatible string documented?

New compatible strings must be documented to pass make dt_binding_check
validation, but this patch does not appear to include the required updates
to the Devicetree bindings documentation.

> +	model =3D "Free Mobile Nodebox v3 CPU Module (LX2160A)";
> +};
> +
[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi b/arch/=
arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
> new file mode 100644
> index 0000000000000..ca4fb5329c0b2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-nbxv3.dtsi
[ ... ]
> +	gpio-restart {
> +		compatible =3D "gpio-restart";
> +		gpios =3D <&gpio1 8 GPIO_ACTIVE_LOW>;
> +		priority =3D <128>;
> +	};
> +
> +	reg_ethsw_mdio: regulator-ethsw-mdio {
> +		compatible =3D "regulator-fixed";
> +		gpio =3D <&gpio3 25 GPIO_ACTIVE_LOW>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-name =3D "ethsw-mdio-en";

[Severity: Medium]
Is ethsw-mdio-en truly an active-low signal?

The reg_ethsw_mdio regulator specifies GPIO_ACTIVE_LOW and regulator-always=
-on.
The kernel gpiolib will apply a logical-to-physical inversion, driving the
physical pin to 0V.

However, the board's strict naming convention uses a '#' or '-b' suffix for
active-low signals (e.g., ethsw-reset#, usb01-oc#). The absence of this
suffix on ethsw-mdio-en strongly implies it is an active-high signal. If it
is active-high, driving it low will erroneously disable the MDIO bus to the
Ethernet switch.

> +	};
> +};
> +
[ ... ]
> +&emdio1 {
> +	status =3D "okay";
> +
> +	/* Microchip LAN8023 dual 10G PCS/retimer, Clause 45 only, one address =
per slice */
> +	lan8023_phy_s0: ethernet-phy@2 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <2>;
> +	};

[Severity: Medium]
Should this node include the interrupts and reset-gpios mappings?

The lan8023_phy_s0 node omits the interrupts (lan8023-mdint) and reset-gpios
(lan8023-rst) mappings, even though these physical lines are explicitly
defined on the board.

Without the interrupts property, the kernel's PHY state machine is forced to
use inefficient polling mode instead of hardware interrupts, increasing CPU
overhead and latency.

Missing the reset-gpios property prevents the kernel from managing the PHY
reset lifecycle. If the I2C expander (u800) initializes to a state that hol=
ds
the PHYs in reset, the PHY probe will fail completely.

> +
> +	lan8023_phy_s1: ethernet-phy@3 {
> +		compatible =3D "ethernet-phy-ieee802.3-c45";
> +		reg =3D <3>;
> +	};
> +
> +	rtl8211fd: ethernet-phy@6 {
> +		compatible =3D "ethernet-phy-id001c.c916";
> +		reg =3D <6>;
> +	};

[Severity: Medium]
Similar to the lan8023_phy_s0 node, should this node include the interrupts
mapping?

The rtl8211fd node omits the interrupts (u1300-rtl8211fd-int#) mapping.
Missing this also forces the kernel to use polling mode for the PHY state
machine.

> +};
[ ... ]
> +&gpio3 {
> +	gpio-line-names =3D
> +		"altfn:ec1-txd3", "altfn:ec1-txd2",
> +		"altfn:ec1-txd1", "altfn:ec1-txd0",
> +		"altfn:ec1-tx-en", "altfn:ec1-gtx-clk",
> +		"altfn:ec1-rxd3", "altfn:ec1-rxd2",
> +		"altfn:ec1-rxd1", "altfn:ec1-rxd0",
> +		"altfn:ec1-rx-clk", "altfn:ec1-rx-dv",
> +		"", "",
> +		"ptp-refclk-in",
> +		"", "", "", "", "", "", "", "",
> +		"u1700-zl30733-pps-out",
> +		"",
> +		"ethsw-mdio-en",
> +		"usb01-oc#",	/* USB1_PWRFAULT and USB2_PWRFAULT share one net */
> +		"",
> +		"usb01-oc#",

[Severity: Low]
Are these duplicate line names intentional?

Device tree GPIO line names must be unique within a controller. Defining
usb01-oc# twice causes ambiguity; any in-kernel consumer or userspace tool
(via libgpiod) attempting to lookup the GPIO by name will only ever match
the first occurrence.

This violates DT schema rules and makes the second pin inaccessible by name.

> +		"altfn:spi3-sck",
> +		"", "";
> +
> +	status =3D "okay";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913-for-upstre=
am-nbxv3-dts-v6-0-058566b93ba1@free.fr?part=3D3
