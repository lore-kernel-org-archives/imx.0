Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9118316089A
	for <imx@lists.linux.dev>; Fri, 10 May 2024 09:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715333725; cv=none; b=LkcmVzrSPGTuXew+kf69DcJt5dHhY+W+2U2iFg66Z5FigBxmrfvchtsNIhygKhqi39bkw1oOsQ0FmqU6OM4bOkXs+GbaHrz0YNiw4017D/Bkh4WgX0B6ocic2h2WTDLMHsVmvuFUS4CIIDzdB3Wpep3rGWmaAIiTQo3rygQvTnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715333725; c=relaxed/simple;
	bh=74mWvHLl9kkJWCjJ9c/58+OLihHsC5x2Bv4lj2v1YJw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uWopl1xVo+uDEBmTD7dUoXjHqVPfGBrNiN8g+dJZxKwx4MAGBlSuV0kIBOfKh//tGy1QSU8y45gyuVqFjHYcVtQZ/jlt+b9Qbq7G890RtIqYcOdjTSL6z1dl9XhnsD0lxW53xyOyfilT8QOZK1XmL+E7cwiGcwF8ia4yg8E0HV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PYXyn2Ir; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PYXyn2Ir"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-dcc6fc978ddso1541191276.0
        for <imx@lists.linux.dev>; Fri, 10 May 2024 02:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715333722; x=1715938522; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ddAlHrV+azsymE+SBA7AG/w8GBAmFQuP9eNGcQBlcU4=;
        b=PYXyn2IrdSOeio6xsmujJgnvdbNhUapZfUAxPG3eoRSFcoGVysWN8zSBCQor/Fcp2o
         CRAEMg4MsyB+HNBBbGvd26SdITiES/rAr+ILCKHCiBNPwJOH03Q4CBwWdSm9rRpbiKJV
         hCso6tQyCJy6DrVJKzYKjOKmmMiprfy286Az5ZluLzgUULF0vkqd1iRivArNrUJa5xzr
         i/o46vB6gIsQWKN1NOT0nyLHllN15J8C/m4CgwWxiVML/BHRlv+0oizORrZuSJuJn+5D
         wdHxI8g7NAm9SX+scsmO7yfVWZ55Ajds+Fxzi+XGsHrjMNeD8R+jCheS5OTOWuFXG5+/
         fERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715333722; x=1715938522;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ddAlHrV+azsymE+SBA7AG/w8GBAmFQuP9eNGcQBlcU4=;
        b=FPKH92cVjtR/JoCkIRoZuhgIdkuO6OTZqkRYbgbg8UvV3yUfULPpSfKnGvcFq71mXm
         0bV+Uu8DkND0U3aSRh7aau9Io0AAW5sL69DMFMbvC167oG/oOtAHMGaq+chESsYcN4sD
         eO2gqVKfm6kxwM1EMp3GevNR5dC8WoYgviHFqmWPOS8aJoPrE/Fjz01RK38T9b/Td/BB
         QwCdFLCUR4LYSdRYK8oq6RQuTpF8e8AmGOJ9ZdRM3bU+2nYVswuOU/dKUdb4U8ISl3BK
         56n3sibG7oW3cZi4LParKiLbnhpvUi1WVaD59pa7Bam+qp3FnbF73CrNHInacIqR+kR9
         vOqA==
X-Forwarded-Encrypted: i=1; AJvYcCVGwreigzDE0CjZGucsFoMuueOR9ZMzzcXFsPqMk2HTl/j4+hR/h4YxZSYZhKoyPYhc5MmQdX32zrMfOlsGS6Nu22AA
X-Gm-Message-State: AOJu0Ywu+vTLS/MlEXWcwmLPhj/JzHm/rv74nzHDn8YlsQcj4p35wN/H
	wkchxrAhYwyXq03JFM+RiF8qlM4Z8FMbtoZ884gUOSIV7ly6bh5nSj9cxpnAx0A7f2snGiGWJZt
	pmUtSZuIDb8v9wvkJ9b42TbfSiSJt7RLtjmnw1g==
X-Google-Smtp-Source: AGHT+IHe8KfUCxU0IUa3DtzKN6/EJhPBEHnlzpdRmt0ugkIOFNcugGXnt2P8F6W7CAtLpVfZDsqHHaqcjOrR3KSrOQ0=
X-Received: by 2002:a5b:2d1:0:b0:de5:bc2e:467e with SMTP id
 3f1490d57ef6-debcfb4e0b0mr3992499276.3.1715333722592; Fri, 10 May 2024
 02:35:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240418155151.355133-1-ivitro@gmail.com>
