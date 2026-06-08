Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0A1B3B3BF3;
	Mon,  8 Jun 2026 09:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780911282; cv=none; b=adwluCUJLkTHZ/7uhRjVmNnTWaBkQoz6YQquDwWdrMWIUO9oWDkRNrdf2D53gDiMguOizbvFB5it1TQaYC/Xj5Ef2Q0X9jdmuLc8iA5HT+HFwDFQ0zqgWkWtkYqEwb30qrlrXBSZVl9qlZ4qsIAPOtLCjZjCEciCuWuOvNzZa2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780911282; c=relaxed/simple;
	bh=zmPmS7lj4xpV/Z8Rr/Psc/0Y6WJ03STP7rex4DVGHuo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kmlxcZUQxcDZMyBBfqgxtBWoCzA5VrNYp/R7Eo+J58WIf+JGSBd/5JE7Pqol+pQF+aLY8Edq/hHCy7sJQcKiqo89UE71tN4lY1g4vr+XbAC+S1DRIbrQvBuOdTUU6C/PC0GYH1o9reNeQlcBZ6bYXuWsRUKn3ORlAXLU7gaQfDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTOwR/XW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTOwR/XW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF191F00893;
	Mon,  8 Jun 2026 09:34:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780911280;
	bh=84gvWU8V41jvTt7MFviVGMhAcjYtAVDiGiIPK1peWO4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=fTOwR/XWLFTCPFj99ohqpnZaWzG4WNCt6DS+7Ha7BuzoJ4hGotzQ3CsVr+Kq0P51U
	 nEU691c5ES0f7MqlwAxyWoT9yMF7+fhf63gNw6lXdS1RxuDkuXBmD/Vhjqob9X2ICR
	 XA/wk9lIj0OUHr4pRN54Ao6mG51va5NfXEOwrYzdk/boXBdkaGFBjN/9BpG3kW2EDu
	 UL6ZpMSljnlSwYn9nJmJ1L2PPlD3whIety+ocS3aySRyYjAd8F1bru63Wha8INtmjD
	 uVxTZMWTZGcKPw2E6NVqkH2VrpEY3uRu7s6RcvE4CuWiSn+FpivEVYz6epid8nUyGE
	 OC8rAe9EVcJEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mp-var-dart: Add support for
 Variscite Sonata board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org
In-Reply-To: <cf83cfcd94acc2e51289b09e92f946fdff0b5025.1780910435.git.stefano.r@variscite.com>
References: <cf83cfcd94acc2e51289b09e92f946fdff0b5025.1780910435.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 09:34:39 +0000
Message-Id: <20260608093439.9EF191F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Shared open-drain interrupts for PCA6408 GPIO expanders are incorr=
ectly configured as edge-triggered.
- [Medium] The `model` property incorrectly identifies the board as 'DART-M=
X93' instead of 'DART-MX8M-PLUS'.
- [Low] Regulator pinmux configuration is incorrectly placed in the consume=
r node.
- [Low] PTN5150 Type-C controller interrupt trigger level is incorrectly sp=
ecified as active-high.
--

commit 95bc444bf3e6a9d1e620e1258513ee415d198b04
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: arm64: dts: imx8mp-var-dart: Add support for Variscite Sonata board

This commit adds device tree support for the Variscite Sonata carrier board
equipped with the DART-MX8M-PLUS system on module. It includes configuratio=
ns
for peripherals such as Ethernet, USB, HDMI, and CAN.

Link: https://variscite.com/carrier-boards/sonata-board/

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts b/a=
rch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
> new file mode 100644
> index 0000000000000..4aa1545377191
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-var-dart-sonata.dts
> @@ -0,0 +1,716 @@
[ ... ]
> +/ {
> +	model =3D "Variscite DART-MX93 on Sonata-Board";

[Severity: Medium]
Should this model string be "DART-MX8M-PLUS" instead of "DART-MX93"?

The compatible strings, file name, and commit message all indicate this is =
an
i.MX8M Plus based board. Exposing "DART-MX93" to userspace via
/sys/firmware/devicetree/base/model could break provisioning scripts.

> +	compatible =3D "variscite,var-dart-mx8mp-sonata",
> +		     "variscite,var-dart-mx8mp",
> +		     "fsl,imx8mp";
[ ... ]
> +	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "VSD_3V3";
> +		regulator-min-microvolt =3D <3300000>;
> +		regulator-max-microvolt =3D <3300000>;
> +		gpio =3D <&gpio2 19 GPIO_ACTIVE_HIGH>;

[Severity: Low]
Should the pinmux for gpio2 19 be placed in this regulator node instead of =
the
usdhc2 consumer node?

The reg_usdhc2_vmmc fixed regulator uses gpio2 19, but its pinmux
configuration (MX8MP_IOMUXC_SD2_RESET_B__GPIO2_IO19) is placed in
pinctrl_usdhc2_gpio under the &usdhc2 node.

While the execution order might happen to mask this issue, the pin multiple=
xing
configuration for a GPIO should reside in the device node that requests it.

> +		enable-active-high;
> +		startup-delay-us =3D <100>;
> +		off-on-delay-us =3D <12000>;
> +	};
[ ... ]
> +	typec@3d {
> +		compatible =3D "nxp,ptn5150";
> +		reg =3D <0x3d>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_extcon>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <10 IRQ_TYPE_LEVEL_HIGH>;

[Severity: Low]
Should this interrupt trigger level be active-low (IRQ_TYPE_LEVEL_LOW) rath=
er
than active-high?

The PTN5150 uses an active-low, open-drain interrupt line (INTB). Configuri=
ng
it as active-high level-sensitive in the device tree contradicts the hardwa=
re
specification, even if the driver currently overrides it by requesting
IRQF_TRIGGER_FALLING explicitly.

> +
> +		port {
> +			typec_dr_sw: endpoint {
> +				remote-endpoint =3D <&usb3_drd_sw>;
> +			};
> +		};
> +	};
[ ... ]
> +	pca6408_1: gpio@20 {
> +		compatible =3D "nxp,pcal6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_pca6408>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;
> +	};
> +
> +	pca6408_2: gpio@21 {
> +		compatible =3D "nxp,pcal6408";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-parent =3D <&gpio1>;
> +		interrupts =3D <5 IRQ_TYPE_EDGE_FALLING>;

[Severity: High]
Should these shared open-drain interrupts be configured as IRQ_TYPE_LEVEL_L=
OW
instead of IRQ_TYPE_EDGE_FALLING?

Both pca6408_1 and pca6408_2 share the same interrupt line (gpio1 5). The
PCA6408 has an active-low open-drain interrupt output.

When multiple devices share an open-drain interrupt line, the controller mu=
st
be level-sensitive. If configured as edge-triggered, and the second chip
asserts its interrupt while the first chip holds the line low, the second
interrupt could be missed entirely.

> +	};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1780910435.gi=
t.stefano.r@variscite.com?part=3D3
