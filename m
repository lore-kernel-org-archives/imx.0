Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793778301;
	b=JzCKKSr1vDFY3sHN52245Y8fN5pHEdQWZsZrTrjpuHpcwzx01U5PI/PrhEMK6HRc2hhr
	 FunxT8toRf1cp7XOISQtwMYXm1ai+FOObeVZhVeq3ZkX2R8EtiDtebG+4/hG/UU4LK0kj
	 pB+ZStYCLW5tBlzGLXEb+hf+7JA44AymZcdT3+gXJxwJOWDMNclQmNQx7iOGCnpo5i9UE
	 SHZhcWRXiNlQchzMWEQvr9oAm1onNAaTaXm1HOjSCyM3xaC+y7N9iayvwhq0wBmImuIe4
	 porvPrCQGAW43c89ywz0gRe8m+bSxR+gyU2+6ua4NncYnmdDoUXVJTS2KrX0j4803Ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793778301;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=4fuNnC1DDeWxJkYi31++QJKHXfqs82XVPOtJBjji4pg=;
	b=VCz8btCWouChTu9GQRx/VnqRHUC5LDRcAdRxn6KBagPFnFYyKu8m93m4yGnC9EWX8b4X
	 c+APxOA8GA9il6su1FqbfvY+j1zQobxq60GpPVu7jTFRLx+8V5xL+aa9Xms5bjAIs1+Xo
	 WBj1bd/UWcVOheluTks+wk9Ym6I6uRMvtcG5S9tf+N3OjiCEAbI7ofvhVBtn/GKynZ+i7
	 Yd/G2D11RwEiqiWkC0RV0cn36pIDeRLu0tpkwaZhgnlQfvWnxJ7tQCAtq8xyPl4m8+RPV
	 VjKbSz6r24nIzYBlMeU3l8kXruqcXfHL7sgoWEFRIL4+MHUG9kyLT+3uZCXdcbFuWnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs6Vuxv4;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D74606A31B;
	Wed,  4 Nov 2026 07:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cs6Vuxv4
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D41441F000C1;
	Wed,  4 Nov 2026 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793778300;
	bh=4fuNnC1DDeWxJkYi31++QJKHXfqs82XVPOtJBjji4pg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cs6Vuxv4Z38+rWQqTs5IFczijnniUwFhK60EGd+Z1qNfF+fZf0bKdtvoKQ+LiaTW6
	 lCgAHSaoW5kZHvp/S9ofYpQzs733HgR2GKs4keYOumOzv/zrLQzl+WybJa0esZ87sl
	 jMC+vvq88yXQds0sMUMOzFHJa8EGBGiZ8sYtuMAHTjro7yIN3Q5VGQRq3xUfqpuaso
	 6OM0kGxst0xrBWQtMOC7MULbRuU1uVvzLmCiod33ht/LRR44re+dSG2lIqgMAt3FRB
	 +yADYljuHR6AIrol7LY95Q+aW+96WK42sjwxvWOy1n029hJAI69elsSbfmHcf8eoMG
	 3gKnWsWxEdilA==
Message-ID: <sashiko-outbox-196815@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 07/10] ARM: dts: imx6ulz: Add BSH SMM-M2B board support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Haoning Cheng" <Haoning.CHENG@cn.bosch.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261104-add-bsh-smm-m2-v1-7-369f0a77e021@cn.bosch.com>
References: <20261104-add-bsh-smm-m2-v1-0-369f0a77e021@cn.bosch.com>
 <20261104-add-bsh-smm-m2-v1-7-369f0a77e021@cn.bosch.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 07:44:59 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ARM: dts: imx6ulz: orphaned usdhc2_pwrseq claims GPIO2_IO21 on S=
MM-M2B
--

commit c962f6331220298bd138ac7db3207348f699e289
Author: Qiu Guochang <guochang.qiu@cn.bosch.com>

ARM: dts: imx6ulz: Add BSH SMM-M2B board support

This commit adds device tree support for the BSH SMM-M2B SystemMaster board=
 by
including the common imx6ulz-bsh-smm-m2-common.dtsi definitions and setting
the board model and compatible strings.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts b/arch/arm=
/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
> new file mode 100644
> index 0000000000000..9dc92da6ace97
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2b.dts
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2021 BSH Hausgeraete GmbH
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ulz-bsh-smm-m2-common.dtsi"
> +
> +/ {
> +	model =3D "BSH SMM M2B";
> +	compatible =3D "bsh,imx6ulz-bsh-smm-m2b", "fsl,imx6ull", "fsl,imx6ulz";
> +};

[Severity: Medium]
Does including imx6ulz-bsh-smm-m2-common.dtsi leave an active usdhc2_pwrseq
platform device on the BSH SMM-M2B that claims and drives GPIO2_IO21 even
though usdhc2 and its pinmux are not present on this variant?

In arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2-common.dtsi, the root node
unconditionally defines:

	usdhc2_pwrseq: usdhc2-pwrseq {
		compatible =3D "mmc-pwrseq-simple";
		reset-gpios =3D <&gpio2 21 GPIO_ACTIVE_LOW>;
	};

However, the consumer &usdhc2 node and the pinctrl_wlan group that muxes
MX6UL_PAD_SD1_DATA3__GPIO2_IO21 only exist in
arch/arm/boot/dts/nxp/imx/imx6ulz-bsh-smm-m2.dts:

	pinctrl_wlan: wlangrp {
		fsl,pins =3D <
			...
			/* WL_REG_ON */
			MX6UL_PAD_SD1_DATA3__GPIO2_IO21		0x3029

When booting with imx6ulz-bsh-smm-m2b.dtb, the platform bus still populates
/usdhc2-pwrseq and drivers/mmc/core/pwrseq_simple.c:mmc_pwrseq_simple_probe=
()
executes:

	pwrseq->reset_gpios =3D devm_gpiod_get_array(dev, "reset",
						   GPIOD_OUT_HIGH);

This requests GPIO2_IO21 and drives it low as an active-low reset output
without its pad being muxed to GPIO2_IO21 and with no enabled usdhc2 consum=
er.

Should usdhc2_pwrseq be moved into imx6ulz-bsh-smm-m2.dts alongside &usdhc2
and pinctrl_wlan, or disabled/deleted in imx6ulz-bsh-smm-m2b.dts?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104-add-bsh-sm=
m-m2-v1-0-369f0a77e021@cn.bosch.com?part=3D7
