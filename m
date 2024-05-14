Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03CC10949
	for <imx@lists.linux.dev>; Tue, 14 May 2024 08:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715674040; cv=none; b=fY6fgOwWn7RGQEYDmRhLJxqh3RjBTYe+9gSN38/HOYHK5zfTPc2d01ofMnta2J66LeogniVX9HRJka/f3raW3feuKgny/ZSGT5wB07jxFM5suUMuQZm6QfQu4NSIQWyPDtslIP/nQl0au2fZtUx/B7Rn/USS3Eba+FGz5u/6l0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715674040; c=relaxed/simple;
	bh=toj7avCrdtDP66sy+w2xPyKX8oobvvymnd+3vjyORlc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dHnw8mnzs8U7SdZZn638DatB2ESgL4Tvn0fFelYJ1p0cn7kAM3ew67EFKwotf1ToL1Ydq14pDOjnAPjXDLnCTe9TvGJQBPWL3vzsgxmJPtrKBzZDfFGxafNoRdkTHrK/CnHiAG7dea1AKvetRaQSrbi0gK6FhFNW0yiGlytq9HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-792ce7a1fa8so318280185a.1
        for <imx@lists.linux.dev>; Tue, 14 May 2024 01:07:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715674036; x=1716278836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAZGt+1Rc/qtuBUqNnzX2rBGCR5XoalBEqWaRtcOihM=;
        b=IXLeBkDu20sDmcfiNXq9neR/r5mPyPEYdho8G2el446BEjrJtbylSPGG8n2Y7tP5vZ
         Y2++MuYz2xYnUb2CdY3cddlJaAp1Th22HkOzk04FwMLcgqPXcWwW5msqZawXDRirl30d
         53+0bMgYXOaz2EwV1ZCWJsl4F6oYFtyUfEw8mbT6YzMD7rcis4xY7GxoAgYpi77z9dnn
         628DvyaKXEsCEyyddXZU+POhqVJPif5AYsilraM4r/3F1uZ/wh8n/gPCYXobnlyzA/OR
         Th1c6MRH+r34X1Dvl7KIJkCWAbnFAPBesup/4p8e67nABqmW3MR9dVdbgsduxEBTxfnz
         HJGg==
X-Forwarded-Encrypted: i=1; AJvYcCX0eS0GFbFsMVhlTGu0sumkAx4c+kFLfktuBCBCoAalNP+zjTIvEgvtCtBKOg9taMEVS/F42TKhDIEQegQcHO6qSoc2
X-Gm-Message-State: AOJu0Yz3DZj6S4r/tbMwG8+BGnlZIzGyt+5VBkVt1sehxw9mRHNAlJGe
	FWx+t++lq49mvkncIGW23UEIBd5oE5KmcyA0gMJJ1jd/JDvLrrqXeb+Y95dz
X-Google-Smtp-Source: AGHT+IF2TYguzGarQqwxhwNQmGFNdgwgQV7QMK9ABiVfrNAzca3nWJnF04u63No1HPgOr1rbfGTFPg==
X-Received: by 2002:a05:620a:4085:b0:792:9e07:afb6 with SMTP id af79cd13be357-792c75a963fmr1617571485a.32.1715674036181;
        Tue, 14 May 2024 01:07:16 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-792d7866176sm276638485a.123.2024.05.14.01.07.15
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 May 2024 01:07:15 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-43cff222427so26168441cf.3
        for <imx@lists.linux.dev>; Tue, 14 May 2024 01:07:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVNfiaR6U5zOXawIe/LvXradVXeFmv1Pw5qcWYxucHfmYG1wvX8dqzBMrlQ/CNzLuK/EwuimzlWwSo6IPJVB7nPtncR
X-Received: by 2002:a05:690c:fd0:b0:611:7132:e6ba with SMTP id
 00721157ae682-622b0147778mr138786587b3.40.1715674014345; Tue, 14 May 2024
 01:06:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
 <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
 <CAMuHMdWCD+k8=iX8+tcK76DU_m9quR8BV+K68K73SygJzCz5VA@mail.gmail.com> <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
In-Reply-To: <CACRpkdYS8=cHT=7tGbzWZ73jbLhjqdpssbaHH-qREe=bcHYe2A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2024 10:06:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Message-ID: <CAMuHMdUucOu-c7tbeBBCMaoouFcUnJi0aRU--pc2Gk9QWNrANg@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
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
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 9:33=E2=80=AFAM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Tue, May 14, 2024 at 8:36=E2=80=AFAM Geert Uytterhoeven <geert@linux-m=
68k.org> wrote:
> > > Does this go into the Renesas patch stack?
> > > I think the patch stands fine without the rest of the series.
> >
> > Sure, I can do that.
>
> Please apply it!

OK, will queue in renesas-pinctrl for v6.11.

> > From your positive response to v1, I thought that perhaps you just
> > wanted to take the full series yourself?
>
> Sorry, I always prefer submaintainers to pick their stuff, they
> know what they are doing and they can test the entire patch
> stack properly.

OK, will (try to ;-) remember...

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
