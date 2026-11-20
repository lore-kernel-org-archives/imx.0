Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200269;
	b=3mMbTO+yymX9Gm/PLDofsg2bLxXjtkP8jzuNkCq/RYm8mDoSNesEXWSSUmLsXwyvwhYy
	 kk/r1hffJiHfCfHa4aHzvvfTkx4wzWdT8Xm8VPVsrAN05rYGLR8aIvTkOd71YEYHscmNN
	 meBuQrR13r2HT1V7WIAu2j2JhaDJdJqMk90lB4B1Y9x4rDKq5OajCMrkSbm3YPOx8kgiy
	 BeQ1l1zfBipyEgTwD6CLqAbNbr6Lc/D/gi/4fbr8ovEQb7J4TkmSk1o9MEsxzDputf6zd
	 MpfP/PEVm6YFZOJHxUGh0oP06GHGkJUxgjic3b4j+AaOCTKu9xmWLslXy2aM/U4nz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200269;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=OuWX/TjJTIEM4gZ01JWFBYGCExOJtIC5g6Fx6gfgvBE=;
	b=UfBxiBaazck4ZMhowzvfQD0uEwdj28/XvLFAwEyEre4ftCtErdQTXo0oOIxR15MBWVge
	 cJS2hPIqUASzGJPZWjJyeNy5WSjgHanBs+B/+0IjmRMEFHdih37rVz3autWpNrW9WRUdX
	 A+0g11A19yVnvhhcjRxtd7cHCd6jOL103WbPq2NENKq5fL0IYlToNGCvZ0GYVJD5DANgQ
	 h1EKFHyT/w+7wQispPu8gmgdLmbPaQKXzAAMRMsIZINWikvhMZWyQmQ68PycD+OUbN8Aj
	 1r5HwdulzOOBSnPY+E5P3Y+01YH6ORtHzxDBcfObXlYMUDEiMw86F0L7G4UP2srdCvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkJ0YSe3;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D5B60A2602;
	Fri, 20 Nov 2026 18:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GkJ0YSe3
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB5331F000F0;
	Fri, 20 Nov 2026 18:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795200269;
	bh=OuWX/TjJTIEM4gZ01JWFBYGCExOJtIC5g6Fx6gfgvBE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GkJ0YSe3rHqBKWb4dGLcEVTCsSl/7jeNpevSHAD6FDU0K/Hf3luztYCvmKaGi3Z+J
	 beL2Mvid15mq8JdNjiRsTG4VJtYxpx4xY9yYUL/oaz9NJpRotBRsK0XC/yao2eIxSw
	 3fuabEq0Q1W8jOhnOuHGPs84jzJHRddyu2hebWhX1R5nJ0sdQvcCSSISCmdwU4NwHX
	 E8v1jBfXvs+QKRlW6hLSGTYnJQl1YWft7LTlQ2Z6RJL6qFNzWLNm4Xab6203OYI4gZ
	 Bes21R+OcpjTiv0ZRap4V68spbcRp5Tcg9HwNHJvfw1W4HXj5AKQSlz+OxHP0rG+bF
	 ebNtzPkzpq0gw==
Message-ID: <sashiko-outbox-225865@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefano Radaelli" <stefano.radaelli21@gmail.com>, devicetree@vger.kernel.org, imx@lists.linux.dev
Cc: robh@kernel.org, conor+dt@kernel.org, Frank.Li@kernel.org
In-Reply-To: <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
References: <cover.1795197853.git.stefano.r@variscite.com>
 <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 18:44:28 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [High] arm64: dts: freescale: imx93-var: memory@ node names break
  imx_rproc matching
--

commit 3b76dce88eb56af58d06bc8653db1a91c42100e4
Author: Stefano Radaelli <stefano.r@variscite.com>

arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations

This commit adds Cortex-M33 overlays and combined DTBs for DART-MX93 on Son=
ata
and VAR-SOM-MX93 on Symphony, moving the common M33 include into the overla=
ys
and reserving or disabling affected peripherals.

> diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso=
 b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> new file mode 100644
> index 0000000000000..51ec0beea7c9f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
> + *
> + * Link: https://variscite.com/carrier-boards/sonata-board/
> + *
> + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include "imx93-var-common-m33.dtsi"

[Severity: High]
Does imx_rproc recognize the reserved-memory regions included from
imx93-var-common-m33.dtsi (both here and in
imx93-var-som-symphony-m33.dtso)?

imx93-var-common-m33.dtsi names the reserved-memory nodes memory@2021e000,
memory@87ee0000, etc., and puts the region names in memory-region-names on
&cm33:

arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi:
	reserved-memory {
		...
		rsc_table: memory@2021e000 {
		...
&cm33 {
	...
	memory-region =3D <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
	memory-region-names =3D "vdev0buffer", "vdev0vring0", "vdev0vring1",
			      "vdev1vring0", "vdev1vring1", "rsc-table";

However, imx_rproc_addr_init() and imx_rproc_prepare() look up regions by
index with of_reserved_mem_region_to_resource(), which sets res.name to
the /reserved-memory node name rather than reading memory-region-names:

drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
	...
		if (strstarts(res.name, "vdev0buffer"))
			continue;

		if (strstarts(res.name, "rsc-table"))
			continue;
	...
		mem =3D rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
					   resource_size(&res), da,
					   rproc_mem_entry_ioremap_wc,
					   rproc_mem_entry_iounmap,
					   "%.*s", strchrnul(res.name, '@') - res.name,
					   res.name);

Because res.name starts with "memory@", imx_rproc_addr_init() leaves
priv->rsc_table NULL and ioremaps the vdev regions, while
imx_rproc_prepare() registers all six carveouts under the name "memory",
so rproc_alloc_vring() fails to find the "vdev%dvring%d" carveouts at
runtime.  In addition, fsl,imx-rproc.yaml does not allow
memory-region-names on the remoteproc node, causing dtbs_check failures on
the new -m33 DTBs.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795197853.gi=
t.stefano.r@variscite.com?part=3D3
