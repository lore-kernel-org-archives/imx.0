Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357AD36C9EC;
	Mon,  6 Jul 2026 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333594; cv=none; b=Q1NrkpJ/bB0wBJFXIm5fvhk01Qgv/z70E4CqboM0CUMRsPRZ0lBzZb8PVrv0wdrrVJtdR9C27VvdvoaTrxisRvANPfyfmWs2aE2mBZxuD+dcYXOk+iLBuYytoFVvfuRT8oJnvdh/WSrd7utuyEWy4CB+DZ1Ld0D38zh5BgxLogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333594; c=relaxed/simple;
	bh=XDmuIwuJdOtznxpg+cwaOzIFgK5CCYcPv3D3OXpvFG8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eI301vVnwtbYGxS2zb2Q77sa7ho1hSSiQbYXGMd1fhnima4vCqMqBHpY5dsZyA7R3TpoIWpsMqbtjJxVJshcHHHUxhbRg+6aOSJVrSV4txwmSBWODsairiuKM9OabSFSe9oHs8mYvf+Q3ypFPLJyvYZCxakf+gnTdvLhDxDP0Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IGYtTZF4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IGYtTZF4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B6D71F00A3A;
	Mon,  6 Jul 2026 10:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783333593;
	bh=6mWpv0lhMwk3uzBmxJwjSpwXF3qzESzWiXeVpYXIPL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IGYtTZF4fPloB067F9SzJJ5j4AbZ6cfpnWy3YyyjgDIoq8ef90FQG3kb8VAfcEhtf
	 E3m8RiaaUJh9G89uHojIcGKcewkxDO5dreI3QkeCKfjEc+ooMgx+e9eBp3u7rf2zdW
	 tl84kLlZ7VdFwCQIcDjM85aTkLqqPMMtIXiKc5viIXrqlS/dRmhQTMQu3eNiB6pJic
	 gXvqZ6ZchggDQER9RXuR0iMMAS1ppegxGqrlqFTfTo+XogViYLzc36NuDFvqcGdW2z
	 YSLw5nJYMV5PnvY0nD0tFkUeKu7dulL0RaZtFZt+bBOtfCi3w8+n0iDUBpx0CPhFFN
	 V6k3Kg/8TLfmA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 07/15] arm64: dts: freescale: imx8mn-var-som: Rework
 WiFi/BT and add legacy dts
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <ecf72149729d31be30e6f5bcc1cc53a5321a124d.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
 <ecf72149729d31be30e6f5bcc1cc53a5321a124d.1783330236.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 10:26:31 +0000
Message-Id: <20260706102632.3B6D71F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The legacy Symphony device tree (`imx8mn-var-som-symphony-legacy.d=
ts`) fails to revert the `uart2` pinctrl configuration, permanently claimin=
g the Bluetooth enable GPIO and breaking legacy Bluetooth initialization.
--

commit 31b3d797e663552df95cdacb42e55c6c3a65c79e
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx8mn-var-som: Rework WiFi/BT and add legacy dts

This moves the IW61x wireless module configuration out of the base
imx8mn-var-som.dtsi into dedicated variant includes. It also adds a legacy
device tree to support older SOM revisions with Broadcom WiFi.

[ ... ]
> diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy=
.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
> new file mode 100644
> index 0000000000000..5998ebcef4740
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony-legacy.dts
> @@ -0,0 +1,19 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2026 Variscite Ltd.
> + */
> +
> +#include "imx8mn-var-som-symphony.dts"
> +#include "imx8mn-var-som-wifi-brcm-legacy.dtsi"
> +
> +&bluetooth_iw61x {
> +	status =3D "disabled";
> +};

[Severity: High]
Will this leave the pinctrl_bt group claimed by uart2?

Since this legacy device tree includes imx8mn-var-som-symphony.dts (which
includes the new IW61x setup), uart2 is initially configured with:

&uart2 {
        pinctrl-0 =3D <&pinctrl_uart2>, <&pinctrl_bt>;
        ...
}

Disabling bluetooth_iw61x here leaves the pinctrl-0 property on uart2
unchanged. Because the i.MX pinctrl driver uses strict pinmux claiming,
wouldn't this permanently claim the BT enable GPIO (GPIO2_IO6) and prevent
legacy userspace scripts or drivers from exporting or toggling it?

Does uart2 need an override here to drop pinctrl_bt?

> +
> +&iw61x_pwrseq {
> +	status =3D "disabled";
> +};
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783330236.gi=
t.stefano.r@variscite.com?part=3D7
