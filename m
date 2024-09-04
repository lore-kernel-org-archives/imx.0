Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC51E1A14
	for <imx@lists.linux.dev>; Wed,  4 Sep 2024 15:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725465164; cv=none; b=HP8K31gE+UCkU1f6ipdwmG9TzwTZWHXAGOh37p8J7TjG9nsJlFHfWuHLY1gnh/WkAgVqfyrTO76USywzmRYnriUr2eQpVKM4TKSzsD4Rpa/k4vzTP+Bymu4F3eX9Jk106z5Orr9uUAnsTG4ex+/6X9uLx7M0fVC1p2acXWeOT5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725465164; c=relaxed/simple;
	bh=KygQNf3+cuF9gbs3HDkBg3xT8j1Jn6935u8ekoom8lI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KZN0PFW1kcFazHQKf/Dv2yd1XmusbdqwsYIEkCVKg8SiCtx0Rh9aTbKjm6Sw3RHo49CvsY7qHlddo8g6XdV9BPaIg9bQE0/And7P0ud3sDZPtYwuUhr7vJAqdx9Hz4j3I5mcqoM7XCjkF8x2R2XTuHH00aacwivhO22gABNmy6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kQ5oGhba; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kQ5oGhba"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2055a3f80a4so27219025ad.2
        for <imx@lists.linux.dev>; Wed, 04 Sep 2024 08:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725465161; x=1726069961; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OI8jsgdgqnkbWWLEKVkCt2Ik5LT6LWIsO1U3amJG1/s=;
        b=kQ5oGhbaVhOxu3PDqEkLDsloMPnP2gX+oZFj75mLDBEZg/i9LAivLSAdjS+/5AD21o
         +ozCPyldNBjk5mzjVJ2zvt+O3ylizXMNmmsDzssnkdUdCE37I4tfST7UvdkMKIERyk2D
         Pa5iCD6B7e2DPYEGqP2tbM/Yh9io42idu/vejpphN6Ma7V9xbq73gK0h7ErzSZ8BvaX6
         4KPlILZL4EUm9PfMcmAUGmUccNuYUFm9E9izrBilY1fqAR19G+oqCfTzideBm3kl0a6k
         HsFyTvALtaTvNkvPSUiD5/z+sxsSTG3rDZYZADwY6mhvihyDP1Xd4CSW2cAoA+izfg6G
         pXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725465161; x=1726069961;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OI8jsgdgqnkbWWLEKVkCt2Ik5LT6LWIsO1U3amJG1/s=;
        b=M1yZM7W6KH2YYJgd9mQQyJq3aSjCxEibrbGWTji0x1sRNEB57ygQlqMFYZ8P12dTux
         8YM2lbxxlrrlIsRrcVwc0MImDNMiFcv6BptwCnUSzb3JNnCvpIlLyi+YLNO09Kn2u9I4
         VYFazkFE/FgcrAlHjAu8JMfcEETuNiR2eqXn5hCsV9IcHbNOEJ+gT21QHjJRVVMJqR/y
         CsZMnzCktMw13BGkIxd2M48efmoFgYNFpqUm5Li6eZuNBijpyvyj4ODCDAivb1fZVyXr
         KYBvHeoBGw2xIc/c3//T537DO7VQt1b3pvD4GDz+Nx9urOxl0SGXp1IHoAW6Zt0nA9JC
         vOFw==
X-Forwarded-Encrypted: i=1; AJvYcCXgLhdT4gTVAhIvcZLQP/zDwdewOHGTwHWcvXGyKwJnYxuZBHQo0hQvXQwVU16VZjhwnyQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwrXg+8pz6Ybf4WhauUq1Oizd6wM/4mLpC52CK5AuNWwfv6UT80
	Q1i/w7a2UzIcgrG2ayEoXzeI78onwVrAFBgVSEALVuHztoLYGJc5hHlqcN/I7Q==
X-Google-Smtp-Source: AGHT+IHGBNBoglCNHpz+D7sGeP/HKxiS/0D+eictU65nCi8V3pgHa+1MnnTJSobiRrpdR96hXD+x3Q==
X-Received: by 2002:a17:902:da81:b0:206:8db4:481b with SMTP id d9443c01a7336-2068db45e50mr102338205ad.32.1725465161425;
        Wed, 04 Sep 2024 08:52:41 -0700 (PDT)
Received: from thinkpad ([120.60.128.165])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea37ae2sm15212725ad.173.2024.09.04.08.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Sep 2024 08:52:41 -0700 (PDT)
Date: Wed, 4 Sep 2024 21:22:33 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	abel.vesa@linaro.org, johan+linaro@kernel.org
Subject: Re: [PATCH v6 3/4] PCI: qcom: Add equalization settings for 16.0 GT/s
Message-ID: <20240904155233.zm3m6x3wvco35g6t@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>

