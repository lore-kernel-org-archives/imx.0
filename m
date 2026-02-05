Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E99E27A916
	for <imx@lists.linux.dev>; Thu,  5 Feb 2026 10:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770289017; cv=pass; b=l1j/IaVX1rX9VzBAdNMEU7jsb+cB+G5z3dV8wwr3LbD5Yjj+AuV0mP6hkWT8bp/RWeTRr7z5RMr82VX3/zMJx2edJVN5bX1ZV7iUv0AdB5MRjjNeLhnAGPHd2XHvBhY15ITvQvhCGQIc8fLKEeXSrtggm4cDwZnJVdjltajheGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770289017; c=relaxed/simple;
	bh=rdUw3AFuPOHnbcRaTblDVekN4mvjS2EkFVEW4KiTE7s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJf6BXtRjc97w31XtER72mM7N7sexO0dNXkCzlrg4I19nDEc7BKTlJ/wimGLvDmIy8xjPyIL0MRwObTRyQHJAKG0vm7QsmyqvvvFW5J/z3jQ6Jb9mtWFTenvK8+D7vwQoNffWUxXmjjli8gQXYSoi2qkzP1b7Cj22Z/o3lwxcsY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rwxWHNw4; arc=pass smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rwxWHNw4"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-59b6c13b68dso1736600e87.0
        for <imx@lists.linux.dev>; Thu, 05 Feb 2026 02:56:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770289015; cv=none;
        d=google.com; s=arc-20240605;
        b=BlGGEO6PpMeCU0ZF+vAxz3kl1Uk0Tud0xFPcXxCITlcZnVOdhVgjyvAB1Pqog4ZNFo
         T7kYhFLZaWaOanRrRdU507OhmIblIwo7npZrGQAORpOyYUWsIUWiNBio8d5R8oapFkYw
         OIquY1D68Td7s+fljh2JIr0QAQUWH6c22PEejOvA0yowgAbpf2b9ZDQZrPB9vt09vCFE
         qjE/fqNbhUhOrIDMxA0mzSg7y+Klg3ATDKjjur0qiHktu+0HttWzIL5lZnL/4OPt/rGS
         Qjw4dqFWr4Ihxr4ttYfXUQfSKLGy4TsZzdzPVl6UQFd5J/tEzTfIlSAYZgcoxVNiEG3Q
         iC0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        fh=/yGFVHJvZN1eVy+qxiMlrN4alIjfZ5GcNKa9gabNZoM=;
        b=I9CpqLeAoZA5ec1nv5qHElS+bj9s+qfrIb+vIXrTKOwDK4/2etUjBzBdc5Lz5nIefB
         UHYAlKvRxN3ZGXE2M4S1fJ0/7tqbGEYrT9rj/jbJl1qPOv+ylagMHy+EqVRyHS6Qtmlx
         xTZP8KibZQamTNw3pu6jM6bcaZomP3HtYOsvpJFGk/qug4U9+FUdpzaa9GVDe/AyukjE
         45p+yVaVoBu0SqEmxvTlC9yHyJi9iAuCTM1bwit2A3iT3WU0enFYazNlRDzpiNUlolEa
         93EGr6z1iauNAF4DUtDUVch5OfWDk0lQQI71253dSYEPoD35gmkLytD/helR6kc1mMwJ
         RlCA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770289015; x=1770893815; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        b=rwxWHNw4Oe7996DCJwvyYuhaAEvh4K3FYyMBhRLP2ir6RtpF1UOmnYqjFzA2nIIskI
         rnLNIGdu5asSFbj7cFL89dQzxsiYf3f/mOMMganfkevDlfwj8SmFX+9WlMGCNYse105m
         zfgd3BVfklrxV+KW7LAlFhWDnmf5QD6C45GA3NFyCQ1B2w3FMq1lZCRUhtSML3YXsOv8
         RomuRS+qGdITpQAfX4x3UuDIBpuXTC5uGcr6BOieQoegBOkXBlUAzuCW1Y6o7oeY072t
         Xi1jcy5bDe4Z66cJczlK30yonRC2oqAL5ZKGpOroR4Te7LAeVWOfrGcfoMu+3M/dTsis
         xXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770289015; x=1770893815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QRs6tGXQrB9J2BI16cCWeV+WhaT3GC747fgM7MhPTRQ=;
        b=viCdH9yKua0kMDBj7FB+2i6KdCq0msfwCA8akxzDWjW3bKaRr9abU3tbGZ92gbYzKZ
         KoDBFIH73ES/WHUM5P0zKWcZgePqOzm1A+wpOp3Ep0GH5NBKddmoPp1jtoiIRMhFkH/N
         br3+y2eJjcZ7ji57drMXDI7u5/Ge2hThAOodq1VUDG1ANDbmq9X+6i9wlvA3NSTJgiCS
         gz++obeemKavZH6QEdsWoozvmsCNAZyWU8n/KQMSqvHtufqs3RdgB5sArQC16OXHpDl1
         gWBlOG36pwRyIwD/Kf418/TT55YBLM+w7bC1heCtcaIp2pouAGOPrYna8T9Y87Ek3Zep
         rB1A==
