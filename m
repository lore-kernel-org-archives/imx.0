Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24E578285
	for <imx@lists.linux.dev>; Tue,  2 Apr 2024 12:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712061332; cv=none; b=Vv23DT7trhwD1Wv44y64NqkWTu5WkgeDK2F7y0jTwH5TJikOv6TCfdvRpiYmkIYT4f5IcJXheAPy0Rw+ZZDl8OE9sDC39LsJhV2zdmlDexfmqS73eyHEmOj+5pqCmUWEr4kBq43usVYTBjnBilpZr0uAM4sO4cqURyZGDPx5B20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712061332; c=relaxed/simple;
	bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KJtwfRmV2XPwxHIz50QbIN5lK/896VNjQH8aJWCEpYRYcfYG1Ca9ArJEGNYhTJXJmDf4UiykOaaZXh3cQhpzHVOPOwjVSFoIoLLECqR4NIxFqtCwzxFHaY/LNhaxIZxUrssU1gyKAbjnruWu2Cb4XqeayeWHQc5vJ8swhThkHFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLukDMSj; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLukDMSj"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-615019cd427so11884107b3.3
        for <imx@lists.linux.dev>; Tue, 02 Apr 2024 05:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061329; x=1712666129; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=mLukDMSjAbksujDy4RdTTaLIq9MulL8NyGN281gkbz2bHyONqySwvNYzIooDjTk/Wr
         6sdsmcHvwcS0mAjhFamOqiHlEFSCX+S+07XdgOK9IbhsA9LIgiUujywcf8xkngbJTHE/
         0+3oOXJH9CKtwSWcPqoimDeTa/jlYvQMbKYUW2Fv0BxPGU2fcBvgZUoJW/WT7zaHZmpl
         Bkuy/ehLaw7edRAh7TV+64tFEDhfBDEPyoC+tbvjfzAmty+duMmi4wGw7ktir4ju+ISz
         gTKUSoB+uZufxEPiB9167oHgjXk9XFP7PpORjcSXECK54Q8Q1wSlrvyRlyjXWGUhqBwm
         wIlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061329; x=1712666129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZhodAsfbqQph/6Oss9KdocUA4jNT8v1VGBe4Vmslbbg=;
        b=h8/JM/Aa7ivBEn0zk806WpRElmEk/dOvJssqohi+vA9Wb9BavN57J2SWB0vURZmgf3
         xQVwjaMikF+KjgPrzge17uLFxJcms/PBxXp1ZrwOuomVxTEyO2jq+AFNSdbi/qUi5K+k
         s6J/rtbFWl9Hzu6rdWfjnXwNeJweEmTezX6wVC3CqlxZXpd7dnSxGhRtw/hB2m61a6br
         IROiHqHjKTu6FYE/6eM8dkfBqUNYeAVI4w/WN96foE3n8pYEA1rDhZ4OcLVHTxZ2iWip
         QZcAdUq5UxoOLHydWMEe0tlG7Ptxpa1hP4JAzOUyLYELK7qLyG97vHjGOw/tDe93CrNg
         Hwsw==
X-Forwarded-Encrypted: i=1; AJvYcCVhhiRq4fLbMFbcKoQK2eavcxR3u5nmcTKIj39Hn+gCzlEcAMwX/QsmtYn3921oyBihXvRncZXn9kSfYZ/xxblmuYvC
X-Gm-Message-State: AOJu0YzVXWgvgCtrdi1NAkTnSDIKrOEDY0mrHtcl/1sdUEZyJuNM721a
	AwUHACVFN2B4tCG0AeqBFQkvFSa2XFkXkAzdmEej4Oas7MO3tnIFJJN2mi0j95cql6bqZwMug3C
	11pROP0EAQuaDq9YrkcMK1YZg1uf44nmOoRVWVA==
X-Google-Smtp-Source: AGHT+IG5hxT/EMYnHoU6u7S6MkbvLw5l9U/Ss0P2rks8Fb0m+zQTGqjqkjSlSz0lY1KsLwpjx1moujtIXAN3uBffPV8=
X-Received: by 2002:a25:6d86:0:b0:dc2:2d75:5fde with SMTP id
 i128-20020a256d86000000b00dc22d755fdemr10687728ybc.29.1712061328813; Tue, 02
 Apr 2024 05:35:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com> <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:35:17 +0200
Message-ID: <CACRpkdbtRoDtWN4mnyZY_yEfWQFPCQaVudjBki8N1sOXxXWupQ@mail.gmail.com>
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, 
	Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Krzysztof Adamski <krzysztof.adamski@nokia.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, Jan Dabros <jsd@semihalf.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jean-Marie Verdun <verdun@hpe.com>, Nick Hawkins <nick.hawkins@hpe.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Oleksij Rempel <o.rempel@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Ajay Gupta <ajayg@nvidia.com>, Peter Korsgaard <peter@korsgaard.com>, Andrew Lunn <andrew@lunn.ch>, 
	Robert Richter <rric@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Hector Martin <marcan@marcan.st>, 
	Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Vladimir Zapolskiy <vz@mleia.com>, Loic Poulain <loic.poulain@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Laxman Dewangan <ldewangan@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
	Conghui Chen <conghui.chen@intel.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, imx@lists.linux.dev, 
	linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org, 
	linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org, virtualization@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 22, 2024 at 2:27=E2=80=AFPM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:

> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
