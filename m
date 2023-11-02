Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A34020317
	for <imx@lists.linux.dev>; Thu,  2 Nov 2023 17:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="n1loOI1U"
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-77784edc2edso67887985a.1
        for <imx@lists.linux.dev>; Thu, 02 Nov 2023 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698946751; x=1699551551; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yE6hYq/1M2NiVA4RY0gsdXB7HPtKFRVy440CKIJ1q9I=;
        b=n1loOI1Uhst9wsHzGZE4qqYETU1HrIGCGNC9ZTKGtx3ExX7nZfiTN6iEHPyUVqrjsh
         rgByibA8NBYmUQjMqi7086rLBHq1+hCDdyMjA/jEI2byM4IODe5CtNYQ/FbQfPaWmOvL
         51OcurMDQpR+ipySpDRo90XiParOBy0AJGqlNe9wceBAS/nNBCOVfh89nffIXGUI6Bj9
         BP43McdgJx+L9huAQz7TIx/DpPkX2JxVp7gxxm/eGNa67W2oiK8LYJpXTlaSaPKjE/d4
         fgYGqYJJAxAf/CdAqDtywvwjwbJdXVc8SgMp4WGDUS7JV3HuUeB8Nn+6AtWdQEWYUtV/
         BPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698946751; x=1699551551;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yE6hYq/1M2NiVA4RY0gsdXB7HPtKFRVy440CKIJ1q9I=;
        b=Vc5zFgBP50JGF+v1uTPqi5XECXkmFMfgxThbYL1LJmiabZJM3rpna1OzvSaco38qYj
         1Ad2Z1U8DTh9B9MC5A3MEwNU2uBq5ZD9OwRTNmOAG3HfnKGVaTIbXEL3IXmPXR6UbFja
         j2kVFl+0Sf3XEbOwXMrlA2+PDZ9riXJDQCbr6fILupcg8jPvJdFLkPKc7qphpryB/Wct
         MwVw/w2JKNg4irrQisZZWuxllnQ+sOALMxzO0kyXQCt5IspiRDbjYHYYhUEvQIDV08Gj
         UV2Kdm24Z73C5yaTuTVeCBaxrTb38SvGHgrlm0fufJIJW8tbPC5lLt2AcUOvyJu1srTK
         rFPg==
X-Gm-Message-State: AOJu0YxR3P8Y4ShP1+43rY/RWszYxaBGF8Eb3pI/NJQtRLpBs0pWZKxM
	7qjWA9pupCq+jRz/P50NHCVC
X-Google-Smtp-Source: AGHT+IGJE7PRlsHRJBiWTBzJ7qskCfmYJqaSK0LlSGhhJCTuiYGeWOKAeIpbrsnv82Z6K6JfC4NtgA==
X-Received: by 2002:a05:620a:2045:b0:779:d143:c1a7 with SMTP id d5-20020a05620a204500b00779d143c1a7mr18609776qka.26.1698946750692;
        Thu, 02 Nov 2023 10:39:10 -0700 (PDT)
Received: from thinkpad ([117.217.189.228])
        by smtp.gmail.com with ESMTPSA id bk2-20020a05620a1a0200b0076e672f535asm127918qkb.57.2023.11.02.10.39.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Nov 2023 10:39:10 -0700 (PDT)
Date: Thu, 2 Nov 2023 23:09:00 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: bhelgaas@google.com, imx@lists.linux.dev, kw@linux.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	lpieralisi@kernel.org, minghuan.Lian@nxp.com, mingkai.hu@nxp.com,
	robh@kernel.org, roy.zang@nxp.com
Subject: Re: [PATCH v3 4/4] PCI: layerscape: Add suspend/resume for ls1043a
Message-ID: <20231102173900.GF20943@thinkpad>
References: <20231017193145.3198380-1-Frank.Li@nxp.com>
 <20231017193145.3198380-5-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231017193145.3198380-5-Frank.Li@nxp.com>

On Tue, Oct 17, 2023 at 03:31:45PM -0400, Frank Li wrote:
> ls1043a add suspend/resume support.
> Implement ls1043a_pcie_send_turnoff_msg() to send PME_Turn_Off message.
> Implement ls1043a_pcie_exit_from_l2() to exit from L2 state.
> 

Please use the suggestion I gave in patch 2/4.

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> 
> Notes:
>     Change from v2 to v3
>     - Remove ls_pcie_lut_readl(writel) function
>     
>     Change from v1 to v2
>     - Update subject 'a' to 'A'
> 
>  drivers/pci/controller/dwc/pci-layerscape.c | 86 ++++++++++++++++++++-
>  1 file changed, 85 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-layerscape.c b/drivers/pci/controller/dwc/pci-layerscape.c
> index 4b663b20d8612..9656224960b0c 100644
> --- a/drivers/pci/controller/dwc/pci-layerscape.c
> +++ b/drivers/pci/controller/dwc/pci-layerscape.c
> @@ -41,6 +41,15 @@
>  #define SCFG_PEXSFTRSTCR	0x190
>  #define PEXSR(idx)		BIT(idx)
>  
> +/* LS1043A PEX PME control register */
> +#define SCFG_PEXPMECR		0x144
> +#define PEXPME(idx)		BIT(31 - (idx) * 4)
> +
> +/* LS1043A PEX LUT debug register */
> +#define LS_PCIE_LDBG	0x7fc
> +#define LDBG_SR		BIT(30)
> +#define LDBG_WE		BIT(31)
> +
>  #define PCIE_IATU_NUM		6
>  
>  #define LS_PCIE_DRV_SCFG	BIT(0)
> @@ -227,6 +236,68 @@ static int ls1021a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
>  	return 0;
>  }
>  
> +static void ls1043a_pcie_send_turnoff_msg(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	if (!pcie->scfg) {
> +		dev_dbg(pcie->pci->dev, "SYSCFG is NULL\n");
> +		return;
> +	}

Why scfg is optional for this SoC and not for the other one added in patch 2/4?

> +
> +	/* Send Turn_off message */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
> +	val |= PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +

In my previous review, I asked you to use a common function and just pass the
offsets, as the sequence is same for both the SoCs. But you ignored it :/

> +	/*
> +	 * There is no specific register to check for PME_To_Ack from endpoint.
> +	 * So on the safe side, wait for PCIE_PME_TO_L2_TIMEOUT_US.
> +	 */
> +	mdelay(PCIE_PME_TO_L2_TIMEOUT_US/1000);
> +
> +	/*
> +	 * Layerscape hardware reference manual recommends clearing the PMXMTTURNOFF bit
> +	 * to complete the PME_Turn_Off handshake.
> +	 */
> +	regmap_read(pcie->scfg, SCFG_PEXPMECR, &val);
> +	val &= ~PEXPME(pcie->index);
> +	regmap_write(pcie->scfg, SCFG_PEXPMECR, val);
> +}
> +
> +static int ls1043a_pcie_exit_from_l2(struct dw_pcie_rp *pp)
> +{
> +	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
> +	struct ls_pcie *pcie = to_ls_pcie(pci);
> +	u32 val;
> +
> +	/*
> +	 * Only way let PEX module exit L2 is do a software reset.

Same comment applies as patch 2/4.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
