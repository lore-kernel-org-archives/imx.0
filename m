Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4AD9242D62
	for <imx@lists.linux.dev>; Tue,  9 Dec 2025 13:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765288092; cv=none; b=n+GltccySmDT+Jjl/nwrqHY/4cFZWUB3F28y1cCEtkxmZfrP+beXN/T4+jcEjXk/3GG83c7pTQscr/6LCx2Tb4cf9YHirY3OVbAHACtqM0f47A6HJdHQ1135oNSrtlP8dMcWMJr1k2lgqjhsKTkkQti5zJhxiScw+30tBVFtKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765288092; c=relaxed/simple;
	bh=J7R1jg7yHqWsHV4j0LSnzaT5xQsAlw72hWeQeos/AbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zh1sfLiOvsqdOnEvFJ/e4SdtFuA9nL32NpHEOi+oukDqjtyqXraNGhB4GBmIFQwyjsOpHJV/++CfBDtNxkot6ebyiwHoPsLDy97+zaNjDbcNV7q0Hxtq4J+B408o/HWkMzU/7Usesg4OUsXy609uZsRxsPzu0AvRazmuQ1D/T+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RGEKBv0A; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RGEKBv0A"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-78c5adeb964so8996307b3.1
        for <imx@lists.linux.dev>; Tue, 09 Dec 2025 05:48:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765288087; x=1765892887; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLZGxZfGPH+m9Hz1QW1ANR0vUG8mNwWWC1iVjfNrwBw=;
        b=RGEKBv0A6eUyvTI3Fg4oYn6jProVC8OJsguNgPaEt1e0M0ILJVLXud/gInbrAHvEVA
         X0SZ6mAA6qyOmWL7hgGH/bSaUPSDg3n2C0JEij1t8m9xlV7cvQ+m19Nt84jL8Bcs8KKe
         c6Wyyj2EdPnJlnHc6qkew5sy5WH7ZoVKhIEgzztTf4QgepsR6BdUeYuXT84bJNvOBDbc
         oYxUDfJqyAVBOSiR2wJOdJO4jsPai/JMgyfaa8sW4ftwIeyJbtacRM1inKSeTejXZDdf
         WB0pX2XFT6zn8mVmTtJeuDRZ9mUkAeQT+sVw3diK/a+yYlSbQE4sAz8u6WsuB0E497xE
         i+Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765288087; x=1765892887;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PLZGxZfGPH+m9Hz1QW1ANR0vUG8mNwWWC1iVjfNrwBw=;
        b=OK+FAjof9txmvIVwD9dmWVMH15izypP0m3d4uFPDiin6MkRkCcY/IUVXdng4o680bX
         FbfdHH0WxMAw622ZbpnPoehNtpckfY5do5aagdLran9D9JyUe8K+ra3p0+iFzsVsf4fL
         qPgIzms/cLe3Fq+m0199/IRcFMCRnp08K9FXbG9A3WmnaE9ewblMG0b7vYBCfNCKNuK0
         eR7LEpILugIIq1YpPE1b3mCzUUsj9Jp1g15u5Wrdxvt06ckCd6QlOQwFLXj6s74NanAU
         etbXLq3bxSVNfvAj90pEgwwVEvp7UvkavwFvX687cfbwXjJT60Z6gemvzkR2UBJpdCVl
         8tcw==
X-Forwarded-Encrypted: i=1; AJvYcCV6o8CbZyRRMHCx23Qu9ZeGjm1iF4IDbWmijn92fLZiLmGeehiW0XNpeY8ko1nWyYFc9vU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwkJjrrX7fy19nT+A5Kn+qEJ2ExgicDwW4OQTjHQ7VLbXFR2yOu
	dHUjGxo6nSa00rZJGbEDQlQTOlhKO0vfvhY19N5ueEqRWPjZcPbkEEzD9fsyXSV6fXhxpzvYc4y
	IIeOlIbyjZ9yimlAZdzXvHleUXhY4wjxXVqa2YF4iSA==
X-Gm-Gg: AY/fxX6SlrDcGlsuQWNYDQgobFnk0IREgh5v3O0YXNgTQvj6N2zk99tbt4ML70FP+FM
	T23MQZuLJ+mRI+2z+2O79MTw+UNweojxUCbIMEGO8R17ZUKBc+PgGDgTaNSnJlysXrixb/s05ch
	IPMsVX+aQsr8HWpUt1uC3b+/Ogxqr1ZOF2lPq9rGRLZgPOw/32i3lFis0flAJa5lOiMLSfKGn/F
	lbKCTQxwtTI5nfrAmR0H+icHXHh8KvRpk1l0Tf4BaJoxGFXOnkdnsDPvDnRiUnbG4x8B8R7
