Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD964224D1
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 05:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727932538; cv=none; b=MtCatHTVNPKadOpiuxYvL7h4yfgv0YSsvoThYI8MUubkPibBKNtzhDVxRppPmiFZlt+voGpdGKRV/OZxRhsw7oTzX56q4UOiRS1vxxMd8P0T00c2cJyTq7IDzG/YIgcX3fRgzE3vXBzKtWRefrw3nJLqbTY8QDuR964Ik2morpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727932538; c=relaxed/simple;
	bh=OHiaQB6DuBhomWeQAXyZs+hA1EcEH547SHdB4xPJezs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiWm3mW3U5IZLphyH8T/uz748Te92u48aMLGD2TX4KmkmbX3SxgGjvcmhJBtEJfs3CYYTX8Lf1CcegHONJgVzhnDzPhelzCoNpoLq1e/FVnwz/sngPf2qjTYCcvcglm0pXqppAnvgmB6jcwMHX03cPDD+ebJuyK34OaM9n6qQG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IDyT8B6a; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IDyT8B6a"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e09d9f2021so416461a91.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727932536; x=1728537336; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zDZEd+knXkuxXPgXs2kDCTgo3adMpe62SuSlOEQu0K8=;
        b=IDyT8B6at5s8+rxMUx0xU3wP0z6pOSMvnU6g19LEGw/SaCyIVv/Hj/FWqKAgYRNeTs
         Mz1OJhekHYZH2AyEi1G6+E20JzTtsCbuYfItlJ5UXOT85jn+xkH15fmyFgjOi4ylXExL
         wXDwJj9jAVF/7YxUza3+pCWO86z9jrsRDwYgkzphyguOj7386h6MGEvHPR6U1cJQqfcB
         te9tpi4ow9XCLWHvu4bajDNyFxDjAflFvJHsR7lWPbwVUaz5Rt4hh+Am2LS0EyTp8FMm
         CjKlqoogCTmW03Z0ESROi6g2ShM8zX4NOpvgZReidlFgWWk/V3NnaGWQzlSnC7zZMNRR
         zKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727932536; x=1728537336;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDZEd+knXkuxXPgXs2kDCTgo3adMpe62SuSlOEQu0K8=;
        b=a6vxIXeKdCq0KiLTaSUnzYJYsx6TtykTDIlvC/SjeuuDmv4vrYcx27oKMd3Znn/d4y
         ngR+CIx5+tlW1Ys50uyR4Y0KWYADlSSPELv2/0R7Zwg5RcJJzZ9TxDno829+16qdZqk6
         EWrxxbpNeUDPD2tl01bY9XyfcaStJGvmxSJ0PhapNobY8aNxUBeiS07C0h+UEBvouqZf
         gH42Opyy378v5TBNz7SliPywHPNSK4AfVMKbhjI/9ouHQBjKjNAqixcQkbIe67kwx3sY
         Qs6Q5z9aA8iybLT2rtPgIcuhPbGaetmdW0SxvXDnWm7tZmOJt7PuxklQiPn6S0Gq8aA4
         ZfFA==
X-Forwarded-Encrypted: i=1; AJvYcCX5BPrNUxhJxWZ6Fblw6A3m3L9mlW6T+8uq/oUSyPKtTJWBnQ8dG6mLD+PStCCh0GGmT6M=@lists.linux.dev
X-Gm-Message-State: AOJu0YzY212azR5JUKWXqlxQg3LIl3VQv5qp2iSqkpE7DPvdRWaI+pOF
	dGoxpp8BoZCrHLRiZJFAWFiDsCtK7GdJT1T8fdKVFeSJcL01tqgu3GgJxWcruQ==
X-Google-Smtp-Source: AGHT+IGFzmJSdO8rd6CXNlY0TTZNLylyV1+W0nXK1rdwwYtV/CN8tyL4ABdeXZlNSjBhb2YD1GkaTA==
X-Received: by 2002:a17:90a:a00f:b0:2e0:77aa:fecf with SMTP id 98e67ed59e1d1-2e1849cbe38mr5987618a91.41.1727932535975;
        Wed, 02 Oct 2024 22:15:35 -0700 (PDT)
