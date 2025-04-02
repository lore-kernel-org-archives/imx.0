Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C11214A71
	for <imx@lists.linux.dev>; Wed,  2 Apr 2025 06:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743575246; cv=none; b=m2k3st5Le0t2Nsv0c8l1w0Lu5XUzt4IdukeuBPzezTGV+nBjmeRxFVLZpDeMLyv0yjdxnytf64NEsAYeJxjoWx9Woa01MMl53m7BlVhMQioslWyfKh1YTDM3sh4ULvUcnyPwHxuodrXzbPKY7BDavxPp1ZKbFeQDtr0tS3s8Gj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743575246; c=relaxed/simple;
	bh=dZNfw4e53R/2i9yKfUihZGMQ/0k4D+W1DqhP5bAjhq0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UJCsJvO7gfcbCM63vwJUT7VQpPwD/sOkZOV/BAD9VvS2YDA8pB3UqQkVBkaHBjxiipKODYhy0oDfaMuCunsL2bk0Lt/CLXYiwbGajlsmJlkjF3hd9E/qNeAMxsPFP643Uf7ga9ztcJSKadH2AQKLXhpQk+bTdcMM82jABLyLYdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FtGE2Nnp; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FtGE2Nnp"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-225477548e1so114166945ad.0
        for <imx@lists.linux.dev>; Tue, 01 Apr 2025 23:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743575244; x=1744180044; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=FtGE2Nnpe4bED+Qix56BvhXrVsM65DaSwyVAi1YBJzy/m8oBPrcwQEOnq/pdiMIDIx
         Pt21LHSRI1Xuu0+r0zUu39nMFzPPUYPWzDZp1GZfJffVE38dXYUe6jPE/fP2skkHtTCX
         z2j7q6y4xEux9icc+UP+oiz3QII1zj0aG+6G7nhuDckp3PL9bpjmNNS/px38dB2FxoB5
         DAhemrGLvMB97qgKBqG7KbKHvTPwaa5rwi0mqyZkj+w3ltiQgGkA3sn8o5aR+wNTasbS
         PvWIASI23nY53UbMjdFeAGcuPX37gJOQwb6JluRTI/fljFgr2kHYxRXr3fxpn7ge3Hpg
         534w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743575244; x=1744180044;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0vxtuFvSbsxOaM1zbzEuh2qcT0p6czX42zd3rEEDXyw=;
        b=NxyUs61sKptJ+JHkFagGv3if1/9AmL5jNM8n73GuQ8bkRjHia1S+q8ESD5JeXyD3WG
         pnqlBoNsI5D0Jyx/ISAaVGz2RyvmcEL98lXXdzK1xdcMtxPD2BVFiAteB04J87vZqTPC
         CNyCsFzdBkMok1FSXL0cEBGwhvXPpg5jgHQtBXZIbFERniOvXzGuF9pYt6AvtGJFi9Lu
         XknBYxtv8PALUB0iWBTxyPziovbvSRgh5srglzNztFLPVLVJ+7ovXMKh7339amZh+kU6
         guX4navtYKWTBgSgOo/Uodj2f+KQF2Wv9e5guTjezOMr9+dOTwOhgb4oqWFPDmoj2kW1
         x5dQ==
X-Forwarded-Encrypted: i=1; AJvYcCWcrHaZ380cm1yklGs90by9TXk7YKOhD6C54o6va9s3K7NhRb153CUOAtCucL/EXn8sX8I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCDr6qiGHo/V48wrEnoyZpKWZoYPsQDrDZDd+EVAmKW80rHsuL
	R3H2HqI52XER+ZahpdvYFnrrRbZzQlP39ifrd5h4l3FzEtz65iKVXq4stVKWTA==
X-Gm-Gg: ASbGncsKYAG6liOYWIO5c1IbP/ckr4fPE7kLz9JNLLGs8PkomKm1Xji0XSXOB58o4cs
	nOzUcuJx33sETQk95ZRfR8jVIC0YxL5ou4iZodDgbEzSNWbnYF9ioUt8QGic5vyjSnjzYIu7zxP
	Mrqo25JO2DM1HVilrw6nEQjQuFor5sYh4DpAvd3V/cgqhhy4vAee+mk7lbsu4iGPeZcNNI7HUAn
	I/tFQrKcUwSEXh7kJDmn/RsiJDR6HjP/rR5W6AEmkxrCa+4Lf3kHluGxzXMYFotxOUGkLuoeCaT
	iSf5QL6RzhG4/UmAnvwIQ4iW0E4zpg0kOr/vE3VszSTZeO0ToYbM+Qhg
