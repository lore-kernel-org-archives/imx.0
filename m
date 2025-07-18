Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBA1D54EE
	for <imx@lists.linux.dev>; Fri, 18 Jul 2025 10:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752835509; cv=none; b=Gs0xQ2T81pQx2ruSA8bjzd5mtTsIxgHgDSMxnX/G+n9e6j2fzbW/F/BeunHGq2c6CoQ/8cQwNXXy+ER9Y/7ClbQG23DU0ctK0qOWMCIbQZooEcCyIOqqc9IcHsxpgs/K9rCfDesQJ/pJYTCca0vlmzS0ChKEg+FOVkCqWGuDQvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752835509; c=relaxed/simple;
	bh=rUWr73j1f8m00qKKyCmRslv5muc4NtxmmGcWkGS4euQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jWc6DJbTjBtD7wj7P8b1UnMVsxWp23HtE4CMVEJ/AqTdhuMH9bvHpBvGL36vLrc9XzRJaPyDe4urEqDweZKmELvPMyYK1GvEy6CC4ioC2+58ireEYig+4Gso+6bDvZEyGdmPnBD8GV9ZzQhgrs9BETmcFiIgUNbBXvwOsdtqewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=whi9qsNg; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="whi9qsNg"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-7183d264e55so19778887b3.2
        for <imx@lists.linux.dev>; Fri, 18 Jul 2025 03:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752835506; x=1753440306; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=eL4ot+dqM/gHvOleLPQUu1Tr2WKMQ0Kb3pxoJXxeucY=;
        b=whi9qsNgS0TdYJ7nisPDcSgjXjFNO1tgA0bKTLKS6qNdmOLXsSQ0U5JdeBxd496kpe
         k+g9JAg/H7eqE1IKsbO0mBcZOUP6Xiol3FM6aLcs5RDw8kegTDhzl1L+r4SoPrzJOf+C
         YwssW8opUWwc7X3EV3H7slTOYJ5e+crayIFOlyZ6T/3BkldReVul895Fz0W7/3o48U7H
         iqpDpo1iaX9jBcgA96+wYBMPDkgh4SuKSHRPOWt/0KuFgNVoZm6BBQeOFEVRXqwYOkQv
         h3nz+FQ8f/GoK4ouondtygDP/JnQE8wkio40CfJZkis0mgnVbCLJ4tnglDD4FVUSOEl/
         ZCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752835506; x=1753440306;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eL4ot+dqM/gHvOleLPQUu1Tr2WKMQ0Kb3pxoJXxeucY=;
        b=DIzUloy0HctcNIqUnFBOUWHCzEYTyqkeKuCDgDff/Kd15yzbgQCg6HRJZS4s/h/A7O
         57j/eaYpwlp1TBfVvABpl92RHdFTRxMbvNel7J5H9hEx3MqkKiZZaT5BXq+g87hQlvv9
         monq5u2jHzx1hJmq6hArKeV18QJqmvf5nz6f5lFX6JBbTiN+LvK3fdrymxYmwTIEyUJp
         I6vxTdyjb0hWic+tGr146flgCMjeork4EEkJWrG0JxvI4a/lYEo8aiUg5WivANPZhEuX
         spnsy6u1WBgH9+9bIUx02x0abWv35xvUR5axK4E1FV/l+YB4ZWMrcSBhwCb/ZqZw9/YZ
         ZZEA==
X-Forwarded-Encrypted: i=1; AJvYcCXrbtPSV2X1nKE1X/gxfIaW0znzHVVAFg9pxDdKcyEaeoV6mtia2sF1hs725k6uI5uUQXA=@lists.linux.dev
X-Gm-Message-State: AOJu0YyVvCvjTDWh7udBnVwRom8h+hCqsf65cjv0NrspiUkC+UOEq/ka
	+OJ+SCYJr1lKOJKhu1YkLSrpbDkDFFIPn3Ms9qzLKey4sIo3UvM0Gztp9OxZHSipRZw5BrAGqDg
	eTEitGH2tQoA/xNPmujmT8jCL8CbjnVaPe65jbfvGKw==
