Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42ADA22616
	for <imx@lists.linux.dev>; Fri,  5 Apr 2024 06:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712298281; cv=none; b=UPCDYpYI5przcguRHNf9MMLIxYw5GNq6K7QN9OkyeyHw9KDVpxu5NLqVpYTJeMFQPxiE9ZlcV21mXkYb871joEuIo+feoUh2NukJFqHHLAdLwif+j2CwwQS9xKbQWDiZsBEHk50SPvM6J833S7OxJXLPYoUK/6A1QK/SKxwp3a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712298281; c=relaxed/simple;
	bh=Aq5f+aYK1/s+xcoN/qqpESMo30shR6C9ncONP3v7+4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hnDEM7ACFJ4A0mQtKkE5HV+R68bCTYy872j1UWHHkUdHw5we6DwDL2T6lWR1w1LZduQCx+omy9J8W83t7FhDcDK0DW2HaalbuEY7eOqBqJ6jGaV33KqBjUAnca27cHL0aMXFs9apQREYU9FkeA0h4qVAIjfEcUc6z6HRhI4lXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=JNdzkWzh; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="JNdzkWzh"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-221e6bf537dso1064456fac.1
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 23:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712298278; x=1712903078; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PXnFYj37RdMeiT5FI44eDGaNEFusqkVt94gwHECIUb0=;
        b=JNdzkWzh3hU1LbfOU2i3g9EUSOZhnx0+dAMIfdlpOtb1OzN4zJgsYrbqJc9ePwguGR
         BZ1dg3TWWT4859yP3X5nlxLAerYHFeQpUex6VhgDrvuH+2d/a5v8XbDR+vmWlDBXHf11
         yqI1Lg/Z1ZY+0jH83nAOZXjV6QIvISCRVTLOvHz6kq3mOveBt+QwBvz9eJnMrk+mbr1x
         Y+9wBjF/iEvZHbqMK08NnnKJMQRFBfyoL8cYGDLGAssCxZ0OivHA0rPQyLYc7s15Eu8m
         l3tD52PeUAri6khYNDXYNKpTbUJ/imWnfQZpiirsb/Jz5n1t8NjWMnNCmU/3Zno16Ic9
         r3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712298278; x=1712903078;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PXnFYj37RdMeiT5FI44eDGaNEFusqkVt94gwHECIUb0=;
        b=tbUi9YT0UQARmfwdfhqzS7mQEs1EClFK3v6Ut/Z0UZZNM8/6vnF82rg92K+HvmTxDu
         VxTEn/wf40am91oluO2bNSXpAk9paKIWoo88+/+Jafl8u2xJgHxIorZz41tl7g3RObLx
         NDfujGN3u6QZUZJ4X1FEduEVbRX4cvzVz42tMkTgQZgiKFPijXsALPCDE982wT9RH8v5
         7xhSnFufc+6a0m4rNCG/2LnrPpRnz1fY77lCXZdoDijICURT9GDoolCMG9ysMMJcoHZP
         9kiCXWp2raogXjHy89s2bEFNiK6SIIRsFnQutFt44ipw2xLMB+maHtkU294a60fcSRXh
         4bRA==
X-Forwarded-Encrypted: i=1; AJvYcCVmjeQAXzMRpy7jR62qgakfb1/pZ/TqwB1DIGk1TrDbh40YJHyQdSZfwGQjmcOAGGa3dixB154PdNEMV7WJ0zokU3kp
X-Gm-Message-State: AOJu0YzglnS4i9sYrIURK+RoHcK4dqEeLS/4RRZ1UcF2fBbw8mJE6zsH
	VIuB2v53ERvJGtVNSAR6jJpmRcy7XRtpzVKKJmMB7qDy/5I41jbxgCQXZifA5g==
X-Google-Smtp-Source: AGHT+IFk7n+g4rGKZeemR9hbQWDpWanR3vqQNkhNGIq+1un3I3qWXvV7N6omwtvQ7r5dF6NGy/vcDw==
X-Received: by 2002:a05:6870:8188:b0:220:941d:18b7 with SMTP id k8-20020a056870818800b00220941d18b7mr539768oae.59.1712298278072;
        Thu, 04 Apr 2024 23:24:38 -0700 (PDT)
Received: from thinkpad ([120.60.67.119])
        by smtp.gmail.com with ESMTPSA id r24-20020aa78b98000000b006ecfb733248sm750249pfd.13.2024.04.04.23.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 23:24:37 -0700 (PDT)
Date: Fri, 5 Apr 2024 11:54:26 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 5/5] PCI: dwc: Add common send PME_Turn_Off message
 method
Message-ID: <20240405062426.GB2953@thinkpad>
References: <20240319-pme_msg-v5-0-af9ffe57f432@nxp.com>
 <20240319-pme_msg-v5-5-af9ffe57f432@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240319-pme_msg-v5-5-af9ffe57f432@nxp.com>

