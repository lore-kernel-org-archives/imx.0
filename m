Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF31C1DA53
	for <imx@lists.linux.dev>; Thu,  2 Nov 2023 16:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="A72pkk6X"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3add37de892so652549b6e.1
        for <imx@lists.linux.dev>; Thu, 02 Nov 2023 09:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698944299; x=1699549099; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DfyS21pSAaN9Ul5DPXfGOsxbkU+EJCrhzTnYRsGJibU=;
        b=A72pkk6X7NRWhCE9edWCP1z01ztvBLGkw0P02uEbow5/eWtfrgqSnT3dAao+Twwh36
         Ote9RqArLuvEpvHDjEWS6269LKolgoMeWyQxFaBRqQkn6m9crhOLXAzsr9wt/7ix4hpV
         evzkRLRUFnzdCo7UQ4mHmtP72GhOxcF9hkiAI7jSg5KIEe+i19vYkgimETjcSj0g/8cl
         iVXtLQuNgEMIHVuFmdLPciKGi+muXgxjapqhcGG6oXkSZn5tCIkSIFKmXbgztmYLOIuk
         wGjHdtl9Bphr3aFQA58ajS1GRvsyoEFw4Ttxu0WITBMKdheqionfGkt9vpm4C6brV75A
         2NrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698944299; x=1699549099;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfyS21pSAaN9Ul5DPXfGOsxbkU+EJCrhzTnYRsGJibU=;
        b=Ls7ODdQrtwaWZ7Xk9RFQjIkM2ubFyJmrlhuw2p9S58vXQBjzbZUhAVV8DHHIMgmimx
         2UE/36JR2mN6jrt3DF9Tv7DPSZoLGW1lG8wulyHXmwiykr/8hPkz3zVT933ouTHTFmLG
         fDlMDCIBDQRsAkSdmNFUtGnlsSCgUMI8z2glRp6KfNfCOmCqrOJMBs0wmWo7uTj8m1o+
         OouwpkIqcqHN08NlYQzEOFS6WaHFUO/jQJIDSSpKupARt0A/pKsrZpPY7uqu4rPEcegH
         Wu8ij59PqZiY/Elz6gi9Vi1rFexsTj9P666jg+vIaLqHOFw0pdRRmaEIqClfHZ0QInAn
         AojA==
X-Gm-Message-State: AOJu0YzK8oym7WcOrv/Z8XIqGHCIymqptzhjsHK9rwzUCMuD66bqRWJe
	jO/LhYHom3n2G1jANLJacEEZ
X-Google-Smtp-Source: AGHT+IGcPZMPmb6P3crHIYT6MoFFJH19w/pybMCanZfpyJq0eFqq7TsGozYLDzAec+P33O2PTiZXzg==
X-Received: by 2002:a05:6808:209f:b0:3ad:fe8d:dfae with SMTP id s31-20020a056808209f00b003adfe8ddfaemr20056494oiw.57.1698944298897;
        Thu, 02 Nov 2023 09:58:18 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id z26-20020a05620a08da00b0077263636a95sm89742qkz.93.2023.11.02.09.58.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 09:58:18 -0700 (PDT)
Date: Thu, 2 Nov 2023 22:28:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v3 1/4] PCI: layerscape: Add function pointer for
 exit_from_l2()
Message-ID: <20231102165808.GC20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-2-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-2-Frank.Li@nxp.com>

On Tue, Oct 17, 2023 at 03:31:42PM -0400, Frank Li wrote:
> Since difference SoCs require different sequence for exiting L2, let's add
> a separate "exit_from_l2()" callback. This callback can be used to execute
> SoC specific sequence.
> 

I missed the fact that this patch honors the return value of the callback (which
was ignored previously). So this should be added to the description as well.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>

With that,

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> 
> Notes:
>     Change from v2 to v3
>     - fixed according to mani's feedback
>       1. update commit message
>       2. move dw_pcie_host_ops to next patch
>       3. check return value from exit_from_l2()
>     Change from v1 to v2
>     - change subject 'a' to 'A'
>     
>     Change from v1 to v2
>     - change subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 37956e09c65bd..aea89926bcc4f 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -39,6 +39,7 @@
>  
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	int (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool pm_support;
>  };
>  
> @@ -125,7 +126,7 @@ static void ls_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
>  		dev_err(pcie->pci->dev, "PME_Turn_off timeout\n");
>  }
>  
> -static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +static int ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  {
>  	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
>  	struct ls_pcie *pcie = to_ls_pcie(pci);
> @@ -150,6 +151,8 @@ static void ls_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  				 10000);
>  	if (ret)
>  		dev_err(pcie->pci->dev, "L2 exit timeout\n");
> +
> +	return ret;
>  }
>  
>  static int ls_pcie_host_init(struct dw_pcie_rp *pp)
> @@ -180,6 +183,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_off = 0xc0000,
>  	.pm_support = true,
> +	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
>  
>  static const struct of_device_id ls_pcie_of_match[] = {
> @@ -247,11 +251,14 @@ static int ls_pcie_suspend_noirq(struct device *dev)
>  static int ls_pcie_resume_noirq(struct device *dev)
>  {
>  	struct ls_pcie *pcie = dev_get_drvdata(dev);
> +	int ret;
>  
>  	if (!pcie->drvdata->pm_support)
>  		return 0;
>  
> -	ls_pcie_exit_from_l2(&pcie->pci->pp);
> +	ret = pcie->drvdata->exit_from_l2(&pcie->pci->pp);
> +	if (ret)
> +		return ret;
>  
>  	return dw_pcie_resume_noirq(pcie->pci);
>  }
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
