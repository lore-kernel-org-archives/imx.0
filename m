Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B33B1A0702
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 17:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725557699; cv=none; b=ogM6It1ovcs1MU6+lEmnEqfqok2fxsAKn0xA0F6/R2mO2i2wvdWQ4g7tpLJ1bpTpORC9wmY1C3CLM5rU6GnqPQUVTGBPaPxyKzxmg5M9gr79drtWUFW8tRzVPRfgWVMFJwSBDy0ZUSsqMZdxQezPSqXMY1mKQsFmStH3W7dGk9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725557699; c=relaxed/simple;
	bh=MI2LRc6AktxdTOVKQGnfpzkt/G3bqZJj+90kchL1ybM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zqm+z4MiTlM+ZA4BExb20RdgIacuryofQ7VYG4fxCx/INkNk1heoY7a6aAREYHCrYhGnnyf7/O1Deglq5Ys2lySIqlmBIJU8ckmRZ9/U0zRgUKI6kImE3r/PtsXZdPrhGmK1h00nr4+rvGDc1Q7pzZcSfE6YweojzJtjX3H4MjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=S68v/8wv; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="S68v/8wv"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2021c08b95cso18151315ad.0
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 10:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725557697; x=1726162497; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eIgzal7ITyKn4Uu6UhwVaplHaAv3wUp9Qsoun/N+n+c=;
        b=S68v/8wveTVrYO0DEz6S+WNLXZO1fogoeb/kx+SEZUQb+S/1PQBKnjnm7DTdkePENV
         DsTX3oGzPQDX0oxBOchli6Dj9P5qq4Bvdw7iwRtSLPyxgdrgXHkkwLv2FS3+TtgHynFm
         h8z4bNpBWWJnPN5HU5xDZ3lSXrwbs4qQmi7046ueZYphWVxtAaBPe3qcgFkIBBbiMtaI
         m5GBekWqU6LdTUQrcSYgQeXp0HqV5bsjfxuWesgJ9skI/ZyUgmrgDAZhrylTsPrOss7c
         ao8FvEYhRzorsD4HXfvApjBT9j1CHENTRw8piEEpBZDw/1sSZTwQ6iXzKSCJyC/2AfzB
         SpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725557697; x=1726162497;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eIgzal7ITyKn4Uu6UhwVaplHaAv3wUp9Qsoun/N+n+c=;
        b=HTHVvN2j4aKt9Rw1FyTeVrtBEyPwvzzm3saivLup3aJSlyG4gIK60tmikTxd8/Lhr6
         SnArU57chXEfaRVKEEP3LcO1ZiUjc7W0yRkeTel0wWCjAiSCgpKix+WPFAx17Z8ltWQR
         5xbUo7w3UtfWS9CD2GIYk7d6/MO9VvRer/Mq0xcOiWTuyihbTOmXcWOEmH5AJh5uQ5XR
         JSNc+UY5VmpnZ3Lm+/VxOsiS5Tgy41tBX2SPt8oOPpJqfGxhfuzPACEFJ/DZFCH/zsZQ
         KRNuuXsW5xt5y8SZy7y6sWzbJu+hEpv53BA2uIJWMop4Elz1yNgpU0y1Jecb5SC6SjDE
         3Wkw==
X-Forwarded-Encrypted: i=1; AJvYcCUTdYbzDQHjSPH91Ex+UzkDladoOd5RBDOEX7+K8mrRrzlfW9kBxlIgPIIrYeUUi4vZxTM=@lists.linux.dev
X-Gm-Message-State: AOJu0YyfcX1oj6TD8fOT2UjUe1l9tB0f8tqfPb5R5fBMzCvW1IPxIMlD
	f3PjRP3EZ0myAhATKS2AUaEokFZOp4TQjXC9/JnGscDgb5lk0ucoB/+Y6sA+8Fk6gKCkFL3YEbk
	=
X-Google-Smtp-Source: AGHT+IElFJh9mBN0d10CvX+yxAjA8cHTDsSZBmgENNb/EtffZEORF9F48GUK1FqLfVaqnR4xQfoX8Q==
X-Received: by 2002:a17:902:ea0a:b0:205:3475:63be with SMTP id d9443c01a7336-206eeb8c61amr497735ad.25.1725557696776;
        Thu, 05 Sep 2024 10:34:56 -0700 (PDT)
Received: from thinkpad ([120.60.52.248])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-206aea69770sm30809955ad.277.2024.09.05.10.34.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 10:34:56 -0700 (PDT)
Date: Thu, 5 Sep 2024 23:04:37 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Johan Hovold <johan@kernel.org>
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
	abel.vesa@linaro.org, johan+linaro@kernel.org,
	Shashank Babu Chinta Venkata <quic_schintav@quicinc.com>
Subject: Re: [PATCH v6 3/4] PCI: qcom: Add equalization settings for 16.0 GT/s
Message-ID: <20240905173437.hm3hegv5zolaj7gj@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
 <20240905152742.4llkcjvvu3klmo6j@thinkpad>
 <Ztnb-GauC_8D8N-i@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztnb-GauC_8D8N-i@hovoldconsulting.com>

On Thu, Sep 05, 2024 at 06:27:36PM +0200, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 08:57:42PM +0530, Manivannan Sadhasivam wrote:
> > On Wed, Sep 04, 2024 at 11:39:09AM +0200, Johan Hovold wrote:
> 
> > > > diff --git a/drivers/pci/controller/dwc/pcie-qcom-common.h b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > > > new file mode 100644
> > > > index 000000000000..259e04b7bdf9
> > > > --- /dev/null
> > > > +++ b/drivers/pci/controller/dwc/pcie-qcom-common.h
> > > > @@ -0,0 +1,8 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 */
> > > > +/*
> > > > + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
> > > > + */
> > > > +
> > > > +#include "pcie-designware.h"
> > > 
> > > You only need a forward declaration:
> > > 
> > > 	struct dw_pcie;
> > > 
> > > > +
> > > > +void qcom_pcie_common_set_16gt_eq_settings(struct dw_pcie *pci);
> > > 
> > > Compile guard still missing.
> 
> Sorry, I meant to say *include* guard here.
>

Okay. I got confused initially.
  
> > Perhaps we can just get rid of the Kconfig entry and build it by default for
> > both RC and EP drivers? I don't see a value in building it as a separate module.
> > And we may also move more common code in the future.
> 
> It is already built by default for both drivers. I'm not sure what
> you're suggesting here.
> 

Right now it is selected by both drivers using a Kconfig symbol. But I'm
thinking of building it by default as below:

-obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
-obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o
+obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o pcie-qcom-common.o
+obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o pcie-qcom-common.o

A separate Kconfig symbol is not really needed here as this file contains common
code required by both the drivers.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
