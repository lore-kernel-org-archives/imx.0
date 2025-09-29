Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43483054FC
	for <imx@lists.linux.dev>; Mon, 29 Sep 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759151434; cv=none; b=c16311Sd2h+Ylx1ORIR+9eNg/1EyEdhnKP9apIkSg8yVwG3at7YFrySVrsQVscF/rmtGUH56vnoRqyeuOTxrUmkWd3FdxLmmN7+Fd+lHhqTsc5KYLudWGBX+Ovu/VwnBgJPjVGWoezoQPVb1kEPo2dSVkk0Ft5soo7Rziecogts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759151434; c=relaxed/simple;
	bh=zldeIVGYldYbmC65e0hKwaIJnCH6totj0tsfM+V6c/c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cq/fZYEAWiEkRjq+7WWaIG2k+VbArOoE0GOR3m3U/SITQkR4sWzGeLRgV4Z5kk/npDOBswQKcc82tRwVgsdBFG5jkxXFJhPMEelKRcTf0Cbkv++KGq4wmR6iPZvHKLnQo7JMTcIkL6YhTj6ex0IAGnt9lz8MuQfMSwSp949wLNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=klLlJb29; arc=none smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="klLlJb29"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6354a4b4871so4274581d50.2
        for <imx@lists.linux.dev>; Mon, 29 Sep 2025 06:10:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759151431; x=1759756231; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=klLlJb29rIKww00ldePsLIHviLUBu9eZ5rvDYhnBQ8gGSCWkMPEqOGzQ4ieawv7D1r
         iXFfEtJAWJLlS5whGCq/x9qfkeo+1c/M+v20/+2TRoHPQ3HglIkdSeq3DAfEthEWCL2A
         2UcWhGYCYinnnsAoE7YV76vQ5lv9WcNOTcaCJy1Dd6rB7hC93slRgcE8gBwFG8AIg52c
         DJHrvAAd5JxBmJ+bT5ezQyjO0t2f3U5gxkh9af0IP0F0sWAb0IR0dCzeG/jd+bSmBQsh
         1B43PPwOrEwHaxqoGLW1uI7hUlP2rOCqxJGtMoUBczAzXETmp21Pl400eInLsQ2mmsRL
         CdVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759151431; x=1759756231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TIgtSwakb4S2F49hv2ah0ceDD3kdcrnl68lJO2bz2SI=;
        b=YaAwqWMkk3ppgDVfomcAR4rbXe++wcjrfbiKLbE26t41kJOlO5zitMMvy4nFxJll8u
         UF9J96nYRsa8r+avRFyC7iwtvCXNYqAPzejUMQjxrt0Oy+/t/GSAr618B45Pj06BrnEj
         XMsXMVyVhleh9c9aWo6NMaybr/ZI7nJ0KRJMgFnJfRx+DwyS9gnQ/77tOTOu8mYTFtcl
         m+hQ+leWs4quWJxr2EouHC/V0MTzJp5Ep4ZD40/2yc7opZ0eZfGhOY9E7FdtankZJd22
         G+58sBwL+VKhUKJQtmRRYtdbGB/Am5gK/ppji+BhhDGJudWubgAd26dRYBhhu4a4TWMQ
         HNcQ==
X-Forwarded-Encrypted: i=1; AJvYcCXi9IMd40v0a1IY2Qkeqr4EXS5k/J3x/RQmYlPqkgtOlBzG5zoz44lF0AyiZcp4TAoKSMA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyKC3HLdopt7ndZ1wKouhCKhjnRBdQNGdsdvqyHYRwwTKk9fffC
	IXh1IAtITO7RFeYirlLTL51FwRIqUfZ0qUrzdenKaVoFz6jdHpwsqaeRmkaPXcerSUws1E80UuJ
	1evB2Wh9Dyo1xxHATEuDpGaLTurfSUy+MvOkVwW2aMw==
X-Gm-Gg: ASbGncttPz+lceHj/3iLnLp7fStvJjCiSypQGnaYazTP3A07ewCgK4j5zAElFvNpJUl
	ioxfjo9a0G/HiWycR4ZZ9XwEkXxAqfiWiFlU1uQYTlUSLFDwUV6264Uyst5SUOZz8r8UsTcFdYE
	Ot9D8j+uFjUZEmCp09fs0BCWmyhYo59jEwOeaq9kpKmdJyIspVI8XcoFJRVWYQDFF76GgAsobjG
	zUlai/wPm1L+p6xiAY=
X-Google-Smtp-Source: AGHT+IEaqhle1COgySgMHCGl7/RAGDslrMpVmtc/WxzU5IvlxnhajJDxwCn8WYXyXNTN50BLyVZqReaPXPJrWYY1F9w=
X-Received: by 2002:a05:690e:154c:20b0:639:2794:3416 with SMTP id
 956f58d0204a3-639279436b2mr3662726d50.19.1759151431542; Mon, 29 Sep 2025
 06:10:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250926-imx_rproc_v3-v3-0-4c0ec279cc5f@nxp.com> <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
In-Reply-To: <20250926-imx_rproc_v3-v3-1-4c0ec279cc5f@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Sep 2025 15:09:55 +0200
X-Gm-Features: AS18NWBrMVxKi_O1xz826dCqJxNTtrsBYTk49Oo4lKT0mm4rt1UcT29ebmOL9cg
Message-ID: <CAPDyKFqsDjn2+6XxY=Dkv9qZ6weTaeChwsSHvnHFnFzbYQ9bUg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] remoteproc: imx_rproc: Fix runtime PM cleanup and
 improve remove path
To: Peng Fan <peng.fan@nxp.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Hiago De Franco <hiago.franco@toradex.com>, Frank Li <Frank.Li@nxp.com>, 
	Daniel Baluta <daniel.baluta@nxp.com>, linux-remoteproc@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 26 Sept 2025 at 14:33, Peng Fan <peng.fan@nxp.com> wrote:
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
> Fixes: a876a3aacc43 ("remoteproc: imx_rproc: detect and attach to pre-booted remote cores")
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: Hiago De Franco <hiago.franco@toradex.com>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
>  drivers/remoteproc/imx_rproc.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index bb25221a4a8987ff427d68e2a5535f0e156b0097..8424e6ea5569b9ba6b07525643ce795faaeb2898 100644
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
> --
> 2.37.1
>
