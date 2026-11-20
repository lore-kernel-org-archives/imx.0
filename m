Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795200438;
	b=ji4vPcTfDUR7BPAyCeeKsgEEoOzS4baOclieWLn+6WvCdz2ML+21/MyTrFbObO9jdkGi
	 yU3mI2Rz/VxahpaPsOJdripywqKtnoywZKbpovH+Ys+Ugc0OgczAa1nJYMA5+9CG2mwyp
	 L5y1fpRXnMggB5LmbK3iYoBCswMR7Z9FZWIc6a19rBAxf65ZRoMxu92iJ7pU2MTTXBgP5
	 XyvPps5ALERB/XMkEyNfveIrjGjoUtl3H+ufp1qizrou6E+n9E+Qwo+3vEowHCa79s+6g
	 GDdDaklgFQx8YLi0wadvEchl5fUaQz4uYnr1W55V7EoYtGod3vJ/fp5GPAlXcXg4MHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
	b=Yyb83akaljXQm33ahtqqE4ANQHTIUPCeibGOqdLubQCzccPWAfFbEukDDG/jjvjlhb/z
	 IluKeY3XqFWPg5RseGqnQXxrNfOb3mM6nUQNOFnhhoyNPOGiHwMhwQkmD4q4yzZ28KYCY
	 3prv8huAJs62EXc/fqK1MMk+X2klkI0fHgsoKR47h0fk1CR/sRK0TGy89mag2IM+SQj8h
	 Kh5Sk7iDnMyPgsmNKDMkDNSfgr//tNcBiawoQjFD/xANACXNeTZQ8NK46nqb7Y5hF1VS3
	 6wqXGp7VSAjNyRdKfJTFKbRoRA2wmW5igVkU8wOb8Zv/FqVQigyoefO8HV5vCzw19Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyXSoAah;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C01606A33B
	for <imx@lists.linux.dev>; Fri, 20 Nov 2026 18:47:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 22C01606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XyXSoAah
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e3b22e971so699868f8f.0
        for <imx@lists.linux.dev>; Fri, 20 Nov 2026 10:47:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200436; x=1795805236; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=XyXSoAah48qbYN/NRkr4nYdrEIIGJndZjwcdrBv2IZNvRouBGX6c5WJNSrYFKINMY1
         QDc5MRSTWnAnTjnEr/80k2Lb6fP6ZKFz/3ronb2WFj0+lHkz08a2LIcKMRFw9Eh/MrHs
         bU5Aic4c1Ml2HCRl+h5gVGaJxQK7VCK9LRFh2xKKIm8OczWvycOdlQ+u9vlDdHXYhQIX
         k0H4dZyPejWyIRf2hL02+TlMHGnoeVU9JQF6FIRrLC6E+Tty211Jxq9HLiP8ploLcswG
         bpjTm6mcTUdqoz8KqhuHtUZiaaSt+XOHfh7s+WiluRFEETxp7D2DeFHLuyJ17D8Tlmxm
         OBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200436; x=1795805236;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ewcUplbKFZ3Kf41zlADgLuzbjc/2lDvi2YHHk/8wcoM=;
        b=uFiANEBFz5F8YSy7Hw6rxsg+xmmHFYUIOPVEUZs+GOCdCozJT3DAKx1pRe3xokDeLZ
         lru6h69f4qv3YZziK5BgsTzJG7S7zz/PJ/mDGuH4Xh3sK/l/4gqXPZNvYl5DneoM3MyY
         se9aPbCJqRc/AKO1lfWfJsgET4tbMj9M7+9MyHPSyS/bzb3Ch15tAKP6BYshirzor1J+
         /sSCET5nxicEFSplClM48Tl3L4U7u7sCLPTlT9W9GJ2BsFfWQka9iHzVVVDs4WcZ8EoZ
         zwpmEmLZLn0Jd6vHzjDIaouRZrlbgMmvmT1jgoHWu2UcTDq//mcauHAsVuSXQ+iCbdwA
         5t8w==
X-Forwarded-Encrypted: i=1; AL+hErF/oh+FqqVg2NH/TPCaS3l8sAH5n3nUkfj9wcvZchCMM3pSlHXs959zaNXjr8ArcU/GXvc=@lists.linux.dev
X-Gm-Message-State: APuU4Z/QkebRFPn5O4eJR8X0bwt7W6CCps0xOuLFhWtTbbdQwzLZIcUa
	AjT83gfKMAGl0bY6eLddoPuHm7lps7tRka7NDL6AlVFHq8NhOlsuoakn/+Pdzg==
X-Gm-Gg: AZFdTZezxiWSSUf9FErlh2Mm1IPMHFuiNygLlXkrR4OYziOmDB1zhNVEh4id302TGCa
	j3x1rmpn3pNcXijR/qnvj4jQyzxFfjwSfLmooGrXcxCWQ2gJ5UMlKbwAF4YP7p0k/PVpkcPXTpm
	np5JDyXr0h7MBF1hHMn6cgVRJhUq00IcpuwuuaDhOm2+eNEafza8Ajmuo8glpuxs22fkUqN69lH
	LAJ0Wpltk2Q36WYR+GgV8kyCVeB35vq8H1koDKyxmtHPP5iQloGVNps4Y6hWSui3txdrKenwOEr
	FnTuUqjTDqfwtmuEwhjZdrPmuACn542AB5c/qUNJ/zvEcA2AYciJewjoGo1tCxbW0tAmEFP+xGL
	OK4PwlOzPH/wg0hMbOj/3DmDOUvfeqoCQyG5T/4SixHcTFLSWWmauODgKn3swwr0K66t3vyBIMa
	2aHMz/rnsP5MLA8Nr4faxGp8p3Q1WpcvfHo0vJwnTco2ERIXxBFIpWniwcm2G9CPez/vV/skhES
	XFFEaH1/puwZpg0Y1uDp7nAthly6voaj+WVn9a6DGBooaE6HCs7EtMVKVCWFXTmvi4/oIWt3yw0
	ZnudEjf4hBYjiEeuEFRZmOZ8a1lwu554bTkEJN/Pmr4rkhMCoTPFjYvug/WsxtCKhZRMdqfr93R
	/zDNSaegU2vkozr4OqPFoG5rRzgCzIlj2Bgya2e/N0PjLXh95DHGQltspRiYz/wI/Go/xKt4Vpp
	o=
