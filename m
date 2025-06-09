Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525BD171092
	for <imx@lists.linux.dev>; Mon,  9 Jun 2025 14:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749479127; cv=none; b=tXB4nDTn1tvDgbVLIJGjqwuHa7MJIgixgC/FnjO1jzotDzAZPTHkZldxH8TOKuFqWZt+C8XPaK8EWpzggmnkD8KhCv6ZQSfAx0dl3QDhHw+tqqGetlvcDZWD5rPjbWSbpFaMpeHhdmDIBxt3WIN0bEK7vuf6tOZzVkTY86Q3rLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749479127; c=relaxed/simple;
	bh=RMxwU4uMw3X/ihqmtoM44ZozrFhIFNNLFQWT28zbLhA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mmTRNbr+q8tgoTJjaL0Ew7AVIia5fBuxd0baeTuUG0HsEYrFp1SDGeHiiG9kbCPmHq6cb6v5ifth5USoFicYvV6YGlLPEkgQsQtZ3cOlQJ6a0Q4KbhWrqd2jbXnR7QEo1mV3hZt24qaA2l2DmXixp4ESHnWZxQqNGTLCeitrZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vVzm7eWx; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vVzm7eWx"
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso3454962276.2
        for <imx@lists.linux.dev>; Mon, 09 Jun 2025 07:25:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749479123; x=1750083923; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=vVzm7eWxWZPmeVOiDYOTmmDb9Cw5Pe1wiuCkAFDoXKXxHzHW3hc/1OLHBUg2oRHCvp
         wid/ovJpD7s/d5iP3J4YuaTzc23UVO8OELoTRfMw96pSdtPygHajkBcymSS8gtiaCwz/
         t2DFuaZAgaCS6HFrd0L3YRWRleEkthMybN3ptSimgTjt8b6w/ux5gZ4hzhYyUua/qfRJ
         NrkfWnf1gqbKOKIdtijHNsbIlo8SCzB7PPryUerg8rp3Y3F6z7ZaKzA1jnOLJeJW2vqa
         3EilOl3FpnWzu6RUrwzHdcGqqR/XqBGHb2qN1NwVf4uQmPog1WuTwGsT3apF818dncJA
         AgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749479123; x=1750083923;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JG77WgKR93x/LtBVjZqNlrO3c6x5SGKIjmb1nd9PqZU=;
        b=lHSmj7IL1202vZqtpp5VE7jeUwAF17vX92Bv4+7invNg+dBfuGRBQt7b12o6AHSulS
         jn+YRy+UgQwe1UQaC52zvt9TymWJ582nfKeykTp1ezKvti8SU6g3zzQqUaYg/iMDo/EF
         FJFry6ekFzha4WWkRfRtmWb9qt39VAbOuH9kJqnrZFnsi3F8g20vPbj8DJbwwT681Dpp
         7083kJ29VGKmMK2qzJxsJNCPNvS68nfmTmdpJCDnB+rx+uJ4KdlwG/bdg7LLg0H+5G35
         6EDr1Y08+l1hUJJrrnTTlR2fVVuOKRuT6kqnGGuYxe0q8r2SREhoGuKjM6rgDMzzVqnJ
         iMDA==
X-Forwarded-Encrypted: i=1; AJvYcCVLDOZ4udRow4jyZfh+eLJSIecpfMxrKlfXfnJgZBQ74OnewdSF8Yif480lx1yg2C28kJE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzr6qSEe3T0no5T5vwLdWR/khyrEoW+SXrJ2Qv32/EaIwe7nVZk
	MZeYhuWb9/8aA5Mp6dMb4SUTGv/B7cKKFBkaMuvHkHvpnfZqc0SdPccoeCQMau3pfKXylkHLV1J
	jaNTLI/ygS7Lm0IWPLwELGkHklxN1dg9LZRRibzg9EA==
