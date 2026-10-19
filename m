Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6FB48C41C;
	Mon, 19 Oct 2026 08:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792397743; cv=none; b=G6WD2O7NEbKM4PqxLOiLemawWJJaMKGp6NSqRz3xccMiCrp7XKo24Eqj4QGO557S+v0lDgBquC92oDcCLEBph3nUCiLy0YXHYvJfC1xZF/rC+kZvPQu/TK3buaad7AgVBcNRM5Am7roa5xq9eN9nmU4euTCK6/Uu/iZBUpuGhl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792397743; c=relaxed/simple;
	bh=vDns4ZMN4DxjsB8RYhzHH2tAx0kw4XJ8ux/feRqdBwM=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=JNiZ/yKnobbLqC19YkwstJ+tMdRC/ITf+GbjN7a2G8Iw6h/fUMcC3JJ9NngWMPiN/gNkgHMgz2MW/B95fUITiXLM4naERr76ShX8KqeZ1aRgCMbO/znQrI0HqrzRdMgE+hOEYX9dhhOaXhRi+ggutxbF32lcDdRn93zVyc5+7T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VQdzIBLw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VQdzIBLw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86FC21F000C5;
	Mon, 19 Oct 2026 08:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792397741;
	bh=H05R6fhpmuoy5+iNvLhFFe3ytIvyPoY7eoQREdM0FTs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VQdzIBLwqklX9MEjulaNxwNX5SwO3+7n2IjPlWm7BGQKtd2X/VRoL5c+rKIeC3QZ7
	 PE7ZsdAJpMAKYb+MdAdVXnYfG8LtMUi3ttr1pvqCoGcgfILOIfnEECXWDcjuItHN0S
	 0p4WIqW5tnsWtkhs7ymAjH8mha2sanJV6kQPeR8JQVI8CxizUs/Jdl4pZPIVR3eety
	 4qGSAJW5zvxR5cjT47kWZx7vDNlTZKag3vanPTtw7edMnmIeV6prFeGwDSsLCuetxp
	 JVqUPqDhYPG5ZnqT1M5UU+DiqkybKo5Avs++XUn2qCu2pJgJwE8rJNQ5ZsCAQM2BRY
	 kj2JBrXRyNBiQ==
Message-ID: <sashiko-outbox-176786@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: freescale: Add dual-channel LVDS
 overlay for TQMa8Xx
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <20261019080621.194103-6-alexander.stein@ew.tq-group.com>
References: <20261019080621.194103-1-alexander.stein@ew.tq-group.com>
 <20261019080621.194103-6-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 08:15:41 +0000
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] arm64: dts: freescale: missing Makefile target for TQMa8XDP LVDS ov=
erlay
--

commit d3dd5b226ab9afbea90194501219da137ea03c3a
Author: Alexander Stein <alexander.stein@ew.tq-group.com>

arm64: dts: freescale: Add dual-channel LVDS overlay for TQMa8Xx

This commit adds a device tree overlay for the AUO G133HAN01 dual-channel L=
VDS
display on the MBa8Xx carrier board and wires it into the Freescale device
tree Makefile.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 84aeff0e78cf2..3b3b1c51fcd6a 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -846,8 +846,10 @@ dtb-${CONFIG_ARCH_MXC} +=3D imx8qxp-mek-ov5640-csi.d=
tb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqp-mba8xx.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqps-mb-smarc-2.dtb
> =20
> +imx8qxp-tqma8xqp-mba8xx-lvds-g133han01-dtbs +=3D imx8qxp-tqma8xqp-mba8xx=
.dtb mba8xx-lvds-g133han01.dtbo
>  imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33-dtbs +=3D imx8qxp-tqma8xqp-mba=
8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
>  imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33-dtbs +=3D imx8qxp-tqma8xqp-mba=
8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqp-mba8xx-lvds-g133han01.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqp-mba8xx-lvds0-tm070jvhg33.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqp-mba8xx-lvds1-tm070jvhg33.dtb

[Severity: Low]
In the preceding commit ("arm64: dts: freescale: Add LVDS overlays for
TQMa8Xx"), the single-channel LVDS overlays were added for both
imx8qxp-tqma8xqp-mba8xx and imx8dxp-tqma8xdp-mba8xx in
arch/arm64/boot/dts/freescale/Makefile:

    imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33-dtbs +=3D imx8dxp-tqma8xdp-mb=
a8xx.dtb mba8xx-lvds0-tm070jvhg33.dtbo
    imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33-dtbs +=3D imx8dxp-tqma8xdp-mb=
a8xx.dtb mba8xx-lvds1-tm070jvhg33.dtbo
    dtb-$(CONFIG_ARCH_MXC) +=3D imx8dxp-tqma8xdp-mba8xx-lvds0-tm070jvhg33.d=
tb
    dtb-$(CONFIG_ARCH_MXC) +=3D imx8dxp-tqma8xdp-mba8xx-lvds1-tm070jvhg33.d=
tb

Since both boards share mba8xx.dtsi, tqma8xx.dtsi, and the MIPI-LVDS0/1 and
DC0 definitions from imx8qxp.dtsi, should imx8dxp-tqma8xdp-mba8xx-lvds-g133=
han01.dtb
also be added to the Makefile for TQMa8XDP?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019080621.1941=
03-1-alexander.stein@ew.tq-group.com?part=3D5
