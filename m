Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204D0311977
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596857; cv=none; b=rSAoPfyr4HYvvRoGDWpdXoonI+ynmRKfR+bWDjX2i3dwMikvmsu0Bnaj+csJLreCFOOu2il8JAyIV1lsbJgwJutmSm+WAIsBPPGKFh9KqPWzHrewxX7Fp5ZqBu+mYe8A+DmO0ZhPHmRRTBO75uIueQ5VvP3XjQsW/vLNpL+Xrow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596857; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XTScIt6X2K7YyF8OZaI2ozD+sE1PCiaoJvTW3YtnPe3TJDiTSCcDqrkWK+jmdrf3/ZekllmTkUA6+u/tnDeQX8Uh+JKy8ZyMp6nVCQUGaK84LVviR3khTQ6tD3gTvp9cRnkbYboNeMIGw71JmNyLro8+RZB8L8JdSX+uQJKEm14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rgYnkJ4h; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rgYnkJ4h"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f8d3be05so35092241fa.0
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 02:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596853; x=1756201653; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=rgYnkJ4hhh4gc6lEbqSVTkaMqHm8amrf5q1O1GiiJ84uWZ9dsccHCpY7Sr4aY1Wt2S
         NVI7gPbtU67F/iQ0ygN1kZ84aG7sf/zpETyLNiZU1awH3aIpi2brC2wJjoHtJqXEv3X5
         gH/AZciQtxXacWfgtmd94vsf7MS1zs6NKGGaqe05/+gKTgTUdgy7XYpVd7me9+Z0xqyG
         vqZKqHKPIwIDYx0XWrj6+1LM3z5I4LH5NzG4WHT1k5+S9NRngfPbbsJLqg1NTTbFHiue
         pkNxqjfNVyQ3b+LaZwh+BflOF0RaXZWfunNq58H97dAqkxibVxft8Pb8hRrd8RZm8r1d
         hsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596853; x=1756201653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=gEd3vlAYoVFGrE1uK0pmWhv8OplI52IRAlI2wEzOBPOb2y6ntijrIk4Abf1nIGNVKz
         beJpaOuIbcwTMUyAm9zF6v90p/Mx9jK8jpsGBPMRDv4xo0iy6FbxehfYSVaJJx0aEGhC
         zJlssDaiyzQZCcbk27WYzXZLxC2XFOUCdBMOBnKm40KG2kVPMIYKT3LnhPga1VJJBZ8C
         nDDGh88tSR0i4BD1/VJtMu7I3ZMXCuFUgHz6PZJ2j2HWoSLrua0j3beGpSQeNG6o1YRD
         RiSAbds1+CS4xzfo4u5LUS1nVWrjFzrmuVfcuinmSuQbgen5u9Hbv9Rw2MSVNNmi6FHn
         pkaw==
X-Forwarded-Encrypted: i=1; AJvYcCXjj55IPKB3ecIOEmxWS8+nrT7F7HtCNggebQHAyMfpsbbSNrWYmY74Et3S1yhHCpoo/Tw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7S9NQ/hu3sUW8axBux3deVIZoeFLeaH2/TAjciZfIO12IRBBS
	862MV2Oixerynmkh3fRAF+Ej10G8OwThHsFKOgI5Pgt77kIY6ttsEAKpFsPiMvMWVQtu3gFt2wr
	SbTzOsUIREdjj2A1/HJYe25lK2QsLlxCI1uj0urTd1Q==
X-Gm-Gg: ASbGnctNjDVZ53AlIYtjhkVinxeGD+8lBx3+Yq60uDssY5WwzpT8WTA4B/oof1khWBv
	X5IhHnYgSrgF23qJvBNlxeCXrbe6iVSV7+Ln9dloZ3P7h+2MxVWWo+dAb8Iv1I1ZwWDmRxf0XCk
	+cuZtLOcEUFG1HEoL8LVlUleZKB1qCZqwvMcuqAB8hINe+Q6YXN5w+v12qJ+Bx1tQ2DXvapVZS/
	ESPb8jJJVq6
X-Google-Smtp-Source: AGHT+IFaAkF1r4GWgj+j3Xeyk0sBgHgQuFXAyBRPToaJvqEtDi6Qt1cFt8RtILv6l5mltG8+0huqL2sCrZ81MI3EBAM=
X-Received: by 2002:a05:651c:b2c:b0:333:ad0c:a44e with SMTP id
 38308e7fff4ca-335305347dbmr5252501fa.7.1755596852940; Tue, 19 Aug 2025
 02:47:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-105-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:21 +0200
X-Gm-Features: Ac12FXwQ8ZNlahHw5FRReJn3coSNBp0waFbtb0dR-jKWl_cQ9vhC2BCpFgBry0M
Message-ID: <CACRpkdZ3M65bKzaHcKPRhEFCy+TvHUq8bZ-8Zr_7HSRKsk_TWQ@mail.gmail.com>
Subject: Re: [PATCH 105/114] clk: ux500: prcmu: convert from round_rate() to determine_rate()
To: bmasney@redhat.com
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sudeep Holla <sudeep.holla@arm.com>, Cristian Marussi <cristian.marussi@arm.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Paul Cercueil <paul@crapouillou.net>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Taichi Sugaya <sugaya.taichi@socionext.com>, Takao Orito <orito.takao@socionext.com>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Steen Hegelund <Steen.Hegelund@microchip.com>, 
	Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Michal Simek <michal.simek@amd.com>, 
	Maxime Ripard <mripard@kernel.org>, =?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Max Filippov <jcmvbkbc@gmail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, 
	Andrea della Porta <andrea.porta@suse.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Qin Jian <qinjian@cqplus1.com>, 
	Viresh Kumar <vireshk@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Alex Helms <alexander.helms.jy@renesas.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, arm-scmi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, sophgo@lists.linux.dev, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
	linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 11, 2025 at 5:19=E2=80=AFPM Brian Masney via B4 Relay
<devnull+bmasney.redhat.com@kernel.org> wrote:

> From: Brian Masney <bmasney@redhat.com>
>
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
