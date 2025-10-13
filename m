Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C7E30CDB6
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 16:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760371428; cv=none; b=nRZiTr3A+xfLiGQspCARtVEckRgTG695n934DHM2A20E6Ll6vWw5vH5uxn+SHfdXTCFRQMuvVVBJR/ZqrHDVESeB67nK7OrUx+99wpAEdAzhIs8z+ubshPuZpVfSQUtaejFqxuDyc9W6mWmu097fR6sHoJ6I5LHGrA2dYBLha9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760371428; c=relaxed/simple;
	bh=7pmScWeJxb/SA9LfgnIE+RSHfO7kt+ZDsVcv07zsRtU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I1CGHCvoRDg0Gt37pKzbHpT8hNUYYgQ+tG/7LA53DRV907e3gdaPgpbDPUFAeC9iYPeeTn+HOImd9l2bDNwIW7ETkhPRnKtJSjrOeet5aXYkQJxExE8LsOKpN4eGnB9KCrLXeklCHawvxRWwaaTJhx4jeAF5EynkUc5HcxTCDDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=O12KqeHD; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="O12KqeHD"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b4aed12cea3so698096666b.1
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 09:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760371424; x=1760976224; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=O12KqeHDeTqJe0Lkml9YfeliwEbfDY9ulhdfFN3UeUgsaU58OI1A7C+WfbeXF9N+Pg
         Q11F6wrZiBOHmLdpSgBVRtYljdlzBKoDWyOrTGnMWzxlbkNf8rEnzCkPBAMHoTBytrhM
         AD5Viur9SAOi1bcAUi4DP+gTg6lsUi/oxq8NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760371424; x=1760976224;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=85zW8eAa0UUuhYK13qFSD0pz0Cqd0sUrz3cG+0d4BSc=;
        b=dFafErWStTiZ/+PzmUyDhctM4k+EkkrLp3zC1Spoclw7LEZMzd/80+YOtmJ2iXyD74
         LdGMEkstulTY6Bqm7gZH7SmHXStqMVEuYI4SWOYXZe11j0menRuaBG5W6FuaPMHYUpfp
         CFv+/XW++dYE81XXBKmd5SV4LKqgsWMqaidgpt/K624JuAt0UX5vG4x+SQDwOSTgOqyU
         6hpHfNAvc2dSGyb8o0swtfZOoVCN9uu73Ev6qxQXljT3GqmGxduC0ZLaDgqYmurmBW31
         KrfQZmJxelFYB0CF8LfGbXbr4XPFjwzWgo3POyokZV86tmxx5s8Sj4hJgnCBG6t7jIRH
         JL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCW98AdFOLiZjb38ZCsx4kunuIbpivs8RM6v3P0oqy1M1xbigzxoETy9qFhq+I2jEyrnrKw=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Z/H7ZwAhh3qeCIpm5L9uZCYgU5wRFvtI4jKvVo/VMKYM4GS4
	0pZKuVmUZuW7JV+09fGTkoNeTrN3cyFZoU3TE0Rl7yuNhLZBvD911gp1dA0GgRVuQJkgPo9Ztve
	HULpbaWix
X-Gm-Gg: ASbGncuxPtb1+Aixh6qtyN+A+p8bYjKZoTgOBz4LnI0Z6SX0sviCYwGZf/Nkkn30cv3
	3Ppj7sjTz4ay0zO6AgQH8AafSaAR7uWnvwAhvkxsNgz2XJSX8q1uhbM+rjxDj0GomtDrcB5JLBb
	XnquyyClMP4xePk8A5Wav2JOzQnfwJpvhvVNMFN3cSkBEjPArMfBUK5wbw2MeFxApfiGVTOJfLu
	8sqrYMPmHSKOZgHw2Ut4FGvzDMvQXfGN9EMac59AXLmsV/0ZcMvNm0FbrCwIvp0ctVNZd+0iViq
	o/DYMgZQ8MyC268TTDm5u51qWmzU5SW//+0Pe0t4xKtu8mx1C44OwXIvjyzexxaWzHgZwFrCTg5
	lpwha5jBDmi6C23o2y0/JIU2H8xG626j196aUamokDeiuCAzfGiJderm3yrH5cZyeSaFx1kNs00
	/uMpqp2dM8JRj10g==
