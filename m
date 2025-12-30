Received: from delivery.antispam.mailspamprotection.com (delivery.antispam.mailspamprotection.com [185.56.87.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522CA32693F
	for <imx@lists.linux.dev>; Tue, 30 Dec 2025 17:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.56.87.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767117097; cv=pass; b=TJeFThZ/EVCk9i5Pps20qMHSc7UwGHQeYQiaWzYUI4Op6gD3ZUoxPWSG0FM0gwZ+HvjZ0F/cRODh+0spibpS2wYEFTVh1R/a+eFHCELXUaa9yVXAbVLI9vfTZNoxQW208lozPhgcyPaLYWeOW4oLOJ94C7ZIWyPNMIZIOF2PazI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767117097; c=relaxed/simple;
	bh=rbAp8Me5ipLrzK0s4yeINnwWURv6z0zvULOwHoV3Zjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QaGcDxYFBD/L0Lwxz3KHwr4zGfrBnPZFHxy+zMPnQSA0zucMWDoqXCn9EmLASJjLdsWS1jE+dnWx1pG1PHiVtmHkC/sdAJVfcRcfVBn0tBYBg2ieLdLmwVXZtHHtWOB8BmUcEIAw2xuj7fHn2jgMjpcOAeooBHBIj5Ddif0xJbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it; spf=pass smtp.mailfrom=valla.it; dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b=UkgzE9lk; dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b=oY3ZQkiB; arc=pass smtp.client-ip=185.56.87.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valla.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valla.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="UkgzE9lk";
	dkim=pass (1024-bit key) header.d=valla.it header.i=@valla.it header.b="oY3ZQkiB"
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=outgoing.instance-europe-west4-nljt.prod.antispam.mailspamprotection.com; s=arckey; t=1767117095;
	 b=hzqk1LxZb7XBaRRbEBiU87KfIrqJn9sQD5TUIYAkZVE1auox7PdkZLyW+5ZKzdukG/PhAJAx3Z
	  GHh4w7K6XSM/WeWo4OXgtoVCMXZcBD7ylL3hxyv4onibfhT1m9wlw6SgRqGkatn+WKeb2cztdY
	  TUj8rk8Veg2ImlU//HquRWTPa2HG3ITbyXc0UgydB9LXECWwlDkncMQmXZDljDf5oO0oxmtijI
	  F2pnnkYmndPGl36a16y9IRPzJIeqivbd5jkjH7yUcuntRHqL9bR/apuhlalAROIFYzEhs7s7l+
	  6HnI0DQxbIEmYpw730WSYmUvJPSn1qJfTBqRocy/26xdUA==;
ARC-Authentication-Results: i=1; outgoing.instance-europe-west4-nljt.prod.antispam.mailspamprotection.com; smtp.remote-ip=35.214.173.214;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed; d=outgoing.instance-europe-west4-nljt.prod.antispam.mailspamprotection.com; s=arckey; t=1767117095;
	bh=rbAp8Me5ipLrzK0s4yeINnwWURv6z0zvULOwHoV3Zjo=;
	h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:
	  From:Date:DKIM-Signature:DKIM-Signature;
	b=D6acXfP/eokPAR00R3wcWT+Gw1QZ+d+P5hAaA2ElpQqcne/TlIFSdsDFuzzHpVTHZ2mTAVZrg4
	  Zie43ECQNnh9D3kITfr5ipCqzYuSKjITuAu82OC8T+PsJ6lPhC4gVYmtIRgyp/eIWotw9N5pYr
	  /U5m48cLhfHqEkTJgvZuru8z+T5Dw+BOgc8jq6jDXr6z+amRKRsr3jKTouDVYx8YYjtJKwNKcR
	  4rsprn/O6UwlxpjZ65har01e13wfBOU7Cm2xFmhSohZWepPxTM8Bw2O8csJM2rE9m5+KXEdrgB
	  o/8hQVhXZ8x94U9yfBCbf39NZN2KSsX20DJph4lzLl7yzw==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
	:Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	List-Unsubscribe:Content-Transfer-Encoding;
	bh=m9PaIKfx0ypaAUCu3woRJo/bm3GevWJW36NU/5SDa5Q=; b=UkgzE9lkk4RSoZn3DaRu3ezLK0
	eLW+muvVetYPJTxWMPhjWQ62W/B2NUAiBr42AXMBkpBE7vlpMo8B3YC0eqEvxB9D8BD6q+Z7v4Fq2
	Xwz96/X6Y9/mOnlH4865d0WY9QxshO8tuypwZT7m3cgJpjN+zUlXSJyOS4Vh/+AL94I8=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214] helo=esm19.siteground.biz)
	by instance-europe-west4-nljt.prod.antispam.mailspamprotection.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vadsS-0000000CCDI-2Lan
	for imx@lists.linux.dev;
	Tue, 30 Dec 2025 17:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
	s=default; h=Subject:Cc:To:From:Date:list-help:list-unsubscribe:
	list-subscribe:list-post:list-owner:list-archive;
	bh=m9PaIKfx0ypaAUCu3woRJo/bm3GevWJW36NU/5SDa5Q=; b=oY3ZQkiBNW6lgBspY/QM72BsYg
	eCV8rd9gLD4Wk3GCYQz2DQLCPcLmXEFq6ndzIluocwLsEl2gYCqjuYAWaegvIjTO/vSTrLctGAWNG
	HQnt5d8N5eoKnbjuGWjMIEuEuwdSUF3zxRSxF2RNTmdaqnX+gu0HWHGUUzNAVjRGfOXM=;
