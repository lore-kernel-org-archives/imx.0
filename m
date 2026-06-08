Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5A231715D;
	Mon,  8 Jun 2026 14:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780929388; cv=none; b=ZqcTw2X5kJNcfQY1Wdtn4ZX5UJQEo0RVz5LN/HGWkS3Yw9W5WZ8w0/JOouEQubSG1Q4YoKGJO4Tc4tHp3ahGQxuVW/6K8hfuCURG0geVWI7GTWSjdNIeEQoRJk8qedS2zDUNQe5cZ2xTjWNgaCEkh5QnTnq6GRw6ecqn7UMoKAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780929388; c=relaxed/simple;
	bh=eeloH2CPAV0NGS1ONf8jlDPaQK3iunh9sKplrksWNVg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=glHUY50fmorjKO6IlFSakmUUUgAX+lg3Yln02vwBBuhxzzssqP2Pc+YfK7KGY1UuA6493GMxK8ilajehx0nvqqyqQMnJkm/WceE12VeMw+4QUzmrbwWZUStveD9KxkCnXafLJznBTJR5L+WMKu28lR3hlQEnwkRqr+z90RD7bZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ETZD8WIa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ETZD8WIa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077311F00898;
	Mon,  8 Jun 2026 14:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780929387;
	bh=1TjF/SUcLOgcwYn9BAuzNJxc6B9SXYpl+8q8TVUxM2Y=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ETZD8WIaHmLTqeOG+dBPlNKZeKw0lk3/Z5K4jD4aFkoTXswHeYLVs0ul0J+PCnwiX
	 LGeIRHDaCqo4O/1anFb12wt9+hhJCjNWqEha0VbRhYHexKiQMHCzZ/LOMSAoeYgvnM
	 nhDnna0jYsvjrTrcvTlA0MTrJRFN7Ju+m4/ujniFExtGjtjKzrOjshn4WvfnRuFwDH
	 5+u7zmBzJTD6vMre+0f7LOMsuFd1bIChUwEpJjKWfOETtNAZrsAGU/E2i7PDmzV3aD
	 /r+Vm6npsL6gtkyzat74vzP40T+/WM35f+5sMA/FbD2A7oDpCHdysjCXHC/I7DPUae
	 GUDIa8j8rx5jw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/4] arm64: dts: freescale: add LVDS overlays for
 TQMa8MPxS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: conor+dt@kernel.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, wsa+renesas@sang-engineering.com, robh@kernel.org
In-Reply-To: <20260608142144.564871-3-alexander.stein@ew.tq-group.com>
References: <20260608142144.564871-3-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 14:36:26 +0000
Message-Id: <20260608143627.077311F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The standalone LVDS device tree overlays (.dtbo) are missing fro=
m the `dtb-$(CONFIG_ARCH_MXC)` target list, preventing them from being inst=
alled during `make dtbs_install`.
--

commit 94b1840d6358cc9ef625151682b73d4e243336ca
Author: Paul Gerber <paul.gerber@tq-group.com>

arm64: dts: freescale: add LVDS overlays for TQMa8MPxS
   =20
This adds device tree overlays for the Tianma tm070jvhg33 LVDS display
for TQMa8MPxS boards. It configures both LVDS channels with explicit
display timings to achieve a 519.75 MHz LDB clock.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 7a1d8586ce7c8..f0779a5d3b737 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
[ ... ]
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
> +

[Severity: Medium]
Should the standalone .dtbo files also be explicitly added to
dtb-$(CONFIG_ARCH_MXC)?

If the standalone overlays are omitted from the target list, they will not
be installed during make dtbs_install.

While the combined .dtb is installed, missing the .dtbo files might prevent
applying the overlays dynamically via the bootloader. Other overlays in this
file appear to explicitly add the .dtbo to the build targets.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608142144.5648=
71-1-alexander.stein@ew.tq-group.com?part=3D3
