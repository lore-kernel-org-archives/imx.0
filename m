Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F7820C493
	for <imx@lists.linux.dev>; Wed, 16 Oct 2024 18:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729102141; cv=none; b=hT4RmYBphq/F1bbTI+M2wKlcsZUZ9LukyfbPvbQjTWpSL+yn9v4VVrR8qjA4cUc1WWobcjJlaRLQB/JS2BXJ5bNJVZSGyfuwsfVYehqtHIyD/eA4Pehj8/7ud/WgQx2WJA9o7ImvG5xUbsGPjUSOtgweQw9BOJxfYkt2Z6OZsHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729102141; c=relaxed/simple;
	bh=Wy+1hwmCqDSrNv+mIIpt7EhAqp9w4rFf8kl6ABHrkes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=re0KoIZ3qPFNsFe9LlCidRhKZcP0M02R8YFqWqpigZTK4ya0e9QTBON+WAo/2VOt4depRcMUWG93AHICB6CvLqG59M+wfVRKVN+fgiiCxuxD6hqAvcXrmhMoNFyljKInKIhS3mhVC6AkJcBWBs/xgYuovGTL8+Se5mAlsa/3IeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G5On8/DX; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G5On8/DX"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2e2bd0e2c4fso65557a91.3
        for <imx@lists.linux.dev>; Wed, 16 Oct 2024 11:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729102139; x=1729706939; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5uhFNN33rkOBbo0X4+mInZUuFyIJuu4VucaM/qHKNC0=;
        b=G5On8/DXp37Ry3S0JcujZm8aC7aaKFmR9mfyyGeeTlTEq09TUVShFEyOQR1z1AW5bx
         fnNqfNWqGPEAP0mmlAr328pevqIsxWeeK0S1HAUwDg/gHAZ5SVpI/d3bb3CcUUEFtRFn
         fMj8zdT6PpyX2CjHIHT7vh3E3TO/QzPOT4VNtO3RIf195BN2oR/UgWeZEuoCmWA/lyUS
         K+Ps9Dzf/TxV36lTPRTK/L2qstq2ou43rTinQHNo7OAleq1QaD/x3rbniZvki2kWEeH9
         d/3KL1OJWLiuT+3TopmaYtGufRSG9x6eTtC3R7gEp2svXu8NsomRr31g2LyUmpWuYmml
         BL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729102139; x=1729706939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5uhFNN33rkOBbo0X4+mInZUuFyIJuu4VucaM/qHKNC0=;
        b=JM968wcM6fB5pJwpQFlS1Za0vEtNov0yZVAsBxxvHjua3E9UU8vDgCOjXgF1bYut8h
         9NFdd2HFcDFybo8MXcVlsciuynUW8f3t1jfD8Tt+2ApXCof4ftJr8lPeQE+/Dr8u/4up
         bpjQBft3gAo8CUU+GsDtEtgBV1Z3CKJU3/lbrcAKCg3mevp6j8FUluEGc3ZBYfqbrgMw
         m+QsJ9rjc6yousefW2pUSboKo54t/aTLDbQUg7FsIqzp+rqUYDtKqg9zbrLfIZZgumZA
         FGngW0r21FVL4gfYAkfGQ1Imt3VCBKXLtxMfWiix/eyvQceUIDzkj9gtAkzbTcuoRtpj
         L+vw==
X-Forwarded-Encrypted: i=1; AJvYcCWQqc5ZY2ab/UGLXApFudBsVzXjdnqxD/y5AxLUdXcXWrAA00zWa89CS3Fw/Ivv7jPHLOw=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywt0HrQKeq9qimSwUIHzVwnGXQcS0WhA50TsVXbFJudIPkrdMQS
	npLwWhzRXLJ7+Z0o4uXjNmj5Dia35mtdRVTK1egXHaQ8R3EY5s79NyAJlDgGHA==
X-Google-Smtp-Source: AGHT+IGPB/e3Mv/kBhAsvannUBHkBVdeyvA4J3m8LTgwvb/W9x7q39/hVQ+QnlMomNBs8BHh+WJXvA==
X-Received: by 2002:a17:90a:e2d7:b0:2e2:ca12:6bc7 with SMTP id 98e67ed59e1d1-2e2f0d9da63mr21713239a91.33.1729102138690;
        Wed, 16 Oct 2024 11:08:58 -0700 (PDT)
