Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EAB14AD02
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 06:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732688420; cv=none; b=r2AsJv7pUDSFQtNtmAIDe5solb+TjEVUVo1y3oCbW/+r/dSgWaHjYWDKhcUpHjgAhlp4Zej8laHGGdQjApCKrvCx8oGC5bjziKhrjXioCiB0T6OC7Q/iwEjhfL5fMceQZGKn/3/1O/20FBBTpa07rlSkCRwoyHs/8QlLME4ZIM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732688420; c=relaxed/simple;
	bh=w/D8fsQPcNEG6MIfpMgWgqvfnTdWrpFGSFDTBCPsVec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OKheByZPsFKtZd0Siaqg7lGq20kGhwUMztlZ5jwSHQoDubn1dy7LjfZmHDUxjhy3ZZXhMVfUlN8zJDXzvkaVd4NsxdJSjyURpmB0RSbb6m4C2VoRgzBDkkhrAE+3sWBh+AYaFvzW+gUHgZNoeZB3K5ID1gy1gwwVnatxdtPRLuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GVOsD+Iq; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GVOsD+Iq"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7251abe0e69so2104495b3a.0
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 22:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732688419; x=1733293219; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mLuEvPFQ6kcM1n0FkkyOUV7NsMkiebhxF8YqLhaowtw=;
        b=GVOsD+IqpQ/ZXT5kUF6rGoGp7dt2uMpyDug12vO/1xRv2YeQU9VYvY3rhZhZoMLpgT
         k8kJEfC2lpH3o7W8t0ymsL+nujWsVefG9m3hmFoTWu6cUgnXW3stU3yyNVft8oKBAnNX
         gVEDa7Yh9tSqEZmuhL9NeGSUEel+7B8YORXLbHKYho7psFgcX+C4IIgjil2+dKdpyDhK
         tC0vChGu7eKUR7+tPFRA67uFqzHMVrbjOcD2jiE4MW2CnpcF1ISsL7lJ4KKCTLpydu9j
         VbJliduigtP7UAadzungAKSOrh38C8IqUoBecd9xhkgnpDGP50TxRIfLibb27Jtpmsye
         VZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732688419; x=1733293219;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mLuEvPFQ6kcM1n0FkkyOUV7NsMkiebhxF8YqLhaowtw=;
        b=UGPGiVmoEAq6hYZyUAP6PP50gtOiKL99oKL8ZywKNUoaN0Rj0KHECAS3+YCCElmL0k
         cvTYGsmaz73RUulitUcqKRlm/c3P+dCAh4kHMDL/6e8GL3wDVNCEmoH6Q3x3gXvkyfNB
         5Al+07pbq4NHF4H6enADxGcT4h6v8yVMohF0FHDAp3XJM50lh0LktFXCcrU0GWcrG62L
         E0NdiqUYu2SSk8+m0StuagRwYOoK2DiIW4B4++X8n/Ccnr/5FVkNnmSbP0XdyF3hD2qz
         cglDJWwd0SU8diYdCBqztiPQMcofUbLQ6KIo1ksh7RmwqXcx+qQjFkxk5OQTtjG+DLgv
         N8QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXqX2gWdw8OToC6b8pCKejBhR0hfqFD9yjkq5LEJueueHPUysLKFR5tgv6VhB6iHwOhDA8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxdKyKlrKUyXd/OtjFwjaE4wDMKRQW+/R+w3pQyhriE+J493Vuv
	YOlUATSVzPcrROBqL1L2SL4oRVLuz9848qVetj5oMCov+Raf7+OVvcjEQgtYLg==
X-Gm-Gg: ASbGncvNd5ueSWVi1aaIMw9UEP7Q1MyH0voAJDrfsDsc+e8Gx4ES+Of82hbu4CAj0dr
	ck5jHVV2BvqaZdZuspOYhWgVqXEZlTc3/yJQoXIyI1UbE12NexdYkpDZseMrA9mjXIv7fs1P9+K
	9Doq6hzcr4dWQ3uffEK4+jT3SPfeMN50q8t6pQVcXaiRl3e8EhsDveRTaCf5fjQXjSSFEMBgsaP
	8vlGkK4qaxaIVusZbMwbp+L8qELnYlmDPJ2MWnAJuh1Uu2U/JNSEB7OLWhU
