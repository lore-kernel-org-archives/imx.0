Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35F4045C0C
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 09:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714209796; cv=none; b=kNPDh4L2iNZVLNyy0tMLHpmpYVbnhq4cpHcIU4KpgXjT6zOAeMvnBOTpnmKaCvDfVsh+JsthBlxVDwhYPCs6G9k2BlbbWmIuziiHlVhOMAL1r5TfkulouhWrM4eu/yf+Y98Sk14xbnNbUmAY1tlFWj8V0trHC6fJ17n2SB9GMpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714209796; c=relaxed/simple;
	bh=ul1FhTW7c8B0pI49fHW4jc0yMuX5lzfvSpesH5uhEZs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q6gG2iohVff/iSZEYmnQYqzjJmCFvLVKDYkPsi5IwyUCRTIf6MJ2VvNH/Etxh8DW7DrxigxKAcRZycFoHrW4riL/SWZ9WNI3AqcCXjRb+Am7SLE37O+i39O5EdA9nZWDEb0Oxs+N1PkgMBNznPayu/5aUlYQAGOQYgoHysUyg8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KpHHXBli; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KpHHXBli"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e2b1cd446fso24338235ad.3
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714209793; x=1714814593; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1uIcEMzayP/6fZPxv4DuexUPxwxg9JGcxelfjHeE1sI=;
        b=KpHHXBlijo+j9Ds8/t2mgc23GLlGAJj1FTFQMtAFKjYZ270eN7vqMdpHdK1/HpwVEg
         U6/EUvj/6oRlnwHoEms1NtdQ64bFqmL5iOMKtAhjCzQpRjKQYfdFKQxmFqT5Fw4ypieO
         m46/NqGnvqGMcNGGSkqIj+Cc8TbhiXYumWXcqn+Q5beY4vw6Q4PM94/PbDR7VplT/8fz
         eJ4MNdAF3XhUPX8om5tF6HO+yzfKo+jQ/0mGXVCNYQ0fzrrDqrY3O0FXQKfCVulD7xIb
         6XixooFy887wxWjOvo3sNMZ/JcABHqiSXBFM1pfvvejyHLamO6G92keC67ir2lC1mydZ
         EcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714209793; x=1714814593;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uIcEMzayP/6fZPxv4DuexUPxwxg9JGcxelfjHeE1sI=;
        b=MFEyR685fXUmbwIirb9iGe8tKKZ2+GdlMR8nGxzX29ZQay53q0T7bdpcaGZ043+sQn
         AJzIHRy8XQkuhcXYJBk16bkkZxWNjrvaSO+p54HlNVPWKHOVPmKqsvEnKddPZeJIN/Lz
         HJObVb2vIrmxH0Kwj/WuFjSUYYvJa7GFwqHF59hg5Ie2S2TmF0KB5jdMaeTPJlLxnVXA
         Mwltq1wfsgf3wfzf5H8vrVSYDm04zo7o9HxnvxlYz2xcBpvGkjDHlDwfqzqHutkkJWoZ
         U8I8bfoYS1naE1kzkyr/vICDDnaRHBvsou20H0IyPnE96UO2FXGcFEroGRb5Cz9dux9Q
         llUg==
X-Forwarded-Encrypted: i=1; AJvYcCX+zpgTaeXIv8g13/fI/qE2K+UVU1GSa6IoEHhiaiv3k0dvbUSOKM7NMLoG1PLkII6+L/NnjM40eWs9c2A+4FGa/73H
X-Gm-Message-State: AOJu0Ywdjlj6ikt6J1rT8hIdyQNcpDop0Xw6zVgrD0YOFjIXhI0Qo+et
	KSEoeAWUFuJJNaYyQz5bUqVjvhMD9ZwFlzEifRZPrXW8DSyKPqaIoY4jhychgQ==
X-Google-Smtp-Source: AGHT+IHI9b4GXVPRNRKKViZzgQgyiBNt6NE3ezIewkxreKd8/BhI/Anp1b4JbkcwgsxxnXj43VBHCg==
X-Received: by 2002:a17:903:2445:b0:1eb:538e:6c6e with SMTP id l5-20020a170903244500b001eb538e6c6emr1443898pls.33.1714209793362;
        Sat, 27 Apr 2024 02:23:13 -0700 (PDT)
Received: from thinkpad ([117.213.97.210])
        by smtp.gmail.com with ESMTPSA id n6-20020a170903110600b001e668c1060bsm16712930plh.122.2024.04.27.02.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 02:23:12 -0700 (PDT)
Date: Sat, 27 Apr 2024 14:53:03 +0530
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
Subject: Re: [PATCH v3 02/11] PCI: imx6: Fix i.MX8MP PCIe EP can not trigger
 MSI
Message-ID: <20240427092303.GG1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-2-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-2-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:38AM -0400, Frank Li wrote:
> From: Richard Zhu <hongxing.zhu@nxp.com>
> 
> Fix i.MX8MP PCIe EP can't trigger MSI issue.
> There is one 64Kbytes minimal requirement on i.MX8M PCIe outbound
> region configuration.
> 
> EP uses Bar0 to set the outboud region to configure the MSI setting.

I don't understand this statement. How EP can use BAR0 for MSI? MSIs are
triggered using outbound window memory while BARs are mapped as inbound.

- Mani

> Set the page_size to "epc_features->align" to meet the requirement,
> let the MSI can be triggered successfully.
> 
> Fixes: 1bd0d43dcf3b ("PCI: imx6: Clean up addr_space retrieval code")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index e43eda6b33ca7..6c4d25b92225e 100644
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