X-Google-Smtp-Source: AGHT+IEftqywmuVKm2jxf0hoVI8+XFFEcICMDydA0YNIWpJc2sWztLxMbLmbc7T+583swHeEhH9wPw==
X-Received: by 2002:a17:903:11c7:b0:224:1ec0:8a16 with SMTP id d9443c01a7336-2292f9622b5mr229392235ad.21.1743575243714;
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Received: from thinkpad ([120.56.205.103])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eee1b3fsm99908325ad.74.2025.04.01.23.27.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 23:27:23 -0700 (PDT)
Date: Wed, 2 Apr 2025 11:57:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kw@linux.com, robh@kernel.org, bhelgaas@google.com, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/6] PCI: imx6: Start link directly when workaround is
 not required
Message-ID: <kskqytb67s6qpt2jfn6sry4oj3zq46y5hizyzxxvehtjtqtj6r@qmtfepjzjrpk>
References: <20250328030213.1650990-1-hongxing.zhu@nxp.com>
 <20250328030213.1650990-2-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250328030213.1650990-2-hongxing.zhu@nxp.com>

On Fri, Mar 28, 2025 at 11:02:08AM +0800, Richard Zhu wrote:
> The current link setup procedure is one workaround to detect the device
> behind PCIe switches on some i.MX6 platforms.
> 
> To describe more accurately, change the flag name from
> IMX_PCIE_FLAG_IMX_SPEED_CHANGE to IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND.
> 
> Start PCIe link directly when this flag is not set on i.MX7 or later
> platforms to simple and speed up link training.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

One observation below (not related to this change).

> ---
>  drivers/pci/controller/dwc/pci-imx6.c | 34 +++++++++++----------------
>  1 file changed, 14 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
> index c1f7904e3600..57aa777231ae 100644
> --- a/drivers/pci/controller/dwc/pci-imx6.c
> +++ b/drivers/pci/controller/dwc/pci-imx6.c
> @@ -91,7 +91,7 @@ enum imx_pcie_variants {
>  };
>  
>  #define IMX_PCIE_FLAG_IMX_PHY			BIT(0)
> -#define IMX_PCIE_FLAG_IMX_SPEED_CHANGE		BIT(1)
> +#define IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND	BIT(1)
>  #define IMX_PCIE_FLAG_SUPPORTS_SUSPEND		BIT(2)
>  #define IMX_PCIE_FLAG_HAS_PHYDRV		BIT(3)
>  #define IMX_PCIE_FLAG_HAS_APP_RESET		BIT(4)
> @@ -860,6 +860,12 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
>  	u32 tmp;
>  	int ret;
>  
> +	if (!(imx_pcie->drvdata->flags &
> +	    IMX_PCIE_FLAG_SPEED_CHANGE_WORKAROUND)) {
> +		imx_pcie_ltssm_enable(dev);
> +		return 0;

While looking into the code, I realized that we could skip waiting for link
during the workaround in atleast one instance:

```
diff --git a/drivers/pci/controller/dwc/pci-imx6.c b/drivers/pci/controller/dwc/pci-imx6.c
index 5f267dd261b5..9dbfbd9de2da 100644
--- a/drivers/pci/controller/dwc/pci-imx6.c
+++ b/drivers/pci/controller/dwc/pci-imx6.c
@@ -875,11 +875,11 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
        /* Start LTSSM. */
        imx_pcie_ltssm_enable(dev);
 
-       ret = dw_pcie_wait_for_link(pci);
-       if (ret)
-               goto err_reset_phy;
-
        if (pci->max_link_speed > 1) {
+               ret = dw_pcie_wait_for_link(pci);
+               if (ret)
+                       goto err_reset_phy;
+
                /* Allow faster modes after the link is up */
                dw_pcie_dbi_ro_wr_en(pci);
                tmp = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
@@ -913,17 +913,10 @@ static int imx_pcie_start_link(struct dw_pcie *pci)
                                goto err_reset_phy;
                        }
                }
-
-               /* Make sure link training is finished as well! */
-               ret = dw_pcie_wait_for_link(pci);
-               if (ret)
-                       goto err_reset_phy;
        } else {
                dev_info(dev, "Link: Only Gen1 is enabled\n");
        }
 
-       tmp = dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKSTA);
-       dev_info(dev, "Link up, Gen%i\n", tmp & PCI_EXP_LNKSTA_CLS);
        return 0;
 
 err_reset_phy:
```

dw_pcie_wait_for_link() in DWC core should serve the purpose.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
