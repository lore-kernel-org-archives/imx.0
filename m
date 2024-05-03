Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD41146A72
	for <imx@lists.linux.dev>; Fri,  3 May 2024 07:20:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714720812; cv=none; b=jidH2ndLEBIOlnXUlihAyFk9O82/+Ft0djUJ+ZFjXfqcVia7eyxXBFXt3sVDPJBEnfKs8/aTa0pTPeLLCNBoirUFc2+KNbKs4Wz0ANa/FPcPEVOUUL4ric2kyWmeLqg4esHBGBLln7X8VONgS1UpoNvi0DGqV8aa9Be2Kl9THaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714720812; c=relaxed/simple;
	bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyuJYHD343vVV1DoJEvZ7QRGA+SFprsrQRPIBCfWt0y4b3OfcBpz1vQCXVe+xwpnzsYoJWgc1/lT8kP5LbgaBWiv/zyO2SKYi5vrkRH+zu3OQiyET0RNFw1NSleO55qW4AmVB4mDsfXaA4NTiXwtqCSnt2lZDXeCNBpqROpn/us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FPdRhil6; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FPdRhil6"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-de5b1e6beceso8567605276.0
        for <imx@lists.linux.dev>; Fri, 03 May 2024 00:20:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714720810; x=1715325610; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=FPdRhil6DbGq16tTpBJyrwovixVXOD+FpGC8lGOnjdZCrZf2nwYa//dBLgZz4A+Frl
         8vf4WyARRPoiFVlm4yeN/Oc8reyxsquy4LsmBxguZhsWWWjkuUJ4JmuDst34RQtW4CRO
         /ON0McD2n9gIeIQy716NMmN9kd0ELPefSRQ0Wf3D9lI17Bg6c1IxBwx4bYJ4+2KTJDjl
         giUA4sJ0hRbh/arnUgbkW97AtggkVEw6kQTKgfDdTg0v793VPQteoh/k5oboQFnbNSbF
         M9AWUQ5+DYR5Mg82CR4CYR9/uwZrIJYDbqX0yD3VDn/ItRnYWUV86cvp8Ccyl6C05+/q
         kGUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714720810; x=1715325610;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9wIaPeFAaUloh+tV0Kf/Zmc8dIfcbAIB89NynZIAYBA=;
        b=Vte5waUN5Afqo26JKs3rtb53A8owGrBcboJcnp91U3Tq4o3UCmaJ22hxMdrbVugnaM
         6GiNe3uE2SuQn5EHlhS2TQ8Oi6JIFzno/5MT7FSsXD0AHYWUjFAZQyjBlZ/x0PcHPNr/
         TfoGaZERCo/1nVDWjZhPydveM28fSHVlTf0EVMlIxQLtzHzH2gZGuHsibRCHepEwTAiC
         G+/i3jtWJh5Y0SgsjF+MeWvYNrOr1y5KXdKIgfwx9dIeSExcCFis3DDKHdL50+mcwn0I
         xqugtpXeVDUmvndaH7GOkSZy1OWOu4tZmS0rDxdx6TmNOlmhDl4/4dkmKNO6IXuM8H1t
         V8nw==
X-Forwarded-Encrypted: i=1; AJvYcCVEuaOYzspj9hoWnAurSXnJu/+5c7AkxWNOGDtRpyk1NPfidUUhC18QXuYhQwGGmRXZZkX1XRhWYtzqh6dyTGOU+r41
X-Gm-Message-State: AOJu0YyGd82fYFa0cHvq6ZE0lAdbe3gt3iAYhgnpGNLHV5M+FsrhdFAa
	zon6UuomsjK0f9lzPlSeLoXXCcyrPGs2bs8myeMeTP+MmmSGW/U+86yosg4mL11RDCWDLpGhCO+
	wS7g5C1NjjVzXxjC2AyQasaqRGIr7NulfhnU9Bg==
X-Google-Smtp-Source: AGHT+IG2e9YB/XnLTQbvqj0kK4ATPxoJ7R6aIP282PPsbZXF297lXvACY/w/LCEjCFtAwBrhBmRU/mc6jno/5QoxHeQ=
X-Received: by 2002:a05:6902:2203:b0:dc2:2b0d:613e with SMTP id
 dm3-20020a056902220300b00dc22b0d613emr2388159ybb.10.1714720809843; Fri, 03
 May 2024 00:20:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
In-Reply-To: <20240501-pinctrl-cleanup-v1-0-797ceca46e5c@nxp.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 3 May 2024 09:19:58 +0200
Message-ID: <CACRpkdaRpJw=kHtya2iww7vvm+Bt6-oPMmz-6VzfhZniSoMP3w@mail.gmail.com>
Subject: Re: [PATCH 00/21] pinctrl: Use scope based of_node_put() cleanups
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
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
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

Hi Peng,

thanks for doing this! I am very much in favor of using
scoped management of resources where it makes it easier to
do the right thing.

I agree with Krzysztof's comment that we should avoid scoping
in cases where there is a clear path grab/use/release so the
code is easy to read already as it is. Let's drop those.

I saw there was some patch that was even a fix, perhaps I
should pick that one separately for fixes, but probably it is
non-urgent.

I suppose we will just apply v2 after people had some time to
look at it!

Yours,
Linus Walleij
