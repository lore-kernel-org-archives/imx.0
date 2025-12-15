Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF56330B0E
	for <imx@lists.linux.dev>; Mon, 15 Dec 2025 15:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765813472; cv=none; b=IhILMtJUla7ihgG0aUr5PuTwZ9RNBFBQxW6meSq1g9pI4enuTCjV5sctdp4QLw0vSTYQslvrj+ZiPmwnwn1CBKTlTI/jdpj+s/uKy1Y1ddDz81wyYZopCy9WvdQPQhaGdeibLHRpfRrHQPfYNGZhMP0nyGPdAy0wdTsRlTdymd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765813472; c=relaxed/simple;
	bh=oh7t7Y1UKT4NrOUIgsCpbOBE6egrCN/cSMBdHQPp5KU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FUUrk7U4v2JGVvYmOL+TL8xHCWDfQq2Nd88yXYgg/JvO9fqBEkjbFDWDp0GqKS0IztokCsbCjzKnRMw13hBHuBvnteSQtkV4LOF1WmMsSoO4uF3c+V7jkMQ/6iQIAvL0G7hmKm5VqKzwQSpowkijA1uymwnpZjIcKIzds2VvRv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pVt4WT54; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pVt4WT54"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-64476c85854so3135417d50.0
        for <imx@lists.linux.dev>; Mon, 15 Dec 2025 07:44:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1765813470; x=1766418270; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ord/Jy3WahxWv6+pZLQ5784ppmb+r7KH+dg1CMH4bX8=;
        b=pVt4WT54MiUYxRYaVIuRdderVPnOcpwVXnMa3VoSjRYrrBV26N5ta7h7tQK0xyARLI
         5lilFwLHeu1ciIGppv2U/iyRHz5lZ28vD6kOAbpNoj+VkxtAPFxGYcNk5tri3t5//Ojr
         a74sz8+HGUgTxbDnpLhQJ1xmaZ1KGH8tYcNeEgx5JyvyM1uqgHk46E2lwFZmOGhLzv7X
         q5jyWXIr3m6MkI0OdXfSUJDvWCTDIjre/PLf9Nn/Fr2SNItkocZA8whQrZ/o0Y/9Wj7c
         vEUxbiySS9SZ90mHz0e+3WAip2LYihF3lqDV1JujtGTjoALXnVNyCE3MDJr86iR4APbQ
         isTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765813470; x=1766418270;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ord/Jy3WahxWv6+pZLQ5784ppmb+r7KH+dg1CMH4bX8=;
        b=N15POFzxRUL4Nss0vDxOxcO+g4Yes20iI6Z2PRWWLEKUxyNSSoArHC+YyppDmC1JUc
         CSD9V08soL4leDMgJLLrV8Myk+pFL8u8ehVmM+BguslBw4DzYo/Y/dNfdUzzTz4fP4/n
         j+dOxFbRRZM9abuAC6Yp4k/NeKwYt8xxExr/ySQkNmjje4UDjoNdTKoPON2wD0xXYsOd
         lbsaaKLoQs/N29+mnWF/fbQ+U03Swb0AIuWAHTfWv0MKXG0fVzvEnAELSvQYkh5cdJRc
         oFHW3T82htMFahnXzvf+eOrYcro2Q6E6B+fs6jj6JckhihKeBUeEWWB79543z0109m8Q
         Vyqw==
X-Forwarded-Encrypted: i=1; AJvYcCWaus7YJGMmx2GIrsZrZ3wGQqLfwAy7s+kenn0tQtJ/qX5Lu0S53MLh1qSDpzvIY1JptOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX+8zEcF5z6UAXCnoCV9wJM8hs029+a0IpIdywFP/xnNncPwrp
	5Yy7Q/Wkng40xaZSfRbN3fmNoQcYYFqbuoqE6aW/ERcyF/kRl59ZzDZyr7V/FyC4y5LET1sVsWj
	AtN3iGXmmlcsEUPLKpg5Mpl+z0dOXiJSKZ7otJAo0dw==
X-Gm-Gg: AY/fxX5o/yjEU5MzQ80BL1dMLDpPGS1rTqQmcYlVwhKnRH1XLTTHdTtOmwNhMxYABcN
	h8Hpc5//8ZI01mJ6DK75fcnJooMfQq5e+WpPh/CiZLB5nU5JSLp2O/jQmfrkq+joVsVWfMuy+aa
	KkFkSnUlCeg2pudSQxEpynRZMjSSSXRXu5+1BBoe2BK8FTNfVv4rwUxySulnGB3JcT51zmpHlrO
	R3bE1Xo1TAZxxHmHoc+MJkVFi3tKksPsAK+mEHosqH2v8PCP0xBj29hwMTEyQRicA5MuJUVZQYQ
	XPuSLlU=
