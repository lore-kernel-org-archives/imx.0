Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4A493D3CF2;
	Mon, 28 Sep 2026 12:57:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600259; cv=none; b=pJkZkME/LZr68cvtV/Bl5dOJ/ObV3IJZQ/4CZMlA0Z/ZzvsGPkUzUHrCrhoDxDdwwntcYXtbU0CGUaWkl0EgUx6CGgBZo6f4r9UeehlFW0Lwrwm7u8BfnaHzqaavfUUAJNAyi+/DbAhPyg4V4SfiHvUHDJpSEv4A5v8Gyu0ehdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600259; c=relaxed/simple;
	bh=IgTrd+2XYAe/57WkHcM5qcNyoOhj5RyaQk/N9qZHYQ4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TkioHV5ubNChqTkKO7PKXpgcjzZohysA0Lc4T0+TAtcl1loAuGLFzU7F8EPOT+vo16RJ78i6BPFQd8RquvsvBQpGswMVnMsBKSy8ejcJ8E/dS55Yhm9txQzmcvrhTZX+mKtxmFp1TsU5h0C/uxeCtSo7QV3UG/5F5asVL7hauMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cMK3Rala; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cMK3Rala"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C4821F00898;
	Mon, 28 Sep 2026 12:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600257;
	bh=NWYkM8c+7i45W+YIqXA89y924JqR2F/EL962H2LX9RA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cMK3RalacYTv3QT+7dekiqX4ziYBfnOC6kNWZQ1R0STLi4ZRn3Z5I1xeXxHup+ui3
	 Lkhn7p9ejASWtfiNzQUMunszsDH/1DgaIjalR98LGH7Qv8nztcxVMVzau86br1CJMi
	 hJ7S+gs2Oj0hih1gXjWSiV7pXOaE/k63gzclefK85kVNwEXrO4qosBV9uoLoZ9luaD
	 IzO112XEZnusxNRUltfGumGFIM2ulqV75ljohos3o86YcYbRtEyzVlrAf2f9D5myN5
	 UqgkUqJJSn/VnCaZmo4QRV/VXqxDzc6I8WoUXAj9sqrQm8CDQK638h9YzUoVusMkjP
	 NWuFv2eTU+G1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 09/12] ARM: dts: imx6ul: Add Variscite i.MX6UL board
 variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <c934b748d2b2b7cca3f814450eeab2614c64c015.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <c934b748d2b2b7cca3f814450eeab2614c64c015.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:36 +0000
Message-Id: <20260928125737.3C4821F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: combinatorial explosion of board DT files instead of overlays
--

commit bc40e2df59f147ba5a7cdb739e68027ac8e36f19
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ul: Add Variscite i.MX6UL board variants

This commit adds 30 device tree files for Variscite VAR-SOM-6UL and
DART-6UL boards to support various hardware options. It composes each board
description from shared module, option, and carrier DTSI files.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcu=
stomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulc=
ustomboard.dts
> new file mode 100644
> index 0000000000000..c7c05406bd804
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
> +#include "imx6ul-imx6ull-var-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
> +#include "imx6ul-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
> +
> +/ {
> +	model =3D "Variscite DART-6UL with i.MX6UL, eMMC, SD card & WM8904 supp=
ort on VAR-6ULCustomBoard";
> +	compatible =3D "variscite,dart-6ul-imx6ul-emmc-sd-card-6ulcustomboard",

[Severity: Low]
Does this approach cause a combinatorial explosion of device tree files?

In arch/arm/boot/dts/nxp/imx/imx6ul-var-dart-emmc-sd-card-6ulcustomboard.dt=
s,
adding 30 boilerplate .dts files to cover every hardware permutation of
carrier board, storage, wireless, and audio options creates a maintainabili=
ty
burden in the kernel tree. Adding any new optional hardware component will
require exponentially more static files to cover all combinations.

Could this be handled via Device Tree Overlays (.dtso) or dynamic bootloader
fixups rather than creating a full static .dts file for every permutation?

> +		     "variscite,dart-6ul-imx6ul",
> +		     "fsl,imx6ul";
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D9
