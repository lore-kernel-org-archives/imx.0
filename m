Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D1F1429039
	for <imx@lists.linux.dev>; Mon, 31 Aug 2026 15:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788190570; cv=none; b=r4ZoJl6kkwlQtGqkFwBOXUqFocMnpFT6+ixtBxTF3Lq8FnvfblcvZ5jUjIkp/dytb6hJ5e3qQ2avz++h695AZ8D98OIKDh1lAceZqN+UajzeMHAzY+PAP/8kAIAR45+ywgnfu9yxfCwBFluaJXiJggd14xivY6eMwQk2yLOsmpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788190570; c=relaxed/simple;
	bh=DodOb5bu1oSMuLPsOxNFB8oK01GET+pyiMt7NsDyP0I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=loyZi59tG/r+1ijbpnKe5rR1VdCWXUsOBBjjXhB0QPtmHRlEAhqPMe2JR9CkFrSJsWpAB+j7tyPmniBlDQEYbzqyL1fjcoCi31cjYJH/14K8BVHySlqfXmw1Sfk1ftzHxGThKjtdxl7OQ6FnbglwZQwrgV3PXdsrFJwcv4q+5AY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MllDFC1F; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MllDFC1F"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788190567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uVxBilOuJ3eJRjLFViKxIC+i5050iOvt2YALC/2UHq4=;
	b=MllDFC1FBEdnQNrGZhkaDrBpl2tNnlUR3bV0uqNK9YMcEXl+vOOyvlPNsxPaII6K6UZAJc
	gQFslQcZjRNKSmxLmBwoMkDrJ9RnjvzFNDzdMM/v37r2kYDWSMMsSvkVmjCxsy5YP/E5J1
	4nA6GLfiOEJVEWgW4RwZ7OZ8H3j6moA=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-chaoxl3VOeygUiqorx20OQ-1; Mon, 31 Aug 2026 11:36:06 -0400
X-MC-Unique: chaoxl3VOeygUiqorx20OQ-1
X-Mimecast-MFC-AGG-ID: chaoxl3VOeygUiqorx20OQ_1788190565
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-66e44d96aa0so4121877d50.2
        for <imx@lists.linux.dev>; Mon, 31 Aug 2026 08:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190565; x=1788795365;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uVxBilOuJ3eJRjLFViKxIC+i5050iOvt2YALC/2UHq4=;
        b=meWINFB5FEsplsECIWS67DuJuyUy7MDdv1yAAXYv+7QDBxDdf4nzWrH7B5MMCCnNmg
         pNaPx+kVNM6NTfmr4yC3HQ2mbErvvQbF3l0nyYlmB0qFMdQXzeo8AnYR2Z2S5YhphLdF
         5wYawsYNeysQBI/bVc0TDV2p/1GCzoD0Bp2ckbsGmW0HPoiJ/gkV4gbWUYFXIKchgXa5
         VzslzvFv4XwhuS3AtdxZRAiIesMZziLpQGUKXKisJgwu8Q+Mm1oAqvlriesKkYQVog65
         1/6jv87Opoi7ykwg5IQ2KqO80b4uhLzaAD3HtsR3AggK8MoeoM7NySkHivJcbYa/aB8K
         MRew==
X-Forwarded-Encrypted: i=1; AKwUvBzDZSqACSY61AaW/sXTkmHKM1ZJv/L3WXlvooETJ+WgycED60WWgWkSctIHaJHMQOLCMVo=@lists.linux.dev
X-Gm-Message-State: AFuF++luzkydFVSasK+IUJ2IA1SDj2iyQebGnBk60YWOwk5jsK02sFNf
	91raeV2/qWhdBSB+OWze6SFHIqjf4bHyEI3nj87NKBLwDWp0Aboi1dJ1DQ7dZdSqOkuqFcbZ5Gs
	jnQ7WTe1NkHMoLGJdd9Htk/DO76G01fcqKPWRjyoCk5DIbWFIYm/y0g==
X-Gm-Gg: AYBFou2jKlXkShqtiE6yhCJ7YFjg1upc/2sYUXJc5Uf5j0qOY6dhvwVJVeCfnH9UHWb
	zSKFSnlgOBrlLWtMiUffTg5oYLAsbrovtNWBuWwz4N51q1WwjSZ00xPbOWGdfCRhls0wmid7pl5
	3LDxTYJxuWJdvO1+duo98YX19P329ffLaVyYG6pwRcMAmKZ0AA0tOWVzgv6Pi0zp6xGHFHmNWVX
	1ZtGuLLohpuWiDWcqP0n0C6/3MFk7ZXWBsCqQIaLwooJRa7e3FjeSREZzzVXDznUK7GV4RUE6fC
	rsauF4eEUEFGPHFR0n77HFFgpAZCnfpptCOaBfomTE7gO5GcS4edaI4wT9iUX4EL/oggUaE+COc
	=
X-Received: by 2002:a05:690e:13c7:b0:66f:8255:9f3d with SMTP id 956f58d0204a3-66f873db9b1mr559394d50.7.1788190565185;
        Mon, 31 Aug 2026 08:36:05 -0700 (PDT)
X-Received: by 2002:a05:690e:13c7:b0:66f:8255:9f3d with SMTP id 956f58d0204a3-66f873db9b1mr559344d50.7.1788190564555;
        Mon, 31 Aug 2026 08:36:04 -0700 (PDT)