X-Gm-Gg: ASbGnct8DUPGJszHYtlBJBwyx7E4JVKG3T5Rfo3MjRmElzlSjE3IPr/Eypj3DX8WtP6
	CE9e+wUcMcrK7r8p8+WASMKKpab1OhLXCnyliRYLQGjIbKbRvh8A2hXWDgKc/XVNsjGhzkCPMiC
	5x5OCc4g8plCzbJ9tP8ilLVkTycOFLvmq1E3C4OXOay/fD
X-Google-Smtp-Source: AGHT+IHLNEnuAme9eHASfWL8QqGkVGxEwvncLnTk7Ne6+v13yqzaemTTYFnukN2K2Zr05hKAsZjb76xfzqBgFfZg0J4=
X-Received: by 2002:a05:6902:690c:b0:e81:d3db:9e53 with SMTP id
 3f1490d57ef6-e81d3db9eb3mr5064016276.32.1749479123336; Mon, 09 Jun 2025
 07:25:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20250521033134.112671-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 9 Jun 2025 16:24:47 +0200
X-Gm-Features: AX0GCFsxQzRzF0fm7fx2jH_zKPRXvTdReaWYtTKHfDZG8Ytl7CNAKn6UVwNB5jk
Message-ID: <CAPDyKFogKcwssmQXSDQ+WFBP5iPMOHaK9RSAmRtn89MUnTJb=w@mail.gmail.com>
Subject: Re: [PATCH] mmc: sdhci-esdhc-imx: do not change pinctrl state in
 suspend if function irq is wakeup source
To: ziniu.wang_1@nxp.com
Cc: haibo.chen@nxp.com, adrian.hunter@intel.com, linux-mmc@vger.kernel.org, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Frank Li <frank.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"

+ Frank

On Wed, 21 May 2025 at 05:30, <ziniu.wang_1@nxp.com> wrote:
>
> From: Haibo Chen <haibo.chen@nxp.com>
>
> pinctrl sleep state may config the pin mux to certain function to save
> power in system PM. But if usdhc is setting as wakeup source, like
> the card interrupt(SDIO) or card insert interrupt, it depends on the
> related pin mux configured to usdhc function pad.
> e.g. To support card interrupt(SDIO interrupt), it need the pin is
> config as usdhc DATA[1] function pin.
>
> Find the issue on imx93-11x11-evk board, SDIO WiFi in band interrupt
> can't wakeup system because the pinctrl sleep state config the DATA[1]
> pin as GPIO function.
>
> For this case, do not change the pinctrl state in suspend.
>
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>

I have followed the discussion and I agree that there is room for
additional improvements (such as adding a new pinctrl state).

In any case, I still think $subject patch is the first step to take,
to fix the current problems. So, applied for next, thanks!

Note that, we may want this for stable kernels too, but perhaps easier
to manage that by manual backports as this depends on commit
676a83855614 ("mmc: host: sdhci-esdhc-imx: refactor the system PM
logic") too.

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 5f1c45b2bd5d..f206b562a6e3 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -2057,12 +2057,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
>                 ret = sdhci_enable_irq_wakeups(host);
>                 if (!ret)
>                         dev_warn(dev, "Failed to enable irq wakeup\n");
> +       } else {
> +               /*
> +                * For the device which works as wakeup source, no need
> +                * to change the pinctrl to sleep state.
> +                * e.g. For SDIO device, the interrupt share with data pin,
> +                * but the pinctrl sleep state may config the data pin to
> +                * other function like GPIO function to save power in PM,
> +                * which finally block the SDIO wakeup function.
> +                */
> +               ret = pinctrl_pm_select_sleep_state(dev);
> +               if (ret)
> +                       return ret;
>         }
>
> -       ret = pinctrl_pm_select_sleep_state(dev);
> -       if (ret)
> -               return ret;
> -
>         ret = mmc_gpio_set_cd_wake(host->mmc, true);
>
>         /*
> --
> 2.34.1
>
