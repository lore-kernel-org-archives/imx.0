Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4418F2E7BCD
	for <imx@lists.linux.dev>; Sat, 23 Aug 2025 16:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755967855; cv=none; b=mC8P6Tk2lwkSNrPR8LXNYS60rRdOO3G3Dhz4L/AzWl7RAQKJQymQvhdkFopWVTCWl0B+xYnNlPakpMMZx+1QWiSXjywo3/LM3US4gGc02unR8gUCsy0o49t/dC9ii5LYK2Jhe/7rowexuL1F9M1QA3gGuLYr4GOR1GZY2ZpKGCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755967855; c=relaxed/simple;
	bh=ll4kgop1oU/2MiH1wKMG9HwPL4Ffv5IU0KbLcPeRX0w=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gVfkPDVCSMYh4Y7Akx5AqZhvVVq80VNSp8F1sYYwCgsSYHKyjI3htu9mtin/drfE8pA9+80HWgafLmi1ZqavqXnE7uv7CLqU5lwCQ4VBWaaOPRv/0J2TaL8yQBTfVv3hPZ/2pTp8f7w5KchKO439HINVLbU7vLz4p1jp3crifhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c0XYz4Vj; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c0XYz4Vj"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-6188b7895e9so473156a12.3
        for <imx@lists.linux.dev>; Sat, 23 Aug 2025 09:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755967850; x=1756572650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=c0XYz4VjyziGJ0iPowNAuPsyr8znyFpcmaef/nVXyJFlJmS4+a4pkX0Ag/A9BBeV1o
         Mt9Esiwjn2TbcaKSrq8AZ+P+rVu7m8HRjnugTUElku+3fwEC7PBeFqk9YftrWI3ePXef
         gQ9FxXIVEOakCaUPV41tL7mWhtE7+hpbPfnXCTvx6sf9gtCfxoXf8LD5dQ/BAvY/VX/L
         EyvVKIexNYYjq0ARs3yT3qvg20TGKMyBvVByYIGXND5l3bOiw+oux7MtibOKfeJ4DByv
         CZiEhWNV0tC7X1lOnvxdrkb5oukYESFrulIOYTZaZ2Xahl0QFxzXC4dqjmlF1dXU2vvC
         yftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755967850; x=1756572650;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rswAVyuJvRa6TX9BXHZuTzZwEBPSMziKik/9EoWIi4w=;
        b=qYXbipIqgbrOn41vHBgAGG1T4F4ibdDyCzo11k7/sfaYvqV0tefnZbpFRg5/A+EbTu
         SNm+x9JkfvZT0ioM+jXYQTtM4nWaE4N/UjpBpPviuhbuGhEMakVR4799LmIi9kXdj5uS
         Mca5CDJyawUwWkKogwO77Q7ZxyF0PhuFy6rw8Pi8smuUa5FnQPO/Xxdw3dfozzRYBt9l
         VQc7XWf2mRgvgLubBu0NsU9oE37JWcWoIx7tixOrnXMVfJThlO6BNJgA65+upHEkCtxT
         YHFoMRzhtcQ+831FutfdzFe9/Z2MrgluHPKPx3h+yK5Vbes9TM/rz+eR7By20C8vqEOU
         vNZA==
X-Forwarded-Encrypted: i=1; AJvYcCWoH33tVjgaXRFxdaEOqWq0FmZpRLb758hzKnrzO+u+WKJmuEgb0I2eXZEZlg1PHNnNC3s=@lists.linux.dev
X-Gm-Message-State: AOJu0YwhG11Oqib1qmxVHkbOae1jKTZ89skX6Pt2wZ3kQz1+7iBM6oIH
	7A5gOFBfZ0iJ7O6hMd9kKrox2V8Wwh808DER8jgpJwQ1k4GYI/Dq/oYoi3hQygNdOVU=
X-Gm-Gg: ASbGnctrLkEPW2Rr+lj1xhl/rEBrl17F9LxtDQCxEdCwFYxt05e39AZb2i3zvAo/WUX
	vMHzc/3B98Ri6gbLYvWZkYoWUeTjFP+2sJYklM61nm/HYjpjtXazec2VHcD2mg/nKwUmifx7t6a
	m+CPIPo2ilqYM6ToHiNhGNyo2MB6I1F2rGegfmI566UcMyltO4MK7XGR3NIIcPU9szUU74j1beQ
	aduQ0DdXssnemIsHsMflZLmU1Zf5rF2ugiAoVANEHRR+rbns5CdaG+QqTF9Lbl2Iw+3bgvn2VJn
	VH9cM06iGPUrcZ2RewaCxZ4kXbMd3xPbl8ZCngze3CwIl2Ov+uC1sVjtVDuuZxLBBVUEiGSLA7r
	Y0oCHOn5A+dlIA81fIToS+qyqxFpHZ0CzTtVaGsY=
X-Google-Smtp-Source: AGHT+IHjBstjuzxQsJVLkeGYHgOE3wWdKaHmumAPQvcdN50PYZzwBsMeGzXzhJUjnQCkGBQZZA30xg==
X-Received: by 2002:a05:6402:274e:b0:61a:927b:a79c with SMTP id 4fb4d7f45d1cf-61c1b703ddfmr2766014a12.8.1755967850448;
        Sat, 23 Aug 2025 09:50:50 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61c312c4cdesm1797880a12.23.2025.08.23.09.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 09:50:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Paul Cercueil <paul@crapouillou.net>, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Jacky Huang <ychuang3@nuvoton.com>, 
 Shan-Chun Hung <schung@nuvoton.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>, 
 Steen Hegelund <Steen.Hegelund@microchip.com>, 
 Daniel Machon <daniel.machon@microchip.com>, UNGLinuxDriver@microchip.com, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Michal Simek <michal.simek@amd.com>, Maxime Ripard <mripard@kernel.org>, 
 =?utf-8?q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
 Manivannan Sadhasivam <mani@kernel.org>, Sven Peter <sven@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Max Filippov <jcmvbkbc@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
 Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Andrea della Porta <andrea.porta@suse.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Qin Jian <qinjian@cqplus1.com>, Viresh Kumar <vireshk@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Alex Helms <alexander.helms.jy@renesas.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Liviu Dudau <liviu.dudau@arm.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, 
 Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 sophgo@lists.linux.dev, linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, patches@opensource.cirrus.com, 
 linux-actions@lists.infradead.org, asahi@lists.linux.dev, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev
In-Reply-To: <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
References: <20250811-clk-for-stephen-round-rate-v1-0-b3bf97b038dc@redhat.com>
 <20250811-clk-for-stephen-round-rate-v1-99-b3bf97b038dc@redhat.com>
Subject: Re: (subset) [PATCH 099/114] clk: samsung: pll: convert from
 round_rate() to determine_rate()
Message-Id: <175596784601.52468.3851559862193091574.b4-ty@linaro.org>
Date: Sat, 23 Aug 2025 18:50:46 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Mon, 11 Aug 2025 11:19:31 -0400, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> 

Applied, thanks!

[099/114] clk: samsung: pll: convert from round_rate() to determine_rate()
          https://git.kernel.org/krzk/linux/c/e278e39b014d789fb670695d422ff33c3ef56040

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

