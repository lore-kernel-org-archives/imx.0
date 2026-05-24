Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE73A3A83B1;
	Sun, 24 May 2026 16:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779639600; cv=none; b=Y8l9rxPPQUAzsuEdt0PuxC5QigF8WlYr8UvxghxIGqFo6LNBRFw+UESClLOWsw2waX7aADjBz15JWj7zKZpDWz4fDU0Ap7As/kJ0djWSbDRwWWEOr5uC4XDlpT6R7oYV0DvECcEhVwqxFnj+fNyjo90Xo22Fzd7tC4pjX2QBg/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779639600; c=relaxed/simple;
	bh=DAq2OfDvLOhU9yeRufJJ10lC2UCm9xRzey75u8PgolY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sGqmJOMmcYNt/vvKMcLsje1jdYw7GJTP570JBcAgPSQrPCQVHSN2RuwotOZ8qVVikGKa+z018ruEvR/1JxDa48SdRQMUBKRF0rtyvBm3S5bxNV6xg6C+THbgVpE9CS1nooWcTEBnN7e9FUalpMOJq5A73GijIVTChX39OEWvdCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b8eAPNEp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b8eAPNEp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342981F000E9;
	Sun, 24 May 2026 16:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779639598;
	bh=BLcTiq3arNWZxa9QQ5DWs0Ciq3FPi+1EMoqSe0ZFi1g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b8eAPNEpE3JyqDQYbx8N7rCGOtPkkC2qpiLtCdDSZN1JtJtcZ0uSNIfl5cy+zm2Tr
	 e71U8qdemAEY+V3LTAD7kYJKfpnEfhw6WZYxmw2OrvS41desYG1Gj+qqgTPLZ2WHvW
	 E+n5zdWY8/Vfb0imRl8SsSiG+x29Ev6xr3RSO8oWUHQdtFiR5Q4a0UA/BCARq/cn8x
	 K+YE2uVwIHjmCW0PuDvtcTPfDH4UsPx1/CEc5mRUivGS436pY+ymA9rQKw89+zL4Kn
	 73TJXXp5WE1aX0cfubvB6xIA+DYsQyqdtjMT4NgaKVkTCxwU1y21b3BvGnPQB2y01H
	 wiKrX5IJw9zHA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v7 9/9] arm64: dts: Add support for LX2160 Twins board
 in single configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Josua Mayer" <josua@solid-run.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260524-lx2160-pci-v7-9-09370c23b952@solid-run.com>
References: <20260524-lx2160-pci-v7-9-09370c23b952@solid-run.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 16:19:57 +0000
Message-Id: <20260524161958.342981F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The `gpio-mux` node for the fan tachometer multiplexer lacks an =
in-kernel consumer, which permanently locks the GPIOs and prevents the mux =
from being switched.
--

commit 3c28f80d13a11b4ba012fa933362f3d2ffeec63c
Author: Josua Mayer <josua@solid-run.com>

arm64: dts: Add support for LX2160 Twins board in single configuration

This commit adds device tree support for the SolidRun LX2160A Twins board
in a single CPU configuration. It adds hardware support for various
interfaces including SFP ports, OCP, USB, microSD, and power supplies.

> diff --git a/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts b/a=
rch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts
> new file mode 100644
> index 0000000000000..d16e273072754
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/fsl-lx2160a-half-twins.dts

[ ... ]

> +	mux-controller {
> +		compatible =3D "gpio-mux";
> +		#mux-control-cells =3D <0>;
> +		/*
> +		 * This gpio controlled mux can route the tacho signals of 6 PWM FAN c=
onnectors
> +		 * to the tacho inputs of both CEX-7 modules (twins).
> +		 *
> +		 * The first twin controls this mux and monitors four fan connectors, =
two intended
> +		 * for itself, and two for the OCP card.
> +		 *
> +		 * The second twin monitors only two fan connectors intended for itsel=
f.
> +		 *
> +		 * The table below maps selector GPIO states to monitored fan connecto=
r per twin:
> +		 *
> +		 * | SEL1 | SEL0 | Twin 1 | Twin 2 |
> +		 * | ---: | ---: | :------| ------ |
> +		 * |    0 |    0 | J10    |  J5024 |
> +		 * |    0 |    1 | J5016  |  J5024 |
> +		 * |    1 |    0 | J5026  |  J5025 |
> +		 * |    1 |    1 | J5013  |  J5025 |
> +		 */
> +		mux-gpios =3D <&expander0 8 GPIO_ACTIVE_HIGH>, /* SEL0 */
> +			    <&expander0 15 GPIO_ACTIVE_HIGH>; /* SEL1 */
> +	};

[Severity: Medium]
Does this mux-controller lack an in-kernel consumer?

When the gpio-mux driver probes, it exclusively requests and locks these GP=
IOs.
However, there appears to be no consumer node in the device tree referencing
this multiplexer to actually switch it.

Since the Linux mux subsystem doesn't provide a userspace interface for
switching, and the GPIO subsystem denies userspace access to locked pins, d=
oes
this completely prevent both the kernel and userspace from switching the fan
tachometer multiplexer?

If so, doesn't this permanently lock the fan monitoring functionality in its
default state?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524-lx2160-pci=
-v7-0-09370c23b952@solid-run.com?part=3D9
