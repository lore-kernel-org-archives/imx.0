Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4B6128F52B
	for <imx@lists.linux.dev>; Tue, 22 Apr 2025 15:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745336688; cv=none; b=tUw0oeTukupQCFqGCuYKItrdvlu0sdzND1w2hajj7HT4TpcWc4HXdQDOdb8rSX9a2074sYgTPY56t+VlvjvWsKcQIJGofZcfV6XGVIPz8UxjspH9AcO1xQrEv0pceKbPzfk9jHJB+TKzR0i6B4WTJXnSsvJPFVSowgION+/55BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745336688; c=relaxed/simple;
	bh=6qWLggXJPCM0HeOHIa65h9aywtSvV/SIK/9zjhWaRL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FPibrXMLEIg5kZasvg37qVkH9p84rsYB+0iejyMcZ68dWur36WIy/IotCgeB82eQlDV1DnFasTgAeF8J2VTnZ17nZvupn1w9ysHNJM9Gn56cd1VR4qopK7Gz+STMFH6/8/n57tQ6F1siM+6+khlak2JdT7G4VjyWt+z0uuub714=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sGUtZW8L; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sGUtZW8L"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-70814384238so6761587b3.0
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 08:44:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745336686; x=1745941486; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=sGUtZW8LwHVLdzR5GdGbey9BWnOxLjyn4foOrlpDm5lpkJqytfIy1bkBU2tghbewVg
         VVxuNggyGyIXtAVNaRHdkLSgrFlvV2vWPq3VsydN8N4ceGqhNVVfDqWgByDtU3HHAHna
         in0W8EmviJ95HcvWDzRMzWXtCU8OAdIIMPwk8p+Y9CYivXBzW6IAJY4YDvWzFjcUzFSm
         pKyGCr/iCPZiZ37TjieqQUlnE4yWKon3d8EuRn8hPgpkHctCKRvSeBVzzUSvD0OLHybm
         Wz7rs6jfRCd2oEhignKeV2lOcYfBN2MV6mG/m0zRlupCsmuaT7VOQFzRKB1zaWJrLsTD
         nSeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745336686; x=1745941486;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K9ngDNGkZRiVWGtgvkMRHPkUgF6S7Nt/Bo4JqOL13oI=;
        b=Uk3Og9JBeKbhPBbZz3DzZ+5eFOnDDfLtGZK8Bff02vrDZnddZZT6QlgEm7EB4xhRku
         ZvzDCKrd8Z66FAgqbHhVMGDaJVmKKQhGmT7rBX4FvpuNEh9083R4R1rzN4aJVIlVAZPN
         XnjXHDki8wdv+UFKnDqx2/qjZGTG3TSHngsXGgBl1Wlz+mJij0gZ8USjTfnCk3DdAZ9r
         xUUv76cfk7OUebYQmdrbNXuhypU3MWvJvZPm+GiRdi3XbQaiNzNmAQJY1/yIlrL0yt1F
         M9GWquVIzMI1G/Ukoj9r9lsnEZByjlhVpAqIGdgLIUZdXjm+xQPNGeKEtlPnMt2juyET
         jw4g==
X-Forwarded-Encrypted: i=1; AJvYcCXa6wfE8jksfKRxTnXTbRAKQtfEHTjyYAg361xfbKm+IWX4Imod7LCymvIw0q0mWH/sPBY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7yFvwmkf0HXt+7/iNvtoG2+yxgnMjua7JHDBne8zHyJqWNKgH
	fvqDNXiTuuJ2ybwxwAk9FuvviL6vLMZcvXrZra37mu5DvtRahE4hpQcwdH6lim/OF3zGrbKuOCJ
	qA9Krs40bQRxbPUbvy1D4bu4BEqY8EmvsjmEjRw==
X-Gm-Gg: ASbGnctnOQ0/Dm4O1kgsst+CIc3niDbWKt7vivFGJnPrQNzw3Rc+rX5g9bKGDE+RDnO
	0XNlRRP+tSEg+I5lrlXXf/Z/WE/QP9TLKY4Igd/AWDpfZmt7aXyAQlomPZV8r/pVJYY1ICboRA1
	zoH5YLt3ORKIarjhnXmKAIJIc=
X-Google-Smtp-Source: AGHT+IE3NCo/U+OdWL0RzxeIBOTKrxCpneJJYIv5a9wSEqVGqkMe/Lxmi2wisNM7ZZMHxbrfn2WvD6fXWik7UjeBc4U=
X-Received: by 2002:a05:690c:6e0d:b0:6f6:d0a8:8d65 with SMTP id
 00721157ae682-706cce25937mr208437997b3.28.1745336685661; Tue, 22 Apr 2025
 08:44:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250409072604.3410459-1-ziniu.wang_1@nxp.com> <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
