Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E191F4C84
	for <imx@lists.linux.dev>; Fri, 31 May 2024 07:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717139227; cv=none; b=XovC3Pd8stSjYRmf5+pEazhfmx3+j1pIANmYXYTQNMApcphXZ+zAzBKhe5C4dgTyOAvaZvHY4pSNliI6AIhpUJhSChCc/0rL3cTBcIY1QP66kxeFTj9G+qNQ54GLbfwHBBGH42rXGEpmr/83GhY1o5nrYhp8yl9mvbM6XMwY2+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717139227; c=relaxed/simple;
	bh=GwpopD7I++CEt2GXRSjw+x35z0xYtVzunPiCuEMRxwU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p76JIb5FUdEObREHs3fETjRgjdA0z9CFLRNkUjCPb8iDlpBUIWyHY3Vadvj0gBaXLYMFmwpiIMr0k5dTMVvP9csTdI0fVK6hawWs3h0jECnv2JjXuFeKljKWNGID1MCBH51Ot7ugKPSXJD2HQ4oS1bY05tCnxTKr8Wm/e9s0Zs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-3d1bdefedc0so918095b6e.1
        for <imx@lists.linux.dev>; Fri, 31 May 2024 00:07:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717139224; x=1717744024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ayp9OTJcx8xBTEOWGr76ffez+fesdX+4XqGBVIDxEaQ=;
        b=JxhEUeTgSUl2KpgWVuaJ/uNUljCuHqxNo7dCqG8g0zX3hINYwfDC3NK7I5Fiev6n44
         8/TSWEFrtp3qMKqu6RzuPcxAB+GypsozCAamJO4Il9bDbeA7U6dru5ZWsd5IFIJ25Aql
         wXXuvIq9SNsGoTlXmcDsQNmuBb6VtQ8/W0OkXn0DxGHQWp0hPLA8S+z6m4gqx4DkwjX9
         smJwFcLZX6/mFA9F7f2wfH+b9taTY7rf0D1+FUbIXwGv2f6NO9ThEOVBVKmExXlAM8xk
         l2UB8yZSvmJ3lzn/OzBo3NtzRl/AfzWrzYPMFLZYp0sINR3RRjoGii3teJ7wCI5OjgYR
         O0nA==
X-Forwarded-Encrypted: i=1; AJvYcCXF8u6SrJhtjFii/7V4JXb7fksbAbeE1C/iCwsvp2gYWpVognweAjid9qknZPMZ/rqq6sWUm8ncO4AXsPqBkRVNWsNx
X-Gm-Message-State: AOJu0Yw1vJOkEegv4rjmpeASAkX+Yemjqftcv7WAHNVyNrYL6msmfLQd
	0nxtyl+fQAYV3cnCCULK4PeduxTmzfxhj0zGk1u3MoJuF13mYh9NZe4cXRFv
X-Google-Smtp-Source: AGHT+IHVEihowzJGLabVvDO6UwtJaXlVhlCo2WbrbbhIQkitCRzNmg9q2/jLhQd/cz0Ifwby36xjGQ==
X-Received: by 2002:a05:6808:1294:b0:3c9:62d9:8a4a with SMTP id 5614622812f47-3d1e34a10f3mr1258310b6e.33.1717139224220;
        Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com. [209.85.161.46])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d1e1a46372sm263282b6e.40.2024.05.31.00.07.04
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 May 2024 00:07:04 -0700 (PDT)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-5b97b5822d8so797831eaf.3
        for <imx@lists.linux.dev>; Fri, 31 May 2024 00:07:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX78nIe4WKoAA5iNs8gpxspixQdauJfIe4UA3Bnn2JXwTugiGe4Y6bya7mURlgDT8kxXkxtg63RymXOUa6q45Sh5hcp
X-Received: by 2002:a25:5f46:0:b0:df4:f149:1fc7 with SMTP id
 3f1490d57ef6-dfa73dc4a2dmr974775276.58.1717139203004; Fri, 31 May 2024
 00:06:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <CAMuHMdVprgpjDP6PDn7appofJv8Tv30nRA4+7n4sR8n6n4qy+g@mail.gmail.com> <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9417FF2632A278BF6605AE1F88FC2@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 31 May 2024 09:06:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Message-ID: <CAMuHMdW01HtY7d+L=44czH_dqV6bresLeF=SRqyn9p=jk3MTAw@mail.gmail.com>
Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put() cleanups
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang <jianlong.huang@starfivetech.com>, 
	Hal Feng <hal.feng@starfivetech.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Viresh Kumar <vireshk@kernel.org>, Shiraz Hashim <shiraz.linux.kernel@gmail.com>, 
	"soc@kernel.org" <soc@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	Heiko Stuebner <heiko@sntech.de>, Damien Le Moal <dlemoal@kernel.org>, 
	Ludovic Desroches <ludovic.desroches@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Aisheng Dong <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Chester Lin <chester62515@gmail.com>, 
	Matthias Brugger <mbrugger@suse.com>, 
	"Ghennadi Procopciuc (OSS)" <ghennadi.procopciuc@oss.nxp.com>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-stm32@st-md-mailman.stormreply.com" <linux-stm32@st-md-mailman.stormreply.com>, 
	"linux-samsung-soc@vger.kernel.org" <linux-samsung-soc@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>, 
	"openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Fri, May 31, 2024 at 5:07=E2=80=AFAM Peng Fan <peng.fan@nxp.com> wrote:
> > Subject: Re: [PATCH v2 00/20] pinctrl: Use scope based of_node_put()
> > cleanups
> > On Sat, May 4, 2024 at 3:12=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp=
.com>
> > wrote:
> > > Use scope based of_node_put() to simplify code. It reduces the chance
> > > of forgetting of_node_put(), and also simplifies error handling path.
> > > I not able to test the changes on all the hardwares, so driver owners=
,
> > > please help review when you have time.
> > >
> > > This patchset was inspired from Dan's comments on pinctrl-scmi-imx.c,
> > > thanks.
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> >
> > Andy's question about code generation on a related patch made me wonder=
,
> > too.
> >
> > On arm32, a conversion to for_each_child_of_node_scoped() seems to cost=
 ca.
> > 48 bytes of additional code, regardless of whether there were explicit
> > cleanups before or not.
> >
> > I checked "pinctrl: renesas: Use scope based of_node_put() cleanups", a=
nd all
> > but the conversions in *_dt_node_to_map() cost 48 bytes each.
>
> I am not sure this is an issue or else. What would you suggest me to do?
> If you think extra 48bytes consumption is not good here, feel free to dro=
p the
> patch.

I suggest doing nothing about this.  I just wanted people to be aware
of the impact.  I guess it's just part of the slow but steady increase
of kernel size (ca. 20-30 KiB/release)... ;-)

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
