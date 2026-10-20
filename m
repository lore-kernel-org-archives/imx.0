Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792504800;
	b=H7F54dV9Nj/WX1ukJ2Dh3t6SIPFtyQncpnVHSBbksfnuEgRr/S/1z6I4wnO/YTlW4bJ1
	 9uWiWWEwhhP4UdYFV1NEF9e8D49l0ZXMPmKrvoxf7QLTekKcFfRmAP5ZVRk4yS6sYg8fZ
	 LRjTbgE7g3LtSkhoGDinqgbULE/aY5VuJuqvOXIhaB2K4jGLRK3Hbah+nW24GyvaiXXCU
	 cHeJKUNgUgb9wkqyRCk3PTdCDqAFhQ5+4UVi0z6a6glsveUbrO+n1usQgFPyqk8aVDpeE
	 uycY7ksEOSkn4OoShZBG+qCdraNkKIscJS28M1WCGTmjws6OnWh9WLLhP0xMcPAvvgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792504800;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
	b=vEcfEpa2Ets8P7y0BlCizsFtx7YDGjkuObKEwq0ajbaVUV6ItDsKqBZB2oGrpvECwSR2
	 IqXRKZCgDS1zDLfNLK8OoOj7G2gJM+0VV92scDx/p8DHHzdK3k+h1+XHxZ4qHFJ7rMci7
	 EC/f1HRQNUytVc+F7sITvuZcouwD5cqvo1DRfMYqUPeOy2pllvW3HT7LBa1vrIxJdqh8p
	 eM2U8hFwobDYf2flpeC8rODWbdHXWMI00nTbEG/EiGXOIzqoHwcFhY6FrNhMza5IYCMV3
	 NU1BAV0axafqlZdDQAzC71uRwpALuvfbFZkqG1j6y4L5moiHHevwN/3XrLaBTnItW3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0XKwlWD;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 962B9606A31B
	for <imx@lists.linux.dev>; Tue, 20 Oct 2026 13:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 962B9606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z0XKwlWD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a1e266fca2so18059535e9.3
        for <imx@lists.linux.dev>; Tue, 20 Oct 2026 06:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792504798; x=1793109598; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=Z0XKwlWDT/EO3+GizcRMFSOyjH9ODAkaJkBLSsTC1+EvhLGdB0CIuV8NfoUbgXap+9
         tQeettgU00i0vqidKOaTRp5gr2ILxOYGXhNxTgcSyS5dDAZDlVIQLx8h9CaIXcTzQSK9
         3MBDiv45ZNTyllRq6Op3Cunl2BQsOWXW7nZHzGvBLF1pLpo8frrv+3aEsNSaCcc8PRvx
         FgIkWzLFY2AIu55DSgrVQ1HHNY55JLWF53q/0RvukK5Xi+dIuDiU8nRhdyZmXP4gq2Vp
         QmCoeDP7zy9sYpyJPZ9v6VMBOrd/f92GlyBPVntxvM60sN5AzCQjuslkotmeTnNFoSK+
         CWMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792504798; x=1793109598;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PnBOhXvJIJK4VLpTdrp7cs6iUz2XtC8WuEePd4QSYVU=;
        b=fDbnujaF8ImE7uZxrH90OT/SkX7EB2q1X9uoQqPGCIWVopqC8szrIIE1AnUulaBiuy
         m+nAjrS0fQOFlb2pjVWjIc/1jQQK5eEGGHPp/nKKNzsQXqp/VJLpiR/yYa4GVtQFQser
         dYG0hinm2Mo6yxpAzal5ljC0Wwkw+Oe+OxMRVWwYHbyGGLhqMMt8TO4D3D+ihC3HkmDr
         IHfdxYP74wrhXDyn17CzNJ9Wgx+baWQvxbcA0xdqw8oFws6btwVnR8/aK0/jFdR3E6qK
         zZ/nZDA9Htf3eBM/Q1XBH9zacsQaf5DaeHRL7HLs7iZ2xqFiaWpzhZRIpRvy6ZrT6gK7
         IUkA==
X-Forwarded-Encrypted: i=1; AKwUvBw8N6sYeWLTH400EVxq2Shuu3VJdQAbI/V8mEYZ7BuX0hq2KWMwOFKEwfR/4jDPkxqBmCk=@lists.linux.dev
X-Gm-Message-State: AFq9FYK5cpdGrgMrvM9Mazz04PES3eBzt2RNHSMjfokDgwk0HzcsU71w
	E0JueB+9VnnP/h0IczZw8IFj1NHeipMut2O3LncVT83lMPr+sWsyo/Yj
