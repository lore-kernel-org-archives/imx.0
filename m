Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9357383B2
	for <imx@lists.linux.dev>; Sat, 27 Apr 2024 09:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714210305; cv=none; b=hWUxEi5FWDykYq2sRStCZFrBwAQ/7a3DtpcOWEO9LLKgzGc+eaWOzkfrIofxYGCF6UcL6gFeoAXO9ywDUR5FcfOwRG+5i/T6cD1n6uMRkJiyirwQQ3jYDgztBXdMdNgVz1yaUjv9/t/IBJDwY8H2PDWoWPTJernOhUl6gMXShc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714210305; c=relaxed/simple;
	bh=vhh5H2vOFTU8TUNbGQSR21C/gruMVYqytSa4SWxU+l8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TJ7ODNJIlEnGzz6KW2ox+FGnTE2ce6axrUkGOwMqAByWeOGcZlzLcDQ9HwcZZvKSK0uc1C4qLJo3jd3CVftIUyJfPju0W8g/Bw7XoVPiRqUk/kGyR0pQUyzub6lD60QvvIJ5mFTQkCpCCMwdGuhZRzZQ+ln0s2D0lAYEE+dNuhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=niv0E/MA; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="niv0E/MA"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6f043f9e6d7so3080626b3a.3
        for <imx@lists.linux.dev>; Sat, 27 Apr 2024 02:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714210303; x=1714815103; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tYOHjjJvOYuP2OhXdEZddqymE0/QhchR9DMZrxwOyFM=;
        b=niv0E/MAOL5gSz0MJD1YsxUY6Mz01TNC4BaH9ALEm3M2rduISYEQNeQeQzo7T2EpEZ
         k7edQytc2EyLVSD5TpI0JrK24nYMZcWLzLv3FV6FlE5i5UuPrv5bFLIBmat3cXoj6DmO
         oDa81lq4YLU6+OEnd+ktUt+dxIw6Qp1aWN3ukK7BT+p42TlBCzuBmRqGQwVciLexWnk5
         1ClxHGguGKd3Ey0KZTYvUDkZ+hq1cupsySvqyZkpjxdglAtBsygGpggKtIoNNVaiAfJb
         siqtSuoMdrtwJBGmSLlgcyipWYWaGrsXQr+FIK3tRcSlKs6Fgz+Bc+C6sBnSQUjtsTJU
         wdNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714210303; x=1714815103;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tYOHjjJvOYuP2OhXdEZddqymE0/QhchR9DMZrxwOyFM=;
        b=rJofP3UpDKKHPKetINCyqB4W1ylafEbtTqV3f7bMTyMR+qPmnGtnZ5dXJX6AAekc+t
         ebukrviVxNMI9Sjs8cIHdxkEcIofs1H5qrGrIJRqYEZegxsPk6WfCwhzq/6newJn/1JN
         7bWQW8sYb61g1c8bQ0HdLYh1DRHkxPZeLhhb/8/W86jCAdzWP0x6Yi+XIHETLdCMUD2m
         48NXLRWahSbHPK05XINIO8iOVps5FA3mub3gh88Wa9mD3ra91Q1sv+L5D18Em6F5UiuL
         NHtX2ebFAvVNTDcf32CS0OxGD5u2+AtyIjkvY5awTfYQMWgBLOFbxq2BlkTGhEs5FbYf
         mSnw==
X-Forwarded-Encrypted: i=1; AJvYcCWM2plybGsB0E2E5T+bzXj9/FuqSqL5ep6zwrYujIxPsU5UknnrAyVi+SOmR0Ky6shg+6L/rdnPX5TjKLaaRZRxc42S
X-Gm-Message-State: AOJu0YwNjFYCWw7A+j2Z9/V6Y4Ju7UOKuGGJNUDLqNv7DBIOYEm39/Vq
	jWaX8E0ZccFOH7dFssiM2ht0HziV1VhUP9c3VN4GRcqSfZZvTluesF2Dj9bPYA==
X-Google-Smtp-Source: AGHT+IEDEy5DOuk8n6kXlJvEA8g+7MUq9OgTqFu1xI+W8rd0Vtrs/hhQqEV4yIwn5e/6UYcNXRNLPQ==
X-Received: by 2002:a05:6a21:2d86:b0:1a9:d9bb:acdc with SMTP id ty6-20020a056a212d8600b001a9d9bbacdcmr5839673pzb.28.1714210303063;
        Sat, 27 Apr 2024 02:31:43 -0700 (PDT)
Received: from thinkpad ([117.213.97.210])
        by smtp.gmail.com with ESMTPSA id h17-20020aa79f51000000b006e71aec34a8sm16043440pfr.167.2024.04.27.02.31.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 02:31:42 -0700 (PDT)
Date: Sat, 27 Apr 2024 15:01:33 +0530
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
Subject: Re: [PATCH v3 04/11] PCI: imx6: Rename pci-imx6.c to pcie-imx.c
Message-ID: <20240427093133.GI1981@thinkpad>
References: <20240402-pci2_upstream-v3-0-803414bdb430@nxp.com>
 <20240402-pci2_upstream-v3-4-803414bdb430@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240402-pci2_upstream-v3-4-803414bdb430@nxp.com>

On Tue, Apr 02, 2024 at 10:33:40AM -0400, Frank Li wrote:
> Update the filename from 'pci-imx6.c' to 'pcie-imx.c' to accurately reflect
> its applicability to all i.MX chips (i.MX6x, i.MX7x, i.MX8x, i.MX9x).
> Eliminate the '6' to prevent confusion. Additionally, correct the prefix
> from 'pci-' to 'pcie-'.
> 
> Retain the previous configuration CONFIG_PCI_IMX6 unchanged to maintain
> compatibility.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

You should not rename a driver as that will break existing userspace scripts
looking for module with old name.

- Mani

> ---
>  drivers/pci/controller/dwc/Makefile                   | 2 +-
>  drivers/pci/controller/dwc/{pci-imx6.c => pcie-imx.c} | 0
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/controller/dwc/Makefile b/drivers/pci/controller/dwc/Makefile
> index bac103faa5237..eaea7abbabc2c 100644
> --- a/drivers/pci/controller/dwc/Makefile
> +++ b/drivers/pci/controller/dwc/Makefile
> @@ -7,7 +7,7 @@ obj-$(CONFIG_PCIE_BT1) += pcie-bt1.o
>  obj-$(CONFIG_PCI_DRA7XX) += pci-dra7xx.o
>  obj-$(CONFIG_PCI_EXYNOS) += pci-exynos.o
>  obj-$(CONFIG_PCIE_FU740) += pcie-fu740.o
> -obj-$(CONFIG_PCI_IMX6) += pci-imx6.o
> +obj-$(CONFIG_PCI_IMX6) += pcie-imx.o
>  obj-$(CONFIG_PCIE_SPEAR13XX) += pcie-spear13xx.o
>  obj-$(CONFIG_PCI_KEYSTONE) += pci-keystone.o
>  obj-$(CONFIG_PCI_LAYERSCAPE) += pci-layerscape.o
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pcie-imx.c
> similarity index 100%
> rename from drivers/pci/controller/dwc/pci-imx6.c
> rename to drivers/pci/controller/dwc/pcie-imx.c
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
