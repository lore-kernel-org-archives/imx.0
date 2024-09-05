Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A1147F69
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 16:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725552999; cv=none; b=BSAjFfqW/NA7+bCG0e2FOTunTMPGMovpm1/swIA+ykhFPmrk7kMidvvsJDmXv2SIf5QaaIFZJi3NgSAEJNihBK/ae3ZCc5RQSuK9vHQe5cs0ESYtrKK2J7S2t3JcJHXLdHS3AR47T19FTBRInsN0SQfORDG8xi4u3ENHsbq7xz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725552999; c=relaxed/simple;
	bh=XbT1YCH8SqWz/eTmMsIAXlLpeVmIpBn9oe+hrkLvpv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PBMmzu9MZB0LLPZusYrkUmGdUOGv8etIZfqVAE1Z/pUGMCNRr4u+KdRZB64XAMGiu8yQpRPqDioUp0aIuT8sF9mKm4zdFYZ6DaX1BjYa7BG++Oyrzg+wo3MMe9YxIJphiA623npDOHlNEp2uVsiqrLrRc0EF0uenqHjDWHla+3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LqtLiyUq; arc=none smtp.client-ip=209.85.219.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LqtLiyUq"
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-e17c1881a52so1624797276.0
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 09:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725552995; x=1726157795; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PjXtA67NkTqAhDw+xk2sd8wVjIX4v9yriXRxfqRD17k=;
        b=LqtLiyUqxj+cQBvH58zeB9AXonop1amH5LBxAitmI5zokiojJKQNKSncDzcgL/HX7a
         FB2KvrozujKzqHEm7kgojNXN7HmiOF1iMfX62uiikCBe68Qbt9fgdIyiUU5FA56Y4tiJ
         8cPdZHpD4xx8YqukZ01a9yay4n/3+XOLibk5+bup3WZhNfq901HH+uK+lRdcLuEPsTVd
         fcJrHAh7Fb0h8igaYV+zVka+DYV6tnLQdoMwWbRAoCn5DXF067Xw5rDQX4Lj9HBgROQ0
         6l/fiW9wOijoucucTY9o6zTKbwjOE8ED6bW8OzTeVoKW6zg0KBWonzqJVqC8KngnwwxM
         7jwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725552995; x=1726157795;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PjXtA67NkTqAhDw+xk2sd8wVjIX4v9yriXRxfqRD17k=;
        b=IakJ5f4ZSUxcUvAqduv+qBoYnYhVrHGVLG/sLVouoTVyaLWHOenmfjXAoGiHbF9yIs
         aV3NZoR0mprqaQtxOmSS+oyj9cb5ZwVQM+sB9MeLC3OVcP0olwx+pyQaw+Y5kQRONHfj
         KZdXYbwx3lx8n2dwxpT6TFXusb+lkvkNLxHVCkbG36/0MuQ6ccGal6CZNfJC6RDK9tJ+
         n1UqjYYceszfO5s2ftz6/7kCPSsyc1VNP0HPkgAy0Pni4QMRcfpXfIOnyHKlm+etO10H
         ZNgugNObG9FKLX9ZTjB8fbqJXEzj6COsMJYoxFDK8xk1kGkyXxsj/2XcUzUznUuieTPL
         65zA==
X-Forwarded-Encrypted: i=1; AJvYcCU9quxTgMEy3H2haxCREwprswrx2L9EITRvZ5cyZ9yPQ+EkJrVhBxoucqumcjGyhWLNGSQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YxRDfecMvJbc8usD4hJk9Pyzuq4jIjomY2LShvf15a4cXydk5Gm
	glsQHXcY6Jomxsc9K3F+WohPhDEYjWV0DP2+oHB1gZ2rGT7txvScFx9Uj085G49Fi2MwqFYfsDk
	vld003NAqwJMwvPMX4N/ANKfvF2eXxlA721Sy8Q==
X-Google-Smtp-Source: AGHT+IHF4JIHvjV5ZU5Sri1yZmo/2IQpX2mnsVMjFO6aJcUWOMDD1IaSX23mBNNsT/EI52Q3fe8hXyMFeVoPQnvlm3E=
X-Received: by 2002:a05:690c:fc2:b0:666:f7f:a05b with SMTP id
 00721157ae682-6db2583e3cemr61709927b3.0.1725552995374; Thu, 05 Sep 2024
 09:16:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240823095319.3917639-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240823095319.3917639-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Sep 2024 18:15:58 +0200
Message-ID: <CAPDyKFpYgZwNvVnpS0fjmhcEq+yiBizxDTw9nJEyQF287miFJA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: imx93-blk-ctrl: fix power up domain fail
 during early noriq resume
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, victor.liu@nxp.com, 
	Dong Aisheng <aisheng.dong@nxp.com>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 Aug 2024 at 11:44, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Dong Aisheng <aisheng.dong@nxp.com>
