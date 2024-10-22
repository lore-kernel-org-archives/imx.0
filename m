Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30167184540
	for <imx@lists.linux.dev>; Tue, 22 Oct 2024 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729585770; cv=none; b=ZS+XATYs3/j7MdvYLmoizayZMyV3Ps546XrwjcHXVdzj9m6nAZyl/w5P0/k7YC8A4qo41sFwIjsAusb7ihGX8D8Wup1qs+JRjTVYK/gzlI7tmjrR2zB6jprnbQGcE6I9shyv18YDFpnwjfpvOnBwE+keXmeFHyhBLfdD31BeG9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729585770; c=relaxed/simple;
	bh=91JYyvnl+Fdi6fkf5FSlb8LxDeQ2IrQc7l6lvJQCgto=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NyknxxS07s5CgSgM/p3dctIKB7C5SjRbVew4SNV5759tl5zfn/3cO/+cpvzU7nSpohe9QpDulUZpYaxv1kZX563x7khyiaWSQodShfE5xRrD1PCimIbKANuyBvXsbFs1GsKfiAo75gX7pj1O+yFljJXwKM+EoaZQh5bcP9MT5hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=c60IZTQ1; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="c60IZTQ1"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6db20e22c85so45920987b3.0
        for <imx@lists.linux.dev>; Tue, 22 Oct 2024 01:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729585767; x=1730190567; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kLQbdGQU/v5ri2hhQLOr8G4Wt+hC9tXpUHCmYp6zu9E=;
        b=c60IZTQ1Xk7hjDTPGQ1W+3XdBHqFPJMIPE4ShVYaujLUxRsdwkRpycHO1o/mgmtmr7
         lfOKVgwE6Rl5bKSj/DGQUS/EZ6N16xy1XLVOPulT4XM6xUlKWxgqHfCEWi/+77JQl6QK
         /PGKfsjrzbwHvZf3bxZEAGcIy+CYJWTHaBSI8keLNC+pov9sIFPL43Qb6T+HhCe7+yl4
         sAHxbg13qEN8S4mwoQ4sZForYJoEYn8ij+zToCZ82RmT+7XfCrQDCfl9NIVcMh4AWUS9
         Ud6+XAh0ccNUtQapB6iisnHq2n/QzsO/W8GoydyygILPDdNof57ZVh2gyUR0Ym3FiB+1
         m5qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729585767; x=1730190567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kLQbdGQU/v5ri2hhQLOr8G4Wt+hC9tXpUHCmYp6zu9E=;
        b=T5ipNHvyy6rIhZJ3/wRM8HeSkPUMVkXQgGZtHaHudUFtiykCg8YcuVAdya9DVl0GOG
         2NvjWulhI8mgr+4lomVE7ShzxdxhgPzwg8Cu3xmc2gvBGSimx/R9ZnfBtVhTmkOM/jcV
         3qDgRFsTPc6u0X6X54g6ofBItN+TmBiZEaQZrfa34L/T0w/dN3jDzbBqI/2k2c2FqlUG
         4mQXF3X8bU08soySmA4/UYljC9bO9SLgy0ezH81awRWmQV7gX3hYkzKTqcyvaGhBv+zI
         OIa1LrmH/xlHcaQkRHq6byNDoyurGfg3fMg+lC6HpJGXXyaXq811RFI4n0gZ+VECSaW9
         Z3+A==
X-Forwarded-Encrypted: i=1; AJvYcCVtgG7W0V1urtPXhV0p1v+iPpcjApAn7zjzDtpc9cny48nZ0bxYQ/+Br1VfHvoNoxdwMck=@lists.linux.dev
X-Gm-Message-State: AOJu0YzGWq0QKLTPDPSin88lB99mSa3njPPDs0XoQsg9Yhm/j8I0F2FU
	PhvOR99eZJL0WPhbLknw4Oj6P+iGp+HvuTmxvsNir9MbfMST2CgHHJpBqyOonBEUbLdwmoJ1O1U
	s7JQhOEfAVd4NTz92cK6n20hLHxJaqUO01cWlmw==
