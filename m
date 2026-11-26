Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706585;
	b=OmOJoKvIZRtxjKmgRHR6fg7C7qwP02aJyDG/uIcauPyjV+aao1lg5v1JVT6xtJtgx/tP
	 ZubNHyABUv9AJRu62w7sjIajMrD456PXAd8lO1HUfCVnI+ivjUdX2nU5Z5I8OczKSCz8V
	 rIcHeh1AVXaKLJYlZGpn+OZZZLrW8BZUMmn2F/369rrit78pNBmNqghQ1L7Ev2YGxnJzO
	 xFh9kobDZSYzx6VA8aoZU6mGnFurb1lxmk+gXw0RDeD581M2lKdwhm1wAWx/IQ4sNWoaj
	 k7ffV7GrPcksK4OHKVbU99pw2KYDbDApBWTwkt8B377U3C6AenSKuX98Qj9F1ijemGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706585;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=BhjYuNtMwQAGvtiOAWCGpiTuXbDYtaU7GZYmMe8ouE4=;
	b=GdhFPScEsUE/j56hkpdqkccz4GS/10MIghRS+wxjkfwbYcmImL91Ys379zKZQ+Yu4byT
	 t1HGTRmfmS6O7oTVjB0ekwUnhonEThP6236MWtduWcr8Dxj3Fd7IZZr/MuZnv9Anxxduo
	 FdSQ7wZC/nZ7e2p+7atTcWWbW2AsJF80keanwNUAgqbp30A/AIruddNHhbvdeVlujN6XP
	 y6fUsE48vV8pQ9ktFa4uGaXpkEvSSjOnvIOj7oM7ciVh0jfUXDGgvFAnr7rMrGtqwUhR/
	 HpB1/iDHykG0ukagW2Ix1QsWyOx0+A1RDuRyaL8bBKrCgXeuiW9L9q8gf+AbZ9Noh5Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y89aE4GT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A02D606A332;
	Thu, 26 Nov 2026 15:23:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y89aE4GT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 712641F000C6;
	Thu, 26 Nov 2026 15:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795706584;
	bh=BhjYuNtMwQAGvtiOAWCGpiTuXbDYtaU7GZYmMe8ouE4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Y89aE4GTekiigNYPCWwm3EhftnLSwPlnKEyWNd49pkzKnJB8c4x+XXrUMiIrdGEan
	 Zck91SnWxJoD1XHn9zF78owEaveKRVGbXIL+xPq25mtGA2Wgu0PWlUCudXr/aFhgAw
	 J1gk+H3I8G1EHGOtKasY4EUYpEGt2EQJz5+bWYpCP4EjjPmvtw0IC3fbtxX09oKzv5
	 s/xzFMuqGrMGHQ6OAXWB/sEwkZxcxIUjBvye2NIUIMpAXQ9MxyneJWm5IQKNXdahmC
	 3G6qRthFEl1q4jd2wwyI9olxFXKi6pZvfhUPf9xGMdOXls2/tN3DS7emaIvprDbiPZ
	 5XlhalGHotDXQ==
Message-ID: <sashiko-outbox-235798@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/6] arm64: dts: imx95-phyflex-libra-rdk: Add M.2
 Key-E 88w8987-bt overlay
Reply-To: sashiko-reviews@lists.linux.dev
To: "Benjamin Hahn" <B.Hahn@phytec.de>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261126-wip-bhahn-imx95_upstreaming-v3-4-a2bda009bac8@phytec.de>
References: <20261126-wip-bhahn-imx95_upstreaming-v3-0-a2bda009bac8@phytec.de>
 <20261126-wip-bhahn-imx95_upstreaming-v3-4-a2bda009bac8@phytec.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 15:23:03 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] arm64: dts: imx95-phyflex-libra-rdk: missing OF graph link in
  BT overlay
- [Low] arm64: dts: freescale: unused gpio.h include in 88w8987
  bluetooth overlay
--

commit 49f2cc32ede4fb4ed7f0dc182c8b70c0d3acedd0
Author: Benjamin Hahn <B.Hahn@phytec.de>

arm64: dts: imx95-phyflex-libra-rdk: Add M.2 Key-E 88w8987-bt overlay

This commit adds a devicetree overlay for M.2 Key-E Bluetooth cards using
the nxp,88w8987-bt compatible on the i.MX 95 phyFLEX Libra RDK.

> diff --git a/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-blueto=
oth-88w8987.dtso b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bl=
uetooth-88w8987.dtso
> new file mode 100644
> index 0000000000000..c0a85005627e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx95-phyflex-libra-rdk-bluetooth-88w=
8987.dtso
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (C) 2026 PHYTEC Messtechnik GmbH
> + */
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>

[Severity: Low]
This isn't a bug, but dt-bindings/gpio/gpio.h is unused in this overlay.

> +
> +&lpuart8 {
> +	bluetooth {
> +		compatible =3D "nxp,88w8987-bt";
> +		fw-init-baudrate =3D <115200>;
> +	};
> +};

[Severity: Medium]
Should this overlay also define OF graph endpoints linking lpuart8 to
m2-key-e-connector port@3?

In imx95-phyflex-libra-rdk.dts, m2-key-e-connector defines
w-disable2-gpios with compatible =3D "pcie-m2-e-connector".  When
pwrseq_pcie_m2_probe() binds to that connector, it requests w-disable2
with GPIOD_OUT_HIGH, holding the M.2 Bluetooth radio disabled.  In
btnxpuart, nxp_serdev_probe() only calls pwrseq_get(..., "uart") and
pwrseq_enable() to deassert w-disable2 when
nxp_m2_connector_is_available() finds an OF graph endpoint on the UART
controller node connected to the M.2 connector.  Without the OF graph
link, Bluetooth remains disabled whenever pwrseq-pcie-m2 is loaded.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126-wip-bhahn-=
imx95_upstreaming-v3-0-a2bda009bac8@phytec.de?part=3D4
