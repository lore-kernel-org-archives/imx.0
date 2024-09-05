Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC9CA19CCE2
	for <imx@lists.linux.dev>; Thu,  5 Sep 2024 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725550079; cv=none; b=FTc1FPLv3z98XOt8ztPq1Xme4qXHwQoKT1NUtdo3HtEl/LQ7tbgxf2l+zwgfQhez61vNx2a8o+9vt9kAmbcrvDuYFGAZUADpvSqUYppYUKs/7JsL6qNRXwP7egx55na7c11r8kzYQY8g+aOwO6M4nLFbQbjMa3o4Q76db/5fa44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725550079; c=relaxed/simple;
	bh=R/mNN8wdhNHSKdTLojDau3fxt+9CA9tFV0gY3K1DreQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cJ8FWSPCBNlRHsvca1WJ5JCkWtAylNwUNjfKSPs0QKqkIWra/o7A8vcUqRx6B+EPavwQnodc1HBt2/4Dgqee9dDi7CZlN/vfZQaTgHCRmI9kBgKRJ8AX7uaGBPpb79EOkB2gmZKuX034aQYYTZWZYesdswuBMf72aRT0y5F2D08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bx4Ln6po; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bx4Ln6po"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7178df70f28so800934b3a.2
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 08:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725550077; x=1726154877; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oglj13jT8NZDdkH940RV6GyfjKTBkDr1yKpmIVrAzrY=;
        b=bx4Ln6pogTEIZCvjn9WmDeEyF+4tOjh7cJWNyVOWfc2fDdRfDj9QeMcwVRVNbbaNWU
         t7htQGztNuFpyVparot99fhoBeV1VThzV14vjzt/IFK0Slmdfx3eCQHLSGe7QqWHIocF
         YuVuW6gyfunL/9AuprPs2G/SSMvogDWCm9yb/hpqkQEUty+bXT8Fo0owZ1FeBopl8GkB
         pOYFoQH1HfV8UrV0jmCksgqH4BIkqzKVXxvxfU+Wlqjh4kcLdk834th66XOXT2H/uqvX
         6a8dhitnmJ0wB4i1oZW+BjLHvkDjKmGOFgs2LXYXHuzo6wDmmXeot0ccWx8j6ou8rPyU
         HqDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550077; x=1726154877;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oglj13jT8NZDdkH940RV6GyfjKTBkDr1yKpmIVrAzrY=;
        b=uWsREX5Ocs5TJ3cW/3jd9ASBHtyQ2Lx7GMjR3a/jkQDKZB4STZsXtAyLzJpaH9QMuw
         25yG+az45zdZqkd5TA0MLitHbTqv9jQJTKvQ+Dw662k44X7Q+tfDnNnyOZiUTevcSf8l
         DJOLaUfXBhCLUTD4TysXOJm9O+gFm/FnB6hZwY6QOu0R8wkcATiCFnwQNHXrOS2tX3IY
         Q3A2ApJVEXn/nh/kpgyYeaEkT9KSjh0EScBSOGkfx8PMG3ZGKJ1lSLtAiIm4lahEAORL
         girQsslTzQ/y814Yw/4qwMR/kECVOozK8nTxkHa+et+/2eWSE8SVhq0RX19Cmtq1gRrV
         FSSA==
X-Forwarded-Encrypted: i=1; AJvYcCXz4jO9RK25RTErrxsMdf1kchTZXBb1GLAqTIQGwFqCgh57o0JkhGcTKDok55sJVZJqy3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxIiyiv4zFBxHpckou/mn/mHPi2mNWulfwHjYtv8sNabOrKkf7N
	OJaWGpB7du0brL5pQ/KFjuhO2Zs8uBvh8vog4BxmeTbnXVlrjo5UVRrrYUpWTg==
X-Google-Smtp-Source: AGHT+IFlXu8G84DVRp5SNbsxFjbfXP/Dw/Xcx3dm3n7P1qn/jaVoagoGhBzzqVVH6hqorkyr3amAiw==
X-Received: by 2002:a05:6a00:4f88:b0:70d:3777:da8b with SMTP id d2e1a72fcca58-717458a9cfamr16603380b3a.25.1725550076860;
        Thu, 05 Sep 2024 08:27:56 -0700 (PDT)
Received: from thinkpad ([120.60.52.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7178c66839dsm1508852b3a.15.2024.09.05.08.27.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:27:56 -0700 (PDT)
Date: Thu, 5 Sep 2024 20:57:42 +0530
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
Message-ID: <20240905152742.4llkcjvvu3klmo6j@thinkpad>
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

[...]

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

Perhaps we can just get rid of the Kconfig entry and build it by default for
both RC and EP drivers? I don't see a value in building it as a separate module.
And we may also move more common code in the future.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
