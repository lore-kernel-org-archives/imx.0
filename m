Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BA6F3F5BC3
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 18:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789323262; cv=none; b=id8Rs2I8uOL7rWgAaZLWoF07ClEPVhDfJ0+26hDRIp6ZuW8TsR7DBRvTFGd/+O4B86uFTr7hEBpH1y+0ttHw2xCZ08p2g26LOT5luLi7MDVpJxCB6AiKSvdhBkXJSNg6vaSoQozjaxAfCJVgYUp43uIhf0zFOmnkm3+Imb7wGeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789323262; c=relaxed/simple;
	bh=+i/WMQo12F+E81xj/jdX7lcu6060BfxnYwbQM4ckRZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q3FFA62t4i0Q0p2O9lOWLyXvdv8Zk1qSI3J51OlTPYskH+kA0inggNQi7EX6QLZiBVJtNu0Vkwo+kMslK0P7muRNkZ8mYsHCRyk2k2cGy6m/7nmifertbgs6U/iP7x00oBWc/NzdaAAYMgKgw9ubaEAx/Iwe6CvUOr1fXksIUlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hvvP55/n; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hvvP55/n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ACF91F00898
	for <imx@lists.linux.dev>; Sun, 13 Sep 2026 18:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789323240;
	bh=+i/WMQo12F+E81xj/jdX7lcu6060BfxnYwbQM4ckRZ4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=hvvP55/nHzg3/6gPMxh0YINwon8tEDxLKQnsxvgL7zzskx4gYrfCfSfy47JdpMDie
	 OGEwxbeb74cUWo/loc9B108PmKXEkXCcTvWPtajz0l9pP7TuptDnAwTXGoNuhWO/iu
	 Mu74j1fqlLIKiipimyrOM/zC3kf75WeWsHNv4cymURXtjN0NTTgVXB4uMcv2bRfqoK
	 JpgoMqR6Rc+amOFPQYzCLt4sOtHjW9lDdu18j5QrU+hqGRbGkUKSDsb/e7VXW3ctzS
	 2MWHG2pnVObAs/ThqoYrarP//BQQmNoPF31327CaF+JuKKUoooVumSujNpFVInc2hX
	 KmYL2CSgIAUgw==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f13d77so1452130e87.0
        for <imx@lists.linux.dev>; Sun, 13 Sep 2026 11:13:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzHnvOuR9jFtfGGleo3j9uAZUOORO8wXl0Qw3zqTia9jImiEgZRRAVjtUdPHPaz7inkpfc=@lists.linux.dev
X-Gm-Message-State: AFuF++lgHsUt5CO2Est+J9ngqikU7sjlJ44DNEjBvS4+JSqp1dfxB1Wf
	x8jBF6D/z40RKHKlnw+xD8WjTOAWP9HKPYR7biHUOMxKeNM4AfIBb56i9svzmIoegyBniUPdVPx
	7bNy7c0fxZJeUOjI0/IuJFi7LRYIBaXo=
X-Received: by 2002:a05:6512:158b:b0:5b8:9ec5:c936 with SMTP id
 2adb3069b0e04-5b8a8ec2c76mr1378800e87.44.1789323238029; Sun, 13 Sep 2026
 11:13:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908152808.3928630-1-arnd@kernel.org> <20260908152808.3928630-4-arnd@kernel.org>
 <CADkSEUjYhRk-ezaXZkHzFTFQnySFSisKtZfEP-_NtLnQF+6-1Q@mail.gmail.com>
 <CAD++jL=ysmPgs8yKH5KBobuv-eeCHHgZwvo1kvHOFuTwhkaOew@mail.gmail.com>
 <CAFr9PX=_FmMdR4TeP+tqURZdZCTjw8UYxAxeszs_vcpTbX+_aw@mail.gmail.com>
 <CAD++jL=zaF1zcTv6Mta5Xw69WeLC30NRcH0_pkSkLJJ0UtnZHQ@mail.gmail.com> <CAFr9PX=tVOzqGU4k0zSzXheuU5z5LZi4LSGdUvjChrSTrbyjJg@mail.gmail.com>
In-Reply-To: <CAFr9PX=tVOzqGU4k0zSzXheuU5z5LZi4LSGdUvjChrSTrbyjJg@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 13 Sep 2026 20:13:44 +0200
X-Gmail-Original-Message-ID: <CAD++jL=nr_Rgf6e+vo2bbTRNvEXysEEMjMhGp3-2J2_JPSVkiA@mail.gmail.com>
X-Gm-Features: AcwNN1UBjE2eanAt46mrgMtCvXLgZ5DQ_bTFYwRvKhaMIzHs2zMGgr1ICh4wWo0
Message-ID: <CAD++jL=nr_Rgf6e+vo2bbTRNvEXysEEMjMhGp3-2J2_JPSVkiA@mail.gmail.com>
Subject: Re: [PATCH 03/13] ARM: remove riscpc
To: Daniel Palmer <daniel@0x0f.com>
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
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Sat, Sep 12, 2026 at 3:29=E2=80=AFAM Daniel Palmer <daniel@0x0f.com> wro=
te:
> On Sat, 12 Sept 2026 at 03:15, Linus Walleij <linusw@kernel.org> wrote:

> > I would say using generic entry would be a prerequisite for
> > doing m68k SMP so we don't introduce *more* entry
> > oddities, but after that I'm game.
>
> I have started this for one part of the m68k tree (68000), but it's
> one of those things that is hard/frustrating to test on real hardware.

Pretty cool!

> For the last few weeks I've had claude create a QEMU that can boot all
> of the m68k supported machines to Linux, Netbsd and their original OS.
> It already found this:
> https://lore.kernel.org/linux-m68k/20260828094940.3882602-1-daniel@0x0f.c=
om/

Now we're talking.

> > As SoC maintainer I see that m68k has a lot of technical debt
> > like drivers under arch/m68k and no proper hardware description
> > (such as device tree)
>
> I have m68k machines using devicetree... :)
>
> > There are things like
> > amiints.c, cia.c, ataints.c, q40ints.c etc that should be in
> > drivers/irqchip. So many time.c that should be in
> > drivers/clocksource/* and many other unmodern things.
>
> Would be easier with devicetree. But is anyone crazy enough to go
> through the pain of merging the devicetree support and then arguing
> about devicetree bindings for each of those drivers only to be told
> m68k should just be removed?

That's conflating two completely different things that think
about themselves as different communities.

Devicetree is in its ambition OS-independent and the fact that
the bindings are all in the Linux git is just a convenience because
that community works well and is dominant.

No device tree maintainer should *ever* complain abot
*any* binding with reference to what Linux supports or
where Linux want to go. Only people not actually working
with device tree would say such things.

Device tree bindings have been deleted but then by the
person who is maintainer of the binding itself, and for
the argument that "no operating system" supports the
platform anymore.

Reviewing and merging m68k bindings should not be
any more problem than any other binding, and it should
not have an impact on Linux support of m68k.

> Once you have an emulator that the LLM can operate it can do the
> change/build/test/debug cycle all on its own.
> With a test harness it can even test the changes work on the real hardwar=
e.
> But I don't think that's enough to convince people the changes are
> worth reviewing/merging.

I will review them. And I do not think the DT maintainers
have anything against m68k.

Yours,
Linus Walleij
