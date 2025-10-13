Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65D183090D4
	for <imx@lists.linux.dev>; Mon, 13 Oct 2025 16:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760372015; cv=none; b=SeEm8j/KctzQvEFNQNss0SW70/sLT9EyyqMfSWlA3yiRLZ5xE3pQjNn+BL3HhfvTsWqOcvgrvQjSAkicoENpBj254+KY3pEcVMdbsRuMcM4DrspZdVz4rZCA1iQcCuejoS/jeuYlll+Wj+TJayFVRwn1C9z+3hAAI8iXbDljREs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760372015; c=relaxed/simple;
	bh=cAB0kIpqj20tM7yHpaFoe3xcfA2AB5cxFaYcvZmpAuc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MCiS84JNYk8n9GET12gpCN1YXsyG3HjitqLjsYtePoSqlsooaZyy6TeGunPCZOWS5ajUwDzmd4bsThLZOCkdg5qfQG8Jx8PFTBdK/TznEWwWMSGCLfysuvG/XdPd/xoPpJhWOMZ/n5iG3FfzgddnmtffUuXVFKnI35e1JiyTgwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cPJAYBsY; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cPJAYBsY"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb7ae31caso946604766b.3
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 09:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760372011; x=1760976811; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=cPJAYBsYnwQdu5JeKrTetpfJ8r2YKS4ZDAAbdFJy3dCeL+1Iiymy2PMn7vGQgkDA5Z
         VKmaP4oD+eXxq1zX7Y5kWiYQVyo/0TLSZPa/57gCc7qQni7nFZx4fm1E4zqT26kdhvEY
         u66idzkB60uD31F1ERESKh+yPoPckxME6akKk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760372011; x=1760976811;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LK0kBaNkf30iNo8Y7sNwo/F78yA794Ns47GaxpHfRwE=;
        b=ibWMJD7CEky3g+YUQZtW/Kt0f4i8YAaX6ew3gHiM2G9MYLrAsc1omWfwESK4f52Yrh
         2kR6gFKsOulcnEAXMGPvSCeNrkNr+Z8JCN7cGO/a8Z4I6uCKE46sZ1CbM5XYhk2MgQna
         LTn9QXylIoTBzyjzhiKuQm+epROBrZapV0kQ925N0uOBESDcp1V0mOTV8aD8MJwuzQI+
         31JQvlbYtfQM8zq4FI2wOMMRYQ7HSpANQz3h6tzg3J9iFvwYcXN1dauVAbhLPn4dhAnY
         I1pgfwrLG9r+Hthduj1KXua1I6tvIKqYQef5+arFs4aZZqw+KVgNiH+lW80nW66VVqIH
         z4oA==
X-Forwarded-Encrypted: i=1; AJvYcCXCZv0uTzF2zIbKj/dcroh4Bfx9RLIcu1gYwTvcTl97UmIYoZ23NOQQ1NV2OWldIFMR5wI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yziti8N7BqIUUz7qJKA0MEDL7OiKJoXrNg5alQ28T7/6HtbfVzu
	Rfi5mq1Jzl6vqiFHlVe+fyKHyT+kbV5YfuQN3QhJoKsQ/qt06XJ4+gIWZLcMwVLcKZqq3JFSzu8
	9r4cJUbpf
X-Gm-Gg: ASbGncvBhhWzJp2uk+noinh8Aenm28JgW7QOZsHl+Od3fXbO9WalZv6IxWmvf+zJDhP
	vYFaUabNfutp/5EYC2q0IQw4G2eZs4mnpD9tIszSqIAZ+WmHNXjonJF+pNCGuzU3Ao633AaIqeM
	+eIvKxqeLkKEFawDfFKT4XvoFG/9VR0znezNtBMzecUsQLFPkcvFZQPpPVB08CbAszp9jjQrmGX
	0U8OmRxm8wc5xwVnz65v+Y9JycGSaTHEvxOkyikYlfnMIsgyitI5bYhElGpJdDdpPT2iAmpD21M
	mMdaOgQRLDmenk8R3UqoBqRwdC5DZsW/fl508g9Kdq1p63PNwYlcFwsyhEpHOLG7q+f6zSO8izH
	NOI7wCekC4HW3u1WhokxEY3riyuZx0KA1zGW0S1xWOCg2Dnsh2Yg4MjNScSee8X93hONb0wW+5+
	IVXmr4PBOEpmv1nE04ms5KpMot