X-Google-Smtp-Source: AGHT+IG9Q3YEuJr8VKnJyP4ALVy/0ok/SYBCMzoi2I9bl8cdDzUPuqepo05ucF6AILKeMjf8mXd/KxO/YrS7ZIa3T0w=
X-Received: by 2002:a05:690c:4907:b0:6e5:de2d:39e0 with SMTP id
 00721157ae682-6e5de2d5659mr108655877b3.42.1729585767136; Tue, 22 Oct 2024
 01:29:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241014060130.1162629-1-haibo.chen@nxp.com> <20241014060130.1162629-3-haibo.chen@nxp.com>
 <CAPDyKFr37wLYxdFJ-Lgbq7PbWyiQz+CuwMxwgeeP3QpMvdyjqg@mail.gmail.com>
 <DU0PR04MB949604108991809742E83E5D90402@DU0PR04MB9496.eurprd04.prod.outlook.com>
 <DU0PR04MB9496801A4571142F914BBF4990402@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB9496801A4571142F914BBF4990402@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Oct 2024 10:28:49 +0200
Message-ID: <CAPDyKFpectKosHEU7cm7uNCNwHZaT0XCSn674dGtu8Y+hmf_Pw@mail.gmail.com>
Subject: Re: [PATCH 2/4] mmc: host: sdhci-esdhc-imx: refactor the system PM logic
To: Bough Chen <haibo.chen@nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, dl-S32 <S32@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Oct 2024 at 05:20, Bough Chen <haibo.chen@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Bough Chen
> > Sent: 2024=E5=B9=B410=E6=9C=8818=E6=97=A5 9:23
> > To: Ulf Hansson <ulf.hansson@linaro.org>
> > Cc: adrian.hunter@intel.com; linux-mmc@vger.kernel.org; imx@lists.linux=
.dev;
> > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; dl-S32 <S32@nxp.com>;
> > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > Subject: RE: [PATCH 2/4] mmc: host: sdhci-esdhc-imx: refactor the syste=
m PM
> > logic
> >
> > > -----Original Message-----
> > > From: Ulf Hansson <ulf.hansson@linaro.org>
> > > Sent: 2024=E5=B9=B410=E6=9C=8817=E6=97=A5 21:07
> > > To: Bough Chen <haibo.chen@nxp.com>
> > > Cc: adrian.hunter@intel.com; linux-mmc@vger.kernel.org;
> > > imx@lists.linux.dev; shawnguo@kernel.org; s.hauer@pengutronix.de;
> > > kernel@pengutronix.de; festevam@gmail.com; dl-S32 <S32@nxp.com>;
> > > linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org
> > > Subject: Re: [PATCH 2/4] mmc: host: sdhci-esdhc-imx: refactor the
> > > system PM logic
> > >
> > > On Mon, 14 Oct 2024 at 08:00, <haibo.chen@nxp.com> wrote:
> > > >
> > > > From: Haibo Chen <haibo.chen@nxp.com>
> > > >
> > > > Current suspend/resume logic has one issue. in suspend, will config
> > > > register when call sdhci_suspend_host(), but at this time, can't
> > > > guarantee host in runtime resume state. if not, the per clock is
> > > > gate off, access register will hung.
> > > >
> > > > Now use pm_runtime_force_suspend/resume() in
> > NOIRQ_SYSTEM_SLEEP_PM,
> > > > add in NOIRQ stage can cover SDIO wakeup feature, because in
> > > > interrupt handler, there is register access, need the per clock on.
> > > >
> > > > In sdhci_esdhc_suspend/sdhci_esdhc_resume, remove
> > > > sdhci_suspend_host() and sdhci_resume_host(), all are handled in
> > > > runtime PM callbacks except the wakeup irq setting.
> > > >
> > > > Remove pinctrl_pm_select_default_state() in sdhci_esdhc_resume,
> > > > because
> > > > pm_runtime_force_resume() already config the pinctrl state accordin=
g
> > > > to ios timing, and here config the default pinctrl state again is
> > > > wrong for
> > > > SDIO3.0 device if it keep power in suspend.
> > >
> > > I had a look at the code - and yes, there are certainly several
> > > problems with PM support in this driver.
> > >
> > > >
> > > > Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> > > > ---
> > > >  drivers/mmc/host/sdhci-esdhc-imx.c | 39
> > > > +++++++++++++++---------------
> > > >  1 file changed, 19 insertions(+), 20 deletions(-)
> > > >
> > > > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> > > > b/drivers/mmc/host/sdhci-esdhc-imx.c
> > > > index c7582ad45123..18febfeb60cf 100644
> > > > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > > > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > > > @@ -1871,11 +1871,13 @@ static int sdhci_esdhc_suspend(struct devic=
e
> > > *dev)
> > > >         struct pltfm_imx_data *imx_data =3D sdhci_pltfm_priv(pltfm_=
host);
> > > >         int ret;
> > > >
> > > > -       if (host->mmc->caps2 & MMC_CAP2_CQE) {
> > > > -               ret =3D cqhci_suspend(host->mmc);
> > > > -               if (ret)
> > > > -                       return ret;
> > > > -       }
> > > > +       /*
> > > > +        * Switch to runtime resume for two reasons:
> > > > +        * 1, there is register access, so need to make sure gate o=
n ipg
> > clock.
> > >
> > > You are right that we need to call pm_runtime_get_sync() for this rea=
son.
> > >
> > > However, the real question is rather; Under what circumstances do we
> > > really need to make a register access beyond this point?
> > >
> > > If the device is already runtime suspended, I am sure we could just
> > > leave it in that state without having to touch any of its registers.
> > >
> > > As I understand it, there are mainly two reasons why the device may b=
e
> > > runtime resumed at this point:
> > > *) The runtime PM usage count has been bumped in
> > > sdhci_enable_sdio_irq(), since the SDIO irqs are enabled and it's
> > > likely that we will configure them for system wakeup too.
> > > *) The device has been used, but nothing really prevents it from bein=
g
> > > put into a low power state via the ->runtime_suspend() callback.
> > >
> > > > +        * 2, make sure the pm_runtime_force_suspend() in NOIRQ
> > > > + stage
> > > really
> > > > +        *    invoke its ->runtime_suspend callback.
> > > > +        */
> > >
> > > Rather than using the *noirq-callbacks, we should be able to call
> > > pm_runtime_force_suspend() from sdhci_esdhc_suspend(). And vice versa
> > > for sdhci_esdhc_resume().
> > >
> > > Although, according to my earlier comment above, we also need to take
> > > into account the SDIO irq. If it's being enabled for system wakeup, w=
e
> > > must not put the controller into low power mode by calling
> > > pm_runtime_force_suspend(), otherwise we will not be able to deliver =
the
> > wakeup, right?
> >
> > Thanks for your careful review!
> > Yes, I agree.
>
> Hi Ulf,
>
> Sorry, I maybe give the wrong answer.
>
> I double check the IP, usdhc can support sdio irq wakeup even when usdhc =
clock gate off.

Okay, so there is some out-band logic that can manage the SDIO irq,
even when the controller has been runtime suspended?

In these cases, we use dev_pm_set_dedicated_wake_irq* to manage that
wake-irq. There are other mmc host drivers that implement support for
this too.

If you are referring to solely clock gating, that is not going to
work. A runtime suspended controller is not supposed to deliver
in-band irqs.

> So to save power, need to call pm_runtime_force_suspend() to gate off the=
 clock when enable sdio irq for system wakeup.
> This is the main reason I involve pm_runtime_force_suspend in noirq stage=
, because in sdhci_irq, there is register access, need gate on clock.

In summary, to support the out-band irq as a wakeup for runtime and
system suspend, dev_pm_set_dedicated_wake_irq* should be used.

To move things forward, I suggest you start simple and add support for
the out-band irq as a step on top.

[...]

Kind regards
Uffe