X-Google-Smtp-Source: AGHT+IGxCBxLGLcpkIj+jez6ANmJ4exNQ8Wr/4dDc0WAdU190RCcv+pOqA12XWUdU8Vjc9SvszOHHjoOqEIbTFqx89I=
X-Received: by 2002:a05:690c:6e13:b0:789:2e24:b786 with SMTP id
 00721157ae682-78e66e070d3mr187460127b3.52.1765813469661; Mon, 15 Dec 2025
 07:44:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251211075603.533033-1-ziniu.wang_1@nxp.com>
In-Reply-To: <20251211075603.533033-1-ziniu.wang_1@nxp.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 15 Dec 2025 16:43:51 +0100
X-Gm-Features: AQt7F2qa6bOsFFPkIXDOILPIyziznpqvGTVPwjQsBL7LP2bNagwnbWCy9hfeguc
Message-ID: <CAPDyKFo4o=V9H-U+HBGTtog58=0QkDzepBR2HFqU7Giede8xAg@mail.gmail.com>
Subject: Re: [PATCH v3] mmc: sdhci-esdhc-imx: wait for data transfer
 completion before reset
To: ziniu.wang_1@nxp.com
Cc: adrian.hunter@intel.com, haibo.chen@nxp.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-mmc@vger.kernel.org, imx@lists.linux.dev, s32@nxp.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 11 Dec 2025 at 08:54, <ziniu.wang_1@nxp.com> wrote:
>
> From: Luke Wang <ziniu.wang_1@nxp.com>
>
> On IMX7ULP platforms, certain SD cards (e.g. Kingston Canvas Go! Plus)
> cause system hangs and reboots during manual tuning. These cards exhibit
> large gaps (~16us) between tuning command response and data transmission.
> When cmd CRC errors occur during tuning, the code assumes data errors even
> tuning data hasn't been fully received and then reset host data circuit.
>
> Per IMX7ULP reference manual, reset operations (RESET_DATA/ALL) need to
> make sure no active data transfers. Previously, resetting while data was
> in-flight would clear data circuit, including ADMA/SDMA address, causing
> data to be transmitted to incorrect memory address. This patch adds
> polling for data transfer completion before executing resets.
>
> Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
> Reviewed-by: Bough Chen <haibo.chen@nxp.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
> v3: add define for timeout value
> v2: amend commit message
> ---
>  drivers/mmc/host/sdhci-esdhc-imx.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
> index a7a5df673b0f..97461e20425d 100644
> --- a/drivers/mmc/host/sdhci-esdhc-imx.c
> +++ b/drivers/mmc/host/sdhci-esdhc-imx.c
> @@ -216,6 +216,8 @@
>  #define ESDHC_FLAG_DUMMY_PAD           BIT(19)
>
>  #define ESDHC_AUTO_TUNING_WINDOW       3
> +/* 100ms timeout for data inhibit */
> +#define ESDHC_DATA_INHIBIT_WAIT_US     100000
>
>  enum wp_types {
>         ESDHC_WP_NONE,          /* no WP, neither controller nor gpio */
> @@ -1453,6 +1455,22 @@ static void esdhc_set_uhs_signaling(struct sdhci_host *host, unsigned timing)
>
>  static void esdhc_reset(struct sdhci_host *host, u8 mask)
>  {
> +       u32 present_state;
> +       int ret;
> +
> +       /*
> +        * For data or full reset, ensure any active data transfer completes
> +        * before resetting to avoid system hang.
> +        */
> +       if (mask & (SDHCI_RESET_DATA | SDHCI_RESET_ALL)) {
> +               ret = readl_poll_timeout_atomic(host->ioaddr + ESDHC_PRSSTAT, present_state,
> +                                               !(present_state & SDHCI_DATA_INHIBIT), 2,
> +                                               ESDHC_DATA_INHIBIT_WAIT_US);
> +               if (ret == -ETIMEDOUT)
> +                       dev_warn(mmc_dev(host->mmc),
> +                                "timeout waiting for data transfer completion\n");
> +       }
> +
>         sdhci_and_cqhci_reset(host, mask);
>
>         sdhci_writel(host, host->ier, SDHCI_INT_ENABLE);
> --
> 2.34.1
>
