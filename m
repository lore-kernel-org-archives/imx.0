Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E23EE22578A
	for <imx@lists.linux.dev>; Mon,  7 Apr 2025 07:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744012451; cv=none; b=EkGFI7kaF395fmTgZyCFjMqyLYqtxbepvXXY/rzb/qBwQU1EZUvIvEIDPxOjFgHYm5/WfMyGuVH/u5gWAOw9kUKxSggcQTvrc+kvpGNq4EXgfX+WR2mq9F6a55kFUBWYBhADLlOi20unEL/xFtd9JSqOlwS5+HBBjvuhDlTFwEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744012451; c=relaxed/simple;
	bh=CIvTP/MtFKlZ44qkNUVxMOzv+BaCzXjhTrSxyHWhQJg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dap48EjCkodjGwL5N3t7sfzdUHzOuF3qj2MfBQkdQKvEgcPWYTos8eWEqj4RzvchSpGBLDmoyffAUklA2+M+H9aVDKU5uKqZE7oL8/DbG+7HSKxztq2TdZZjfbH2LmjaZ2zhKds5HIqfB7ZXTtQFoumKmokvwUF7GNSfIw8ofn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=HN9V9B26; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="HN9V9B26"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c31e4c3e5so2428817f8f.0
        for <imx@lists.linux.dev>; Mon, 07 Apr 2025 00:54:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744012448; x=1744617248; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=HN9V9B26F5uf+U7SyF/2Gi5XfPsF5FZofxqxsZvwVima7YKrBfCpj3iOjC2AjFql78
         WUhfYCdNVYTMzugU5a5jbHZ4lgwyG859gCDdu6rJa3OmEyH+QxluiR1lRxafHIrgyn62
         dpQQn2RIuFBpkpbYdvuuCTqHbm/kU6gWJC1OXpDYDoK+AQCMgrqm/aijllzexmPH5gsI
         02FcOP7II6VrNRDBmXjEY7/x9WKyAPNFfymVlbxiOwIj6V2UPxIMWjSKekjJ1qJ+E9Dl
         OVRe30BV8wO/+spHpwY/Irp556Wp/Iu9QXlNsb3v8No6MiianUQg16P7DzBwI7yT9C5J
         TwFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744012448; x=1744617248;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hWxLTEfGg4dc1Gy9lnOUuyFlka68Uiuevn5CcOM/QrM=;
        b=wJRlzcEJmQDt8bz6f54GyD++lOKkMnzBAe9DOedblzBbUifblIKuIVCIQmuS2B1lzM
         BCODROcf5sNrCzP4/Zie+JxhQ5faCeFlhTQdVOu9upEXKbh3Ew4CBBfNxR4zJidWMKhZ
         cfLcC76Sl1kZdUNosQNdIMm9/AT0tCeNK789SzactSpTPvqLT+aIwe546rjQduZoojUX
         k4uE3bK/JOnsSYkxuZ1KiZ/Nn5LbzyD5MrlukNOWq/gPUwLp8kFCtbpkAwX63gbBDiBL
         +fdtAzoBQ7DJdjzcgW2eyvS85T/+KXwOjH4sFBqQLEqn5oXcKrAANKYD3col4+xnALAM
         i+Ug==
X-Forwarded-Encrypted: i=1; AJvYcCVDMrTqL9Gf7gufvN7WoZspcJ3v3kwj+EXvKTHS8aDh7V27+5DPxtwF7VT9rmUUIixe/OY=@lists.linux.dev
X-Gm-Message-State: AOJu0YwpXmLkSGGh5Ay71OKCkg+iq2g1BK38GaiYz7wH0/I2+0riDFr5
	5i9QpEPRMueSXw7UAGJlZGBNi1Je6+jFKjXSf8pizf5MU0xTZBGIzmGzw8/d/Eo=
X-Gm-Gg: ASbGncusSVE3/OPxYNn5gBnABCJGuMWzYqeUZ7cteBADQocKKNupsgS5ceUbXkN4Fca
	ygpbo4rhG62a+Y2nV7ji0/CC6dAjXfcb2kJSo614F+QHZ1Q1dVN48XbACXd7dlOwxUhOJSwiMEi
	DkZYm0o89VL2hxqr7T5hAKYboWvq4u1mKWoiGihB00ClVBy60VUouT9Zt3nCl51Fnx8XVqX55WZ
	0X+/EfdDEWFskhw1dMm6KynydYRmVbKojJGXx7sc2DaGtHnwD7eLh5YEvAaR4NULWkmJ7DC+Lzk
	IthvNJf3lsorQuJxklFlbNKne+imrOCs0RNUVMWOCKCT
X-Google-Smtp-Source: AGHT+IHuTVRTtHbtmx6FjkvlzIbJVnydF8KMECgaQSarUJ94LjdvsgdrKIpoRqGzKFTua17ynl8uDg==
X-Received: by 2002:a5d:5983:0:b0:399:6dc0:f15b with SMTP id ffacd0b85a97d-39cba93cd69mr8684049f8f.48.1744012448217;
        Mon, 07 Apr 2025 00:54:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a9bcfsm11494514f8f.33.2025.04.07.00.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:54:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Manikandan Muralidharan <manikandan.m@microchip.com>,
	Maxime Ripard <mripard@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Sander Vanheule <sander@svanheule.net>,
	Bert Vermeulen <bert@biot.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS example
Date: Mon,  7 Apr 2025 09:54:05 +0200
Message-ID: <174401244312.28249.6012698269615129555.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Mar 2025 13:53:26 +0100, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.  While re-indenting, drop
> unused labels.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Correct indentation and style in DTS example
      commit: f4271a891dca46ecf6813273ed63e502862f45da

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
