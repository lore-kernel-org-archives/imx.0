Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2A1319864
	for <imx@lists.linux.dev>; Tue, 19 Aug 2025 09:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755596887; cv=none; b=eHulHSprMoMpRRppfqC8CgvOFvICJvvgPtsOzs18ItJKYyXeZBQ2QwlgJhb3zWnt7DYDlnEsM/ZOvQvCFBDquNKJKB8MHEJ6REAupzgB8zIr1q0Gm1eEaXE9Fj0CCytFLzqvWIvjXH7tJAlUj9RooQgbj0zqKx8/RTvhjsmrewc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755596887; c=relaxed/simple;
	bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KawX1kQCUq5C6JunFvYs4oyDltSx6vHp3S3Ltz/IpdTUiYp4Uq+IKLcahgcORip0vkgzhbzBfOFldzuWFfWacrwXQxV1sxlRuo6eKfW4UlhndiG77x9k1l4kVxA2laJdHOCstd+mzAemLwtA3v56/Q4abUB2j5EJ9EdSZiqKAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDJE6v1x; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDJE6v1x"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-333f92cb94eso39497461fa.3
        for <imx@lists.linux.dev>; Tue, 19 Aug 2025 02:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755596882; x=1756201682; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=VDJE6v1xRoALL3QxgkctA6wWWVs4I6LnGcIH/GEtp6g1HJfcLtYfkq0w3yW2TzcNai
         dkHhTPwQ7/hnH2EzAxSa5d0P9fFPuB1A+/tdb7vIL/TIb9RzxO8sYxZv8dDnX+A6dGI9
         1j5RGZUU2ZEv6kgwjpwDSxK88fk9php6F8HcRhmEQB1yarZNzj1J8cWfNPpBl2USbCtT
         O4mYFrSKE7IcMHv7sQ9O0zQBkIkN7eyPvl26C88gFzNCO0rPrxFIOXhd3RcDlgfE3BvR
         y91o2YfGb7zrBZ2zm4dfowxcxbGoNkphgTXhjeElkCLf9WGstIJAROTsR9WNKCTdpR6Z
         Vn9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755596882; x=1756201682;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RdTVW2acL3x4TY+q3fiwzcKJmZ14PXDkj8EpJokxAbo=;
        b=qZEbY2wfvrxqbL8Rn8fOczP8LAnpEKZTQAqfbR8se+0NmJ5EjqIzggOZZzVGoBAo4I
         zKCycTnRhQitEJBmJj7//ywoG1hRtVcnMdUMZ6qC4VoZTH0szDnShhPE7oj0Fcq0fl73
         9gOgkprOdqJ9L08jh3gCIJzPWQ1ko4gn0u63p7pbu+/+W5FOlcXPChzHDAR+n04n601t
         1GvuVpanJqZf1reYABQhd38hOdbgRXeJi/gRd4jspDsa5NW9cODlBNh8UyKa03d9apUZ
         H4FSYgaHY+cx3M/IKiIt+6j10Bw85BDVZO85Y6CBV6eJL1uTtsk2BrERs5Xv5U0YexEx
         oT7w==
X-Forwarded-Encrypted: i=1; AJvYcCV9BwPBdD2hhdacapBprPFTd/suUS19ynoPGmBEF8ZcOWh7/h0KbTno7pkyLY/D5kd6h+o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/069Rb9w2uxfhRLRu8wJYzenaHzFsYruPpCpkBMeUR+gry2Qd
	YB0UYmnkj3vbEBleJ78XSoAPoNNvuW7NiDfAPCPYT6z48WUd1XlJ/3A0a2NenqX4VObXkEEHrWV
	UGJPOJiIBYzRXPDSD8r/KIDX7uFBunEAwlSLIfMmlJg==
X-Gm-Gg: ASbGncvF62ZQMY1wd8fc1cFthZEX2qvXPtTL/KC/hznHUS/cnvOYspHfUvr/vnQY7PW
	1O+eSN6bB6Oa93h48ny/E4ecKK7TyBhW29UCyrfFUr2LL433lWh/03+qg5CP1lIOyPbar4UCm9Z
	Rxg9N6/bsaA1Cg7Qi+f5uhGA7ApgIEnN4RsYnLFja64IAtAQaC0ESQmDBDdOP/7uLaOnGdq1Y93
	M9GUB4=
X-Google-Smtp-Source: AGHT+IEolFO6aeJABYr1hNPxQasixpAjIgJqFl/o9dwJCRxvFjpbc3xagoFqiJPlswYsIWJYgR30Ss513xxDR9NTkTU=
X-Received: by 2002:a2e:b8c1:0:b0:332:45b5:d68a with SMTP id
 38308e7fff4ca-335305347e8mr6104861fa.5.1755596882380; Tue, 19 Aug 2025
 02:48:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com> <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-108-b3bf97b038dc@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 19 Aug 2025 11:47:51 +0200
X-Gm-Features: Ac12FXyAMutAnmM6yYaTGFkQgGmOcrXudlcTGzS_av87nGHcGPs7Xb4FZygWAbE
Message-ID: <CACRpkdZonmP8rSQS-rwzthNPv_MyddMReZQaD13b1qkRexxWyA@mail.gmail.com>
Subject: Re: [PATCH 108/114] clk: versatile: icst: convert from round_rate()
 to determine_rate()
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
