Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A328E263F40
	for <imx@lists.linux.dev>; Mon, 24 Mar 2025 17:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742837436; cv=none; b=fJ9PwGoxj4iWcSF2u0o5ldOjJJ5JJToGVGQgb39JhkPCJMAHxGpb18Yf4jdKXomr6BF0epNIasnWmU8nLLoWvGuvdqDGdBlftoOtWPxbqu6djmlwJJBOPaq4mnBPwLMkIQc6afOxukntVR8KzygjTGnQMPxZJAMVjYQufNSX2Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742837436; c=relaxed/simple;
	bh=lqd9mgW634q7DcTAAmJU4y0Eo6khhw9KVi8woULxoj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C/2gAjE6l6v4pWBWpdPQBfiLojjAU0UTq8k9jKOgLPzrzAePeo7LuHxVQl9h6P239RAr3CnnU5H8E/2BipONEi9eq0VlTihBjnhJTW1FSFA23kKz4AFVtDX3J8OteJPPGj7m2orNM9hLbfmnNTd2WaOynCFXeR8DfRPJ7g+8kA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=re9hkZ7z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="re9hkZ7z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22438c356c8so92834705ad.1
        for <imx@lists.linux.dev>; Mon, 24 Mar 2025 10:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742837434; x=1743442234; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SnroRpadQs+73Z5A9Ek9rLWnGkVNNMMnwyBsGGz461s=;
        b=re9hkZ7zY+BazQJfcziYr8IBACXfDdIUTUeyrQ7ecSVRXEvNHWgP+dDwl5HzagZOgS
         VfBIwOdUA8YAFrnlyfPkFGLYGlgbahMF0lO9i80QkRjOZcR/hjLbkBd31nSI04rYDsGn
         hHIZorCxdfGdfszfJnmVmwjc++mmJUvkJQOI8A5ZZo5/sxEzxMFAlfcsgiOjXIVvIZyv
         hLyNdjMdl6EcZ6FEIHjkj0LJVM29TlvBAWPtsmK0+KSE9UEdn1Yz7sGIuHOVO4gvFrWh
         X+ml9G+jTlXlDQVnZOeyHeIRlkGwflWb7VK1j2uqe1XdRKWECNZ6D5Dv64DI5PvA6BOe
         DdUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742837434; x=1743442234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnroRpadQs+73Z5A9Ek9rLWnGkVNNMMnwyBsGGz461s=;
        b=jkCt/X/SxU8yGZSl0ZZuLa80/c/lhS7pvF1utWeTQO1V5PV+zNeay8w0MGWpUDv1W0
         9hX6RhUoR3USQR248fXuSBgZx87xzh0QS/4DRDRwJz9Kri3dskMBrezpcWWnRYd8WPSh
         fsIL5Zf6Bvswv+my4ewcznRBID5pkuHQ2gdgz0PIdiDNOApCi19XJ9ADNIGLKMXHM8od
         Leo8Zb5M490vQVDkgy8h4EZqdbOIhHwO9rWlJVIxANC/4ifVsw74gMeCGFNfoaVVE0Yn
         i6HU5sQm3AXBEAO9IS+OerJ+kMvmnrk4pV3r9D4uktdokGEUFXUGwSs6lGEpeZfpMGC5
         icig==
X-Forwarded-Encrypted: i=1; AJvYcCXe4w0CxDp3hHOmK+XDP4O7mUICePdWgLo8A8SnXXx+oBrPqS0etsaKTsl7NIShMdSyaG8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9Ss/5xmQ05v4HpHmX6xdQYo5WovctaP5GG+0ke1vhhMwj897E
	oJGzwPigfEXcQiW9u7Ta/XVedKpYqXNG+VEfeIcY+s0C1Hwrnwe6XYnxrfT9rA==
X-Gm-Gg: ASbGncv2+6uMvrFvpjzr98XAVTVjBUltKqXgMoMOuf0yxDKrnOZbsEdBlNd21Atl81t
	skx6BnfaYOWJHuuat/cvcpML0FKCuYtddqm0nPBxh5KYdPyc99nD1NK/oA+c3KOCyuR7TNkULXk
	FW/I9uBFr8LR3sMZEtX01PANN84Iz1Ys0sgVq6XnIe0IvIgZnNAnUG7zUggyybBEQiFZoePqxqJ
	U4aCl2HJ6cJdbW20wDswloe5OBSOwX2WHHp6INAvHJQgaWwaPwsHGuJ92xc2boaKbMT+BjOk67e
	4qYLu/wToiLE0qX73WnsHmaRwYFOdrUpZbUgHM9VkJIgN8/TTgSfWVs=
