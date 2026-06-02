Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62482F1FEC;
	Tue,  2 Jun 2026 08:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389502; cv=none; b=bb+0EVF3RHc5DiU2bKdXY/nqmgCPcWKCiZ/0QB1BQDTXLGHYI1shA9qcNHTvR+yPerJ1tB9/vGKmUtNnqAEpbxfdGecjJ2cDbilQVuZ1/1Hyb9Wxl39NNwqTyn6KnfCzyyHZ6wPj4rbzoFFarYRi0hjOBfsP9c2KPpANexn0X/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389502; c=relaxed/simple;
	bh=846NDpAI0xh0c/Yi55L5J1Is0TwLXkumKTyZgMFzLtQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fufkKQAQe3ESOu50X8uRAQQ7uPZ8JaiuCm7aD3mnF4bM2gPdcP0wel8XgY4F6HxTlPnDGN+jRpjfmPakyx9XUbj7J1FnipaoMfHC81hj9FSLALssYDJmVGjIfD7cX4aIbrxD6HXBQt6CHAA5zEuUcu1huIqHWBURxlnM9sq4yeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YnNjOFpf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YnNjOFpf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 210941F00898;
	Tue,  2 Jun 2026 08:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780389501;
	bh=p1ALv1igfUIdk3De+xsSQMgEiYrh8DWrHzDo1RXxVFE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YnNjOFpfYGmU1vUGqUMWlUYz0Vz1AKAe+i8nXFg/79XcNlPFiNtI/zyb32bIlgqOX
	 3BZZdh8Bv2O+yRbGqzZUrMq77hqw5vybH4tQTS3wJF5QZqO96853vkzvcT86VrvS3j
	 /98ZYeOQ2ksh7Onta2yrAv1SXl5FeMxeyPQZkVHUi0Rrhq0SoRx2Saj9CbJLVdEfgd
	 AplzE23eNLtlzSkJ78kRDVsYYW9r/jXc/nNxK11219VIg9aMiSXyCYxMNf3wQxtrrV
	 9aeu+5DLeLdoAUuvdaji3W8DwV+zTUscppHvI81hVh9womtcgAsc+IKshw/j39YNo0
	 Af/aHgICc257Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 6/6] arm64: dts: s32g: describe GPIO and EIRQ
 resources in SIUL2 pinctrl node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Khristine Andreea Barbulescu" <khristineandreea.barbulescu@oss.nxp.com>
Cc: robh@kernel.org, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260602080132.3256239-7-khristineandreea.barbulescu@oss.nxp.com>
References: <20260602080132.3256239-7-khristineandreea.barbulescu@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 08:38:20 +0000
Message-Id: <20260602083821.210941F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The `reg` property for the `swt8` watchdog device is missing the `=
0x` prefix for its base address.
--

commit 1403ffa829f6f3074ef410621ae401b08c310e0a
Author: Khristine Andreea Barbulescu <khristineandreea.barbulescu@oss.nxp.c=
om>

arm64: dts: s32g: describe GPIO and EIRQ resources in SIUL2 pinctrl node

This commit updates the SIUL2 pinctrl nodes in the s32g2 and s32g3 device
trees to describe GPIO and EIRQ registers. It adds the PGPDO, PGPDI, and
EIRQ register windows along with the corresponding controller properties.

> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/d=
ts/freescale/s32g3.dtsi
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi

[ ... ]

> 		swt8: watchdog@40500000 {
> 			compatible =3D "nxp,s32g3-swt", "nxp,s32g2-swt";
> 			reg =3D <40500000 0x1000>;

[Severity: High]
This isn't a bug introduced by this patch, but while reviewing the s32g3
device tree changes, I noticed this pre-existing issue in the swt8 node.

Is it intentional that the reg property uses a decimal base address instead
of a hexadecimal one?

Since there is no 0x prefix, 40500000 is evaluated as decimal, which is
0x269FEC0 in hexadecimal. This does not match the intended hardware
address of 0x40500000 specified in the unit address.

If a board enables this watchdog device, could the driver attempt to
ioremap the wrong physical memory address and trigger a synchronous
external abort?

> 			clocks =3D <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
> 			clock-names =3D "counter", "module", "register";
> 			status =3D "disabled";
> 		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602080132.3256=
239-1-khristineandreea.barbulescu@oss.nxp.com?part=3D6
