Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4CFB19995D
	for <imx@lists.linux.dev>; Thu, 31 Oct 2024 10:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730371371; cv=none; b=ppHTdI6UfjkbID0IlAQalCyFYT2PMvpoHrWhjMRp/xe6hCbekt7EI9PDuvt5kBkGflmdHw4sFCMTCOx5o79T8Q8bV7Nc9I8m7pPSknUmLVfxVofgk+004qXWkketG/vpa0kgeXgzEmgo8sgwzacye+jFhxDCSkBzauUoFSo+Mo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730371371; c=relaxed/simple;
	bh=h1EbepRwORafz4QvAsQccvMuAxqd52e/hAeVw51HNgs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnMj6czn9NXkG2y7NzEm3HloBzc/AXSZFv/MYwEUkzQYM5Nd+QCF/9wmfExwH4JglY0Jqnn0YLyCNYOrrk9SgWEXu4QPD786lVdM5cD0B61RQF03JK+hORSSaxCtEENG+zxJeZj4MsmiJGGWRj0Evqbgk7IPFrk9D7Oju9vOKWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZNHjvc0h; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZNHjvc0h"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea50585bf2so8525987b3.3
        for <imx@lists.linux.dev>; Thu, 31 Oct 2024 03:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730371369; x=1730976169; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=oMMEeFMPWK3k1Mj3t6erHGHrl705TGgxaOatuH/c4Nw=;
        b=ZNHjvc0h2n++jlzm6XLCZ5vKWWxGqkuMdwMzGK56Cvd0fC98VMBX3w7HW0UdMxdD+V
         nAZ4aik1RL82zJbd0UXgykeNJa+M6nu5Vd8P3mIEACG2ixWVokgOf7UD9jLf8xedEAxB
         PO5DH3SXX+2XB4R/jDixd7zLZe1l2HJr4p4/5Npco1tXHsG/w9kvm/EbQqHxmeyfsWvK
         FVB0SSmZ4HYAfmqhJchdngWmM9jzurXTM5EBgsh4RfUGaDH3WPA6RCOm6KKm641ivx9c
         eZwSUajWlfAmTeONCRkNAHCLF8u8dKq0uWeELQfOpCIE3OZCOV836RGR4i9aHNGhbIbv
         UcZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730371369; x=1730976169;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oMMEeFMPWK3k1Mj3t6erHGHrl705TGgxaOatuH/c4Nw=;
        b=lA0DHl5U0k6mLk7kgelBgBk8GnOdd4pjzgswcJ3kH39uwmorsb+lLtTimv4es4lPSD
         mX0OEWSPNJIYA/2NlGo0eRvhk/P/QpvovolxUt3s9xCWATQf068ltyIcQ7CW/rqzDPXN
         senGAwCGw+LCEQS+aJKs8hhoLtJYZN8ng6BBOC9fhvM+5PomY2svbHEYdluBOA5GZhAA
         aLfF0vmUMOGhhyIPkSpO2b5/K4U3mFuoCFkMvbK8mAsgdiU+jIz8/O8zZ2lpsMpckiYv
         OPD5Gb8B7ORhG5QMISdjLNAOBSF3H1wOPbDRi1smPSE4C4h7EC+G5+bc2g3HPWF74JZ5
         AWZw==
X-Forwarded-Encrypted: i=1; AJvYcCUP4VXH59dbmzJn1O0gW3NUruUkMA+PrMYuwppZZYOSfRlf/V4BROW/W/oZuCbKdWwAGEE=@lists.linux.dev
X-Gm-Message-State: AOJu0YxB2gCXYeZjcArCEPmJVb0zm75z919illSkmvtMR31IFm0Hh0qt
	ZXsFanltMnwwbuSkFlryITOLR0+MKTogD3nOrUKfm0s+zS3sdc/z/iK2mI8zRBzThQbGah4QEaw
	Y7rZQf0UDzvce9QpV9B0EG+4Lplsk1P8K545WLg==
X-Google-Smtp-Source: AGHT+IGyiL6eL7R/DPiVFZpGqii4rrnifN6ppsdutYkmenhnXdSBL9hr48zxfp3pOkfOu5iicApNUvdcgoemDUYz7Tg=
X-Received: by 2002:a05:690c:4989:b0:6db:deb7:d693 with SMTP id
 00721157ae682-6e9d8a6ce53mr203324727b3.22.1730371368586; Thu, 31 Oct 2024
 03:42:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241025160430.4113467-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20241025160430.4113467-1-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 31 Oct 2024 11:42:12 +0100
Message-ID: <CAPDyKFqeibF4JAzYZgimUgRN0Lj9K8qSdorxx6DA=j_c5PE9bw@mail.gmail.com>
Subject: Re: [PATCH v2] pmdomain: imx: gpcv2: replace dev_err() with dev_err_probe()
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Michael Trimarchi <michael@amarulasolutions.com>, Marco Felsch <m.felsch@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 25 Oct 2024 at 18:04, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The patch standardizes the probe() code by replacing the two occurrences
> of dev_err() with dev_err_probe(). Indeed, dev_err_probe() was used in all
> other error paths of the probe() function.
> Note that dev_err_probe() has advantages even if the error code is not
> EPROBE_DEFER, such as the symbolic output of the error code. Therefore,
> it should generally be preferred over dev_err().
>
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>

Applied for next, thanks!

Kind regards
Uffe

>
> ---
>
> Changes in v2:
> - Improve the commit message.
> - Add 'Reviewed-by' tag of Marco Felsch.
>
>  drivers/pmdomain/imx/gpcv2.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/gpcv2.c b/drivers/pmdomain/imx/gpcv2.c
> index 963d61c5af6d..6e6ecbf2e152 100644
> --- a/drivers/pmdomain/imx/gpcv2.c
> +++ b/drivers/pmdomain/imx/gpcv2.c
> @@ -1356,7 +1356,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>
>         ret = pm_genpd_init(&domain->genpd, NULL, true);
>         if (ret) {
> -               dev_err(domain->dev, "Failed to init power domain\n");
> +               dev_err_probe(domain->dev, ret, "Failed to init power domain\n");
>                 goto out_domain_unmap;
>         }
>
> @@ -1367,7 +1367,7 @@ static int imx_pgc_domain_probe(struct platform_device *pdev)
>         ret = of_genpd_add_provider_simple(domain->dev->of_node,
>                                            &domain->genpd);
>         if (ret) {
> -               dev_err(domain->dev, "Failed to add genpd provider\n");
> +               dev_err_probe(domain->dev, ret, "Failed to add genpd provider\n");
>                 goto out_genpd_remove;
>         }
>
> --
> 2.43.0
>
