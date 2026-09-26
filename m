Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C024D46AA81;
	Sat, 26 Sep 2026 14:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790432017; cv=none; b=kRQVO1FYpNWlJAvvgb6V23uWDnhPzi4oW+EA2xikbJq3pcrlytH5WsLqkOdq812S2or3js+S+qP8ORQPBBz9kMdRM2iRbSRXwKR3rKdQ40kcdRyNkunAi3oNpykwURA8qf2OyN7AEqE7egBQSZ3u8FT8GsWPdFbBZ1DC+AZbLUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790432017; c=relaxed/simple;
	bh=W/LO6MTyKVG5JoqBu54FrFpwC9MeOp18uRpBYUu5HtI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=XTE3pj+ydo3i9yeTOJEuJmPorY1V1UWlNUNb7mvavvhQMsSEcUSClIqBDkz0r39WaDlOJER4NsoVbVKHf0SJsCLuWFhFSDJD7oofvYGZ4Ov8mFKbBR9sWNPty/krhuvq62hef1lpJfwZLvBvQXJcNRbxNBiu5mNSwaljkqJ1AI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PpSJV1Jy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PpSJV1Jy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 691271F000FF;
	Sat, 26 Sep 2026 14:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790432016;
	bh=n2wMQ70O+AulAAMtqC3MBGeqMIe3OCtiZF2s3I42UDI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PpSJV1JygY51xINSR4IEXEDrfohK69jWz+CYTZ+0wPZfU9wwDRjnqUkNgwT8VFJfn
	 oz9r3qUVEIWngXqjNk/kix/8SxZmYhiy7h4UPv2yPCt3XFlEXKeU36vcJqcfIMc16V
	 4mQUxWrID4DljWuD6cwZ/NTa548vriXymt68clIqRmjKQ79jgKg5wyKT+Y3mMTKVCQ
	 wjVpid1vJ+rDQApLMua5a46oXm6ygm3S4/E+JkAVWRGdA30ybxvMcUlHedSmurgp1D
	 wuebWu8v1CTna9jHAWIpWOXwJnJUSR1ExEyCZuGvxtdCvPTc/B3N6hpdvbb1pt5C3U
	 FlcM3Jd/4goJQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 10/11] ARM: dts: imx6ulz: Add Variscite i.MX6ULZ
 board variants
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <d36ad411e51b62f901f99b8ea160cce63800dd70.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
 <d36ad411e51b62f901f99b8ea160cce63800dd70.1790344389.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 26 Sep 2026 14:13:36 +0000
Message-Id: <20260926141336.691271F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dt: missing vmmc-supply assignment for SD card regulator
--

commit c035a6871fb70fa19b07a2597c2770e8e0afc0e1
Author: Stefano Radaelli <stefano.r@variscite.com>

ARM: dts: imx6ulz: Add Variscite i.MX6ULZ board variants

Add i.MX6ULZ board DTS files for VAR-SOM-6UL and DART-6UL with their
carrier, storage, wireless and audio options.

Reuse the shared option and carrier descriptions with the i.MX6ULZ
SoC and module wrappers.

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulc=
ustomboard.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6u=
lcustomboard.dts
> new file mode 100644
> index 0000000000000..35b62a4fc7f53
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-dart-emmc-sd-card-6ulcustombo=
ard.dts
[ ... ]
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
> +#include "imx6ul-imx6ull-var-dart-wm8904.dtsi"
> +#include "imx6ulz-var-dart-6ulcustomboard.dtsi"
> +#include "imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi"

[Severity: Low]
Does this board variant also need a vmmc-supply assignment for the SD card
regulator?

In the included imx6ul-imx6ull-var-dart-6ulcustomboard-sd-card.dtsi file, t=
he
&usdhc1 definition lacks the vmmc-supply =3D <&reg_sd1_vmmc>; property:

&usdhc1 {
	pinctrl-names =3D "default";
	pinctrl-0 =3D <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
	cd-gpios =3D <&gpio4 19 GPIO_ACTIVE_LOW>;
	no-1-8-v;
	keep-power-in-suspend;
	wakeup-source;
	status =3D "okay";
};

The reg_sd1_vmmc fixed regulator is explicitly defined to power the SD card,
but because it is never assigned to the usdhc1 controller via vmmc-supply,
it is left orphaned and unused by the MMC subsystem.

Could this assignment be missing from the shared .dtsi file, or should it be
overridden here in the new board .dts files?

> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-conce=
rto-board.dts b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-conc=
erto-board.dts
> new file mode 100644
> index 0000000000000..ac0c2657e6564
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ulz-var-som-emmc-sd-card-concerto-boa=
rd.dts
[ ... ]
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ulz.dtsi"
> +#include "imx6ulz-var-som.dtsi"
> +#include "imx6ul-imx6ull-var-som-emmc.dtsi"
> +#include "imx6ul-imx6ull-var-som-wm8904.dtsi"
> +#include "imx6ulz-var-som-concerto-board.dtsi"
> +#include "imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi"

[Severity: Low]
Similarly, does this board variant also need a vmmc-supply assignment?

The included imx6ul-imx6ull-var-som-concerto-board-sd-card.dtsi file also
leaves the reg_sd1_vmmc regulator orphaned for the &usdhc1 controller.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1790344389.gi=
t.stefano.r@variscite.com?part=3D10