X-Gm-Gg: AYBFou2HVsBlM2IPsk3ukSozf29qpK17+LRVn/j75TOp3S4alI2pX5pwgC2ABUqyfLc
	nIZBHtI+oxfyu5Z1ycw8blr7L3G5jV6v6PbLHr7APqgVnSzlyLik6DFOX8O3JXK6GMCPTEIvf/M
	xyGPrbrdu1oSOQL1Rc5ZPUzw+JFTyVbRKqZ/SwXZVd5wVHMr3n0148OVOIkoqumWS+AFEaqyacI
	k0r5H98aP1WnYP6gyCGOoXnaFBA7n4CW3jLCU6O0L65XfQ97qXLBo0jyG+NycDLFIu9bF4qKsbY
	xfMylGPWcuRgup09imBUmjQink+dE+J2PvqaDNVzXxJAgbS5LjgyJVwwWBR8lFfWN5VsKyd1VV4
	arGTYm9aQWsN0OU/odN1jmRGVWHzNcIKVkuE8XXoK3408VggEzYGLoU6ucFQLLIMJNsTOIcW+QJ
	R0TAnJ8zGvvDakpALaKODcKezB701s7R4t3LfgitJJSl2BHSNc9H36iKGpRc5/I0P5UDDOOEyFx
	f2wwKBzlX0//R5qW9YX9FgNrLtBdSbl3zOLHU81MmcKkarUGL/k1VB4LMF0PhQbT3T98eF0xxCH
	D7/COAxJvLSi6CZZm2SQQt4o1ehi
X-Received: by 2002:a05:600c:c082:b0:4a1:f377:5c6b with SMTP id 5b1f17b1804b1-4a1f3775fa9mr44357515e9.7.1792504797648;
        Tue, 20 Oct 2026 06:59:57 -0700 (PDT)
Received: from Lord-Beerus.station ([93.66.71.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d8214e1sm6231804f8f.37.2026.10.20.06.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 06:59:56 -0700 (PDT)
Date: Tue, 20 Oct 2026 15:59:53 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v1 0/4] arm64: dts: Mark Variscite i.MX9 I2C recovery
 GPIOs as open drain
Message-ID: <atdz2TonrGyL9Ox4@Lord-Beerus.station>
References: <cover.1792326585.git.stefano.r@variscite.com>
 <20261020064106.197223-1-peng.fan@oss.nxp.com>
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
In-Reply-To: <20261020064106.197223-1-peng.fan@oss.nxp.com>

On Tue, Oct 20, 2026 at 02:41:04PM +0800, Peng Fan (OSS) wrote:
> On Sun, 18 Oct 2026 14:32:23 +0200 Stefano Radaelli <stefano.radaelli21@gmail.com> wrote:
> 
> > The I2C recovery GPIOs on VAR-SOM-MX91 and VAR-SOM-MX93, including their
> > Symphony carrier boards, are missing the open-drain flag.
> > 
> > This series adds GPIO_OPEN_DRAIN to the SCL and SDA GPIO specifiers to
> > match the I2C bus requirements and avoid the warning emitted when the
> > I2C core enforces open-drain operation on SCL.
> > 
> > Stefano Radaelli (4):
> >   arm64: dts: imx91-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx91-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> >   arm64: dts: imx93-var-som: Mark I2C recovery GPIOs as open drain
> >   arm64: dts: imx93-var-som-symphony: Mark I2C recovery GPIOs as open
> >     drain
> > 
> >  arch/arm64/boot/dts/freescale/imx91-var-som-symphony.dts | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx91-var-som.dtsi         | 4 ++--
> >  arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++----
> >  arch/arm64/boot/dts/freescale/imx93-var-som.dtsi         | 4 ++--
> >  4 files changed, 10 insertions(+), 10 deletions(-)
> > 
> 
> LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> 
> BTW: Do you need fixes tag?

Hi Peng,

Thanks for the review!
I treated this as a DT cleanup since the core already enforces
open-drain operation on SCL, so I think it is fine to keep the series
without Fixes tags.

Thanks,
Best Regards,
Stefano
