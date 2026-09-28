Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668213CF96B;
	Mon, 28 Sep 2026 12:57:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790600261; cv=none; b=a+AYtLh7veeSEJKjqgq+BYRDtHa4P8I/O8N9a/YA6zVUP3WE1yE4RFDf6FCc5Fet+dvJKHI3Uzbb2ndehJok7jhZp+y7jlfIB5NJ14BTZe4SpZW4ItxRR4MXVfmJ1Lb8LcGa7Q7kNbMFushl8IX7LxvUETuXU34hQ0xtrn31SOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790600261; c=relaxed/simple;
	bh=J2kkZt8qZgqlbk9lrkCPB0iNZTiWsQyjAdka+7rop2o=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=n2An+ICRH2FJrtXScBVBKe+2aINFZ+rcqmT4ANbhPs6cBEJfvdQeQrb/55LoskHYIBh0UDRVlnU+7jAPfekrqhDd/iLzvn+gnKoF68aNAx1OML68hFvsCKSEo92LtunB3w9TyxWN00wmyxd1horpy6dW5jJmScqoYFA/alGd0ME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UD4L936u; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UD4L936u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCB7E1F00898;
	Mon, 28 Sep 2026 12:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790600260;
	bh=dH5GQ4lUFEpiXoN4C+awntTar+8S540MUXzJnY4MzQ4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UD4L936u/XB1HfovxbQmgP+NcFdXjgpmaobdiVE3uvjwTIIM0wmg67xSAwDwFhkZs
	 7Wryvt8k54TlkvKE+zG/I9yV7Cmg6PtA12R3l+hL5FysIot8yAvmJSkAxrjF18yhO1
	 T3aj7BaZCrOSaWtBmBgM4wc1s2ABmYeViiIunhNOmHx/JjG8z11I2/wG8gS3I8+ef6
	 HxWDOweWtCLYj78Fhp80XsApsPRQ82y+ARV/QOXNkT0iTfRZK1SKV1HJajoya9GHLj
	 mmgKnwGVLhJUxsPlebIBePRG3aMZqAXvKdCWgEDpKkjA/UpAXmXs+UDai0hjl3j6rI
	 pPbLB+eC6YiaQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 11/12] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ
 board variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <4e63d123736daddc18dcddeabe96b6e2bfd65611.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
 <4e63d123736daddc18dcddeabe96b6e2bfd65611.1790512621.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Sep 2026 12:57:39 +0000
Message-Id: <20260928125739.BCB7E1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: combinatorial explosion of static DT permutations
--

commit fe23e5c3bff1e80a38291b82cb1ef5a3d2caeacc
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants

This commit adds 30 new static DTS files for various combinations of
carrier, storage, wireless, and audio options on Variscite i.MX6ULZ boards.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulc=
ustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6u=
lcustomboard.dts
> new file mode 100644
> index 0000000000000..612246fe5638e
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustombo=
ard.dts
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
> +#include "imx6ul-imx6ull-var-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
> +#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"
> +
> +/ {
> +	model =3D "Variscite DART-6UL with i.MX6ULZ, eMMC, SD card & WM8904 sup=
port on VAR-6ULCustomBoard";
> +	compatible =3D "variscite,dart-6ul-imx6ulz-emmc-sd-card-6ulcustomboard",
> +		     "variscite,dart-6ul-imx6ulz",
> +		     "fsl,imx6ull",
> +		     "fsl,imx6ulz";
> +};

[Severity: Low]
Does this approach create a combinatorial explosion of static device tree
permutations?

Creating a static .dts file for every combination of storage, Wi-Fi, and au=
dio
options adds 30 new files for the i.MX6ULZ variant alone.

Could device tree overlays (.dtbo) be used here instead of generating static
files for each hardware combination?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790512621.gi=
t.stefano.r@variscite.com?part=3D11