Received: from thinkpad ([36.255.17.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e18f773a21sm2669570a91.20.2024.10.02.22.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:15:35 -0700 (PDT)
Date: Thu, 3 Oct 2024 10:45:28 +0530
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
Subject: Re: [PATCH v2 0/2] PCI: add enabe(disable)_device() hook for bridge
Message-ID: <20241003051528.qrp2z7kvzgvymgjb@thinkpad>
References: <20240930-imx95_lut-v2-0-3b6467ba539a@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-imx95_lut-v2-0-3b6467ba539a@nxp.com>

On Mon, Sep 30, 2024 at 03:42:20PM -0400, Frank Li wrote:
> Some system's IOMMU stream(master) ID bits(such as 6bits) less than
> pci_device_id (16bit). It needs add hardware configuration to enable
> pci_device_id to stream ID convert.
> 
> https://lore.kernel.org/imx/20240622173849.GA1432357@bhelgaas/
> This ways use pcie bus notifier (like apple pci controller), when new PCIe
> device added, bus notifier will call register specific callback to handle
> look up table (LUT) configuration.
> 
> https://lore.kernel.org/imx/20240429150842.GC1709920-robh@kernel.org/
> which parse dt's 'msi-map' and 'iommu-map' property to static config LUT
> table (qcom use this way). This way is rejected by DT maintainer Rob.
> 

What is the issue in doing this during the probe() stage? It looks like you are
working with the static info in the devicetree, which is already available
during the controller probe().

> Above ways can resolve LUT take or stream id out of usage the problem. If
> there are not enough stream id resource, not error return, EP hardware
> still issue DMA to do transfer, which may transfer to wrong possition.
> 
> Add enable(disable)_device() hook for bridge can return error when not
> enough resource, and PCI device can't enabled.
> 

{enable/disable}_device() doesn't convey the fact you are mapping BDF to SID in
the hardware. Maybe something like, {map/unmap}_bdf2sid() or similar would make
sense.

- Mani

> Basicallly this version can match Bjorn's requirement:
> 1: simple, because it is rare that there are no LUT resource.
> 2: EP driver probe failure when no LUT, but lspci can see such device.
> 
> [    2.164415] nvme nvme0: pci function 0000:01:00.0
> [    2.169142] pci 0000:00:00.0: Error enabling bridge (-1), continuing
> [    2.175654] nvme 0000:01:00.0: probe with driver nvme failed with error -12
> 
> > lspci
> 0000:00:00.0 PCI bridge: Philips Semiconductors Device 0000
> 0000:01:00.0 Non-Volatile memory controller: Micron Technology Inc 2100AI NVMe SSD [Nitro] (rev 03)
> 
> To: Bjorn Helgaas <bhelgaas@google.com>
> To: Richard Zhu <hongxing.zhu@nxp.com>
> To: Lucas Stach <l.stach@pengutronix.de>
> To: Lorenzo Pieralisi <lpieralisi@kernel.org>
> To: Krzysztof Wilczyński <kw@linux.com>
> To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Shawn Guo <shawnguo@kernel.org>
> To: Sascha Hauer <s.hauer@pengutronix.de>
> To: Pengutronix Kernel Team <kernel@pengutronix.de>
> To: Fabio Estevam <festevam@gmail.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: imx@lists.linux.dev
> Cc: Frank.li@nxp.com \
> Cc: alyssa@rosenzweig.io \
> Cc: bpf@vger.kernel.org \
> Cc: broonie@kernel.org \
> Cc: jgg@ziepe.ca \
> Cc: joro@8bytes.org \
> Cc: l.stach@pengutronix.de \
> Cc: lgirdwood@gmail.com \
> Cc: maz@kernel.org \
> Cc: p.zabel@pengutronix.de \
> Cc: robin.murphy@arm.com \
> Cc: will@kernel.org \
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Changes in v2:
> - see each patch
> - Link to v1: https://lore.kernel.org/r/20240926-imx95_lut-v1-0-d0c62087dbab@nxp.com
> 
> ---
> Frank Li (2):
>       PCI: Add enable_device() and disable_device() callbacks for bridges
>       PCI: imx6: Add IOMMU and ITS MSI support for i.MX95
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 133 +++++++++++++++++++++++++++++++++-
>  drivers/pci/pci.c                     |  14 ++++
>  include/linux/pci.h                   |   2 +
>  3 files changed, 148 insertions(+), 1 deletion(-)
> ---
> base-commit: 2849622e7b01d5aea1b060ba3955054798c1e0bb
> change-id: 20240926-imx95_lut-1c68222e0944
> 
> Best regards,
> ---
> Frank Li <Frank.Li@nxp.com>
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
