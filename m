Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52240372062
	for <imx@lists.linux.dev>; Fri, 19 Jun 2026 10:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864695; cv=pass; b=Fvnj5NilBmBHxtgwzJds4aEZeb9v5d0m44gOS0MgYwNUf/Fu2xXfgyndvwaCCZivx14woepZ3hFiD1rn4O71Q7cU0MzxJKunOFEnpskn0RDvs1TKDtWrO5waftdnW0ZE8b1EpUpLh9VvF6l+xNmDE4Jh3xXnAbCC008uZCS/SNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864695; c=relaxed/simple;
	bh=ni/12ceZsW/f1/rf10e0NeNiqZaIvmVbzOgM9UdT9bo=;
	h=From:References:MIME-Version:In-Reply-To:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Do5uqFp82TRrVv8sYHVzPgMd3q1GLQm5HUq4fd1yw7gWygWTmcbDH73+nK2NGpFM1LSv4fIiqZC/ajgYfK7zWaFVGFM2iXTFTMtuovszqv8MA+y9xTojS/9t0urT2EvEKWAHNcw1wZe/Yl8x/tTYZEusM88zNtcJCW/r9XEiYAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=gan6c7pm; arc=pass smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="gan6c7pm"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c074ac8adaaso233696466b.3
        for <imx@lists.linux.dev>; Fri, 19 Jun 2026 03:24:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781864687; cv=none;
        d=google.com; s=arc-20240605;
        b=Ye2YfYO19PFoIJU8+o1DXmtYTjR1zzCHk3hnW1G8mTlANi98GfRTf1ZbxZ4t+Q8gIA
         wjZCIaru55mE3iw9W0ii+yODAJ7enIsS4IcbqQr1i3blBdkrapnIOyivgoaK8uCCSJLH
         ZhSbp/CiGGUbyyjNX5k5f+xjx2ZoOUZXswlKH+EgwOVlYKRVtfmJrOisVOBGcxhpofcW
         Z+HOlfI5cIxRdYH/K5jjS33Ymh//p3/Pyskl4BR7Ns/wPoECSASl4CC8yPExxX4IpZoK
         duE88iLgJIrxUz5TeVWOPe90ObheCOmvfHpNday0WwJrXQFNIx4dWIQ8yt7xuOMub+dz
         u0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:dkim-signature;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        fh=tdr/QhTWe9pF5EIwwX6C01djrfJQc81Gj0MCqRkZ/94=;
        b=B5+QOAdULDLUbwMUWvuhDmNJHN8tGnn11jbWtvhuljgbSFFNdPXFGJHNw9OdzYyMg6
         wZXptafY7ZoEr0bsKCXMDtVbGdxi/4nc1YsJ1O6cZw7EK9rocNCQdvHXJMzh5DXtTGuA
         0xLpLaB/7BtpgvPc3FRIy4Yh6SIA7YFRpns19a6OJgvwFMTBoyVbmP7VzGqjCYABS78h
         +jfoUf94y+YTio2NR3CCMO1amRPxU9tNfB0Sz9IFZJHw16j4V4nKDZuCZT5jkN+ff1V7
         Bd9C6e8uyrVda8pxNCGJvDBw7T17PPND/aVURZV5o8OAcrwtttD6S0MbVB/97ZuQp1lM
         gk4A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781864687; x=1782469487; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        b=gan6c7pm5Fvm778+k0s/DNoAcYr43I0XvbzAistKx0ke/ePubLbgooXQEC/rLX6Tjb
         b4IvcTzGaCEiY9qcg1u9ush+7YQb0+FoiTeOIxt/3mQox2no4ockrvOb9rvbsODJUmpz
         OIKqBRWUojeFSBlTDZNcdtwB+8NyRFL6DDYSRO5SjrwRGQIdtVfvxKSt3TKC8MvvdkDM
         2y9V8Mc+7G2FBiSTFfV07fe+B3Ci+3hR5MnObQAHeJvsKJUniVtL1ZtjNz9up5vK7rn5
         v4hPUIcM3uGt4MTlgw0szcmxApxrQex4J1fRgmMNtlKeoLeQhgfh2ct3xm/qxb4OdZ6/
         dVlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864687; x=1782469487;
        h=cc:to:subject:message-id:date:in-reply-to:mime-version:references
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqKnecBtz91u9GFBS0SkA37VjcFvmopZ2JwgbXFMYUM=;
        b=YuFJHuNfXkJcZGoi4Vf/DQTLXABqz/GGDnLQuvKfJ3GyVzg2XP8cc8TnPZ+3xVPNyZ
         Hzn+tkiuaDJOxTY4fVyi3mepw4AMZt+NyKspXffcUB5GgkPKQ4+stIil5Fo6DGaUEHBb
         q1F6DxZLhPUChitr74E6YWc5i1Ls6bbPdJuRWXYvIRSUeXmzZs9P6HfrDLlu2g6ab9Ym
         k0/H54v63B4A0F9pZ2iXwxvmQRH+m/B/C5ZQ7uz7VnsUtMnkTMSKURvx3kiT32Atto1a
         8PP33CTX1hcv4CFe1saT0a9bGx/a7D+o1XAg7afJ17dSst1VvDhA+PZoaSr5vdDj2pBc
         3S+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/9xcOr5BhCrbwDwmxTth4LUzz2GGtrRMgkxjouPCsjArCM+sX4diQthuVJCyNJLE/HP8I=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzg9P/V5QzemzoBrcNvRpuRLjlqykWZPzCCcXrfp4rJ+WtaEvSP
	O/n7rUHDKCbxyb4byOlSlpjLI4D92j1AGnoyK7kw4ojkMIMkDrdN/vomjHg1PIc58fadpBBC9iF
	6vPILc5EuIu7RlDqomViIvxVQoeqXyZCBKN+uNpyywg==
