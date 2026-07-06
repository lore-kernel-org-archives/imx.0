Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D84031A053
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 08:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783325281; cv=none; b=gPKyP6+VzHtvSZV+HaxpjRd2SPgNTfJGpexJ5MGZivj/Bg60WZ0+3XDK405oaWGnqM9ZuKEEJkbLLDv+xj5FeyC8iu0OYHkt9COG+24OgjfAHoi0iLPInTvMalj6vcaj6nKwXDK0KsgBzypD1J1X9qL/MBqZvye35ytPpACvv1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783325281; c=relaxed/simple;
	bh=6FRXXocn1lfRgJnxiPkpYYSBB5w4wnBEBhNnIuipX2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ojfu07E25o/sztyBXmpZX6DsdPVndhf9nClHZfYsluYOhggsQClClr737O4d5rqYjMdLBgdCCdNgQeDanpcOz5Jj9xSGM1s+nvSO49xyGkXGodHzjSmK7h9pt7vW1ADD7zx7TPRyLGPiPsOQCBCN05TM5LG7NvTi4vTwZ4mFLlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so2027090e0c.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 01:07:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783325274; x=1783930074;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xlcdnSGCAGaaD3Qtz41jPpd7wkV1TEYjW94sOKYd3zY=;
        b=QJz+Jq/5Bg9K5UXiuvBCxLvsxOEeB061JIcnREPB8qzYTtDzkxGs94vrgewyyYY+Dg
         INNFy7cvdkuNf1AdEDwqjUIYPQZ/jIoDgEDKE1/0StPRzDkkQ9lymVvpkvqkGshERzs/
         zGSEBfSYXFqnfIef7oBN2TNC2KxyXb6FObfRI4wCJxySkn/IVILd7KXBxzgqwZFyHMLy
         rxR16l+MnSRAGsx9LfrOIL6W7RBy94ngE66GTHlmUGORjpC9wR3RD7vd20kYss/DtLpk
         +vkqm2EZ3rfHnuAU7HvvreX2caPQ39Hbe5GELhtxl7ZK8vZUtR1mYVlKJ5aWzuNEWJ0S
         f+xA==
X-Forwarded-Encrypted: i=1; AHgh+RphiseZLBRbpP0FfcagcN2G+F54EQBCofJRTPrw5mMDEOn/6rtwrCICnW9xEoosii9/XJM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyc4zuZ5ceGMLVxatErfG6lMGCKV5nYmmJbQjKyLAt2wG6HdnTy
	j9/VOiFrDEtEFAst6bcXMu8JPSIYfPC/IB4N3G3y5xrPLRjBxzQUnko1kvx2ZX5p
X-Gm-Gg: AfdE7ckNSgaWq5M8PAWT3TdAZgD1PN6sO4GT8sYz8ZsWIAlsPnp8p5DeOA9Y7SUyWlg
	c24Do/4Zb/0rZ2kwfgybnZmp1gHza5yiQdZNZBLhDQG+/8KWyGRv745JNwV51GYAqtOxPo4QQUj
	w0RQXX95nGeYnwx5OWsQkGgfTjMQM3SBr8lUynyK24Y//dnowpO8XdzYd/3p20I6ryT6/BgPoht
	n3fY73SysMtyoyajspesbbU2Vla9SjBQmsW8eGJZNJ27jsoXHv+oBo+zEopRzOTMuQ8pefN9qiF
	zkJPS7TAHd8VohILER+xoCc9ioDE7cT+QMiQSwgO9gFYAOxI3Pud23mvQlVFQv5ASZq0NUxHpmi
	W4eukYAPAaiaO4zcvmndE2H8zQm9v3WoQEX8IyV0oucuuA4iSTzRqLzLoLPYEIiGVJRngLFfAaU
	eRVYCKVgW0Rnls8IKk2ZshBu5XecjUgSU/36pR6DNJ1w08GQNNnewtGA==
X-Received: by 2002:a05:6102:5785:b0:739:77a7:90bc with SMTP id ada2fe7eead31-7427f46099cmr2948351137.23.1783325272402;
        Mon, 06 Jul 2026 01:07:52 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com. [209.85.221.171])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-96983a0b1efsm4849852241.12.2026.07.06.01.07.52
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 01:07:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-5bdb162ee53so2027061e0c.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 01:07:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqV6uTVG94pmlpOe8Pv9VIZUctKy4bVDM4zA5BlSHKjaZvruYL/endSJIecMU3PnNJE6jY=@lists.linux.dev
X-Received: by 2002:a05:6102:800d:b0:722:826e:1423 with SMTP id
 ada2fe7eead31-7427f0478a0mr3286706137.20.1783324855096; Mon, 06 Jul 2026
 01:00:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1783263835.git.ukleinek@kernel.org> <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
In-Reply-To: <20de6cd60c2938aad2d21397b92742849418ab1b.1783263835.git.ukleinek@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Jul 2026 10:00:43 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
X-Gm-Features: AVVi8CfQACxAMot5VlqKHI6FXvkOZpEWhTZp1dlkgWSruFHOk1f-I-dS5kVo31s
Message-ID: <CAMuHMdXKyFJ20N6qKafvMZ_0sVj5+XTxcod_6wGkwTsokn7dvw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] pwm: Unify coding style of of_device_id arrays
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
	Neal Gompa <neal@gompa.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
	Vladimir Zapolskiy <vz@mleia.com>, Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel.holland@sifive.com>, 
	Michael Walle <mwalle@kernel.org>, Chen Wang <chen.wang@linux.dev>, 
	Inochi Amaoto <inochiama@gmail.com>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Hammer Hsieh <hammerh0314@gmail.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Alexey Charkov <alchark@gmail.com>, 
	Sean Anderson <sean.anderson@linux.dev>, Michal Simek <michal.simek@amd.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, 
	imx@lists.linux.dev, linux-mips@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 5 Jul 2026 at 17:14, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>  - Use a single space in a of_device_id array terminator; A single space
>    after the opening { and before the closing } in non-empty
>    initializers;
>  - No comma after an array terminator;
>  - Also no trailing comma after a named initializer iff the
>    closing } is on the same line;
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

>  drivers/pwm/pwm-rcar.c            |  4 ++--
>  drivers/pwm/pwm-renesas-tpu.c     | 10 +++++-----
>  drivers/pwm/pwm-rzg2l-gpt.c       |  2 +-

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be> # renesas

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