X-Google-Smtp-Source: AGHT+IFJCOVJt8P803wd2MA7JhfBhloa/XWaXKSzLJsxknH/vt3+SULEZbCYIKyBwnuGPda9wxAY4g==
X-Received: by 2002:a05:6a20:d81b:b0:1f5:67c2:e3e9 with SMTP id adf61e73a8af0-1fe4342cc6emr22747430637.29.1742837433231;
        Mon, 24 Mar 2025 10:30:33 -0700 (PDT)
Received: from thinkpad ([120.60.67.138])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739061598f2sm8309667b3a.153.2025.03.24.10.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Mar 2025 10:30:32 -0700 (PDT)
Date: Mon, 24 Mar 2025 23:00:24 +0530
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
Subject: Re: [PATCH v12 06/13] PCI: dwc: Add dw_pcie_parent_bus_offset()
 checking and debug
Message-ID: <x2r2xfxrnkihvpoqiamgjmvppverjugp5r4we7lcfpz6jloxzy@7kdfzxiwv2po>
References: <20250315201548.858189-1-helgaas@kernel.org>
 <20250315201548.858189-7-helgaas@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250315201548.858189-7-helgaas@kernel.org>

On Sat, Mar 15, 2025 at 03:15:41PM -0500, Bjorn Helgaas wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> dw_pcie_parent_bus_offset() looks up the parent bus address of a PCI
> controller 'reg' property in devicetree.  If implemented, .cpu_addr_fixup()
> is a hard-coded way to get the parent bus address corresponding to a CPU
> physical address.
> 
> Add debug code to compare the address from .cpu_addr_fixup() with the
> address from devicetree.  If they match, warn that .cpu_addr_fixup() is
> redundant and should be removed; if they differ, warn that something is
> wrong with the devicetree.
> 
> If .cpu_addr_fixup() is not implemented, the parent bus address should be
> identical to the CPU physical address because we previously ignored the
> parent bus address from devicetree.  If the devicetree has a different
> parent bus address, warn about it being broken.
> 
> [bhelgaas: split debug to separate patch for easier future revert, commit
> log]
> Link: https://lore.kernel.org/r/20250313-pci_fixup_addr-v11-5-01d2313502ab@nxp.com
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> ---
>  drivers/pci/controller/dwc/pcie-designware.c | 26 +++++++++++++++++++-
>  drivers/pci/controller/dwc/pcie-designware.h | 13 ++++++++++
>  2 files changed, 38 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
> index 0a35e36da703..985264c88b92 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.c
> +++ b/drivers/pci/controller/dwc/pcie-designware.c
> @@ -1114,7 +1114,8 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
>  	struct device *dev = pci->dev;
>  	struct device_node *np = dev->of_node;
>  	int index;
> -	u64 reg_addr;
> +	u64 reg_addr, fixup_addr;
> +	u64 (*fixup)(struct dw_pcie *pcie, u64 cpu_addr);
>  
>  	/* Look up reg_name address on parent bus */
>  	index = of_property_match_string(np, "reg-names", reg_name);
> @@ -1126,5 +1127,28 @@ resource_size_t dw_pcie_parent_bus_offset(struct dw_pcie *pci,
>  
>  	of_property_read_reg(np, index, &reg_addr, NULL);
>  
> +	fixup = pci->ops->cpu_addr_fixup;
> +	if (fixup) {
> +		fixup_addr = fixup(pci, cpu_phy_addr);
> +		if (reg_addr == fixup_addr) {
> +			dev_warn(dev, "%#010llx %s reg[%d] == %#010llx; %ps is redundant\n",
> +				 cpu_phy_addr, reg_name, index,
> +				 fixup_addr, fixup);
> +		} else {
> +			dev_warn(dev, "%#010llx %s reg[%d] != %#010llx fixed up addr; devicetree is broken\n",
> +				 cpu_phy_addr, reg_name,
> +				 index, fixup_addr);
> +			reg_addr = fixup_addr;
> +		}
> +	} else if (!pci->use_parent_dt_ranges) {

Is this check still valid? 'use_parent_dt_ranges' is only used here for
validation. Moreover, if the fixup is not available, we should be able to
safely return 'cpu_phy_addr - reg_addr' unconditionally.

> +		if (reg_addr != cpu_phy_addr) {
> +			dev_warn(dev, "devicetree has incorrect translation; please check parent \"ranges\" property. CPU physical addr %#010llx, parent bus addr %#010llx\n",
> +				 cpu_phy_addr, reg_addr);
> +			return 0;
> +		}
> +	}
> +
> +	dev_info(dev, "%s parent bus offset is %#010llx\n",
> +		 reg_name, cpu_phy_addr - reg_addr);

This info is useless on platforms having no translation between CPU and PCI
controller. The offset will always be 0.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
