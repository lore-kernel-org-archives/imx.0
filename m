Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C26C54648
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 06:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727935788; cv=none; b=uesTulhu3vmMTIbTxurDIk9GFCkzPQI8oN8TRfPPcuchScpU9+TghlSUgdqa9luy3yWfod0dXHbMnIukMnZplPDIiuUw/l1IoDDDPM+Ib5pESBVkd7rI4MpGWqr6vIuzjUBvtj2nHEgzA1aaEH9J57n20qV6gTqZUlda6OWo884=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727935788; c=relaxed/simple;
	bh=5qE7r2zF9aYX4kmLqkW5oVwtgaulZIS8B+W0wm0ojXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdW/ezIqMbFNg/D+SRBQG6+m7Uak9IOAvcgiTqsR6Z5xQ9zvyMmY2UeRsUTfLeb0vNRruifANuqAOkwTQ8OJFG08Hvl/oC94dq3E+RgpNmov9qqT5beUqvzY+xgz2sy7Uxselgx8Dq1Qytplp5bVsPv5avzdNLjo21qH69YrjnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HhWV0d07; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HhWV0d07"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7d4f85766f0so449536a12.2
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 23:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727935787; x=1728540587; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Z+l/BNMu/LG26jO3LSFHUD/mLYE9z78MrYoZ9LI74D4=;
        b=HhWV0d078ynAgIlA5cqclbULb9aRUl3UGQbolWX6YWq5ZFDYAjiQRyPP5qs5EAwog/
         XGvP0KJghu8V+uRSRTfDfCRmNNPMs04WPBzGKus/SovKARhK2xCOv/7ASr91cFLhuWup
         +xx9qOVdIwSeOnsLllgQ6u13hn/uDynMpmBslPg1D5F/fO0xdj0t1+FouJRe9+QC2Tvb
         Xixzfr4XV+N4RjudJrzomvyVMHL6WEARUzceiqDtb8D/JVT0Czl3rMy66kTl7j9rmEFd
         wX9QEpKEmdXuxl33tqbS/vV7tTZaXBOgap/GPxDISuBiPeJCbRD9XJirFvSIXDa1PwpL
         j6fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727935787; x=1728540587;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z+l/BNMu/LG26jO3LSFHUD/mLYE9z78MrYoZ9LI74D4=;
        b=b4OTID8p0PVhfpclTJxpUH/eeSlJt138KLii5sH7QKAUFAos8RFMisPgYu9kbJ1kXN
         v+Neut2W+ikL8KzmlohDsZAdzVbnXPISEH37UNCigLBM3KM7XCfbLT5reeRu8If2wFtV
         QayqQmyZkh+jjanvvKeYE3nCAJB445Q3vsRwcxnczS/MGDCiaKC48jp4VfjrXDVjpUfN
         WtCY4andk+jufMG5AjvzppJcKqGxhHbVji1XrQ6+lKr+VI82odngmyw7BLmBXa2rluqK
         mDxL/XzgdaUVLS46R76lAvOR0vpJrU1XKG0fnBRw+aWCVj/qgF4QMMk6AkkVO9hOUOZK
         KpiA==
X-Forwarded-Encrypted: i=1; AJvYcCWLLW3i/oHZP3/fk0URf9kTlLfmfi/irrAAzsf/sOre4wwEv9e2hfLajd9aj3SOC+KLFNU=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWnC01QjIzp+mZ+3E266Gesezu60aLj2q/2q3/n+PDjbObJmSN
	oVzyuKx6Ie5EFzKaFwPiJ0+/DmhpgBEvu+OsJ7R5Dasb6h1hxVvU9t4y/9Ukjw==
X-Google-Smtp-Source: AGHT+IFigsn8XaXeeugwLxzQiUgwK2EEtzyoYGufQ0g6YwMrdXB5m+uDhfgnjNBLbesB2OvjVs5uNw==
X-Received: by 2002:a17:902:e54d:b0:20b:6457:31e3 with SMTP id d9443c01a7336-20bc59ec8b5mr85235575ad.3.1727935786729;
        Wed, 02 Oct 2024 23:09:46 -0700 (PDT)
Received: from thinkpad ([36.255.17.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20beefb3b5fsm2513775ad.237.2024.10.02.23.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 23:09:46 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:39:42 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, kwilczynski@kernel.org, bhelgaas@google.com,
	lpieralisi@kernel.org, frank.li@nxp.com, robh@kernel.org,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v1 2/2] PCI: dwc: Do stop link in the
 dw_pcie_suspend_noirq
Message-ID: <20241003060942.af3nycevgtspzigj@thinkpad>
References: <1727243317-15729-1-git-send-email-hongxing.zhu@nxp.com>
 <1727243317-15729-3-git-send-email-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1727243317-15729-3-git-send-email-hongxing.zhu@nxp.com>

In subject,

s/Do/Always

On Wed, Sep 25, 2024 at 01:48:37PM +0800, Richard Zhu wrote:
> On i.MX8QM, PCIe link can't be re-established again in
> dw_pcie_resume_noirq(), if the LTSSM_EN bit is not cleared properly in
> dw_pcie_suspend_noirq().
> 
> Add dw_pcie_stop_link() into dw_pcie_suspend_noirq() to fix this issue and
> keep symmetric in suspend/resume function since there is
> dw_pcie_start_link() in dw_pcie_resume_noirq().
> 
> Fixes: 4774faf854f5 ("PCI: dwc: Implement generic suspend/resume functionality")
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/controller/dwc/pcie-designware-host.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index cb8c3c2bcc79..9ca33895456f 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -952,6 +952,7 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  		}
>  	}
>  
> +	dw_pcie_stop_link(pci);
>  	if (pci->pp.ops->deinit)
>  		pci->pp.ops->deinit(&pci->pp);
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
