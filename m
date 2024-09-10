Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64C015FA7B
	for <imx@lists.linux.dev>; Tue, 10 Sep 2024 17:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725987675; cv=none; b=C5RMrR5VrGXEnTq8FIJ2Y5YPxRQpGFBzj45SIa/aRi00aHubeIvkmG2/f+v3k3W6TPm9HvqngCzTNilvEqtjnHN/306mkC40uhdgGoVSzQfP+aiznMOF7EA98dSmB1SWxdK+cmjssF4NVwAZ7QS0ltJByxt0Gs4Xt7lR6brJpYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725987675; c=relaxed/simple;
	bh=HIYNvnAdgW89EfSpETD3OtBL5KxgpvDe1ZV5+r8iyVM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LTBtHvzJpvxeUT/ZTgg17cryK04t97CUdP5Z+aUYyBiZoOiVwljAkcu6LFgYdbV8WW4m4Nawddeulc88ZhT0MUY/ewyKhmL9svMBytoX3KfLOpVSvkeqgIXsfbBiS/T+G+LDC3+tGCCbmLYBJlMD/RflnD+5YsBnB441ATW0bnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=h40Zpgxe; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="h40Zpgxe"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-205722ba00cso49817625ad.0
        for <imx@lists.linux.dev>; Tue, 10 Sep 2024 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725987673; x=1726592473; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pBskbk3QBU0YMtrU99WpBguxflCzi8adsZB8njQ7nhU=;
        b=h40ZpgxeSp59IE2KuzqNyQF0WVRCdHHChQgzmPaUqZoWzHWrzXKWJT+vIyT9AZ/Ukk
         QF8TG6kKmUOXJrbG+fJhkbi55Yxk99/us3uP/ipWOUDcIfNSQ8JnWd3tK6H+gpdIbxt2
         MBQnr89l4yWxJbPry3llnWzQ3uxcXzbKN8dQ1cvWHOJhWUE8/Mz/g0SzMCZGVRtiIgld
         obTAt3U8q8w9458w+oiFCrU33KnxHnMnFEFKUO2L7r6lWz4bkJzSqFZRoUVjWPUtkuhs
         U7YGgVQf9CZuohUCmIymSzHEFNxOEDwThh7DGYYKd5FgY/n5qpv1jBNpIikak7jtLiQU
         J4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725987673; x=1726592473;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pBskbk3QBU0YMtrU99WpBguxflCzi8adsZB8njQ7nhU=;
        b=XQoHtF1eg4fmuhPXskPeH7cDxE3nxP3RhvJ5gjG/sVCouzHVQCX2e1yJd/giXYaS3A
         fDb20c9qHvgcULQpCxoyMrMffJSV+vOx390iV2DAhrlKeFDjkM+U7neTfjyQUzyG3OJm
         MJkiGOR1gDUyA2B2iURTXLJf1vA6JMn4xq6UiU8s9BHJRS+vT/srku8TAjek/sXrzM1f
         xIn1U2oaI8tsdpyJgjVJoLVMVt3st98/cBSegnpow3Qfrlyclc5G7QK2mxrJY3yd0E2J
         LeuJDArDb1ZBcfFbGGAvf9eeSlU6xAY+ZvZY6FhhFjnf8m3LXCO/h741prgBAjeUnRnY
         v67A==
X-Forwarded-Encrypted: i=1; AJvYcCWkWtnKJyIyItPCHf6KlxC7qgyJPTLgL9hypWvTvR7pClvWn/7SJhcnvQWORnA7HW7/T8w=@lists.linux.dev
X-Gm-Message-State: AOJu0YyZu8id0pVgWG7g7JRUi0TnR46lEmKhaTPNPLAJwFms44fQ++aJ
	cxSbc1y7FEfHR4sEmCKm3aVbFqYM+cHNqG86KH85YuDdm9OlKuy5hbIpDGvinQ==
X-Google-Smtp-Source: AGHT+IF/raqp+DCJypfwe5V7+Q+7qT8bMOaTzbFGyeYWrZCI1/k/X6tIvkrcWMVdJdlQehGHErlM4Q==
X-Received: by 2002:a17:902:d2c9:b0:207:73f:59f3 with SMTP id d9443c01a7336-2074c681cecmr18549225ad.32.1725987672621;
        Tue, 10 Sep 2024 10:01:12 -0700 (PDT)
Received: from thinkpad ([120.60.128.228])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1f469sm50762155ad.223.2024.09.10.10.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 10:01:12 -0700 (PDT)
Date: Tue, 10 Sep 2024 22:30:52 +0530
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
Message-ID: <20240910170052.qorc7hedfy4oqzgt@thinkpad>
References: <20240904-pci-qcom-gen4-stability-v6-0-ec39f7ae3f62@linaro.org>
 <20240904-pci-qcom-gen4-stability-v6-3-ec39f7ae3f62@linaro.org>
 <ZtgqvXGgp2sWNg5O@hovoldconsulting.com>
 <20240905152742.4llkcjvvu3klmo6j@thinkpad>
 <Ztnb-GauC_8D8N-i@hovoldconsulting.com>
 <20240905173437.hm3hegv5zolaj7gj@thinkpad>
 <Ztql31KXrBQ1I5JV@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Ztql31KXrBQ1I5JV@hovoldconsulting.com>

On Fri, Sep 06, 2024 at 08:49:03AM +0200, Johan Hovold wrote:
> On Thu, Sep 05, 2024 at 11:04:37PM +0530, Manivannan Sadhasivam wrote:
> > On Thu, Sep 05, 2024 at 06:27:36PM +0200, Johan Hovold wrote:
> > > On Thu, Sep 05, 2024 at 08:57:42PM +0530, Manivannan Sadhasivam wrote:
>  
> > > > Perhaps we can just get rid of the Kconfig entry and build it by default for
> > > > both RC and EP drivers? I don't see a value in building it as a separate module.
> > > > And we may also move more common code in the future.
> > > 
> > > It is already built by default for both drivers. I'm not sure what
> > > you're suggesting here.
> > 
> > Right now it is selected by both drivers using a Kconfig symbol. But I'm
> > thinking of building it by default as below:
> > 
> > -obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o
> > -obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o
> > +obj-$(CONFIG_PCIE_QCOM) += pcie-qcom.o pcie-qcom-common.o
> > +obj-$(CONFIG_PCIE_QCOM_EP) += pcie-qcom-ep.o pcie-qcom-common.o
> > 
> > A separate Kconfig symbol is not really needed here as this file contains common
> > code required by both the drivers.
> 
> But the separate Kconfig symbol will only be enabled via either PCI
> driver's option (e.g. can't be enabled on its own).
> 

True. But since the common file is required by both drivers, I thought of just
building it by default. But looking at your below reply, it won't be possible.

> I'm also not sure if the above works if you build one driver as a module
> and the other into the kernel (yes, I still intend to resubmit my patch
> for making the rc driver modular).
> 

Hmm, I thought you dropped that patch ;) Anyway, if that happens, it will be a
problem. I'll keep it as it is.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
