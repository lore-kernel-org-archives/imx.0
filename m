Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7E1DB13E
	for <imx@lists.linux.dev>; Sun, 13 Apr 2025 15:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744557178; cv=none; b=MLgpnzlRAPLiBifbkJKWF7bqyXYJn2ulsNK4lR/nOPo74tCC36h05pz67aJeNTZFE2zWmMCmMUizEkyY4xJljvgd8qRWaV7Mr18TrWdNZUIzkuangbq1dFMTnF5K42Khgy79bPIOuwGA9WWxIKsAEWJw7EpYuRT0FkDYeNbZntw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744557178; c=relaxed/simple;
	bh=phS3D5OOOkm6noFR0FYDt75hv1VoWhQUHvXWkLWoIaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XntmtposueGI0wxmZJx4NOrt12T6r67TlQQQf+/uN4uTZLMiZ9luRsvqT1Gn128hrBaO+Ru9Pz3aYwEXciWLTNONCW9/ZCfOgEkvL4FZMJoopN9EIAeQkNSEPOyY37/JS9mxbWb9s/7HV+EnaTY0/cBbAU3B2moSf3VQuqBx34k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MVpB4zTD; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MVpB4zTD"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-af91fc1fa90so3247311a12.0
        for <imx@lists.linux.dev>; Sun, 13 Apr 2025 08:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744557175; x=1745161975; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=MVpB4zTDX7nFURK4QG9vzcNi3d6ppCqDyn9cKYtZx06cu3vD8XFLXf0NDxKvOCKXyZ
         NR/F0Mlc0iW1hJJKYneenxu9zIXSY4KqOcg4M9/TWFl+Qt3rgvw46g++hEIRbG9rLhsZ
         24dNC19Yc+I3HNrsXkorfWz0+poChL7OX+roBo9ry2wbR0AMEprQpegfGFECWOn+OiHz
         V4Ep1Bjb+mfYcHssDx4ZTmQ1MTRX6eD+594wr7w8/amnF1ceh9nKZCpt/z6DawDeFmue
         SgKNE2IIA5R5el0OIhu4EmKXg4GZPYRYbjRPRF0CT9K0Vmh3tI2FP8GZKp1DY0ffn06I
         hloQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744557175; x=1745161975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vj0Jh4u4n9sOWnZj41OkfdidrvtJgy6o9CdCA00I7q0=;
        b=etDvFD7CEVcpBf50+TW2vT0tIOVcELy/tBlOVl98IoJrHYSavhs3rjHkzdZsVw02a7
         8Fn0RYv8nGI+bp1/EcDBVdjkmCxoCAUew3U2e4AqbljsHhxDVgtPpN4MhHvkeEov27Q9
         DsmaoefN//SbAAHBRCItgrzZ7gI0jUCpnBxS3bXdR2fByymiJdTVyjxCeKgbhtMd6lMa
         FIOOZd1+BtIEBrf50AiroO57tXB34GqIL8fujDaH+qfbtxr/h1fPP2sbQpAl00zxUsSv
         AbhwLw/KDO44PGqVdoAj6hbHK81DW9akqFzpaxDLpkT+6edQwAMsFuX4PS+4P9kHhxcn
         ifYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiAFQZSDX+bJFmAM2ZdJZexquiQeLp4hv9uiCb6D5zLyiuyposx9VHYoZr/6zFcBl0QSc=@lists.linux.dev
X-Gm-Message-State: AOJu0YxaMPyfjhbow01S82hDKGNE83sqIci1/+AK1lG6mExsi9NWDl7L
	RqdN2yOqJbIW2h+8sloF9nhTLVKDozVvp6hlnX8l+GKeTBChLa4+hVoSMLBA1A==
X-Gm-Gg: ASbGncueCBZBk8FSCaiijEaOPC2r8VRU+wqpdy+ExmxGmHx0oc4ah18dkGn9wgKAjFU
	EQbDF5oz3xTqgb3FdOqnlQ3UClCH4lbj6uMWY0tf6kss5ACK+Xd/YsZ3X4+vzImNzIE77cyOBn+
	Uqy6eX5V19WzmQfFQvM9nULk8XMZX2Rfp3/deXZGBVCjbbY71Ab2dUDKTGR0Nps2SwTtyVuLEbQ
	DubiqmlGhtVuzKHYoupfFmViCHvd5ZEciAbckLvvys5nKCUZD+kY51HQs2+RoL2TrFjbGtPvhRy
	u9CH9rKv4ZFnPw2UCltkap44Te/dAXU0TFuxfbIfyVpUZg4jxA1l
X-Google-Smtp-Source: AGHT+IEl1mfp4h8joqe88PR+eqAgq+GkZLNrPfPvCZVzAzUCEhJOKuX/kTRe8Qw9Vvxua7aCf7iBqA==
X-Received: by 2002:a17:902:d484:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22bea4ab6abmr108986985ad.17.1744557174513;
        Sun, 13 Apr 2025 08:12:54 -0700 (PDT)
Received: from thinkpad ([120.60.137.231])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd18580esm9589319a91.46.2025.04.13.08.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 08:12:53 -0700 (PDT)
Date: Sun, 13 Apr 2025 20:42:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] PCI: imx6: Skip one dw_pcie_wait_for_link() in
 workaround link training
Message-ID: <2hbtwy3tfzip7dglixhcipaykxxg3ph6hy3bwn5ujmvj75mwvy@6qcqptbakkey>
References: <20250408025930.1863551-1-hongxing.zhu@nxp.com>
 <20250408025930.1863551-3-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250408025930.1863551-3-hongxing.zhu@nxp.com>

On Tue, Apr 08, 2025 at 10:59:25AM +0800, Richard Zhu wrote:
> Remove one reduntant dw_pcie_wait_for_link() in link traning workaround
> because common framework already do that.
> 
> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index a4c0714c6468..c5871c3d4194 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -881,11 +881,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	/* Start LTSSM. */
>  	imx_pcie_ltssm_enable(dev);
>  
> -	ret = dw_pcie_wait_for_link(pci);
> -	if (ret)
> -		goto err_reset_phy;
> -
>  	if (pci->max_link_speed > 1) {
> +		ret = dw_pcie_wait_for_link(pci);
> +		if (ret)
> +			goto err_reset_phy;
> +
>  		/* Allow faster modes after the link is up */
>  		dw_pcie_dbi_ro_wr_en(pci);
>  		tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
> @@ -907,17 +907,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  			dev_err(dev, "Failed to bring link up!\n");
>  			goto err_reset_phy;
>  		}
> -
> -		/* Make sure link training is finished as well! */
> -		ret = dw_pcie_wait_for_link(pci);
> -		if (ret)
> -			goto err_reset_phy;
>  	} else {
>  		dev_info(dev, "Link: Only Gen1 is enabled\n");
>  	}
>  
> -	tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
> -	dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
>  	return 0;
>  
>  err_reset_phy:
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
