Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4301DA102
	for <imx@lists.linux.dev>; Fri, 13 Sep 2024 12:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726228949; cv=none; b=iDepjieevfA3zQYX6TdISmAZiVd2Go4Uf0b2L0UpPiXxbMLJIKlYwGXDuc+kA4R7NJSwg2Lht+y37JkEoclIK9qufzccsuEPpmeo5Ca52PkXj9BFfdV4oV+ZIXLbHM4eDHp0dOpQIp0MTEg8qhT0wSJvIJUvs32+dE0cE9mebjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726228949; c=relaxed/simple;
	bh=5ecyZVpYI8q2kAC7DnbFHrixpgS8zfec8GgteQKL9vs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QEXe/qteUomzmqPeNlRY862xQGWvd5rtnlez8hdiVV/zAwI1mbUgwWt4t37LrvwIsdpPjp5ra02q3bJ4wI5qGycXOwnSxrHdoKkhUGsVu4LXz2IOOgHjhqiJuek03zhZGrr/5z2wEAqdcZs+6fpr0m0Z62dDGZiqw/CeTe0QqhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPpYYui2; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPpYYui2"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e1a7c25e350so835406276.3
        for <imx@lists.linux.dev>; Fri, 13 Sep 2024 05:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1726228946; x=1726833746; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aUCJeUdbCtTzlTdC7hKAZDf0AYKIsmkYRDth/Vcc+GU=;
        b=EPpYYui2zwlncHKHLAHX6q0LORzb81YZU844YLHRTqnuLhp2YG4vcOsJmZPSe80k82
         P4jYoAvzeyI7eS2tCXfVONNLhbAW9sb9BmMdWLCHTiKhfWKxPVAo6waeGYAKUhCxJjZD
         /vricfawCc6cEBo/UUoXs7AzFHRKpcqO8YYe1GjM3kmPataszup3YrCz0cZLhWZ622zd
         O0SNz+8nO8d5t2J/smSODJYqDg7YCErRVnSyM4agOeoWsQwnTSyWWuLYTCP41k2xrErE
         ehMtFoiTxotnsy3S2EPBTIpvaO+h13r0g7gPTWcKnvb25VwgueKQsXlQgia5bDN4/1v6
         qNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726228946; x=1726833746;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aUCJeUdbCtTzlTdC7hKAZDf0AYKIsmkYRDth/Vcc+GU=;
        b=FuhjyfN50Jy9gogfdUwIiRYp+Yn5AqqKF74PzJR9hjHovQ8U1BTUnLdf7FGFUmfruW
         iYhrTP8dD32cCA9ONI/ASVx7hTIjq2UQ33iF3j/6kQuuR7SgpazBAIj4PGLhV/1+knyX
         r9Z4v8qtJjnML4JrzfHrZIejSy+TC7b3cC8REib7qGyvCWMF/Nr/mnl7dgt53NuDrZmd
         zpwd/5Z3GM9VELeohhUVjIEuvM9gnN6yrXk4aD8pSLX+sGo1Bzpbi/bH43HyktIAeWqY
         JIt46u4/XYbU4xZw70+eYGTUo6ceqDgOrlc/sOeIwmt+KbLhIMiMnY/KI9Nc8p1pSvl5
         6TnA==
X-Forwarded-Encrypted: i=1; AJvYcCWEw7T8WQE23AOsvFkppyEnnuJhY81rWmEprg9ETz6O6P5w71hbObzN6xsapZGZvDQRR/w=@lists.linux.dev
X-Gm-Message-State: AOJu0YwiMPhy8ea9wwij/z7WM93iDgmqzG9hplbITKWVn4WteJ/+frSE
	MfUb/QzfgDgxlNCn7RGnfFsQUzY44MXo1aTC83vLcvsl8gGdB/jin3yNKOuw+qTwIOJabdxwyX/
	3jVMYDEBg+KzhilczG5eT9JNSHbjhIPjiRZD+XQ==
X-Google-Smtp-Source: AGHT+IECNxvcFi3ScZRYjWcQww81p9XEb9hR+bYUmttrCAW18q0cmnkWFae6PLyr/4yCBmR962PjB7HU9kMt0j8tTw8=
X-Received: by 2002:a05:690c:4989:b0:650:859b:ec8d with SMTP id
 00721157ae682-6dbcc29ef68mr21668657b3.10.1726228946301; Fri, 13 Sep 2024
 05:02:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240825143428.556439-1-dario.binacchi@amarulasolutions.com> <20240825143428.556439-3-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20240825143428.556439-3-dario.binacchi@amarulasolutions.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 13 Sep 2024 14:01:50 +0200
Message-ID: <CAPDyKFoO4UUuJf6G7BTx-4LNpKVY8gJvZ0dj8tWP1E1aJiHYqg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] pmdomain: imx93-pd: drop the context variable "init_off"
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Fabio Estevam <festevam@gmail.com>, Jacky Bai <ping.bai@nxp.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 25 Aug 2024 at 16:34, Dario Binacchi
<dario.binacchi@amarulasolutions.com> wrote:
>
> This variable is only used within the probe() function, so let's remove
> it from the context and define it locally within the same function.
>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> (no changes since v1)
>
>  drivers/pmdomain/imx/imx93-pd.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index fb53a8e359bc..25ab592945bd 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -28,7 +28,6 @@ struct imx93_power_domain {
>         void __iomem *addr;
>         struct clk_bulk_data *clks;
>         int num_clks;
> -       bool init_off;
>  };
>
>  #define to_imx93_pd(_genpd) container_of(_genpd, struct imx93_power_domain, genpd)
> @@ -99,6 +98,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
>         struct device *dev = &pdev->dev;
>         struct device_node *np = dev->of_node;
>         struct imx93_power_domain *domain;
> +       bool init_off;
>         int ret;
>
>         domain = devm_kzalloc(dev, sizeof(*domain), GFP_KERNEL);
> @@ -118,9 +118,9 @@ static int imx93_pd_probe(struct platform_device *pdev)
>         domain->genpd.power_on = imx93_pd_on;
>         domain->dev = dev;
>
> -       domain->init_off = readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK;
> +       init_off = readl(domain->addr + MIX_FUNC_STAT_OFF) & FUNC_STAT_ISO_STAT_MASK;
>         /* Just to sync the status of hardware */
> -       if (!domain->init_off) {
> +       if (!init_off) {
>                 ret = clk_bulk_prepare_enable(domain->num_clks, domain->clks);
>                 if (ret)
>                         return dev_err_probe(domain->dev, ret,
> @@ -128,7 +128,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
>                                              domain->genpd.name);
>         }
>
> -       ret = pm_genpd_init(&domain->genpd, NULL, domain->init_off);
> +       ret = pm_genpd_init(&domain->genpd, NULL, init_off);
>         if (ret)
>                 goto err_clk_unprepare;
>
> @@ -144,7 +144,7 @@ static int imx93_pd_probe(struct platform_device *pdev)
>         pm_genpd_remove(&domain->genpd);
>
>  err_clk_unprepare:
> -       if (!domain->init_off)
> +       if (!init_off)
>                 clk_bulk_disable_unprepare(domain->num_clks, domain->clks);
>
>         return ret;
> --
> 2.43.0
>
