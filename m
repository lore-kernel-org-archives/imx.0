Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0CF1D88AA
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 12:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228943; cv=none; b=DhPHgM2lOpMt/JV2Q4D/ooDAsWPHPynh7opFTs7fhyoooSD0Z5YVxTgACLDKVn+QyppAUaVT95/I1Mb8bD2SDNlxTPuGvYIyQ4oNx3hnHf5/Ve13hHCT+qYik3kzVOAwzqLwFilgkwu3Ml5Ye/ZAeCpoGSEwvHed20xqUb6fBH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228943; c=relaxed/simple;
	bh=nZZIph3qB+32HcJK3NuoJzO2DWNn41IOv65me9LteDg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ey45iXxNV0YfnZ/CXhoeGccHimkHt8J3AXjTbwlQGKth9exjfnQiPjICAISAhH0tYkLPjuSLfPBFIiITGS98AEnRr3l2wiD3f6q8wvCbCBXv84M9aF/Jb/w2UJ16yPyvAwgGvan0YLM6s5WTWOcscD3pTRzGefh3PuQ0CtmyDU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ptedrSM/; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ptedrSM/"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-e1a7f1597bbso1562176276.0
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 05:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228939; x=1726833739; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0L/CKeeeoIAk/64E8dSvCZoeLN01IuNNAws/7deCICo=;
        b=ptedrSM/tc4pQvLp/Hx7OQp0slUDAAIvUnO5U3XxL2051ubxZqKsrR8fopyryuL5Ho
         g/98jHZAObMM/AQEIPYIFRpnyEUolNML7+/n+W6gLvkl0TN0H2VC7+hbupgFl6MrUGkE
         Hs5N43uztrIEagseIF9yw3JVEVKxHRc6hP6mDoJdKHxBQKgk7x7GzQLgAgsLyFxE8JHX
         ONRODCafMQ6KzzimFbTGmJoTvdD528R+pdGPeUpmsUw1n+HKudO2QHeABEF7iVUZWV8k
         Yy0a65Orn/4JC4BwRGDqCZQIdxxmrszRlmaCyEFT/nIcZWbEse1UhXbkF4gA07TB/hbK
         0+EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228939; x=1726833739;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0L/CKeeeoIAk/64E8dSvCZoeLN01IuNNAws/7deCICo=;
        b=nKK7vw7Rt7Og32pFKvlbKeNLXIypzbU5Vvh6nkrAjI+5WDHnj9gi7Tfm8sLNKl6dtZ
         cYUfk/ihP/pVfqEx4L0nNjI3lUnr1qVvt6AmTPto9SKqyfc8Fhg9bc+eyHfESOkNLYE4
         x+V0aKMh4XKYu4sCRX6BiMgIhrQOhP068Alqd1/kNid0ISkPA5nJCeGZemrnkR9ylFWS
         G7rpJdPAVHzeqnDCHcI78azyc6Xoi38T34BdoocY+eU01PZslFEBCdEwMC1nSKBBIgX0
         Qi5kRLUv2Q/cFIdyvBTo1vq+xr9Tc/ZoVwxv49FeI3p+sd+x/mu5MYHFSrBHphYs06jR
         wLNw==
X-Forwarded-Encrypted: i=1; AJvYcCV2OiWkS9Gi9jThMhSnbri7KETmXfdmcrHJoyvSPQbS/hE7P60bPZAuv6tLl6LJFdocSyM=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv1YXid9DlJhq+tD3acBcd85nvvLCHQxv6pzDEHiNta76THwsI
	nVNiBNUP0bpNaqhg7g1zAk5gix+Pxc7vic0vy5OHcP4hp+cVO1huc9EoVu+l12DygHWVF+e8jsS
	JHcOEb6H4kqmTO3tV82hXzlyc4oOxXsDAbOVFWQ==
X-Google-Smtp-Source: AGHT+IFZgURqTXFx8rivzcDZVs3brlX5pRkhtUBectyP+qaKbv1UEElsRCVAJCZe7+cEgvaaOmDOn1XGpQ5OsqWHboE=
X-Received: by 2002:a05:690c:46c6:b0:64b:1eb2:3dd4 with SMTP id
 00721157ae682-6dbb7039720mr47687277b3.8.1726228939342; Fri, 13 Sep 2024
 05:02:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com> <20240825143428.556439-2-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240825143428.556439-2-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:43 +0200
Message-ID: <CAPDyKFrfeKTMW5R6=GSu+t4bY8ebQgcvbzc5wUcgBbSVQWRS5g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] pmdomain: imx93-pd: don't unprepare clocks on
 driver remove
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Aug 2024 at 16:34, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> The removed code was added to handle the case where the power domain is
> already on during the driver's probing. In this use case, the "is_off"
> parameter is passed as false to pm_genpd_init() to inform it not to call
> the power_on() callback, as it's unnecessary to perform the hardware
> power-on procedure since the power domain is already on. Therefore, with
> the call to clk_bulk_prepare_enable() by probe(), the system is in the
> same operational state as when "is_off" is passed as true after the
> power_on() callback execution:
>
>  probe() -> is_off == true  -> clk_bulk_prepare_enable() called by power_on()
>  probe() -> is_off == false -> clk_bulk_prepare_enable() called by probe()
>
> Reaching the same logical and operational state, it follows that upon
> driver removal, there is no need to perform different actions depending
> on the power domain's on/off state during probing.

Well, I guess in most cases genpd would have tried to turn off the PM
domain when it is getting removed. However, there are really no
guarantees for that to happen. We should probably look into that as a
general improvement for genpd.

>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The above said, this still looks like an improvement to me, so I
decided to queue this up for next, thanks!

Kind regards
Uffe


> ---
>
> (no changes since v1)
>
>  drivers/pmdomain/imx/imx93-pd.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index 44daecbe5cc3..fb53a8e359bc 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -90,9 +90,6 @@ static void imx93_pd_remove(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct device_node *np = dev->of_node;
>
> -       if (!domain->init_off)
> -               clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
> -
>         of_genpd_del_provider(np);
>         pm_genpd_remove(&domain->genpd);
>  }
> --
> 2.43.0
>
