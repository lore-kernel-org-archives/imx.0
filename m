Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA86E6F301
	for <imx@lists.linux.dev>; Thu, 30 May 2024 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717060914; cv=none; b=qRhGFhA2foiU7+sJ2vKtGW7BDEdyeJWYC84EID1JOB9h9Jr+9scIYx1qDi3Vd7NOZ8jfDgZlYhBa8qEJpsOD4cjNWiUcpJvhOv39CONpL2kU+UChJGs7E4oi81BG3MNIneUz4DaorvMbRA84iPvJN4vpCWpRHv6zTCjdPQXh1Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717060914; c=relaxed/simple;
	bh=6FVSMp5UzL317G0j5W9LunE9q3jEg6QzEPMtdCTKcKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p1FVOLpquS8X4BGMJMk+pXvFCGqNBybRdsMykuEio3YzDfn8HqK5XYx8wEfjltXEKjKt4eH96yl2tXNb1XRZ/407Cwi+7hhfJDKhQXTs1tSBm7dfo4B30eB/BjjXLEakiV1KwnMfa6+7jj0IdNZCiXjnZBty5pYewsvnemlqqSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43fb094da40so7726621cf.0
        for <imx@lists.linux.dev>; Thu, 30 May 2024 02:21:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717060911; x=1717665711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWN78EB24MX6Q0HZqErBr8t9tcr4nbKt3etlWVHkE68=;
        b=CXZnalpcrL7BLG1Vhot3yjPbOjtPdQndxc715EM6fTnNAO4qL9dC21SAJmg86Jcrfh
         TO98Ml6kM4NR2wY9pS/4BqMNPIK64MG0Qngx1oEQIOnF94MhJpdqLHCHvy94bHmcuFis
         7HKxpSY49lKCU9n8QhZ++KPr44YOeTR3fn2El0lfdHlop/7o6uMDvdveaYM+JN1AJikX
         9eTPAisyZscw1+/r+JZujfZf4A7h1APlcowE7CeYllvlxtb5OwplX/z2dT4TgUS6F0rb
         bjZohe789HA5wP3Zrnv/IHoN2wJtwnL9jhSCeN/gH/ARge0j0PR+Q0CUlYURJcFcNEIi
         RiMg==
X-Forwarded-Encrypted: i=1; AJvYcCXLP3X42vB4GTMKX1ruY0n8uTOYAzpl0wB+ZIv7uaLA/mb/TGYccbGYVdNbnzMjArb1CQfTcdJ+jmfMUkOI++ivuRaJ
X-Gm-Message-State: AOJu0YzlKf4lXZBtSObBJXBz1YkPAQ6ZyTbKgeJ2oENwYf35Dleyl+aL
	2PS7nKzNACn1ErCFqAgBzrEN5lDIfRMvVJ82l+bF6881Gbsl2cg2Hzd8O4FG
X-Google-Smtp-Source: AGHT+IFAHlE+S25mJbaOdA4Uaek7asNe+Td+jKOJuHFC2GxuiGqi9zTgAU5zjpX19duMNvnIEOWd7A==
X-Received: by 2002:a05:622a:178f:b0:43b:9f:5ac8 with SMTP id d75a77b69052e-43febfe14f0mr22008491cf.31.1717060910852;
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb180456fsm64197281cf.50.2024.05.30.02.21.50
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 02:21:50 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-43df751b5b8so4847011cf.0
        for <imx@lists.linux.dev>; Thu, 30 May 2024 02:21:50 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXQC9QV4FaZ+onzP0wif4d19kJzKo/8hWIzHkErmla6LJPLLq1apd7/pPWeRA6xGQG8Uqw4IjyHpaiW202p1AqCXp22
X-Received: by 2002:a25:8c84:0:b0:dd1:6cad:8fd3 with SMTP id
 3f1490d57ef6-dfa5dcdc800mr946343276.27.1717060889311; Thu, 30 May 2024
 02:21:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
In-Reply-To: <ZlhAm-giX6jNaUKr@surfacebook.localdomain>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 May 2024 11:21:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Message-ID: <CAMuHMdXqXVT3Y7N8pTb_68E23RkLGi=ySOSDkAWX4MOpP09Q4g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
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
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andy,

On Thu, May 30, 2024 at 11:03=E2=80=AFAM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> Mon, May 13, 2024 at 01:59:03PM +0200, Geert Uytterhoeven kirjoitti:
> > On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com> wrote:
> > You missed one trivial conversion, presumably because no error handling
> > and thus no of_node_put() is involved?
>
> Nothing is missed. The below is a redundant change.
>
> ...
>
> > -       for_each_child_of_node(np, child) {
> > +       for_each_child_of_node_scoped(np, child) {
> >                 if (of_property_count_u32_elems(child, RZN1_PINS_PROP) =
> 0)
> >                         count++;
> >         }
> >
> > If you prefer not to include this
>
> I prefer this not to be included as it will give a misleading signals to =
the
> use of the original API(s).

Thank you for reminding me to send this out as a separate patch :-)

https://lore.kernel.org/r/c0a28f466c42d5d59c7fadfa1fd05fd512d43b6f.17170607=
08.git.geert+renesas@glider.be

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
