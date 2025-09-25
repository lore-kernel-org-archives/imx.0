Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01AC219CD1B
	for <imx@lists.linux.dev>; Thu, 25 Sep 2025 13:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758808201; cv=none; b=tbEj+qbhlLHKBrAbbtSfk2kyZly6O1Hq3UUQRwqV6LBQojmwwSRrzkGbidERH5nIh5viOhaXcDOakm8yAzdDOa7f/9bNJbVFwWYE2jajzFcWIKx9cv9+qDQ/AzfWxcTK50RT/yAIUmJZ4ZchVGkgzsXP81WeiPTKFkb8fozrwfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758808201; c=relaxed/simple;
	bh=QTB0zf86mhxCyXgWv4pD+dzux2r8OG2Y9cUTDZFMKQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BotrhCbBcUp2bmmQINqvpB+cbTW1/LZGOScjo5XkxPqihdf1biFTv/hHpmKOgpAwfaNY4a2L3wgGdmSmWJx5uS+3Dlz/54rSI3cF0+dbECRToeJKpW7AKj/LP82buy67aZ9O5xGipIK8bJ2gMMEgzzOiiAf6zLz2GawWoh45cJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bUMPx9QS; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bUMPx9QS"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-71d71bcab6fso11622397b3.0
        for <imx@lists.linux.dev>; Thu, 25 Sep 2025 06:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758808199; x=1759412999; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kmyZXRi73uZYdBVcBjsptiB3fqiGtTcUPx0kUvNWDWU=;
        b=bUMPx9QS4Wk2CVUk6bZ2j/ISaq95WCbZ0EH1htWIKhVBKq7EabQyROj6AM2cESJoWs
         6Wxalr7+fIvFle2hY3lRdhM3UeLrmniEV8Vuz+91e+9Wt9l3d7VPCf1tKJTwJqIC4xBd
         QjXsskLgWulzN/GZ5V1q63ZdCU24IpDhvkqNZzjSyq77vmTEnHCWt1xhgkGF/WNrFTVV
         QwV5SNsts5O81I32I5JKQjQaqOcWBhXktrlSGuwHfuexCuO5CmxdsQWz6h0y1mKjaRAc
         pPdJPnoKTJkDfU+dqIYZ2xqogGu64HUguCLpUjHPzFGu13wmwEofb6iXmhwAZSYUF/wD
         oBzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758808199; x=1759412999;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kmyZXRi73uZYdBVcBjsptiB3fqiGtTcUPx0kUvNWDWU=;
        b=GzNySW+HRzvUqfFFCwwLCDOYLMgAt1RhuIdMgihk/IylWy4IH8pr3T0f+livgxlPpx
         3oU5o5bB5qyRkNb9ObwLsCzhNm7BYDl7OwstfFfW3aosztxo/b7702K/ljCW6/6GzoyA
         2WG25XgNkIA44pySSjQnk950bNLEDZLX+ebn4WkmJPN023cWJxuVcsZyJ1eY2xD+s31M
         s8AeUNbs3/k3Mch2nwiNFORDZU988GjkqM3hW5AnJZWz93xjEdiNRdgmcBDngnw1CBVV
         Wwdj9nENGk3JskiwHrN0dg0Scvfdw7jJ1DCo9TS5vRnZBoBpUltR3ezOuJtxVLOmD4t8
         LtBA==
X-Forwarded-Encrypted: i=1; AJvYcCUysQB8J33xW4KDoKr8LnQhJnd7LxfpBdvJbZ3RqKeQ8WKHereGx3hpRiDoyV21m+lI14E=@lists.linux.dev
X-Gm-Message-State: AOJu0YywTTV9sOFYANcpgPnQ4bTt41MQ53ComAMuIof+lOotTto0LmJ9
	Z4j644x6a8BJuVRSmTE6kH9CPIYYR4KSL5rsKami0xlnNZUZ1yWhULWlpivoF+yWVao7RkgdC/Y
	W14vUD0a4s/L/Z63g9vwqOAmufA2CAnM1pxM1zv3BFw==
X-Gm-Gg: ASbGnctYpKi/0vQ21FOSdBVpTcF3EaffNmbSPSGmYR1dIeZM4kN9ZCkfA6RdFkptE4D
	VPxfkribws+PGU9l7cORBBk+cjthR4krOD1tlILlgUs2YUtee2VneTARcaNl1J5wBZYXwJjG9J9
	u0/jd+BS609Y2PG3iT+BTCSJQdurHGHceY08X9PWTgtLBA69Qx18d17cG5Gx7ztwH8PPZN59NA7
	m7sHxdZ
X-Google-Smtp-Source: AGHT+IGaha3hYgmKpJiOOTZ9mrQajm66T6EOvbyDKUqs9BGv9oHsslH1tx8/pHWIf2OpE+bvRrEoo4jl8LUISCN+73k=
X-Received: by 2002:a05:690c:620d:b0:744:fe4e:b5ce with SMTP id
 00721157ae682-76406cdda58mr31077837b3.45.1758808198715; Thu, 25 Sep 2025
 06:49:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250923-imx_rproc_c2-v2-0-d31c437507e5@nxp.com>
 <20250923-imx_rproc_c2-v2-1-d31c437507e5@nxp.com> <CAPDyKFpjP07826FXh8XveXiH7ta+N=upYaowf7r6gyNWPSFfqA@mail.gmail.com>
 <20250925142400.GA18572@nxa18884-linux.ap.freescale.net>
