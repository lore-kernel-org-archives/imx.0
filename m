Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422C313AA3F
	for <imx@lists.linux.dev>; Wed, 27 Nov 2024 06:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732687304; cv=none; b=C+/Ts+QOFUKGEmS5qRX+YPcl4a/GWgrCKu2PnTpOEJEbEuK7TAxCisbsSJhdL6/ToZTSk5GkgdxrbhBGM59+EfP/8teI6vj57fZYIOfpupWfBc/y/d1qqv+hKJlLhAKzRlhPKGHD3b7Intkp09Rmw05gLcnn9LELRqO+uRQT8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732687304; c=relaxed/simple;
	bh=+pmdwmmhZdYr6Apa02nMXEwsIq+I1rZk5qVaZg/xJpc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QKLSuF8hxGaJWsYUv2DIobenDS73p/oFJ55Y6Z9NwcmIIU7i8Mz5CuXMNv/qaCVPMI8oo9y1Dk5VzCsdHOan0wwk+6SQoQAmJW6DcQcK2ueOt7r4FmEQSzGHL/SBjMH2B3TaO0FnRMOGLgnEmrkJ49WLrVRfh0cnhQBXvidC7Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K8lIa/dB; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K8lIa/dB"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21288ce11d7so50434955ad.2
        for <imx@lists.linux.dev>; Tue, 26 Nov 2024 22:01:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732687302; x=1733292102; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ykkZstOa8bXXD8shy4Wz7LF8azAidbDjZzgBbS7DJo4=;
        b=K8lIa/dBGXWEnpnwrtjla/mMO6LxWeEQODWv16bN6dl4/6lzBhmBj6m1ahGDoRDxKD
         bWjfzP2qYbeJB9ndeq4Y5IFAEJivcNS7pZJ+tw/zAaSNWCQhNEBPx7MucUs8QWVqkTMA
         nRxSaEV62cemGqcuimb7mdrTHGpY30wTv7RPDYVlN0NFd7ia9Uxvt1i6rNkx/CuirqW6
         nuQbtGB1gEzY/W/wgSuXZmjAJ4ngIbEQBJrhPZ4eqCPxKcBidGyp8rWRQO+Dp69Rz1Wd
         RCjlAziLnUMfuRxv9eoT9XSi7U+qozI5PIWDRoLeQUVmZrCMb2rKcmUO3pT+tyUzgUKo
         o+lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732687302; x=1733292102;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykkZstOa8bXXD8shy4Wz7LF8azAidbDjZzgBbS7DJo4=;
        b=b5fMZNFkPOUFV14JBmSKMGqSXIyiQOLKYFf7hXXWq8ljd0TPknHAnGgKxlXM0tm2IM
         yk+I/NKArDNkVtgAiDLlo6A1iPQF7wUIKW/5C3ZtD+1wJ6GtSZeDAAh5qD9+yA8wjD36
         Ci20FBw2JNN6OLAY2HsskQhkNpMPZcsTFJyvABJMYZK+AfjbTXgeggI0czK/NVXFTB2Q
         bl0eC7reGRWZ+oUa6ZMPkCK7WIiR/jnMlKMW1eaiv+e73U7NgPDQnC6L32JbBsUp5ETL
         9H5hf9rNa7ikqEFwCNR9wPEkOIyuuDyYAkuXRG2LZmmC8pQx0Gx4S5uM6Ykm6Xj8S/gH
         V4pg==
X-Forwarded-Encrypted: i=1; AJvYcCVjWfa7K3OOjfeJURiXFwoqYXWdDsC/RgI+SjIvyDtCTfe4/+OmdMGDMHrtrf0R7U3hqIc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwX5JmS6EPtjWUL44VvHbJULYHSAMCi46Yty8zmpt32TrNfG8QL
	ldOTgsCceEw1Rny4VQvv1ezFy7xLca+w0igBzp4kdCvIo7JyDBQtZNm1oECXzg==
X-Gm-Gg: ASbGncuaM76mg+ow0o8VBVXUDSuobgHkcawGqPWSKs1/3wXNv6xWpEMcYLljGEYnArz
	GL8lagd1anIE53bNEtUtMvoVJ/ptTj4WGinCRHJq81xip4E0fj5tqdl9mxelQtVfwq/7JHU9tAq
	RLC+cFpt3cVAcBKL/h6TZc+FTZm58VzreqHcsT/CA72VtcFyBy82RtHx+O8oDO3FB8N8bEs/J/A
	ZtGRezBR7wm5Li3UBpJ6ttq4NqQ0qhkbXin/DfbIOFdnBkGo4WjLfloX2ZA
X-Google-Smtp-Source: AGHT+IElcgtOc9MKuqCcQKs788nAqHcwj4F+w9zIfHU7WoZTfiySo28O12pa/pXEa3gpawHEreJy/w==
X-Received: by 2002:a17:902:d4c4:b0:212:48f2:9be9 with SMTP id d9443c01a7336-2150185797bmr20448515ad.30.1732687302401;
        Tue, 26 Nov 2024 22:01:42 -0800 (PST)
