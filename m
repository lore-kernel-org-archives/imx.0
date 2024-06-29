Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C4E953E15
	for <imx@lists.linux.dev>; Sat, 29 Jun 2024 13:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719666335; cv=none; b=A3JacdCogyk9JgazZUIWxw2Jt7ZBTcxfdtFyvRVj+S+LPTbR43jPjURMhZP5aYIzxTMX5i360PnpuL1b8hG7K0PJg+CRqfb4LXB0TvO70FPvV4/6lhNjk3qL6Vg3Kyy7v8zuYJsem+7JMHtFeDuBPHQsMba4cmGnS34omRHmTuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719666335; c=relaxed/simple;
	bh=+GloaJVSprqCGpULiUI/O36iec3Yuequ8ZLM2WLDhNA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s82XfQfVU6JJR8nuhPo1KgSs1mBYkGNCdKrC16dIkHL2FN8ml0AK/CBnwy9UFnmFeP1l6fQPpyBV+lfi5gCkqV0+B9fKsLHihCs6aSL9H4M7VfpZwA2v6Hbqne64vx+dbkHdeCgUBwJMxgK1bkhMmAYgpA1v68oECwbxNV+tRso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I77/xtfX; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I77/xtfX"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1fab03d2eecso11001635ad.0
        for <imx@lists.linux.dev>; Sat, 29 Jun 2024 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719666333; x=1720271133; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Hr41jn7CS+JV7JYEOXmHYOhJrr4EACp9o9fXqaxlvEQ=;
        b=I77/xtfXNbvGxJDa6sO9ate7R/OKX2atS+jqkrWjGPoAQ1Sy8C1UMOGvVh9ZjUNDmw
         OoaihtY4NpFZnke3COucaMqBGKteHZHvn11DxaB3UYvkxi5rHqPvsqRJ4WpZn2hF5RfR
         ci7ZavII/g/x6ktXqEMJzZlu95ydIe6qdFOucIMMHtdPLBSWlbdL92c6qgRG5C105waI
         J8OJzWXWo3JaUCKdegqvyt0kQeCjlf8cp3qtwpeMlZ28yfMpz11MEebQcmVd0vOgq5xn
         yp+XvWXw87VAzPvfHvKdWhVyuEcArJP+pvxHK3A0yfUDP7M7WgxIad/Co34uE8UQq+Me
         gwKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719666333; x=1720271133;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Hr41jn7CS+JV7JYEOXmHYOhJrr4EACp9o9fXqaxlvEQ=;
        b=XpT64497UKta1SU1oVwL88ZkqvSQmui8FUjtfi7KzO+3U8/u3aSqi2DEdsr5M/h7b9
         XOV8dqpobUC/1v8H7jKqSDsmWF0YOX8BLyKoF9+GEQn8kYgmGV9g0Yqn1yow3bv+Zmiu
         ecQJX3j//I/pc37XbrXBtFneY0u5+POkdsGB05VwWFMjJBBakAjFCrIb/R1ytCRqxTTZ
         3iyfk5na9RPaSFg4lzm32iUk3Cn+pj5Au0FnQC5kifZ0WamM55lkezGkckLsb4Pf95wB
         OQcVfFXKKC9smV7lkhUkwfDcGHJlaLKenaDg4lIKXXKlL+3M8TwRh+sD6tpzW4Mc4gX2
         XkLw==
X-Forwarded-Encrypted: i=1; AJvYcCVTFf5IB5PVxlRLOk5iDE6fiM2bnm2wR74CCoGrMAd7xDHXg04WU82PX8kZ5dUYcA93QKjOKXo7hNVPlGfcpgPtga9j
X-Gm-Message-State: AOJu0Ywtfiwe+nC5qOnv/S7br/7Oxnw9mxeW2xFZrEncAP1p+ZEkwv4/
	3T2gii6EHeDRFQCbejXGVP2E2YPyEXEQyAYLEKLBt9QFq2Rbx17He4CuucnwTA==
X-Google-Smtp-Source: AGHT+IE5aU4sW0gZNOnsBZmQhd5QPQlm2dJswEqAC+AISCYfDs6s10N0soFFT4U1SUdqSjSMRwrfaA==
X-Received: by 2002:a17:903:2349:b0:1f7:23ee:d496 with SMTP id d9443c01a7336-1fadbcb2064mr6324365ad.30.1719666333190;
        Sat, 29 Jun 2024 06:05:33 -0700 (PDT)
Received: from thinkpad ([220.158.156.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac1598576sm31531345ad.278.2024.06.29.06.05.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jun 2024 06:05:32 -0700 (PDT)
Date: Sat, 29 Jun 2024 18:35:25 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org, Jason Liu <jason.hui.liu@nxp.com>
Subject: Re: [PATCH v6 02/10] PCI: imx6: Fix i.MX8MP PCIe EP's occasional
 failure to trigger MSI
Message-ID: <20240629130525.GC5608@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-2-e0821238f997@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-pci2_upstream-v6-2-e0821238f997@nxp.com>

On Mon, Jun 17, 2024 at 04:16:38PM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Correct occasional MSI triggering failures in i.MX8MP PCIe EP by apply 64KB
> hardware alignment requirement.
> 
> MSI triggering fail if the outbound MSI memory region (ep->msi_mem) is not
> aligned to 64KB.
> 
> In dw_pcie_ep_init():
> 
> ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
> 				     epc->mem->window.page_size);
> 

So this is an alignment restriction w.r.t iATU. In that case, we should be
passing 'pci_epc_features::align' instead?

- Mani

> Set ep->page_size to match drvdata::epc_features::align since different
> SOCs have different alignment requirements.
> 
> Fixes: 1bd0d43dcf3b ("PCI: imx6: Clean up addr_space retrieval code")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 9a71b8aa09b3c..ca9a000c9a96d 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1118,6 +1118,8 @@ static int imx6_add_pcie_ep(struct imx6_pcie *imx6_pcie,
>  	if (imx6_check_flag(imx6_pcie, IMX6_PCIE_FLAG_SUPPORT_64BIT))
>  		dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
>  
> +	ep->page_size = imx6_pcie->drvdata->epc_features->align;
> +
>  	ret = dw_pcie_ep_init(ep);
>  	if (ret) {
>  		dev_err(dev, "failed to initialize endpoint\n");
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
