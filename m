Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DCD4C610
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 11:38:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714217909; cv=none; b=eiEatAaF5lcUx8kUNdzVgUVlar6wiCb6L9U2Ik+A94r1/qKxMpRmPhLerZDeRHL+S3EXnQ312EyZCeqL0/RB3HziKk6pV1IWiUQ8BbcdlWZUZKFjbrcQF7IzQu6XkUIMUNxoKoiRdrypswK03HAkCCtj/cK/MyR7DUapzGxuTGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714217909; c=relaxed/simple;
	bh=p8O2sAM2IxpLXYnB4aXc6lDvtD3kwwkCCZ0i/MQiGKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F8FMMd3jJlGhO1Jz2Fo5S2SrSYiqnuv2OK3GAFYaOjWT6O48HCNJhfDfsBWuThhaZXaXcFa/F1t/HFafwVVG9NdqLRrM9xl8n9M3hu5Bmi6taHGCaAPd7dgmcS+Mi3PWUPJaVab8qJgFLodhy0dSin3hoFrXrnivZTPDjauF+fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=l/7HHxFK; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l/7HHxFK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so2180687a91.0
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 04:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714217908; x=1714822708; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Np//FY4PRW7HBHaV5Y9xc/c4l4DQaCwD4Awtz2s21Ww=;
        b=l/7HHxFKP2YJAdPbfDKQuHctu9IMshEQpIMD1XHPPaarQ1ermps1PlwZN5M0DnrLbr
         OG7DXzn+HBNTP9X53AhXGKFeTggxJpHdmdiGs15KDeY0oRTGJmPM2xLP18S/+aiw7rnb
         GkKFuBo5IsKEx64O5EbZo70LAMsQ2/Uyl6TdDWRy7rR8uiwN2znfPaFA6VFWS/1JpxYg
         dEIK4LnvPr+4ny5YMHbG6QZlQQTIfBZKV5EowOHypRJTkdLrpBYIkXM/iX/f2Tsh6TvU
         hSiK5BpEz1Kjmcm0dHdGKMeWJxL/AkwRSLDa4rv8Po+YbVtNHY4gzEQ/QhghVEXITBGu
         q0vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714217908; x=1714822708;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Np//FY4PRW7HBHaV5Y9xc/c4l4DQaCwD4Awtz2s21Ww=;
        b=W61h2wULBfC9k5Lte/WOkjbJ8uWcOyHJii0u9H1p/Wxs7U+jEYhKyH5LI4BVfvJpFR
         k/cyhuWd/CSkYWS0nm5p9ZphRhxn2XwsQPKPb2cy7KsZ3TQrvkdc8dHuxJ28RQvsPkiH
         4YKV6gBBLuBGDKP27vkmTROUVSFnipa6upSAb5lg1CaxwTjBD0cL0lzNqiAoQKhFz/hJ
         SfHeOXpJjHZ/4oZHgtbuw2ExyGxYrxSkVkUa/46PDuL3wVIcdaU1Jo5oONTPMeKzEr1F
         wai/Dd3sbUAoesCYdcCliTt7lASrxE2o2t3F/0NNFy9I9EFN6mS0bXug7wi/5VIRw42H
         kCew==
X-Forwarded-Encrypted: i=1; AJvYcCU2J9hITAkcQOaOJPVqJAQUY/a7LSHL31WyVsK6w01jh7cnyCTATyHYJrdr+NubXo79pgY8gbTbv15bt25dg4Y9xLjq
X-Gm-Message-State: AOJu0Yy5j0oEcPD9uvz/MXojLOKOFB3WxRAVEgVMYV5Nf02mKUpqd6t1
	/fcFwjqi8f5YNbfLG2qpYV9E+NcA8Trrv5UYl/CUGMP8G9QdNFWChUjMOFe9SQ==
X-Google-Smtp-Source: AGHT+IEF55H/1kS+Cfrgsn1sJ6Q8f7kM2jkzMm6mfROP3v0+pv0LxPc83s4Ah40q/gygS+pPW4uANg==
X-Received: by 2002:a17:90a:c687:b0:2b0:763b:370e with SMTP id n7-20020a17090ac68700b002b0763b370emr3311655pjt.18.1714217907747;
        Sat, 27 Apr 2024 04:38:27 -0700 (PDT)
Received: from thinkpad ([117.213.97.210])
        by smtp.gmail.com with ESMTPSA id s11-20020a17090ae68b00b002adb62b633bsm10608534pjy.43.2024.04.27.04.38.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 04:38:27 -0700 (PDT)
Date: Sat, 27 Apr 2024 17:08:17 +0530
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
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 09/11] PCI: imx: Consolidate redundant if-checks
Message-ID: <20240427113817.GN1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-9-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-9-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:45AM -0400, Frank Li wrote:
> Consolidated redundant if-checks pertaining to imx_pcie->phy. Instead of
> two separate checks, merged them into one to improve code readability.
> 
> if (imx_pcie->phy) {
> 	... code 1
> }
> 
> if (imx_pcie->phy) {
> 	... code 2
> }
> 
> Merge into one if block.
> 
> if (imx_pcie->phy) {
> 	... code 1
> 	... code 2
> }
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-imx.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-imx.c b/drivers/pci/controller/dwc/pcie-imx.c
> index 653d8e8ee1abc..378808262d16b 100644
> --- a/drivers/pci/controller/dwc/pcie-imx.c
> +++ b/drivers/pci/controller/dwc/pcie-imx.c
> @@ -1103,9 +1103,7 @@ static int imx_pcie_host_init(struct dw_pcie_rp *pp)
>  			dev_err(dev, "pcie PHY power up failed\n");
>  			goto err_clk_disable;
>  		}
> -	}
>  
> -	if (imx_pcie->phy) {
>  		ret = phy_power_on(imx_pcie->phy);
>  		if (ret) {
>  			dev_err(dev, "waiting for PHY ready timeout!\n");
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