X-Forwarded-Encrypted: i=1; AJvYcCUiSnakUYJyMqBceXYQB+6L0pRO6GW2Z86dNjbxULXp86OmNV2egO9IikIzp0ewbRi3zi8=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfSvu50ONo732N5Bsjy7EaqvIRxUurBISoFawqcQakdMBZ4kwr
	vjRBHPx3VHlKLyS+p4gF83/It+mLrgOpJ+gzck8AWCdK5SzF7ZsOQOoXb0zTeAcnNTsc4OE/Qq8
	gHB2m4qD7Rdpk+pP4H/3nnVB+hRcZsKEbbDCxFiPLtA==
X-Gm-Gg: AZuq6aJvuUOecVYG1iqtqEisftMHPK40j7oaLt+G1Zw95ieAkwQp3QvVMpIIskLFR4h
	GGC+zvSbaQVOxtexB1b9xuUJxKA93w+F8ytzwiGgF6M+oAwpytezOz9CGtngzRIMRvNrIY4HVzh
	wk85f6sFIUTAhYDWZju5yftHvdAcakHxapBFYhxsRzNZYiNwXb8b3tiduBPBF/CgbrBChg+LGWK
	xvwYQbGRgcA1kdsCKJeHBI/HP7MaUiTHXvYLn+AI3s6LbHkjVC/e3+LrkufADCBWBx6XrrByx9i
	tIMd2B8=
X-Received: by 2002:a05:6512:3b97:b0:59e:34d7:71de with SMTP id
 2adb3069b0e04-59e3c7aebcbmr907332e87.3.1770289014684; Thu, 05 Feb 2026
 02:56:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260204111142.2147646-1-xu.yang_2@nxp.com>
In-Reply-To: <20260204111142.2147646-1-xu.yang_2@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 5 Feb 2026 11:56:17 +0100
X-Gm-Features: AZwV_QghMMjFzpm5iyBrMMXiBy65oxzfHB7MKyQxNEi6CPDg3zrNZG9JA-o8bxM
Message-ID: <CAPDyKFqocghs2ucVpAz=9vErxSpCO=54RBdQg3ttoqf9t=-tYg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] pmdomain: imx8mp-blk-ctrl: keep gpc power domain
 on if blk-ctrl pd is on during system pm
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, peng.fan@nxp.com, jun.li@nxp.com, 
	rafael.j.wysocki@intel.com, a.fatoum@pengutronix.de, ping.bai@nxp.com, 
	shawnguo@kernel.org, l.stach@pengutronix.de, linux-pm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 4 Feb 2026 at 12:10, Xu Yang <xu.yang_2@nxp.com> wrote:
