Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D1937DE9F;
	Sun, 27 Sep 2026 11:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790507184; cv=none; b=T07kZZnutGxnmgF0SWZJbUnpCrfre2tyA03uRX0u/jWVjBfqWwMCMYZ/vL+f3pp/nepRxYNBJckK1jCwiRcZXYx65jfvEkHqO3ZKIOY0da45wgfZyqFe6PgP9HqpYgvCAgYodhxZLcobaqL9OFHzUyn9Wy9RQLuvw61aeWinVWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790507184; c=relaxed/simple;
	bh=DgDSCy/qleWV35XmoeXAwJ032STDKntKyDDiqyjz1NI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qLogYUpHPhf7WwbGelFJ/S6UQRhisRvg1jyaklA8U3j74XlcGhvJkawwd3rdj9/XtAtMlzGFp5Ibsrpc55/3UFJeaqMbyUNXE5flGQwTPRLIPzTjACAUOSayrOMQpeCwZeLx1rMF6Bk+rYv0AwYSvpSiO12bB+F9lIXtWMMINIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=abtR/B0i; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="abtR/B0i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A71DA1F00898;
	Sun, 27 Sep 2026 11:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790507183;
	bh=re1SJTxZWi5WMh/Qn6IS8I125DqRII0G/v8riPCBiWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=abtR/B0ihpmduSes4ZkLxM0j2Yxb4ztQFbY52HvJ853rRS5JV5nlKE2UooISRPM2a
	 po0ftvxGcwqXL/CwKiVqkFMpM2XWZieVoSGaculHkBHwV8rzBi1LvmDWawHb0wwmwR
	 W+V5fawMf9DgAIG9svMZTMTjkmjLsWqykGyJ2eqW6VlFnQPUy8SaVUBDNCCGZvqCyx
	 gC91YfEiVY7M1xnqmwuK5zE2qHP6gMdt707VH7GidCy6t6bE1QwQ/QkIiJeA3Du0ML
	 2gY+rWzuV4sMSHyWAf0RODEeY3dQNxrmLUuR9qwce5Xqq2ApRTMSwRebwQvTuyFAIZ
	 e//w9ACjXi54Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 10/11] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ
 board variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <1e36d15592f904c045b7d787f26c14c5114508df.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
 <1e36d15592f904c045b7d787f26c14c5114508df.1790413032.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 11:06:22 +0000
Message-Id: <20260927110622.A71DA1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: combinatorial explosion of board permutations instead of using=
 dt-overlays
--

commit 1ebac7e17fdd3ec057081a7015ef2c70ed9601c6
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants

Add i.MX6ULZ board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Reuse the shared option and carrier descriptions with the i.MX6ULZ
SoC and module wrappers.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm87=
31-6ulcustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-=
card-wm8731-6ulcustomboard.dts
> new file mode 100644
> index 0000000000000..f102909e10850
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-wm8731-6ulc=
ustomboard.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ulz.dtsi"
> +#include "imx6ulz-var-dart.dtsi"
> +#include "imx6ul-imx6ull-var-dart-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-wm8731.dtsi"
> +#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
> +
> +/ {
> +	model =3D "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8731 sup=
port on VAR-6ULCustomBoard";

[Severity: Low]
Does this combinatorial explosion of board permutations create unnecessary =
code
complexity?

This file is one example of the 30 standalone .dts files added in this patch
that merely include a few common .dtsi files to represent every permutation=
 of
storage, Wi-Fi, and audio options. This leads to build-time bloat and an
unmaintainable number of permutations for a single SoC.

Could this be handled instead by providing a base board .dts combined with
Device Tree Overlays (.dtso) for the optional modules, a pattern already
supported and actively used in arch/arm/boot/dts/nxp/imx/ (e.g., for dhcom =
and
colibri boards)?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790413032.gi=
t.stefano.r@variscite.com?part=3D10
