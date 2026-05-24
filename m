Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3B61E1E16;
	Sun, 24 May 2026 18:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779646836; cv=none; b=Vckf36tNXJ7OlBzzvoNRasmjwCsSPctRRygYsB3ElDteZmt6Z1mKjJzSWvnjRQJosa/kTfAdOFKH1gL62bHxC0Y5L3bYL8msBPKepOBzPrDpZ8QmZ0mew1i7iMRsT70DdW/nbwGaO16WpjbylIrIvRD0AC6IWxY5V7FK0Pq6zLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779646836; c=relaxed/simple;
	bh=aM5brMmyOZ5hfkAaEyPFUIoWCXccsYLo9ssyg7Sl5vk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t7c8m4ykQg3dqlouRkoNfZ5zB+ylD0tDXCWilXawIF1TPBSqEAj323wLxT6qenuZQ3OGanK7TAKPanpfYjjpJ0CiGfqAi8FdUrpGdRUToJGZJZwwWW6RnSl0XM4F99t3op5XNRQe2oedHUSoHBgiof1/SA3fyeHxfGLb9C1dHvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwm94nfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwm94nfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E54DA1F000E9;
	Sun, 24 May 2026 18:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779646835;
	bh=hk4xI+jCaVQR8Cu1YfFpIZwbyhT2fJoThrnIy3E6Dvs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iwm94nfmzeaC/ZQr4UB2yx0TtNxbXnM5x2fu6h+lX0jBcgz4AL7MqqpzBw3ygWpWG
	 c5KU/llVVonCXnEr0BTwmlmbH1ypMQ5Fi5L09essQD+rMRBzrv6yTKQB9lCEjZcD4Z
	 p30jq18/8bO/82tgha2qPV21IF60XhZPNRg1zkH8yqwYLwdynaYXjBkKotg41xvOLH
	 8J2e33EsgaV3T2MOJNStrCLxeP/XwleuSqpIz1HuS3/sI4PNuZ7aLtYdD7yB+98425
	 EjjoNG6FyoXspPqvZJtbveRAIXXJYrlhLmgPrqvy/Vo4ZKAdb/QT7jRv4Os/G+3PyV
	 yvkeSzxrxxOCQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] ARM: dts: imx7d-pico-pi: add OV5645 camera support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Lech Perczak" <lech.perczak@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260524175312.10952-1-lech.perczak@gmail.com>
References: <20260524175312.10952-1-lech.perczak@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 24 May 2026 18:20:34 +0000
Message-Id: <20260524182034.E54DA1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] Incorrect `clock-frequency` assignment in the `&mipi_csi` node d=
rastically reduces the MIPI CSI wrapper clock, causing image capture failur=
es.
--

commit aa98f4a3e7fa5b72ccc19a9fd456c518fe7ea6ff
Author: Lech Perczak <lech.perczak@gmail.com>

ARM: dts: imx7d-pico-pi: add OV5645 camera support

This commit adds the OV5645 camera device node and enables the relevant
components in the video capture data path for the imx7d-pico-pi. The
author noted that the camera probes successfully but image transfer fails,
suspecting pixel format incompatibilities.

Link: https://github.com/technexion-android/kernel_imx/blob/ce8fd74abf518da=
c0a09e8dcb37f3496f6375124/arch/arm/boot/dts/imx7d-pico.dtsi#L874 [1]

> diff --git a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts b/arch/arm/boot/=
dts/nxp/imx/imx7d-pico-pi.dts
> index 62221131336f1..b36936ecfa4ba 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx7d-pico-pi.dts
[ ... ]
> @@ -93,5 +120,38 @@ MX7D_PAD_EPDC_DATA04__GPIO2_IO4		0x14
[ ... ]
> +&mipi_csi {
> +	status =3D "okay";
> +	clock-frequency =3D <24000000>;

[Severity: Medium]
Could this clock-frequency assignment be the cause of the image capture
failures mentioned in the commit message?

According to the nxp,imx-mipi-csi2.yaml binding schema and the
imx-mipi-csis.c driver, this deprecated property overrides the MIPI CSI-2
receiver's internal wrap clock.

By forcing this clock to 24 MHz, it drastically underclocks the peripheral
from its default of 166 MHz. This renders it too slow to process incoming
high-speed MIPI CSI-2 data.=20

Removing this property should allow the peripheral to use its proper
high-speed default clock.

> +
> +	ports {
> +		port@0 {
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260524175312.1095=
2-1-lech.perczak@gmail.com?part=3D1
