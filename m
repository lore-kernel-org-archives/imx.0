Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1825D45D180;
	Sat, 26 Sep 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432017; cv=none; b=FL3Bki7tgBNmQwAyZLU6tCTaqoY3IjQHasEdeHalk/ewIyC08RET4C6VRf6mWWm8feqPsJIjkJxhEFbwD4IS+opNy35+AmpYIDNCbZKDztJm4umqkBMwI4Fa08aZ5UnnuS3htcP+O6yt2Wa6AkEVHYy3NEmNQCJmCXFlb6sXubg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432017; c=relaxed/simple;
	bh=fxStw3xIb9qGoiIUwY+3FIcjywonXDaTDbi7XluifpA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fELp61h7uh334lKZBj5lNZoh9RTb3EXW7v2/gUdEa1mhS5vM8Ey/eax8cNxd8V/PcqYxtWi/qph2xpLElwE6zVa66Sfj7+RPZn+s4g8JHra0nbtPOezRL+HXW8WEh3tlDrBLOlxwkL9yzQbmElWzsPNr9MUA890X5sRbTDxpplQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kFkJpeoW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kFkJpeoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C2A31F00898;
	Sat, 26 Sep 2026 14:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432016;
	bh=J1TjBj5dYUk0fGvUBJSK05qe1BhPS6VoQzfEZ2s9Aa8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=kFkJpeoW7R5dWq0BHAnaTosJ3ODaxmmviocre7krpEfCPPol4FjjSN6u4VfxYf61A
	 VgUaFDgURouJtc9lggiQFw2dHk/VOGfqbPn7uFZQfMVy/uU6yDFc+CsVbWoRpIHWj1
	 6fGzXA4LG8MhQfDf9ETT+nlLYyPTPQiTsUa9E3zyyFQLhSihnOCrKb/HeZv8FRpw5u
	 J5opdkAqsxa85ui4y1gXlBIRv9y4vVc20UGWgnyZBXsrI4vCZGigwLzHzE2PcPZ9oI
	 O3mQT4oSj4BfeALwhVUssaYnFRuUJo6URNxZzUchS6QEpXcylquiMPIkWP94ViX/Oc
	 8/ZJUhdu0xUuQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 09/11] ARM: dts: imx6ull: Add Variscite i.MX6ULL
 board variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <e5ffc6fe5a38dbd9006ee07a496440c4d0e3dafc.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <e5ffc6fe5a38dbd9006ee07a496440c4d0e3dafc.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:35 +0000
Message-Id: <20260926141335.9C2A31F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: unreferenced reg_sd1_vmmc regulator in SD card overlays
--

commit 84f1f5ed8d2b37074235e31176f412cbd893a3be
Author: Stefano Radaelli <stefano.r@variscite.com>
Subject: ARM: dts: imx6ull: Add Variscite i.MX6ULL board variants

This patch adds i.MX6ULL board Device Tree Source files for the VAR-SOM-6UL
and DART-6UL platforms. It enables their respective carrier, storage, wirel=
ess,
and audio options. Shared option and carrier descriptions are reused with t=
he
i.MX6ULL SoC and module wrappers.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulc=
ustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6u=
lcustomboard.dts
> new file mode 100644
> index 0000000000000..ef75c773a5eed
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-dart-emmc-sd-card-6ulcustombo=
ard.dts
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
> +#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
> +#include "imx6ull-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"

[Severity: Low]
Is the reg_sd1_vmmc regulator meant to be assigned to the SD card controller
in this overlay?

Looking at the included imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi
file:

&usdhc1 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
	cd-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
	no-1-8-v;
	keep-power-in-suspend;
	wakeup-source;
	status =3D "okay";
};

The reg_sd1_vmmc fixed regulator is defined in that file but never assigned
to usdhc1 via the vmmc-supply property. This leaves the regulator
unreferenced and the hardware description incomplete.

[ ... ]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-conce=
rto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-conc=
erto-board.dts
> new file mode 100644
> index 0000000000000..8b43ab375592a
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-emmc-sd-card-concerto-boa=
rd.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ull.dtsi"
> +#include "imx6ull-var-som.dtsi"
> +#include "imx6ul-imx6ull-var-som-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-som-wm8904.dtsi"
> +#include "imx6ull-var-som-concerto-board.dtsi"
> +#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"

[Severity: Low]
Could vmmc-supply also be missing for the concerto board SD card overlay?

In the included imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi:

&usdhc1 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
	cd-gpios =3D <&gpio1 0 GPIO_ACTIVE_LOW>;
	no-1-8-v;
	keep-power-in-suspend;
	wakeup-source;
	status =3D "okay";
};

Similar to the dart board variant, reg_sd1_vmmc is explicitly defined but
is never assigned to usdhc1 here either.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D9
