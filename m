Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 710A319E810
	for <imx@lists.linux.dev>; Tue, 18 Jun 2024 11:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718709127; cv=none; b=WC0yInXEIwx1yfmvtYAixjQvUwe3ZpzDFsijVSfXo04hbpatdCbSrLsSvle80YLFP30TrKsoZSOFRcKGqSBcFzIMUWrO+QTqIdDU293ke8oIMawZslu+IQLtHWn0Td0mj9guvnPcTWCO3wZTZqJ2Zvv2FVA0GIyyWENscYmlrJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718709127; c=relaxed/simple;
	bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Dm83o4Gidgc5XkpexC1u2oJ+/kD059SjmEdJVvlA2kK4wtJrwL/ZsRydJRjxDvBWL415aGdIwxf7UNCuaBUzJVP9laiNWUBIKhb8iVEvBOIGFOpberROw8FPdi8uUnke+za8LtGXRn6jMpoeFlTnqdQIeiTpRxkWmS6H7PPKAx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pFwgM5Bb; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pFwgM5Bb"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so55369321fa.3
        for <imx@lists.linux.dev>; Tue, 18 Jun 2024 04:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718709124; x=1719313924; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=pFwgM5Bbn+tzVVM+PmZDPxypfXmTsvvp35oRcNID7Y/1cUXoQ6nyuDnEnESMvdzGVE
         SsiiGbGcviXiMFfRTST+mJFX1MseUQOwXTE3u3QhwM+gPwYeEEWCysekC2jB4b0QN4F1
         +6Blj6MELN2O3qvbR0HNqtWvm90TXgRCLZkg0PwLfTYHN1jfUe0uwvImUT8V21hniWY4
         XLr+5yrglJxBxpL7Eb5TTFo2NESEkkVOkPNGWCnDu3e1S5Rlfd3+heOE36X8iRHfocgO
         uZm7GTrGjmej8rZ9jUrquRgmjls9wV/iLolNiv4aNtAPbSAuthoJ2L7M5zOoJ/g16m92
         WQvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718709124; x=1719313924;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QG/iPLr/BAQwM9/XiN9cLBGNZu40KP9nRuNjYsIk9yg=;
        b=qHrvGxXGTILiiWx+zxaEW5OVm+wJNIEqomMf/8GXoxhvJNF+mllbQASYRC+K3nfnmp
         ERfR/WJKyqGBa9iBlrc++WejRXnscNRjfEJkuMfEsTlqvEd8107aY6bi34MezUQjsErJ
         83zyZs63bg+Y0GsOwXnVI5zxVeknuRcBOfD2v2BO1gz5CnAHfSTeR9Nl7B0NUWL2ecOH
         faimZ++sU5M1atsOljgL3D01crSx9kX/dawNKMZc0GNogSDs4h/ofiPIbxW6A31r8xDL
         FNgU0pQCIp5/cek8XpZkoda0DoXrudDo1wx6FXJmeLy/JY+gDjfEA9HV+MgjI7cSZI/3
         3YUA==
X-Forwarded-Encrypted: i=1; AJvYcCV0njY5RZxQv6VgG0XEuX01Hytq329odMhj1pDXZSaUVwJleNkR1p/n3xEQJLoKQMvugEqKO16806D2pI7Z2zsxrAuR
X-Gm-Message-State: AOJu0YwCACf28MX4JsF2FGKGEHxGjjV05cuEhQVrCzH46rhTtRZUGJYM
	QlGvgL5Oqm+ovPRch7hXE/5uyeFBj+ib3mDY8MynMQjLaynSkyjErzlbq+G2/IAzSjDF8wE+fIM
	J79juJAoRCS+KiqKprbfBiigZEG492sKpSsqDaQ==
X-Google-Smtp-Source: AGHT+IHXkf3ljqAhrm9EuvRTPL71FiQZJIgLs0Bh9F/FREvRGl6HEr1C7BhvQe/yk1MwI0e0CuEwwH242Rm+FHCeyyY=
X-Received: by 2002:a05:6512:45c:b0:52c:8289:e890 with SMTP id
 2adb3069b0e04-52ca6e55c92mr8109856e87.4.1718709123676; Tue, 18 Jun 2024
 04:12:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240617-review-v3-0-88d1338c4cca@baylibre.com> <20240617-review-v3-33-88d1338c4cca@baylibre.com>
In-Reply-To: <20240617-review-v3-33-88d1338c4cca@baylibre.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 18 Jun 2024 13:11:52 +0200
Message-ID: <CACRpkdZjPrG4kUBxc+r7NzUt9UZSdiF7KWT6AWAd+vpuLSWk1w@mail.gmail.com>
Subject: Re: [PATCH v3 33/41] iio: magnetometer: ak8974: make use of regmap_set_bits()
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

On Mon, Jun 17, 2024 at 3:50=E2=80=AFPM Trevor Gamblin <tgamblin@baylibre.c=
om> wrote:

> Instead of using regmap_update_bits() and passing the mask twice, use
> regmap_set_bits().
>
> Suggested-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com>
> Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