On Wed, Sep 04, 2024 at 11:39:09AM +0200, Johan Hovold wrote:
> On Wed, Sep 04, 2024 at 12:41:59PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > 
> > During high data transmission rates such as 16.0 GT/s, there is an
> > increased risk of signal loss due to poor channel quality and interference.
> > This can impact receiver's ability to capture signals accurately. Hence,
> > signal compensation is achieved through appropriate lane equalization
> > settings at both transmitter and receiver. This will result in increased
> > PCIe signal strength.
> > 
> > Signed-off-by: Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
> > Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > [mani: dropped the code refactoring and minor changes]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  
> > +#define GEN3_EQ_CONTROL_OFF			0x8a8
> 
> Nit: uppercase hex since that's what is used for the other offsets
> 
> > +#define GEN3_EQ_CONTROL_OFF_FB_MODE		GENMASK(3, 0)
> > +#define GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE	BIT(4)
> > +#define GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC	GENMASK(23, 8)
> > +#define GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL	BIT(24)
> > +
> > +#define GEN3_EQ_FB_MODE_DIR_CHANGE_OFF          0x8ac
> 
> Nit: odd indentation uses spaces, uppercase
> 
> > +#define GEN3_EQ_FMDC_T_MIN_PHASE23		GENMASK(4, 0)
> > +#define GEN3_EQ_FMDC_N_EVALS			GENMASK(9, 5)
> > +#define GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA	GENMASK(13, 10)
> > +#define GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA	GENMASK(17, 14)
> > +
> >  #define PCIE_PORT_MULTI_LANE_CTRL	0x8C0
> >  #define PORT_MLTI_UPCFG_SUPPORT		BIT(7)
> >  
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.c b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > new file mode 100644
> > index 000000000000..dc7d93db9dc5
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.c
> > @@ -0,0 +1,45 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include <linux/pci.h>
> > +
> > +#include "pcie-designware.h"
> > +#include "pcie-qcom-common.h"
> > +
> > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci)
> > +{
> > +	u32 reg;
> > +
> > +	/*
> > +	 * GEN3_RELATED_OFF register is repurposed to apply equalization
> > +	 * settings at various data transmission rates through registers namely
> > +	 * GEN3_EQ_*. RATE_SHADOW_SEL bit field of GEN3_RELATED_OFF determines
> > +	 * data rate for which this equalization settings are applied.
> 
> *The* RATE_SHADOW_SEL bit field
> 
> *the* data rate
> 
> s/this/these/
> 
> > +	 */
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_RELATED_OFF);
> > +	reg &= ~GEN3_RELATED_OFF_GEN3_ZRXDC_NONCOMPL;
> > +	reg &= ~GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK;
> > +	reg |= FIELD_PREP(GEN3_RELATED_OFF_RATE_SHADOW_SEL_MASK, 0x1);
> 
> How does 0x1 map to gen4/16 GT?
> 

I need inputs from Shashank here as I don't know the answer.

- Mani

> > +	dw_pcie_writel_dbi(pci, GEN3_RELATED_OFF, reg);
> > +
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF);
> > +	reg &= ~(GEN3_EQ_FMDC_T_MIN_PHASE23 |
> > +		GEN3_EQ_FMDC_N_EVALS |
> > +		GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA |
> > +		GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA);
> > +	reg |= FIELD_PREP(GEN3_EQ_FMDC_T_MIN_PHASE23, 0x1) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_N_EVALS, 0xd) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_MAX_PRE_CUSROR_DELTA, 0x5) |
> > +		FIELD_PREP(GEN3_EQ_FMDC_MAX_POST_CUSROR_DELTA, 0x5);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_FB_MODE_DIR_CHANGE_OFF, reg);
> > +
> > +	reg = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
> > +	reg &= ~(GEN3_EQ_CONTROL_OFF_FB_MODE |
> > +		GEN3_EQ_CONTROL_OFF_PHASE23_EXIT_MODE |
> > +		GEN3_EQ_CONTROL_OFF_FOM_INC_INITIAL_EVAL |
> > +		GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
> > +	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, reg);
> > +}
> > +EXPORT_SYMBOL_GPL(qcom_pcie_common_set_16gt_eq_settings);
> > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.h b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > new file mode 100644
> > index 000000000000..259e04b7bdf9
> > --- /dev/null
> > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > @@ -0,0 +1,8 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +
> > +#include "pcie-designware.h"
> 
> You only need a forward declaration:
> 
> 	struct dw_pcie;
> 
> > +
> > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci);
> 
> Compile guard still missing.
> 
> Johan

-- 
மணிவண்ணன் சதாசிவம்
