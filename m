Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C40264A7A
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 17:34:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837662; cv=none; b=sE16rSzHC9yJ+3hjp5FQbiI7Vdrb2ps6IVaKYQ1kOsFs1fqiKAO2/PXrle6dDw7fqFq+W49bjt6l2Jhs4KRcHbD8lVa0ye9l+wXFXZTbN5qEKQ8qmmCM+v5VKzFdlmzlUCc/ZroZo6PmYLriHk9M0M3bj8hPwGyYBnxMwMHJfyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837662; c=relaxed/simple;
	bh=9VD5yRc3tLAiwhVEBXo82ZOS86iUaUZI1Asrk4moJko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ix8QfpRrJuVqmGbekUaeFcRz6Rff6MlukjUC3wPhswcKBvKPhCAGapjuxYVRTAiV67e8E7Q2K4apyMqyv797PYJKi9sN1Nz2ACZUAknbyPxnimIdDB9uJoe0rpQO+oQdmPhsU3lQ0G0CnuGDmng1iB37RgqVsoVKU57hFxd0VBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pjQI0eSH; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pjQI0eSH"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3032aa1b764so2696987a91.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 10:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837660; x=1743442460; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=83CYsZDlIxjagBMUpXjJLP1JyYGcnqEAQYBsR+/D8Lg=;
        b=pjQI0eSHtWWpJIgZTEAfFU84Dhq4UTNh9EWp0f37GWC4W860MPA8kCwgW3dR+HW5fM
         E7zVfXc58KZMR5nMR1PCDd+Yy6joDmS2ua85dDMAds8fnTQPdrWmMwJtlFd46TSnGNtz
         SY3qREv1KxORNdrgKJKuAgqCPCLqG3SL8C28dou+wO+fBgN5/R7Nq/2i8LVFwJQ0toAx
         0NCzsR2DAGBWJMG0qW+Z2Qjp5jUNZqKAFvnKMkQvaertKMgkYCUuI+TNBnZVsgnxWcjp
         NbuCehaS+cPSEzqDCVY86Vb02rJJEuBWCpc5Joxo7hwppFpwkdcxMpapwcnjCU4Gl6dz
         RCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837660; x=1743442460;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83CYsZDlIxjagBMUpXjJLP1JyYGcnqEAQYBsR+/D8Lg=;
        b=HUTPu+8Eo9hGCS008FHXjQhS+egPn9IzaOEKAiHa1/dbuxCPJnUSGgzPkJojiC05oG
         1lVSnGAGDNVic4YHSxqJUDF7JUsIeUav2v35N8+nouMUJLIsHDoN0OcHcN0Xoal+PwsV
         vhTxp5EsnVHdqk9TxLu+eeU3vswzG4fKjx3QzER8kVyujbUUe4m6GfZTDBKwCmONbQJR
         YrLxDUtf03Vi9JSaPg0DepyRFryqJsSCaneGhdRAgEWBc1pkdUGwkpNvaXb1prvvP75r
         GLOVzZPm9TmBYQfzXePgjrzdBGCUFXnYfV7o8BcAFeotbIZo7zuia6tDKz1hRGf1AbJ3
         WFwA==
X-Forwarded-Encrypted: i=1; AJvYcCXjzG6KaVicqgCGQKOjNoK9OKWOT60rl77oTiAiyeD9yqz1nsYCNhfunzoHZdKBJIbGKCY=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9sd31tuPIdWSq+P/xqdyHtGoNDvx2m7ahOqMVuw5IAWoRW2e7
	uNUR5fQcOw/nUaP68i4abolZ0TPvm/Hav2qYr2vrs/lOf78mLqiwEDSu9wkSyg==
X-Gm-Gg: ASbGncubqPOuTcPFDHzS1SahPPtSbl2Lh3C9NeWFnNrUQS81tnewa9o4rMxxQhqNtf6
	3nRYpw9zCl3DjRNTqRGsbXFH1fMihqaBnianng6HeUpHCdeseXIIw+he7p1pRGcKlOC8viEMwFS
	YetQX5tsZ1Cj52IMKmNTa76/+YVQNe7vH1iO/MqEsWbAB0egLutRPfmL2/WPpDGC4LjY/M0obI9
	m+ZWQmznBkj4VUPaT3oQH9hV/7la2K4P6U6FJiJFQq/GwKfOQ9kJ4E5nXw9AVlptsifyJC+c7/q
	ZxCfUhfD5pDBv9eg5EfWe6uLp+bO3eqA4AHwH3GjkXvsmBVXIkuypF0=
X-Google-Smtp-Source: AGHT+IHbIVCssVeg7Lv61Tjada9UpukwFQFdXBab670umPHzvG4MJv+C/Yb75yCUgxbb10I3kj+LVA==
X-Received: by 2002:a17:90b:510d:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-3030fefd847mr23814182a91.24.1742837660393;
        Mon, 24 Mar 2025 10:34:20 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-301bf61b525sm12457882a91.35.2025.03.24.10.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:34:19 -0700 (PDT)
Date: Mon, 24 Mar 2025 23:04:10 +0530
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
Message-ID: <sffiojhyyu5gc7nx4oe6re53r3ti4nbnkworsxzawkus6ovlsh@3auwqhcpdp3c>
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

Tested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org> #SA8775P-RIDE

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
