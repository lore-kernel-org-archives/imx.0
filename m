Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08D1D8BE5
	for <imx@lists.linux.dev>; Sun, 21 Jul 2024 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721548646; cv=none; b=XyR8j05a6d0OuZ4QSlE83tgljpU+v0s74RSRYZ0UxeOII+c9PnweX4hAuxXSGoI/uWj0P/nXfkuVmn/+G/coeV26SLLccJYd9IwsBSA820IoSuLXqLRIK1psmwcc2G/qq18rNLC/b8ORZa4clPQ5BCfayGNl3oNaxbkCVTf/zdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721548646; c=relaxed/simple;
	bh=s69hgVRKMH7JDZd2qOJja1UzLIOGXfsO9ijXxL17Huk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nTn+vSxuLQ0V1xfOMnQOVHhbu2C5LU5uqKy9N6WbOGfSFu9QU9l0a+Dlw18q220d1tFDnHxD9ZSB6FkPrjc1KsQ1zSbrE1WFgqOnaH6EUH6DwUehKbKKYOuSHjQLvxavLGXp8kgZlSPgxeSN9JGUB9JECW/ZqagpBWcCD53T/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dnwN60fH; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dnwN60fH"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc52394c92so27802255ad.1
        for <imx@lists.linux.dev>; Sun, 21 Jul 2024 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721548644; x=1722153444; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hyQz2Ns66mgvWpxSfqn/FqrN5K/JDuDi/DmSKkr9CpA=;
        b=dnwN60fHEVIekg5MqRGcCafFqk6/ZRnCj4RrrSDH4Dw3iaQ0CjdKk360zStezWDVyv
         mGvcfGGxjwlt0iSLbO2VHkcmIdmVrZWixINvcwnvn1FNGQ7mSdW5EvygxxZIqBCJcwY5
         T6LEtD8UAIz3M1uwIkapCKDBJn3Pnbm9/0+EvnPIk4I1gyFXtZl774vsvQBO4kTaQyO2
         MECCwLVcjet083T0wtPNYYxjpjfVUOeBNttqyR0HqJ6Ik6z31RTAufoeDZMh728NWCDW
         qpBNkdp2ymlrTh3rlAq+7eYavxCD2K1FArbjwTppmD5/pZzycc+0/AJApDIZ06QcfmCK
         D5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721548644; x=1722153444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hyQz2Ns66mgvWpxSfqn/FqrN5K/JDuDi/DmSKkr9CpA=;
        b=KJWShOkIPuf9Cn0w4iAbxmtKDxQWKtQVADfKQhAGGnnxqHyt8EA2V8cdnuwZhH11LJ
         tr7LfWyCymYi9n+Vu2eWX6xAIlPQmuF1k2dD7/1ItLO2c4dhsGew7EsbV/TKu+phJlKn
         Ev/lssZV6sNYRy1uWMPETpR4khwAclmN4sTDIi6afcEjLIg9f6YB8jy4Y6tGA4SHxyC7
         E2BLEyCfIMOgRMO//AvQOInXd4r6VuZHdr0B8muSw3Jr3sExF2T53Y03Fqgex4QTuiMl
         jvrOPDGuv0Nj8H+przN/3f9vfkgTGKkzoOb1YM/IBOECI60qbid/K3q7kLtklsWAQv6V
         xvqA==
X-Forwarded-Encrypted: i=1; AJvYcCVaEMr4sYVuaPJD3AOH0+avrHPSF3Y7shVLZMhAqDz3Hxw2bj6/PuoGEI9o8BW9V0rOMNglk8syh9V1ZmlaHGYeneaJ
X-Gm-Message-State: AOJu0Yx4Ttep6CTfQPCvF535DMuctiA8T669Yrug0NuVJL4pvmUg5A7A
	Va9feFWZCMBoI3Nrf1yxgxsQjmtX05mFhrOrOHEbkyO/v0p+9VaBNwvzgPAHIQ==
X-Google-Smtp-Source: AGHT+IERUkgk9IVWEdkvqOOdRMakPjOZKnaunfxav2UdDTQ2WsxGK8Rz6HmUXynq1p6YcDsh3CF0RA==
X-Received: by 2002:a17:902:d50e:b0:1fb:59e6:b0e1 with SMTP id d9443c01a7336-1fd7457e63cmr41518775ad.32.1721548644189;
        Sun, 21 Jul 2024 00:57:24 -0700 (PDT)
Received: from thinkpad ([120.56.206.118])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f2a4801sm32369595ad.113.2024.07.21.00.57.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 00:57:23 -0700 (PDT)
Date: Sun, 21 Jul 2024 13:27:17 +0530
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
Subject: Re: [PATCH v7 06/10] PCI: imx6: Improve comment for workaround
 ERR010728
Message-ID: <20240721075717.GD1908@thinkpad>
References: <20240708-pci2_upstream-v7-0-ac00b8174f89@nxp.com>
 <20240708-pci2_upstream-v7-6-ac00b8174f89@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240708-pci2_upstream-v7-6-ac00b8174f89@nxp.com>

On Mon, Jul 08, 2024 at 01:08:10PM -0400, Frank Li wrote:
> Improve comment about workaround ERR010728 by using official errata
> document content(https://www.nxp.com/webapp/Download?colCode=IMX7DS_2N09P).
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 23 ++++++++++++++++++++---
>  1 file changed, 20 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 2c60858b74a09..2b95c41f8907e 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -714,9 +714,26 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  		return 0;
>  
>  	/*
> -	 * Workaround for ERR010728, failure of PCI-e PLL VCO to
> -	 * oscillate, especially when cold. This turns off "Duty-cycle
> -	 * Corrector" and other mysterious undocumented things.
> +	 * Workaround for ERR010728 (IMX7DS_2N09P, Rev. 1.1, 4/2023):
> +	 *
> +	 * PCIe: PLL may fail to lock under corner conditions.
> +	 *
> +	 * Initial VCO oscillation may fail under corner conditions such as
> +	 * cold temperature which will cause the PCIe PLL fail to lock in the
> +	 * initialization phase.
> +	 *
> +	 * The Duty-cycle Corrector calibration must be disabled.
> +	 *
> +	 * 1. De-assert the G_RST signal by clearing
> +	 *    SRC_PCIEPHY_RCR[PCIEPHY_G_RST].
> +	 * 2. De-assert DCC_FB_EN by writing data “0x29” to the register
> +	 *    address 0x306d0014 (PCIE_PHY_CMN_REG4).
> +	 * 3. Assert RX_EQS, RX_EQ_SEL by writing data “0x48” to the register
> +	 *    address 0x306d0090 (PCIE_PHY_CMN_REG24).
> +	 * 4. Assert ATT_MODE by writing data “0xbc” to the register
> +	 *    address 0x306d0098 (PCIE_PHY_CMN_REG26).
> +	 * 5. De-assert the CMN_RST signal by clearing register bit
> +	 *    SRC_PCIEPHY_RCR[PCIEPHY_BTN]
>  	 */
>  
>  	if (likely(imx_pcie->phy_base)) {
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
