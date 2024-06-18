Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C671F19F467
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 11:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709160; cv=none; b=WR1rZQDwCVQd3eEZSXinvcMJ+XK30l+68AuaYmk+OuKfDnGJEROIqV9/3XZr1M7+Jv9azxt1trU33GrpiEXtv6OXV3SOSrGfaTKdthBWP509L3JNsCTUhGkTRw32LhUXufXsFbqJxuADh2IglJa1ckTuTUtGOGM2bj66XIycbEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709160; c=relaxed/simple;
	bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B18YgHvIsWh0XZ5VWByC6tELQWElJQ1gnUBiXKuVSGYrl+CYl6DLcUPJNGiuJ7lRBAk/WsaLkHwFl5yJ9FyLSPfVztoKuu8QAQqsj+xs9eHYBH2ww5Wp7QTEOYvm6DQplqNctmoNKid/WWkJ3zA92xrY8bdZm7NXaYs9HFnonrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tJtGY/Da; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tJtGY/Da"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52c85a7f834so6816750e87.0
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 04:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709157; x=1719313957; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=tJtGY/Dax/yHQRSFXQcDd6mlHCMhqHcb9+xLtMXYmeWnZlWmWgDQf0m2qF3iu72HaS
         Uja+INmTFt0Z79J/2VGDyNsRWAZklOnfgUSKsoRo/lzoLqlePbY7BTZkPuX8QMSfKt2B
         hQamI0yEpy8nb2RwoV4CEZ8MiLffmDesDRuW854oz9TCCySfz6uW+7Bt07ms2HSttvwG
         C05yEHRgoRUnFK1yivEbAtCF7n3Uro1Ao6CSaeouHnpjCVFe6e1OwVYMaZ8PgTbnDwkY
         iExjlWvmwsG3JwTXivVYJKxWwuyCGJ4ntFOv+EBUiGsNYBrRB/R9CtWSk/EhnW8rF/LY
         JWng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709157; x=1719313957;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LytFF4Umh3FGe2BHoZB/hPX8STy/rMVhd/DWw4ViV9Q=;
        b=NRXW6fxtUWiHWHTHZ2YA3UOsfEaqYuTVdWqugOKrbnNHT2zy/VPe9kd1ReDrOfuqtO
         MQ82WzpxyAYFUP7vTPbKM/5ai3doBAf/2dVGK1FABlQZHDYjBcKeAXXZIe0cMBBULV4n
         mowmZd6u6iqFCj2D5nbmybcnpPpn++mFHHwDYpyGsocTyc22wuRGZYBDqbRCQbejRcWS
         j5mTfv9evFX51xcVNMcku/1VIfSUJOrcnrYAxCUZF7UjD2K3EW0RIfh54vXLjSIP/7AK
         nAQdK5Nj9i3SzOPZmR1/VzK9Mn2rL1naXfInNkTZWA2oM9kVnMAoeI6iP5z8yklmfCRT
         WQ6w==
X-Forwarded-Encrypted: i=1; AJvYcCXqhBGzt9rWSKX5zXqDMnreALmP4ACZ9zsqgvzE1OxDLnj7vUUFImiYlzmDQfmZhDuqoKjOHGejhRng1s2Gzhc1SBig
X-Gm-Message-State: AOJu0Ywkj/AzrWfBgKgKt6ah6JguKlxJHr/iHdhDmCnqDj9vkeRN4AGz
	YRox3j3yZep3NgnlwCJ+4CrRndLYRHrqMkqW+VVdy/rWioVnIax9JJBW7/fbEAKyy99spfsPuoP
	TYXgTKcGCIgKfp+RADRIQeftnLfPAp/AN551DEw==
X-Google-Smtp-Source: AGHT+IFCeIOoRy25rTwUHZ/n6vBdkCPzCkJ8a//pB4Qa6c+3jDe2XeC/62v2ldwWc8Yh5JI+ho23V5WmsKqsRfZrbxc=
X-Received: by 2002:ac2:5307:0:b0:52c:998a:77ba with SMTP id
 2adb3069b0e04-52ca6e6e5f2mr6662065e87.36.1718709157060; Tue, 18 Jun 2024
 04:12:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-35-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-35-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:12:26 +0200
Message-ID: <CACRpkdYchu+muvbinPpUFvppMMQCFe9zTcApj46ip4PYUGUhVg@mail.gmail.com>
Subject: Re: [PATCH v3 35/41] iio: pressure: bmp280-core: make use of regmap_clear_bits()
To: Trevor Gamblin <tgamblin@baylibre.com>
Cc: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
	Dmitry Rokosov <ddrokosov@sberdevices.ru>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Cosmin Tanislav <cosmin.tanislav@analog.com>, Chen-Yu Tsai <wens@csie.org>, 
	Hans de Goede <hdegoede@redhat.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Saravanan Sekar <sravanhome@gmail.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Jean-Baptiste Maneyrol <jmaneyrol@invensense.com>, Crt Mori <cmo@melexis.com>, linux-iio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 3:51=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing val =3D 0, use
> regmap_clear_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
