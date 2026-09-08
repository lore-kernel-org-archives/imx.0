Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF6B743499D
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 19:22:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788895364; cv=none; b=IK4r0UHtUBmR8+vuFCkJkRFNDymg+/K9gNjF6xSfw1OLgYZGmHP53nMw+IepVB+QRC/UOaX/ho7cE+c0HVveK3P/aqcXji2+eus7UPqPQhBV8nc5icFqA5QUv7vIcfeupzruDNL3/ONl3zwc6A60xbl/6QhUnQJg3GRM/h8PfAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788895364; c=relaxed/simple;
	bh=BL1RUYoOl+2DCnnljwHrTpWKc1vt3ozShPXUSpVHg8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KE4W95nJ9swtp3kACUtbvU4zgEgfzs989Mdl+FsVFrU6eRYPiY+TiZEvsTrYkA8LaXsS8MV0ij8YgkdbNEHaZ8wh+0ksX440jIEiVr03idvx1nc4mwOqUBzTrVMO6nqZXt6J45cJp2xiFeNBZUw6T9scdIJmhIdnoh/vDdhDot0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hk9J6RUT; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hk9J6RUT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4957eefd361so39548335e9.1
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 12:22:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788895358; x=1789500158; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=Hk9J6RUTeM7jBBh9F5+kCpkEXaR80KPQYHECGUeXOFWW0/Fr2K7y7u2FmLZcvrIGT0
         9AOvvMvLVm5Q1mkOAyHdHUX5QrZydQ8p2tNgnYXId6rra4gDMF8BB11x6mPStz72c9yU
         IkADgsioaArn7c1JCI3ZYX8JuN4/TwenIs/xYlRSCaDuzHKDeG6fV/u3nlloC2SqK/Ex
         UnQjaEuU1U+3plI+o/X37Py+/6MuLhxndFPDtAdov6bKv+4FsUbcN+6p2Rhyjv40ilKW
         P1CfCoQJKk4i9vH/0EPuktwuTO8uhY3FILuLQd3thfWehL4bBn7ZQ7WzoaN3c+5QtWk3
         5WrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788895358; x=1789500158;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GVs4+8gm56Wnu6exUObCNgkOQEYDE8t6OW3Oqkq6qd8=;
        b=kOvUfwwcS2gksFXvM96/c0LoHQw1pefDiw7M5s5WlC8HresMJH6yE8Ld+EsUeTdLP8
         zDYqb3PFh5KHiimIuLjJw10Fmb3Srr8vAkRg1Wvee1Nw6SzyXiQ6MylGqArxjirNa/cq
         VGEbtd80qnw/HCdwoI9IEnlk6LQAHjy/MrFJzDXfycQb94+bhfdngBbWKyW+r5KO4oHh
         7XLcw5IYm/AL2Har5E4VY92D7Z2LrjsOmdh6DAsh23ipHONc8Aw2KwZs+EyRCOZm+Tjv
         Tt37lhWgknm6sNTu7zxTXKrqj5hXmqjr801bqJS2bUSbp2JL4qcsWGGfaRuNsq2AV50N
         vW/g==
X-Forwarded-Encrypted: i=1; AKwUvBxkR1mS/akNBnix4vwD77DXPtTKhEILrV5hjfSwEx8Snkdh+/hwukZdcZ4sWiou3Lo6g0k=@lists.linux.dev
X-Gm-Message-State: AFuF++mTn5Z3vWV1zGPLAK9XmwM+UatCsPGsY5jaGuvXfi06g6I322BA
	6D09OEFIFWxKlI7u5er67z/ZUlvSsehDYPr7YHT7pwADbmH/rTI4xeNk
X-Gm-Gg: AYBFou1B3pfIlTCVrWVNiTOdDf39bvK5PRdT7Oiudl7fAaFBjaF671CleUm/g2+qOAC
	MqSR6xQpmlgnKDEpPv5ulmaqao2+6Sn1Nwz9rs7EbA6xoglqAZU6Gx381OfAkf7XjVxh85BamZV
	BHw+K5eEZf4Ijn+OyDDpS/P/rrIrDaB5ps+Is0r+u9LYfKVoFW8B1XQzFlbTZ2cxAtqUf14Sq5p
	Y8x+KAquCGoRLPpkMG5plv6+Yu5f6HcpnCCNppujk+YfSVTm+fDBJ5PRhCtYVgzfZY806iNwWDp
	eXoiXarFVTbrTz1K48Q8eij2zIubtCg0G3GeoPipt9iWUIljNt4SaIeK76WffsO7GwOEsNrODAL
	eRxS9Dwz+wqRPr0gjqDuuKlV9ffG1nkeSZ8vu58AtNRGXeKjzDc/HlaL5JMNM2qy1yUid1Uh6cG
	QGVKle6xH5bjRKI5WAae3FZKvp5vAgFWoMkMQC9K7iid7o2JwQGPfGNCTf/k0pwwfxeHWAQINDl
	TZpAbZPD5Rkzb51uFDv50hwB8KJwyUORnK2uysSuNxCpOs2JUiei7q5+wpCBdmSrkEhfL/KrH1f
	HGCE3dh+8kacEHuccv1WLPnRkOAhNA==
X-Received: by 2002:a05:600c:3ba3:b0:49d:e79:612f with SMTP id 5b1f17b1804b1-49d0e79635amr157041045e9.26.1788895358151;
        Tue, 08 Sep 2026 12:22:38 -0700 (PDT)
Received: from MacBook-Pro-von-Karl (dynamic-095-117-170-066.95.117.pool.telefonica.de. [95.117.170.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485881353e8sm38080321f8f.1.2026.09.08.12.21.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 12:22:37 -0700 (PDT)
Date: Tue, 8 Sep 2026 21:21:22 +0200
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
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, Paul Walmsley <paul@pwsan.com>, 
	Herbert Xu <herbert@gondor.apana.org.au>, "David S. Miller" <davem@davemloft.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Helge Deller <deller@gmx.de>, Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-media@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 06/13] ARM: omap2: remove omap24xx support
Message-ID: <aqBXOemS4boakDGt@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-7-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908152808.3928630-7-arnd@kernel.org>

On Tue, Sep 08, 2026 at 05:27:56PM +0100, Arnd Bergmann wrote:
>  86 files changed, 60 insertions(+), 10696 deletions(-)

Note that Sashiko skipped reviewing this patch, because it exceeded
its current 10000 line limit.

> -CONFIG_ARCH_MULTI_V6=y
>  CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_ARCH_OMAP2=y

With CONFIG_ARCH_MULTI_V6 gone, CONFIG_ARM_ERRATA_411920=y a few lines
down can be deleted (savedefconfig drops it)

> diff --git a/arch/arm/mach-omap2/gpmc.h b/arch/arm/mach-omap2/gpmc.h
> deleted file mode 100644

perl scripts/get_maintainer.pl --self-test=patterns now warns:
  ./MAINTAINERS:19896: warning: no file matches	F:	arch/arm/mach-omap2/*gpmc*

> @@ -560,13 +533,11 @@ void __init pdata_quirks_init(const struct of_device_id *omap_dt_match_table)
>  	 * We still need this for omap2420 and omap3 PM to work, others are

Stale comment about omap2420

> diff --git a/arch/arm/mach-omap2/voltagedomains2xxx_data.c b/arch/arm/mach-omap2/voltagedomains2xxx_data.c
> deleted file mode 100644
> [...]
> -void __init omap2xxx_voltagedomains_init(void)

The declaration for this is still in voltage.h.

Thanks,
Karl
