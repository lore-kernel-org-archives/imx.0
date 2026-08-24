Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D154119ED
	for <imx@lists.linux.dev>; Mon, 24 Aug 2026 12:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787575661; cv=none; b=Q/S40TotoXUUQAum5i0VQxIK4xI88kzsesHT7MEkZQo2NWxw8XP3y+WlY5KUtfVvMb0jDaBKvRDqep2h9qCrOs8y+bIJdO/M/BVp9P7yo1Ijskx1huhAGMa51Rp+Quh9wpPffgTns03VN9PqaCuKRhDksFq8oQ4PbItz3Gex7n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787575661; c=relaxed/simple;
	bh=lI76YK88ZltuQHg9+zsDOjRNQgdjPki/p5J+GduZo2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IgiKhh0gCOcokHq3TSbkji8AHw4MhkaspGOEOCWV1z8Lhg+9d7bwPfifEwdwSiVBr/3IAMYFz06KuXf4N+QocXYwSN716ZNY4UeM9Tw/V5WBK797M3y8jHMsAlzJ5rFwaRwGKAwAapiQeDrAKnDRNRSE1x5329k5nyYL3WmFzfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-66d0743503aso1318653d50.3
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 05:47:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787575659; x=1788180459;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=9ghuoduRfOzi+AYpDw8t1/oQryAhFbodaTAoc1849Hg=;
        b=VcMTDkN3mk3Vkhr8PfCSI7DtQijRg8QL3popVCRkxbJNbA0PRAawuSYoosn57pZctr
         BxexCQa0q0CJTM6ucNE3OQMLGdvAIk5ebD5vZosaJBgDHUTisWRra4bf7V/+gdd96MRG
         t1ZgRK4S6EXqlhIytgHLuEfwh5ypO3vfbxnCh32A+g2WZyKMNILC/KfQsgEVJrYW9bbB
         FjhgpRXPucEfRpXqfq6WEpUwj6Shmx0ivyPksr8bIpKYOW/epkbKjhKA5lqYoAiq8XjU
         VhLNZEnjVFtFxnYOVWu/a2LD/7DqrXxa4x24os6AhRTFGMJ006cPBDfq7DYKkhGfDs1Y
         40Xw==
X-Forwarded-Encrypted: i=1; AHgh+Ro85SpaEqDk+QvhGHxch0Gj1qBH/SoVlslwmdwOoc2DC2xJbNDYNHvW8f9NImM9yyb1FYA=@lists.linux.dev
X-Gm-Message-State: AFuF++mi1HPKM3X9jSIKISe5hoo8EBvEXrfSONMRDvufidi7YwV/dzWH
	2fZuVezqu/kSdWpmncCiPiYr9+qlKsb29KVE5p5kcruGUeMi5WFacUxWPGqygVJ7
X-Gm-Gg: AR+sD108imTceXAfi4r23tNEWNVUMkxuGuIfWkq8Dlkkh21cmHMrk2N4MHFrmR8P9D0
	AHiR2p03chWY6lrduFOvvoAa4KzZn6JhgVua6BozQ8mERM7uCmOXCnn5eUrHVlfe605P3xJUYNi
	ib9jhOI4KBdtNSUaRcMQOr8O4tMjRMRQ7TE90oGuMPedWJgwAgSnjlcPiYtVSWlrQqMKOBqn6Ny
	EjVWoMlj+9AXouhKKRvJguWoy1Yy/je19u1iH5P2sW6Sr0mEYPzCzoY5sBTEtHO982QFbV1d0Uv
	Lf5c1DesgPtBBL+IhyjQjJAOKng51o1X54AshcctllF9N1L3QKUbRDIgyRD5Vzkh4hLVogLSECQ
	41Rb9yCXRVR1RRfllTJLChFCjjQEb4OztuwDd62aoK7zFcluy2qaz7+GRapqRWVhlCg1QNk6crB
	OTWZIe5+Fyb0epNB40UrPcbJIiGcrPhat4Ch1a+Z0zqO3XgulD0yAiwntlW6AvDbNIuO9nA3AWP
	jWCvT76TkXvUfjGJd/irz+lfg==
X-Received: by 2002:a53:e01b:0:b0:66a:b15b:2a91 with SMTP id 956f58d0204a3-66ce4b243acmr7252560d50.42.1787575659306;
        Mon, 24 Aug 2026 05:47:39 -0700 (PDT)
Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com. [74.125.224.51])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66cf9f99e17sm2928492d50.13.2026.08.24.05.47.39
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 05:47:39 -0700 (PDT)
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-66ce00575dcso4633822d50.0
        for <imx@lists.linux.dev>; Mon, 24 Aug 2026 05:47:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpU6wCHq+jLQgIVK6RDVgQ1ENKaT87kYJRYiX+GTL1KRbAdMckt1VisaHQBCa35vk26oD4=@lists.linux.dev
X-Received: by 2002:a05:6102:26c5:b0:772:5acc:b848 with SMTP id
 ada2fe7eead31-77a62c46273mr7826182137.6.1787575289120; Mon, 24 Aug 2026
 05:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1787239813.git.geert+renesas@glider.be> <87b3e83137e1a987f3c69d214706e93ef3898cab.1787239813.git.geert+renesas@glider.be>
 <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
In-Reply-To: <60a8d05a-76fa-43c3-a0f7-fb26a3b659b8@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 24 Aug 2026 14:41:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
X-Gm-Features: AcwNN1UOdKQEkPlARJoVF2UurscVPaHj9T1_AXs-3b7YtVRMAHuDfcVjJgM-XPk
Message-ID: <CAMuHMdWnXTAVZ_eBfoWNe-sy6BC1X+5EHkDw9R0TAA65Opzi_Q@mail.gmail.com>
Subject: Re: [PATCH 29/45] clk: samsung: Make sure clk_init_data is fully initialized
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Chanwoo Choi <cw00.choi@samsung.com>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Dinh Nguyen <dinguyen@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>, 
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

Hi Krzysztof,

On Fri, 21 Aug 2026 at 13:04, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> On 21/08/2026 10:53, Geert Uytterhoeven wrote:
> > The clk_init_data structure contains several mutually-exclusive members
> > for different methods to specify the possible parents of a clock,
> > prompting drivers to initialize only the members they need.  However,
> > not initializing all members may cause subtle issues, which are only
> > exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> > enabled.
> >
> > Make sure all members are fully initialized, to avoid such bugs, and to
> > prevent future breakage when converting drivers to a different method
> > for specifying the parents.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thank you!

> Let me know if I should take it via Samsung SoC clock tree. I assume by
> default this will go directly via clock tree.

In that case, please provide your Acked-by, so the clock maintainers
don't have to parse your English response to find out ;-)

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
