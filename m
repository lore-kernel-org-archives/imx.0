Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C967A3A05FC
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 07:20:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247209; cv=none; b=l9nSyXZhXzKaYQ21cmVag82gP4YDcJ8/HZYz1iQgfXTMm/v3bnff7TdvKtZi1G2/QPOi0HO440UXafy5zHKMCjioBmLwnlz61eg64V0iydtPxds31kuRO1kh5XofutwUGT1Xb/pxj+zlxL5ngRJxdGhn1SV5Pr9NsAlaclUy2s4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247209; c=relaxed/simple;
	bh=TJW+ZiT5oYVtElCrK2VJYF5Z8RxcnedgcUFRUh6BMIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uO5ajBwggwGO/T8by6QraL7lJnykipiIDNNd1uF7QST4W68sHKOy+VAm9K/EIZASZiwVv90aDSSIAiEg55Zakl5EHvWGelPh8/eubtBis78CFSzt0muYTmmUi/1c4Vz3G5FYrUQuqZYauvpNLELpmT3OFns2Rc9N/4OyScSCJ2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-90cc372d6b2so40750776d6.3
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 00:20:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247205; x=1788852005;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=jx+XoqcBBsA+m2qrM8HxfQHaaz8x8crvSJWq14ITrJ0=;
        b=JcTrp8K8HoPNVEKmLalIE71Ge/gJjp1/FD/+tiZyuypCt3uGVZO3KKEXeg4cbKHFmm
         lHQ1MWoT1X/N0SbalnA3tEptXakKm1IRRIyBBWD1v/cgYUxtlMcU0Adxxyg12oIIkzE3
         Dt5Z3HR+hX7VBxUOoRlLdGnmlbWrmqcOLy1gUlwHIXvU1x6IHyJF2CSTtoNBsbi3ReSd
         SuceMJ5eO8X2xRL6m0G+7MvVV1TVoS1Gvi0EAR9qWZ6yDqOwed+yz1vbpXgqRFfFOiYH
         yu0AwqUPu4xco3Qka0VHsglmDAIzjY7l1WylCHEAalvanrGeLJRtopd+smkbWPm6syAl
         Smxg==
X-Forwarded-Encrypted: i=1; AKwUvBwDTK6GDZWpwpkxGcg5sYR8uZNQhYEPXLDCHupL31Z67QGRpu7lWs9LFr7rsk/exX9CkdM=@lists.linux.dev
X-Gm-Message-State: AFuF++lNGeRLRJY0vzRPvBPNro0ZtRNtlRrOM6k6mhg3b0yPm8QeWp/e
	AXiRFd7iDAHuNxXkrz97xUDB43H4NZnHlDHjzxifSewDe1k8Xb6e6aizK/aJwkAp
X-Gm-Gg: AYBFou21vY/bp8VNhm2eVnH6UY3Jg8aR8jFbDjSjtGHQDcR1X7sbkJYsiwZHM81AT4u
	XzmRWcULLI2EeQrmMTfX+OxFALiOimQnZVrrE8YZJVxTDK0Bb1jDszOfNran8fE41+UVRAUcyD1
	tHoj/JDj1YTYpuHiL30IS6ox3xX6EJGaQWCtsYaeEz4FUBE9dQ+zOlgoGHpqt4rBA9ceviT0iV0
	RgVKiFS8rynKWi+NlquADPmx3LcdkKbrUO3QUECY15qtG1YtW7R+evuBW1dazbAgYfMvcpLCbE1
	fhfZa1IpApKXLzDaJ4rXu3GsX33W1LQfWY8Uabhl6L3ed13V8WoDWm9/QHTZTKafOMWnoyPJ7RP
	5gmsHNpmV2US6C4CbYKjhsUqOPvETyxswU2VZSWBxoVYIbK7h83+38WxOBo5XoWTtHhOxF4CsuE
	t/MftHpOYS1qxfIMRTmiTboHh7YzOo5EcWoaDV+DgHIn9Yi7YBsV7o/sNsnQCWgsVHH3gTz1M3J
	5Z5oDU4hxTQydvSx7/HjoLtIcuP2N9Vtqry/pgQ
X-Received: by 2002:a05:6214:2266:b0:90e:8399:6d2c with SMTP id 6a1803df08f44-90e83996e3emr175104406d6.6.1788247205428;
        Tue, 01 Sep 2026 00:20:05 -0700 (PDT)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com. [209.85.222.173])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90ce4516af8sm102278996d6.38.2026.09.01.00.20.05
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 00:20:05 -0700 (PDT)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-934956bee57so607116685a.2
        for <imx@lists.linux.dev>; Tue, 01 Sep 2026 00:20:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoEhCNzd5JQGypEPW5EkSlevCuq7+OYKz0v/EsopzxNSTzPBeKRf0AqUjmZdPNdvySxQ5c=@lists.linux.dev
X-Received: by 2002:a05:6102:a50:b0:77e:6f90:4aad with SMTP id
 ada2fe7eead31-785962b2f0fmr9912673137.2.1788246874251; Tue, 01 Sep 2026
 00:14:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <apWfW5ahiYagw0OR@redhat.com>
In-Reply-To: <apWfW5ahiYagw0OR@redhat.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Sep 2026 09:14:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
X-Gm-Features: AcwNN1V5M0ZQ_v_xaH6RI1jedVGh-HNyKWbpGWR_Rc-YS9IPBF0NOfuHqPh0NM0
Message-ID: <CAMuHMdX8YidsoHudY54RQW4J=G446WNgRG6Q-P5f1YEHd3sHkg@mail.gmail.com>
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
To: Brian Masney <bmasney@redhat.com>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Linus Walleij <linusw@kernel.org>, Avi Fishman <avifishman70@gmail.com>, 
	Tomer Maimon <tmaimon77@gmail.com>, Tali Perry <tali.perry1@gmail.com>, 
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>, 
	Benjamin Fair <benjaminfair@google.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, David Lechner <david@lechnology.com>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Viresh Kumar <vireshk@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	=?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Michal Simek <michal.simek@amd.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, 
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	arm-scmi@vger.kernel.org, imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"

Hi Brian,

On Mon, 31 Aug 2026 at 17:36, Brian Masney <bmasney@redhat.com> wrote:
> On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Hence this series aims to make sure all members are fully initialized,
> > to avoid such bugs, and to prevent future breakage when converting
> > drivers to a different method for specifying the parents.
> >
> > Part One[1] fixed all cases that I identified to be real bugs, in
> > response to a crash I saw on BeagleBone Black.
> >
> > This series is the clock subpart of Part Two, which fixes remaining
> > cases that are currently harmless.  These are still fragile, and may
> > cause future breakage when converting drivers to a different method for
> > specifying the parents.

[...]

> 44 / 45 patches have been added to clk-next. I took it all for simplicity
> rather than everyone trying to cherry pick just their parts.

Thanks!

> Geert: The only patch that didn't apply was:
>
>   [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized
>
> I didn't look into it too much.

No worries, I have queued it in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
