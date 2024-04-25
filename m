Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A621494D8
	for <imx@lists.linux.dev>; Thu, 25 Apr 2024 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714050420; cv=none; b=Znh3U3NZFib/MZvXxSwZm3UU7+X7BM58Ru6/wI18FTPk8TsD6zMHd48+5Q6jlCdTibhEWQFFF8zvpr45p30vtdz6wxuDSvtleiO+j45ABjrhO7TCGmYFOJl67Ku/iCjjXia7yixZkpfW65/A53FHcrDQL4japA8LHMgces9RJO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714050420; c=relaxed/simple;
	bh=iCLpk1XYOML5rjW/DzWQBTxUzuHTUhaSKVXX0JoQ3Fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S25XEhU65i5s5N6gRtK+p/Xu/pg1kexLj+UnX/1cA8+3P0+a6mPBw9jhlFl/aiE1Lc75XEq0QtRTsdrlhGYL4P0ou6HNqPeaaHfOHjL6yAMrw6LwI7CoglSzA7O5eNIGKIx6oFPa7dVhhyjlYjMt7S8WTZ2U4WbG9dt5TdT+kwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1C2LrGp7; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1C2LrGp7"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2dae975d0dcso21373611fa.1
        for <imx@lists.linux.dev>; Thu, 25 Apr 2024 06:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1714050416; x=1714655216; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OXjxjK1s1trKrgIcuofImk0hlW/Fp+pJsvVfi+fABag=;
        b=1C2LrGp7kVfOQV0yq2jmHtr9YcMDTENLVKK14nat4kkB0EeIr7mGAydfA43Te+BTCl
         eFyanEfDiutpm/bIlyavI1RRe4J0umBSdiCa0nBGLrrjXUvxmfqlzfN1mSLQ6MNOKZfC
         lSqL7vXgzRG9pE85rEV1LXuIvfDE+IjCadq2FucXdWRbIZjCy0R2U+sG77E+ClnGmB2a
         QLMBVBjl/8vvXJJi8tHlvAy2nZGQZu9mVixHxzZinKeUKImJclW3SIF1BbwHpzsVhxhA
         pUSZhIgkQ90PEiVuV3znFspks0gMux22R9KdkzHnwE5SHz5FWTRa3gkHrmQX3uSBJoyW
         LwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714050416; x=1714655216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OXjxjK1s1trKrgIcuofImk0hlW/Fp+pJsvVfi+fABag=;
        b=FmWmJiX1VaaIlyTSADN0OdEnbFn7SNU2uTThwlnrgIIk6nQtB69w4OjfxfCkKXfcag
         LwoN9T+SDXgrgK1E+uJOnp0KY7nO89e55rrEpXlYQoK2DEleinEHe/3/9y9j5rnr5N5O
         ARdPmjhPFf5kuW/bOYjEpJZ3tRHqZnlIPai+caIvAc5u7Zi6naEkNX8pPIl98EYIAq2I
         nNTXlIM2qPQzD07ED4Yb9kcXh5oNzi0QMOsQNdBice1Jg426OfHqHlPjXPAni7pKDSTv
         L4FvWjQP2HW0C/l+7GFRmp+rI+4nlLmPN5S1U+t3dRlK4zwfAxYNk2XnkYGVuAKNSYJd
         iFVg==
X-Forwarded-Encrypted: i=1; AJvYcCXmi17NF4MFhAHMZNDtRjAZ1b8z3F0eiTuJCkqkqq7XERJe2h9ehRW4fE+j0HzuEUhMFPxJVgHYUHlTMQEfvANJrBSG
X-Gm-Message-State: AOJu0YwR8v+ppdX/bTFI2GkZAYY8Bn5R33CtPNc/P0LO1f/EZesVR2yM
	9jIW4WJeJLcHG0Cyx3FsU+ToF3zTSffCgFQp25adjrfvnweS78hJhJwPldS9RizHqLV6A56aH/1
	RAPyGy42lQnk21wsks1J5pTUOpAXlDRFTGf9bJw==
X-Google-Smtp-Source: AGHT+IEOISNStsO/9+WhdVo2RtgV8uceX8S2G+eTOusKA26PiwFvCdNPq3Iw+sCaXY1CsixaLmp+nRqIEwhJ7bS+kyg=
X-Received: by 2002:a2e:90d4:0:b0:2dd:c2eb:66db with SMTP id
 o20-20020a2e90d4000000b002ddc2eb66dbmr913164ljg.14.1714050416212; Thu, 25 Apr
 2024 06:06:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240423022814.3951048-1-haibo.chen@nxp.com> <CACRpkdaRxoEZT1_KyJ3QMDgBcciw1XUXKr=cEiPxbcwSnpmyiA@mail.gmail.com>
 <AS1PR04MB9502BE89834E7F9DA3E8D70B90112@AS1PR04MB9502.eurprd04.prod.outlook.com>
 <DU0PR04MB949691D7F68E2F32371B604F90102@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB949691D7F68E2F32371B604F90102@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 25 Apr 2024 15:06:45 +0200
