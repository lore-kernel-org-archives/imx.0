Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0967A20E6
	for <imx@lists.linux.dev>; Mon, 27 May 2024 03:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716781421; cv=none; b=upMLF14p/ltxvLGLQBf7sfLeHytg5qxWm4h9l2sMMEWG2qXvmkCpoHUQypAmrde1FyEDWQprc4GTisBarmv6Pm0EI4hD3AksvRpdkwDhduJ3OnrENbuLxYJ8wjg/z2oD66tSLFwL6saIkxRa+JQ6Bij+cp63kGKYMmA7APChAZ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716781421; c=relaxed/simple;
	bh=53XFiw3wcH5MEHYvmgoOoQBcB9x5uThYREaPmL4h+tI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kpXzzQcGz14V0/R0CtUDL37T8f3JQzo/xX6WKrJqpqZ0HJYSP40pLbFpQfonlhghl7kEpjrG4pakRlavO3M57eOKrQoRkGGFdRpN/6HiLqZOfApoe/ednxYdi7AHBpOP0/WNWHZMeCqzWuvP9DhWTz9ut0hGKkma4osmIOQchr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Iz1H/6gq; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iz1H/6gq"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3737b3c56d7so11264335ab.2
        for <imx@lists.linux.dev>; Sun, 26 May 2024 20:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716781419; x=1717386219; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JRrRcXmuLZcVS0a1HI//2b0lm2ojNew43pXaiTtTIT0=;
        b=Iz1H/6gq8R3biuufzxJn2FJOaYB1mG9eJT8XG3RXRoFzQBOLEqS6d5P381eq3XYwuk
         bWqqQNJM/qooohZJmXljXQUsRS2/cLWH4nYMjfTrqd32VmQJx8QIs5Lj/rGLk/Y58///
         AuS1kcKqb0gal2mUS4AploIzcqRKB8FsrnNvThcfFKzRm7vl3RqwJWUI7nZgatT3dx7O
         qAoIwVIlW0AFV51/nHaGE5ywGIAlUSu25CBPo7WkoehY7E0JHukcP8Bvjf+lczOkZie9
         gU1mVDpFt0n6ooWt0YaBhMn1oUUk9cwM3nHkbi3B3whugpQ6fdonvVYGURCO/QdfPYoT
         KEsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716781419; x=1717386219;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRrRcXmuLZcVS0a1HI//2b0lm2ojNew43pXaiTtTIT0=;
        b=iGdPWfTMLQB2KNUt58FKJTce6Lp+DfGBRkmu9CDcONvH27Bf4JmAjXJOeD+nQCTML/
         t0x3KOKmVdvSuMFwaqwK0ETO9bjqN5g/ar4XCGGUPj3YGK+xU6nZnwA8JeyCyM3mqXAK
         sJqhxdoOqdLPdD+oUehG0dxkrIXFyTUDsc/GkKqJoi4WbC6CXDJg/CqcmuP5giFPJKQl
         yYnKKhxCG1KqthybV1r4PZKNRZNNyOIlRc3R/tKiPaLp99NPqdi1DpkbuicyXRQMpsy1
         NqggdMycqjTE4Zs/0mtKcY/gHSY8/uZxkcyXh/uTlICFXzlhmaDfJh7NSTQBIIGMWWIE
         lAxA==
X-Forwarded-Encrypted: i=1; AJvYcCWwNvO3ZBmVMd3g3FAPnsF5vn9AJC1vSM8M0ET4g10xc0yqulrQaYn9AGSrsARqqfQelrL+TD7CH623sx9gzZ8yAlwg
X-Gm-Message-State: AOJu0Yy1TJwOjwjsZCzWkpsXb1jeweGuVWDT+ASQslyzVwWdOLmkI+66
	3CTs3j+ylavm6v5RTJ4Bn3wrpQNBbUP6okPeZbtT/t+i2LPfOr5uy4sPhNGnyrsI8KUIjsfNTnT
	AMoGJob4CShIhjd8U0E8btprbHWQ=
X-Google-Smtp-Source: AGHT+IFer+okIhIMWyZ3KDB5sub/J3A98AWgoEcUO098+9PFGoUSKu3O2L2vhwhC/BxcGv8gjuJlt8qOcDZPXnhr1ww=
X-Received: by 2002:a05:6e02:1c07:b0:371:252c:d8f6 with SMTP id
 e9e14a558f8ab-3737b3032f7mr94193515ab.11.1716781419196; Sun, 26 May 2024
 20:43:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1716458390-20120-3-git-send-email-shengjiu.wang@nxp.com> <4c53b063-ad12-405d-b088-9b992284ba08@web.de>
In-Reply-To: <4c53b063-ad12-405d-b088-9b992284ba08@web.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 May 2024 11:43:28 +0800
Message-ID: <CAA+D8ANu6S1vrmAD4FU2X7=9U-B6SwnZu245mu4dXTfgetjDEA@mail.gmail.com>
Subject: Re: [PATCH v5 2/5] clk: imx: clk-audiomix: Add reset controller
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel-janitors@vger.kernel.org, imx@lists.linux.dev, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, kernel@pengutronix.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 25, 2024 at 3:27=E2=80=AFPM Markus Elfring <Markus.Elfring@web.=
de> wrote:
>
> =E2=80=A6
> > The reset controller is supported by the auxiliary device
> > framework.
>
> Would you like to add an imperative wording for an improved change descri=
ption?
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?h=3Dv6.9#n94

ok, will update it.

>
>
> =E2=80=A6
> > +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> =E2=80=A6
> > +static int clk_imx8mp_audiomix_reset_controller_register(struct device=
 *dev,
> > +                                                      struct clk_imx8m=
p_audiomix_priv *priv)
> > +{
> > +     struct auxiliary_device __free(kfree) * adev =3D NULL;
> > +     int ret;
> > +
> > +     adev =3D kzalloc(sizeof(*adev), GFP_KERNEL);
> =E2=80=A6
>
> May the following source code variant be applied here?
>
>         int ret;
>         struct auxiliary_device __free(kfree) *adev =3D kzalloc(sizeof(*a=
dev), GFP_KERNEL);

ok, will update it.

best regards
Shengjiu Wang
>
>
> Regards,
> Markus
