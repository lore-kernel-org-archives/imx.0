Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D81C23027C
	for <imx@lists.linux.dev>; Wed,  2 Apr 2025 06:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575799; cv=none; b=FbYDQ4t+b7nMu3mT3vGsZAp1XHgwvUw0q5vYwI+wCwD49JVv9OMAREgVTwMBvTA1QMZQ1sG5ovIGCdVVGxFePIJp6tGPg4ySSxx2FsXjOo/Kv5qhKe5MwQhaUUnXGNpIo22nfExHhRo1DKPmgCokmsMzXosIYjmnaFfhzeUOnjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575799; c=relaxed/simple;
	bh=9KYkwa9YJk15TN8slptE6dFITwCH+aL/RFH8C4B55u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucI9T5CXiiTlzVMVmzN1oa5KXlS8IxQ4HsSaC/1SU/tUDe0I4NNzhTxxmbRUhYtCNNWvSy1IJIwzwotec9zU9x+pYhVdOs/A8NBRp4mu/S3/nBoT1pWeYRVrXNM5ZBnHDsxS4dVOSxH0C0tUW/HvCIEaetkpj70xxNP/r+LoTXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wQ75BQNM; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wQ75BQNM"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-227d6b530d8so116041795ad.3
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 23:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743575796; x=1744180596; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QBpFdjJKRK2wPZJQzSRTw4eJ4hUT7j61gGfvcZ13EGg=;
        b=wQ75BQNMHsbDagx0tzG0rQ0oTLvyXGe9cK7ZWP1IeRw2ZXauuQj39nm7KjWfKXY917
         xLmlMVy6Tacbq8kt6WraXT3v73s1BZLnKm8IrCzPK79xSixSpwI5238faMkVS6ZWDxSu
         FDh+RiuBjW1u9m2LPZ3z85CvdpHfMk3N613oI4vfeK1eaUklW9KvE+DuxvF7ZbH5dk6T
         mZ9BupdWJg8z3UGf5JgZONsSOmHkDibvYPSTDW86JRsrfKfyd+/o94me6ON2P1/OwNFL
         vm1UajiRlSRv42WRpNL1GKlTd6QRLxN/QSWiVaDABlnu9gfrFBpZ0r3MV6zTTmiNu0v5
         z3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575796; x=1744180596;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QBpFdjJKRK2wPZJQzSRTw4eJ4hUT7j61gGfvcZ13EGg=;
        b=W36deL7eGwJ4FbBsSsubFMGvBVjyPMWNwwSGxoRUfC4f2/iWMPUih1EYxM1+lAnNxh
         0wVlB1SyelKgVeW0pxZYXeYV33JvEYXzau6x/wjYwZ+eOJtFK08j3fB9xEUIEsXUEEZU
         6x8iyvhkBh1OW1e/WzBsYv/pyRg+FgsoVU4DimeIaVa9BAvlE4MIFCdmsGDel35Yp0VH
         LDs4mAusKJmhRJWI+jAm6xWM+YTehJXjIJP7W8WHRT0QK1O9YjmRJ9Iz5bPUVlnpj4Ss
         2oAFrAyfUrwV1/oRe1HZSazkIOmK3bdFW0EM6e7irYogHmwidyySnQmaCuAKlJwxb0EK
         DNdg==
X-Forwarded-Encrypted: i=1; AJvYcCVtlqFbFCM31Rw+m02T/B6db/Oomf+3xJAY20Ykx/x2iYhs4gRH6UI5qegh3yfLmDUDu/g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx9iIlq6OJzW85fpCQYkVRtJKH3zpc3H7wkiV5m0F+BRSzmNNs
	kQBGni8VyHc8ky+fjoeQMvnlRsc1Rt+M7E4KeP4B9rMOeS3mrN6/dXtQZZk+nA==
X-Gm-Gg: ASbGnctfnwClGWGYrI8sy1LSkH4on4G0YYlJ0PQinNDdUHJJflX7+IuHt992ijdfhT/
	wtecoqnopnNiIWZJpgs/DT27ngcf4DM5fbujWgi+JcBXWvEouJ3TQkVgm/x29Os9PR9l7AwUJOX
	hA+8+VeD3TuAaVUJAABsemwtqyoBfkQva+sH3dll53X58pGxD5wi7uIBXCHKcQk8k1rJeE/rqq2
	pBkjcd/o/8gqDQZEbO52QwmiMNSitVNWSfb3zeNuLOV302UP7IQFE58ouzig1ZOKiCVfjOas1FT
	fTkxrhi5F4+Jl1hxzf8xqwAiCb5Pv6F9AtNCACKmrXJPDNp6lGO6PdlI
X-Google-Smtp-Source: AGHT+IE6fEQRPpZTuVLgYtn/kGTPJXOscRmOwPKgic6LUNeFQjJDmRybRlM29Dg7FxrNgKq/c8uH3g==
X-Received: by 2002:a05:6a00:1704:b0:736:51ab:7ae1 with SMTP id d2e1a72fcca58-739b60fb6a5mr7052602b3a.16.1743575796230;
        Tue, 01 Apr 2025 23:36:36 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e22356sm10115837b3a.39.2025.04.01.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:36:35 -0700 (PDT)
Date: Wed, 2 Apr 2025 12:06:29 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/6] PCI: imx6: Toggle the cold reset for i.MX95 PCIe
Message-ID: <fatfobrf53l3ngps3rl67gayhnlsqncgd2tabgcspac3n3o4xt@a4yrmtvaitai>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-3-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:09AM +0800, Richard Zhu wrote:
> Add the cold reset toggle for i.MX95 PCIe to align PHY's power up sequency.

What do you mean by 'cold' reset? Is it 'core' reset? I see both terminologies
used in the code.

> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 42 +++++++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 57aa777231ae..6051b3b5928f 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -71,6 +71,9 @@
>  #define IMX95_SID_MASK				GENMASK(5, 0)
>  #define IMX95_MAX_LUT				32
>  
> +#define IMX95_PCIE_RST_CTRL			0x3010
> +#define IMX95_PCIE_COLD_RST			BIT(0)
> +
>  #define to_imx_pcie(x)	dev_get_drvdata((x)->dev)
>  
>  enum imx_pcie_variants {
> @@ -773,6 +776,43 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  	return 0;
>  }
>  
> +static int imx95_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
> +{
> +	u32 val;
> +
> +	if (assert) {
> +		/*
> +		 * From i.MX95 PCIe PHY perspective, the COLD reset toggle
> +		 * should be complete after power-up by the following sequence.
> +		 *                 > 10us(at power-up)
> +		 *                 > 10ns(warm reset)
> +		 *               |<------------>|
> +		 *                ______________
> +		 * phy_reset ____/              \________________
> +		 *                                   ____________
> +		 * ref_clk_en_______________________/
> +		 * Toggle COLD reset aligned with this sequence for i.MX95 PCIe.
> +		 */
> +		regmap_set_bits(imx_pcie->iomuxc_gpr, IMX95_PCIE_RST_CTRL,
> +				IMX95_PCIE_COLD_RST);

Is this really COLD reset? Or CORE reset?

> +		/*
> +		 * To make sure delay enough time, do regmap_read_bypassed
> +		 * before udelay(). Since udelay() might not use MMIO, and cause
> +		 * delay time less than setting value.
> +		 */

This comment could be rephrased:

		/*
		 * Make sure the write to IMX95_PCIE_RST_CTRL is flushed to the
		 * hardware by doing a read. Otherwise, there is no guarantee
		 * that the write has reached the hardware before udelay().
		 */

- Mani

-- 
மணிவண்ணன் சதாசிவம்
