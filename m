Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71686620
	for <imx@lists.linux.dev>; Wed,  5 Jul 2023 19:04:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-51e00695e21so15190a12.1
        for <imx@lists.linux.dev>; Wed, 05 Jul 2023 12:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688583859; x=1691175859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlk6SrTMjIXxIPbw9fNdLHRvDWOQ6YKITV0aoNaBjc4=;
        b=XYZNEMk83QxCPePjhwf6tfGfc1Q+Xkje1KPfa/CKqbGDlr9oSpVOsud+H+N135zb0j
         l7RbAb+5TcGlTpzSiou/1KzCDCjs0tHWuzgsHXjAwY8rXuKJ2ZAvsqCCnhkzMfmHXB57
         LC/fjK16TrOlZycqtDtsvLzGVxqTT/H1v7IbyjY9Ob6jNabhqrk+93dQUBaPNvm4qYKU
         ibyaB2yanm4JKpD4ezp4gi3wa3rusrVTUL1u0kBqVwODFObRyyPenA8aFTp6jXPrFw3g
         cdYOE9VTHwsvsmK312raqpAURPpqsvRWOdytZs4cmkUSNIgb3bhj1HqsXooBi2ZAA508
         m1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688583859; x=1691175859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlk6SrTMjIXxIPbw9fNdLHRvDWOQ6YKITV0aoNaBjc4=;
        b=DTic4daePKrYwf0Iq4xj9zi7VnT4qEcg/2xkYK8p2cg5DgvlVq6wQ8GpKhmDMUsXNl
         /cGr1l1SKyRrYKEfaMPLyhp0nD4WFsjduNhQ7OUdo2jPmSaMCUpsz778oOoUnx8PxBFp
         FUCgHK59+TdYjb65KX+vQyWRF76EOBLfzBrBoWLuBD7hmFmzVNswPrSx18FpIJ4K5LSe
         i8FybT+MO1PrP+RHProxRDQuaoYgaZFrcxMuGGtSM1yq730E1Zyf4RdTpYGUS0q8L8P2
         3DX21Agf6Mgc7PS7/evLJHCMoU1mCr/fehn8KqukUIvKhCAocyZKjkoehFqSHLob3LA/
         /urg==
X-Gm-Message-State: ABy/qLZZg3IrHzJeLLwP69OkwSeb4wG4apCnAd/909GGlxTtUy6yXl9y
	v0XKmd2c5Hy/eZ+9K1NMIaDVoGfUZ2XIF2b5jlQ=
X-Google-Smtp-Source: APBJJlH9hww3qfT9A5qO2+YHaxCkFDY6PqoU/anTr+1Ux0HQiV0wNHbefPdtv+rCC7qGgiXFosnvUupFKeFulWo01BM=
X-Received: by 2002:aa7:cb52:0:b0:51b:eb5f:baf with SMTP id
 w18-20020aa7cb52000000b0051beb5f0bafmr34341edt.18.1688583859217; Wed, 05 Jul
 2023 12:04:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230705153713.2511647-1-shenwei.wang@nxp.com> <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
In-Reply-To: <CAHp75Vf+RovRT2rYJDnizeRUwwKE_Twfd+tF5pY3XEc_xOkXYg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Wed, 5 Jul 2023 22:03:43 +0300
Message-ID: <CAHp75VenYdKJv5=+gCuwPtBM0NEDJiHiyOd-1fDXZPuuXqyipw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: mxc: add runtime pm support
To: Shenwei Wang <shenwei.wang@nxp.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-imx@nxp.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 5, 2023 at 10:01=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Wed, Jul 5, 2023 at 6:37=E2=80=AFPM Shenwei Wang <shenwei.wang@nxp.com=
> wrote:
> >
> > Adds runtime PM support and allow the GPIO controller to enter

Add

> > into runtime suspend automatically when not in use to save power.
> > However, it will automatically resume and enable clocks when a
> > GPIO or IRQ is requested.
> >
> > While putting the GPIO module itself into power saving mode may not
> > have an obvious impact on current dissipation, the function is necessar=
y
> > because the GPIO module disables its clock when idle. This enables the
> > system an opportunity to power off the parent subsystem, and this conse=
rves
> > more power. The typical i.MX8 SoC features up to 8 GPIO controllers, bu=
t
> > most of the controllers often remain unused.

...

> > +       pm_runtime_set_active(&pdev->dev);
> > +       pm_runtime_enable(&pdev->dev);
> > +       err =3D pm_runtime_resume_and_get(&pdev->dev);
> > +       if (err < 0)
> > +               goto out_pm_dis;
>
> So, after this if an error happens, you will have PM left enabled and
> the next probe won't work as expected, right?

Just noticed that this patch completely screwed up the error handling
WRT clock and PM.

...

> >         platform_set_drvdata(pdev, port);
> > +       pm_runtime_put_autosuspend(&pdev->dev);
> >
> >         return 0;
>
> ...something here is missing?
>
> > +out_pm_dis:
> > +       pm_runtime_disable(&pdev->dev);
> > +       clk_disable_unprepare(port->clk);

This is definitely in the wrong position to begin with.

> >  out_irqdomain_remove:
> >         irq_domain_remove(port->domain);
> >  out_bgio:

--=20
With Best Regards,
Andy Shevchenko
