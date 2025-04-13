Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8937B1D9A79
	for <imx@lists.linux.dev>; Sun, 13 Apr 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744558215; cv=none; b=ipjRWRoQoMP2mISd8h5V2VAiwHl4aAptWpefu0D5aUR/Wf1NSl5ttp0D7FAM+kmZI+sCMoz0ucxq7Gi00MXgsA0CIvm/f7F2fXJlHlbMzlGdxpnDjq2fgP3JxjQYvZVjigPKbbBT6OHlOTNT7kbrpErIW8M767YQMA9wM5430Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744558215; c=relaxed/simple;
	bh=O26QBjaeH/GBehwhCpe0jia62s2T5H1sKW+zOlJypxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eB5whIU9I0OgwnCp/cGcSF5tZXSZCkxIgIhbVXfCncT18bbBLLKyxXqvmLUqWAiaebz96t2O822Q4ov1L6tdf1+XmNAkEO/vNTkI0TPmzuUxwUVAiPjGF8tgB5hz30nPGWuzOdw7JdIMudTE+YuFwE8e194QNz0gc3O0SLKJsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=judOJCwi; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="judOJCwi"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so2450160b3a.2
        for <imx@lists.linux.dev>; Sun, 13 Apr 2025 08:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744558213; x=1745163013; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=judOJCwizMTkHjRMICj4otQ9QEFwEbkgAVn5fRdszoDlL9qFgeW3SLdOIsC9fYSe0n
         TfIUccx4lJ7eLaS1p1zr68LbCl3E9NlaQweivvvEbujqg9+gJsAtom/sHsOm9TYZiZWH
         +m5r8ZQilaDHgztaNCFu8BmkeM4u/eWbdksZED6PVjZYBRb5CAkZHgGSAVuwH9yKGds6
         BAakC7Y9kdZ3bm+P5Oq/OlJR06YdIjkSLtc33IUmzH1fvBbPSUx/Vc3MTEN2Wqfu0ODv
         OxkxHyMUKi1pmft1bjZKW/vlDAop1NsgOfYVUwijWjnEJSNYtAsHyKz93HBPv0V9Nbub
         /y8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744558213; x=1745163013;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6YhpCUvtZQDpUlxDrFB7Y09wNEJFGtbdxnkmsZK4E90=;
        b=Y3HRN6aeZX/WsHTduz4xHEvsjQ3We/Ey8o6B11D9p6HTS/kGen9Y2r4YvDgsJV326w
         d38zQ4q55t4U5BigqvzPW6gZokGCZphp84reTBU9LpBXCAyMaMw2f5VG0rLmoiwwiyhs
         eQUm+qhu9FakbgDbnYjtNrS2FKaXMtlMANMuWxoQ1ZZOuTRx5NMiT0AWzsAOPdUFyw0u
         4ezBWGiaVskmZKBUnJz3973rQPAvL3ac8mUw0hC+/cARi9wLvyX+cf19ehlobknJl8Jw
         yr2H0LoC+fl5GchstpkEZv65a1NArFd7A24yRZUviga2/FRIYT/0CcB4WIPA0ZwPYkMs
         /6+A==
X-Forwarded-Encrypted: i=1; AJvYcCU1Kho5WHbbBBgXBIxHiUv3L0bPDAH6KvgocVaZmZH2/7xnjPc31gs23j4cWf/YqnM3Xsg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzQnG8i++rPAXm8kFUZpKqyWA6hQlUNs3JK+6zG1TUdOIsiopg4
	p96bHMtzJeXO42w0+HIhgVdLIIk98nPOhlqCZ4JuOXuXaJYi6jYol6NQrc5UuA==
X-Gm-Gg: ASbGncsvZEBHIBYRk87WE8wtC7UR+K3ODEC8jXxIhjstqpYhd0ErWngpzAUi1qHWi9V
	qtmjL/YAUvu2CuPk1vjDIjYuQ0x0F6g+s58mJL1EUmpE0JH8AZCNX3egDYg45pT55CL2cFXK9hJ
	peGLgwZEdHmBqTzcJnK57wkY8JYrTIJGB7CjNZKDEIOaxdOshkzcxISMsVtejFCmOVMBZdinbRY
	j9P7yHrruny9OxapHpYweCZFljo59oc94Y/R9Ry6K9q8Z0tanA6DX7id4FsL60cStZLQMbEbz5x
	msPAZ2eUJDULlZo9mSOPST9a44FZ83MEnnIPaJxIaeuzW30tag3W
X-Google-Smtp-Source: AGHT+IE0jyYBaLWROxwZRfj9Ap/rRwqRq+YqVPUJFP4QfIr9YmzNv06dYU+2Uj5cgUZODs640X4qrw==
X-Received: by 2002:a05:6a00:240b:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73bd12bef8dmr12879327b3a.21.1744558212599;
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219bf3dsm5245218b3a.16.2025.04.13.08.30.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:30:12 -0700 (PDT)
Date: Sun, 13 Apr 2025 21:00:06 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/7] PCI: imx6: Workaround i.MX95 PCIe may not exit
 L23 ready
Message-ID: <xajelvlhvoxyt53qdx7dmi4wgp5yvc2hpk5bqbftwklp4ecrhj@gtv3mhb2pyvi>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-5-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-5-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:27AM +0800, Richard Zhu wrote:
> ERR051624: The Controller Without Vaux Cannot Exit L23 Ready Through Beacon
> or PERST# De-assertion
> 
> When the auxiliary power is not available, the controller cannot exit from
> L23 Ready with beacon or PERST# de-assertion when main power is not
> removed.
> 
> Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> 

Please do not post next version without concluding the review comments. It just
wastes reviewers time and is not a good practice.

You haven't resolved my comments on v3. So I'm not going to review this one.

- Mani

> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 7c60b712480a..016b86add959 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -48,6 +48,8 @@
>  #define IMX95_PCIE_SS_RW_REG_0			0xf0
>  #define IMX95_PCIE_REF_CLKEN			BIT(23)
>  #define IMX95_PCIE_PHY_CR_PARA_SEL		BIT(9)
> +#define IMX95_PCIE_SS_RW_REG_1			0xf4
> +#define IMX95_PCIE_SYS_AUX_PWR_DET		BIT(31)
>  
>  #define IMX95_PE0_GEN_CTRL_1			0x1050
>  #define IMX95_PCIE_DEVICE_TYPE			GENMASK(3, 0)
> @@ -227,6 +229,19 @@ static unsigned int imx_pcie_grp_offset(const struct imx_pcie *imx_pcie)
>  
>  static int imx95_pcie_init_phy(struct imx_pcie *imx_pcie)
>  {
> +	/*
> +	 * ERR051624: The Controller Without Vaux Cannot Exit L23 Ready
> +	 * Through Beacon or PERST# De-assertion
> +	 *
> +	 * When the auxiliary power is not available, the controller
> +	 * cannot exit from L23 Ready with beacon or PERST# de-assertion
> +	 * when main power is not removed.
> +	 *
> +	 * Workaround: Set SS_RW_REG_1[SYS_AUX_PWR_DET] to 1.
> +	 */
> +	regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_SS_RW_REG_1,
> +			IMX95_PCIE_SYS_AUX_PWR_DET);
> +
>  	regmap_update_bits(imx_pcie->iomuxc_gpr,
>  			IMX95_PCIE_SS_RW_REG_0,
>  			IMX95_PCIE_PHY_CR_PARA_SEL,
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
