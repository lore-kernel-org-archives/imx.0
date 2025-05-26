Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25521DED51
	for <imx@lists.linux.dev>; Mon, 26 May 2025 10:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748254108; cv=none; b=LIv2E1UN1YOFuaL3Dqz6oh2krXOBXIogP8F4xZQSUT/XwkHFP3RdZLsgdHjQLrtHvA0f4Ad3Ce/7kxLDkhQPSD+/1eMDXA39sOM8+VQmc4kLGzV1M+PRD/IayqY8CiRsOguFLnBCheqr7ds9tNGmMuM45UhhfwedOsg9FFKXRmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748254108; c=relaxed/simple;
	bh=RssPTTSlOi3uPhFyxHYOhka1vxO3+iE4N6adykha/8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rqnYBW7lWa9Jf4fC7+kq6ymfC/d9rAUIaS06I32yvGSA1cBE4qcqoIz172itSVYtYdKTjKpYwnG3YPO6VZOJX6slnCXNIFhLoGh2oLgrFF4c4dy8SznTCDBzMwq15EgFEvobQJGMFlFT/YeezGDNj61ETOjAEtm6csq1rH6BfdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=za9/b7UD; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="za9/b7UD"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e7569ccf04cso1423088276.0
        for <imx@lists.linux.dev>; Mon, 26 May 2025 03:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748254106; x=1748858906; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NpPv+jwx+sCOwe5Xg7tTvOuLFtJsEPCNaLZVy2I7eGY=;
        b=za9/b7UDhTmHwQHvPpGi/Ue2atsEVH7uBc+D3zCRmoSTJy9aCPGGrTht7xiF3UeHF+
         TmjS7aD5FpebV9KuNdVUO6mQK+1Ja3YiNrnfPQFtxAk5VDX570Ox1kt9FRGGwIBoyEFG
         265+9rU+pz4J4fKqzGxPO4MCQXrOt+FzsBVRMB4jdOj4pRBP0q3vW4D69VbL9mOaUntC
         v39mFKguxmfarPVssM7DhNdGFG9guk5HgkxaWFKvLtAnN/3fHug7d/43Lq23mgtGQbCP
         uC8a5qUq+gyqFehRUEYiN3XdbMRy0XqmbauX6VehUbykjnmr42c8h4loSFRkpWhUKqOv
         DOZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748254106; x=1748858906;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NpPv+jwx+sCOwe5Xg7tTvOuLFtJsEPCNaLZVy2I7eGY=;
        b=tiHSyyEQfdYHNG+MUhJX+Cy1W+bqL7Bv2X46zQ2jzV9hg+xGKtSs8dnbcLu5L8gpnX
         CW4POq2/R2fURu1hwpfmkNP+xRyruJul8tYypIvLriHHEnDF3yM5PLVTwuxvNBfHgzZ2
         ZGwukxKVUCv2VKw7nlI/Tldvag0i+XQbCmYNTEIUcSC0nz35Nfy3SmSo9NCJHAuFrHdM
         4fT9trYBqKN7orbXdGQBlrCK/qL+eMPEV7Zsyuvea22XJiOtKsN/s95ZODr2b/SoIEdf
         iiQNfTOar7CYkv+jpx2Zjx3x0hLyD5q0qNKae/FgTHKvQuCg9PDVgrLMsaxWmvaj71F/
         Z62w==
X-Forwarded-Encrypted: i=1; AJvYcCUeyPC07QIWt/IBRFyJ8nbDT2hsSGxBw7pU5q/rS4twtXHnS5J/1l7ifIpoQ1oYWmFOfG0=@lists.linux.dev
X-Gm-Message-State: AOJu0YxW82B3oJ/iasIg6XpRPSKULoRYZ9vS1jNCQtA+HiH/wW99ck5A
	ILDmT4G6WJ6QH5QrH0A5+r62e81DW6FbzeY0kkWMuVT85Z2qLv+wgqmC0f+Dl9SL+p4yDxYIjZN
	VrEFppCDsTQSiKxYH7Za7WzAITO45TqF6Z/F7dHOY/w==
X-Gm-Gg: ASbGnct+52+BbIRDv7225tQsmRcPbH1eF39FFjsveeURxX8leGgikadzi7STdwbPs7L
	VJg6oaChxYmJkGmHgLEo7vkigS13YLP3JjhYPgV42Mj5+jqSVR/xvOGS2h/vXShlPBs7NydXLSl
	DzQQss7klGanmay1NghojctD6riht9RJVqcQ==
X-Google-Smtp-Source: AGHT+IFdBGTGYZOotDK/y3Q59f0r8dFms0TkmjC4C0sHaJmgkuM3Am4LonkHZ4KeqelTVat8o4uyIxhJmZyFRyDPL7U=
X-Received: by 2002:a05:6902:160d:b0:e7d:b8ce:cb91 with SMTP id
 3f1490d57ef6-e7db8cecd3dmr1219626276.5.1748254105723; Mon, 26 May 2025
 03:08:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CAPDyKFrHD1hVCfOK-JV5FJM+Cd9DoKKZGKcC94fxx6_9Bsri1g@mail.gmail.com>
 <20250508202826.33bke6atcvqdkfa4@hiago-nb> <CAPDyKFr3yF=yYZ=Xo5FicvSbDPOTx7+fMwc8dMCLYKPBMEtCKA@mail.gmail.com>
 <20250509191308.6i3ydftzork3sv5c@hiago-nb> <CAPDyKFpnLzk5YR3piksGhdB8ZoGNCzmweBTxm_rDX5=vjLFxqQ@mail.gmail.com>
 <20250519172357.vfnwehrbkk24vkge@hiago-nb> <CAPDyKFpGcgMzOUHf-JTRTLBviFdLdbjZKrMm8yd37ZqJ1nfkHw@mail.gmail.com>
 <20250521041306.GA28017@nxa18884-linux> <20250521041840.GB28017@nxa18884-linux>
 <CAPDyKFpSb+KsfDr1-=uk4TF4Op1dUQ9rDwPP5sSpMfxDRDhnZA@mail.gmail.com> <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
