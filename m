Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C12480C02
	for <imx@lists.linux.dev>; Mon, 13 May 2024 20:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715633497; cv=none; b=n1lfv3soDz/c/v+pgNAWRuC46c8uS6B4fUdx83+Cz4bePvOSrvCwfV9wsXs/1RAargC3bZBUw6yBfrL9OMq7JwrnbVUt4nNFSI6NypWvDxUqETBssbnbGKbqtD2tOQkyy8FQbjL/x56zsDCXEuS+kKLvETGfJCamr8XtLcdQ3GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715633497; c=relaxed/simple;
	bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m7MJRCuCPUBiXG8vIgoAQyB93ysq23hedKNSD9G6XtiYUw3QNuJaPT5RVxANgVd/fpztold7WjJy8rAS6ForwHxIx6IGrCNlhObZ71FdQIabaK+dOQgnSaClUYTHVa1ZDxWD+LbqvAWMPMhWO8aquaBdkTCsqgU9vnWv5xVss/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eHLfecsY; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eHLfecsY"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-6203f553e5fso50993107b3.1
        for <imx@lists.linux.dev>; Mon, 13 May 2024 13:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715633494; x=1716238294; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=eHLfecsYdZv4e/+R3PABehOqaIM4C+xGLPypgDQtBwIuAZ8Bb7IEtY+J0Ly57QwMrH
         fmyjSLdKAiIY99wkwKgR8ymzXIwpIzgmNzgC/hGauaIRkpSLfux+mGB3paA08yaNLjiv
         WzZ/CEmRSwZn/V1vSj+P/xG2zPD4LHVogHskJZjqFmfU7RXAxvS2/3AEa5bV8QpIJB1P
         FdrC39bj6G4uwRnkRacxggAk9D4MfNm5q09veyXkZpqzVklFwjYkiMeULoKKmpR4FBVu
         /p1PpdICJQHXHbSUS70Mf2oB2Z0iI+QKxzb79dcIiThAWyRz0HFbXjcJcGNhPhXnMIMO
         MWHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715633494; x=1716238294;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rv7jmDTVVRFwx435oiB3ZXmxSleUrrvg/LBh8jNJlFU=;
        b=wOgJ94h3n9bA7238/fM2g29i2sluxs+WhTA/SH85fKV2lD8qHbgeG1/RA/MbHOJT9K
         vtUCj3EoVdOfR6KVdVHGKam7J+q1size/0Ymw12zzYJkGI5zPHwPS9TSWi0myXkZrXRY
         FGbqcY6qM7spEZYCNK4kqbH0lcTw+52DpndLKM8j9u9K1dlEOm+efOFL7L57swIti/tK
         Cpe0dkt1setQ1gBlx6d6MjbEoVSedI/ItwCBXXDurPNjtPFgzf0+FP4zojrMyX8nUE9j
         5OsH5UvAlAmU8mgc0TlSVBSzAsnPRRG5wO18YISJjPchi2cp5RsFbIO4fPIsryz3BHOR
         CwTw==
X-Forwarded-Encrypted: i=1; AJvYcCUoGzhW7lCZqFmt4ijTp3VpR+vPOdzhSvdHHmJukqRnkQtYsgkEMbRB3hTJrSVAuUdJMmB9Qn/PAiXmtwAIQPb5P1JX
X-Gm-Message-State: AOJu0YyJeSvTJzhWMF1w78gijebpCEr6oxADgQGN1lMsG5k7x5ZHv94Q
	0LRVYyKZ7bYr1oeG/XqwssJrHWWL2OFdGAAp+P3ADGWT/knEkZmpzOj8GP9ayya8kqtFXZzKDWz
	9p2oEx9hqkZ9X+ebKbaagoSh+g8PQbAhWtcRTow==
X-Google-Smtp-Source: AGHT+IHIMCINiS4Rm3W7vEHXnxoinnBVVMUXT21CaUFl/K9jprbEih1fz56tIA0O4ev2Ijok+dKJMkYRTsYw4QOpIww=
X-Received: by 2002:a05:690c:ed4:b0:61a:e9f6:2b1b with SMTP id
 00721157ae682-622aff774d9mr145019207b3.8.1715633492884; Mon, 13 May 2024
 13:51:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-7-26c5f2dc1181@nxp.com> <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
In-Reply-To: <CAMuHMdUD=1rpns_mLF2rMM-x5EnOK7TExaJxoJVkbXjVz1H8uQ@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 13 May 2024 22:51:21 +0200
Message-ID: <CACRpkdaUecnwvHFdtGkuM80SObvXpXZkWGYoUMgnNHcvObYF0g@mail.gmail.com>
Subject: Re: [PATCH v2 07/20] pinctrl: renesas: Use scope based of_node_put() cleanups
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, May 13, 2024 at 1:59=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
> On Sat, May 4, 2024 at 3:14=E2=80=AFPM Peng Fan (OSS) <peng.fan@oss.nxp.c=
om> wrote:
> > From: Peng Fan <peng.fan@nxp.com>
> >
> > Use scope based of_node_put() cleanup to simplify code.
> >
> > Signed-off-by: Peng Fan <peng.fan@nxp.com>
>
> Thanks for your patch!
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Does this go into the Renesas patch stack?

I think the patch stands fine without the rest of the series.

Yours,
Linus Walleij