Received: from redhat.com ([2600:382:8519:3f74:ab6c:bb55:e9cb:f8d6])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66f7efc9dbfsm2062227d50.9.2026.08.31.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 08:36:03 -0700 (PDT)
Date: Mon, 31 Aug 2026 11:35:55 -0400
From: Brian Masney <bmasney@redhat.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Ryan Chen <ryan_chen@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>,
	Linus Walleij <linusw@kernel.org>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	David Lechner <david@lechnology.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Cercueil <paul@crapouillou.net>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-clk@vger.kernel.org, linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, arm-scmi@vger.kernel.org,
	imx@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/45] clk: Make sure clk_init_data is fully initialized
 (part two)
Message-ID: <apWfW5ahiYagw0OR@redhat.com>
References: <cover.1787239813.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <cover.1787239813.git.geert+renesas@glider.be>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HZBRqiIln9g6AaIUikKN8t8K7eBJhU0Da52l6d5JeIU_1788190565
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Geert / all,

On Fri, Aug 21, 2026 at 10:53:10AM +0200, Geert Uytterhoeven wrote:
> 	Hi all,
> 
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Hence this series aims to make sure all members are fully initialized,
> to avoid such bugs, and to prevent future breakage when converting
> drivers to a different method for specifying the parents.
> 
> Part One[1] fixed all cases that I identified to be real bugs, in
> response to a crash I saw on BeagleBone Black.
> 
> This series is the clock subpart of Part Two, which fixes remaining
> cases that are currently harmless.  These are still fragile, and may
> cause future breakage when converting drivers to a different method for
> specifying the parents.
> 
> Thanks for your comments!
> 
> [1] "[PATCH treewide 0/5] clk: Make sure clk_init_data is fully
>      initialized (part 1)"
>     https://lore.kernel.org/cover.1787165329.git.geert+renesas@glider.be
> 
> Geert Uytterhoeven (45):
>   clk: aspeed: Make sure clk_init_data is fully initialized
>   clk: at91: Make sure clk_init_data is fully initialized
>   clk: bcm: iproc: Make sure clk_init_data is fully initialized
>   clk: berlin: Make sure clk_init_data is fully initialized
>   clk: cdce925: Make sure clk_init_data is fully initialized
>   clk: clk-axi-clkgen: Make sure clk_init_data is fully initialized
>   clk: cs2000-cp: Make sure clk_init_data is fully initialized
>   clk: davinci: Make sure clk_init_data is fully initialized
>   clk: fractional-divider: Make sure clk_init_data is fully initialized
>   clk: gemini: Make sure clk_init_data is fully initialized
>   clk: highbank: Make sure clk_init_data is fully initialized
>   clk: hisilicon: Make sure clk_init_data is fully initialized
>   clk: imx: Make sure clk_init_data is fully initialized
>   clk: ingenic: Make sure clk_init_data is fully initialized
>   clk: keystone: Make sure clk_init_data is fully initialized
>   clk: lmk04832: Make sure clk_init_data is fully initialized
>   clk: mediatek: Make sure clk_init_data is fully initialized
>   clk: milbeaut: Make sure clk_init_data is fully initialized
>   clk: mmp: Make sure clk_init_data is fully initialized
>   clk: mvebu: Make sure clk_init_data is fully initialized
>   clk: mxs: Make sure clk_init_data is fully initialized
>   clk: nomadik: Make sure clk_init_data is fully initialized
>   clk: npcm7xx: Make sure clk_init_data is fully initialized
>   clk: nxp: Make sure clk_init_data is fully initialized
>   clk: pistachio: Make sure clk_init_data is fully initialized
>   clk: pwm: Make sure clk_init_data is fully initialized
>   clk: renesas: Make sure clk_init_data is fully initialized
>   clk: rockchip: Make sure clk_init_data is fully initialized
>   clk: samsung: Make sure clk_init_data is fully initialized
>   clk: scpi: Make sure clk_init_data is fully initialized
>   clk: silabs: Make sure clk_init_data is fully initialized
>   clk: socfpga: Make sure clk_init_data is fully initialized
>   clk: spear: Make sure clk_init_data is fully initialized
>   clk: stm32: Make sure clk_init_data is fully initialized
>   clk: st: Make sure clk_init_data is fully initialized
>   clk: sunxi: Make sure clk_init_data is fully initialized
>   clk: tegra: Make sure clk_init_data is fully initialized
>   clk: uniphier: Make sure clk_init_data is fully initialized
>   clk: ux500: Make sure clk_init_data is fully initialized
>   clk: versatile: Make sure clk_init_data is fully initialized
>   clk: vt8500: Make sure clk_init_data is fully initialized
>   clk: x86: Make sure clk_init_data is fully initialized
>   clk: xgene: Make sure clk_init_data is fully initialized
>   clk: xilinx: Make sure clk_init_data is fully initialized
>   clk: zynqmp: Make sure clk_init_data is fully initialized

44 / 45 patches have been added to clk-next. I took it all for simplicity
rather than everyone trying to cherry pick just their parts.

Geert: The only patch that didn't apply was:

  [PATCH 27/45] clk: renesas: Make sure clk_init_data is fully initialized

I didn't look into it too much.

Brian

