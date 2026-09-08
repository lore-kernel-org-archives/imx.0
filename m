Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AF444349A2
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 19:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896416; cv=none; b=r2GaMK6MjdHE9s58W+q67Lnx7QFMDl/qbj20oZdNEVT5n+mxHdu4hmL5Jxd4JWuBlqy43JVaKEUyy9YwJP7e7Gn+s4xsB2qLA2Hiu3JAAouaD5w+ziCY2fJzlyu8J+WpHf4X7Hx4xipnRMB43Gn1D2qIdnFHsnzKym4pRF05KEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896416; c=relaxed/simple;
	bh=EsrGjrnP7IgSiDLJcakyY4ms71wqAvVcdyupbrs+ipo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OVu/PJzsMQPieE8tdhJelccEaRZq0iSojp1+5aSgGutDHqPNk1s8i21DQBzAEOvfeiwHSoAA+HDx7dfGiFftzsKzJqiuqd+fDdwN/1n6+K2ouqG3qo0S7lj2ePMBda+z7U/kosUnVLCUfPFSBv3oR6qg3D1nnCT5xSdx3M+PovA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYnVhdNp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYnVhdNp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-49b96837ca3so40284665e9.3
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 12:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896412; x=1789501212; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=EYnVhdNpo2xVpL7QWHFELWPeGNqBBfGsodP53ITjavUCFa+memvyewuc5PwVUCIhby
         9nIneInWxTtBiOb8ssFRZ2IBb/uC7OoWnkc5JYHD4Vyb6WQYYqzLTkGASUKOBP6ec6Tq
         SiGfE1tB8/IW6D06JYjAVM9p1XLLwwjg1cJlUQeAn7pr3pP2sP9S+QBmHeI2Qs5IDw7O
         go5vrWQ+1jnUp/PTFrOyqtUIEPZ6/sleUQiRPBVV4lpE4Ly90bF8hoHV/RA0kf/tN1YZ
         CnxamscEBxnA07Ick1+6aWgVHRd9xu6rWiEoki9TZtXde7nuuCVbeLd5kCSQHHo1avak
         iG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896412; x=1789501212;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzP/HtSzvmP6ZP70XBuHWUc2m2AKpgco5yULa/5Kmis=;
        b=ma7hNuGjxbL//2x4G7p/F59B4rgrrc+0DvMRIcit9dK86DhA20kNtABkOmC+H1MUHh
         ssNZB+sM8IahDkqMMKNApVj2V9qOi9rrTE05v34Tq2ebJ4CBiquvGf3NHxC0y322PYzy
         kGFVjSIO0Z7Pm6HjHDrXQuAtaZUHbyIDlZnk2flqW0oXBl63bCoppH5uCH+wND9QildR
         J4Fw1izSt75X4DDSbihILYCQb1spmlRTawi9DoIyelFApSMaVYS7VfIW8GVWQiDgK/pB
         J/blZE+XAYi7bT7k1Z21kVl7Al+y7gkIpTwiBzfxImVmi6Yxhj13a+II5JtgcP1wQitg
         Mk7w==
X-Forwarded-Encrypted: i=1; AKwUvBwE0izaRslkInlVmxwKPBG1iLB5EGq6z0S6bxc8a9J0bTOTyDe+4aCuglt3DkD+CsL+uJw=@lists.linux.dev
X-Gm-Message-State: AFuF++lSNN/yIbmHUKuDK58mJ5KpahQcUy7vO1zQLGUB0rLVqszzdGMw
	ejW7mdFs4ZTpQD/WqyCHck1Oc44rGECi9aXkNfTkLM4SjuZui1kZWlfM
