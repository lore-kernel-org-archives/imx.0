Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAF6F2EA736
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 10:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795559; cv=none; b=JfAjJ0v2/dJTP5UQi1VDJbzXd+mjfbgwVSIuBWJoz5O86QXLQ+V56MPC9o/rEXVjQLWnWNzZHm/55igUSGwrnhp3pxf5iJeDjgd2VA1+FIJHJoNgsuzRoq2x8n5LEIM64yoRAml01RnPv2elM2LOG4vC7LX7o3iNPhpyNqzISVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795559; c=relaxed/simple;
	bh=dgLH66wmZN+5x92SJlx2bPunxAKU/QVWJ2EghvU0KZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VJvJCyVI+nYEaeiDohZ2Z7wH1dxi9uEVugEO5lI290pIwA46laQf9MTnyX1Fq9ui+L11VlOB+qGKQ5t6lAstNY+wlRs1NNpfDKAcoJiNW8A8Mm5+r6P2cBmi8JlJZx+sCZeOIiPcmUQcUfKW4dEssWHVvBsPWENJCSwF1VNnmC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=O32YUQeT; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="O32YUQeT"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d6014810fso6902467b3.0
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758795556; x=1759400356; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=O32YUQeTt/BJvYj+Tc6dIN6zwGQs8XrC/wtIXm6++fSTVpdXcHNNm5w5VzXEFADCK/
         PSkBN6+i8OdOgldsCnV902fqY/6c1lgB5r/Jmf8qh6Ug8lHvj9TPW43DQpbpg+KXtd3D
         BFrdQWz+skHacaOY21onUVMuedcirIzwNNXFG8Z7a1k0lvbnQ+8izsEraEVronRN30dh
         t5WztjtULvYeNrlr1ys0yFRciVXyY37LBAPWG/kV52SIw7HetYqqgePst7EVQ95EgKVO
         RxD9+Zn0xZTDmMwb/4vuOTztHdGNoeTFvLF3CpPENOXI1XKXxonDK16iautPFYsx521O
         e+bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795556; x=1759400356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tfJ32hMp/SXase9EIClmjehsriaoWao+oyHfJjiFbug=;
        b=BsADMBWtBw1y90aBfnNRZkv5RMQ0RGXrgCyz+1Dg/Pavr0TxYHB0EcuPMzQtDE0OA1
         DI2jlwzQzMbzrcFwRo1+FlZKJawHyutMoJh1rdNjxQyGL4qTuqYSJCVvyNe8OqzmcMRT
         HKFqJ1NVE58+1WSvu3N/r6TprGZ9c7Uff/K7P3MqrIedBq43kG+76xC7yNN1dM94mNhC
         uWUZZbQF+5Umvw6N+8wLOrUCq5i8cH1bw5+gZxC8zLmSyTZpC5LHBa+XZwK0Euc8nV2Y
         be0P/v8O5hR0K05VJlzE18WFZ27CXxAq5+wZEJ65ChM8VgjlyJULOYyEHJvTqpVGyfb9
         t4kg==
X-Forwarded-Encrypted: i=1; AJvYcCV3VsKeriwQDaDXZr0jLXiLBDHQI8JGveO3N0bjjVFZKu/L8i3sRTHf8W2doo/x6gfl+LU=@lists.linux.dev
X-Gm-Message-State: AOJu0YyMvfDpsIdapyUuHMCadUBRVZlRk9Apu0+lgv7/CZ6uLbb3glPN
	jlbUCR5XCU0iD1FlrVtfMJ8cjEl4pvN4DR4S28SlVJWqlL4HFbMYG8e2czfyhNFzhevgvfKlBUk
	f1LAu2leWhFOeMwXzgDHwhpeY5vadljcwrIxQxmkISA==
X-Gm-Gg: ASbGncvFdpCUstahXUVeL70qhbuSgLgT8uz5skj5GtHdGG/wYMZsTdgGWY7tiVY1X4U
	wjG6hHww43oaXNYuJt5NF4/KxVPZOav/ShBOS+HD3L4DTwpPacc0YDYroRoa9uOtZkSBGaLJJ2D
	HqBcsCXV7wIG5oqUPTGdhC9LH02q4BTKG75Pjk9oAX3yp047TovxEnfuyPWAy+syOOLUR3yi6oC
	HimXJe2
