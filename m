Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A942D3A2565
	for <imx@lists.linux.dev>; Mon, 16 Mar 2026 15:16:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773674174; cv=pass; b=R2lFHqNZ2AbylHrSeELfMOlCliCSVkGyFW7JY4sh69b8Xw3cVkwRulfUv/WmgI8TiQ3qhDaNfMtHMM/crv9JGZZVmgliTGGajhCcC5xXjdt7ZwbTAKBGfITflYzEVmtM7KLkPlHpeiwkWV+H5pdX5ZApYFKWxHntChF9pwHg4x4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773674174; c=relaxed/simple;
	bh=2FQCxSJ/4hTYflwKI5bvbcXdiLbSbgtV9c+hs2wiqNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cryH7v9hgXC69n3mX3VEWL4tDK82lWYgZQ6TgFSO8FfsHA0wfK1JGzqJL/1dxjHkRGCqNsn8+3U5vA9rVAnRmls/akDc8eLqfWpp+znfOINW5QLX4dLk1PWwHyw9DYI8T3KzWUNLOWJGmZ6RjzHFW1CmL9T8CY8511RCD1R3J6g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xItgklKk; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xItgklKk"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-38a76ba6a78so32212621fa.0
        for <imx@lists.linux.dev>; Mon, 16 Mar 2026 08:16:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773674171; cv=none;
        d=google.com; s=arc-20240605;
        b=UEBDWyGCqwHEjr520JqyaNQ8NRJXLPU3bEKFIQTFF2QAzUue+kUjuZAsiPYYBTjjgO
         2K+oypM2EKGUF/yaeT4ktPRtT4F/e3555rLrX+amKJ8Han3XH0GB6LPxChifk1qVPZl1
         7ya9bNxOLVRTVg+1QyHz85fAiexgsc8LqQof3IOWnAmaKdyw0kUsPQleB7LWACEzEgyY
         ohbTcRNmVBSXsRq4qIvWSCeOkCSOugesn1ZH/bgP/Od0LHdFvwYDAhWapoeHjoc79Y5N
         j4UdaG9UgglJTtMa5i2E7q5uP6GL416JBJmIDL6VUDp0nu+ECtUl/w9pYzd/951A6ABL
         nDcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        fh=B8bb65L8ca+McSoZxzWsFh+iJsflwOMwi0hoXqbKBA0=;
        b=dkk6cG8McPPCv7Q1jOnrEPvy7VsYqOK1418HG823sHcYcNP0EGesjdzQZbo39+hFzz
         uslnWrEk418vvlCMbzRYFGVz/RtDdb4d44Zvd6E2ohXJr9pNyZK6rbPXVr26X7aC0p5n
         zWhYlycTjswaO3X4eJA75mRzMJf/xEcyJm60rR5bDOCKbRChUEcr75Cb/Lu0XD4nJmbN
         tuRRR5u12pdxlWrDkVvQiWfVINuN3Mg1CZ7BpYDya1r8Y7oaCqJCKL/M5CY8Ss8sbANR
         BjOapbMdxEkVofy4D8o2YS8ZN5MkbNSwjJcP8wdW4naUNSMaPdPV1Vf1WOwCVsrkI7f/
         Wp/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773674171; x=1774278971; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        b=xItgklKk6QDi/qAXdTWP+APldwbEtbppfM1WSXZ2xUvjZf7wNBe1gHhQ1HUIZHulqF
         hii6lT2ZnGHsbbVS73Wjb2rEbH8ANjU1NqQ4QIFmUeItIxY7eBsCzGq9RvkuxBA6Auq6
         eE8+lsxiqfbCHEov005THBdIlE771qZ1XbCcpJWc4HtWGNjeAGcBn/EpSmTNHFC+8ABo
         pJBGXJl8LqOuXMQV8WqdrTUnEDOolWfueJZ+T0/qu/KVS65QOsKvl6gqKlxZ1NL7y1Xy
         5unpMBsLLPjuu+lrVsLXoGuJf541W2uYk0V349WmoLJAxSiRq0WWh+QY/TCPGX0B48qv
         UgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773674171; x=1774278971;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Gq1eBaEcIEjNH/OfJcPwaRMPgUoxIYY1WJRFUp5FfU=;
        b=MbJmMjZ3eTCCln83+hfk/GZ7Do2MzBamckJ/NQrGhZP4qq886zcLosBTD/jz0GWH6r
         aNSGOt3NcijWpTMeX80Hx4wL9EKM4XEpN9pCx4IjK1bTnsb0q+4NWXXnOT9PbgCl35Tm
         aHmdebAKWvB03FGqHFadsqVfxx5IEZvLeIGTtsoYxXDoB72myWJMxZ0Wxf4KiGRaH0vx
         fH/XstLHz1i/rOglbhFYfPxYKMAkeEsttpsR7gTm0PzsDKbKWRevdUVwt0rg5vJ323gF
         bcEjsHUHOnb0FEJ+po8x6Qw+5LFJ4QChCSKx/KItVqH50p4Ps4YAvdSS62nGtz40OndK
         Cd8g==