Received: from [95.248.141.113] (port=63913 helo=bywater)
	by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <francesco@valla.it>)
	id 1vadsD-000000007p2-0fef;
	Tue, 30 Dec 2025 17:51:09 +0000
Date: Tue, 30 Dec 2025 18:51:07 +0100
From: Francesco Valla <francesco@valla.it>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Haidong Zheng <haidong.zheng@nxp.com>,
	Danwei Luo <danwei.luo@nxp.com>, Lei Xu <lei.xu@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: freescale: add support for NXP i.MX93
 FRDM
Message-ID: <aVQRCzq8-Q5FguTN@bywater>
References: <20251218-fpg-nxp-imx93-frdm-v4-0-cd3a9f6ac89a@pengutronix.de>
 <20251218-fpg-nxp-imx93-frdm-v4-2-cd3a9f6ac89a@pengutronix.de>
 <20251230171548.67289601@windsurf>
 <20251230172427.4f22ac7c@windsurf>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251230172427.4f22ac7c@windsurf>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.linux.dev
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: bb190d19226b362f157fd3ead1ae81f6
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vadsS-0000000CCDI-2Lan-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-nljt.prod.antispam.mailspamprotection.com;
	iprev=pass (214.173.214.35.bc.googleusercontent.com) smtp.remote-ip=35.214.173.214;
	auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
	dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
	arc=none

Hello Thomas,

On Tue, Dec 30, 2025 at 05:24:27PM +0100, Thomas Petazzoni wrote:
> Hello (again),
> 
> On Tue, 30 Dec 2025 17:15:48 +0100
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
> > I see the PMIC interrupt and the RTC interrupts are routed to the I2C
> > GPIO expander at 1-0022, so I imagine either the PMIC or the RTC are
> > triggering an interrupt (left enabled by U-Boot), and the kernel isn't
> > compiled with the driver for either the PMIC or the RTC, and therefore
> > there's no IRQ handler?
> > 
> > (I confess I didn't investigate more than that at this point.)
> 
> Upon closer inspection, I in fact get thousands over IRQ #100 per
> seconds right after boot, until the point where it reaches 100000 IRQ
> events, and the splat appears, with the IRQ being subsequently
> disabled. So it's not just one interrupt, but a storm of it.
> 

This recalls the behaviour seen on i.MX91 FRDM [0], and the hardware is
indeed very similar: the GPIO expander and the TypeC port controller
(PTN5110) share the same IRQ line, and if the first gets enabled before
the second an interrupt storm will happen (because the PTN5110 is
triggering interrupts that nobody services).

I did not see this during my testing - but maybe the probe sequence is 
different. Any chance you are not loading the driver for the PTN5110?
I see from your defconfig it should be compiled as module, but maybe
you are not including it into the image or not loading it?

The NXP downstream BSP is masking interrupts for the TypeC port
controller as part of the U-Boot initialization, as they are enabled by
default at reset. While it somewhat breaks the required isolation
between the bootloader and the system it loads, I fear this is the only
sensible option here, given this hardware limitation; this was the path
that was chosen for the i.MX91 FRDM (which has been applied today [1]).

> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
> 

[0] https://lore.kernel.org/all/aTBFCc-8NzeS4MzT@bywater/
[1] https://lore.kernel.org/u-boot/CAOMZO5DsCi6GHrkvLEZTjsLy1D02A2e83YgMO36b3EMt8B6c5Q@mail.gmail.com/

Reagrds,
Francesco

