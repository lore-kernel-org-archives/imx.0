Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817823CFF6F;
	Tue, 29 Sep 2026 09:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674500; cv=none; b=QvqTAsPCdhRq8yU0/ZQPtcpgdAIfl9yKlzBcEsz+49v/in+BsZ8Mvk72RKEFKNWuz8UJyYeo4lbCPjkOyWR7OXnHfS2e5Bqft9aPRj+ogMU2uDOeqy7f6IggA7uJDOQ9zgaorJd7+4bJB33oaNCIDDbd4tkVLctw6uf+6FBds44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674500; c=relaxed/simple;
	bh=CYkMN7wpigkeBTDZfuR07jdkROqHbRtAu6nWG2UQUpE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LcO5zaRAQBXI00G6TFgmSLp8Ye0v8n17ZjYoB3IzcCREe4woJx8DiBb/pN4NmLZLv6vYQZFf4GN/kCDOFs6dtuuemeWfOWGQhLDGE8Q4oWfPrXyrRxfrju7ygvDcx8MJkqe89Y1yBHPMJKW4gbffdmkypn6m4esZkb5bbuuIhcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=j44ZNm1C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="j44ZNm1C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99CB21F000FF;
	Tue, 29 Sep 2026 09:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790674499;
	bh=he04A6P/a+QwEvc9RQDJBgRTA1nBWEO4azPCiVTjpig=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=j44ZNm1C342PQEM4Mlc6sTYkMOQ9Z77CRwD5ojnWdqRUyd4uMhhzcppbfbn8y9qpf
	 Wt2qMZTSItSO3di8xCS4HX4Z4m4avPv92VXNbgThDcf8xlY096qZDya/VBoy4ymGvp
	 lfAY95jinobQWoYujxhGDM+gPijb7Bf4pA67M5kFlsdwVk1beuvBgxUAcmC97LK3b2
	 1J6TIAbWgyDH057w98yE2mI9vKKX1jc4OvlxP0ont36P0hE0WCYOWBXgOsi2cXOCOt
	 NIJOtvsfVdM7WomlzGNLg6x9rcYjmVEPA7fI0CqBEx6tRXpm4g+U3DFOeJFbG8bzDO
	 OkP2lXFsKgbcA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] arm: dts: nxp: imx: Add devicetree files for M48
Reply-To: sashiko-reviews@lists.linux.dev
To: "Petko Manolov" <petko.manolov@konsulko.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260929091811.3735201-3-petko.manolov@konsulko.com>
References: <20260929091811.3735201-1-petko.manolov@konsulko.com>
 <20260929091811.3735201-3-petko.manolov@konsulko.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 09:34:58 +0000
Message-Id: <20260929093458.99CB21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 6 potential issue(=
s) to consider:
- [High] pinctrl: out-of-bounds write in imx_pinctrl_parse_pin_mmio()
- [Medium] dts: fsl,dual-channel placed in wrong node breaks lvds
- [Medium] dts: fsl,default-data-width causes imx-ldb probe failure
- [Low] dts: missing imx6qdl-draeger-m48-u-boot.dtsi causes build failure
- [Low] dts: syntax error and U-Boot vars in unused LEGACY_BOOT block
- [Low] dts: missing imx6qp-draeger-m48.dtb in Makefile
--

commit 2139bbcf28ec3b0fa1c415a8208562a20f0a76c4
Author: Petko Manolov <petko.manolov@konsulko.com>

arm: dts: nxp: imx: Add devicetree files for M48

This patch adds device tree files for Draeger M48 boards, supporting both
i.MX6Q and i.MX6DL variants. It introduces board-specific configurations,
pinctrl settings, and LVDS display timings.

> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/i=
mx/Makefile
> index 1a2539fa19b44..44b3932562358 100644
> --- a/arch/arm/boot/dts/nxp/imx/Makefile
> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> @@ -220,6 +220,8 @@ dtb-$(CONFIG_SOC_IMX6Q) +=3D \
>  	imx6q-dmo-edmqmx6.dtb \
>  	imx6q-dms-ba16.dtb \
>  	imx6q-ds.dtb \
> +	imx6q-draeger-m48.dtb \
> +	imx6dl-draeger-m48.dtb \

