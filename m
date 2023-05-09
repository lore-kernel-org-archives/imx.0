Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873D317FEC
	for <imx@lists.linux.dev>; Tue,  9 May 2023 15:42:15 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-61af33bdf1dso29355956d6.2
        for <imx@lists.linux.dev>; Tue, 09 May 2023 08:42:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683646934; x=1686238934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=etyusjk1GXFs4nnYfd4cGeJfrsfR/4ZZW0m7Y3cJMhE=;
        b=gQvgx4yaxNxAJ4z6OnVdTFJD7nfmxqpFsrcSlJ+//USie9wQ4d+jFgdgb0oN/9Nklv
         75C0QiRvyWBPLvCyVBh0jJHS1nVmgSjOyCGdQeUvzx65J7ZtRZVL2b+TUc0Tpp+CesG5
         TgB51BGvVxMzEpfDA/UAYy8b8LglTKAKOGHhs+V0ftNypCy491RHWnLgLtqcnst2zlHv
         Jc76yXe08VJyLcp0XCogs7frY3nLbmnwwbw25KpABxQzyAkBwgfb6RPGv83SbNQeeC3t
         pRbkGxNtS2V89A0hXYX8eLhUFTbkDUQHksQ7zogoV1KwfD/1qbxwLqTTcskkj9lxpGvd
         h83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683646934; x=1686238934;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=etyusjk1GXFs4nnYfd4cGeJfrsfR/4ZZW0m7Y3cJMhE=;
        b=dApMUQC7dkWr3HUH/NPG7cQzt5j2kxLZBV3B/y+352VS1DhvAtsHWgRahUMZyVELrj
         dGpeG49HVlF1HYxmubzui5jhOdKrpGMKqwwueJFLWpjzbqU8ScScAgZSmKTc43WNq419
         wYVu9i3RUknqQod8rF2m0sKTn+YMqnugozttWfuCg9Cf7xY4vR6iJPU01p0SiA8F7BTc
         l5Zx3RhSQywWjgSY6sRyD0xSiciWVUusNb70qDxNWPYMdMoGKWkdIbfiR5vWasPRqwto
         ACrLfW/FFig5scXRZ1MsRTEYqGeP488EYoBUe3/B6JGCVrE/dyNcmTIRsE+0RNlHZij7
         oa7A==
X-Gm-Message-State: AC+VfDwAsmbWrCLah9pP0CQNJL6pWtGhwwA3x4zWuzUQLD3JlZ+xfzeh
	U1M8/QgvxvAbuIDrU9HvdERriT6Kds1htMkP6ME=
X-Google-Smtp-Source: ACHHUZ7m1Owh79aqBIldjLKAWVnO6vNex98FkCdiuazHdseDmML3KQFsOqWVhZ+cp2cTzitnRA9WyxgBEP4Zbt7CMqE=
X-Received: by 2002:a05:6214:1cc4:b0:5c7:d03c:f2b2 with SMTP id
 g4-20020a0562141cc400b005c7d03cf2b2mr18822533qvd.28.1683646934468; Tue, 09
 May 2023 08:42:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230508194555.1057007-1-shenwei.wang@nxp.com>
 <CAHp75VesbGkmG_7haH3LvHawA1Z3=TGv+w-kqF5nUkaTd5tfag@mail.gmail.com> <PAXPR04MB9185BFE399C00B2BEB3184C589769@PAXPR04MB9185.eurprd04.prod.outlook.com>
In-Reply-To: <PAXPR04MB9185BFE399C00B2BEB3184C589769@PAXPR04MB9185.eurprd04.prod.outlook.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 May 2023 18:41:38 +0300
Message-ID: <CAHp75VfpgSaNvnZwVYD-vXX0G7eeWimxrqKGyNReB7t2ZQ6h_g@mail.gmail.com>
Subject: Re: [EXT] Re: [PATCH 1/1] gpio: mxc: use platform_get_irq_optional()
 to avoid error message
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Stephen Boyd <swboyd@chromium.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	dl-linux-imx <linux-imx@nxp.com>, Fugang Duan <fugang.duan@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 9, 2023 at 6:31=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com> =
wrote:
> > From: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Sent: Tuesday, May 9, 2023 4:12 AM
> > On Mon, May 8, 2023 at 10:46=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.=
com>
> > wrote:

...

> > >         if (irq_count > 1) {
> > > -               port->irq_high =3D platform_get_irq(pdev, 1);
> > > +               port->irq_high =3D platform_get_irq_optional(pdev, 1)=
;
> > >                 if (port->irq_high < 0)
> > >                         port->irq_high =3D 0;
> >
> > I would rather do
> >
> >   err =3D platform_get_irq_optional(pdev, 1);
> >   if (err >=3D 0)
>
> Should be "if (err > 0)", right? As the platform_get_irq_optional() retur=
n non-zero
> IRQ number on success.

Either way will work, but your proposal is better.

> >     port->irq_high =3D err;
> >
> > >         }
> >
> > And looking into the code the above piece makes more sense after asking=
 for
> > the first (mandatory) IRQ.


--=20
With Best Regards,
Andy Shevchenko
