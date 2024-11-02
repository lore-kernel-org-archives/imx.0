Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C3155753
	for <imx@lists.linux.dev>; Sat,  2 Nov 2024 11:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730545823; cv=none; b=U6ayZWX5V+9qQ0uBZ5yYpDNcO8usziqeL026HFSKNkTOpEU8JIswbmYqmdvJqE/Kwl+L0DyQGqtmM98S+ejWhq5487JsUlCqxS7TaXr/10RS5HeapItl5TKsbSOU55biEWzdSv6M2mhcp2D9wJqK9wPBDmdWqluAFrDgOUQUu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730545823; c=relaxed/simple;
	bh=QEAiKRBMfn7T9b+p0OODMxOHepiSst1T6MSvaThvpf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gl6eKmTq3SarnouwMLclD1i4Lg0wDyvRiZvC1yDxRZJa1jTPC/odrtscZvHagBjrxtanv9T3sG6i1JD+ZqhyGRqmr/dyPEi0wpzl5rCaQcrwrUcyIm9MvA8HLpH6Q2BxWWoZUBj832bz9Oakz9R8VbySwtm7gwWMZNjUaPMYbAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uGTejUKe; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uGTejUKe"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-71e4e481692so2571978b3a.1
        for <imx@lists.linux.dev>; Sat, 02 Nov 2024 04:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730545821; x=1731150621; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I4eYqgILgGSnZ5FLX7em889/Olts11sj6lSUSFxZMLE=;
        b=uGTejUKeasKvrN/CFmr/HOkgDFu5Llrdq1Bab2aGuWax/d3myw+jhBCbkPQ6g0nzG6
         XxYbPAjOzdzkIObFEAAwECdAfWcVvI4bGuZFpFBJCcGZIxVb9SVkC12e8V58rZ5lbnak
         5367bsWlEyCrcp7aeWUGWEhc/k5OwMr2K3/bhzlc0+OPL21i1E1jgsTOimzYyr5iNc+m
         VfBNdihX/BRDG/Wf5fCNlTIWd2uAi7KKZY2suXTRHBgRcR+MLEOaE3QmWWjFaMLJbi4Q
         W/cCq7qziekQcVVx+dT23ff6oWaBBMOkrSYGLC1YokHpxCggODO/kQgzl8CfRU7zXKbb
         gNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730545821; x=1731150621;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I4eYqgILgGSnZ5FLX7em889/Olts11sj6lSUSFxZMLE=;
        b=scySm/yp7qINXOOY5TdWWnIqUnjsvz1CEarL26czB0VewCtKqv7kVTf7jEQZDLL7M4
         7PgHCAA6n32MhQKUACUxzIOZDX5GKcJkcQDJqnvfvh7w61dzwv5nQ26vDZzwtBpkZ0me
         MsTCZHqU1F4scnWBChsYfhrbHQhdboK/wpzXxajryFzND63SvDLi2PcimEKhKs0rzujq
         9JhKcAehIhkLoQ4uVEHfdsac5FpaTsDRqpQfqtfBENUmvxfXxHFBfEqLJwzB+3SZHbrA
         Ziht8NMYE3xsx5agBUzPGnWzzVntlNGqPaYZmFNRFfw/o5Kmx/ju3rztbpcymAli2d2O
         Z2dw==
X-Forwarded-Encrypted: i=1; AJvYcCWLtblYKccODRZ7kKdgbkB5pfHHmoRPmr1LfXqPMBbsPAf9K4WLZ8cZwQVEzYXbu1X2M98=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq5/v7059pVOUVQ+oroKkuLuQ31IW10WBEmttCsOFJH9BNhFuh
	4TZWMFPL9uap4WS6J/Dlvvf1O6haG7MoiTaVKpIqsU4kaUXzfifiGyIlT37Xpw==
X-Google-Smtp-Source: AGHT+IGvVFzOTXxhTUFUGXA3i4FKFopxjY5r8HjaLCxA6VY9mqL2l28HzoYyqMuyQIGfn5uqAD5pRQ==
X-Received: by 2002:a05:6a00:a29:b0:71e:c0c:5996 with SMTP id d2e1a72fcca58-720c98ca200mr8339080b3a.7.1730545821219;
        Sat, 02 Nov 2024 04:10:21 -0700 (PDT)
