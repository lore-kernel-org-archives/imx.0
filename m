Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79AF4BB299
	for <imx@lists.linux.dev>; Fri, 11 Sep 2026 18:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789152212; cv=none; b=k/17lVDfaSOWtvQU5OG9QNbIeCiHfsMAQ7g/xG829l46Kr6IRY+DXgrLpgqCZOk5/R6jJaHyzIa00O97hjln9iaY3Dmkjirq4dK54tJ4dpGmdw1vAEbSftszhK7C/JpRmmwG7u2uvOFugA7IZ0OedeQf+QerXogbi6y71PoXifo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789152212; c=relaxed/simple;
	bh=Vo/Zbo4FmIJeIV5z2fixRdEtyG30qlGNFYOjHoNYkqE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iZKMGn8CJGWsFLhVG6wiQos1BwbeR/bZkzeim6yf6pA5nFzlrPlG1/luCISk1QByAuD4jK+yN+1IO2wR5KofpRDR0eUNdkGtkYfkGOIW5cYBB70RA2Jq95gnxlCtYOfHxRo23gOC4lh6OKI9Xnkj1MDmtNVc2secpn4G49cxcUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yd7NSiNu; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yd7NSiNu"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4843cedd129so95785f8f.0
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 11:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789152201; x=1789757001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WEMRrWkwvFIDZfKdDi5vmlHb7sgj26/s86919xqFCGg=;
        b=Yd7NSiNunjF68MuuZYhl/eHUsugHaT2Dpdj8pUQ7rBZVOQ/dpE1z20I0ebBu4IwRkj
         57QGLZr/m4OO5h1wjPnWPJmlcNH3TOJuXyw3YCDSy4MKjppNxS70DRo//cPwyLCVq/jE
         k0k+D0uZ2Eg7RUg2hvHMDvWpt3JvRGzWJ8STzbJNH8szwLMPh54fFKgkyhBUKyDgcJAD
         3BDSZsUVWNHEX5t+z309OlzikijsrbDnkSX/dBd6PxU6rvEjG1dwnb5jh614bC+uc7I/
         9gyGGmQ17KXDUSmhp18mpgmwBxCyMEJHI5Lv2fiXPsTID9FsO8RHVfK6bVj8FqtUmUwz
         F5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789152201; x=1789757001;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WEMRrWkwvFIDZfKdDi5vmlHb7sgj26/s86919xqFCGg=;
        b=XxGUNxiRInohIq4cbycYFGsHMNRsXu8d1eWJnm/wtCUWcHUi75ZFTfOpqo/kCjgl2O
         RNoD0LObqNi6VGMJTrMBd65UhJ8v0bG3yd73T9SSrz0YOdJKPKDHeGoLNch0Iiq2mZWT
         GlkmgRs6IHXzj5kwgBIEgRjncWvY0lSISsZkz+VD4NTC0e5erl7luha68FBA7+dxBvzo
         lB6ztcfKuLtuMA5YxxhkI6MAw7e6ys0sMy6zwXF8d89zEBxz8UyeCqhsQBPTDNkmPzv9
         jZJdf0FZF9pMW0C6jBTgYLdyMEi4/eBK509qyG+fdcC/NcnXLR8Z7SgbVIlSW5D9Cnl9
         bftg==
X-Forwarded-Encrypted: i=1; AKwUvBz3r584EF6VyZ9ciy/R8ku6dvdv7VJVE85FwYu149zyEXqUoQmrCft34AXCOReCtvZxXBU=@lists.linux.dev
X-Gm-Message-State: AFuF++nNw79mYAO2SiQUTvVv0fdMZSSsqZZ3c/q/PR13lt5XIg7M15p2
	SnawAPtMwNImkTnmdIzMDzLnjpCfw0U0T95aGR6Ux34Vety/T+3rt/Ue
X-Gm-Gg: AYBFou20JBKgzke88HfHl5KLK2BR8N/inZWSQZsVCJB7gw8bTeX+qWVgxnPF6105qiz
	9+zfIblwhsb5/1iePlO5FEuG1kkuioim40Gm9n2qferuAx0T0vxswT2XJDHbOhICNl81Y+T9ZqN
	FNXFyzRN+m5u7+HG12bwFJzybbOOqthOo6xveSiIfVvSnkjSKOxS0q+tN6JcL9DXq83kj+P3Cuu
	VBDciGPXaeXg6tVUW29XX/ms4VFd1QCFffG8WyfCCOLmJkCwu7PAvKIE8fTdnXA2JWN58G6Z+li
	3XPMzwWOzqgrCiHDwf61unTGS3Y8VlcKZNUg2groxNii33dU8RvPBJv/HeoZYBhSZl9swJLNcaI
	cg7dB94IePFSeumpwENjIg6S6u+wykDQQ86/CQL+f0yF987+a6ODQzNQZYUP7j+n5AH0LQT0yZ9
	+Oyih+zKF9xfjC3HkuVRTSep1fsastFO/6zICAaAIQox7CQ8H1bE3+c7Fd31UAHTNcmHSKIKQrf
	J9ieKqJPZVzWi/pkuG6iZOiiwF66p+Vplv7wTLlHmm6D21qF2pF+t9WUkN9ScR4Eo2CZngDh8rQ
	PlTUNw2zttGn9PgRFZUbZ5VVkezxK7jyBUnmisKQjILiMGxddg==
X-Received: by 2002:a05:6000:4605:b0:485:ac39:36ef with SMTP id ffacd0b85a97d-486eb1d3781mr14290458f8f.5.1789152200719;
        Fri, 11 Sep 2026 11:43:20 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm5446009f8f.8.2026.09.11.11.43.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 11:43:20 -0700 (PDT)
Date: Fri, 11 Sep 2026 20:42:46 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
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
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-omap@vger.kernel.org, Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, 
	Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>, 
	"Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 03/13] ARM: remove riscpc
Message-ID: <aqRI3N5FPX1dpIlk@gmail.com>
References: <20260908152808.3928630-1-arnd@kernel.org>
 <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>

On Thu, Sep 10, 2026 at 08:44:34PM +0100, Ethan Nelson-Moore wrote:
> 
> Because I think it's cool that the kernel still supports actual Acorn
> hardware, I patched gcc 16.2 to restore ARMv3m support:
> https://github.com/EthanNelson-Moore/gcc-arm-retro
> 

Nice.

I've made a RiscPC emulator in the browser using QEMU and WASM. It boots
Linux kernels and currently emulates a StrongARM RiscPC:

https://github.com/kmehltretter82/risc_pc_linux_emu

I used LLMs a lot while building it.

Your GCC work looks useful for this. I will look at building the RiscPC
Linux kernel with it, and at emulating the original ARMv3 CPU too.

Thanks,
Karl
