Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B1017C7BF
	for <imx@lists.linux.dev>; Wed, 26 Jun 2024 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719398453; cv=none; b=X4S2oONaFhZ1o87nLIT+PnCERDOINodAFSJS2+QtaCBU8FWhaPXLdSiO3n2h4ng1Hm51m6cfg7tnJ1XENTb/KAzMoZBE4ZP68FIAtJXvWyRSXUdcXNc/sMIcWV0BTQWuXJ+M8vgIgIt8rCEvm7FtWY3005NdUORIwg8Wp+Bii/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719398453; c=relaxed/simple;
	bh=gymnWB6LrLwrULHTehh82mpr4igpIxzIKKA4CDSINP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AGHK6kELTPMmv3JqXODYlro4kZ9haVkBN0YxXGMHyaJJWl/xrKzBBCj/fTK8xr878C+QMt9TjTp8Z5S/DwxGW8/JupKeV8hflr4sTIdvJrgQo8rUFYSeRvsrI9NoVEK9Nq7u7Cc0oDrHw+XTR/fX6VTDAt1s++Ze9VP3W2gdQX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EU57TMgv; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EU57TMgv"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfab5f7e749so5946322276.0
        for <imx@lists.linux.dev>; Wed, 26 Jun 2024 03:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719398451; x=1720003251; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=EU57TMgvOu0pwgPKPFiALZG4nzz9ViFYmx8aXrr9GNoAZ2LXCQbKyG6ZeGeqW7YR+U
         0rVpWE3n+N/c6hjNOJmXRjy4/b5uCF3LsmpiO1OW+prr73zz3MSn0WoSaFwze3iU5JXg
         I3m7AXcfdh1/QuQnFNfY4WFBDCvgphCpXZZosG8+9d9A1OnIpqRPEolbjnuzOUBHGas9
         P5xM86/vAADOVvcWaYbBdt8pxRpMNkkOBal2SJ6MWE/EQJ9PyZm267tHVvLNv8XL9MKB
         QnJCWSeQaGjZVNr+z9hBCWJlNLFyQwrNbE/osM8xMJD9tXh8YW9rTsMQHBxh54q1Hq4P
         Wi8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719398451; x=1720003251;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHbQKOiYe+Ibua4xAi15PJl+V4d0EJrIgF7ce4mlbFQ=;
        b=YjszAAZZxUtuReFrW4brC8lFWVo18RrLYc8H1hy/zpQWZ/Saep9J2KLhzgjW8DSQpb
         eoiRETiNKKqpPyeRZMj9EUJLzQE95M2YlfhRcKh79s4XgrKLkwplzWqZd3W+CmZSpxhM
         l8peOShMKNHrOTWfsXcIz51jip1qkRsi28k4FzG+HsFKXyipBrcZyn8dke6bJPPeboYV
         Oien2xUBPsMkHbW9palI4eNy/5l20FwsAtz3KeC0zk0FXGgBLBgflUckpCvEXCmo8Mac
         u4yy3/MGNNjgQ+SaWxOLdkijKyz9fASIp1Vr0MBnP+GH1bdiZZKL7XRyp+P8laoehI9K
         4OLw==
X-Forwarded-Encrypted: i=1; AJvYcCWCkfZGaVAgINnk0AiDWvfdV5RR3T87SMlBB02Wq23q4bUShvL3tGOM4rPxOs0Z4PMYrrYbY0o/CQ0yfklw2qV4RmiU
X-Gm-Message-State: AOJu0YyVy01DIuoFB/A9b/KfHNkAcvRc00Dz0LgxOzsaWoGWkik5bxGG
	DGrtLa+3FP1U7N4n0tbLYncIpga5DbFxTKqbgsAMn9ULHoDwcGhGzn9u/vZohTxuXl/pRJ/KbVr
	hQidk40GWBhZzY8DF15vP6yIe4SQxUKPWdk9zSw==
X-Google-Smtp-Source: AGHT+IGAQdQECALwFQiRgkrKA/rZBEJOAnkCpPbedoTQq7/jt7W9vOb6wQcj2qKoWUKoPCAEcM15HUQq3HQFJjgWzyA=
X-Received: by 2002:a25:c553:0:b0:dfa:6e39:95b0 with SMTP id
 3f1490d57ef6-e030107f616mr10069878276.49.1719398450656; Wed, 26 Jun 2024
 03:40:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240504-pinctrl-cleanup-v2-0-26c5f2dc1181@nxp.com>
 <20240504-pinctrl-cleanup-v2-20-26c5f2dc1181@nxp.com> <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
In-Reply-To: <171939733731.25849.13373950874840419376.b4-ty@linaro.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 26 Jun 2024 12:40:36 +0200
Message-ID: <CACRpkdastCME_0BWjcaNc0Fw8qsLAGgoQUMi7g8sEP+xT=T_tQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 20/20] pinctrl: samsung: Use scope based
 of_node_put() cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
	Joel Stanley <joel@jms.id.au>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Tony Lindgren <tony@atomide.com>, Stephen Warren <swarren@wwwdotorg.org>, 
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 12:22=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> On Sat, 04 May 2024 21:20:18 +0800, Peng Fan (OSS) wrote:
> > Use scope based of_node_put() cleanup to simplify code.
> >
> >
>
> Applied, thanks!
>
> [20/20] pinctrl: samsung: Use scope based of_node_put() cleanups
>         https://git.kernel.org/pinctrl/samsung/c/707807f4c1128e39442519e8=
49e4ce0b7c29b110

OK I dropped it from my queue!

Yours,
Linus Walleij
