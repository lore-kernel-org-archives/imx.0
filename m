Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DD9126C1D
	for <imx@lists.linux.dev>; Sat, 12 Oct 2024 04:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728706404; cv=none; b=DGkDZp+vhrCM0f+EXYZdkZ8J/ogvcygOZ4vDa6hWtpk+kEJd/8n88AhPPtOkakk2aNeyoqKnJXlALsmxxTwNbIivi/RIrNXO9lYW5q0s1Kw2Y+MD2dWQRaR3Bl7zDlth+rSSWvwPWnSuGUfkYCVfqx/QgdHkB3kmS9bNNQIZ5zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728706404; c=relaxed/simple;
	bh=Cjqq2VsIvnOWJtSBSmaGd8a62UyC2iakIp8Y/CTbhIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+EDQ7owyIi5Z91DE8iNJw3wObsbyQXPcNVCo0ps3xPXSwmO5NHVqXxfUGeab7RTm6X934DesdjLjPS+DDJBoX2qeCyHlTAKZOiqFAXASu226qR2my4xK8tMkXQyeqsl8zRbosqBqDmyPaiBrhReGur6nskSFGc/b3nazeY2ivA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EVD0URSF; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EVD0URSF"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-20c803787abso18211655ad.0
        for <imx@lists.linux.dev>; Fri, 11 Oct 2024 21:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728706402; x=1729311202; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vB16VpCDewcAwoYN49nbK+yIU/0PlYPRJKRICrTJZE8=;
        b=EVD0URSF9CPyKLiVuGYUTKE7NfRVNKAoW6fLAZ+pSy1uitE1pL9yekimwRMHJrFx25
         Z3PbjFCEgVMHMe+G1bw2fBmKbpaNID/WdGUEcf3iupK/QCioZorb47OK0TaWe4MLtpCm
         RRkCLWMw/1mkloFLohmSGojP+CJcXC3UVxQbJLtdqeniG9blEFmKrxMCyffMchP59AXI
         embqUY+kdxgchExTPENKg5abXQI6O934YFdBa0XNakD+qPTTW7zC1TmoQdnRTz1olGFO
         o+DCRu2CCWlO/U1JTmt97uCyD9woWRCQ+7QIMz03WfMG4Ho1h4XOGr2GN10FbS5uPkhb
         pCIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728706402; x=1729311202;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vB16VpCDewcAwoYN49nbK+yIU/0PlYPRJKRICrTJZE8=;
        b=xViOWvuxq1zjQdiVeWsIxJFAshmQ7t1NlRX3FJR5eYeEEOdA3rbqG1ZUOMgUd4X6yn
         Aho5+1T+ywZcaJebR+ZHO7vjTad8R89P6FFEJG+KAOE1TM+O/azhT+MNBU+DjGDGfaDg
         KCbuKILveueeZ4QE5B8lvLtDLKN5+GZ2J1Kg7kcsnZRxYvFpmBLHxy78sufU1zrjNALp
         HkkxNiv1LOsW1XofzLjMsNP/1SN4O6cOFOm16OA1EE7ujFpdyRMqWpbfPPoY07aWDU6n
         0SM687F8qtgfYsGmPyapk5bKosXLAgGc5Up1XjJiZC7XfllACkKWm8kMvptzXX1oHEcv
         JC6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVyXUJ4dfB8sSWKFL6P6ZQLnliXizyMoKvEneA8lgLNAMs/Jnk6HE9/h8nC84BbMy4UDWU=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8Uunbhd5yOXuhl7pRr2MruTKSZSKSuniyVDjKf+SlY70cU07K
	NbCdmFv7ZcO3oQ3ULGo/hs/pvnxhXRXJI3vNXViF+JUdDHZDJ92iJtkI7s9k7A==
X-Google-Smtp-Source: AGHT+IEUBN4nc8fDzuF7ww7X5ksu78JTjsuqiB3sE0EdJOBGzVs3tTuontBwHvcsi4XzGJlZlVJueQ==
X-Received: by 2002:a17:902:f70c:b0:20c:c482:1d72 with SMTP id d9443c01a7336-20cc4821f28mr10112675ad.20.1728706401976;
        Fri, 11 Oct 2024 21:13:21 -0700 (PDT)