X-Google-Smtp-Source: AGHT+IFLmoqoWVG3g8cHD22urwUKqkeiUOmUKcbTwqz/E1cV3wR5FH9uZUEh28mz5dQxG1+VmCaXxg==
X-Received: by 2002:a17:907:3c91:b0:b4a:ed12:ce51 with SMTP id a640c23a62f3a-b50aa8a926amr2299008866b.23.1760371424486;
        Mon, 13 Oct 2025 09:03:44 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63b616d12fesm8553887a12.24.2025.10.13.09.03.44
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:03:44 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b40f11a1027so785642566b.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 09:03:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW0FszpzJt7Mv7UHai5Np6qQfNjH8yeO0Lur3GZexHKXv6xd4nAkZA6GD2CGSAEYx4diK4=@lists.linux.dev
X-Received: by 2002:ac2:4c50:0:b0:55f:4ac2:a58c with SMTP id
 2adb3069b0e04-5906dc0ff30mr6173104e87.22.1760370964286; Mon, 13 Oct 2025
 08:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-10-2c5efbd82952@chromium.org> <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
In-Reply-To: <176036780330.559803.287308146210017676@ping.linuxembedded.co.uk>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:55:51 +0200
X-Gmail-Original-Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
X-Gm-Features: AS18NWCmgLaH0rMvCIhheSPVtWPGKkpbEBd_aB_kzUyM4RaB_yHSiy8sRs-muw0
Message-ID: <CANiDSCsuPkdz0=U2b_mNh4TWTNztAd9qEwJaiMRdGy1sf3UEbA@mail.gmail.com>
Subject: Re: [PATCH 10/32] media: i2c: imx335: Use %pe format specifier
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Bingbu Cao <bingbu.cao@intel.com>, 
	Dafna Hirschfeld <dafna@fastmail.com>, Daniel Scally <djrscally@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Fabio Estevam <festevam@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Jacopo Mondi <jacopo@jmondi.org>, Julien Massot <julien.massot@collabora.com>, 
	=?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Krzysztof Kozlowski <krzk@kernel.org>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Purism Kernel Team <kernel@puri.sm>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Tianshu Qiu <tian.shu.qiu@intel.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Yong Zhi <yong.zhi@intel.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Kieran

On Mon, 13 Oct 2025 at 17:03, Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
>
> Quoting Ricardo Ribalda (2025-10-13 15:14:50)
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR().
> >
> > This patch fixes this cocci report:
> > ./i2c/imx335.c:1013:3-10: WARNING: Consider using %pe to print PTR_ERR()
>
> Ohhh nice. Is this new ? First I've come across it.

It is actually from 2019:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=57f5677e535ba24b8926a7125be2ef8d7f09323c

I just learned about it because there is a new check in coccinelle :).

It is pretty cool, but you need to be careful to check IS_ERR(ptr)
before doing the printk, otherwise %pe will print the pointer value.

Regards!

>
>
>
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/media/i2c/imx335.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/imx335.c b/drivers/media/i2c/imx335.c
> > index c043df2f15fb25b3a56422092f99a1fd9a508fa9..71ed9a0d84a252ee362621c4d38001508fb86d28 100644
> > --- a/drivers/media/i2c/imx335.c
> > +++ b/drivers/media/i2c/imx335.c
> > @@ -1009,8 +1009,8 @@ static int imx335_parse_hw_config(struct imx335 *imx335)
> >         imx335->reset_gpio = devm_gpiod_get_optional(imx335->dev, "reset",
> >                                                      GPIOD_OUT_HIGH);
> >         if (IS_ERR(imx335->reset_gpio)) {
> > -               dev_err(imx335->dev, "failed to get reset gpio %ld\n",
> > -                       PTR_ERR(imx335->reset_gpio));
> > +               dev_err(imx335->dev, "failed to get reset gpio %pe\n",
> > +                       imx335->reset_gpio);
>
> Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
>
> >                 return PTR_ERR(imx335->reset_gpio);
> >         }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
