Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D057383330;
	Mon, 11 May 2026 22:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778538575; cv=none; b=Zdo67acJF0oQbHKeZyMRU4237mXBpG0h7SY8dJFUYu/9FRM3vPR9p/Amiem/8BigTrrsxG6qfXew6bBpinkRNVCg7VWEfH/ww/3+Dl0QcwdqKvmcgSgXXPnPgvjGxKrANNK+npbG0V8Hw4FM4vqI4ktV1EJsGrv0X60NYjYsUf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778538575; c=relaxed/simple;
	bh=T5vegv+Ra1BOiQM6FZTVswz7GcOGymlwn93D9cWZuPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=OSMVaRHC3NYt0aZ/rjqi2m8R6j1MAz9/o+UIrF6uO+ba5jogtgxZerHaM4ZB+EuakuGU7RhYQHODBAJH4TCuavV+lB92D141bpdDYZZbK8T+Anw3aQtOFDHo0f6Xs9DBlXVmLlirpNL4FjSJQ9A+O1d3mki2y2mo0S1qtiOsGfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGTvrvGu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGTvrvGu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91EA4C2BCB0;
	Mon, 11 May 2026 22:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778538574;
	bh=T5vegv+Ra1BOiQM6FZTVswz7GcOGymlwn93D9cWZuPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=QGTvrvGuetfkPe3IxMSvHoBfwKkMp+pQx/GJnMAQe4bq1G/BftU+5D+FRlMpibMX+
	 9SG9qncijfUZaVr9EJNI9C4lKGfUzM/YLvXwRTknkwUDrR0jUo3you+sh7mq6TqC8m
	 IG58yk3P8Fio1CpK2wz+JmXWq9vq/saDirluUATdNbr0Wcu/VWRoAGnEXM9OLiN5P7
	 tlhShPNZ2vxVXpy85YSOx5hLUEdg4bX64vJmjHVa1d9U0jHXkNilmIEv8FRceriY33
	 KcRDaJXg0XV7KgqvAQShQuuID3M3Xw3RD4huJcgsmb7PTcFolIPXbSXNYrVyJyEzQQ
	 cOKZQkv8a7b9g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 10/10] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Reply-To: sashiko@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20260510-lx2160-pci-v5-10-540b83852227@solid-run.com>
References: <20260510-lx2160-pci-v5-10-540b83852227@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 11 May 2026 22:29:33 +0000
Message-Id: <20260511222934.91EA4C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Undocumented and unrelated SoC revision change for the Clearfog CX=
 board.
- [High] The PCI-E OCP card connector is not enabled in the device tree.
- [Low] Duplicate `function-enumerator` value in the SFP LED definitions.
- [Low] The `dpmac` nodes referenced as LED `trigger-sources` lack the mand=
atory `#trigger-source-cells` property.
- [Low] The `gpio-mux` configured for PWM fan monitoring has no label and n=
o consumer node.
--

commit e131b341e534ec21c95289bd4bedcef8bb6fcf54
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: Add support for LX2160 Twins board in single configuration
   =20
This commit adds support for the SolidRun LX2160A Twins board in its
single CPU configuration. The board features several connectors including
SFP, PCIe OCP, USB-3.0, and microSD.

> - PCI-E OCP card connector

The commit message explicitly lists the PCI-E OCP card connector as a
supported feature. However, looking at the device tree, are there any PCIe
host controller nodes enabled?

All PCIe host controller nodes default to disabled in the base SoC device
trees, and this device tree doesn't seem to override their status to "okay".

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts b/=
arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> index 802d7611c6479..6078ce47fabf1 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-clearfog-cx.dts
> @@ -6,7 +6,7 @@
> =20
>  /dts-v1/;
> =20
> -#include "fsl-lx2160a.dtsi"
> +#include "fsl-lx2160a-rev2.dtsi"

Does this commit intend to change the SoC revision for the Clearfog CX boar=
d?

This hardware definition change is not documented in the commit message.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/a=
rch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
> new file mode 100644
> index 0000000000000..434b3f4873008
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts

[ ... ]

> +	leds {
> +		compatible =3D "gpio-leds";

[ ... ]

> +		led_ht_c3_bb: led-sfp-2 {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "off";
> +			function =3D LED_FUNCTION_LAN;
> +			function-enumerator =3D <2>;
> +			gpios =3D <&expander3 13 GPIO_ACTIVE_LOW>;
> +			trigger-sources =3D <&dpmac15>;
> +			linux,default-trigger =3D "netdev";
> +		};
> +
> +		led_ht_c3_at: led-sfp-3 {
> +			color =3D <LED_COLOR_ID_GREEN>;
> +			default-state =3D "off";
> +			function =3D LED_FUNCTION_LAN;
> +			function-enumerator =3D <2>;

Does this node have a duplicate function-enumerator?

It shares the same value as the preceding led_ht_c3_bb (led-sfp-2) node.

> +			gpios =3D <&expander3 11 GPIO_ACTIVE_LOW>;
> +			trigger-sources =3D <&dpmac6>;

Do the referenced dpmac nodes lack the #trigger-source-cells property?

According to the standard LED trigger-source binding, any provider node must
define this property. The base dpmac nodes in fsl-lx2160a.dtsi do not appear
to define it.

[ ... ]

> +	mux-controller {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		/*
> +		 * This gpio controlled mux can route the tacho signals of 6 PWM FAN c=
onnectors
> +		 * to the tacho inputs of both CEX-7 modules (twins).
> +		 *
> +		 * The first twin controls this mux and monitors four fan connectors, =
two intended
> +		 * for itself, and two for the OCP card.
> +		 *
> +		 * The second twin monitors only two fan connectors intended for itsel=
f.
> +		 *
> +		 * The table below maps selector GPIO states to monitored fan connecto=
r per twin:
> +		 *
> +		 * | SEL1 | SEL0 | Twin 1 | Twin 2 |
> +		 * | ---: | ---: | :------| ------ |
> +		 * |    0 |    0 | J10    |  J5024 |
> +		 * |    0 |    1 | J5016  |  J5024 |
> +		 * |    1 |    0 | J5026  |  J5025 |
> +		 * |    1 |    1 | J5013  |  J5025 |
> +		 */
> +		mux-gpios =3D <&expander0 8 GPIO_ACTIVE_HIGH>, /* SEL0 */
> +			    <&expander0 15 GPIO_ACTIVE_HIGH>; /* SEL1 */
> +	};

Is this mux-controller missing a label and a consumer node?

There are no hwmon, fan, or other consumer nodes defined that reference it.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260510-lx2160-pci=
-v5-0-540b83852227@solid-run.com?part=3D10
