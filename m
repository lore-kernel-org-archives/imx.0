Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16DB191F94;
	Thu, 25 Jun 2026 05:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782365206; cv=none; b=LbRLXOlnFw51edpGthzinPVE4vydcDaA8tjZs6cu5Qiqj1z7HyBAeXfJiEH4T2HRmlOvnoZPODSAnOW9Fq+/jfQjRHyYkUY2j7S9Sg+jx80TC9TWFWZBHNIOTt9uO6Fw79mW9bQNauWxx+jmMGhpsQx3QtA2A2LakyA+WuulFSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782365206; c=relaxed/simple;
	bh=+EF8TXLPkTMaJvaeXigw75SEH7hYsO1Ag5PRYd+lfic=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=j0b31oQpqxjQ6Z0ZsefRwqzLIFDiUffKS9/f9RAUSLnIWaXVzYpZCsuzuzn9Je8Oc4zr3pR63voIAAl1B8E55i+9VWOKaE6SqvpqVwrbu2/epLX/zgIIUr8gUfGBaProiCMd8jBntfy+wrbXVWRL1fEfMxJAx7m3xDSEfdUmTwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HTetMVaa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HTetMVaa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 100221F000E9;
	Thu, 25 Jun 2026 05:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782365205;
	bh=vWbFoRGI5HdCA91YpMFbxyn1on5yMua0IwZRHIci0t8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HTetMVaahOhe6wxggBPaDlOmVSB/rcR7L4YqPr2FhcliqxOGcFeu81sNJTsj3Lvez
	 UbiXVGpC+pVMZEcZUlkDURl05kFpRvFCmCYFWdTKHuF7uCLj0xmDGevXshw+bi11Ny
	 Qk/ubbZJAIrCT4saag1IIqciFC/sKwqIprmG/753/peYp0v0ULZ9vY1K6SghHTqKhm
	 Gok1BlgGX1DBGQo/JMo4YHHZynkuY7YjMDpq6acZ/9KJ7tvSpPaOxN+dyTIaih48l5
	 OC7em33eyuC8HMSazGUoovKMl1h5W1CfbDtB+a1HWSRdydB7JQDxZ1RHBs9r1ICNAk
	 0GjcbJpwk/BMw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 3/4] arm64: dts: freescale: add LVDS overlays for
 TQMa8MPxS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: devicetree@vger.kernel.org, robh@kernel.org, wsa+renesas@sang-engineering.com, imx@lists.linux.dev, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260625051449.2560197-3-alexander.stein@ew.tq-group.com>
References: <20260625051449.2560197-1-alexander.stein@ew.tq-group.com>
 <20260625051449.2560197-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 05:26:44 +0000
Message-Id: <20260625052645.100221F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The standalone `.dtbo` files are not added to `dtb-$(CONFIG_ARCH=
_MXC)`, preventing them from being installed by `make dtbs_install`.
--

commit 11ad35117d23241efb0a2ebb767e914a535c2a98
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add LVDS overlays for TQMa8MPxS

This commit adds device tree overlays for the Tianma tm070jvhg33 display
supported by the TQMa8MPxS on both LVDS channels. The display timings and
pixel clock are explicitly specified to achieve the correct LDB clock
frequency.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 7a1d8586ce7c8..f0779a5d3b737 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -379,6 +379,11 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mp-=
ras314-imx219.dtbo
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvh=
g33.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpql-mba8mp-ras314-lvds-tm070jvh=
g33-imx219.dtb
> =20
> +imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33-dtbs +=3D imx8mp-tqma8mpqs=
-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg33.dtbo
> +imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33-dtbs +=3D imx8mp-tqma8mpqs=
-mb-smarc-2.dtb imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg33.dtbo
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpqs-mb-smarc-2-lvds0-tm070jvhg3=
3.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8mp-tqma8mpqs-mb-smarc-2-lvds1-tm070jvhg3=
3.dtb

[Severity: Medium]
Will this omit the standalone .dtbo files from being installed by
make dtbs_install?

The dtb-$(CONFIG_ARCH_MXC) target adds the statically merged composite .dtb
files, but it looks like the standalone .dtbo files are missing. Without
these, users wouldn't be able to apply the overlays dynamically via the
bootloader.

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260625051449.2560=
197-1-alexander.stein@ew.tq-group.com?part=3D3