X-Gm-Gg: AfdE7clBz37n7mGIhkWjoJcUEC5liIc0CHQYJTJ4DxFZh/LAD58axIFmeduGeNRRaMd
	/2Y25xRYlrY/vw0le83qnssBkLOj0aap/x9ml6ssXaM/iTpIZB0o93J8xgmzIIeKXvFjIPBOjfd
	HzFutB58EY1SAobA2PGK7kEtIwQWu4j5KOaMYito8eduwKi6/cmbI8/Z+YU9bZzIpPoJo+QMuPF
	eAFzNMjMEUGnJa8jm8OAPdOSRX93bI3qDWewQWfroMPefd7av6Lcc3HIdKPZl9aD0mLLpWaYaNr
	XHnwATOE8jkXm4KTIag8+shJPw==
X-Received: by 2002:a17:907:a786:b0:bfe:ed74:526 with SMTP id
 a640c23a62f3a-c09901bd9ddmr153293866b.53.1781864687277; Fri, 19 Jun 2026
 03:24:47 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:24:46 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 19 Jun 2026 03:24:46 -0700
From: Angelo Dureghello <adureghello@baylibre.com>
References: <20260609142139.1563360-1-gerg@linux-m68k.org> <20260609142139.1563360-5-gerg@linux-m68k.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20260609142139.1563360-5-gerg@linux-m68k.org>
Date: Fri, 19 Jun 2026 03:24:46 -0700
X-Gm-Features: AVVi8Cf5uu_-jErGjE81PbtvCv_YT7XlmD0BhPjrXgKYB7qRKbzp8TAf4rZ-9HE
Message-ID: <CALSJ-wBLOaQ69+Hy5sgYoBr=fx654sfcfw7du1O1p89B=1gF0A@mail.gmail.com>
Subject: Re: [PATCHv2 3/4] mmc: sdhci-esdhc-mcf: do not use readl()/writel()
 on ColdFire
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: linux-m68k@lists.linux-m68k.org, linux-kernel@vger.kernel.org, 
	arnd@kernel.org, wei.fang@nxp.com, frank.li@nxp.com, shenwei.wang@nxp.com, 
	imx@lists.linux.dev, netdev@vger.kernel.org, nico@fluxnic.net, 
	adureghello@baylibre.com, ulfh@kernel.org, linux-mmc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-spi@vger.kernel.org, olteanv@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi Greg,

the driver behaves as before, and it is not using "edma",
but his internal dma interface, no new issues are introduced.

Over testing btw i noticed a possible issue, totally unrelated
with your changes. Will fix it eventually.

Tested-by: Angelo Dureghello <adureghello@baylibre.com>
Acked-by: Angelo Dureghello <adureghello@baylibre.com>