In-Reply-To: <20250925142400.GA18572@nxa18884-linux.ap.freescale.net>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 25 Sep 2025 15:49:22 +0200
X-Gm-Features: AS18NWBypGVgaTpOeUMZ5LpwCPamsE3X5aIdHt-BsxZusAy24_34jazFPo4GtO0
Message-ID: <CAPDyKFqeWAqbM0td1gW0+Kz2g85xqCuSpQWdJEs8U7MmOPsY0Q@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup
 order and error handling
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Peng Fan <peng.fan@nxp.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Hiago De Franco <hiago.franco@toradex.com>, 
	linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Daniel Baluta <daniel.baluta@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Sept 2025 at 15:12, Peng Fan <peng.fan@oss.nxp.com> wrote:
>
> Hi Ulf,
>
> Thanks for reviewing this patch.
>
> On Thu, Sep 25, 2025 at 12:18:39PM +0200, Ulf Hansson wrote:
> >On Tue, 23 Sept 2025 at 07:17, Peng Fan <peng.fan@nxp.com> wrote:
> >>
> >> The order of runtime PM API calls in the remove path is wrong.
> >> pm_runtime_put() should be called before pm_runtime_disable(), per the
> >> runtime PM guidelines. Calling pm_runtime_disable() prematurely can
> >> lead to incorrect reference counting and improper device suspend behavior.
> >
> >This isn't entirely correct as it depends a bit more on the runtime PM
> >deployment.
> >
> >More importantly, even if you would call pm_runtime_put() before the
> >call to pm_runtime_disable() doesn't necessarily mean that the device
> >becomes runtime suspended, as it can be prevented by user-space for
> >example, assuming that is the goal.
> >
> >To make sure the device is put back into a low power-state, this is
> >the typical pattern that is deployed in a driver's ->remove()
> >callback.
> >
> >*) Call pm_runtime_get_sync(), to make sure the device gets the runtime resumed.
> >Not needed in this case, as the runtime PM usage count was increased
> >during ->probe() and not dropped).
> >
> >*) Turn off resources that correspond to what the runtime PM callbacks
> >in the driver are managing.
> >Not needed, as there are no runtime PM callbacks for the driver.
> >
> >*) Call pm_runtime_disable() and then pm_runtime_put_noidle(). This
> >makes sure that when ->remove() is completed, the device is in a low
> >power-state and the runtime PM usage count has been restored.
> >
> >*) If there are PM domains, those are turned off by calling
> >dev_pm_domain_detach_list(), or from the driver core (after the
> >->remove() callback has been completed) for the single PM domain case.
> >
> >That said, one could consider converting the pm_runtime_put() here
> >into a pm_runtime_put_noidle(), to make it clear that this is only
> >about restoring the usage count, but I don't think it's a big deal.
> >
> >>
> >> Additionally, proper cleanup should be done when rproc_add() fails by
> >> invoking both pm_runtime_put() and pm_runtime_disable() to avoid leaving
> >> the device in an inconsistent power state.
> >
> >Right, this deserved to be fixed.
> >
> >>
> >> With using devm_pm_runtime_enable() for automatic resource management and
> >> introducing a devres-managed cleanup action imx_rproc_pm_runtime_put() to
> >> enforce correct PM API usage and simplify error paths, the upper two
> >> issues could be fixed. Also print out error log in case of error.
> >
> >I really don't want to encourage people to use
> >devm_pm_runtime_enable(), simply because it's not always a good fit
> >when making sure things get turned off in the correct sequence. In
> >particular, as it's just about saving one/two lines of code, this
> >doesn't make sense to me.
> >
> >I suggest you follow the similar pattern as I explained above for
> >->remove(), for the error path in ->probe() too. So, calling
> >pm_runtime_disable() and pm_runtime_put_noidle() should do the trick
> >for this too, I think.
>
> I appreciate for your detailed explaination. I intended to drop the remove path
> in this patchset :), but need to keep it now. No problem.
>
> Follow your suggestion, I work out one patch, would you please give a look
> whether this is good for you?
>
> You could ignore the 'dcfg->method == IMX_RPROC_SCU_API', I will drop
> this in the patchset to make the runtime PM apply for all, not just
> IMX_RPROC_SCU_API.
>
> Thanks in advance for you guidance and help.
>
> --------------------------------------------------------------------
> remoteproc: imx_rproc: Fix runtime PM cleanup and improve remove path
>
> Proper cleanup should be done when rproc_add() fails by invoking both
> pm_runtime_disable() and pm_runtime_put_noidle() to avoid leaving the
> device in an inconsistent power state.
>
> Fix it by adding pm_runtime_put_noidle() and pm_runtime_disable()
> in the error path.
>
> Also Update the remove() callback to use pm_runtime_put_noidle() instead of
> pm_runtime_put(), to clearly indicate that only need to restore the usage
> count.
>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a89..8424e6ea5569 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -1136,11 +1136,16 @@ static int imx_rproc_probe(struct platform_device *pdev)
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> -               goto err_put_clk;
> +               goto err_put_pm;
>         }
>
>         return 0;
>
> +err_put_pm:
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(dev);
> +               pm_runtime_put_noidle(dev);
> +       }
>  err_put_clk:
>         clk_disable_unprepare(priv->clk);
>  err_put_scu:
> @@ -1160,7 +1165,7 @@ static void imx_rproc_remove(struct platform_device *pdev)
>
>         if (priv->dcfg->method == IMX_RPROC_SCU_API) {
>                 pm_runtime_disable(priv->dev);
> -               pm_runtime_put(priv->dev);
> +               pm_runtime_put_noidle(priv->dev);
>         }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>
>
> Thanks,
> Peng

Yes, this makes better sense to me!

Kind regards
Uffe
