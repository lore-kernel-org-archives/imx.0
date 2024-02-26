Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8A7131727
	for <imx@lists.linux.dev>; Mon, 26 Feb 2024 21:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708984371; cv=none; b=bKsnS2mz9nlOJ34CCirSjGbGkLnKqtvjjVfOVAs6fU5zFvGbQSzL25yT0BcJkn72wkg+G5ivemhLgeI7tLmq9L8662xbTdh+7wUP4WazQbGiQGgU8YWk+FHfNFQqkh1ctxGkovKx9drDnZYjtn/ecsEAKHh13WN44a/dbwU81XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708984371; c=relaxed/simple;
	bh=kMcKvQgcOv3zmTeZZTqAzHlv1e0lJsfANTHFQFfu6iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RE8gOX9PfgCSNTyHFZ0G2JTYNus97N1NkHibLg9fHH4dTyEcj+fJuzQxf6/xRv6eEOEf3GECQ2ZIFhFz9cZl6FFSWFR3pZ8qTfc+mU4nZ8tUEzfo1cCieq7dM0CH/DzeE4rMYr+y+SYF6mZOcnpVwaV4iM0KDMqmmWUPvEkRudQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KqoPhKHh; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KqoPhKHh"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d24a727f78so50890121fa.0
        for <imx@lists.linux.dev>; Mon, 26 Feb 2024 13:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708984368; x=1709589168; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xBACtx8hWLitaNfrtlYHByuhxgRV4+odBzJnxDpk1C0=;
        b=KqoPhKHhoxeKLrYcOtyw/6LCd2k0BxnC7MWjESS+Y7QOfS1hHLLGcJ/9AW45NLSnj+
         X4EIQ50ICeFPh78LqK4kKBUWwd7xcAfm+0aYri541ip0Qb0qmO/iHZ8PEWVUNaHFlBlB
         ccjXAZvaU/MvyexfTuJerSG8rZGQL7VYqHGIELkbbxtIaPTRmznFA0P1is8IPGRvgWb+
         plHf+8+np8MOADjWt4zYzf1ZyF2uS0GiY6zGBENVTyFIlhUE9xmXWB91i7s0PwXAtQgh
         KlW/dUf6gGrh+/JCdJY3YmRFWsgfhRYOswcMKZxTcqLtZ8lWm04ye4Rs6ztcKNwr3ruP
         v2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708984368; x=1709589168;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xBACtx8hWLitaNfrtlYHByuhxgRV4+odBzJnxDpk1C0=;
        b=ObA54u51Zcr++ZZWxMzksr6q1HC/T4kjsGI0o2Z+8f+q6oz2R8uhihZZwB56KmMAW4
         g9fx7hn+mFDGjPLNFNVimOEWdh5h1vPnEuH9ArMKQsmbd6MlsTUrButdYMHMrOhUWI0Z
         Ts4Bh7Y0QTY11P4tzxMwsFOAqgNt7YUBMdkcZOy8ouT2+hYYz1FX6D59xUhSxeIMFP5N
         qIUNHp55G681MIgvKGuYlIZehKFC+E8IE2B1bRZg0gUAz0QousWtPYIAerDoUuKDLDgC
         +Mpcmz7BHB0Gml0lUfPzqjkj43Rth6h+cDg15JUO75KiGJcsBGzsA36M4NKzOH34ZyND
         dQIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXouOVBqyW4EOCt+ggxObapJJc5BdSSyW8x8Qm2qPZ5DPAX0RSqiJnDGBR/+f7XHbORkYi0kttmPjUIPsImk7j8p730
X-Gm-Message-State: AOJu0Yzu4ynHyX5PKTrFt12KitJvmVEx0gjk0Jz402kJHwhp1vgznFcy
	hG4mKBEMInW7fjSuprmgjY4kJut4UQXPNgPwIdMPfoABAfGFOy1J
