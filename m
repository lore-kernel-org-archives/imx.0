Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42851C84DC
	for <imx@lists.linux.dev>; Sat, 12 Sep 2026 01:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789176586; cv=pass; b=IhcO/RyjWjfg0gV+zilwoZNA3ubaGjVPAnZ2hITmGJIPhX8vxgTv+eIYtt5rHUWvhafXnJ/q1KgwJtzsJH0JTMmzpN3zhAuuud7/ntWhIye3JqK4TA477OyBAJ6CYmqfZUaswxrx23yds8rX9PORaHhzqsEA+4IniKPPyVN6QE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789176586; c=relaxed/simple;
	bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=obWk63JuHcJczXJv5yqv1IHbsm7EMlPChMQ7ry+l9fs0kNl4x7bCrzZ/RI5ImuYdjQTnFSr5kcK1icPabz8XhqC0vw9PXqfie+7iWCPltfzJp0iahxxYj78BASX8ZCk4+16kt4AKXWcBPAlVA8k1a0R2Qojb59Ou5Y32rbcAQZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com; spf=pass smtp.mailfrom=0x0f.com; dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b=FX1x+r4T; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=0x0f.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=0x0f.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="FX1x+r4T"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d8fb334e72so4645925ad.1
        for <imx@lists.linux.dev>; Fri, 11 Sep 2026 18:29:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789176583; cv=none;
        d=google.com; s=arc-20260327;
        b=laocNXBVfue7uBhPETVk9qETfJqklFk7taiRgxU3xzt8j9v3yk88PyZWbx6WXLx0Oo
         QMMRiznRYzNQKbP0GQEihlSgIPLh+B+jvNagVyHXEvSVjZNaaKCR4jeiWg1fpsXu6spW
         aolyOYGv6hccsHbSqR6+u6xAr/t4ZtQNFpa5zbwhME+G/uC2Bubs3qnFLxEc+OCoj+6C
         rHU1AW/sMvtCbLH68VF8rB+hLSwrFkEVpt5SJY7T4cDOTWmw/Xh4BmseE9Kt6lmJTGqp
         JaasmkK892Ij8RmwhKLPab5DMjP6KVKyqJDnQ0OctQRvryuYFd1Q/WRftfio3B5tZLh4
         CwCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        fh=yEbZVQ/SOODXeIy2zHv2vOWACDOF83nf2VpQovYEajk=;
        b=CkfVcxKfVWVvbKAPDEqiUk7fbEFQ1JjAoeJv0IFErZHbGK3hkn6IWed4h3ibgd27KM
         9kOitC/3+XU0ovcVPEUv5Y0AWvzaD6QcEOUIHtZsacF4+HCRkIQhY49ekk5HvyYAZnG9
         P5jahn65KCuHvnDmllXJHUqX5O7uqnOd0l3/iEoXdJBFsKHR+0jiSmhnszAklrT3aBSv
         C1sR09kQtnY1BNHuDjlrmO3KXH4WCbKlequwQQ+9iHVhnP7GDX0zbzZkS7Vq9JiPa0Rr
         EApqIxnzlYrydHr2sxPPSFJa8m8X/VDldZP+Uxwl/oO4khFgPEupM5J8FJHes6TSTI1z
         Ehhg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google; t=1789176583; x=1789781383; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=FX1x+r4T2IdG84H7VtfwZ1eLIRCJCAxF3p4GGvXcSPvwYXiV+Nw/wIFsuhj1uMkXuc
         82N/JFuWx57Vir+76UD6JolJb6K1m0ucJ2IUhmS0SHu03U7orWaiUbtE/NDxrZWHdwOW
         TwgEViK8i1Xx34BrJTzN97whnSt2XFq3Khz40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789176583; x=1789781383;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MqFZZ1MZCCOk3B2AWbqhU4vVtD/Z+SwXDy5HKI6vso0=;
        b=krCpkCNILQPA7v0IonXocDMNQVdS5KYdhrX+pRJmmcOV3dLAOmCzrclavfJ8tpML+S
         5uT82hGKXvXHI+rFaJTuJ8nIE359qysKu3K+PhzdQlQAqXyRJHn95CxNnwEjCqQtNdG/
         tgJQ61Yv8IgSvkeK7muZigKzt7xv+hXcM0ypp893dZeSLkO2/6xBYkHBUXAfP4UYHSHL
         zlaT/1NdYuT+/xYnymtRoP2bY9DyZELFAmSOrPZAb+Gk5J4h44PYn3iMjt35sAbOU8Aw
         eRDCtSzQMFK5dl8oYNleUSbBQdPvDQ9XA08gDRYXMZCcEN4xspnGDjYmUxsMDGHbr8+d
         xtmA==