In-Reply-To: <ac3546ef-bffa-47ac-9c65-c3250da5387d@intel.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Apr 2025 17:44:10 +0200
X-Gm-Features: ATxdqUFxVnXPCSEBPjHmKlVJnatv7iIefwywUip8-eI--PGoBu-PH0qykz7ZccM
Message-ID: <CAPDyKFpmK3ZGyqgXFsZ43aU_JG8JG-mw751Lcbk3PZ1_9xLnyQ@mail.gmail.com>
Subject: Re: [PATCH v2] mmc: sdhci-esdhc-imx: calculate data timeout value
 based on clock
To: ziniu.wang_1@nxp.com, Adrian Hunter <adrian.hunter@intel.com>
Cc: haibo.chen@nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-mmc@vger.kernel.org, s32@nxp.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Apr 2025 at 12:24, Adrian Hunter <adrian.hunter@intel.com> wrote:
>
> On 9/04/25 10:26, ziniu.wang_1@nxp.com wrote:
> > From: Luke Wang <ziniu.wang_1@nxp.com>
> >
> > Calculate data timeout value based on clock instead of using max value.
> >
> > Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
>
> We overlooked that Haibo wanted the "bit[23]" comment dropped,
> but nevertheless:

I have dropped the comment when applying, no need for a re-send. I
also added Haibo's reviewed-by tag.

>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


>
> > ---
> > v1->v2:
> >  * Added SDHCI_TIMEOUT_CONTROL to esdhc_writeb_le()
> >  * Removed esdhc_set_timeout() to use common __sdhci_set_timeout().
> > ---
> >  drivers/mmc/host/sdhci-esdhc-imx.c | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> >
> > diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> > index ff78a7c6a04c..a34cabee5916 100644
> > --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> > +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> > @@ -870,6 +870,16 @@ static void esdhc_writeb_le(struct sdhci_host *host, u8 val, int reg)
> >
> >               esdhc_clrset_le(host, mask, new_val, reg);
> >               return;
> > +     case SDHCI_TIMEOUT_CONTROL:
> > +             /*
> > +              * ESDHC_SYSTEM_CONTROL bit[23] used to control hardware reset
> > +              * pin of the card. Write 0 to bit[23] will reset the card.
> > +              * Only write DTOCV field here.
> > +              */
> > +             esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > +                             FIELD_PREP(ESDHC_SYS_CTRL_DTOCV_MASK, val),
> > +                             ESDHC_SYSTEM_CONTROL);
> > +             return;
> >       case SDHCI_SOFTWARE_RESET:
> >               if (val & SDHCI_RESET_DATA)
> >                       new_val = readl(host->ioaddr + SDHCI_HOST_CONTROL);
> > @@ -1385,17 +1395,6 @@ static unsigned int esdhc_get_max_timeout_count(struct sdhci_host *host)
> >       return esdhc_is_usdhc(imx_data) ? 1 << 29 : 1 << 27;
> >  }
> >
> > -static void esdhc_set_timeout(struct sdhci_host *host, struct mmc_command *cmd)
> > -{
> > -     struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
> > -     struct pltfm_imx_data *imx_data = sdhci_pltfm_priv(pltfm_host);
> > -
> > -     /* use maximum timeout counter */
> > -     esdhc_clrset_le(host, ESDHC_SYS_CTRL_DTOCV_MASK,
> > -                     esdhc_is_usdhc(imx_data) ? 0xF0000 : 0xE0000,
> > -                     ESDHC_SYSTEM_CONTROL);
> > -}
> > -
> >  static u32 esdhc_cqhci_irq(struct sdhci_host *host, u32 intmask)
> >  {
> >       int cmd_error = 0;
> > @@ -1432,7 +1431,6 @@ static struct sdhci_ops sdhci_esdhc_ops = {
> >       .get_min_clock = esdhc_pltfm_get_min_clock,
> >       .get_max_timeout_count = esdhc_get_max_timeout_count,
> >       .get_ro = esdhc_pltfm_get_ro,
> > -     .set_timeout = esdhc_set_timeout,
> >       .set_bus_width = esdhc_pltfm_set_bus_width,
> >       .set_uhs_signaling = esdhc_set_uhs_signaling,
> >       .reset = esdhc_reset,
> > @@ -1777,6 +1775,8 @@ static int sdhci_esdhc_imx_probe(struct platform_device *pdev)
> >                * to distinguish the card type.
> >                */
> >               host->mmc_host_ops.init_card = usdhc_init_card;
> > +
> > +             host->max_timeout_count = 0xF;
> >       }
> >
> >       if (imx_data->socdata->flags & ESDHC_FLAG_MAN_TUNING)
>