X-Google-Smtp-Source: AGHT+IEMB6cCCUwJTrXpZH8p+ae5BoKO7HkdcAzBFmwHWu/lX/D0ygkm806WRrGEN2tWAudXtlwc0g==
X-Received: by 2002:a05:6512:3a84:b0:512:f31c:f0c0 with SMTP id q4-20020a0565123a8400b00512f31cf0c0mr5529422lfu.37.1708984367689;
        Mon, 26 Feb 2024 13:52:47 -0800 (PST)
Received: from mobilestation ([95.79.226.168])
        by smtp.gmail.com with ESMTPSA id s8-20020ac25fe8000000b00512f214f3f0sm966783lfg.163.2024.02.26.13.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 13:52:47 -0800 (PST)
Date: Tue, 27 Feb 2024 00:52:45 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Frank Li <Frank.Li@nxp.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>
Cc: Jingoo Han <jingoohan1@gmail.com>, 
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/5] PCI: dwc: Add common send PME_Turn_Off message
 method
Message-ID: <erja6zkhstoaverqtadnqj3nsyluh3sealibpujqmea4pndiuv@icihj7cby2l7>
References: <20240213-pme_msg-v4-0-e2acd4d7a292@nxp.com>
 <20240213-pme_msg-v4-5-e2acd4d7a292@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240213-pme_msg-v4-5-e2acd4d7a292@nxp.com>