In-Reply-To: <20250523191713.nylhi74jq6z4hqmr@hiago-nb>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 26 May 2025 12:07:49 +0200
X-Gm-Features: AX0GCFtV9JrsWnRtXpr1h2X2HDFYAFvpBaxszSIspVyj2HxlBm4_wnbvi_OW3II
Message-ID: <CAPDyKFq6HG6iTZRnBSN25vhCU8Zj1c+r_ufGbiBsJ16N+1bJVg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] remoteproc: imx_rproc: add power mode check for
 remote core attachment
To: Hiago De Franco <hiagofranco@gmail.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>, Mathieu Poirier <mathieu.poirier@linaro.org>, 
	linux-pm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Bjorn Andersson <andersson@kernel.org>, Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com, 
	Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Peng Fan <peng.fan@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 23 May 2025 at 21:17, Hiago De Franco <hiagofranco@gmail.com> wrote:
>
> Hi Ulf,
>
> On Wed, May 21, 2025 at 02:11:02PM +0200, Ulf Hansson wrote:
> > You should not provide any flag (or attach_data to
> > dev_pm_domain_attach_list()) at all. In other words just call
> > dev_pm_domain_attach_list(dev, NULL, &priv->pd_list), similar to how
> > drivers/remoteproc/imx_dsp_rproc.c does it.
> >
> > In this way, the device_link is created by making the platform->dev
> > the consumer and by keeping the supplier-devices (corresponding to the
> > genpds) in RPM_SUSPENDED state.
> >
> > The PM domains (genpds) are then left in their current state, which
> > should allow us to call dev_pm_genpd_is_on() for the corresponding
> > supplier-devices, to figure out whether the bootloader turned them on
> > or not, I think.
> >
> > Moreover, to make sure the genpds are turned on when needed, we also
> > need to call pm_runtime_enable(platform->dev) and
> > pm_runtime_get_sync(platform->dev). The easiest approach is probably
> > to do that during ->probe() - and then as an improvement on top you
> > may want to implement more fine-grained support for runtime PM.
> >
> > [...]
> >
> > Kind regards
> > Uffe
>
> I did some tests here and I might be missing something. I used the
> dev_pm_genpd_is_on() inside imx_rproc.c with the following changes:
>
> @@ -902,7 +902,12 @@ static int imx_rproc_attach_pd(struct imx_rproc *priv)
>         if (dev->pm_domain)
>                 return 0;
>
>         ret = dev_pm_domain_attach_list(dev, &pd_data, &priv->pd_list);
> +       printk("hfranco: returned pd devs is %d", ret);
> +       for (int i = 0; i < ret; i++) {
> +               test = dev_pm_genpd_is_on(priv->pd_list->pd_devs[i]);
> +               printk("hfranco: returned value is %d", test);
> +       }
>         return ret < 0 ? ret : 0;
>  }
>
> This was a quick test to check the returned value, and it always return
> 1 for both pds, even if I did not boot the remote core.
>
> So I was wondering if it was because of PD_FLAG_DEV_LINK_ON, I removed
> it and passed NULL to dev_pm_domain_attach_list().

Right, that's exactly what we should be doing.

> Booting the kernel
> now it correctly reports 0 for both pds, however when I start the
> remote core with a hello world firmware and boot the kernel, the CPU
> resets with a fault reset ("Reset cause: SCFW fault reset").
>
> I added both pm functions to probe, just to test:
>
> @@ -1152,6 +1158,9 @@ static int imx_rproc_probe(struct platform_device *pdev)
>                 goto err_put_clk;
>         }
>
> +       pm_runtime_enable(dev);
> +       pm_runtime_get_sync(dev);
> +

Indeed, calling pm_runtime_enable() and then pm_runtime_get_sync()
should turn on the PM domains for the device, which I assume is needed
at some point.

Although, I wonder if this may be a bit too late, I would expect that
you at least need to call these *before* the call to rproc_add(), as I
assume the rproc-core may start using the device/driver beyond that
point.

>         return 0
>
> Now the kernel boot with the remote core running, but it still returns
> 0 from dev_pm_genpd_is_on(). So basically now it always returns 0, with
> or without the remote core running.

dev_pm_genpd_is_on() is returning the current status of the PM domain
(genpd) for the device.

Could it be that the genpd provider doesn't register its PM domains
with the state that the HW is really in? pm_genpd_init() is the call
that allows the genpd provider to specify the initial state.

I think we need Peng's help here to understand what goes on.

>
> I tried to move pm_runtime_get_sync() to .prepare function but it make
> the kernel not boot anymore (with the SCU fault reset).

Try move pm_runtime_enable() before rproc_add().

>
> Do you have any suggestions? Am I doing something wrong with these PDs?
>
> Best regards,
> Hiago.

Kind regards
Uffe