Message-ID: <CAMRc=McQtohbuUSrhH8LiF6EWUzRKyHSObBv4D6VeE87NmdZQQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when used as
 interrupt source
To: Bough Chen <haibo.chen@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2024 at 1:01=E2=80=AFPM Bough Chen <haibo.chen@nxp.com> wro=
te:
>
> > -----Original Message-----
> > From: Bough Chen
> > Sent: 2024=E5=B9=B44=E6=9C=8823=E6=97=A5 20:21
> > To: Linus Walleij <linus.walleij@linaro.org>
> > Cc: brgl@bgdev.pl; linux-gpio@vger.kernel.org; linux-kernel@vger.kernel=
.org;
> > imx@lists.linux.dev
> > Subject: RE: [PATCH] gpio: vf610: always set GPIO to input mode when us=
ed as
> > interrupt source
> >
> > > -----Original Message-----
> > > From: Linus Walleij <linus.walleij@linaro.org>
> > > Sent: 2024=E5=B9=B44=E6=9C=8823=E6=97=A5 19:41
> > > To: Bough Chen <haibo.chen@nxp.com>
> > > Cc: brgl@bgdev.pl; linux-gpio@vger.kernel.org;
> > > linux-kernel@vger.kernel.org; imx@lists.linux.dev
> > > Subject: Re: [PATCH] gpio: vf610: always set GPIO to input mode when
> > > used as interrupt source
> > >
> > > On Tue, Apr 23, 2024 at 4:28=E2=80=AFAM <haibo.chen@nxp.com> wrote:
> > >
> > > > From: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > Though the default pin configuration is INPUT, but if the prior
> > > > stage does configure the pins as OUTPUT, then Linux will not
> > > > reconfigure the pin as INPUT.
> > > >
> > > > e.g. When use one pin as interrupt source, and set as low level
> > > > trigger, if prior stage already set this pin as OUTPUT low, then
> > > > will meet interrupt storm.
> > > >
> > > > So always set GPIO to input mode when used as interrupt source to
> > > > fix above case.
> > > >
> > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > > ---
> > > >  drivers/gpio/gpio-vf610.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpio/gpio-vf610.c b/drivers/gpio/gpio-vf610.c
> > > > index 07e5e6323e86..305b0bcdee6f 100644
> > > > --- a/drivers/gpio/gpio-vf610.c
> > > > +++ b/drivers/gpio/gpio-vf610.c
> > > > @@ -214,7 +214,7 @@ static int vf610_gpio_irq_set_type(struct
> > > > irq_data *d,
> > > u32 type)
> > > >         else
> > > >                 irq_set_handler_locked(d, handle_edge_irq);
> > > >
> > > > -       return 0;
> > > > +       return port->gc.direction_input(&port->gc, d->hwirq);
> > >
> > > Just call vf610_gpio_direction_input() instead of indirecting through
> > > gc->direction_input(), no need to jump through the vtable and as
> > > Bartosz says: it just makes that struct vulnerable.
> >
> > Thanks for your quick review, I will do that in V2.
> >
> > >
> > > Second:
> > >
> > > In this patch also implement gc->get_direction() which is currently
> > > unimplemented. If you are going to change the direction of a GPIO
> > > randomly at runtime then the framework really likes to have a chance
> > > to know the current direction for obvious reasons.
> >
> > Yes, will implement gc->get_direction(), if we did this before, then fo=
r this case
> > we meet, framework will print out error log, save much debug time.
>
> Hi Linus,
>
> I implement gc->get_direction() today, for the case to request one gpio a=
s irq, gpio architecture will first
> call gpiochip_reqres_irq(), if the ROM or Uboot already config this gpio =
pin as OUTPUT mode, will get
> the following log:
>
> [    2.714889] gpio gpiochip3: (43850000.gpio): gpiochip_lock_as_irq: tri=
ed to flag a GPIO set as output for IRQ
> [    2.724816] gpio gpiochip3: (43850000.gpio): unable to lock HW IRQ 11 =
for IRQ
> [    2.731972] genirq: Failed to request resources for 2-0050 (irq 211) o=
n irqchip gpio-vf610
>
> Any suggested method to avoid this case? My previous method works because=
 driver lack of gc->get_direction().
>

Can you make the driver default all lines to input when the device is
being registered? Possibly also revert to input when the line is being
freed?

Bartosz