Received: from thinkpad ([220.158.156.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2f17fasm3968608b3a.180.2024.11.02.04.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 04:10:20 -0700 (PDT)
Date: Sat, 2 Nov 2024 16:40:12 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v3 1/2] PCI: Add enable_device() and disable_device()
 callbacks for bridges
Message-ID: <20241102111012.23zwz4et2qkafyca@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241024-imx95_lut-v3-1-7509c9bbab86@nxp.com>

On Thu, Oct 24, 2024 at 06:34:44PM -0400, Frank Li wrote:
> Some PCIe host bridges require special handling when enabling or disabling
> PCIe Endpoints. For example, the i.MX95 platform has a lookup table to map
> Requester IDs to StreamIDs, which are used by the SMMU and MSI controller
> to identify the source of DMA accesses.
> 
> Without this mapping, DMA accesses may target unintended memory, which
> would corrupt memory or read the wrong data.
> 
> Add a host bridge .enable_device() hook the imx6 driver can use to
> configure the Requester ID to StreamID mapping. The hardware table isn't
> big enough to map all possible Requester IDs, so this hook may fail if no
> table space is available. In that case, return failure from
> pci_enable_device().
> 
> It might make more sense to make pci_set_master() decline to enable bus
> mastering and return failure, but it currently doesn't have a way to return
> failure.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v2 to v3
> - use Bjorn suggest's commit message.
> - call disable_device() when error happen.
> 
> Change from v1 to v2
> - move enable(disable)device ops to pci_host_bridge
> ---
>  drivers/pci/pci.c   | 23 ++++++++++++++++++++++-
>  include/linux/pci.h |  2 ++
>  2 files changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 7d85c04fbba2a..5e0cb9b6f4d4f 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -2056,6 +2056,7 @@ int __weak pcibios_enable_device(struct pci_dev *dev, int bars)
>  static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  {
>  	int err;
> +	struct pci_host_bridge *host_bridge;
>  	struct pci_dev *bridge;
>  	u16 cmd;
>  	u8 pin;
> @@ -2068,9 +2069,16 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	if (bridge)
>  		pcie_aspm_powersave_config_link(bridge);
>  
> +	host_bridge = pci_find_host_bridge(dev->bus);
> +	if (host_bridge && host_bridge->enable_device) {
> +		err = host_bridge->enable_device(host_bridge, dev);
> +		if (err)
> +			return err;
> +	}

How about wrapping the enable/disable part in a helper?

	int pci_host_bridge_enable_device(dev);
	void pci_host_bridge_disable_device(dev);

The definition could be placed in drivers/pci/pci.h as an inline function.

- Mani

> +
>  	err = pcibios_enable_device(dev, bars);
>  	if (err < 0)
> -		return err;
> +		goto err_enable;
>  	pci_fixup_device(pci_fixup_enable, dev);
>  
>  	if (dev->msi_enabled || dev->msix_enabled)
> @@ -2085,6 +2093,13 @@ static int do_pci_enable_device(struct pci_dev *dev, int bars)
>  	}
>  
>  	return 0;
> +
> +err_enable:
> +	if (host_bridge && host_bridge->disable_device)
> +		 host_bridge->disable_device(host_bridge, dev);
> +
> +	return err;
> +
>  }
>  
>  /**
> @@ -2262,12 +2277,18 @@ void pci_disable_enabled_device(struct pci_dev *dev)
>   */
>  void pci_disable_device(struct pci_dev *dev)
>  {
> +	struct pci_host_bridge *host_bridge;
> +
>  	dev_WARN_ONCE(&dev->dev, atomic_read(&dev->enable_cnt) <= 0,
>  		      "disabling already-disabled device");
>  
>  	if (atomic_dec_return(&dev->enable_cnt) != 0)
>  		return;
>  
> +	host_bridge = pci_find_host_bridge(dev->bus);
> +	if (host_bridge && host_bridge->disable_device)
> +		host_bridge->disable_device(host_bridge, dev);
> +
>  	do_pci_disable_device(dev);
>  
>  	dev->is_busmaster = 0;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 573b4c4c2be61..ac15b02e14ddd 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -578,6 +578,8 @@ struct pci_host_bridge {
>  	u8 (*swizzle_irq)(struct pci_dev *, u8 *); /* Platform IRQ swizzler */
>  	int (*map_irq)(const struct pci_dev *, u8, u8);
>  	void (*release_fn)(struct pci_host_bridge *);
> +	int (*enable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
> +	void (*disable_device)(struct pci_host_bridge *bridge, struct pci_dev *dev);
>  	void		*release_data;
>  	unsigned int	ignore_reset_delay:1;	/* For entire hierarchy */
>  	unsigned int	no_ext_tags:1;		/* No Extended Tags */
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
