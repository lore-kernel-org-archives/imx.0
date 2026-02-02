Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 623CF2C21EA
	for <imx@lists.linux.dev>; Mon,  2 Feb 2026 20:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770063928; cv=none; b=tRP+/XRiluKrktOagoki1zx6JbQT2ysy/bfOKQG1lh1frMgZwJzBGtg2dBTSj1p4T73tRJqvieb1cjTjYrwaZfKks+An+PjERNQAIUQF1lCyyx977vW+R34u0eyqqm6DkTQK/I11DQAS3UBR1VXwjLTh+UeYPsNARL0E0d0eA08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770063928; c=relaxed/simple;
	bh=CxDKue/QwhEnlG+wJswifFJfqAtRqJfZjvjccCJpzJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lDNUeY1f6ivWQ5H/ssXKZ+Bh4w99svdxu+gKFqEHOV7Bxxcs2uCqNfUIeZ2SrzY6n2nImevC2FNmx1RaT5GuEI+VW2l0PESX8lRyI7IAJfqr1LHTqVJv6dDOzt0HOnmh6XWgVCDqwCtlbOKgIlHT4+TL6U3gx/UnCck9CTz9w1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBi5izYg; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBi5izYg"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-658b9e95990so9364791a12.1
        for <imx@lists.linux.dev>; Mon, 02 Feb 2026 12:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770063925; x=1770668725; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
        b=JBi5izYgyJRRTfQ/FoZSF+/nkgjiTZSQ1LmsfGhwcMX2QyeOPP9euMAP2uXkf6DEjy
         r8c6DIMq+b12oR5xlu4y6jv0af1T29hc0Nadno1PxOKzwWCYZS+31FMl9W915IhXoKev
         Vhf/LV7E8/cW7AV5l34rLGsBGqx/1Jukpgp7TANcexAEA4qfCOZ+/rdQy0fHaFQveFNa
         gMPkjCm9GiEFE5+dwn6DGEeLsSP84WP2iSzY6xJj7hMkpdKINb8BeyqgUd2gQAd/6XbK
         jfWwiGN0aODvFyzBRI//0ftun8jmpjK6pFeBxkbbquJFhxyaDBL2TaD7jCW9PWIfCQYZ
         0ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770063925; x=1770668725;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjBpuLkcLUaCRKPdP4eX6OjLAhe9FJoKGb09vlloYBU=;
        b=AkWIhJx4T5u7n9sRcVXC6oGfv2Dp5k5dgkDQPyQ73MgDZ2zUfzNsuaBiDDni4zij9v
         cHySCTa5toCxRklbkdDXBTE0vdAYPpcAUQmuida+zA0HgCpEdcGFysaGJt8a6u4Cr/Rj
         7S+kZgqP5ZSVdxGOP2f1FpaB4pF6aAYOL3ST7e8c9HnUxg9jbE0RVQwmmCOPDrIPvuW2
         Dn3UgC40erOrJyNMIgw4/5PLzIwRJUXTE3Bh18kcPfKnbDJkuMgLE8ojb6SAmgiZt333
         fGZSsfDfXHo1QTny2FphWzAyxpe5n4KoXeLjMXjpyXVpVGVjlUiokwx7uyNVNnP7Iu0k
         Nv8w==
X-Forwarded-Encrypted: i=1; AJvYcCWEWFo1tgNBGcP4EZhVSZqPqR0jTav7oyMlu8vBOozcQ1lDZyronZ+fDMoWyVON19lgSCI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwUXDFfWw+p8cRrpBmOuSE0iOp3aFuLOZqnvMWj7xCP+yUihCO1
	Wl6BJAihzuicpuy52TOahEDCoBe6Nnt83MkfrHY2zILD2SiQf312NUREjG8R5g==
X-Gm-Gg: AZuq6aJev04KcBJfCZkZz3ohTCyXEUCT4TssQjqPxeQoVgfu8y2G9ZOU8qfuLmMdHg2
	DFmYAsjGvo7dmck4fu/O1NtQnAuW9GIQ9V6BnMwpfZHWHuU+U+kF/OQC8KkU/rQ2INyDXQbOB50
	/dfLj2FGy67uWHN8z6UXUjN25xP4X97uyMsmeG61TA5zfp8PtmywiHAPI9Og68LowfrP0QSZofP
	IX9EHSVTBH7ov5Au4tmprF8/MazACWWI1NzKGFPrapb6YhA4NbEy8LDgW5hW4kw2/4QuFLAsvFq
	s0CaNvYuZsRr1QNunVRuj716o6p0qzGm160VsopoluOZm2Qa8+N2wjFwEjdj8c3A3svoUhY0toC
	UTGcw1nUCvP/hG2/bQuwB8W4F4FuZhxdDqlQC8fKnmECocCFi4e+kc14fElb8uQXlWkefi4N4md
	gL5xWx5mKyqlAZ+sNpdHHik7TKZl+nKZe6ixQ=
X-Received: by 2002:a05:600c:1385:b0:47e:dc64:f1c6 with SMTP id 5b1f17b1804b1-482db493eb4mr189595615e9.6.1770058495160;
        Mon, 02 Feb 2026 10:54:55 -0800 (PST)