Received: from thinkpad ([36.255.17.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8bad32basm30934345ad.57.2024.10.11.21.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 21:13:21 -0700 (PDT)
Date: Sat, 12 Oct 2024 09:43:15 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Stefan Eichenberger <eichest@gmail.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com, Frank.li@nxp.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2] PCI: imx6: Add suspend/resume support for i.MX6QDL
Message-ID: <20241012041315.vtmixcxbqwb63kno@thinkpad>
References: <20241009131659.29616-1-eichest@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241009131659.29616-1-eichest@gmail.com>

On Wed, Oct 09, 2024 at 03:14:05PM +0200, Stefan Eichenberger wrote:
> From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> 
> The suspend/resume support is broken on the i.MX6QDL platform. This

You mean the 'system suspend/resume'?

> patch resets the link upon resuming to recover functionality. It shares
> most of the sequences with other i.MX devices but does not touch the
> critical registers, which might break PCIe. This patch addresses the
> same issue as the following downstream commit:
> https://github.com/nxp-imx/linux-imx/commit/4e92355e1f79d225ea842511fcfd42b343b32995
> In comparison this patch will also reset the device if possible. Without
> this patch suspend/resume will not work if a PCIe device is connected.
> The kernel will hang on resume and print an error:
> ath10k_pci 0000:01:00.0: Unable to change power state from D3hot to D0, device inaccessible

Looks like the device is turned off during suspend.

> 8<--- cut here ---
> Unhandled fault: imprecise external abort (0x1406) at 0x0106f944
> 
> Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> ---
> v1 -> v2: Share most code with other i.MX platforms and set suspend
> 	  support flag for i.MX6QDL. Version 1 can be found here:
> 	  https://lore.kernel.org/all/20240819090428.17349-1-eichest@gmail.com/
> 
>  drivers/pci/controller/dwc/pci-imx6.c | 44 +++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index 808d1f1054173..f33bef0aa1071 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -1238,8 +1238,23 @@ static int imx_pcie_suspend_noirq(struct device *dev)
>  
>  	imx_pcie_msi_save_restore(imx_pcie, true);
>  	imx_pcie_pm_turnoff(imx_pcie);
> -	imx_pcie_stop_link(imx_pcie->pci);
> -	imx_pcie_host_exit(pp);
> +	/*
> +	 * Do not turn off the PCIe controller because of ERR003756, ERR004490, ERR005188,
> +	 * they all document issues with LLTSSM and the PCIe controller which

LTSSM

But LTSSM is for the PCIe link state, not sure how it impacts controller state.
Can you share the link to those erratums?

> +	 * does not come out of reset properly. Therefore, try to keep the controller enabled
> +	 * and only reset the link. However, the reference clock still needs to be turned off,

You are resetting the *device* below, not the link.

> +	 * else the controller will freeze on resume.
> +	 */

Please use 80 columns for comments. Exception is for the code.

> +	if (imx_pcie->drvdata->variant == IMX6Q) {
> +		/* Reset the PCIe device */
> +		gpiod_set_value_cansleep(imx_pcie->reset_gpiod, 1);
> +
> +		if (imx_pcie->drvdata->enable_ref_clk)
> +			imx_pcie->drvdata->enable_ref_clk(imx_pcie, false);
> +	} else {
> +		imx_pcie_stop_link(imx_pcie->pci);
> +		imx_pcie_host_exit(pp);
> +	}
>  
>  	return 0;
>  }
> @@ -1253,6 +1268,28 @@ static int imx_pcie_resume_noirq(struct device *dev)
>  	if (!(imx_pcie->drvdata->flags & IMX_PCIE_FLAG_SUPPORTS_SUSPEND))
>  		return 0;
>  
> +	/*
> +	 * Even though the i.MX6Q does not support proper suspend/resume, we
> +	 * need to reset the link after resume or the memory mapped PCIe I/O
> +	 * space will be inaccessible. This will cause the system to freeze.
> +	 */

This comment is not really needed.

> +	if (imx_pcie->drvdata->variant == IMX6Q) {
> +		if (imx_pcie->drvdata->enable_ref_clk)
> +			imx_pcie->drvdata->enable_ref_clk(imx_pcie, true);
> +
> +		imx_pcie_deassert_core_reset(imx_pcie);

There is no corresponding imx_pcie_assert_core_reset() in suspend.

> +
> +		/*
> +		 * Setup the root complex again and enable msi. Without this PCIe will
> +		 * not work in msi mode and drivers will crash if they try to access
> +		 * the device memory area
> +		 */

This indicates that the controller state is not preserved. I think we need a bit
more understanding on what is going on during system suspend on this platform.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