X-Forwarded-Encrypted: i=1; AJvYcCUd8E4i1JRdIZ/C/FjpkZLrWG/nIEAce0QSJC19HuXPMuu3P7qQQJ7e+6LnXeuVwMax4b4=@lists.linux.dev
X-Gm-Message-State: AOJu0YwmeMimtLsogfPv4VOFn0sfd9CpPfYd4ZXxvzBfDM6hbiMoCyj1
	oxE1Wgf66K8eA+FVGAHwdX2NIqNj0LWjLA0MStu65IjWWvju3b/0yY3kg4+jf1n5f8YjXD8XsC4
	ev9QKvoikajpEVpWiE/GDQncftIIBhX+eKrh8F5XlZg==
X-Gm-Gg: ATEYQzxj/aerFWMrCoo0P81bs2s1/cAmwLOD7QFPs9bjbGa8kbgXuvuQTlaiWOqPT5t
	yjKcfbQCy5K/y+qgf+Ly6vbrFIbolBPeO9QR5GQ1jsbcV+MHeG5zfUIapAR2Qgl3wm7rNGxabK2
	CYZU5N26iKCeFGx5uHQT9cqGdXfpmztCtNxyPnMQoKsQZbqTOPhQNXUZiAJdBAI/LqWu2r9JGM6
	lEP2jIN+FtyuVpSNuhpsC4pWdEh95UL3TgBVu70aNIbapu/MshRra3thsmJ4msNPl5oJouALZtq
	Ydq/Ujdt
X-Received: by 2002:a05:651c:544:b0:38a:aba:9c0b with SMTP id
 38308e7fff4ca-38a897d365dmr43927571fa.27.1773674170737; Mon, 16 Mar 2026
 08:16:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260311095009.1254556-1-ziniu.wang_1@nxp.com> <20260311095009.1254556-3-ziniu.wang_1@nxp.com>
In-Reply-To: <20260311095009.1254556-3-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 16 Mar 2026 16:15:33 +0100
X-Gm-Features: AaiRm52yvrWjzyiC1WQIkEheabNUD7pScP7tLn4Y188s1jdcCNFrCPgRy13YRRo
Message-ID: <CAPDyKFoU9hE_ZRbiK8m6Hso-xGQEdTpaTvJshTdSbpD-Kqra1A@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] mmc: sdhci-esdhc-imx: add 1-bit bus width support
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	imx@lists.linux.dev, linux-mmc@vger.kernel.org, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Mar 2026 at 10:48, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> Add sdhci_get_property() call to parse common SDHCI DT properties,
> including "bus-width = <1>" which sets SDHCI_QUIRK_FORCE_1_BIT_DATA
> quirk for 1-bit data bus width configuration.
>
> Remove the duplicate "no-1-8-v" property parsing since
> sdhci_get_property() already handles it.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Acked-by: Adrian Hunter <adrian.hunter@intel.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index 97461e20425d..b607d4ffc562 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -1813,8 +1813,6 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>
>         of_property_read_u32(np, "fsl,strobe-dll-delay-target",
>                                 &boarddata->strobe_dll_delay_target);
> -       if (of_property_read_bool(np, "no-1-8-v"))
> -               host->quirks2 |= SDHCI_QUIRK2_NO_1_8_V;
>
>         if (of_property_read_u32(np, "fsl,delay-line", &boarddata->delay_line))
>                 boarddata->delay_line = 0;
> @@ -1833,6 +1831,8 @@ sdhci_esdhc_imx_probe_dt(struct platform_device *pdev,
>         if (ret)
>                 return ret;
>
> +       sdhci_get_property(pdev);
> +
>         /* HS400/HS400ES require 8 bit bus */
>         if (!(host->mmc->caps & MMC_CAP_8_BIT_DATA))
>                 host->mmc->caps2 &= ~(MMC_CAP2_HS400 | MMC_CAP2_HS400_ES);
> --
> 2.34.1
>
