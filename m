Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B628332B9B1
	for <imx@lists.linux.dev>; Wed, 21 Jan 2026 16:16:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012221; cv=none; b=Q0pl5CL4WpH8Oc54GJkEDKaOMMuAN2/qPzSnR1RVRB0jXB77ZLLV3IMeX/zPyUM5MvcX6cC8md8DTkVk+y7dvYwx6etT6i4SiFy47FqmqSaSRsEOQxtU+75n8pKZspdR9akG0Oqi8IGPCNn4xN/aXM3sDIUBYDTjgbYeBrLErgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012221; c=relaxed/simple;
	bh=DyXg/G7iri322bhIBm8DDllUjPJ9msomjgd9hyUfkhM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LV10OFD1sMVkg1ivHtUAeODI5NFJIyORABFzdG4vxLgib+TB5gOecHudUMK/tuDuX7OsxweMQxZvYeaqZ1JrnUPYO2pztwRL5JFGaz2iT5l9rarDdjTVy1NMPXulBrPH+ePpenIJx2RCcLpFiw5YA1jOXSK8VsdJhLWUA7Flr3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Yonk4ZLW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Yonk4ZLW"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4327555464cso3691357f8f.1
        for <imx@lists.linux.dev>; Wed, 21 Jan 2026 08:16:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769012217; x=1769617017; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
        b=Yonk4ZLW7q0IWgsYq/mesQ7/YwszfhaTWGa2bHho1kl8HG2izEeswQ+52KgRGgl+Ld
         ebvbhylzKhiwFegpbLyM5AYkB74UISHYVQUzVZhhiB+K7hdGadHzxjSRM7DL2Ok2gIl8
         F9cmtBa4Lat9pIZioJOESdO8aiDVGnS1UKRTkWALq32AHeWDDC7R4fd+JG9CrM67GEJz
         2HuXVNDiRC4Zusi+r6n53OkhkJIAu3f1zEleD/+yEPWIC1OP642fmPc6vWfDl68Bil0E
         Ymx4zTtmXOH79vwsSgBYjgSZ2fjiGWMUtvPOu843fHRGu+lYALn3EAeVoFPu0jbijrWn
         uKJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769012217; x=1769617017;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BzzB/JdMiWn1k4ZgZ9PFa4Ldz6czCrDQgy/x5b2bitI=;
        b=YiOdHQv8LL0RRoPkT+GQf9vNQ2dMxpdSkvc9yEuEiW171UpgqagWgDuEN3vr9oHrHZ
         4MWwdILNL4jZuON/YW0C0DSXvHscXbVnDcFPbM6qq3u1ay1Zg1jarVsTva/JLX+pURV8
         TaKJKXJ9qow2dwFMFaDPFj2GCyRGqKDITh/ryQS45JuzwhP4Z3bVQx1vIpmujLo5h1oZ
         bdWFa/2oli8f+ZGyG7xMiERYbWz++RZiOfBE6X+0Zdv3O+tzS1BPiyRkwT/jVRsf2SwD
         h2GkKv6lsdPkQWd6gblxOWZnlklDEfzfvpYAeGYhrhIycS5S/PiQNg5opM22Mh3Gon6+
         w4mg==
X-Forwarded-Encrypted: i=1; AJvYcCUE4JqogY/hEWajM8uuUZp+Cr4p4XXyg5UfWjbuVEHbcy9oRppAFM6ufS3UJaByYl+UZ6I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyDK7q4E1iaBP0xomUhEAkisRq+/w6VWFcloxPq1HwQEZv7pwDj
	+vT5ExpVM+DE6mPaCEhFa5VRfAXssNcpxA0FhthY+NQMgvL0MhaphZFq7dP2OdA3pzg7CsHo+UQ
	bWdgh
X-Gm-Gg: AZuq6aK4tmHpsOtdrVGeo9KQzpwszxlopbfYB5lLSzDHQGcVZdIkMFBMPicvPWNNZ9e
	Hwx2qb/Icv1Nt/aRS7MiXs5HVeNmNZ/oE9VHZewft7AvNSOQiDKs8n60VummxdDNeZGNnp5z1LK
	yXt1c6nQ4FOnKJ8yOMp0LDTgf/JMQpO3xEA1/fQQ5b0QEnuKAtz1tmhkIAjNTve+BuyWnUfrXn5
	eQ6lKteVOtZlxD5T75nn6vkQyostOjmDXGfkYyx7sK4iVr9r7zjN5aS5Lu3nDqk98P6/NLb5m/l
	VvY9DTowdt2HrIkJCZ1uNx4rbUctBnSd2ip2baa74VIAj4PnzDlDWTcWaHm/N5IfXT+wp+Q/n41
	LE7Cn8fD3UKO1VPimZkgtRAkdhi88X1ADpAD84Ix8LPgg5YiNn4jtmYVn0TPHLTSc+SGNMjV3Rv
	3Ul0qFtAbKAr70AYn5bFlwZQ3y0KIFifi44YdUaZ8laB9i+Fhbo0AJH6gsYRf1cC34