On Wed, Jun 10, 2026 at 12:13:00AM +1000, Greg Ungerer wrote:
> The implementation of the readX() and writeX() family of IO access
> functions is non-standard on ColdFire platforms. They check the supplied
> IO address and will return either big or little endian results based on
> that check. This is non-standard, they are expected to always return
> little-endian byte ordered data. Unfortunately this behavior also means
> that ioreadX()/iowroteX() and their big-endian counter parts
> ioreadXbe()/iowriteXbe() are wrong. This is now in the process of being
> cleaned up and fixed.
>
> Change the use of the readX() and writeX() access functions in this driver
> to use the recently defined specific ColdFire internal SoC hardware IO
> access functions mcf_read8()/mcf_read16()/mcf_read32() and
> mcf_write8()/mcf_write16()/mcf_write32().
>
> There is no functional change to the driver. Though it does have the
> effect of making the IO access slightly more efficient, since there is
> no longer a need to do the address check at every register access.
>
> Acked-by: Angelo Dureghello <adureghello@baylibre.com>
> Tested-by: Angelo Dureghello <adureghello@baylibre.com>
> Signed-off-by: Greg Ungerer <gerg@linux-m68k.org>
> ---
> v2: moved from RFC to PATCH
>
>  drivers/mmc/host/sdhci-esdhc-mcf.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>
> diff --git a/drivers/mmc/host/sdhci-esdhc-mcf.c b/drivers/mmc/host/sdhci-esdhc-mcf.c
> index 375fce5639d7..6853521e8b2c 100644
> --- a/drivers/mmc/host/sdhci-esdhc-mcf.c
> +++ b/drivers/mmc/host/sdhci-esdhc-mcf.c
> @@ -55,7 +55,7 @@ static inline void esdhc_clrset_be(struct sdhci_host *host,
>  	if (reg == SDHCI_HOST_CONTROL)
>  		val |= ESDHC_PROCTL_D3CD;
>
> -	writel((readl(base) & ~mask) | val, base);
> +	mcf_write32((mcf_read32(base) & ~mask) | val, base);
>  }
>
>  /*
> @@ -71,7 +71,7 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>  	if (reg == SDHCI_HOST_CONTROL) {
>  		u32 host_ctrl = ESDHC_DEFAULT_HOST_CONTROL;
>  		u8 dma_bits = (val & SDHCI_CTRL_DMA_MASK) >> 3;
> -		u8 tmp = readb(host->ioaddr + SDHCI_HOST_CONTROL + 1);
> +		u8 tmp = mcf_read8(host->ioaddr + SDHCI_HOST_CONTROL + 1);
>
>  		tmp &= ~0x03;
>  		tmp |= dma_bits;
> @@ -82,12 +82,12 @@ static void esdhc_mcf_writeb_be(struct sdhci_host *host, u8 val, int reg)
>  		 */
>  		host_ctrl |= val;
>  		host_ctrl |= (dma_bits << 8);
> -		writel(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
> +		mcf_write32(host_ctrl, host->ioaddr + SDHCI_HOST_CONTROL);
>
>  		return;
>  	}
>
> -	writel((readl(base) & mask) | (val << shift), base);
> +	mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
> @@ -110,24 +110,24 @@ static void esdhc_mcf_writew_be(struct sdhci_host *host, u16 val, int reg)
>  		 * As for the fsl driver,
>  		 * we have to set the mode in a single write here.
>  		 */
> -		writel(val << 16 | mcf_data->aside,
> +		mcf_write32(val << 16 | mcf_data->aside,
>  		       host->ioaddr + SDHCI_TRANSFER_MODE);
>  		return;
>  	}
>
> -	writel((readl(base) & mask) | (val << shift), base);
> +	mcf_write32((mcf_read32(base) & mask) | (val << shift), base);
>  }
>
>  static void esdhc_mcf_writel_be(struct sdhci_host *host, u32 val, int reg)
>  {
> -	writel(val, host->ioaddr + reg);
> +	mcf_write32(val, host->ioaddr + reg);
>  }
>
>  static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  {
>  	if (reg == SDHCI_HOST_CONTROL) {
>  		u8 __iomem *base = host->ioaddr + (reg & ~3);
> -		u16 val = readw(base + 2);
> +		u16 val = mcf_read16(base + 2);
>  		u8 dma_bits = (val >> 5) & SDHCI_CTRL_DMA_MASK;
>  		u8 host_ctrl = val & 0xff;
>
> @@ -137,7 +137,7 @@ static u8 esdhc_mcf_readb_be(struct sdhci_host *host, int reg)
>  		return host_ctrl;
>  	}
>
> -	return readb(host->ioaddr + (reg ^ 0x3));
> +	return mcf_read8(host->ioaddr + (reg ^ 0x3));
>  }
>
>  static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
> @@ -149,14 +149,14 @@ static u16 esdhc_mcf_readw_be(struct sdhci_host *host, int reg)
>  	if (reg == SDHCI_HOST_VERSION)
>  		reg -= 2;
>
> -	return readw(host->ioaddr + (reg ^ 0x2));
> +	return mcf_read16(host->ioaddr + (reg ^ 0x2));
>  }
>
>  static u32 esdhc_mcf_readl_be(struct sdhci_host *host, int reg)
>  {
>  	u32 val;
>
> -	val = readl(host->ioaddr + reg);
> +	val = mcf_read32(host->ioaddr + reg);
>
>  	/*
>  	 * RM (25.3.9) sd pin clock must never exceed 25Mhz.
> @@ -245,7 +245,7 @@ static void esdhc_mcf_pltfm_set_clock(struct sdhci_host *host,
>  	 * fvco = fsys * outdvi1 + 1
>  	 * fshdc = fvco / outdiv3 + 1
>  	 */
> -	temp = readl(pll_dr);
> +	temp = mcf_read32(pll_dr);
>  	fsys = pltfm_host->clock;
>  	fvco = fsys * ((temp & 0x1f) + 1);
>  	fesdhc = fvco / (((temp >> 10) & 0x1f) + 1);
> --
> 2.54.0
>