X-Google-Smtp-Source: AGHT+IHlwqnH8DNT7s/OfSxZUqQaxK5WPTQYYonZiQJ+UTqrem5/nUm3JJnDPH7YfN3JHvLzV6+QPA==
X-Received: by 2002:a17:907:d1d:b0:b43:b740:b35d with SMTP id a640c23a62f3a-b50abfd6a73mr2250908366b.33.1760372010669;
        Mon, 13 Oct 2025 09:13:30 -0700 (PDT)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com. [209.85.208.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b55d65d6994sm957694266b.28.2025.10.13.09.13.30
        for <imx@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 09:13:30 -0700 (PDT)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-637dbabdb32so8641046a12.2
        for <imx@lists.linux.dev>; Mon, 13 Oct 2025 09:13:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlWziKR4kC7v3ZiWnrPOGRDPZLZc7hn829+mlEn88TSZDRd9A8yNEnOvEutD6zhzlFSVY=@lists.linux.dev
X-Received: by 2002:a05:6512:1095:b0:58b:75:8fbc with SMTP id
 2adb3069b0e04-5906dd8ef00mr6030162e87.50.1760370658194; Mon, 13 Oct 2025
 08:50:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251013-ptr_err-v1-0-2c5efbd82952@chromium.org>
 <20251013-ptr_err-v1-1-2c5efbd82952@chromium.org> <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
In-Reply-To: <aO0cXYeGLwwDABP6@lizhi-Precision-Tower-5810>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 13 Oct 2025 17:50:44 +0200
X-Gmail-Original-Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
X-Gm-Features: AS18NWAjEedfD0tRDHHy9p2HIYCpNxcTQpn_Xf2f0oNW4TLvTJ881tcLSkxWDmQ
Message-ID: <CANiDSCtxnR-ydCquhH1=g-XwZ9DN=eeJNxRBOGiqufS_DMYzUg@mail.gmail.com>
Subject: Re: [PATCH 01/32] Input: cyttsp5 - Use %pe format specifier
To: Frank Li <Frank.li@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, =?UTF-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Leon Luo <leonl@leopardimaging.com>, 
	Kieran Bingham <kieran.bingham@ideasonboard.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Julien Massot <julien.massot@collabora.com>, Jacopo Mondi <jacopo@jmondi.org>, 
	Daniel Scally <djrscally@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Yong Zhi <yong.zhi@intel.com>, 
	Bingbu Cao <bingbu.cao@intel.com>, Tianshu Qiu <tian.shu.qiu@intel.com>, 
	Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
	Yunfei Dong <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Dafna Hirschfeld <dafna@fastmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, imx@lists.linux.dev, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Hi Frank

On Mon, 13 Oct 2025 at 17:36, Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Oct 13, 2025 at 02:14:41PM +0000, Ricardo Ribalda wrote:
> > The %pe format specifier is designed to print error pointers. It prints
> > a symbolic error name (eg. -EINVAL) and it makes the code simpler by
> > omitting PTR_ERR()
> >
> > This patch fixes this cocci report:
> > ./cyttsp5.c:927:3-10: WARNING: Consider using %pe to print PTR_ERR()
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >  drivers/input/touchscreen/cyttsp5.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
>
> Suppose it will go though input subsystem intead of media.
> Need post seperated at difference thread?

Indeed, it belongs to input. if there is a v2 I will move it to a
different thread.

Thanks!

>
> Frank
>
> >
> > diff --git a/drivers/input/touchscreen/cyttsp5.c b/drivers/input/touchscreen/cyttsp5.c
> > index 071b7c9bf566eb0b58e302a941ec085be1eb5683..47f4271395a69b8350f9be7266b57fe11d442ee3 100644
> > --- a/drivers/input/touchscreen/cyttsp5.c
> > +++ b/drivers/input/touchscreen/cyttsp5.c
> > @@ -923,8 +923,8 @@ static int cyttsp5_i2c_probe(struct i2c_client *client)
> >
> >       regmap = devm_regmap_init_i2c(client, &config);
> >       if (IS_ERR(regmap)) {
> > -             dev_err(&client->dev, "regmap allocation failed: %ld\n",
> > -                     PTR_ERR(regmap));
> > +             dev_err(&client->dev, "regmap allocation failed: %pe\n",
> > +                     regmap);
> >               return PTR_ERR(regmap);
> >       }
> >
> >
> > --
> > 2.51.0.760.g7b8bcc2412-goog
> >



-- 
Ricardo Ribalda
