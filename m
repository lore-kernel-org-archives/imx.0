Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F8225C6FE
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 14:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742826969; cv=none; b=UJtYtKM9xRDEvRbzxcH8BlgOpSnJh2GhKPJkiNgRY0qlU/8pspZjRfpwF0F5tdmi8Yb03KuE7KSNFqpVDYMJ7krjIJJW9zyA3YrGG4M5Yk89e4ZW6dt7s31JhOrxj0+7yPJBxAfO/0PJCMuo4lFlxWFe3t3e1gkzyiCANMTrAus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742826969; c=relaxed/simple;
	bh=GzU2khTy9edLOPP+nLp8NetDsg+HJrBHGDBGWsqgqUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ly/vjpKyjiXrdtwQdtEDd5peKVEfQAyM7lu3sDDpj4D9yphXy1/63mNcHNlURnrmKpOZocAl4Xmty8uhSfJQbx/2ByVrTEqfq7e1Ezgl0+j8jTn6LL4Vc7eMytW5b6Cd6iqcV0GAK6aNXhpxcQk3J8o21G+/vyjWkoOYawfG4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MLA/Ps5j; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MLA/Ps5j"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-223a7065ff8so10445995ad.0
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 07:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742826967; x=1743431767; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gfDNrOLDRsSoKnoiSnKZrCZ6ys+s/p6oKC6Xtt3UxnY=;
        b=MLA/Ps5jMWIxuke93lM7vnsB6ddYfc+L8umfolTcC8LddapktZjRfu4jhW2/PO2yQN
         t5ltlctEXpeJaDUGQRe1acBqdbGVcLM/S9vQuFCkfdiiQVL/KCUuytpRczmjWIVIF6K8
         y+ITEVUBjt8vT2+5tG4YLAdI30AMHT6ivlHqRJmstuQbi63/rmfcSgtYpz8wQ3Q+G9Zd
         4el9kmAjrFk6rhhk7TQB+uUgdf3NevyVryBl5pci9gaf1hx8rqdIt2YKTKcCVF7NtPJ6
         4OoZChLVJTRv5yFq5haMPcZl/moZqHo04WhEyVe7Z8q/KdlDvRB8p0boJxP1etV+ZRtV
         4few==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742826967; x=1743431767;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gfDNrOLDRsSoKnoiSnKZrCZ6ys+s/p6oKC6Xtt3UxnY=;
        b=iUfWg8kFjR/QIDw5vJcRqXseMdBsqssMeUE6doXJORFNRQtsRw222vGrb6P7fddJin
         8KXwC7bREOee6oh08zzLHPm6nd/TcKM1I86lZeHGeJFGM3y8xJgEc6ECjuTKFA8OMEmC
         fmQsHOhEvNYThfgpssOaloUIkdFee/2O93VfA2PhnWF+NS6Jbr0a9m0noLUDEhI36Glj
         2ly2DiPqJmbCTOPoK3s9gxWNJ44bWJm1zkKvCsdku/0mmffVMQ5zvUxFppWAMhQrVqBe
         m/hF89X7byfYh7FcbRznybj6SxTN4xev9fEuV1GcctC9nEDYe8ACtA1qbgEGMzzxU1Mm
         SFQw==
X-Forwarded-Encrypted: i=1; AJvYcCVpGQTeSsLNBKWzmvvSRUJQ7AhEwmM+BnVSUv1E0Q1ZcYCNeqKSHK19JTciKBQvJLtyw4s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1zgPCdK5Md9dSIQMdoy42Ux//x7bNTX0s/LJIUC421bSjEKfQ
	Xox9X846Vi/l7T2LrF/0wQGoXojn3Joh1/uWG13CTT71YUMsXy1TPWjGNt1fbQ==
X-Gm-Gg: ASbGncvZ11rw9P6+PpQl98KsxTxk5X1WY6y86XVBHMI/9U3P3aO4o4URgs3zzY3eJB3
	y1X5225afjm7eAuEumWnY/jcyyC7sSrcWMvUhnebK3jFqUevtBrjDegsF+xZAGLZ8gvBbzjg3Yc
	wPsfKUtS3TorJac6uDRZM8Ikg5tmSXxPn6MBHG7kg+gT9eWK/olBwNhskmdX/QTE4Ry8Poj33S3
	PLRkAp8+cC1/9lJ6lo+Dv0BH5BawjILFwAxRc8sfHnisRnV0SVjSGM98nI0cTP1sUw/Mglus0tR
	O7WPhKvZRQHRL+srn8kybz3sx/KDCAQKXyu/6yJfuTxH7FhhIu8Mu6Y=