Received: from [192.168.0.7] ([86.124.200.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482db623407sm125687055e9.0.2026.02.02.10.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 10:54:54 -0800 (PST)
Message-ID: <f95f73b9-d024-4697-bca1-02fb8bc044af@gmail.com>
Date: Mon, 2 Feb 2026 20:54:52 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: provide flag to disable EEE
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Clark Wang <xiaoning.wang@nxp.com>,
 Daniel Scally <dan.scally@ideasonboard.com>,
 "David S. Miller" <davem@davemloft.net>,
 Emanuele Ghidoli <ghidoliemanuele@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Fabio Estevam <festevam@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, imx@lists.linux.dev,
 Jakub Kicinski <kuba@kernel.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Oleksij Rempel <o.rempel@pengutronix.de>, Paolo Abeni <pabeni@redhat.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, Stefan Klug <stefan.klug@ideasonboard.com>,
 Wei Fang <wei.fang@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
Content-Language: en-US
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
In-Reply-To: <E1vNUjC-0000000FhjR-0h6P@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


Hi Russell,

On 11/24/25 1:27 PM, Russell King (Oracle) wrote:
> Some platforms have problems when EEE is enabled, and thus need a way
> to disable stmmac EEE support. Add a flag before the other LPI related
> flags which tells stmmac to avoid populating the phylink LPI
> capabilities, which causes phylink to call phy_disable_eee() for any
> PHY that is attached to the affected phylink instance.
> 
> iMX8MP is an example - the lpi_intr_o signal is wired to an OR gate
> along with the main dwmac interrupts. Since lpi_intr_o is synchronous
> to the receive clock domain, and takes four clock cycles to clear, this
> leads to interrupt storms as the interrupt remains asserted for some
> time after the LPI control and status register is read.
> 
> This problem becomes worse when the receive clock from the PHY stops
> when the receive path enters LPI state - which means that lpi_intr_o
> can not deassert until the clock restarts. Since the LPI state of the
> receive path depends on the link partner, this is out of our control.
> We could disable RX clock stop at the PHY, but that doesn't get around
> the slow-to-deassert lpi_intr_o mentioned in the above paragraph.
> 
> Previously, iMX8MP worked around this by disabling gigabit EEE, but
> this is insufficient - the problem is also visible at 100M speeds,
> where the receive clock is slower.
> 
> There is extensive discussion and investigation in the thread linked
> below, the result of which is summarised in this commit message.
> 

We are seeing the same lpi_intr_o interrupt storm on the Renesas RZ/V2H
EVK (dwmac-renesas-gbeth.c). On this platform, lpi_intr_o is routed as a
separate, dedicated interrupt line to the CPU rather than being OR'd
with the main DWMAC interrupt as on iMX8MP. This corresponds to the
"eth_lpi" interrupt in the stmmac bindings:
"""
- description: The interrupt that occurs when Rx exits the LPI state
const: eth_lpi
"""

Looking through the other glue drivers/device-trees, it looks to me that
every platform that defines a separate "eth_lpi" irq might have the
interrupt storm problem.

To fix this issue on these platforms, rather than disabling EEE
altogether, would it be possible to just not request the eth_lpi
interrupt and let EEE continue to work? Perhaps a new flag could let
each platform decide.

If not, maybe this patch could be merged to add the flag that disables
EEE and I will just send a patch to disable EEE on our platforms as well.

Thanks,
Ovidiu


> Reported-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Link: https://lore.kernel.org/r/20251026122905.29028-1-laurent.pinchart@ideasonboard.com
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> For Laurent to add to a patch series appropriately adding
> STMMAC_FLAG_EEE_DISABLE to dwmac-imx.c
> 
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
>  include/linux/stmmac.h                            | 9 +++++----
>  2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 6cacedb2c9b3..ca0eee58a8a8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -1324,7 +1324,12 @@ static int stmmac_phylink_setup(struct stmmac_priv *priv)
>  				 config->supported_interfaces,
>  				 pcs->supported_interfaces);
>  
> -	if (priv->dma_cap.eee) {
> +	/* Some platforms, e.g. iMX8MP, wire lpi_intr_o to the same interrupt
> +	 * used for stmmac's main interrupts, which leads to interrupt storms.
> +	 * STMMAC_FLAG_EEE_DISABLE allows EEE to be disabled on such platforms.
> +	 */
> +	if (priv->dma_cap.eee &&
> +	    !(priv->plat->flags & STMMAC_FLAG_EEE_DISABLE)) {
>  		/* Assume all supported interfaces also support LPI */
>  		memcpy(config->lpi_interfaces, config->supported_interfaces,
>  		       sizeof(config->lpi_interfaces));
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f1054b9c2d8a..5ed49d5363ee 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -187,10 +187,11 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_MULTI_MSI_EN		BIT(7)
>  #define STMMAC_FLAG_EXT_SNAPSHOT_EN		BIT(8)
>  #define STMMAC_FLAG_INT_SNAPSHOT_EN		BIT(9)
> -#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(10)
> -#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(11)
> -#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(12)
> -#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
> +#define STMMAC_FLAG_EEE_DISABLE			BIT(10)
> +#define STMMAC_FLAG_RX_CLK_RUNS_IN_LPI		BIT(11)
> +#define STMMAC_FLAG_EN_TX_LPI_CLOCKGATING	BIT(12)
> +#define STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP	BIT(13)
> +#define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(14)
>  
>  struct mac_device_info;
>  

