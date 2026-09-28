Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BFA3CDBA5;
	Mon, 28 Sep 2026 12:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600260; cv=none; b=JQSuT+nGuwc1zx60hbCsIuPVlp0nNCKDhybYMdmN39Q/i6wofpnFQjvwQ4x5KDDMiE4Adfkc/rhXptqAau274NIL+rH9dXAMOaMo2XEKJZfd8dLHVzVUDknAO+5KEoGb6X4O+MCKrAHZuLIx35YlwZxZzjpvbypLCDcLUzmCK/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600260; c=relaxed/simple;
	bh=wY48fprBmxFUjGixhY8e8QbNM62AskOVZKVRxdR/1n8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AEFEe9zzTV4ifmB3XHTE33PQf49eI6kIAJCOwlMbQCfxL+9EW8GPKnw83zM+TanrC+z4XnsMx2VAYIXXrKey8lJjFJGI7dHt6LT+WjDoN11ry0U3+zDAQUPtRY4FPr57gWR4CNvmZk0ecW417NcovY9ekSesUOb8997fYhPgExA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gRTC27O3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gRTC27O3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077401F00899;
	Mon, 28 Sep 2026 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600258;
	bh=DQ3HqYrdLfB6HzLeMYtVHNklz6xWNLiz6dwKaV337Qk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gRTC27O3kY/ZLtc2ejuuhaDkK6jqYKGTvz3T33EVDToECRtKZ2ZPznv0lY3KNyp9m
	 hXBxUUtK2Gn26bgRzSN+x/kosIlbtwHxTaO6lhzhsDWRy6XyrevyB7styi44DfHEmI
	 VlM0nWl9iwtBXac+pY4un0orTnHk0LNVZO931hZythxy7G8z57wTSLqHDpFsg/Ln7z
	 eUCV2mQnTQ2AFYCGsVzw4Hv/m6uNnKCvwBhTT204OzFlCWO/0AdZxSrkqrdJ9phy91
	 0EXp2+74h5R5nE+aquYBkeG6+0lAJ/n97KOx9yd4OFVVQJxRnli0Kb1BBnlHruervs
	 qCr0aIYC2QvfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/12] ARM: dts: imx6ull: Add Variscite i.MX6ULL
 board variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <a9c46d096a221302c3a775ec456f104acffc161c.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <a9c46d096a221302c3a775ec456f104acffc161c.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:37 +0000
Message-Id: <20260928125738.077401F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] dts: imx6ull: mismatch between WIFI_PWR_EN gpio and pinctrl in i=
w61x
--

commit 7ecb2605fbe6b95010bccb212ceb09c1b978e781
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants
   =20
Add i.MX6ULL board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Reuse the shared option and carrier descriptions with the i.MX6ULL
SoC and module wrappers.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6=
ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw=
61x-6ulcustomboard.dts
> new file mode 100644
> index 0000000000000..26d266d731fb8
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-wifi-iw61x-6ulcusto=
mboard.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull.dtsi"
> +#include "imx6ull-var-dart.dtsi"
> +#include "imx6ul-imx6ull-var-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-wifi-iw61x.dtsi"

[Severity: Medium]
Does the combination of these included files create a pinmux conflict that
breaks WiFi power control?

The iw61x WiFi power sequence requests GPIO5_IO02 for WIFI_PWR_EN:

arch/arm/boot/dts/nxp/imx/imx6ul-imx6ull-var-wifi-iw61x.dtsi:iw61x_pwrseq {
		reset-gpios =3D <&gpio5 6 GPIO_ACTIVE_LOW>, /* WIFI_RESET */
			      <&gpio5 2 GPIO_ACTIVE_LOW>; /* WIFI_PWR_EN */
}

But the associated pinctrl_wifi group in the DART module wrapper configures
GPIO5_IO04 instead of GPIO5_IO02:

arch/arm/boot/dts/nxp/imx/imx6ull-var-dart.dtsi:pinctrl_wifi {
		fsl,pins =3D <
			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0
			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029
		>;
}

Because of this mismatch, the requested GPIO5_IO02 is never properly pinmux=
ed,
and the configured pad is never toggled. Will this cause the IW61x WiFi
module to fail to power on during the usdhc1 probe?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D10