X-Google-Smtp-Source: AGHT+IGMQz7BH6QCsJCOIshdD5nGI4ii2ks2kgkA1lV0ck1baioPhXJl9j4dkpEkR7e4LinD/4buOA==
X-Received: by 2002:a05:6a00:ccf:b0:724:de1c:bac9 with SMTP id d2e1a72fcca58-7253007749fmr2753689b3a.13.1732688418746;
        Tue, 26 Nov 2024 22:20:18 -0800 (PST)
Received: from thinkpad ([120.60.136.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724eb65d2adsm8372423b3a.159.2024.11.26.22.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 22:20:18 -0800 (PST)
Date: Wed, 27 Nov 2024 11:50:04 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, Niklas Cassel <cassel@kernel.org>,
	dlemoal@kernel.org, maz@kernel.org, tglx@linutronix.de,
	jdmason@kudzu.us
Subject: Re: [PATCH v8 2/6] PCI: endpoint: Add RC-to-EP doorbell support
 using platform MSI controller
Message-ID: <20241127062004.oruhwkhj4zrvjx25@thinkpad>
References: <20241116-ep-msi-v8-0-6f1f68ffd1bb@nxp.com>
 <20241116-ep-msi-v8-2-6f1f68ffd1bb@nxp.com>
 <20241124071100.ts34jbnosiipnx2x@thinkpad>
 <Z0S7+U5W2DOmzdJL@lizhi-Precision-Tower-5810>
 <20241126041449.qouyatajd5rie5o2@thinkpad>
 <Z0YAChEOnmezCBcU@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0YAChEOnmezCBcU@lizhi-Precision-Tower-5810>

On Tue, Nov 26, 2024 at 12:19:01PM -0500, Frank Li wrote:

[...]

> > > > > +	/* Only support one EPF for doorbell */
> > > > > +	epf = list_first_entry_or_null(&epc->pci_epf, struct pci_epf, list);
> > > >
> > > > Why don't you impose this restriction in pci_epf_alloc_doorbell() itself?
> > >
> > > This is callback from platform_device_msi_init_and_alloc_irqs(). So it is
> > > actually restriction at pci_epf_alloc_doorbell().
> > >
> >
> > I don't know how to parse this last sentence. But my question was why don't you
> > impose this one EPF restriction in pci_epf_alloc_doorbell() before allocating
> > the MSI domain using platform_device_msi_init_and_alloc_irqs()? This way if
> > someone calls pci_epf_alloc_doorbell() multi EPF, it will fail.
> 
> Yes, it is limitation for current platfrom msi framework. It is totally
> equal.
> 
> call stack is
> 	pci_epf_alloc_doorbell()
> 	     platform_device_msi_init_and_alloc_irqs()
> 		...
> 		pci_epc_write_msi_msg()
> 
> 
> 
> It is totally equal return at pci_epc_write_msi_msg() or return before
> platform_device_msi_init_and_alloc_irqs().
> 

No, these two are not the same. pci_epc_write_msi_msg() will only be called
when enabling the MSI, which is too late IMO. Why are you insisting in
calling platform_device_msi_init_and_alloc_irqs() for multi EPF? I don't quite
understand.

If the platform cannot support it, then it should not be called in first place.

> why check epf in pci_epc_write_msi_msg() is because it use epf in here.
> pci_epf_alloc_doorbell() never use epf variable. If check unused variable
> in pci_epf_alloc_doorbell(), user don't know why and what's exactly
> restrict it.
> 

This is not a good argument and doesn't make sense, sorry. You should not call
platform_device_msi_init_and_alloc_irqs() for multi EPF.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