X-Gm-Gg: ASbGnctZdzeVwJ1/x15Qp2XE3pBQJHRSG2JyNyglh0C8AhuE4n/w4EP2fdLap58TEke
	RdfmlRJNyI7oXpq7t4ox1WlGGSNSUfNdG1cNQPMWND1KpH1RW4PxH6zwAw/NsFfzIKeO08S8IIO
	ZEK43z4UoXE1FaZq2bBDDSUB38/Cgxol9ukiHCw8nmsRYyWb/2C9UibvfbNJmRzovZsPkPbJhE/
	MKrWAzb
X-Google-Smtp-Source: AGHT+IFQ1mnk1ZgI1gkcyMhNGTwcwNL/MUejQfWzddIamhebdceSEWNxbqRvh2fYEhcrWIWkwSIrRt9TLlwJqykznrc=
X-Received: by 2002:a05:690c:25c3:b0:70e:7706:824e with SMTP id
 00721157ae682-718a332563dmr82661557b3.6.1752835505656; Fri, 18 Jul 2025
 03:45:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250716194638.113115-1-hiagofranco@gmail.com>
In-Reply-To: <20250716194638.113115-1-hiagofranco@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 18 Jul 2025 12:44:28 +0200
X-Gm-Features: Ac12FXz3wdFyhRFKPg_XEl0cRf6bRNkkouJRpcUk47StJD9WCjNNZdufcqO3Rys
Message-ID: <CAPDyKFqWkWSahkGkap8SUiuYvmtk_b4OgN-bSyB-H519wf=eBw@mail.gmail.com>
Subject: Re: [PATCH v8] remoteproc: imx_rproc: detect and attach to pre-booted
 remote cores
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, 
	Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 16 Jul 2025 at 21:47, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> From: Hiago De Franco <hiago.franco@toradex.com>
