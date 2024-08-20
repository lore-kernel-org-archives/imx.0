Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC621C68B0
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724191662; cv=none; b=eis4RJHiu4mid+oCkLtKnzNvlM/xlNtqAPOCl2vdnl4eo3qXtVRop5k9baq1jXLLvMnX6T3aMRnhVGB0szrnc1ZMbb63zh+udTOf5xFPM29m3SzDNy/bh3OdKebEkrLFHYumVPxhd8/bMAkj5FTZuM7ixihFoY07PuV8vASQ0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724191662; c=relaxed/simple;
	bh=S3mpOjdi14VHSCLnuZBDQBu52u7Ft4eBzspfymP1PJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o9LJRahAyKi0MWO/boCLWM/dGTgNaElIifnhRPY4U37Og5/8IVExDQqOW0vPnSq8y2pdLmjrCVGQZFerC2v0/jsB7FdBA6OPEWdW3U3P5SCIgXdSz2g0AAeGB9PeMC+XV5HQdRenpirTmyuBqEFkZ+xAGn38UQLF044skrPA35g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5plBxSV; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5plBxSV"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8384008482so636801266b.2
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 15:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724191660; x=1724796460; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i3zG/pSsvdgGO5mZ9CA/2SfMOpcuDqe6+MqB8h9/BT8=;
        b=a5plBxSVGVWhRaVtJ3OE4fg2N++AvUGeODCj+hqyH+gAcgXvHsZoNQHlK1cXbI9+nQ
         FWFfHx0pARuma5zGX7169upAJvyclfqqgi9O81QARpePvYMgrJYlO1W5oeEEZ+mUbDJW
         4M+9zWxARqIFIKOPY4wi5u4A1ij4Ee0AIDzikg3FooqszdXdkedt0AFcXdqw8sfqvUj3
         BZceFZKcP8RS4uv/JKfD+JvOAx4L4/zyKzvnmKvYIhEZMSUXnTaHOAPTLZarKxRCN6+r
         wQHfV/H13Jmp+3cWFf9PnLwmAoatg6rNov1mDfxMYirU+Yxbr8MAylKy6aAO9uwZU5DE
         y7mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724191660; x=1724796460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i3zG/pSsvdgGO5mZ9CA/2SfMOpcuDqe6+MqB8h9/BT8=;
        b=f1q3vGBygC4EHgyhIwSrlYorWRoqzuxiZCUNhBOJ6CYjmiuKJg+OxgA81m3N7VlO81
         uSx7EzE5BuL7Pk3x3u7IuT04EOoaDpmpbwSbw6CkexqXN3Y5sDq1ACAvmxdBa6KJgItp
         a32f//EDd5EWwI2Qs2w3JY/GOKqUxT7Tuhu4Dr31fAE0yl81Pa+QP3R3I3MvfrgCdatj
         ObW6RxLQ61E0E5n+iDL/9paObTmEX+4GQtGdmpPc3T62e7m2Wpt/Z2si8k26DxB9FSCc
         FKtmXCB85WJ6SFj8nlnohOhTl4b6GRwtzYQEFL7Ys9P0lo4I+DhhqAbLxqGdW8G+VLj9
         k8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUUJBmC9HBWxyIuRYN8H7ZQpTB1qcNp47pmDOpNi/nta7H1DngDSPJQT+CVzXU9tXFsaYc=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywp8PN1IVjaP7gFv81KVHvQhpTG766B/807MIxYmCp4EGKbRg3b
	EnSddbqRbNEHy0BmUMBsuZGTyx7a+j2ghddb51ixtEXy2d3fkmyKEX2fDUVTbTVZ/6DK4xTM8Fx
	aKtidXMh8a0rc15yJ4lVEprDT+EU=
X-Google-Smtp-Source: AGHT+IFYilS4JfW+wXgXlmrG71yQwpId/Qb/cCUo2FEGaPuRuQPzw+RLTkroFwUqoH9ve+07Xnvmvgo4klxfGFlR+xk=
X-Received: by 2002:a17:907:e604:b0:a7a:a892:8e07 with SMTP id
 a640c23a62f3a-a866f3622damr19074766b.31.1724191659300; Tue, 20 Aug 2024
 15:07:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAOMZO5DvGF5OW6fGQocZcFf+6103OhOyUCRdWGLBKbewWOOLHw@mail.gmail.com>
 <CAOMZO5DiSvAG225poAoj9hHKioq9XSg_Y7kJ8PG66HEVo-SjMA@mail.gmail.com> <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
In-Reply-To: <d3c5d73f-a756-4f35-97f1-9301529cce34@lunn.ch>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 21 Aug 2024 01:07:02 +0300
Message-ID: <CAHp75Vd3uUge7QFb4eOZb_nGNDu-GFDTZMyS9aZSm-D4LkT97A@mail.gmail.com>
Subject: Re: pca953x: Probing too early
To: Andrew Lunn <andrew@lunn.ch>
Cc: Fabio Estevam <festevam@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, Oleksij Rempel <o.rempel@pengutronix.de>, andi.shyti@kernel.org, 
	linux-i2c <linux-i2c@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2024 at 12:29=E2=80=AFAM Andrew Lunn <andrew@lunn.ch> wrote=
:
> On Tue, Aug 20, 2024 at 05:47:27PM -0300, Fabio Estevam wrote:
> > Adding the i2c-folks on Cc.
> > On Tue, Aug 20, 2024 at 5:02=E2=80=AFPM Fabio Estevam <festevam@gmail.c=
om> wrote:

> > > I am seeing an issue with the PCA935X driver in 6.6.41 and
> > > 6.11.0-rc4-next-20240820.
> > >
> > > The pca953x is getting probed before its I2C parent (i2c-2):
> > >
> > > [    1.872917] pca953x 2-0020: supply vcc not found, using dummy regu=
lator
> > > [    1.889195] pca953x 2-0020: using no AI
> > > [    1.893260] pca953x 2-0020: failed writing register
> > > [    1.898258] pca953x 2-0020: probe with driver pca953x failed with =
error -11
>
> -11 is EAGAIN, which is a bit odd. Given your description, i would of
> expected ENODEV. My guess is, it needs another resource, a GPIO,
> regulator, or interrupt controller. That resources might not of probed
> yet. If that is true, you want the pca953x_probe() to return
> -EPROBE_DEFER. The driver core will then try the probe again sometime
> later, hopefully when all the needed resources are available.
>
> Track down where the EAGAIN is coming from.

I bet on __i2c_smbus_xfer(). Which comes from
https://elixir.bootlin.com/linux/v6.11-rc4/source/drivers/i2c/busses/i2c-im=
x.c#L549.
Very easy to check is to add at the top of i2c-imx.c the following

#undef EAGAIN
#define EAGAIN __LINE__

and search for the respective line in suspicious files.

--=20
With Best Regards,
Andy Shevchenko