X-Google-Smtp-Source: AGHT+IHosn533Honkxz5Gkn47lhA4z7ibid7YzujQ4Q5gGN1wmrSmuIZVipbX/6bHz2UT8zZDxLukA==
X-Received: by 2002:a05:6a00:1885:b0:736:ab1d:7ed5 with SMTP id d2e1a72fcca58-73905623ea3mr21273776b3a.0.1742826966908;
        Mon, 24 Mar 2025 07:36:06 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73905faa565sm8053740b3a.1.2025.03.24.07.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 07:36:06 -0700 (PDT)
Date: Mon, 24 Mar 2025 20:05:58 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Niklas Cassel <cassel@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v12 00/13] PCI: Use device bus range info to cleanup RC
 Host/EP pci_fixup_addr()
Message-ID: <brhtmymbntt7dk3bqgcwjb72ai4g2bn4b5emcaxntbizvu4i7f@ulvm37yyl4oq>
References: <20250315201548.858189-1-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-1-helgaas@kernel.org>

On Sat, Mar 15, 2025 at 03:15:35PM -0500, Bjorn Helgaas wrote:
> From: Bjorn Helgaas <bhelgaas@google.com>
> 
> This is a v12 based on Frank's v11 series.
> 

Mostly looks good to me. But I do have a few comments, that I'll share.

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> v11 https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-0-01d2313502ab@nxp.com
>     
> Changes from v11:
>   - Call devm_pci_alloc_host_bridge() early in dw_pcie_host_init(), before
>     any devicetree-related code
>   - Call devm_pci_epc_create() early in dw_pcie_ep_init(), before any
>     devicetree-related code
>   - Consolidate devicetree-related code in dw_pcie_host_get_resources() and
>     dw_pcie_ep_get_resources()
>   - Integrate dw_pcie_cfg0_setup() into dw_pcie_host_get_resources()
>   - Convert dw_pcie_init_parent_bus_offset() to dw_pcie_parent_bus_offset()
>     which returns the offset rather than setting it internally
>   - Split the debug comparison of devicetree info with .cpu_addr_fixup() to
>     separate patch so we can easily revert it later
>   - Drop "cpu_addr_fixup() usage detected" warning since we always warn
>     about something in that case anyway
> 
> Any comments welcome.
> 
> 
> Bjorn Helgaas (3):
>   PCI: dwc: Consolidate devicetree handling in
>     dw_pcie_host_get_resources()
>   PCI: dwc: ep: Call epc_create() early in dw_pcie_ep_init()
>   PCI: dwc: ep: Consolidate devicetree handling in
>     dw_pcie_ep_get_resources()
> 
> Frank Li (10):
>   PCI: dwc: Use resource start as iomap() input in
>     dw_pcie_pme_turn_off()
>   PCI: dwc: Rename cpu_addr to parent_bus_addr for ATU configuration
>   PCI: dwc: Call devm_pci_alloc_host_bridge() early in
>     dw_pcie_host_init()
>   PCI: dwc: Add dw_pcie_parent_bus_offset()
>   PCI: dwc: Add dw_pcie_parent_bus_offset() checking and debug
>   PCI: dwc: Use devicetree 'reg[config]' to derive CPU -> ATU addr
>     offset
>   PCI: dwc: ep: Use devicetree 'reg[addr_space]' to derive CPU -> ATU
>     addr offset
>   PCI: dwc: ep: Ensure proper iteration over outbound map windows
>   PCI: dwc: Use parent_bus_offset to remove need for .cpu_addr_fixup()
>   PCI: imx6: Remove cpu_addr_fixup()
> 
>  drivers/pci/controller/dwc/pci-imx6.c         | 18 +---
>  .../pci/controller/dwc/pcie-designware-ep.c   | 74 +++++++++++------
>  .../pci/controller/dwc/pcie-designware-host.c | 57 ++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.c  | 82 ++++++++++++++-----
>  drivers/pci/controller/dwc/pcie-designware.h  | 24 +++++-
>  5 files changed, 171 insertions(+), 84 deletions(-)
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
