Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AFC13A3FD
	for <imx@lists.linux.dev>; Sat,  6 Jul 2024 17:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720287605; cv=none; b=Y1bf8YMwHTnwp6p4EtC0NyPGeLzH4AtXnHRRnXEOFComyv86x3KE89XlwdZWg6ZKZp7SbSw9TirsOU+WSEyKmsEgF62BLI2y7sAxxsOhRr3Jcw4jt59LlFxIS6paTN1pQQBq7MyzQUMQqk0+KuLireE1jDda1jCEjUuNLR6n6Jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720287605; c=relaxed/simple;
	bh=K7/5S3Zqv2W8qdrNqOS6SWkrmCLz+5aP6vwqLcb5BLU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upn7Wf1u4v7ctHsBNHIrAG6J95mUhxh0pYuEYPWmWa6RuFRjdLIUkWhqcejnuvgw6Q/mUsQFYSkjifo7nQrr7UenfgmNQOfAo8dgm4to6UjLPJHZIuVFqNB/935+Yvm1bzuUtNC1UxY77w7Vq8P2/pInrePdP0IPoODP9csqHSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqV/5gYg; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqV/5gYg"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb457b53c8so13992655ad.0
        for <imx@lists.linux.dev>; Sat, 06 Jul 2024 10:40:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720287603; x=1720892403; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+w1HhCtOPF6+jQjVe2f79xd5RcxOFhfFM5UmLnkLxcg=;
        b=QqV/5gYgrEMzcpRlM0D/38qB6A9FDLoF/OR2ck/swvpu2NFgYcxz6ynv8mfyt63Jej
         C/yzVKqC5Oa0Cm+gkgMbl9Vmb5r20AOp0jGyBFYg7zLFTFXsw9F+6HC+jEy9wE/fYT0h
         qla3UB48jcAK/PBoT4CX4XMHlrpOoPN6t9vZp95KLzQV+r0vg/k8v7EVQarXH2fkv997
         107KdSXKYobozMOHJtOnNTAgby4jkM1QC/tk2b+XQu7eV7vKuj35PelvNB9ju5M4QNUE
         ndBKPr52uE480YegC+QJf4CdrGH+m/8ksCw4Yw9d3qwXeRLAqcWXjSX4WK/lQCeRxzDO
         5ndw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720287603; x=1720892403;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+w1HhCtOPF6+jQjVe2f79xd5RcxOFhfFM5UmLnkLxcg=;
        b=Q6MVf+qhP1OMYgiDa+OJOvGNZNYPFj6/8BX6hVOZchmeSlWmDpUGdaSOqFPCEBoKjN
         MYXB9+5Zt8rIr40FpDhddcIQkHeScYdXEuJc5mW/XMByANUyGHo/5x20wpAFtOE2CGJX
         AnifiTx789CmVtj077fehf6ccNfKgyi6qxE5ZoKNPTi79DONEF1PZYHtpVqlUtQEsmmE
         4Wa8ySOTRCWZClmSCeUot7Q9akog7qWxAaK2pYa6Me98AuEgTB0uf2lg+OXLx6Nzymv7
         F5wlzCV0tJZW013vkYALo4aVFcvZDC4nraA25gI3L4GbGRvmWydRHALAWPyVHgJg87nV
         bztA==
X-Forwarded-Encrypted: i=1; AJvYcCUQyGchBT+AdAJ/PA/hAb8jS0HSyspIaa1ZVNg0p7YHzRaC0kdn3bYeIlYxbqKe8LCBrkKsNTf0lz7kBoDwP0tHwwEo
X-Gm-Message-State: AOJu0YyDOpBGGfpvNhc3cKtk93hLh+U5+6eKt/SmS+X9KOAIzI+wlz52
	ldfGNPoRXvmblzxGWAfgeDP80g5/etrEg9V6uUPv4wojBHH8KfLxl6ChLOqqzw==
X-Google-Smtp-Source: AGHT+IFfAmOh1vpybFa6ASP3tIwymsHJN+q/v+qmk1RVhTTsF5OCIrWZZWApJcwuyin0gArdkk3Wrw==
X-Received: by 2002:a17:902:d4cd:b0:1f6:e20f:86b4 with SMTP id d9443c01a7336-1fb33f36fc1mr68382145ad.61.1720287603063;
        Sat, 06 Jul 2024 10:40:03 -0700 (PDT)
Received: from thinkpad ([220.158.156.249])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb14faa241sm70616845ad.110.2024.07.06.10.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 10:40:02 -0700 (PDT)
Date: Sat, 6 Jul 2024 23:09:54 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
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
Message-ID: <20240706173954.GB3980@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-2-e0821238f997@nxp.com>
 <20240629130525.GC5608@thinkpad>
 <ZoL2W1Blrhzf19oM@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZoL2W1Blrhzf19oM@lizhi-Precision-Tower-5810>

On Mon, Jul 01, 2024 at 02:32:59PM -0400, Frank Li wrote:
> On Sat, Jun 29, 2024 at 06:35:25PM +0530, Manivannan Sadhasivam wrote:
> > On Mon, Jun 17, 2024 at 04:16:38PM -0400, Frank Li wrote:
> > > From: Richard Zhu <hongxing.zhu@nxp.com>
> > > 
> > > Correct occasional MSI triggering failures in i.MX8MP PCIe EP by apply 64KB
> > > hardware alignment requirement.
> > > 
> > > MSI triggering fail if the outbound MSI memory region (ep->msi_mem) is not
> > > aligned to 64KB.
> > > 
> > > In dw_pcie_ep_init():
> > > 
> > > ep->msi_mem = pci_epc_mem_alloc_addr(epc, &ep->msi_mem_phys,
> > > 				     epc->mem->window.page_size);
> > > 
> > 
> > So this is an alignment restriction w.r.t iATU. In that case, we should be
> > passing 'pci_epc_features::align' instead?
> 
> pci_epc_features::align already set.
> 
> pci_epc_mem_alloc_addr(
> 	...
> 	align_size = ALIGN(size, mem->window.page_size);
> 	order = pci_epc_mem_get_order(mem, align_size);
> 	...
> }
> 
> but pci_epc_mem_alloc_addr() align to page_size, instead of
> pci_epc_features::align.
> 

'window.page_size' is set to what is passed as 'page_size' argument to
pci_epc_mem_init(). In this case, 'ep->page_size' is passed which corresponds to
size of pages that can be allocated within the memory window.

Default value of 'ep->page_size' is PAGE_SIZE which is most likely 4K. So if
your hardware cannot allocate 4K pages within the memory window, then it
doesn't support splitting this OB region into 4K pages.

But this has nothing to do with alignment AFAIU since epc_features::align is
used for IB memory. This 'page_size' argument was introduced for some TI SoC
that doesn't handle PAGE_SIZE splitting of OB memory window. Reference:

52c9285d4745 ("PCI: endpoint: Add support for configurable page size")

Can you check if your SoC also suffers from the same limitation? If so, then you
should modify the commit message to make it clear.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
