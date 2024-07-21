Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5A579F6
	for <imx@lists.linux.dev>; Sun, 21 Jul 2024 07:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721547597; cv=none; b=Ull+QiENk+fxyXWefhPp8ELwScSFG+TJsLv/3o5AZQNE3UFT/7mQZ0EOGwxGcLks4LDthXD2eJlh6xocIRoG5ldCx5AWj4cESkKosyIjhkbBXpza/yDAJ2oq0dQNb+ppp/t4IM311qHsO5Ms7MoqKwYmJ+A1VqbSf6WkoBgQFcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721547597; c=relaxed/simple;
	bh=FKPYtsFtam4QQMK01ANM2dJ9eQL9oofZqTRrOT3jXts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iipTVxzmD9dR3l6TWgXcbQHQ3YXe6D1Xo6vd8OKejx9Muz6E+HDrrM5DPnooNbm69IbIPtNQ8G99NCZRXx817QVxo/xrVn3lE0LIPoGM9Mk08UkVCz8dCHf/QdNGyYUnOiU5J5kY3NLF6RZcUzO/OchBID+hZJ75hIiRAkGf+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNWT5jkh; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNWT5jkh"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-664ccd158b0so32493447b3.1
        for <imx@lists.linux.dev>; Sun, 21 Jul 2024 00:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721547594; x=1722152394; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=N02rs0beU0+PCjKU6W+pNs3gEfWqOvtg3yl3XFcbS8U=;
        b=LNWT5jkh2Y1YszqnqCSUBCwhy6aOA3hR2M644Ie+uVwGF22eyOq8SLYD+gc7mt8gSi
         VAc/3yXIzpqI4ZLGUl1OcfHiUdpCjez5g0RdNohrBbluu63J8hHZsnR61O8YpQz6r2KK
         MbJ056DALLn/tdLUoxcMMh9zmsN+wPAcx66bwW5y7+a2NKIDg9jb7M25+Qz7HtT+XM8X
         cNnaRdmbPiMf6KdQDA4QydfBTiRCqivpmQHEgM4fWfSnaqmJPiMj22H+f7Kuroj9yxnc
         74EcZZlcBCI68RGebA3sPSbWwLMeUQcX84dTz69+Wzy+XTHCmH5fKTDpnnf+Yvg0WFgy
         4AeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721547594; x=1722152394;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N02rs0beU0+PCjKU6W+pNs3gEfWqOvtg3yl3XFcbS8U=;
        b=MqepvQWYHWBnGh3AfZor1QpwgPSHYMvEan1epOO6VFfha/tbHwYrL1+FEac0gfjexy
         RJ1lMGAwj3niweJ2CkrzRBH5vVBKjUVxJBwX1XWTp1WE06k4pQsK2gOzTWKNXISs4oXD
         x6Z1GoApB4yX7WToluG+G0u1a2apiVmFLjij7OxvTKxSNy/bJwKlLdc46RUbyjdAFIjD
         PgUR2wS/2wn3poIs2LauuxGd3FqcvzKGAd23CXy8cA0ROA+V2O4C1liMOIeGXVtN7Q5R
         plgzDYtpfYUF3IJ5q2uKU34LsbHcv53SJx/PoVi39Td1BtOhkmaAQbuRGCr4G0BS8d44
         ntlA==
X-Forwarded-Encrypted: i=1; AJvYcCWsHeFcB4N6a70jDiJgP8ge2G/9/0EwZ1AowMNPONovkp7Lq1HcgoUXXNT73gBRB5wt0ItpAusjwFfIH/t2kGvqv0ay
X-Gm-Message-State: AOJu0Ywye5ONHB7OE602n4bNDKmRy9oP3PUpQL+p6F0ATNxOv2EGHaky
	wMWd/E5BbqjaMvWYzfcJ73ZMM3Z8NncHWw84C7fqBdbg+dtZWiDknIRNgif2OQ==
X-Google-Smtp-Source: AGHT+IFQYY74iAGQY5pOOJPCWv5JUZVONiqWh0swcBRClZ6YAaFDgYxDWJLm9Z5K35Wb0bbXsmVAGg==
X-Received: by 2002:a05:690c:4441:b0:665:7184:fcd0 with SMTP id 00721157ae682-66ad8dc0d02mr32319017b3.23.1721547594246;
        Sun, 21 Jul 2024 00:39:54 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d2243d137sm439633b3a.31.2024.07.21.00.39.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 00:39:53 -0700 (PDT)
Date: Sun, 21 Jul 2024 13:09:46 +0530
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
Subject: Re: [PATCH v7 02/10] PCI: imx6: Fix i.MX8MP PCIe EP's occasional
 failure to trigger MSI
Message-ID: <20240721073946.GB1908@thinkpad>
References: <20240708-pci2_upstream-v7-0-ac00b8174f89@nxp.com>
 <20240708-pci2_upstream-v7-2-ac00b8174f89@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708-pci2_upstream-v7-2-ac00b8174f89@nxp.com>

On Mon, Jul 08, 2024 at 01:08:06PM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Correct occasional MSI triggering failures in i.MX8MP PCIe EP by applying
> the correct hardware outbound alignment requirement.
> 
> The i.MX platform has a restriction about outbound address translation. The
> pci-epc-mem uses page_size to manage it. Set the correct page_size for i.MX
> platform to meet the hardware requirement, which is the same as inbound
> address alignment. Align it with epc_features::align.
> 
> Fixes: 1bd0d43dcf3b ("PCI: imx6: Clean up addr_space retrieval code")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

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