Received: from thinkpad ([220.158.156.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e3e01003a8sm78075a91.12.2024.10.16.11.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 11:08:58 -0700 (PDT)
Date: Wed, 16 Oct 2024 23:38:49 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Abraham I <kishon@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@axis.com, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v2 1/4] PCI: dwc: ep: Add bus_addr_base for outbound
 window
Message-ID: <20241016180849.w7vppj2bsvagqhb7@thinkpad>
References: <20240923-pcie_ep_range-v2-0-78d2ea434d9f@nxp.com>
 <20240923-pcie_ep_range-v2-1-78d2ea434d9f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923-pcie_ep_range-v2-1-78d2ea434d9f@nxp.com>

On Mon, Sep 23, 2024 at 02:59:19PM -0400, Frank Li wrote:
>                                Endpoint          Root complex
>                              ┌───────┐        ┌─────────┐
>                ┌─────┐       │ EP    │        │         │      ┌─────┐
>                │     │       │ Ctrl  │        │         │      │ CPU │
>                │ DDR │       │       │        │ ┌────┐  │      └──┬──┘
>                │     │◄──────┼─ATU ◄─┼────────┼─┤BarN│◄─┼─────────┘
>                │     │       │       │        │ └────┘  │ Outbound Transfer
>                └─────┘       │       │        │         │
>                              │       │        │         │
>                              │       │        │         │
>                              │       │        │         │ Inbound Transfer
>                              │       │        │         │      ┌──▼──┐
>               ┌───────┐      │       │        │ ┌───────┼─────►│DDR  │
>               │       │ outbound Transfer*    │ │       │      └─────┘
>    ┌─────┐    │ Bus   ┼─────►│ ATU  ─┬────────┼─┘       │
>    │     │    │ Fabric│Bus   │       │ PCI Addr         │
>    │ CPU ├───►│       │Addr  │       │ 0xA000_0000      │
>    │     │CPU │       │0x8000_0000   │        │         │
>    └─────┘Addr└───────┘      │       │        │         │
>           0x7000_0000        └───────┘        └─────────┘
> 
> Add `bus_addr_base` to configure the outbound window address for CPU write.
> The bus fabric generally passes the same address to the PCIe EP controller,
> but some bus fabrics convert the address before sending it to the PCIe EP
> controller.
> 
> Above diagram, CPU write data to outbound windows address 0x7000_0000,
> Bus fabric convert it to 0x8000_0000. ATU should use bus address
> 0x8000_0000 as input address and convert to PCI address 0xA000_0000.
> 
> Previously, `cpu_addr_fixup()` was used to handle address conversion. Now,
> the device tree provides this information, preferring a common method.
> 
> bus@5f000000 {
> 	compatible = "simple-bus";
> 	ranges = <0x5f000000 0x0 0x5f000000 0x21000000>,
> 		 <0x80000000 0x0 0x70000000 0x10000000>;
> 
> 	pcie-ep@5f010000 {
> 		reg = <0x5f010000 0x00010000>,
> 		      <0x80000000 0x10000000>;
> 		reg-names = "dbi", "addr_space";
> 		...
> 	};
> 	...
> };
> 
> 'ranges' in bus@5f000000 descript how address convert from CPU address
> to bus address.
> 
> Use `of_property_read_reg()` to obtain the bus address and set it to the
> ATU correctly, eliminating the need for vendor-specific cpu_addr_fixup().
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware-ep.c | 12 +++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h    |  1 +
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-ep.c b/drivers/pci/controller/dwc/pcie-designware-ep.c
> index 43ba5c6738df1..51eefdcb1b293 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-ep.c
> @@ -9,6 +9,7 @@
>  #include <linux/align.h>
>  #include <linux/bitfield.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  
>  #include "pcie-designware.h"
> @@ -294,7 +295,7 @@ static int dw_pcie_ep_map_addr(struct pci_epc *epc, u8 func_no, u8 vfunc_no,
>  
>  	atu.func_no = func_no;
>  	atu.type = PCIE_ATU_TYPE_MEM;
> -	atu.cpu_addr = addr;
> +	atu.cpu_addr = addr - ep->phys_base + ep->bus_addr_base;

If you convert the address here, aren't he drivers with cpu_addr_fixup() will be
broken? You should only update the address if the callback is not available.

- Mani

>  	atu.pci_addr = pci_addr;
>  	atu.size = size;
>  	ret = dw_pcie_ep_outbound_atu(ep, &atu);
> @@ -861,6 +862,7 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  	struct device *dev = pci->dev;
>  	struct platform_device *pdev = to_platform_device(dev);
>  	struct device_node *np = dev->of_node;
> +	int index;
>  
>  	INIT_LIST_HEAD(&ep->func_list);
>  
> @@ -873,6 +875,14 @@ int dw_pcie_ep_init(struct dw_pcie_ep *ep)
>  		return -EINVAL;
>  
>  	ep->phys_base = res->start;
> +	ep->bus_addr_base = ep->phys_base;
> +
> +	index = of_property_match_string(np, "reg-names", "addr_space");
> +	if (index < 0)
> +		return -EINVAL;
> +
> +	of_property_read_reg(np, index, &ep->bus_addr_base, NULL);
> +
>  	ep->addr_size = resource_size(res);
>  
>  	if (ep->ops->pre_init)
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 347ab74ac35aa..c189781524fb8 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -410,6 +410,7 @@ struct dw_pcie_ep {
>  	struct list_head	func_list;
>  	const struct dw_pcie_ep_ops *ops;
>  	phys_addr_t		phys_base;
> +	phys_addr_t		bus_addr_base;
>  	size_t			addr_size;
>  	size_t			page_size;
>  	u8			bar_to_atu[PCI_STD_NUM_BARS];
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
