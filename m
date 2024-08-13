Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E79118A6D6
	for <imx@lists.linux.dev>; Tue, 13 Aug 2024 10:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723544783; cv=none; b=V3SUVBD2KLxw/oom6VbvdpTtP+ML1UCZQ0IYX6/hdH0bPSaXGrvieEFKFc7DWVPCWtb1kIk+W4sZ9DO/LWqtT6tINsLAiaIFzgxMajwK5mnJj1fLD99/ApoyTOOD/FeN51An3VhdGBJF0if+v5MTfRHoSpvQT3w5eozEV/nR6Yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723544783; c=relaxed/simple;
	bh=z0SE0DRkQDPcBo47RwO5BjzEzk1vYFugQPsVneEsATs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sV8ZANzXcU2KnKBW3XIsRXhb+KxhuJ6WBO6BmKML3vvWRYtP5qiyEnxEe+BnUSaUC7zBLmQOjohV3GJZpgxzaGuD8bqUOUJnzHzT6TfNvu1ixV8MD0fZq21C6IpL5zQ/rsT2oCQ4aDNQj2EPpGbHmaIzonhxlxM2QcIl7CepNeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gjAhLxC1; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gjAhLxC1"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a7a9a7af0d0so595095866b.3
        for <imx@lists.linux.dev>; Tue, 13 Aug 2024 03:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723544780; x=1724149580; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=MdQQgLvLwClHzzWB9/M5yoQQbZvzDEedy+o4MY6Z6/o=;
        b=gjAhLxC1/YrsgvZ6DvEvxpzeZG30OF0K3YgwcGilicsRsuILWSMGZ1e0BQC8zoLLft
         OmwXDVqzc9uZKD8em1iHqKOQUhShTnCQ4xuD2zQIkXmAZMOQ6qEr+rEWzM1XF0cOPb9a
         5ykrr0azNnRm0pdkSiimOGQO7kJ+rD8kGSs/IqLdT5Op3jlMDsgpviVmFTcKOsC/lhI2
         rharG9S9+rcEAatX8p2pcJCF0+F8jA97CsoHA7utFhUYrd1xWTRTem9+mcJu85OJmsm+
         /DUc2tfakeOR2AY1WRFb8YtcE7KU1uQe0tVVKPUTn+LxqLDg/iG9xDOkCR8iF1HIIWp8
         BfvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723544780; x=1724149580;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MdQQgLvLwClHzzWB9/M5yoQQbZvzDEedy+o4MY6Z6/o=;
        b=oHZvVdFpMGVlxzwm/dg9YKinv5gwrFuEwroyNzI4v6sI4ajSE+j0j6HXHnS27LH609
         u9X8+1bX9wd4lhmKMMYNo5aBhI1RSM+ImHULUIRYQ8lHofns2kiWNCMIGu3GxGl965Y0
         dB1g8X4oVSlvXzZpxCec1LcpA753KuTMoNvKCnpWa3N6MD5QLSRozJgg70CkDKcZS4Rm
         m9bqETLRY5NzOB8lm579a/sg2GRDj7sLIYGoZs37px/qa8ei1aDTLLXz/Uuc8PIyY5Xu
         PTsU7pgsOM+lGYckpg5O45ZdiEoIuP97o+nAUBN/NYmjfDVcWkrFMsAsaAzWBSj3hXMP
         ghUg==
X-Forwarded-Encrypted: i=1; AJvYcCXnYvMnMx4V6HPXtL41eUAhA4lk7Q6hHNkIMaWrHEYqp0VPinat98/vgfMtNhVjt3phLqDxNpi1KT/wLMRofYNbFAmL
X-Gm-Message-State: AOJu0YwILJVVx9f81BqyEkuxfSjhq9+rceQvCOBxVeyNacbgrOOJW6DI
	7f1FL2/NOIC2smsksHp8tB6fTw49PcopikdyXWMHWSpHwiOiLk5Wa5ViES9FIQf3sFC8AUlpGyJ
	eMb6SscTdov0nS4ZlLfkeav4HTAT/r6pHjQax4w==
X-Google-Smtp-Source: AGHT+IHx6zPYh3qSfj3N85WmIDiWhbodIIrS72DAI3Ue6S5ByNRdNzF61bpT+HPkFh24apaBN1cdRGQUtDwUFhZq0r0=
X-Received: by 2002:a17:907:7212:b0:a77:dd1c:6273 with SMTP id
 a640c23a62f3a-a80ed1b5b03mr184722966b.12.1723544779522; Tue, 13 Aug 2024
 03:26:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240808042858.2768309-1-make24@iscas.ac.cn>
In-Reply-To: <20240808042858.2768309-1-make24@iscas.ac.cn>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 13 Aug 2024 12:25:42 +0200
Message-ID: <CAPDyKFqZ1nkhEYEOMtYNxOqkV9npXvuQB93PepAGYSmmpDUkyA@mail.gmail.com>
Subject: Re: [PATCH] soc: imx: imx8m-blk-ctrl: Fix NULL pointer dereference
To: Ma Ke <make24@iscas.ac.cn>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, geert+renesas@glider.be, arnd@arndb.de, peng.fan@nxp.com, 
	u.kleine-koenig@pengutronix.de, marex@denx.de, 
	benjamin.gaignard@collabora.com, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 8 Aug 2024 at 06:29, Ma Ke <make24@iscas.ac.cn> wrote:
>
> Check bc->bus_power_dev = dev_pm_domain_attach_by_name() return value using
> IS_ERR_OR_NULL() instead of plain IS_ERR(), and fail if bc->bus_power_dev
> is either error or NULL.
>
> In case a power domain attached by dev_pm_domain_attach_by_name() is not
> described in DT, dev_pm_domain_attach_by_name() returns NULL, which is
> then used, which leads to NULL pointer dereference.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 1a1da28544fd ("soc: imx: imx8m-blk-ctrl: Defer probe if 'bus' genpd is not yet ready")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index ca942d7929c2..d46fb5387148 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -212,7 +212,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         bc->bus_power_dev = dev_pm_domain_attach_by_name(dev, "bus");
> -       if (IS_ERR(bc->bus_power_dev)) {
> +       if (IS_ERR_OR_NULL(bc->bus_power_dev)) {
>                 if (PTR_ERR(bc->bus_power_dev) == -ENODEV)
>                         return dev_err_probe(dev, -EPROBE_DEFER,
>                                              "failed to attach power domain \"bus\"\n");

The corresponding else clause uses PTR_ERR(bc->bus_power_dev), would
that trigger a splat too?

> --
> 2.25.1
>

Kind regards
Uffe