>
> Current design will power off all dependent GPC power domains in
> imx8mp_blk_ctrl_suspend(), even though the user device has enabled
> wakeup capability. The result is that wakeup function never works
> for such device.
>
> An example will be USB wakeup on i.MX8MP. PHY device '382f0040.usb-phy'
> is attached to power domain 'hsioblk-usb-phy2' which is spawned by hsio
> block control. A virtual power domain device 'genpd:3:32f10000.blk-ctrl'
> is created to build connection with 'hsioblk-usb-phy2' and it depends on
> GPC power domain 'usb-otg2'. If device '382f0040.usb-phy' enable wakeup,
> only power domain 'hsioblk-usb-phy2' keeps on during system suspend,
> power domain 'usb-otg2' is off all the time. So the wakeup event can't
> happen.
>
> In order to further establish a connection between the power domains
> related to GPC and block control during system pm, register a notifier
> to power_dev, so that GPC power domain will know that block control power
> domain is on and will not power off itself.
>
> Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
> Fixes: 556f5cf9568a ("soc: imx: add i.MX8MP HSIO blk-ctrl")
> Cc: stable@kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied for fixes and by amending the commit message a little bit to
make it clearer, thanks!

Kind regards
Uffe


>
> ---
> Changes in v2:
>  - add notifier to support wakeup needs
> ---
>  drivers/pmdomain/imx/imx8mp-blk-ctrl.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
>
> diff --git a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> index 34576be606e3..56bbfee8668d 100644
> --- a/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> +++ b/drivers/pmdomain/imx/imx8mp-blk-ctrl.c
> @@ -65,6 +65,7 @@ struct imx8mp_blk_ctrl_domain {
>         struct icc_bulk_data paths[DOMAIN_MAX_PATHS];
>         struct device *power_dev;
>         struct imx8mp_blk_ctrl *bc;
> +       struct notifier_block power_nb;
>         int num_paths;
>         int id;
>  };
> @@ -594,6 +595,20 @@ static int imx8mp_blk_ctrl_power_off(struct generic_pm_domain *genpd)
>         return 0;
>  }
>
> +static int imx8mp_blk_ctrl_gpc_notifier(struct notifier_block *nb,
> +                                       unsigned long action, void *data)
> +{
> +       struct imx8mp_blk_ctrl_domain *domain =
> +                       container_of(nb, struct imx8mp_blk_ctrl_domain, power_nb);
> +
> +       if (action == GENPD_NOTIFY_PRE_OFF) {
> +               if (domain->genpd.status == GENPD_STATE_ON)
> +                       return NOTIFY_BAD;
> +       }
> +
> +       return NOTIFY_OK;
> +}
> +
>  static struct lock_class_key blk_ctrl_genpd_lock_class;
>
>  static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
> @@ -698,6 +713,14 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                         goto cleanup_pds;
>                 }
>
> +               domain->power_nb.notifier_call = imx8mp_blk_ctrl_gpc_notifier;
> +               ret = dev_pm_genpd_add_notifier(domain->power_dev, &domain->power_nb);
> +               if (ret) {
> +                       dev_err_probe(dev, ret, "failed to add power notifier\n");
> +                       dev_pm_domain_detach(domain->power_dev, true);
> +                       goto cleanup_pds;
> +               }
> +
>                 domain->genpd.name = data->name;
>                 domain->genpd.power_on = imx8mp_blk_ctrl_power_on;
>                 domain->genpd.power_off = imx8mp_blk_ctrl_power_off;
> @@ -707,6 +730,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>                 ret = pm_genpd_init(&domain->genpd, NULL, true);
>                 if (ret) {
>                         dev_err_probe(dev, ret, "failed to init power domain\n");
> +                       dev_pm_genpd_remove_notifier(domain->power_dev);
>                         dev_pm_domain_detach(domain->power_dev, true);
>                         goto cleanup_pds;
>                 }
> @@ -755,6 +779,7 @@ static int imx8mp_blk_ctrl_probe(struct platform_device *pdev)
>  cleanup_pds:
>         for (i--; i >= 0; i--) {
>                 pm_genpd_remove(&bc->domains[i].genpd);
> +               dev_pm_genpd_remove_notifier(bc->domains[i].power_dev);
>                 dev_pm_domain_detach(bc->domains[i].power_dev, true);
>         }
>
> @@ -774,6 +799,7 @@ static void imx8mp_blk_ctrl_remove(struct platform_device *pdev)
>                 struct imx8mp_blk_ctrl_domain *domain = &bc->domains[i];
>
>                 pm_genpd_remove(&domain->genpd);
> +               dev_pm_genpd_remove_notifier(domain->power_dev);
>                 dev_pm_domain_detach(domain->power_dev, true);
>         }
>
> --
> 2.34.1
>
