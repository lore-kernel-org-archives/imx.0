Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4EB1D47A0
	for <imx@lists.linux.dev>; Fri, 15 Nov 2024 16:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731688565; cv=none; b=UVPAWlq4paFqaew9Hcw8yC6sTM226krTfDddEJujB09KrATBvCmEJd/uKwUjm99rRpgz2uKACOnpUNg66m3gMKoF9O7TKs+8I6byakpsPOIMdsHXzzdpHPlx4ixv+Dy2FfFwLgPHmEcHYLu5Kxmxz8ufIhcwbCjitL/uUp0Iqjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731688565; c=relaxed/simple;
	bh=F0dKwfWND9Cr158pJFNX+LI79Kd6IcQezYwh3JmGItg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QX4U11Ld78ym4YxoKirR/LJWAhV2cVP/j5+u0gk/6e8Ef+c7BjxqJVa3FIjlPsASmmVOrT7NW/F2N1ExtVFBMbx48WrXdhlcjUvjHPGKC785AAATjxwxJaNJol+Cgsg/QPkeZiT+sGjB1b3btNQjxg7XmQUjnDCM0Nv6AiX2uno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2ZHp1oz; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2ZHp1oz"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-72061bfec2dso1611449b3a.2
        for <imx@lists.linux.dev>; Fri, 15 Nov 2024 08:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731688563; x=1732293363; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1rLKs7XMafDwKPJur3KVVVuDZ+Nk4nB0R3fvhHVGOI=;
        b=b2ZHp1ozzlfex1k9GpXpCcfSpQ+6kVGW7DIYKtZCWCQNi+ZqVyzLRQ476jPC3nnuNf
         V+P7yWznJIpyxFVA13Hg6sWAUS4JiIfY4uv9zixX8D+K1GndyvqT0PMn7xKWamgXpR4U
         gATGTIJvB3WD/sJ9sNcQDZTbxac23NOy1/IZOZSI/uoZSpOWq0iUFoj4JiOO6+GKijxl
         u6tKAVhB6L9tDLuhKLL8tGNQzDe0vJp4PE2MpX3X8rQqmKFVktW6DzUYrwgyIBTdQh5Z
         ozjkzLeYzAhQ7nStgeroswj8CaPCB8rqVKXfDsGI2UZUX+ynaUBgQi76zrRqJVulzlup
         G0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731688563; x=1732293363;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A1rLKs7XMafDwKPJur3KVVVuDZ+Nk4nB0R3fvhHVGOI=;
        b=Wq4HxONuYSc0Pw7uy+x48K7KT9cgcW+75Nye9dDwAwmw7MjOheHD4iRDWK+tivZtmt
         dWPog2CIURNaaQWX8ineL/zti5Wvn/YePhNtcpe5wNBs/UT7cPEZ7PYOxG+ctx0cUwfS
         xruN0BPR+zs0pX6Ihl4YMoOdTk5d/oBsHWcVtQ2kLJKFvWaohy87RcP7RzCMdxFzOZ8T
         xMT/sEr1Qx4xYL1aDz9D3CloCJ86OnF01QAZv3bIBvGrgOeINchcjkMvhgSQH636da7r
         VQ8aG80Wdzl0dQ94lhTFT+bu1qLol2v7Vp221NPv70fPblA8NQHIdy093Jje1K98mKKq
         CevQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSSwHN+YrB4keEEbSaaeGK7z7z5S/evTuQfI0eON73Vr/rjBpmwjQDGruGISjzdlsHu10=@lists.linux.dev
X-Gm-Message-State: AOJu0YwBuOrsmSNnuYxy7SqYct8XOy2VpBbNlxXAUdDp46UzDlBdZbO7
	miS8TqxZHw1krFg1M2zrifmDXALcNF4AOeK8/KG++ivehV+tzOxVl5mP+ybgRQ==
X-Google-Smtp-Source: AGHT+IGFnW6rFMw+hHUnNFuHyJmsLi6k9X5/Gsoh1t7i3szUhNuaPDcIgnR8yPSEXL5+AmJiguW+3g==
X-Received: by 2002:a05:6a00:b56:b0:71d:fb29:9f07 with SMTP id d2e1a72fcca58-72476bba9femr3943662b3a.15.1731688563135;
        Fri, 15 Nov 2024 08:36:03 -0800 (PST)
Received: from thinkpad ([117.193.215.93])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724771e8ad1sm1533972b3a.168.2024.11.15.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 08:36:02 -0800 (PST)
Date: Fri, 15 Nov 2024 22:05:52 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v7 1/7] of: address: Add parent_bus_addr to struct
 of_pci_range
Message-ID: <20241115163552.mk7msyu57oqqetaw@thinkpad>
References: <20241029-pci_fixup_addr-v7-0-8310dc24fb7c@nxp.com>
 <20241029-pci_fixup_addr-v7-1-8310dc24fb7c@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241029-pci_fixup_addr-v7-1-8310dc24fb7c@nxp.com>

