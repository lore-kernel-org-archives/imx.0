Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407D83BE632;
	Sun, 27 Sep 2026 11:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507183; cv=none; b=oABujExA5t50VDZxh4n6hlVAq+8Roe8OLdNVS80yPDSPd1BuDJE9bdWJkfXLZT9qzylkttmpp/9plnZQEDBRbKqktl491cTPFTbpmn9Ly3fEelHULu+CNo61N+07vmQjW5lgaKfEsQv+uFNKKRse/RNypUxIgZvpXXEwdkNO7vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507183; c=relaxed/simple;
	bh=fRHi6u/GtL2+FFqHV8zPj6RfakwHd1NnwgHxBi1AD5I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=l+mHrEkXZMF9Nlf6hfvlVGdXBVDP21M6q97uDlevRdSPQacYAQOCvQhI0NmD4X6ooTfgd1RAJFBz1RMAywqSSV5bNLRWJGiX6nHyQ+lWJQZPq05xOqx6e35q4oVFd1McJa7nKUAW0UWLVdjsRpJirA3YFBx5HVT+2HuYwrdkJHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MW3axWI0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MW3axWI0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C58381F00893;
	Sun, 27 Sep 2026 11:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507182;
	bh=EiEn43o7sxEBzNKmYbDoJKc28seCyKpdfFH5qyZoklg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MW3axWI0d34IQcoL5wSDOLPLTdWHEeSNiE93DOXS9a30VoZk/qpnXDlC3MMhKVlie
	 tRsQKcvHzr8wp9Dy9uzkIGWFc0THqwtPDvHSBuHr+RrXFk/o+Gn8qMiZEd4v1CcKR/
	 KrnEHpgdm8epT9Mc/2Olq+cW9SyecdSrPpPVklbZSumKYmoscdVQPDOwdvKyiH/Kc8
	 gMxmj1QE4gL3dVG/UXbeolx6G9uU6BJOy2sljOHoPZVxZd5dO2hNE+9NWnFL+tJnI/
	 JAJhLw32tFX67JHeR50dT+d/2sBQphMgM686FBjE1XTk+KCFR4JOsA8Nj1ktDL5omT
	 QmoopfsMCAKkA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/11] ARM: dts: imx6ul: Add Variscite i.MX6UL board
 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <922112972b24b8266f5d6323ff670424c1ced3db.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <922112972b24b8266f5d6323ff670424c1ced3db.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:21 +0000
Message-Id: <20260927110621.C58381F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: combinatorial explosion of board variants instead of dt overlays
--

commit 43bde4408af702619bbd79aa5184aabeb1e39f18
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite i.MX6UL board variants

Add i.MX6UL board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Compose each board description from the shared module, option and
carrier DTSI files added earlier in the series.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcu=
stomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulc=
ustomboard.dts
> new file mode 100644
> index 0000000000000..74b2ca1895c27
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboa=
rd.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ul.dtsi"
> +#include "imx6ul-var-dart.dtsi"
> +#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
> +#include "imx6ul-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
> +
> +/ {
> +	model =3D "Variscite DART-6UL with i.MX6UL, eMMC, SD card & WM8904 supp=
ort on VAR-6ULCustomBoard";
> +	compatible =3D "variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard",
> +		     "variscite,dart-6ul-imx6ul",
> +		     "fsl,imx6ul";

[Severity: Low]
Adding 90 top-level .dts files across the series to represent every possible
hardware permutation of storage, Wi-Fi, and audio modules creates an immense
maintenance burden, clutters the tree, and inflates the build configuration.

Instead of generating 30 distinct .dts files per SoC variant and embedding
component states (e.g., emmc-sd-card-wm8731) into the base machine
compatible property, standard modern Device Tree practice dictates defining
a base machine board and using Device Tree Source Overlays (.dtso) for
optional component variants.

Overloading the root compatible string with highly specific peripheral
configuration details appears to be an abuse of the machine identity
property.

Could this combinatorial explosion of board variants be avoided by using
device tree overlays?

> +};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D8
