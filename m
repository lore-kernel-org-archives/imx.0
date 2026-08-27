Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 805113C1970;
	Thu, 27 Aug 2026 08:10:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787818244; cv=none; b=afIWAi3NEZSVwQ0NBlljZcKZsUZbttekRoYN6k4hcZXc88cBgMG6sR895OFGl6jzJ7T5AFqaUpPUi4Achi7tEqkvil7FuKnG8eAxCRbUgaT5ajwvXUwxdzKnMSYcT8lpJ1qgpxz8fHLhW/iBkaGOBTs7DzjE0S/V1PebGy9Y2zE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787818244; c=relaxed/simple;
	bh=AKPvNKUlw69ATdXUK4li6x2mruf4QKy11p/KL2l1G7E=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Oje2NVUJ3+AvJLK35SC40zwmL5RMl+8k/Wu6qf6ZuohOgqyAdckSKaO9ac8t60gxIdzyjaZzVi92IyZEuJRKiH1DKl7w+ftkVl9gwd3wWCifh4VC10Dt9ghQfNfpkH/7B5SczXuITArEPwY4iIGCbpLHp41X93bnhXPXdwNt8K8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQvN3TGz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQvN3TGz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE81B1F000E9;
	Thu, 27 Aug 2026 08:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787818243;
	bh=URT9xbvleYyTmCXwsCE7G3ihTv03Jp+5OEynI6aUceE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KQvN3TGzcrv1a/1hjxmxwqACB9nbI7VJiNRpv+0xwQvb38xj+39wDZW2lOanOp1+O
	 JDM3D5ye4AcTdwXNJK23zLzhCGpigxU11egEfpZ7qWrMbnLJR8fNMWsMcK8bLmOfMq
	 jqVGuI1Bph/zYDk9sS5E3ZFKazJXBMp9k3vx/U5DtGNn0TL4I1LT5PZ3yTFx4pN8mF
	 3Hu3/GqLsLT7NjgvkEsrk0pJLWcz57CuFT1Wu+3iFpK2VWN49mCZ8Hbon9OhyXL/f0
	 SCU8A81efxISHHZqr+3A6Ay0vMEiKxlQmkCVpCDxrUkkNe5iiLHjKNtwKNQPXs5vWD
	 ummk0u8p615JQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07
 expansion board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Primoz Fiser" <primoz.fiser@norik.com>
Cc: imx@lists.linux.dev, conor+dt@kernel.org, robh@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260827075754.2739119-1-primoz.fiser@norik.com>
References: <20260827075754.2739119-1-primoz.fiser@norik.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 27 Aug 2026 08:10:42 +0000
Message-Id: <20260827081042.BE81B1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Missing `post-power-on-delay-ms` in the MMC power sequence for t=
he NXP IW612 Wi-Fi/BT module.
--

commit 60b0b6fcfb75ad1ee4054d84dfea3d70e8467993
Author: Primoz Fiser <primoz.fiser@norik.com>

arm64: dts: imx8mp-phyboard-pollux: add PEB-WLBT-07 expansion board

Add support for PEB-WLBT-07 which is an expansion board that provides WiFi 6
and Bluetooth 5.4 LE functionality. It features the u-blox MAYA-W2 module
with the NXP IW612 chipset.

[ ... ]

> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlb=
t-07.dtso b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-0=
7.dtso
> new file mode 100644
> index 0000000000000..008b6f9f46e59
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-peb-wlbt-07.dt=
so
> @@ -0,0 +1,76 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
> +/*
> +* Copyright (C) 2026 PHYTEC Messtechnik GmbH
> +*/
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include "imx8mp-pinfunc.h"
> +
> +/dts-v1/;
> +/plugin/;
> +
> +&{/} {
> +	usdhc1_pwrseq: pwr-seq {
> +		compatible =3D "mmc-pwrseq-simple";
> +		reset-gpios =3D <&gpio2 7 GPIO_ACTIVE_LOW>;
> +	};

[Severity: Medium]
Is it possible that the usdhc1_pwrseq node needs a post-power-on-delay-ms
property here?

When the MMC core powers up the SDIO bus, it deasserts the reset GPIO and
immediately proceeds to probe the module with no explicit delay. If the
SDIO host controller probes the IW612 module immediately after the reset
deassertion and the hardware is not yet stabilized, could this cause SDIO
enumeration failures during device boot or resume?

Other in-tree configurations for the IW61x chipset, such as those in
imx8mm-var-som-wifi-bt-iw61x.dtsi, explicitly configure a delay like
post-power-on-delay-ms =3D <100>. While there might be an on-board hardware
RC delay on the MAYA-W2 module that mitigates the missing software delay,
adding the explicit software delay might be necessary to guarantee stabilit=
y.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260827075754.2739=
119-1-primoz.fiser@norik.com?part=3D1