X-Received: by 2002:a05:6000:220e:b0:435:9770:9eb8 with SMTP id ffacd0b85a97d-4359770a243mr7280369f8f.25.1769012216858;
        Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Received: from [192.168.0.29] (static-95-59-231-77.ipcom.comunitel.net. [77.231.59.95])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358e24cef3sm12633429f8f.0.2026.01.21.08.16.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 08:16:56 -0800 (PST)
Message-ID: <1e2d0c75-35d1-4096-a96f-c3fc6f7ce52a@suse.com>
Date: Wed, 21 Jan 2026 17:16:54 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 4/4] stmmac: s32: enable support for Multi-IRQ mode
To: jan.petrous@oss.nxp.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Chester Lin <chester62515@gmail.com>,
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
 NXP S32 Linux Team <s32@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, devicetree@vger.kernel.org
References: <20260121-dwmac_multi_irq-v2-0-3b829230d071@oss.nxp.com>
 <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
Content-Language: en-US, ca-ES, es-ES
From: Matthias Brugger <mbrugger@suse.com>
Autocrypt: addr=mbrugger@suse.com; keydata=
 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
 PVrr2NoUqi/bxI8fFQJD1jVj8K0=
In-Reply-To: <20260121-dwmac_multi_irq-v2-4-3b829230d071@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 21/01/2026 15:23, Jan Petrous via B4 Relay wrote:
> From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
> 
> To get enabled Multi-IRQ mode, the driver checks:
> 
>    1) property of 'snps,mtl-xx-config' subnode
>       defines 'snps,xx-queues-to-use' bigger then one, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           snps,mtl-rx-config = <&mtl_rx_setup>;
>           ...
> 
>           mtl_rx_setup: rx-queues-config {
>               snps,rx-queues-to-use = <2>;
>           };
> 
>    2) queue based IRQs are set, ie:
> 
>       ethernet@4033c000 {
>           compatible = "nxp,s32g2-dwmac";
>           ...
>           interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 0: tx, rx */
>                        <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>,
>                        /* CHN 1: tx, rx */
>                        <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
>                        <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
>           interrupt-names = "macirq",
>                             "tx-queue-0", "rx-queue-0",
>                             "tx-queue-1", "rx-queue-1";
> 
> If those prerequisites are met, the driver switch to Multi-IRQ mode,
> using per-queue IRQs for rx/tx data pathr:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: Multi-IRQ mode (per queue IRQ) selected
> 
> Now the driver owns all queues IRQs:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
>   30:    0    0    0    0    0    0    0    0    GICv3  91 Level   eth0:rx-0
>   31:    0    0    0    0    0    0    0    0    GICv3  93 Level   eth0:rx-1
>   32:    0    0    0    0    0    0    0    0    GICv3  95 Level   eth0:rx-2
>   33:    0    0    0    0    0    0    0    0    GICv3  97 Level   eth0:rx-3
>   34:    0    0    0    0    0    0    0    0    GICv3  99 Level   eth0:rx-4
>   35:    0    0    0    0    0    0    0    0    GICv3  90 Level   eth0:tx-0
>   36:    0    0    0    0    0    0    0    0    GICv3  92 Level   eth0:tx-1
>   37:    0    0    0    0    0    0    0    0    GICv3  94 Level   eth0:tx-2
>   38:    0    0    0    0    0    0    0    0    GICv3  96 Level   eth0:tx-3
>   39:    0    0    0    0    0    0    0    0    GICv3  98 Level   eth0:tx-4
> 
> Otherwise, if one of the prerequisite don't met, the driver
> continue with MAC IRQ mode:
> 
> [    1.387045] s32-dwmac 4033c000.ethernet: MAC IRQ mode selected
> 
> And only MAC IRQ will be attached:
> 
> root@s32g399aevb3:~# grep eth /proc/interrupts
>   29:    0    0    0    0    0    0    0    0    GICv3  89 Level   eth0:mac
> 
> What represents the original MAC IRQ mode and is fully backward
> compatible.
> 
> Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>

Reviewed-by: Matthias Brugger <mbrugger@suse.com>

> ---
>   drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> index 5a485ee98fa7..823700219534 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
> @@ -2,7 +2,7 @@
>   /*
>    * NXP S32G/R GMAC glue layer
>    *
> - * Copyright 2019-2024 NXP
> + * Copyright 2019-2026 NXP
>    *
>    */
>   
> @@ -149,6 +149,17 @@ static int s32_dwmac_probe(struct platform_device *pdev)
>   	plat->core_type = DWMAC_CORE_GMAC4;
>   	plat->pmt = 1;
>   	plat->flags |= STMMAC_FLAG_SPH_DISABLE;
> +
> +	/* Check for multi-IRQ config. Assumption: symetrical rx/tx queues */
> +	if (plat->rx_queues_to_use > 1 &&
> +	    (res.rx_irq[0] >= 0 || res.tx_irq[0] >= 0)) {
> +		plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
> +		dev_info(dev, "Multi-IRQ mode (per queue IRQ) selected\n");
> +	} else {
> +		dev_info(dev, "MAC IRQ mode selected\n");
> +	}
> +
> +	plat->flags |= STMMAC_FLAG_MULTI_MSI_EN;
>   	plat->rx_fifo_size = 20480;
>   	plat->tx_fifo_size = 20480;
>   
> 