[Severity: Low]
Does this omit imx6qp-draeger-m48.dtb? This patch introduces
imx6qp-draeger-m48.dts, but it is not hooked up to the build system here, so
it will be silently ignored.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6dl-draeger-m48.dts
> new file mode 100644
> index 0000000000000..45809770d16f3
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6dl-draeger-m48.dts
[ ... ]
> +/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0=
x80000000
> + * PAD configuration register must not be 0, so it is set to 0xfff
> + */
> +#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x768 0xfff 0x000 0x000=
C0000 0x0
> +#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x788 0xfff 0x000 0x000=
00200 0x0

[Severity: High]
Does this out-of-bounds mux_reg value (0x768) cause an out-of-bounds write
in imx_pinctrl_parse_pin_mmio()?

When imx_pinctrl_parse_pin_mmio() divides this mux_reg by 4, it calculates
pin_id as 474. Writing to the dynamically allocated ipctl->pin_regs array
with this index overflows its bounds, leading to an out-of-bounds heap write
that can corrupt kernel memory during device tree parsing.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts b/arch/arm/b=
oot/dts/nxp/imx/imx6q-draeger-m48.dts
> new file mode 100644
> index 0000000000000..1266b8451fa15
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6q-draeger-m48.dts
[ ... ]
> +/* PAD config disabled in imx6qdl-draeger-m48.dtsi by setting value to 0=
x80000000
> + * PAD configuration register must not be 0, so it is set to 0xfff
> + */
> +#define MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII        0x790 0xfff 0x000 0x000=
C0000 0x0
> +#define MX6QDL_PAD_CTL_GRP_RGMII_TERM            0x7ac 0xfff 0x000 0x000=
00200 0x0

[Severity: High]
Similarly, does this mux_reg value (0x790) evaluate to an out-of-bounds
pin_id of 484 in imx_pinctrl_parse_pin_mmio(), resulting in another
out-of-bounds array write?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi b/arch/ar=
m/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
> new file mode 100644
> index 0000000000000..bcfe7b2556cbd
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-draeger-m48.dtsi
[ ... ]
> +		pinctrl_m48_enet: enetgrp {
> +			fsl,pins =3D <
[ ... ]
> +				MX6QDL_PAD_CTL_GRP_DDR_TYPE_RGMII 0x80000000
> +				MX6QDL_PAD_CTL_GRP_RGMII_TERM 0x80000000
> +			>;
> +		};

[Severity: High]
Applying these macros in the fsl,pins property forces the pinctrl-imx driver
to parse the out-of-bounds pin IDs mentioned above.

[ ... ]
> +	lvds-channel@0 {
> +		fsl,data-mapping =3D "spwg";
> +		fsl,default-data-width =3D <24>;

[Severity: Medium]
Will this cause the imx-ldb driver probe to fail?

The imx-ldb driver strictly looks for fsl,data-width in
of_get_bus_format(). Since it is missing, it defaults to 0, which does not
match any valid mapping in imx_ldb_bit_mappings, returning -ENOENT and
causing the driver probe to fail.

> +		status =3D "okay";
> +
> +		display-timings {
> +			native-mode =3D <&timing0>;
> +
> +			timing0: 1920x1080-32@60 {
> +				fsl,dual-channel;

[Severity: Medium]
Does placing fsl,dual-channel inside the display-timings/timing0 subnode
break LVDS output?

The imx-ldb driver reads the fsl,dual-channel property from the top-level
LDB node (lvds-channel@0), not from the timing subnodes. Without it at the
correct level, the LDB will remain in single-channel mode.

[ ... ]
> +	config {
> +		#ifdef LEGACY_BOOT
> +		bootcmd =3D "startM48;errorMsg";
> +			bootcmd =3D "startKernel;errorMsg";
> +		#endif
> +
> +	};

[Severity: Low]
Does this unused LEGACY_BOOT block contain invalid device tree syntax?

If LEGACY_BOOT were defined, this would fail to compile due to a duplicate
property name error for bootcmd. Also, U-Boot variables normally do not
belong in the Linux device tree.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts b/arch/arm/=
boot/dts/nxp/imx/imx6qp-draeger-m48.dts
> new file mode 100644
> index 0000000000000..ab331596abd98
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6qp-draeger-m48.dts
[ ... ]
> +#include "imx6qdl-draeger-m48.dtsi"
> +#include "imx6qdl-draeger-m48-u-boot.dtsi"

[Severity: Low]
Will this unconditionally cause a build failure?=20
imx6qdl-draeger-m48-u-boot.dtsi is missing from the patchset and the
mainline tree.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929091811.3735=
201-1-petko.manolov@konsulko.com?part=3D2