In-Reply-To: <20240418155151.355133-1-ivitro@gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Fri, 10 May 2024 11:34:46 +0200
Message-ID: <CAPDyKFr9Vzgm2C6Z57Bg5mUQxg5LK6goN2og3+RC3BkTZjiqJw@mail.gmail.com>
Subject: Re: [PATCH v1] pmdomain: imx8m-blk-ctrl: fix suspend/resume order
To: Vitor Soares <ivitro@gmail.com>, Lucas Stach <l.stach@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vitor Soares <vitor.soares@toradex.com>, linux-pm@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Apr 2024 at 17:52, Vitor Soares <ivitro@gmail.com> wrote:
>
> From: Vitor Soares <vitor.soares@toradex.com>
>
> During the probe, the genpd power_dev is added to the dpm_list after
> blk_ctrl due to its parent/child relationship. Making the blk_ctrl
> suspend after and resume before the genpd power_dev.
>
> As a consequence, the system hangs when resuming the VPU due to the
> power domain dependency.
>
> To ensure the proper suspend/resume order, add a device link betweem
> blk_ctrl and genpd power_dev. It guarantees genpd power_dev is suspended
> after and resumed before blk-ctrl.

Before discussing $subject patch, would you mind explaining to me why
imx8m-blk-ctrl needs to use the ->suspend() callback at all?

Looking closer at that code (imx8m_blk_ctrl_suspend()), it calls
pm_runtime_get_sync() for devices to power on "everything". Why isn't
that managed by the consumer drivers (on a case by case basis) that
are managing the devices that are attached to the genpds instead?

Kind regards
Uffe

>
> Cc: <stable@vger.kernel.org>
> Closes: https://lore.kernel.org/all/fccbb040330a706a4f7b34875db1d896a0bf81c8.camel@gmail.com/
> Link: https://lore.kernel.org/all/20240409085802.290439-1-ivitro@gmail.com/
> Fixes: 2684ac05a8c4 ("soc: imx: add i.MX8M blk-ctrl driver")
> Suggested-by: Lucas Stach <l.stach@pengutronix.de>
> Signed-off-by: Vitor Soares <vitor.soares@toradex.com>
> ---
>
> This is a new patch, but is a follow-up of:
> https://lore.kernel.org/all/20240409085802.290439-1-ivitro@gmail.com/
>
> As suggested by Lucas, we are addressing this PM issue in the imx8m-blk-ctrl
> driver instead of in the imx8mm.dtsi.
>
>  drivers/pmdomain/imx/imx8m-blk-ctrl.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8m-blk-ctrl.c b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> index ca942d7929c2..cd0d2296080d 100644
> --- a/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8m-blk-ctrl.c
> @@ -283,6 +283,20 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
>                         goto cleanup_pds;
>                 }
>
> +               /*
> +                * Enforce suspend/resume ordering by making genpd power_dev a
> +                * provider of blk-ctrl. Genpd power_dev is suspended after and
> +                * resumed before blk-ctrl.
> +                */
> +               if (!device_link_add(dev, domain->power_dev, DL_FLAG_STATELESS)) {
> +                       ret = -EINVAL;
> +                       dev_err_probe(dev, ret,
> +                                     "failed to link to %s\n", data->name);
> +                       pm_genpd_remove(&domain->genpd);
> +                       dev_pm_domain_detach(domain->power_dev, true);
> +                       goto cleanup_pds;
> +               }
> +
>                 /*
>                  * We use runtime PM to trigger power on/off of the upstream GPC
>                  * domain, as a strict hierarchical parent/child power domain
> @@ -324,6 +338,7 @@ static int imx8m_blk_ctrl_probe(struct platform_device *pdev)
>         of_genpd_del_provider(dev->of_node);
>  cleanup_pds:
>         for (i--; i >= 0; i--) {
> +               device_link_remove(dev, bc->domains[i].power_dev);
>                 pm_genpd_remove(&bc->domains[i].genpd);
>                 dev_pm_domain_detach(bc->domains[i].power_dev, true);
>         }
> @@ -343,6 +358,7 @@ static void imx8m_blk_ctrl_remove(struct platform_device *pdev)
>         for (i = 0; bc->onecell_data.num_domains; i++) {
>                 struct imx8m_blk_ctrl_domain *domain = &bc->domains[i];
>
> +               device_link_remove(&pdev->dev, domain->power_dev);
>                 pm_genpd_remove(&domain->genpd);
>                 dev_pm_domain_detach(domain->power_dev, true);
>         }
> --
> 2.34.1
>
