Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C1814D2BC
	for <imx@lists.linux.dev>; Mon, 13 May 2024 11:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715601579; cv=none; b=Gd2EY9Grxc36k0UAX2JI0mhAOILYmuoXjTBLyKHOK+8jRch/rt77O6W14ihepjkg3K/CTojtYlV1DeduwM81FtqMwxmAljNbQmRH8Z6hzW0D25mgRL3zlGRjtz40rUQJSiVN3Q6vAOLFuZcm5rzgC749cwKWFsK3D44UC3akOLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715601579; c=relaxed/simple;
	bh=ZI926+nrkyV0Flvn7rSMoQ1E2Kcx99Sv67xPVhZTYWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SnZKXZciKG06yGjKRcf7+a9PoQhAEFFLButkqXUQWd8kwny4PqysUs6SKhxXCtWvzRso0ZdSmIE/FgF7bIzc56z8d8ArHnZK+3oKdsUXcHQ/CLVtZXMLbEgqDiaBlQKwkx/HLDMqagDLp8l1sDub9FH1xwcf8vBokme6+JGfcrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-7dee9763d97so222215839f.0
        for <imx@lists.linux.dev>; Mon, 13 May 2024 04:59:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715601576; x=1716206376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z24B9qDTJHEobEGC/70CrM/eVAoUVzOxiy7onUzGbVU=;
        b=eiV8nCB70ak/n73WVkSDoAoX84hXM+3uLjhKI2BYC46sOmFZsawq7b8XX5AM3haTJ2
         c7OxLMlDSMqHlJ9Ns6q086XnPElJoRdx9GSKE8n5qz8Nakty2h9fZkI1VYDTCSbv6WLC
         rbEH+vfV8ewUUb7cmOZw+TnJ2fZGEXYD8kWa7rUlFnolqsdb4YiN5lbvNUvqe/uL2fXe
         elFrj6giqS6j1LLx28x1g9KfFp56OJ9DG7t1HBK3T4LrwBGVTY8vI9K2Nd1bE+kYkZ0a
         bUxPc7ZHzSIczMDJEEV7IB23eCqsZv/MyMm1oVlPryhqmjQxkJmgvth63G0XHTmxmDkm
         haBA==
X-Forwarded-Encrypted: i=1; AJvYcCUiChc+kJopOrRig2NydOOlY3MB72RV/yarvubDPZZAI6tfGD+tWKXE3SSVYCQ//Ch9PxplV+ZehVq3ACi5CgmvN0eO
X-Gm-Message-State: AOJu0Ywwofv+Umuc1tpWoBxWnFutddXmOLq2XSwcJ5l5uW5UiJEmNKIN
	mIfK3IPd9ZLEm/AT1e4ZxnCSrvEMmmN7wjLwHPTgAYFAIIwB2Ez49NS1nZnl
X-Google-Smtp-Source: AGHT+IGcKE8gU900qf6Gp9JpWkQ0fGFI4fJkKIpAgGroHYiom+i7to0z64QGVtl/kG2j7pHJWqbVFw==
X-Received: by 2002:a5d:9c19:0:b0:7e1:867c:da47 with SMTP id ca18e2360f4ac-7e1b5201dc0mr1099256639f.16.1715601576619;
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4893700e66esm2480237173.7.2024.05.13.04.59.36
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 May 2024 04:59:36 -0700 (PDT)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-7dad81110cfso208091939f.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 04:59:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWfM0ZOaamLxsTn/lDEFTnblf3pMcyKA95l+sfwlKUVS41ZHXKd6uT2cbzuHXxXCXTIaXApQg0/PJ00e/ubzOIVb0QZ
X-Received: by 2002:a25:d048:0:b0:dcd:551f:1e2 with SMTP id
 3f1490d57ef6-dee4f3694bbmr8978126276.34.1715601555547; Mon, 13 May 2024
 04:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com> <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
In-Reply-To: <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 May 2024 13:59:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Message-ID: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
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
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Peng,

On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.com=
> wrote:
> From: Peng Fan <peng.fan@nxp.com>
>
> Use scope based of_node_put() cleanup to simplify code.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/pinctrl/renesas/pinctrl-rzn1.c
> +++ b/drivers/pinctrl/renesas/pinctrl-rzn1.c

You missed one trivial conversion, presumably because no error handling
and thus no of_node_put() is involved?

@@ -737,13 +737,12 @@ static int rzn1_pinctrl_parse_groups(struct
device_node *np,

 static int rzn1_pinctrl_count_function_groups(struct device_node *np)
 {
-       struct device_node *child;
        int count =3D 0;

        if (of_property_count_u32_elems(np, RZN1_PINS_PROP) > 0)
                count++;

-       for_each_child_of_node(np, child) {
+       for_each_child_of_node_scoped(np, child) {
                if (of_property_count_u32_elems(child, RZN1_PINS_PROP) > 0)
                        count++;
        }

If you prefer not to include this, I will send a small patch myself later.

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
