Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75293B19A8;
	Wed, 10 Jun 2026 09:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781082712; cv=none; b=X/U9RWxUQ1Gat1lrnaVxUiy7+WMrOPN4J6rm+Z81kkpKZrouk5CBFJsWakO+KM07BKbM7uiARynnnS0oh+VvNWuDT8kVru0drX3sTeJeeRIRK6WVUWXT8d+TLAngPKUTmbzeuzy7IPnTyJYxDbXbBHjHgqkSf4TKGGHUJ9eCAnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781082712; c=relaxed/simple;
	bh=3pMmUA0pCExtnhGRHsjnDWYqFdRshu8yKuBqlljB5rQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TN89ALJK4fFHsLCwdBMcgVBzPyjhoQJsxGukVJe/Xyv//3QPfRA7D1JYmMoVFp4APLu4I/xDDpNMzTnTYsGea4xCvIdpXGPioqsOHFPvSmicQwrEAETrRiqwgpww1gk5sdMhE4GpE/y3O/QREWKdyQBzf588V/vYvKAT1u8gzrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASnBvUX/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASnBvUX/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 184931F00893;
	Wed, 10 Jun 2026 09:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781082711;
	bh=VSJMaGiOx2gc9tKTp4mtpU+286t+uOK0Z8ZyTmEiUXU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ASnBvUX/Ex73udKZzpRGZpMvbdhueutFHixHLCFFV2EEIm14qHn8TW4zGbuXtFKVI
	 ZeDL4X0SOyrtLQKMbtuAyc4LMqxtNUJTBuWabbj4u4STleVN3I/oT8nnzJsBwNSR3t
	 dBl9nTLPukU8j0ofrMaozWJREPvwG04wKIFlqNXSxv7l80HP2r7h/K1xqv6uw0RP7B
	 YjgTAciO8tyCqMgj88DgouthfLGWeGXCMll3ZUttk29Wpl02NQV9wQRic7Nb/bOrAT
	 AaEXYO6fTkrBcWgFQarkT875sekf0nQeiO1y7eGiSdgzHPRzaA7rSFzugdNa9C8UVQ
	 w23XWUwJUi+Sw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 3/3] arm64: dts: imx8mm-var-dart: Add support for
 Variscite Sonata board
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, Frank.Li@kernel.org, robh@kernel.org, imx@lists.linux.dev
In-Reply-To: <2fd914cc7af53e217cfdb21713fee8eb7007f42f.1781024557.git.stefano.r@variscite.com>
References: <2fd914cc7af53e217cfdb21713fee8eb7007f42f.1781024557.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 09:11:50 +0000
Message-Id: <20260610091151.184931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Medium] Commit message claims 'HDMI support', but the device tree does n=
ot contain any display or HDMI nodes.
- [Low] Unused pinmux configuration for GPIO4_IO22 in SPI pin group.
--

commit 4503e51abf44d2c1fc12465dd4301df16f97a703
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: imx8mm-var-dart: Add support for Variscite Sonata board

Add device tree support for the Variscite Sonata carrier board with the
DART-MX8M-MINI system on module.

Link: https://variscite.com/carrier-boards/sonata-board/

> The Sonata board includes
> - uSD Card support
> - USB ports and OTG
> - Uart, SPI and I2C interfaces
> - HDMI support

[Severity: Medium]
The commit message claims "HDMI support", but looking at the provided device
tree, there don't appear to be any display-related nodes such as LCDIF,
MIPI DSI, a DSI-to-HDMI bridge, or an hdmi-connector. Does this patch actua=
lly
include the HDMI support mentioned in the description?

> diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts b/a=
rch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts
> new file mode 100644
> index 0000000000000..93b0076987b82
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mm-var-dart-sonata.dts

[ ... ]

> +	pinctrl_ecspi1: ecspi1grp {
> +		fsl,pins =3D <
> +			MX8MM_IOMUXC_ECSPI1_SCLK_ECSPI1_SCLK		0x13
> +			MX8MM_IOMUXC_ECSPI1_MOSI_ECSPI1_MOSI		0x13
> +			MX8MM_IOMUXC_ECSPI1_MISO_ECSPI1_MISO		0x13
> +			MX8MM_IOMUXC_ECSPI1_SS0_GPIO5_IO9		0x13
> +			MX8MM_IOMUXC_GPIO1_IO12_GPIO1_IO12		0x13
> +			MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22		0x13
> +		>;
> +	};

[Severity: Low]
Does the ECSPI1 controller or any of its connected devices actually use this
MX8MM_IOMUXC_SAI2_RXC_GPIO4_IO22 pin?=20

The ecspi1 node explicitly defines its chip selects as <&gpio5 9> and
<&gpio1 12>, and it doesn't appear to reference this GPIO.=20

Could this be an unused pinmux configuration left over from a copy-paste th=
at
might conflict with other functions needing this pin?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1781024557.gi=
t.stefano.r@variscite.com?part=3D3