X-Gm-Gg: AYBFou3LCj18j2AE8vlXxIkB6kYQb1bfedBXXLPo/NMD8aTAY7CaPIOW68lPHPL24Jw
	NEhnN4whV6tkv1es0FgqcuKARwgfG3YxifWL/Paj9VTjgTMtTEs7zR1/aF1bEO26VyHAvyWw9zs
	OF26TTCPrQFqd0onXGKlx82nblPTR78vQ5PHDKXcTUsuxMExBlZHJMzIA89XTghU1CA0IJ6E+IC
	ydVbs+ErSqiL4UOJBDntEFZ9OyRTSPxA1j3TbR7+qfFu2IE5P9D2QkFW47h9YDbjRYmHIGvooMH
	ZY8kQzDMoS7IShcsaCy8Z8KHiRoFgXgWLnDaseYuT1QviszrchoWgssfZjFFUBan0oYGmWkIdGz
	fjTfSlzni0ZFOzJFC6tARTY8l14e9dMlYliRNdaLj6NQ7wx4koMhXnepD9bMc0GycgQAmuYL7rp
	2whIsgw78QFIxSdZeu9D3pWItnBh3CgU2OFYfBXAm7Efp3syqiy8qvlSFwcvb+usshnBf6/SLr4
	mTjDDpcNQOVqk5jegPjDUtJaChsZtc8+jLK2qCdX+VhO9Dbv3lyZ2yxjEENdRvNPa/+C9nChZge
	v6FbPiK6Hq/1GPx3XSHv3pw+
X-Received: by 2002:a05:600c:a087:b0:49c:d26a:cf70 with SMTP id 5b1f17b1804b1-49cf825a75dmr321721005e9.15.1788896412155;
        Tue, 08 Sep 2026 12:40:12 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d20fc1be3sm991795e9.4.2026.09.08.12.40.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:40:10 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:39:36 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Drew Fustini <fustini@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Stefan Agner <stefan@agner.ch>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, 
	Shawn Guo <shawnguo@kernel.org>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH 01/13] ARM: remove sa1100 platform
Message-ID: <aqBhF5oS1A2W6dAa@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-2-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-2-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:51PM +0100, Arnd Bergmann wrote:
>  62 files changed, 19 insertions(+), 10501 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> diff --git a/drivers/rtc/rtc-sa1100.c b/drivers/rtc/rtc-sa1100.c
> @@ -275,18 +275,10 @@ static int sa1100_rtc_probe(struct platform_device *pdev)
> -	if (IS_ENABLED(CONFIG_ARCH_SA1100) ||
> -	    of_device_is_compatible(pdev->dev.of_node, "mrvl,sa1100-rtc")) {
> -		info->rcnr = base + 0x04;
> -		info->rtsr = base + 0x10;
> -		info->rtar = base + 0x00;
> -		info->rttr = base + 0x08;
> -	} else {
> -		info->rcnr = base + 0x0;
> -		info->rtsr = base + 0x8;
> -		info->rtar = base + 0x4;
> -		info->rttr = base + 0xc;
> -	}
> +	info->rcnr = base + 0x0;
> +	info->rtsr = base + 0x8;
> +	info->rtar = base + 0x4;
> +	info->rttr = base + 0xc;

This drops the layout switch but keeps "mrvl,sa1100-rtc" in
sa1100_rtc_dt_ids[] and in bindings/rtc/sa1100-rtc.yaml, so a DT with
that compatible would now silently get the MMP register offsets instead
of the SA1100 ones.

> diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> @@ -614,16 +614,16 @@ config S3C2410_WATCHDOG
>  	  be called s3c2410_wdt.
>  
>  config SA1100_WATCHDOG
> -	tristate "SA1100/PXA2xx watchdog"
> -	depends on ARCH_SA1100 || ARCH_PXA || COMPILE_TEST
> +	tristate "PXA2xx watchdog"
> +	depends on ARCH_PXA || COMPILE_TEST
>  	help
> -	  Watchdog timer embedded into SA11x0 and PXA2xx chips. This will
> -	  reboot your system when timeout is reached.
> +	  Watchdog timer embedded PXA2xx chips. This will reboot your
> +	  system when timeout is reached.
>  

"embedded into PXA2xx chips" is better.

The RTC_DRV_SA1100 help text a bit earlier in the patch also still says
"built into your SA11x0 or PXA2xx CPU".

Thanks,
Karl
