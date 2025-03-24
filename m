Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98B825F7B1
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 17:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742836713; cv=none; b=NjFOG0IiC6t9ARmAyzZrEJ/xnApeT/85Nc5pGf3GWPyY7rHtKuKuxKSwBi8Qck7vKbktYKx1vrFBAOt7t/Y1zLIbY/EdxbI1PRYAVzm1yM8ATDkV3uELzUnti49fj072t5Fy4JzaC+nmYRtTl2vXD2D203w7BjRwNFeC/6p5lfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742836713; c=relaxed/simple;
	bh=OO4f4+Q0rzt9wElVeMHssbBupiD7LRrwqaMbqJE61yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CLczxpTTu2qlXtqpkfb7ayTgxO/e3DxxeZBA47rk6kYDOHdZ7fkKSDaT7BQ+K3lIetGeGD8erhzWw14c8Z2DQNz0JIpJ6BDdwbtSSJ+0BKe9fE6mNLQ99t9dx5H/uWTCV4JfGrldJ1qYHiw11dXW6pI42a3qQsQUhNM5Qlrzob8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LPZgzo7E; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LPZgzo7E"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22409077c06so92123735ad.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742836711; x=1743441511; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZEbKpA1frJBrkSoz9cnFIH7frubQfuf2pOMnH5himQ=;
        b=LPZgzo7EcYnx8oXW81taU93WfwkxxVbnHYTu4TiykB/i7JQoXY8Z6bLfLJKmb2qN7h
         a6GpRhZPlhFJ5wmqwPaKytPFs1Hf55u6sFyvU1WJzMUV46U2PyU0ftTD53+o7UNo2pvB
         Xxee/ddY/8K34aoHJHAQ2LPGEknRlmTFMMm2K0BPm/OyH7Er2YLJdghWueKIjd5MZ7q1
         fB5u3wX7W9AXWBTu+pHa8GEWWfPib/b0u6ERqwvwgFUjAqol/uo8mWLfB1DJleCj1WRW
         S5K9g0zatSnMhExSy6LBdfr7w1+z5U2xLmaL6oiQGX7Zw2w2B/x9Ewlf8tLTgRWzB0Rf
         c1mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742836711; x=1743441511;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HZEbKpA1frJBrkSoz9cnFIH7frubQfuf2pOMnH5himQ=;
        b=OBARVZQrqYBkzjjti3eMFMze5VaQcLzZ42rEqpX+dQ7NSvi3fVwjaZ0fWt+NFkoADK
         NBHJjBdNJKL7uUkykVeC96DodRLCZxfH+9pJxxKxKZCjWhPV7wi+WBzT3ALom6mioVEx
         7+cZceOZB/cu2ob7PS+Jp1N6m4AmT4iVmrNazc7cii2N169uf6b/tAQMmz3bwanmWb2u
         eVht89EHvQlzvXUSPRPan9SsU1wT5Yu1aLZxj3ZrRDF3/uhxmHGoANsWZWIBJHlTTf6b
         SJqp6uTioAedOrlnpI1OvOrfKISsRFQH0fTKdGCnbqKEDkhvDRM5qKpI9oYr9jl92DeM
         tMoA==
X-Forwarded-Encrypted: i=1; AJvYcCVtT6tVgsKkxf6K82GctoXiiXaQpihI+RYxalrWjKiOPbnUZs7ofEWeKueKsmVZlu9tt+Q=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw/R7zcuIQcZmTu72j+S80kz56NsPl6ubtuf6pt2CE20S+zTk5y
	vtcWu6b7Kr263mJT68sXjhZ99VyPcjm0TdlXNxM4AWkirpbvPP7PiUgnYpawzg==
X-Gm-Gg: ASbGncurJMM5KYbhrCsxf4kZSvu3AESAruXR3Kx8bxEIBtWZPsSk4ABVqrLjPYmMgo8
	hE4ioj9JESsetidSU+dUtSVeM2wHbNGggTvbZcjigvlSQwsl5wZsvdyoZGp5uz9So1e28NFsa6+
	xqHw5LYEn3vJM/cB1GEY5M5C4MgNF7f3ez4GMg0g7lUXaRzX2L9iRpSI53C6AOluvrSa8K1FPo3
	TmTLlFMgBVy45yOBVNufAnsCTtV8HMHB6GIkFZwQlTwj+53AN8DTc9R53b4KXt48477qkkDwavC
	YRbO4w64ggCHPxbS+IMk9EK1m628qGa6/C+kMRG/LUEXszaJpTolfJgj0syvV3+RUA==
X-Google-Smtp-Source: AGHT+IG/+IMOKh9mdPF7QL4qAJQoeDmcoGNXXl94gtnk4lfwQykOcdsW47jIFy2/Z8VlBPbmIKO/Sg==
X-Received: by 2002:a17:902:f648:b0:224:fa0:36da with SMTP id d9443c01a7336-22780c7c06fmr184562345ad.18.1742836710841;
        Mon, 24 Mar 2025 10:18:30 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f3bbedsm73934205ad.3.2025.03.24.10.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:18:30 -0700 (PDT)
Date: Mon, 24 Mar 2025 22:48:23 +0530
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
Subject: Re: [PATCH v12 05/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
Message-ID: <j3qw4zmopulpn3iqq5wsjt6dbs4z3micoeoxkw3354txkx22ml@67ip5sfo6wwd>
References: <20250315201548.858189-1-helgaas@kernel.org>
 <20250315201548.858189-6-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-6-helgaas@kernel.org>

On Sat, Mar 15, 2025 at 03:15:40PM -0500, Bjorn Helgaas wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> Return the offset from CPU physical address to the parent bus address of
> the specified element of the devicetree 'reg' property.
> 
> [bhelgaas: return offset, split .cpu_addr_fixup() checking and debug to
> separate patch]
> Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 23 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  3 +++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 9d0a5f75effc..0a35e36da703 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -16,6 +16,7 @@
>  #include <linux/gpio/consumer.h>
>  #include <linux/ioport.h>
>  #include <linux/of.h>
> +#include <linux/of_address.h>
>  #include <linux/platform_device.h>
>  #include <linux/sizes.h>
>  #include <linux/types.h>
> @@ -1105,3 +1106,25 @@ void dw_pcie_setup(struct dw_pcie *pci)
>  
>  	dw_pcie_link_set_max_link_width(pci, pci->num_lanes);
>  }
> +
> +resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
> +					  const char *reg_name,
> +					  resource_size_t cpu_phy_addr)
> +{

s/cpu_phy_addr/cpu_phys_addr/g

'phy' usually refers to the physical layer IP block. So 'cpu_phy_addr' sounds
like the address of the CPU PHY.

> +	struct device *dev = pci->dev;
> +	struct device_node *np = dev->of_node;
> +	int index;
> +	u64 reg_addr;
> +
> +	/* Look up reg_name address on parent bus */

'parent bus' is not accurate as the below code checks for the 'reg_name' in
current PCI controller node.

> +	index = of_property_match_string(np, "reg-names", reg_name);
> +
> +	if (index < 0) {
> +		dev_err(dev, "No %s in devicetree \"reg\" property\n", reg_name);

Both of these callers are checking for the existence of the 'reg_name' property
before calling this API. So this check seems to be redundant (for now).

- Mani

-- 
மணிவண்ணன் சதாசிவம்
