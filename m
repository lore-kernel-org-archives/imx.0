Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F03A30F97
	for <imx@lists.linux.dev>; Mon, 16 Oct 2023 16:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wfi4BNsm"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-66d17bdabe1so29698106d6.0
        for <imx@lists.linux.dev>; Mon, 16 Oct 2023 09:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697474446; x=1698079246; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QMErPVjbDQWKUZJi0yx3PHwgd44uCsmqExmEKyoGenQ=;
        b=wfi4BNsmzEMdvVFAdM+AytMJ11vduCOgAg1rGr8EPH2frLDi04PuPIJGbUCfStgTN5
         988HWE8lg8kik+R9oq/vwrkMImQkklYDlECjQIb5O6IlHjFvPL8V56zlP5xW46/qwSRD
         jzUgHOx9Sy7OUxEJcd2R6QT1BOZqzooFx1P+HhAeTfiW1fiiD4pz7df/SRbadvxrgNW6
         PtA04w3JiUcLI1iARmjAor6AiiAVWuro8b7FRv1PDxsc/nsKal7llIrY7wxjDGQPgY77
         Ei2d0hw4GSD/fhp3uPeDrovy6rJYI/XmU57ceB50c0jh7rtRq/iT/m4dlDzHT5HmxOo8
         1FHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697474446; x=1698079246;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMErPVjbDQWKUZJi0yx3PHwgd44uCsmqExmEKyoGenQ=;
        b=cWOUaktk1dDMOcMVPGwBuWXy/gcc1CzRNx3T6dod+8g5Xu9NJ/2kAUtdQyPvlinYdD
         NYNE8mxa0DaKG9EQJB9I+Z7yAbJS0+PJQRnygRIQR4Ucuf5gyXOA2VpscXOX34iql6fT
         FdVzYmy3LAUtPsXbgVBgdSBlar+S4Dxbt6wiFM9sVRLYVkn/ojbpcaiaaJOxX7htKkw+
         npGyTQnxpucGHIMSvNG8e0vAKmnAVt7ohhhB4rFRj35P/BVJvLhMHEOjzllVFvSeZ7nk
         g5VhqHc0rdrgjCCxf4nkInCn57RfK7v72rvfP/DNSdmNbn8iPKSVDNccPduhEtXFxT9E
         MlqQ==
X-Gm-Message-State: AOJu0Yx+8DYoZG3hH55fAQZlyimdb3gT+20g3oxvDBmqIvfxcxRPFc5o
	RReR2OXA+UJtCNFmp/+0NH+X
X-Google-Smtp-Source: AGHT+IEJrtLsab3W/titRBbEr+F6cON9aYDks19MkUWPWxcQNbAkkCh7gLRrSjOouWXUxCmZiVJgZQ==
X-Received: by 2002:a05:6214:cae:b0:66d:28a5:d153 with SMTP id s14-20020a0562140cae00b0066d28a5d153mr11497866qvs.47.1697474445956;
        Mon, 16 Oct 2023 09:40:45 -0700 (PDT)
Received: from thinkpad ([117.207.31.199])
        by smtp.gmail.com with ESMTPSA id dn8-20020a056214094800b0065b0e724f83sm3548177qvb.6.2023.10.16.09.40.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 09:40:45 -0700 (PDT)
Date: Mon, 16 Oct 2023 22:10:36 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Minghuan Lian <minghuan.Lian@nxp.com>, Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linuxppc-dev@lists.ozlabs.org>,
	"open list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-pci@vger.kernel.org>,
	"moderated list:PCI DRIVER FOR FREESCALE LAYERSCAPE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/3] PCI: layerscape: add function pointer for
 exit_from_l2()
Message-ID: <20231016164036.GE39962@thinkpad>
References: <20230915184306.2374670-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230915184306.2374670-1-Frank.Li@nxp.com>

On Fri, Sep 15, 2023 at 02:43:04PM -0400, Frank Li wrote:
> Difference layerscape chip have not difference exit_from_l2() method.
> Using function pointer for ls1028. It prepare for other layerscape
> suspend/resume support.
> 

How about:

Since difference SoCs require different sequence for exiting L2, let's add a
separate "exit_from_l2()" callback. This callback can be used to execute SoC
specific sequence.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-layerscape.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index b931d597656f6..20c48c06e2248 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -39,6 +39,8 @@
>  
>  struct ls_pcie_drvdata {
>  	const u32 pf_off;
> +	const struct dw_pcie_host_ops *ops;

Where is this ops used? If this is added as a preparatory for next patches, I'd
suggest you to move it to the respective one instead to avoid confusion.

> +	void (*exit_from_l2)(struct dw_pcie_rp *pp);
>  	bool pm_support;
>  };
>  
> @@ -180,6 +182,7 @@ static const struct ls_pcie_drvdata ls1021a_drvdata = {
>  static const struct ls_pcie_drvdata layerscape_drvdata = {
>  	.pf_off = 0xc0000,
>  	.pm_support = true,
> +	.exit_from_l2 = ls_pcie_exit_from_l2,
>  };
>  
>  static const struct of_device_id ls_pcie_of_match[] = {
> @@ -213,7 +216,7 @@ static int ls_pcie_probe(struct platform_device *pdev)
>  	pcie->drvdata = of_device_get_match_data(dev);
>  
>  	pci->dev = dev;
> -	pci->pp.ops = &ls_pcie_host_ops;
> +	pci->pp.ops = pcie->drvdata->ops ? pcie->drvdata->ops : &ls_pcie_host_ops;

This one also.

>  
>  	pcie->pci = pci;
>  
> @@ -251,7 +254,7 @@ static int ls_pcie_resume_noirq(struct device *dev)
>  	if (!pcie->drvdata->pm_support)
>  		return 0;
>  
> -	ls_pcie_exit_from_l2(&pcie->pci->pp);
> +	pcie->drvdata->exit_from_l2(&pcie->pci->pp);

You should always check for the existence of the callback first before invoking
it.

- Mani

>  
>  	return dw_pcie_resume_noirq(pcie->pci);
>  }
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
