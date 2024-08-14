Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D888E1B0111
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 12:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723638464; cv=none; b=oK+IyQDjlZPf+NRQ9fBQZfyZgbz+ndrqS5B6cFWvaLsZkm5XsLg3dRFels0xJZZjWW3shPWmwu6HbwQTyig5GWk4ugvgbNlQBVl5vl7ZAYdYypjkMe6EHCyxvzby9wR78dlP+lxaAb+wPnfwrP3/XoUP1+fy6mQpVm7vJjCWN1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723638464; c=relaxed/simple;
	bh=MCOk87ltZF6H24V4o3EuaT8TEO85EAEEdjQr/69xPv0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElpIJbpVAyjbWgXMAqJ8rqgBrcjmALF1Bbx3qTHtpTJhsYimqSr4WqfcmplKUj1gHIcMFI5wbBgCNh6inFEJUpeSOyRpeVXvENfzdjKiPJOZc2Z/3wDiKWOWlMtOUtFvZfeQnMsx7fFRorfnqA1MiyVuHpNrfC+NcL7G7rz4bwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=az0AJBAW; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="az0AJBAW"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e05e4c3228bso6334068276.0
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 05:27:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723638462; x=1724243262; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9qLRZtDKTr0jSAm7vgxxCmZiYCAFJZ6KbzLPsYTR78E=;
        b=az0AJBAWusBrjcMyV2FHTAfTpdwocCGlQqwbeRTzVxIBij8KQ1tGA5z6P+MTeoJHNn
         II7OeKfSZTFUjSGvrfMbZ5JwT7qZ+DoEu+UrGe74Bn2lCPvP55S05yo3LzZZYiMa9myE
         kdZIKmBDYVtP5iumPqLyeYp6o+Luz4wNBTlhsd8AJ+XDVJP0FL5lF5yTF8sBkGHGdsEB
         An3zlWGZ/MdjA8llQUeKoi2qyXMMhI8ZOHpoWiDRBwxgkmWSviRBYJz+ahD8XIiypl+K
         RUc+HuoHw/vFAc3m5m4k0taTXbRStzcXEawCaYz94hJuwW8zxZMmigYh8BBjR1KGShoD
         Lg7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723638462; x=1724243262;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9qLRZtDKTr0jSAm7vgxxCmZiYCAFJZ6KbzLPsYTR78E=;
        b=aFFnVYshP6eettbdG5ybhnicuq+tn+AtP9tv30uuZKm/HpFuQYKc5orkjxgNDiwfmL
         n/TIvJnt+hP1Ds4VzRxlGOyyNVBdHEJTezOnDVRtSk/3cqoUAEQMahnNmTOCsM8CxA22
         fprrREtfT7d7gq5mkM3ksom3s73GcGU0xXIreIFj6n3hpAGWLn2dCJMdXOsL/+55ehRC
         1tjAWYa87vxXB8PPcPdUzUJEi+OmjbPk0xQmKJUSE0L0zYDwsPfBbz7tnFJM9iBrfJc5
         XRB+GPuszLV3+gY0QZG4rNyW6GBGcxgm/whVhCcLv6+lyz+75NfAEWkOmEfIw0CiiUrU
         a4CA==
X-Forwarded-Encrypted: i=1; AJvYcCUy32k9q2QG3CYRttc5CdRc2CoegMf1/Qnm4z8hVG4f1BaUrLuIXS5NY09qPUJwIcxCGIO9c+BUgUHCKYY8haPOewJx
X-Gm-Message-State: AOJu0YzAs8tmHjvjF/lhsnimv0CaTrfKFCa8nVhIoIMfBT7gEto/l9g3
	5uHcdXq3AE1e5FTEy2FrqtH8W1OeuV5cPaQjILo7JlYT6cRRi09OgvbTCz6GewwV6V4t/bFDvnS
	UI6AD20UEUAt9rhyeiH9ZJoQz1cXXro66RilF1Q==
