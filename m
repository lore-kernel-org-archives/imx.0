Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B8617FACF
	for <imx@lists.linux.dev>; Thu, 30 May 2024 11:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717070252; cv=none; b=M/5MggBpUzanQFUrCUHC1MJR9RLj/Luqfy+UB+9tgnRPESUpngLtYxsWa40J1S7UNK2cLhvhVgOZM2B7Nnqxmj5SB5z7k7d3Lls8HrHpRnwu4OnNJmMvBl2VUMndzdZY3H0E1DDwpcmCqNZiHrzK6wAV7eJ6T1cOzptV4jeZAzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717070252; c=relaxed/simple;
	bh=ox6f2Bib795DIR4D9OYeOchPTQ0ajdXcI1Ql4e0zKA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iPXlcNwsSfGBEhSI19h9CWVl8IA36G0SCzN0aKbdpWC0wrBPq86R7rncFkWS/2yrc5JH07AuWSJroutcvDg51IAWxjOD0KoExsutgGYEMWy5/SuAAb8tkvXnP1I8nGeGhmAKL6OdCzBCzS6t+TZ3V/bC2/IHiJtrFlxQskUU/Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-794c3ae6db2so58704385a.0
        for <imx@lists.linux.dev>; Thu, 30 May 2024 04:57:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717070248; x=1717675048;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UjHdVTNPfpZSE5mw/0S4dwLQIRvAN8JureryKLiLrHw=;
        b=aqLDqr6te7OFVCLYTrJnuDSTBzH11YtyXYebO6JwoQlpMOc2rjo71m+hR7Zp66tsY2
         xQP1Zu/R07pK2Ax3P0xHO4ed7aZjLklNGIcBtRKSEh5Vja7DRnn1oyqCP0NUM6PdGG4q
         SncCzTTcB8sqqyunBo3nCPk9mIZBnCBW/yZGc+X+IBT4kIgwAB3pU7r0oVKrwl4s523I
         mPbrglz2vmWC3GicjwATMvxuxi38TcTTG+FXSK8Nd+5owVOtGucLWDEs3MkaWjP4qY8R
         LFiPQnlqaMn9ETNKwO5daP9X9h1MOyG0tbvyE22W8cKl6V+OhcbMHcMgOlZNCz468LXD
         Gbyg==
X-Forwarded-Encrypted: i=1; AJvYcCXs4AKJH7tdrk48sOZyc1Sez2YQfOg6wOwgcgmZOA9rc2mzZIdzdLN+D1IKW8239LzSNN24luh0WCIHC0ewzx/KjPkq
X-Gm-Message-State: AOJu0YyzhR1TTv12jkk5uwkEP59+KkkQHGMWtjpsoGd+JmIRoYaU/HKD
	sB+9KIB1wyAiNeAzMJAr0OYfUKyLNCO+MFSI7+Fo+Hopt3JlhGCjm5sSORxz
X-Google-Smtp-Source: AGHT+IGOxTKsOrW6IaDTfD1qsd1HYGaNo9e27m/8Q+HXEd+aHE18f0NadmbxEJQqpF5HbzJL6BM9+g==
X-Received: by 2002:a05:620a:4628:b0:792:daab:b209 with SMTP id af79cd13be357-794e9d95ccamr228644685a.6.1717070247523;
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com. [209.85.222.176])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794abcc0c04sm549771685a.44.2024.05.30.04.57.27
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 04:57:27 -0700 (PDT)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-794ac6b5409so59040685a.2
        for <imx@lists.linux.dev>; Thu, 30 May 2024 04:57:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVUJGdUsd/BIh9ixhUJ/rGg2dIqZOxC0f5YrUol/jpvUJxM4blpLb3lmtJXikLaEXY0GfQWrxVDeM/w+tAlGTuNe0VC
X-Received: by 2002:a25:6842:0:b0:dfa:48f3:2253 with SMTP id
 3f1490d57ef6-dfa5a619bd3mr2110161276.32.1717070226150; Thu, 30 May 2024
 04:57:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 13:56:54 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Message-ID: <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Heiko Stuebner <heiko@sntech.de>, 
	Damien Le Moal <dlemoal@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> Use scope based of_node_put() to simplify code. It reduces the chance
> of forgetting of_node_put(), and also simplifies error handling path.
> I not able to test the changes on all the hardwares, so driver owners,
> please help review when you have time.
>
> This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> thanks.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Andy's question about code generation on a related patch made me
wonder, too.

On arm32, a conversion to for_each_child_of_node_scoped() seems to
cost ca. 48 bytes of additional code, regardless of whether there were
explicit cleanups before or not.

I checked "pinctrl: renesas: Use scope based of_node_put() cleanups",
and all but the conversions in *_dt_node_to_map() cost 48 bytes each.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