X-Google-Smtp-Source: AGHT+IFqegPV4dsBkr5tbUoAw3Bm05qqiJTdfJDLdA6jeqSgBdmgnNcHPAYMQZGNKgLNwd05Ndo4qwVQgs+KcKU2zhM=
X-Received: by 2002:a05:690c:61c8:b0:750:bb77:4433 with SMTP id
 00721157ae682-764f444f932mr17758937b3.19.1758795555565; Thu, 25 Sep 2025
 03:19:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com> <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
In-Reply-To: <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 12:18:39 +0200
X-Gm-Features: AS18NWBVvi4sa4FYZSi9ELVd8mD6lGopH5aCYkeAuSPCLUa8dQJVAPN_Zi7EgaQ
Message-ID: <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
>
> The order of runtime PM API calls in the remove path is wrong.
> pm_runtime_put() should be called before pm_runtime_disable(), per the
> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> lead to incorrect reference counting and improper device suspend behavior.

This isn't entirely correct as it depends a bit more on the runtime PM
deployment.

More importantly, even if you would call pm_runtime_put() before the
call to pm_runtime_disable() doesn't necessarily mean that the device
becomes runtime suspended, as it can be prevented by user-space for
example, assuming that is the goal.

To make sure the device is put back into a low power-state, this is
the typical pattern that is deployed in a driver's ->remove()
callback.

*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
Not needed in this case, as the runtime PM usage count was increased
during ->probe() and not dropped).

*) Turn off resources that correspond to what the runtime PM callbacks
in the driver are managing.
Not needed, as there are no runtime PM callbacks for the driver.

*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
makes sure that when ->remove() is completed, the device is in a low
power-state and the runtime PM usage count has been restored.

*) If there are PM domains, those are turned off by calling
dev_pm_domain_detach_list(), or from the driver core (after the
->remove() callback has been completed) for the single PM domain case.

That said, one could consider converting the pm_runtime_put() here
into a pm_runtime_put_noidle(), to make it clear that this is only
about restoring the usage count, but I don't think it's a big deal.

>
> Additionally, proper cleanup should be done when rproc_add() fails by
> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> the device in an inconsistent power state.

Right, this deserved to be fixed.

>
> With using devm_pm_runtime_enable() for automatic resource management and
> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> enforce correct PM API usage and simplify error paths, the upper two
> issues could be fixed. Also print out error log in case of error.

I really don't want to encourage people to use
devm_pm_runtime_enable(), simply because it's not always a good fit
when making sure things get turned off in the correct sequence. In
particular, as it's just about saving one/two lines of code, this
doesn't make sense to me.

I suggest you follow the similar pattern as I explained above for
->remove(), for the error path in ->probe() too. So, calling
pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
for this too, I think.

>
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Kind regards
Uffe

> ---
>  drivers/remoteproc/imx_rproc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..12305f36552fb5265b0953a099ea0d561880e3ff 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1046,6 +1046,13 @@ static int imx_rproc_sys_off_handler(struct sys_off_data *data)
>         return NOTIFY_DONE;
>  }
>
> +static void imx_rproc_pm_runtime_put(void *data)
> +{
> +       struct device *dev = data;
> +
> +       pm_runtime_put(dev);
> +}
> +
>  static int imx_rproc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
> @@ -1125,12 +1132,23 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         }
>
>         if (dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_enable(dev);
> +               ret = devm_pm_runtime_enable(dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to enable runtime PM, %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +
>                 ret = pm_runtime_resume_and_get(dev);
>                 if (ret) {
>                         dev_err(dev, "pm_runtime get failed: %d\n", ret);
>                         goto err_put_clk;
>                 }
> +
> +               ret = devm_add_action_or_reset(dev, imx_rproc_pm_runtime_put, dev);
> +               if (ret) {
> +                       dev_err(dev, "Failed to add devm disable pm action: %d\n", ret);
> +                       goto err_put_clk;
> +               }
>         }
>
>         ret = rproc_add(rproc);
> @@ -1158,10 +1176,6 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> -       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> -               pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> -       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
>
> --
> 2.37.1
>