X-Google-Smtp-Source: AGHT+IGZNeDFwFKcA5hs1O9iOJjIbT4kC9fliekBbf25Kpj2PSN73rKcDwW575WyFIjWIU4Us23LFsHtHqbVvg9DljI=
X-Received: by 2002:a05:6902:2e0d:b0:e08:8d4e:ccc1 with SMTP id
 3f1490d57ef6-e1155bdce60mr2569783276.54.1723638461945; Wed, 14 Aug 2024
 05:27:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240813085748.2144637-1-peng.fan@oss.nxp.com>
In-Reply-To: <20240813085748.2144637-1-peng.fan@oss.nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 14 Aug 2024 14:27:06 +0200
Message-ID: <CAPDyKFo_R3=MK9pRzzG2mV4s3HZKGuoZ1kxoNVLwGAqFirupNw@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: imx: wait SSAR when i.MX93 power domain on
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>, Jacky Bai <ping.bai@nxp.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 13 Aug 2024 at 10:49, Peng Fan (OSS) <peng.fan@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> With "quite" set in bootargs, there is power domain failure:
> "imx93_power_domain 44462400.power-domain: pd_off timeout: name:
>  44462400.power-domain, stat: 4"
>
> The current power on opertation takes ISO state as power on finished
> flag, but it is wrong. Before powering on operation really finishes,
> powering off comes and powering off will never finish because the last
> powering on still not finishes, so the following powering off actually
> not trigger hardware state machine to run. SSAR is the last step when
> powering on a domain, so need to wait SSAR done when powering on.
>
> Since EdgeLock Enclave(ELE) handshake is involved in the flow, enlarge
> the waiting time to 10ms for both on and off to avoid timeout.
>
> Reviewed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Should we add a stable and a fixes tag for this too?

Kind regards
Uffe

> ---
>
> V1:
>  Downstream R-b tag kept
>
>  drivers/pmdomain/imx/imx93-pd.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pmdomain/imx/imx93-pd.c b/drivers/pmdomain/imx/imx93-pd.c
> index 1e94b499c19b..d750a7dc58d2 100644
> --- a/drivers/pmdomain/imx/imx93-pd.c
> +++ b/drivers/pmdomain/imx/imx93-pd.c
> @@ -20,6 +20,7 @@
>  #define FUNC_STAT_PSW_STAT_MASK                BIT(0)
>  #define FUNC_STAT_RST_STAT_MASK                BIT(2)
>  #define FUNC_STAT_ISO_STAT_MASK                BIT(4)
> +#define FUNC_STAT_SSAR_STAT_MASK       BIT(8)
>
>  struct imx93_power_domain {
>         struct generic_pm_domain genpd;
> @@ -50,7 +51,7 @@ static int imx93_pd_on(struct generic_pm_domain *genpd)
>         writel(val, addr + MIX_SLICE_SW_CTRL_OFF);
>
>         ret = readl_poll_timeout(addr + MIX_FUNC_STAT_OFF, val,
> -                                !(val & FUNC_STAT_ISO_STAT_MASK), 1, 10000);
> +                                !(val & FUNC_STAT_SSAR_STAT_MASK), 1, 10000);
>         if (ret) {
>                 dev_err(domain->dev, "pd_on timeout: name: %s, stat: %x\n", genpd->name, val);
>                 return ret;
> @@ -72,7 +73,7 @@ static int imx93_pd_off(struct generic_pm_domain *genpd)
>         writel(val, addr + MIX_SLICE_SW_CTRL_OFF);
>
>         ret = readl_poll_timeout(addr + MIX_FUNC_STAT_OFF, val,
> -                                val & FUNC_STAT_PSW_STAT_MASK, 1, 1000);
> +                                val & FUNC_STAT_PSW_STAT_MASK, 1, 10000);
>         if (ret) {
>                 dev_err(domain->dev, "pd_off timeout: name: %s, stat: %x\n", genpd->name, val);
>                 return ret;
> --
> 2.37.1
>