X-Google-Smtp-Source: AGHT+IEhUYw77OAuRxBe3uwIoYgLrjRR2ua77WK+8dBaIDSS/4dMnfDxmkWH5Vf8ObUVvDYmN/ivRcBPoD/iRYvRkdY=
X-Received: by 2002:a05:690c:6307:b0:786:4fd5:e5cb with SMTP id
 00721157ae682-78c33c019bbmr104464077b3.35.1765288087582; Tue, 09 Dec 2025
 05:48:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251205071729.83857-1-ziniu.wang_1@nxp.com> <DU0PR04MB94962D103B1A92354CDD1FE690A7A@DU0PR04MB9496.eurprd04.prod.outlook.com>
In-Reply-To: <DU0PR04MB94962D103B1A92354CDD1FE690A7A@DU0PR04MB9496.eurprd04.prod.outlook.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 9 Dec 2025 14:47:30 +0100
X-Gm-Features: AQt7F2oaS3uBiOmr3kjDFYVzcu04ROd5j3j8IYFRAzYsQq--q0dUbLCTRNsuSTc
Message-ID: <CAPDyKFpYU3PZs-dSREyGyyyoptY0zCQmHP+mxMMgvYQL-xXQZA@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: wait for data transfer
 completion before reset
To: Bough Chen <haibo.chen@nxp.com>, Luke Wang <ziniu.wang_1@nxp.com>
Cc: "adrian.hunter@intel.com" <adrian.hunter@intel.com>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>, 
	"festevam@gmail.com" <festevam@gmail.com>, 
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, dl-S32 <S32@nxp.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 5 Dec 2025 at 09:12, Bough Chen <haibo.chen@nxp.com> wrote:
>
> > -----Original Message-----
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> > Sent: 2025=E5=B9=B412=E6=9C=885=E6=97=A5 15:17
> > To: adrian.hunter@intel.com; Bough Chen <haibo.chen@nxp.com>;
> > ulf.hansson@linaro.org
> > Cc: shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > festevam@gmail.com; linux-mmc@vger.kernel.org; imx@lists.linux.dev; dl-=
S32
> > <S32@nxp.com>; linux-arm-kernel@lists.infradead.org;
> > linux-kernel@vger.kernel.org
> > Subject: [PATCH v2] mmc: sdhci-esdhc-imx: wait for data transfer comple=
tion
> > before reset
> >
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > On IMX7ULP platforms, certain SD cards (e.g. Kingston Canvas Go! Plus) =
cause
> > system hangs and reboots during manual tuning. These cards exhibit larg=
e gaps
> > (~16us) between tuning command response and data transmission.
> > When cmd CRC errors occur during tuning, the code assumes data errors e=
ven
> > tuning data hasn't been fully received and then reset host data circuit=
.
> >
> > Per IMX7ULP reference manual, reset operations (RESET_DATA/ALL) need to
> > make sure no active data transfers. Previously, resetting while data wa=
s in-flight
> > would clear data circuit, including ADMA/SDMA address, causing data to =
be
> > transmitted to incorrect memory address. This patch adds polling for da=
ta
> > transfer completion before executing resets.
> >
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> > ---
> > v2: amend commit message
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c
> > b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index a7a5df673b0f..affde1936510 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -1453,6 +1453,21 @@ static void esdhc_set_uhs_signaling(struct
> > sdhci_host *host, unsigned timing)
> >
> >  static void esdhc_reset(struct sdhci_host *host, u8 mask)  {
> > +     u32 present_state;
> > +     int ret;
> > +
> > +     /*
> > +      * For data or full reset, ensure any active data transfer comple=
tes
> > +      * before resetting to avoid system hang.
> > +      */
> > +     if (mask & (SDHCI_RESET_DATA | SDHCI_RESET_ALL)) {
> > +             ret =3D readl_poll_timeout_atomic(host->ioaddr + ESDHC_PR=
SSTAT,
> > present_state,
>
> I'm okay with the patch, but I find one thing here:
>
> I notice you use _atomic here, I guess you want to cover the case when th=
e reset function is called in hardware irq handler sdhci_irq().
> I'm not sure whether it is suitable to add delay in hardware iqr handler,=
 I find there is also udelay in sdhci_reset(), sdhci_reset can also be call=
ed in hardware irq handler when there is cmd_crc/data_crc error.
> Adrian/Ulf, do you notice this issue before? Any comments?

You are right. In general it's certainly not preferred to poll/delay
in an atomic context. But if I understand correctly here, polling in
atomic context should not happen that frequently, right?

Moreover, I wonder if we really need to have a polling-timeout of
100ms? Where did that value come from?

In any case, please add a define to specify the timeout and make sure
the define-name has the suffix corresponding to the unit (_US,
_MS,...)

>
> Regards
> Haibo Chen
>
>
> > +                                             !(present_state & SDHCI_D=
ATA_INHIBIT), 2,
> > 100000);
> > +             if (ret =3D=3D -ETIMEDOUT)
> > +                     dev_warn(mmc_dev(host->mmc),
> > +                              "timeout waiting for data transfer compl=
etion\n");
> > +     }
> > +
> >       sdhci_and_cqhci_reset(host, mask);
> >
> >       sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
> > --
> > 2.34.1
>

Kind regards
Uffe