On Tue, Mar 19, 2024 at 12:07:15PM -0400, Frank Li wrote:

PCI: dwc: Add generic MSG TLP support for sending PME_Turn_Off during system suspend

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

How about:

"Instead of relying on the vendor specific implementations to send the
PME_Turn_Off message, let's introduce a generic way of sending the message using
the MSG TLP.

This is achieved by reserving a region for MSG TLP of size 'pci->region_align',
at the end of the first IORESOURCE_MEM window of the host bridge. And then
sending the PME_Turn_Off message during system suspend with the help of iATU.

It should be noted that this generic implementation is optional for the glue
drivers and can be overridden by a custom 'pme_turn_off' callback."

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 94 ++++++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h      |  3 +
>  2 files changed, 93 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 267687ab33cbc..d5723fce7a894 100644
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

Don't you need to adjust the host bridge window size and end address?

> +		res->name = "msg";
> +		res->flags = win->res->flags | IORESOURCE_BUSY;
> +

Shouldn't this resource be added back to the host bridge?

> +		if (!request_resource(win->res, res))

Why can't you use devm_ helper to manage the resource, since the lifetime of the
resource is till dw_pcie_host_deinit()?

> +			pp->msg_res = res;
> +		else
> +			devm_kfree(pci->dev, res);
> +	}
> +}
> +
>  int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> @@ -479,6 +504,10 @@ int dw_pcie_host_init(struct dw_pcie_rp *pp)
>  
>  	dw_pcie_iatu_detect(pci);
>  
> +	/* Need call after dw_pcie_iatu_detect() before dw_pcie_setup_rc() */

It'd be better to add the reason also i.,e

	/*
	 * Allocate the resource for MSG TLP before programming the iATU
	 * outbound window in dw_pcie_setup_rc(). Since the allocation depends
	 * on the value of 'region_align', this has to be done after
	 * dw_pcie_iatu_detect().
	 */

> +	if (pp->use_atu_msg)

Who is setting this flag?

> +		dw_pcie_host_request_msg_tlp_res(pp);
> +
>  	ret = dw_pcie_edma_detect(pci);
>  	if (ret)
>  		goto err_free_msi;
> @@ -536,6 +565,11 @@ void dw_pcie_host_deinit(struct dw_pcie_rp *pp)
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
> @@ -697,6 +731,10 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  		atu.pci_addr = entry->res->start - entry->offset;
>  		atu.size = resource_size(entry->res);
>  
> +		/* MSG TLB window resource reserve at one of end of IORESOURCE_MEM resource */
> +		if (pp->msg_res && pp->msg_res->parent == entry->res)
> +			atu.size -= resource_size(pp->msg_res);

If you adjust the bridge window above, then this won't be needed.

> +
>  		ret = dw_pcie_prog_outbound_atu(pci, &atu);
>  		if (ret) {
>  			dev_err(pci->dev, "Failed to set MEM range %pr\n",
> @@ -728,6 +766,8 @@ static int dw_pcie_iatu_setup(struct dw_pcie_rp *pp)
>  		dev_warn(pci->dev, "Ranges exceed outbound iATU size (%d)\n",
>  			 pci->num_ob_windows);
>  
> +	pp->msg_atu_index = i;
> +
>  	i = 0;
>  	resource_list_for_each_entry(entry, &pp->bridge->dma_ranges) {
>  		if (resource_type(entry->res) != IORESOURCE_MEM)
> @@ -833,11 +873,54 @@ int dw_pcie_setup_rc(struct dw_pcie_rp *pp)
>  }
>  EXPORT_SYMBOL_GPL(dw_pcie_setup_rc);
>  
> +/* Using message outbound ATU to send out PME_Turn_Off message for dwc PCIe controller */
> +static int dw_pcie_pme_turn_off(struct dw_pcie *pci)
> +{
> +	struct dw_pcie_ob_atu_cfg atu = { 0 };
> +	void __iomem *m;

*mem

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

You are already checking the existence of the 'pci->pp.msg_res' region above. So
shouldn't that be sufficient enough? Can the size be 0, if the region exist?

- Mani

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
> @@ -849,10 +932,13 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
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
> index 703b50bc5e0f1..dca5de4c6e877 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -341,6 +341,9 @@ struct dw_pcie_rp {
>  	struct pci_host_bridge  *bridge;
>  	raw_spinlock_t		lock;
>  	DECLARE_BITMAP(msi_irq_in_use, MAX_MSI_IRQS);
> +	bool			use_atu_msg;
> +	int			msg_atu_index;
> +	struct resource		*msg_res;
>  };
>  
>  struct dw_pcie_ep_ops {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