Received: from thinkpad ([120.60.136.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129dba345asm95076825ad.97.2024.11.26.22.01.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 22:01:41 -0800 (PST)
Date: Wed, 27 Nov 2024 11:31:32 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: jingoohan1@gmail.com, bhelgaas@google.com, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, frank.li@nxp.com,
	quic_krichai@quicinc.com, imx@lists.linux.dev,
	kernel@pengutronix.de, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] PCI: dwc: Clean up some unnecessary codes in
 dw_pcie_suspend_noirq()
Message-ID: <20241127060132.hsawrwlkxkgvvji5@thinkpad>
References: <20241126073909.4058733-1-hongxing.zhu@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241126073909.4058733-1-hongxing.zhu@nxp.com>

On Tue, Nov 26, 2024 at 03:39:09PM +0800, Richard Zhu wrote:
> Before sending PME_TURN_OFF, don't test the LTSSM state. Since it's safe
> to send PME_TURN_OFF message regardless of whether the link is up or
> down. So, there would be no need to test the LTSSM state before sending
> PME_TURN_OFF message.
> 
> Only print the message when ltssm_stat is not in DETECT and POLL.
> In the other words, there isn't an error message when no endpoint is
> connected at all.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> v5 changes:
> - Remove the redundant check "(val > DW_PCIE_LTSSM_DETECT_WAIT)".
> v4 changes:
> - Keep error return when L2 entry is failed and the endpoint is
>   connected refer to Krishna' comments. Thanks.
> v3 changes:
> - Refine the commit message refer to Manivannan's comments.
> - Regarding Frank's comments, avoid 10ms wait when no link up.
> v2 changes:
> - Don't remove L2 poll check.
> - Add one 1us delay after L2 entry.
> - No error return when L2 entry is timeout
> - Don't print message when no link up.
> ---
>  .../pci/controller/dwc/pcie-designware-host.c | 38 +++++++++++--------
>  drivers/pci/controller/dwc/pcie-designware.h  |  1 +
>  2 files changed, 23 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/pci/controller/dwc/pcie-designware-host.c
> index 24e89b66b772..bbd0ee862c12 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -927,25 +927,31 @@ int dw_pcie_suspend_noirq(struct dw_pcie *pci)
>  	if (dw_pcie_readw_dbi(pci, offset + PCI_EXP_LNKCTL) & PCI_EXP_LNKCTL_ASPM_L1)
>  		return 0;
>  
> -	/* Only send out PME_TURN_OFF when PCIE link is up */
> -	if (dw_pcie_get_ltssm(pci) > DW_PCIE_LTSSM_DETECT_ACT) {
> -		if (pci->pp.ops->pme_turn_off)
> -			pci->pp.ops->pme_turn_off(&pci->pp);
> -		else
> -			ret = dw_pcie_pme_turn_off(pci);
> -
> -		if (ret)
> -			return ret;
> +	if (pci->pp.ops->pme_turn_off)
> +		pci->pp.ops->pme_turn_off(&pci->pp);
> +	else
> +		ret = dw_pcie_pme_turn_off(pci);
> +	if (ret)
> +		return ret;
>  
> -		ret = read_poll_timeout(dw_pcie_get_ltssm, val, val == DW_PCIE_LTSSM_L2_IDLE,
> -					PCIE_PME_TO_L2_TIMEOUT_US/10,
> -					PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> -		if (ret) {
> -			dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> -			return ret;
> -		}
> +	ret = read_poll_timeout(dw_pcie_get_ltssm, val,
> +				val == DW_PCIE_LTSSM_L2_IDLE ||
> +				val <= DW_PCIE_LTSSM_DETECT_WAIT,
> +				PCIE_PME_TO_L2_TIMEOUT_US/10,
> +				PCIE_PME_TO_L2_TIMEOUT_US, false, pci);
> +	if (ret) {
> +		/* Only dump message when ltssm_stat isn't in DETECT and POLL */
> +		dev_err(pci->dev, "Timeout waiting for L2 entry! LTSSM: 0x%x\n", val);
> +		return ret;
>  	}
>  
> +	/*
> +	 * Refer to r6.0, sec 5.3.3.2.1, software should wait at least
> +	 * 100ns after L2/L3 Ready before turning off refclock and
> +	 * main power. It's harmless too when no endpoint connected.
> +	 */
> +	udelay(1);
> +
>  	dw_pcie_stop_link(pci);
>  	if (pci->pp.ops->deinit)
>  		pci->pp.ops->deinit(&pci->pp);
> diff --git a/drivers/pci/controller/dwc/pcie-designware.h b/drivers/pci/controller/dwc/pcie-designware.h
> index 347ab74ac35a..bf036e66717e 100644
> --- a/drivers/pci/controller/dwc/pcie-designware.h
> +++ b/drivers/pci/controller/dwc/pcie-designware.h
> @@ -330,6 +330,7 @@ enum dw_pcie_ltssm {
>  	/* Need to align with PCIE_PORT_DEBUG0 bits 0:5 */
>  	DW_PCIE_LTSSM_DETECT_QUIET = 0x0,
>  	DW_PCIE_LTSSM_DETECT_ACT = 0x1,
> +	DW_PCIE_LTSSM_DETECT_WAIT = 0x6,
>  	DW_PCIE_LTSSM_L0 = 0x11,
>  	DW_PCIE_LTSSM_L2_IDLE = 0x15,
>  
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்
