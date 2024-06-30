Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 445FD154444
	for <imx@lists.linux.dev>; Sun, 30 Jun 2024 16:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719764015; cv=none; b=hM5d2cB2YCsPgwxXsA4mmenZRI9H/BS+IYs4Za0Vtl+1sSQGUi95+/H/tHpyBviqy/mfjSyg140ZNIlfsQVni911SawVv/sw5bGgQTFxFC73Rjqv0Yh/QUURq/e6cIpTT2K7WAuNy4TFcGhFId+rgVL1T1uyFqXTI90PTiAzq0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719764015; c=relaxed/simple;
	bh=8b4X0VJ3g+zSBcJYvF82Zu6Q2u1JUQw1QIF+qvDy3II=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lixRmK2BihGzOX7o2R2kR+YmrZOl9nrCggQLpZ+vifEE1pLXSdJrR0FF1r+FI0/Xk4sSWvqCBzxmY5b5DorOgrGf8rs2WiXYz5reNB6lABbgeuKZ7zhYmLmiT6ANqYK+xAEi5CgZb0ZOrClsUqTfrevljxrXFkd+/GEiZISqNYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=A1RWb+lE; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A1RWb+lE"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-706b53ee183so2173042b3a.1
        for <imx@lists.linux.dev>; Sun, 30 Jun 2024 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719764013; x=1720368813; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fhYNd6YI+Z5WjMzKTVCzzYrVGlFpZjqEpL+94ljYX4w=;
        b=A1RWb+lECtr0kgBXUtIVrocuWMnL7WLNPiDZrSFuROWA0lj8zuthb+cdbJSg0JFipn
         RsCGX+0q72QJYbyOGfkapqBLOPDAfeA1qXdhTGUE31OfVwHG86LJuI9xvYj1++TvG82d
         F2eGvO/3twz5Fz1XxeSX5bAW+wih5B8oo/pPSUgmOE0pEoHJnw5002oKL+ZC2sQtYral
         rj+qsriJ6U7fBF8QaGXaA7Iw2kRGEQuDszU0oYfmoLu5YsueGaixJ9CRqhCFhLT4aL0T
         vSKCXNVC5qIa9uUp9r9AkC89LdFyeyTmxEwF7UC+CdvE6uzXeOWYhPx0pFdEtvOi88Mt
         Erww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719764013; x=1720368813;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fhYNd6YI+Z5WjMzKTVCzzYrVGlFpZjqEpL+94ljYX4w=;
        b=qVLu7nKq+9W6BNZT9/SnNNT2gNsnzxCRy43dJLqonoJsehEe+7auIKigwfX15uWmGj
         O77sKDmPLB/QaoSX5HpTv69rRAJdj6/z8+ed1kRYPg7yFNQsvPTzSElBfltYsWaAz1Tr
         ZbQeumsgRPpLW2v3Sqh7wSIS2IffZqGNsbE+rwpvDxVkUa0v4EftMWu6WiQWuh+Op/KJ
         iVybGz8P1QHBAUgK4EFrQwPe9LnmedgXAhvjoRnFSXMcub4EAsw/MSZ6njP1Gxmc7Evy
         u8upcFJgH7tZoRZmnLxdUs1tTMi+mNnY2/FP+2q+5RvDtI2OHK5SxLw7wCxA1EiQzns6
         rSQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEtMOfb1w72WlkeBmiDhShjl1Su1XghUk6TqTYvjomBiGTKQ1DbuVBO3LaboPkUoW4yuW2cFdI+wjeVdJ2mGyrnAeN
X-Gm-Message-State: AOJu0Yzghw93Sf71IdKYf2DOns0EUtHC/kCL1B5I+8v2k0B8z3aUoJOP
	jzhxRADVCLojEPEsDCAQG+9vCFBeZ4BSkWLiOt91S/eayLCwMhNYShY5t9CELw==
X-Google-Smtp-Source: AGHT+IFBjjMwaBXy0t3lI3KWMbWd86l8kT3eRQj1Z0/ea7k0vDsO6nYMvezqFZjKxlo1m8VkwrYDxA==
X-Received: by 2002:a05:6a20:daa1:b0:1be:6390:33ee with SMTP id adf61e73a8af0-1bef5fcb66cmr5933847637.0.1719764013349;
        Sun, 30 Jun 2024 09:13:33 -0700 (PDT)
Received: from thinkpad ([220.158.156.215])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-708048935c0sm4839644b3a.186.2024.06.30.09.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jun 2024 09:13:32 -0700 (PDT)
Date: Sun, 30 Jun 2024 21:43:25 +0530
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
Subject: Re: [PATCH v6 06/10] PCI: imx6: Improve comment for workaround
 ERR010728
Message-ID: <20240630161325.GC5264@thinkpad>
References: <20240617-pci2_upstream-v6-0-e0821238f997@nxp.com>
 <20240617-pci2_upstream-v6-6-e0821238f997@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240617-pci2_upstream-v6-6-e0821238f997@nxp.com>

On Mon, Jun 17, 2024 at 04:16:42PM -0400, Frank Li wrote:
> Improve comment about workaround ERR010727 by using official errata
> document content.
> 

It is useful to provide a link to the errata document in the commit message.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 6f68bee111029..6e3ac3fc33745 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -715,9 +715,25 @@ static int imx7d_pcie_core_reset(struct imx_pcie *imx_pcie, bool assert)
>  		return 0;
>  
>  	/*
> -	 * Workaround for ERR010728, failure of PCI-e PLL VCO to
> -	 * oscillate, especially when cold. This turns off "Duty-cycle
> -	 * Corrector" and other mysterious undocumented things.
> +	 * Workaround for ERR010728 (IMX7DS_2N09P, Rev. 1.1, 4/2023):
> +	 *
> +	 * PCIe: PLL may fail to lock under corner conditions Initial VCO

Missing full stop after 'conditions'?

- Mani

-- 
மணிவண்ணன் சதாசிவம்