On Tue, Feb 13, 2024 at 04:50:26PM -0500, Frank Li wrote:
> Reserve space at end of first IORESOURCE_MEM window as message TLP MMIO
> window. This space's size is 'region_align'.
> 
> Set outbound ATU map memory write to send PCI message. So one MMIO write
> can trigger a PCI message, such as PME_Turn_Off.
> 
> Add common dwc_pme_turn_off() function.
> 
> Call dwc_pme_turn_off() to send out PME_Turn_Off message in general
> dw_pcie_suspend_noirq() if there are not platform callback pme_turn_off()
> exist.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 93 ++++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h      |  2 +
>  2 files changed, 91 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 267687ab33cbc..5e83756492462 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -393,6 +393,31 @@ static int dw_pcie_msi_host_init(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void dw_pcie_host_request_msg_tlp_res(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct resource_entry *win;
> +	struct resource *res;
> +
> +	win = resource_list_first_type(&pp->bridge->windows, IORESOURCE_MEM);
> +	if (win) {
> +		res = devm_kzalloc(pci->dev, sizeof(*res), GFP_KERNEL);
> +		if (!res)
> +			return;
> +
> +		/* Reserve last region_align block as message TLP space */
> +		res->start = win->res->end - pci->region_align + 1;
> +		res->end = win->res->end;
> +		res->name = "msg";
> +		res->flags = win->res->flags | IORESOURCE_BUSY;
> +
> +		if (!request_resource(win->res, res))
> +			pp->msg_res = res;
> +		else
> +			devm_kfree(pci->dev, res);
> +	}
> +}
> +
>  int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -479,6 +504,9 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	dw_pcie_iatu_detect(pci);
>  

> +	/* Need call after dw_pcie_iatu_detect() before dw_pcie_setup_rc() */
> +	dw_pcie_host_request_msg_tlp_res(pp);

This may cause regressions for instance if the outbound memory window
is small and is fully dedicated for some device like VGA/GPU/etc.

Why not to use a new ranges-based mapping as we discussed earlier:
https://lore.kernel.org/linux-pci/20240214061412.GB4618@thinkpad/
?

I know it might be troublesome but still it would be much better
and more portable across various platforms.

Bjorn, Lorenzo, Krzysztofm Rob could you please follow the link above
and give your opinion about the solution suggested there?

-Serge(y)

> +
>  	ret = dw_pcie_edma_detect(pci);
>  	if (ret)
>  		goto err_free_msi;
> @@ -536,6 +564,11 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
>  
>  	dw_pcie_edma_remove(pci);
>  
> +	if (pp->msg_res) {
> +		release_resource(pp->msg_res);
> +		devm_kfree(pci->dev, pp->msg_res);
> +	}
> +
>  	if (pp->has_msi_ctrl)
>  		dw_pcie_free_msi(pp);
>  
> @@ -697,6 +730,10 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  		atu.pci_addr = entry->res->start - entry->offset;
>  		atu.size = resource_size(entry->res);
>  
> +		/* MSG TLB window resource reserve at one of end of IORESOURCE_MEM resource */
> +		if (pp->msg_res && pp->msg_res->parent == entry->res)
> +			atu.size -= resource_size(pp->msg_res);
> +
>  		ret = dw_pcie_prog_outbound_atu(pci, &atu);
>  		if (ret) {
>  			dev_err(pci->dev, "Failed to set MEM range %pr\n",
> @@ -728,6 +765,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  		dev_warn(pci->dev, "Ranges exceed outbound iATU size (%d)\n",
>  			 pci->num_ob_windows);
>  
> +	pp->msg_atu_index = i;
> +
>  	i = 0;
>  	resource_list_for_each_entry(entry, &pp->bridge->dma_ranges) {
>  		if (resource_type(entry->res) != IORESOURCE_MEM)
> @@ -833,11 +872,54 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
>  
> +/* Using message outbound ATU to send out PME_Turn_Off message for dwc PCIe controller */
> +static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> +{
> +	struct dw_pcie_ob_atu_cfg atu = { 0 };
> +	void __iomem *m;
> +	int ret;
> +
> +	if (pci->num_ob_windows <= pci->pp.msg_atu_index)
> +		return -EINVAL;
> +
> +	if (!pci->pp.msg_res)
> +		return -EINVAL;
> +
> +	atu.code = PCIE_MSG_CODE_PME_TURN_OFF;
> +	atu.routing = PCIE_MSG_TYPE_R_BC;
> +	atu.type = PCIE_ATU_TYPE_MSG;
> +	atu.size = resource_size(pci->pp.msg_res);
> +	atu.index = pci->pp.msg_atu_index;
> +
> +	if (!atu.size) {
> +		dev_dbg(pci->dev,
> +			"atu memory map windows is zero, please check 'msg' reg in dts\n");
> +		return -ENOMEM;
> +	}
> +
> +	atu.cpu_addr = pci->pp.msg_res->start;
> +
> +	ret = dw_pcie_prog_outbound_atu(pci, &atu);
> +	if (ret)
> +		return ret;
> +
> +	m = ioremap(atu.cpu_addr, pci->region_align);
> +	if (!m)
> +		return -ENOMEM;
> +
> +	/* A dummy write is converted to a Msg TLP */
> +	writel(0, m);
> +
> +	iounmap(m);
> +
> +	return 0;
> +}
> +
>  int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  {
>  	u8 offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
>  	u32 val;
> -	int ret;
> +	int ret = 0;
>  
>  	/*
>  	 * If L1SS is supported, then do not put the link into L2 as some
> @@ -849,10 +931,13 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_get_ltssm(pci) <= DW_PCIE_LTSSM_DETECT_ACT)
>  		return 0;
>  
> -	if (!pci->pp.ops->pme_turn_off)
> -		return 0;
> +	if (pci->pp.ops->pme_turn_off)
> +		pci->pp.ops->pme_turn_off(&pci->pp);
> +	else
> +		ret = dw_pcie_pme_turn_off(pci);
>  
> -	pci->pp.ops->pme_turn_off(&pci->pp);
> +	if (ret)
> +		return ret;
>  
>  	ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
>  				PCIE_PME_TO_L2_TIMEOUT_US/10,
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 703b50bc5e0f1..9e6076aa4c850 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -341,6 +341,8 @@ struct dw_pcie_rp {
>  	struct pci_host_bridge  *bridge;
>  	raw_spinlock_t		lock;
>  	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
> +	int			msg_atu_index;
> +	struct resource		*msg_res;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 
> 
