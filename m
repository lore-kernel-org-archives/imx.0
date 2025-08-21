Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADBDB2F363C
	for <imx@lists.linux.dev>; Thu, 21 Aug 2025 20:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755808325; cv=none; b=eCzhpiR80hOY9ZoLCgmjTz5fLfRS/k88b9IfRP6UO3hCooBaosRnl3Dp8JHz72o+T7SHyAZFhPKazT8hSQ33UqXH9/N/Js0zoyJOteYr6hKCInEqfhB1dO9xgkwmvwCtIlZrk5AMuqRPFopWXgYcY1UL/2u+rK9KaVcXsibN9M0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755808325; c=relaxed/simple;
	bh=koAxHIBSFF6bH48Q0RNFABzF3yhUiviXXzFvJ0pZf/Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHL5MfS78Uf8ty4T8zPt0YR366864H8cuP0m3W2wSf1WFQQc+f9MqhxKw4Q81eOaVIULn7h50z/CuXI1MjT8qGfJ9XXSaDDhFJCjAAhmc5eMwDd0Eu/4UaW3LjK67zPKF62c3wu39RPWnCDeTPuu0QrRWghenpMoHCnAjzEZDBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=Zxj9LpSy; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="Zxj9LpSy"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-76e2e88c6a6so1350614b3a.1
        for <imx@lists.linux.dev>; Thu, 21 Aug 2025 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1755808323; x=1756413123; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xzt1SP3iQ6Mi6cPK5jzb7ybF2HUvqkuc1RDuKVXJJow=;
        b=Zxj9LpSy4HE5icH8idTCzCwLAKrtXaa/rznLsgGROvgx3H4RG1UQx2scMFlQmRvxKu
         gec1ALIAnhcboHxR5hwV/fycBUE76BD4UprScYMJZhiUbmTx3HwdPOWvmfoNdUnX1mWL
         klTNQcqy5IDvFosRwy2nc7J5Yr6i2cwSQ0kNMvXfJA1uTEa1jhW7r+2rSVfZrO3aSuIb
         y7UE1jOmLTs25ozI/Zv5sksvpPKERgVKTRIW+ipk4FB/fFaGP8UWiMiyWbQk8bMToEQg
         IBhbRUp2t0GTrCeuRHgQloubm4Eqdfx4I6W2/rc2NuOIT++DVA748J8Cj+5h/OjedhGr
         7AGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755808323; x=1756413123;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzt1SP3iQ6Mi6cPK5jzb7ybF2HUvqkuc1RDuKVXJJow=;
        b=MYCTYAYtDpzkjTA2kfRI8qUcDfVaDMEdGXxgddQc+04F4zQoBGQQw2jfQVadgbV9Py
         ZTsUzysMO23Hdhwemo6vOQGQ7azBk7mnwOf51xw7FUdZfJpUL44XS4gPGPqWLF/8yk2g
         F25A8cW/UMaO1HaEtthokZnUsc4SlVhKCYXoEu/a8ZJwbHR3yHC3xLSmdO9ffDMOTjvy
         oZCbVm/J17m2eSIsD39ufvwhnvNS/I4GhrIh62WOku6YlfBWtXgho6spAge8Iv+6043r
         n6TKoCqTIJXVi3N+SbFratpi9I8cjKJH3JrF3G0xLdG3z9mX8/6h+qABOaIc6OomaKHq
         dnFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUD+15pEzXz8OE4VnBRKyhF9duQySdc1dst473o02QFIow14mwpt/+3j9HxbfN3hhhyMpI=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeyPtstlVvOVll4v5+BTqBgIrNJkln42cdnsCOvQIZOnBt+S+i
	eRnFW34PhNxgZQ2Na92uZ1B5ve5pEIYU+d+rbblAiODQgy1H0x7GBpNZeqz51KLA9xUWA6nDHFS
	8dpGuxiNqYHngveVqtL1WFTc8O9fpFoU=
X-Gm-Gg: ASbGncuNQcC3M7NSEe4yHlrKDg5QCzXhBifMMZQw6CsX9zjfwMO6q8dI96Tryx5thNb
	I2dNG70LY7sSAr3q4dYH7HVacinANQW7c9DtaAyBPhBTiO1ExT7NvG0Y3XTqGqN050R+TJ/hZZD
	jKNqe9I8kX+Q+YXvbO91IITO5PKdHlS39EoZ1s822wV6sE2qkIkL8xcDchtwcRT7VEzd0sznPXo
	XGq4KeOeC9TGPbVov2+5cD4cPypopdhZacWn9FO
X-Google-Smtp-Source: AGHT+IFMJWQfSak742OMRIUVPAmUKPCtjTTxsMGlopsj+ykj2AINC9Rf8YaWuAZsX0Tjk/DC56u1mBE4PhmXtNwtDIk=
X-Received: by 2002:a17:902:ce02:b0:23f:f68b:fa1d with SMTP id
 d9443c01a7336-2462ef4fd9dmr7514195ad.39.1755808322840; Thu, 21 Aug 2025
 13:32:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250821080723.525379-1-zhao.xichao@vivo.com> <20250821080723.525379-3-zhao.xichao@vivo.com>
In-Reply-To: <20250821080723.525379-3-zhao.xichao@vivo.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Thu, 21 Aug 2025 22:31:51 +0200
X-Gm-Features: Ac12FXxvviABKwS3Jk0G8ABxqYSzrQsOIcnTQmwdAPckvZYFYDz7726qKXLaDEA
Message-ID: <CAFBinCDDMo2Dm1UAoB4QKyf-KKoRUTNNg4i7Qh_vgZh71trMNg@mail.gmail.com>
Subject: Re: [PATCH 2/7] iio: adc: Remove dev_err_probe() if error is -ENOMEM
To: Xichao Zhao <zhao.xichao@vivo.com>
Cc: Andreas Klinger <ak@it-klinger.de>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Haibo Chen <haibo.chen@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Marius Cristea <marius.cristea@microchip.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Heiko Stuebner <heiko@sntech.de>, 
	Francesco Dolcini <francesco@dolcini.it>, 
	=?UTF-8?Q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>, 
	"open list:AVIA HX711 ANALOG DIGITAL CONVERTER IIO DRIVER" <linux-iio@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	"open list:NXP i.MX 7D/6SX/6UL/93 AND VF610 ADC DRIVER" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Amlogic Meson SoC support" <linux-amlogic@lists.infradead.org>, 
	"open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 21, 2025 at 10:07=E2=80=AFAM Xichao Zhao <zhao.xichao@vivo.com>=
 wrote:
>
> The dev_err_probe() doesn't do anything when error is '-ENOMEM'.
> Therefore, remove the useless call to dev_err_probe(), and just
> return the value instead.
>
> Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
> ---
>  drivers/iio/adc/hx711.c           | 2 +-
>  drivers/iio/adc/imx93_adc.c       | 3 +--
>  drivers/iio/adc/mcp3564.c         | 2 +-
>  drivers/iio/adc/meson_saradc.c    | 2 +-
For meson_saradc:
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