>
> After disabling PXP and having no displays connected, we met the following
> suspend/resume hang issue on MX93 EVK board.
>
>  Enabling non-boot CPUs ...
>  Detected VIPT I-cache on CPU1
>  GICv3: CPU1: found redistributor 100 region 0:0x0000000048060000
>  CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
>  CPU1 is up
>  imx93-blk-ctrl 4ac10000.system-controller: failed to power up domain: -13
>  imx93-blk-ctrl 4ac10000.system-controller: failed to power up domain: -13
>  imx93-blk-ctrl 4ac10000.system-controller: failed to power up domain: -13
> ...
>
> The issue was introduced since the commit c24efa673278
> ("PM: runtime: Capture device status before disabling runtime PM")
> which will also check the power.last_status must be RPM_ACTIVE before
> pm_runtime_get_sync() can return 1 (means already active) even pm_runtime
> is disabled during no_irq resume stage.
>
> However, the pm_runtime_set_active() we called ahead of
> pm_runtime_get_sync() will not update power.last_status which probably like
> a upstream kernel issue. But that's another issue which may worth an
> extra fix.

I think this is confusing, I don't see any calls to
pm_runtime_set_active() anywhere? Are you referring to some old code?

>
> This patch refers to the solution in the exist similar imx8m blkctrl
> driver[1] that it will power up upstream domains during blkctl suspend
> first in order to make sure the power.last_status to be RPM_ACTIVE. Then we
> can support calling pm_runtime_get_sync in noirq resume stage.
>
> After fixing, no need extra calling of pm_runtime_set_active() ahead.
>
> 1. drivers/pmdomain/imx/imx8m-blk-ctrl.c
>
> Fixes: e9aa77d413c9 ("soc: imx: add i.MX93 media blk ctrl driver")
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> ---
>  drivers/pmdomain/imx/imx93-blk-ctrl.c | 29 +++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx93-blk-ctrl.c b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> index 904ffa55b8f4..34ac7b722b90 100644
> --- a/drivers/pmdomain/imx/imx93-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx93-blk-ctrl.c
> @@ -424,6 +424,34 @@ static const struct imx93_blk_ctrl_data imx93_media_blk_ctl_dev_data = {
>         .reg_access_table = &imx93_media_blk_ctl_access_table,
>  };
>
> +static int imx93_blk_ctrl_suspend(struct device *dev)
> +{
> +       struct imx93_blk_ctrl *bc = dev_get_drvdata(dev);
> +
> +       /*
> +        * This may look strange, but is done so the generic PM_SLEEP code
> +        * can power down our domains and more importantly power them up again
> +        * after resume, without tripping over our usage of runtime PM to
> +        * control the upstream GPC domains. Things happen in the right order
> +        * in the system suspend/resume paths due to the device parent/child
> +        * hierarchy.
> +        */
> +       return pm_runtime_resume_and_get(bc->dev);

The reason why we *don't* use a regular parent/child setup of the PM
domains (genpds) to control power-on/off, is because there seems to be
a specific sequence that needs to be followed. So, instead we are
using runtime PM to control the power for the parent PM domain.  See
the comment in imx93_blk_ctrl_probe().

I have to admit, it all looks strange to me and seems also very fragile.

That said, why doesn't the sequence matter any longer during system
suspend/resume. Or maybe the sequence doesn't really matter after all?

> +}
> +
> +static int imx93_blk_ctrl_resume(struct device *dev)
> +{
> +       struct imx93_blk_ctrl *bc = dev_get_drvdata(dev);
> +
> +       pm_runtime_put(bc->dev);
> +
> +       return 0;
> +}
> +
> +static const struct dev_pm_ops imx93_blk_ctrl_pm_ops = {
> +       SYSTEM_SLEEP_PM_OPS(imx93_blk_ctrl_suspend, imx93_blk_ctrl_resume)
> +};
> +
>  static const struct of_device_id imx93_blk_ctrl_of_match[] = {
>         {
>                 .compatible = "fsl,imx93-media-blk-ctrl",
> @@ -439,6 +467,7 @@ static struct platform_driver imx93_blk_ctrl_driver = {
>         .remove_new = imx93_blk_ctrl_remove,
>         .driver = {
>                 .name = "imx93-blk-ctrl",
> +               .pm = pm_sleep_ptr(&imx93_blk_ctrl_pm_ops),
>                 .of_match_table = imx93_blk_ctrl_of_match,
>         },
>  };
> --
> 2.37.1
>

Kind regards
Uffe