>
> When the Cortex-M remote core is started and already running before
> Linux boots (typically by the Cortex-A bootloader using a command like
> bootaux), the current driver is unable to attach to it. This is because
> the driver only checks for remote cores running in different SCU
> partitions. However in this case, the M-core is in the same partition as
> Linux and is already powered up and running by the bootloader.
>
> This patch adds a check using dev_pm_genpd_is_on() to verify whether the
> M-core's power domains are already on. If all power domain devices are
> on, the driver assumes the M-core is running and proceed to attach to
> it.
>
> To accomplish this, we need to avoid passing any attach_data or flags to
> dev_pm_domain_attach_list(), allowing the platform device become a
> consumer of the power domain provider without changing its current
> state.
>
> During probe, also enable and sync the device runtime PM to make sure
> the power domains are correctly managed when the core is controlled by
> the kernel.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Hiago De Franco <hiago.franco@toradex.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> Hi Mathieu, Ulf,
>
> This is the v8 of patch3 from the patch series:
> https://lore.kernel.org/all/20250629172512.14857-1-hiagofranco@gmail.com/
>
> As patches 1 and 2 are already applied on Ulf's next branch, as
> requested I am sending now only the v8 of patch 3.
>
> I made a small correction into the commit description, s/SCFW
> partitions/SCU partitions/g and updated with the check for the return
> value.
>
> I hope this is ok.
>
> Thanks!
>
> Hiago.
>
> v7 -> v8:
>     - Added return error check for dev_pm_domain_attach_list().
>     - Commit description: changed to use "SCU partitions" instead of
>       "SCFW partitions". This is more accurate since these are hardware
>       enforced partitions.
> v6 -> v7:
>  - Added Peng reviewed-by.
> v5 -> v6:
>  - Commit description improved, as suggested. Added Ulf Hansson reviewed
>    by. Comment on imx-rproc.c improved.
> v4 -> v5:
>  - pm_runtime_get_sync() removed in favor of
>    pm_runtime_resume_and_get(). Now it also checks the return value of
>    this function.
>  - Added pm_runtime_disable() and pm_runtime_put() to imx_rproc_remove()
>    function.
> v3 -> v4:
>  - Changed to use the new dev_pm_genpd_is_on() function instead, as
>    suggested by Ulf. This will now get the power status of the two
>    remote cores power domains to decided if imx_rpoc needs to attach or
>    not. In order to do that, pm_runtime_enable() and
>    pm_runtime_get_sync() were introduced and pd_data was removed.
> v2 -> v3:
>  - Unchanged.
> v1 -> v2:
>  - Dropped unecessary include. Removed the imx_rproc_is_on function, as
>    suggested.
> ---
> ---
>  drivers/remoteproc/imx_rproc.c | 41 +++++++++++++++++++++++++++++-----
>  1 file changed, 35 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/remoteproc/imx_rproc.c b/drivers/remoteproc/imx_rproc.c
> index 627e57a88db2..a6eef0080ca9 100644
> --- a/drivers/remoteproc/imx_rproc.c
> +++ b/drivers/remoteproc/imx_rproc.c
> @@ -18,6 +18,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reboot.h>
>  #include <linux/regmap.h>
>  #include <linux/remoteproc.h>
> @@ -890,10 +891,8 @@ static int imx_rproc_partition_notify(struct notifier_block *nb,
>  static int imx_rproc_attach_pd(struct imx_rproc *priv)
>  {
>         struct device *dev = priv->dev;
> -       int ret;
> -       struct dev_pm_domain_attach_data pd_data = {
> -               .pd_flags = PD_FLAG_DEV_LINK_ON,
> -       };
> +       int ret, i;
> +       bool detached = true;
>
>         /*
>          * If there is only one power-domain entry, the platform driver framework
> @@ -902,8 +901,25 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
> -       ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> -       return ret < 0 ? ret : 0;
> +       ret = dev_pm_domain_attach_list(dev, NULL, &priv->pd_list);
> +       if (ret < 0)
> +               return ret;
> +       /*
> +        * If all the power domain devices are already turned on, the remote
> +        * core is already powered up and running when the kernel booted (e.g.,
> +        * started by U-Boot's bootaux command). In this case attach to it.
> +        */
> +       for (i = 0; i < ret; i++) {
> +               if (!dev_pm_genpd_is_on(priv->pd_list->pd_devs[i])) {
> +                       detached = false;
> +                       break;
> +               }
> +       }
> +
> +       if (detached)
> +               priv->rproc->state = RPROC_DETACHED;
> +
> +       return 0;
>  }
>
>  static int imx_rproc_detect_mode(struct imx_rproc *priv)
> @@ -1146,6 +1162,15 @@ static int imx_rproc_probe(struct platform_device *pdev)
>                 }
>         }
>
> +       if (dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_enable(dev);
> +               ret = pm_runtime_resume_and_get(dev);
> +               if (ret) {
> +                       dev_err(dev, "pm_runtime get failed: %d\n", ret);
> +                       goto err_put_clk;
> +               }
> +       }
> +
>         ret = rproc_add(rproc);
>         if (ret) {
>                 dev_err(dev, "rproc_add failed\n");
> @@ -1171,6 +1196,10 @@ static void imx_rproc_remove(struct platform_device *pdev)
>         struct rproc *rproc = platform_get_drvdata(pdev);
>         struct imx_rproc *priv = rproc->priv;
>
> +       if (priv->dcfg->method == IMX_RPROC_SCU_API) {
> +               pm_runtime_disable(priv->dev);
> +               pm_runtime_put(priv->dev);
> +       }
>         clk_disable_unprepare(priv->clk);
>         rproc_del(rproc);
>         imx_rproc_put_scu(rproc);
> --
> 2.39.5
>