On Tue, Oct 29, 2024 at 12:36:34PM -0400, Frank Li wrote:
> Introduce field 'parent_bus_addr' in struct of_pci_range to retrieve parent
> bus address information.
> 
> Refer to the diagram below to understand that the bus fabric in some
> systems (like i.MX8QXP) does not use a 1:1 address map between input and
> output.
> 
> Currently, many controller drivers use .cpu_addr_fixup() callback hardcodes
> that translation in the code, e.g., "cpu_addr & CDNS_PLAT_CPU_TO_BUS_ADDR"
> (drivers/pci/controller/cadence/pcie-cadence-plat.c),
> "cpu_addr + BUS_IATU_OFFSET"(drivers/pci/controller/dwc/pcie-intel-gw.c),
> etc, even though those translations *should* be described via DT.
> 
> The .cpu_addr_fixup() can be eliminated if DT correct reflect hardware
> behavior and driver use 'parent_bus_addr' in struct of_pci_range.
> 
>             ┌─────────┐                    ┌────────────┐
>  ┌─────┐    │         │ IA: 0x8ff8_0000    │            │
>  │ CPU ├───►│   ┌────►├─────────────────┐  │ PCI        │
>  └─────┘    │   │     │ IA: 0x8ff0_0000 │  │            │
>   CPU Addr  │   │  ┌─►├─────────────┐   │  │ Controller │
> 0x7ff8_0000─┼───┘  │  │             │   │  │            │
>             │      │  │             │   │  │            │   PCI Addr
> 0x7ff0_0000─┼──────┘  │             │   └──► IOSpace   ─┼────────────►
>             │         │             │      │            │    0
> 0x7000_0000─┼────────►├─────────┐   │      │            │
>             └─────────┘         │   └──────► CfgSpace  ─┼────────────►
>              BUS Fabric         │          │            │    0
>                                 │          │            │
>                                 └──────────► MemSpace  ─┼────────────►
>                         IA: 0x8000_0000    │            │  0x8000_0000
>                                            └────────────┘
> 
> bus@5f000000 {
>         compatible = "simple-bus";
>         #address-cells = <1>;
>         #size-cells = <1>;
>         ranges = <0x80000000 0x0 0x70000000 0x10000000>;
> 
>         pcie@5f010000 {
>                 compatible = "fsl,imx8q-pcie";
>                 reg = <0x5f010000 0x10000>, <0x8ff00000 0x80000>;
>                 reg-names = "dbi", "config";
>                 #address-cells = <3>;
>                 #size-cells = <2>;
>                 device_type = "pci";
>                 bus-range = <0x00 0xff>;
>                 ranges = <0x81000000 0 0x00000000 0x8ff80000 0 0x00010000>,
>                          <0x82000000 0 0x80000000 0x80000000 0 0x0ff00000>;
> 	...
> 	};
> };
> 
> 'parent_bus_addr' in struct of_pci_range can indicate above diagram internal
> address (IA) address information.
> 
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Change from v5 to v7
> -none
> 
> Change from v4 to v5
> - remove confused  <0x5f000000 0x0 0x5f000000 0x21000000>
> - change address order to 7ff8_0000, 7ff0_0000, 7000_0000
> - In commit message use parent bus addres
> 
> Change from v3 to v4
> - improve commit message by driver source code path.
> 
> Change from v2 to v3
> - cpu_untranslate_addr -> parent_bus_addr
> - Add Rob's review tag
>   I changed commit message base on Bjorn, if you have concern about review
> added tag, let me know.
> 
> Change from v1 to v2
> - add parent_bus_addr in struct of_pci_range, instead adding new API.
> ---
>  drivers/of/address.c       | 2 ++
>  include/linux/of_address.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 286f0c161e332..1a0229ee4e0b2 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -811,6 +811,8 @@ struct of_pci_range *of_pci_range_parser_one(struct of_pci_range_parser *parser,
>  	else
>  		range->cpu_addr = of_translate_address(parser->node,
>  				parser->range + na);
> +
> +	range->parent_bus_addr = of_read_number(parser->range + na, parser->pna);
>  	range->size = of_read_number(parser->range + parser->pna + na, ns);
>  
>  	parser->range += np;
> diff --git a/include/linux/of_address.h b/include/linux/of_address.h
> index 26a19daf0d092..13dd79186d02c 100644
> --- a/include/linux/of_address.h
> +++ b/include/linux/of_address.h
> @@ -26,6 +26,7 @@ struct of_pci_range {
>  		u64 bus_addr;
>  	};
>  	u64 cpu_addr;
> +	u64 parent_bus_addr;
>  	u64 size;
>  	u32 flags;
>  };
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
