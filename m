Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB221B0123
	for <imx@lists.linux.dev>; Thu, 15 Aug 2024 15:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723737233; cv=none; b=uXpddKxO9bp6mwWtlR8pHslnfkfrdMCJ6fQY/YnMvCYOd26tx3IKcSj2zd6VwQYHxpdlFDcY2vEBEo2tGweyx6p95jpzxGmiWu2+zeOJeLhsIPum4+QSLceFmOWQDSMRsJhpyVv97yHy1nSR5lG2K2ac+PlQ0db1pzkJmkFe+T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723737233; c=relaxed/simple;
	bh=F5oZlzKS7LV0vco3hf6kzYpAppwKPAa4bDeIJnmZJCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L2vqSk0ITj4RRoc/tx/I7/qraWLMTSDP53k8ijDBzBBG6NwUdJ/pCYwanP7a0PVIWuN9ucKHxY0YmdmcybezNhVW26QIXzwGiBuS+oywmLlHZSNBqMOFZi0nKyd0NtIc+u/bvJ86h7FzUOJLqigjhrxWoSlSH5wa3A8Zq0u5XIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mRtlEmtb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mRtlEmtb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2d3b4238c58so818763a91.2
        for <imx@lists.linux.dev>; Thu, 15 Aug 2024 08:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723737231; x=1724342031; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v8FkPO3LPGoGF13VvZyZHk15TI2ex5hx7elWLr/UyXk=;
        b=mRtlEmtblx6ljJCPj+5z8nVskahJfu8R+lLj4hoEtVLlEkQCDMqO+uzNRFhQmoweHu
         +4vh4USOKVJo0vZ3smgqqaRfM9kBzsa9u1DCNKuLAyaiV+oJxfp8aoo5hAaqs62CH7dy
         9Jp+8RBenEFZxcZBeaHs1oMd42zLZBZWN/k5nCSb6sWuT+QWah/APBgAcVmysnoPtNXm
         Lk7s/+xxAfHsx5dkoOOlckyclRgvqZg6yyKQm48vBQVGbvWhTLPHU4G/yQRy9W8PxCBH
         WcCn3JbQu50TzTfhSgzl7rCzs8QvsY5X2KEFHSB4EEWoX+rjUuPkD+Z9rQYKjKBwsosb
         c/eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723737231; x=1724342031;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8FkPO3LPGoGF13VvZyZHk15TI2ex5hx7elWLr/UyXk=;
        b=MEkSTGLumnKmZdiYohKIVFNTssfwsOGL1BwNX4rmbjzMoeWyUUNleCDVLHjwrkaH1P
         CDRx48DsKfQHbQOQsPdpctSUKXmqiwIxmV6Ug8K1kiB0m+WG3IuzxTtauhUNtmYdcl57
         Ti+OTCxTD5kA2j3/szTBCLELdBde1TM9hA/9+Zue1sh4e0LMf+x7lcW2jExioNrykaFH
         OwoVycZyK+DdUTgE8qcceoT3JNF07iyq2ywV4e1y57KrclztwLYDBFuMeCJLOrRwVTl0
         363+krPfoNe2dmAQVq1rOMCAfnq31oif9J52GB2wAMJv3zdhX7quTQ/Wh8ZeHyb8JFaf
         MdCA==
X-Forwarded-Encrypted: i=1; AJvYcCUmyeiwwskXCbUcFEHYKFGy+oiggQ2I5zZXZGk32/N8LaJqFD+jxH4yxBSyRfqgL/KqsPKuRrvXY94ZUeRingOxUENj
X-Gm-Message-State: AOJu0Yw9h3Q8pquyhJGxFlGpJ7+PmuSd5g3705zbVdWofJu4LSy3TQB7
	P17McWbX7FwVdToqKesaEUZHvZAyEmXAsF2DebYkXoLZINGM0JJHPKCJpsv6nw==
X-Google-Smtp-Source: AGHT+IFFhMzPsFhY6B8IutZ/NT80L7w/pSH6eUiPk5JneBgDCW93h41FVTkK8Xj+zNfxYMkf+hjWEA==
X-Received: by 2002:a17:90a:d517:b0:2cf:28c1:4cc2 with SMTP id 98e67ed59e1d1-2d3dfc1f4d7mr97707a91.3.1723737230823;
        Thu, 15 Aug 2024 08:53:50 -0700 (PDT)
Received: from thinkpad ([36.255.17.34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d396a59287sm3068691a91.0.2024.08.15.08.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Aug 2024 08:53:50 -0700 (PDT)
Date: Thu, 15 Aug 2024 21:23:43 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Zhiqiang.Hou@nxp.com,
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH 4/4] MAINTAINERS: drop NXP LAYERSCAPE GEN4 CONTROLLER
Message-ID: <20240815155343.GC2562@thinkpad>
References: <20240808-mobivel_cleanup-v1-0-f4f6ea5b16de@nxp.com>
 <20240808-mobivel_cleanup-v1-4-f4f6ea5b16de@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240808-mobivel_cleanup-v1-4-f4f6ea5b16de@nxp.com>

On Thu, Aug 08, 2024 at 12:02:17PM -0400, Frank Li wrote:
> LX2160 Rev1 use mobivel PCIe controller, but Rev2 switch to designware
> PCIe controller. Rev2 is mass production chip. Rev1 will not be maintained
> so drop maintainer information for that.
> 

Instead of suddenly removing the code and breaking users, you can just mark the
driver as 'Obsolete' in MAINTAINERS. Then after some point of time, we could
hopefully remove.

- Mani

> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  MAINTAINERS | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1e71f97fb6749..9b683899cd088 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17556,14 +17556,6 @@ S:	Supported
>  F:	Documentation/devicetree/bindings/pci/nvidia,tegra20-pcie.txt
>  F:	drivers/pci/controller/pci-tegra.c
>  
> -PCI DRIVER FOR NXP LAYERSCAPE GEN4 CONTROLLER
> -M:	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>
> -L:	linux-pci@vger.kernel.org
> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -S:	Maintained
> -F:	Documentation/devicetree/bindings/pci/layerscape-pcie-gen4.txt
> -F:	drivers/pci/controller/mobiveil/pcie-layerscape-gen4.c
> -
>  PCI DRIVER FOR PLDA PCIE IP
>  M:	Daire McNamara <daire.mcnamara@microchip.com>
>  L:	linux-pci@vger.kernel.org
> 
> -- 
> 2.34.1
> 
> 

-- 
மணிவண்ணன் சதாசிவம்