X-Received: by 2002:a05:6000:178b:b0:4a4:f208:6a46 with SMTP id ffacd0b85a97d-4abaf740208mr9570917f8f.13.1795200436455;
        Fri, 20 Nov 2026 10:47:16 -0800 (PST)
Received: from GLaDOS.station ([193.207.36.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm7490817f8f.31.2026.11.20.10.47.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:47:15 -0800 (PST)
Date: Fri, 20 Nov 2026 19:47:13 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org,
	conor+dt@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v4 3/3] arm64: dts: freescale: imx93-var: Add Cortex-M33
 configurations
Message-ID: <awCVsf3BF09a0ukI@GLaDOS.station>
References: <cover.1795197853.git.stefano.r@variscite.com>
 <947a7bcf39d89b4a162f296278ccaa3db6512983.1795197853.git.stefano.r@variscite.com>
 <sashiko-outbox-225865@kernel.org>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sashiko-outbox-225865@kernel.org>

On Fri, Nov 20, 2026 at 06:44:28PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] arm64: dts: freescale: imx93-var: memory@ node names break
>   imx_rproc matching
> --
> 
> commit 3b76dce88eb56af58d06bc8653db1a91c42100e4
> Author: Stefano Radaelli <stefano.r@variscite.com>
> 
> arm64: dts: freescale: imx93-var: Add Cortex-M33 configurations
> 
> This commit adds Cortex-M33 overlays and combined DTBs for DART-MX93 on Sonata
> and VAR-SOM-MX93 on Symphony, moving the common M33 include into the overlays
> and reserving or disabling affected peripherals.
> 
> > diff --git a/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > new file mode 100644
> > index 0000000000000..51ec0beea7c9f
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/freescale/imx93-var-dart-sonata-m33.dtso
> > @@ -0,0 +1,55 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +/*
> > + * Cortex-M33 support for Variscite DART-MX93 on Sonata-Board
> > + *
> > + * Link: https://variscite.com/carrier-boards/sonata-board/
> > + *
> > + * Copyright (C) 2026 Variscite Ltd. - https://www.variscite.com/
> > + *
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include "imx93-var-common-m33.dtsi"
> 
> [Severity: High]
> Does imx_rproc recognize the reserved-memory regions included from
> imx93-var-common-m33.dtsi (both here and in
> imx93-var-som-symphony-m33.dtso)?
> 
> imx93-var-common-m33.dtsi names the reserved-memory nodes memory@2021e000,
> memory@87ee0000, etc., and puts the region names in memory-region-names on
> &cm33:
> 
> arch/arm64/boot/dts/freescale/imx93-var-common-m33.dtsi:
> 	reserved-memory {
> 		...
> 		rsc_table: memory@2021e000 {
> 		...
> &cm33 {
> 	...
> 	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
> 			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>;
> 	memory-region-names = "vdev0buffer", "vdev0vring0", "vdev0vring1",
> 			      "vdev1vring0", "vdev1vring1", "rsc-table";
> 
> However, imx_rproc_addr_init() and imx_rproc_prepare() look up regions by
> index with of_reserved_mem_region_to_resource(), which sets res.name to
> the /reserved-memory node name rather than reading memory-region-names:
> 
> drivers/remoteproc/imx_rproc.c:imx_rproc_prepare() {
> 	...
> 		if (strstarts(res.name, "vdev0buffer"))
> 			continue;
> 
> 		if (strstarts(res.name, "rsc-table"))
> 			continue;
> 	...
> 		mem = rproc_mem_entry_init(priv->dev, NULL, (dma_addr_t)res.start,
> 					   resource_size(&res), da,
> 					   rproc_mem_entry_ioremap_wc,
> 					   rproc_mem_entry_iounmap,
> 					   "%.*s", strchrnul(res.name, '@') - res.name,
> 					   res.name);
> 
> Because res.name starts with "memory@", imx_rproc_addr_init() leaves
> priv->rsc_table NULL and ioremaps the vdev regions, while
> imx_rproc_prepare() registers all six carveouts under the name "memory",
> so rproc_alloc_vring() fails to find the "vdev%dvring%d" carveouts at
> runtime.  In addition, fsl,imx-rproc.yaml does not allow
> memory-region-names on the remoteproc node, causing dtbs_check failures on
> the new -m33 DTBs.
> 

This series depends on the following commits, already in linux-next,
as noted in the cover letter and in patch 2:

- ebb21cc5d1c0 ("dt-bindings: remoteproc: imx_rproc: Document
  memory-region-names to avoid implicit ABI")
- 8396089f91fa ("remoteproc: imx_rpoc: Use memory-region-names to avoid
  implicit ABI")

The driver change replaces the direct calls to
of_reserved_mem_region_to_resource() in both imx_rproc_prepare() and
imx_rproc_addr_init() with imx_rproc_rmem_to_resource(), which reads
memory-region-names into res.name. The binding change permits that
property.

With these prerequisites applied, the generic memory@ node names do
not affect resource table or vring matching.

The reported issue applies when the series is evaluated without those
prerequisites. This series needs to be applied after them.

Thanks,
Stefano
