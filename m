Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7491D935F
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228945; cv=none; b=kEQmA3t+V13n7QayiXk1Q36hy58EIcx3V7tAiYnIjjHUtlQ7K42Fxxivyfh5dEWyIpSBk2Fov4+PyyEJjYlv/32cd+ImzF9MDpP1G4H1JVBowB8xCPKAD7vvNsUFbHvSWUn9jW2xX/zyM3aqI/OZtvGOCkh5jhvLZoIDbFIJiYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228945; c=relaxed/simple;
	bh=xq52X4izzTGGeGD0h4REXhT37n5h+HRXNX1b1mCLlps=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AApwoviNY4MqbVdYkSgc+D+bR7PcesmpqJwWaWixh2oMHitqITiAplrPOS8hr/5ycyAp/cQKtU+lg6sEvYNy2LOWaY8zNXQz/XxEGxePy88V/Qw8AZaLo3So/lMTXR2JI98ak8f0WuvB5yaxXmGsRjuCqIVeD9srAPSbHaTw8NM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0jQpjxD; arc=none smtp.client-ip=209.85.219.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0jQpjxD"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-e04196b7603so1902799276.0
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228943; x=1726833743; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b5vJYLAw6LfW5JlVpNstXeXKwlbfZrfsNunfO3F9ncY=;
        b=K0jQpjxD3ntTApEMUgpYmmm8pbDSL33PnnsN0iR7WMeybqDwwfYKB8RL9Nk/gsBpEP
         deOPQFLqGye810C9ZeqMARluzZ3Xt2Gic0zaI3wRMHBRHdqpPq/1E/aOsd27RbWsSYCH
         AEBXEDHxfJVkpLsNT+ZRS3f7qEhJEx5xI3deNeny23Q0xdCxdSaFJIwcSaG53J4lSrE4
         zlhE0rP3dmyyErLyaamwuXDtYr0PGjvbMYr8SJVPVmDXw+KPSMTriVLlOuWRuaRqys9x
         Hi/MZhWOzU6eQfrDE7apSfcTJaSvaeN0m0BhwoNG0chGWgiYiJqCVPoQbmAi8mC3HhMK
         QdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228943; x=1726833743;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b5vJYLAw6LfW5JlVpNstXeXKwlbfZrfsNunfO3F9ncY=;
        b=jAIWcBe+PtDXlTN/n8rP/J9MUUsCUB5S0VG2fr9AcW42WtUL5rYUHYj5J3Hu6h1nJH
         FHm1cpwlSSpHUwZzSOcMGRMyP5Y6UBO+0jk9XeC2L/IAulXpeVl3NXoI/K14Xjb8b9KK
         4kuvfyS6SsdVfXKBO+mx1SsHYx+cJzC4EO/fWnQk2/o6qhcjbQaaODVrNM4zYzS4h2To
         +2YpmOGwXNCclLzj79YO8/+nWnmTTrL67YVrm8enPAoFkRa3q7HcP81PPdPZFYS5sSBY
         hSIfPrZ+XDHJcbNe0YCoqbT6/YIaJId7NiYCao6OxYg/7qccr/KmJJzMXnUpk3cSeyNL
         bfKA==
X-Forwarded-Encrypted: i=1; AJvYcCVCw94VU3JVo/RCaIqL65j6LyGcQy/IF1ve6C4KdE+0fnOWzkEQIjIcHDjJRRFTQgs3bJc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6hjgGwilbaBcYjwYpLbFA2LOgdPG4k/Zz35s31zgJn0ePz5fb
	OGJKleKT1XyhXNKjQWkuWS2BbfRCTN0ux5H/02U8etpYkgjERlY2vCrf+BMZNl2hSRv6SG7aS/b
	1DGbk7hbtBwKAhLlp4JJv3hs5vY9kH4zakLdFlA==
X-Google-Smtp-Source: AGHT+IFQpLMOb2ArVCK3W98VSnKdRZbVOJ4EKZFMdKxG+HpYDqytbv3LW6pkSdrJcbfv2WHNAhhoee60un7J4w7BPdg=
X-Received: by 2002:a05:690c:c9b:b0:6ae:e4b8:6a46 with SMTP id
 00721157ae682-6dbb6ba1112mr60834227b3.44.1726228942612; Fri, 13 Sep 2024
 05:02:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:46 +0200
Message-ID: <CAPDyKFrY7ohfWw+boNEph9+NfTW7uEYKbuEnbk53Ne5XJPXuiw@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] pmdomain: imx93-pd: replace dev_err() with dev_err_probe()
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Arnd Bergmann <arnd@arndb.de>, Fabio Estevam <festevam@gmail.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Aug 2024 at 16:34, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This way, the code becomes more compact, and dev_err_probe() is used in
> every error path of the probe() function.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> Changes in v2:
> - Drop the extra { } to be even more compact.
>
>  drivers/pmdomain/imx/imx93-pd.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index d750a7dc58d2..44daecbe5cc3 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -125,11 +125,10 @@ static int imx93_pd_probe(struct platform_device *pdev)
>         /* Just to sync the status of hardware */
>         if (!domain->init_off) {
>                 ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
> -               if (ret) {
> -                       dev_err(domain->dev, "failed to enable clocks for domain: %s\n",
> -                               domain->genpd.name);
> -                       return ret;
> -               }
> +               if (ret)
> +                       return dev_err_probe(domain->dev, ret,
> +                                            "failed to enable clocks for domain: %s\n",
> +                                            domain->genpd.name);
>         }
>
>         ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
> --
> 2.43.0
>