X-Forwarded-Encrypted: i=1; AKwUvByXpjjAQsAJLMCAnmJSAkk52v89hvbHVs1vvo9GQkiWxiqYBBBExkTwgCpLbLtBJzczSqQ=@lists.linux.dev
X-Gm-Message-State: AFuF++mkNCFokmhXx6zVfwlSwxzKJiu/+8+j3CvcKIoRrl/sfSo4J9fD
	/jvNxAlCATkJR0v3Cd2AiMN8Jmr4TmKrub2zaqfLJqAyKrOy2E3OPIqVmY4s8u9NWBA5nqz+aEF
	0U0W9mSxOS96M0uvZjA7LX6hamdDyRS9S/Ry8bsUNvA==
X-Gm-Gg: AYBFou34C9U+TRy3ksvkZ7KnUvLOAt8amptSiJgonEU+g1kvHdfmdAuXp2wcCMHuETi
	dkrpi6f8OMMUjr1q3QMUmXf+850D6qZaQyWJ+qLDP/qZTPyADv9G9vRjhHkU8pe5d+RBuMWfjXU
	R7kM80wsxKJcOFybwFDz57XHiTRQ/6lo3ep/fPR6MtZjpFmJCucSpwiDM4FaE/AJDRFEQgwd1+M
	MZ7GtPnuCfKmdvfRSp8a+nuS3xdZcY91ALyLsJQqvyTCyVaZa/INqzDPwEgmRFn+DlMrDA6uH9y
	JUXhIx3rxBAhlueRGK8r0S2PJhPH08Laq/L2fw93gGlTqAK//Rdcxw==
X-Received: by 2002:a17:90b:4fc2:b0:381:6c5:3f63 with SMTP id
 98e67ed59e1d1-39d9bc42d1bmr12376403a91.6.1789176583130; Fri, 11 Sep 2026
 18:29:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
 <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com> <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
In-Reply-To: <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com>
From: Daniel Palmer <daniel@0x0f.com>
Date: Sat, 12 Sep 2026 10:29:30 +0900
X-Gm-Features: AcwNN1UYIuhyU3FVES8GlXYNI9phDxlCK3dBrZsiSwUakZtphqfaiRPyo96Awf4
Message-ID: <CAFr9PX=tVOzqGU4k0zSzXheuU5z5LZi4LSGdUvjChrSTrbyjJg@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Linus Walleij <linusw@kernel.org>
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Arnd Bergmann <arnd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Drew Fustini <fustini@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Liviu Dudau <liviu.dudau@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Stefan Agner <stefan@agner.ch>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrew Lunn <andrew@lunn.ch>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
	Gregory Clement <gregory.clement@bootlin.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kristoffer Ericson <kristoffer.ericson@gmail.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Alexander Sverdlin <alexander.sverdlin@siemens.com>, Shawn Guo <shawnguo@kernel.org>, 
	Karl Mehltretter <kmehltretter@gmail.com>, "David Hildenbrand (Arm)" <david@kernel.org>, 
	Nicolas Pitre <npitre@baylibre.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-omap@vger.kernel.org, 
	Ian Molton <spyro@f2s.com>, Jens Axboe <axboe@kernel.dk>, Helge Deller <deller@gmx.de>, 
	Thomas Zimmermann <tzimmermann@suse.de>, "Paul E. McKenney" <paulmck@kernel.org>, linux-block@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

On Sat, 12 Sept 2026 at 03:15, Linus Walleij <linusw@kernel.org> wrote:
> I would say using generic entry would be a prerequisite for
> doing m68k SMP so we don't introduce *more* entry
> oddities, but after that I'm game.

I have started this for one part of the m68k tree (68000), but it's
one of those things that is hard/frustrating to test on real hardware.
For the last few weeks I've had claude create a QEMU that can boot all
of the m68k supported machines to Linux, Netbsd and their original OS.
It already found this:
https://lore.kernel.org/linux-m68k/20260828094940.3882602-1-daniel@0x0f.com/

> As SoC maintainer I see that m68k has a lot of technical debt
> like drivers under arch/m68k and no proper hardware description
> (such as device tree)

I have m68k machines using devicetree... :)

> There are things like
> amiints.c, cia.c, ataints.c, q40ints.c etc that should be in
> drivers/irqchip. So many time.c that should be in
> drivers/clocksource/* and many other unmodern things.

Would be easier with devicetree. But is anyone crazy enough to go
through the pain of merging the devicetree support and then arguing
about devicetree bindings for each of those drivers only to be told
m68k should just be removed?

> Albeit I think actually going and fixing that can't be super-hard
> in the age of LLMs. So listing things like this likely will just make
> someone go and do it. :D

Once you have an emulator that the LLM can operate it can do the
change/build/test/debug cycle all on its own.
With a test harness it can even test the changes work on the real hardware.
But I don't think that's enough to convince people the changes are
worth reviewing/merging.

Cheers,

Daniel
