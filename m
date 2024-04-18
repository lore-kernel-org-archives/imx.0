Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C78657D5
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 06:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713421218; cv=none; b=VOkLi3sFGbVPttvvUy7xkx2ciUHTy4JHRx9jcTuFPuX1PMg/VTsrIvydiNRGckk1LY9IBJjYpwpcMpf5ZFyvu1t/BWJqjX3qMFlKE9EljKilgLfuaApF7j3fy64UKu0l6z8WuXbzwNdlsDznRTSMgnezitm0xPyyMgcjDDJd2as=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713421218; c=relaxed/simple;
	bh=ioUowZ4DOFzP0N/qgT9D4k4N1wRxG9niaft+g/nCSIY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oRsjK50i1MDxlNWwOO8Hrgi5eF9PZbAY2uw45dbZrBUYJVBWG/M//TmiY+wGsxi5nqKXbjjf9sRBpNJ7jyUI3/d0n5SlxdJ2G0gRtWegVt4YNqOeAKghO2ByQ/bpg0CJgj5YOdh49SvwIXrItGjXMlIDl25MHBIIlnDk/43vyw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GS+4q3ZA; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GS+4q3ZA"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e504f58230so4594155ad.2
        for <imx@lists.linux.dev>; Wed, 17 Apr 2024 23:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713421217; x=1714026017; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eC0jjvQDPobd97rKZ4kcPj9ytdXbP5Fo1R6tB5tlq9k=;
        b=GS+4q3ZAAS8Uhd0kaOlA1Bh6qL2Em987ovgWObN2Oa7J/FA5WcXB9GE046twhEYWoT
         cwEFIWP5ujBb5Vc6oyQ7AIP6Q/7sAPvqbQBaB1B0fV9yl0ifJSBdHCuLNIOW5DZ4Znt7
         xhobXv31ndo23TlxJREH8H5I+i4URpJGbab94pOxuJtBfox0sag+eDMBUlJpnwATncTO
         PXZTtyY43lKa29CpaKc3OY34NfzFZCXhuMKw0FiMVDm/tHNI+ev+DnbMRYVtoZhrtIph
         1nluXNTegtc4osUAmExoR93AwfVkWc72A1RD+VrX3LrAFuk2WZejXVnklrYbMscUb3fV
         wyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713421217; x=1714026017;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eC0jjvQDPobd97rKZ4kcPj9ytdXbP5Fo1R6tB5tlq9k=;
        b=nH+oMxyv9FiFsCD7STNzY6LA83Q02CjPK/XIu+WSduwXgm00w5WctIIDuijtQRUGrd
         5VPX831jIafUwUsX+8kYZXYgXGttnH9PJPjXCwC1NuKW9GICIbzjr/FiL2mWcsh68p/G
         KfE1/lW+nOQC+wrb6jo9zeIxoT3791Fhc3wpDGAjB/XQVFp1g+J8XFYC/M/FEzfc5fKi
         ZM8Y83TCAIa95m0i6fzrF2j9uB8XF7lm1tRaWLpA3HnWiFcvx6BJ7AsFOf6K5lWd6ncZ
         UhEHj15Z1kZOx2gDpcOL1eTNstRHFSxuI6NjJWG5Rm3dmDgLEp89k+PKnM9PqLGE9WbP
         qSzw==
X-Forwarded-Encrypted: i=1; AJvYcCV1J11Nf64w6+SPCEmdsQPb14Z7bk+JpP1oAvDJ0DgdK4GKr5OA5LRX7jounX1Lh/XSmn8t6JqpLqx8UuzX5ihNA2W+
X-Gm-Message-State: AOJu0Yyi8QFTpVDGCFR00YTvGBZDgbXzBMJ4bq130V060tDYi2gqzvEz
	zAEd5431VXJjyM9f8Lg54Cr4J+Ll/JAsygsnVrb3Y55H4BSs/rkrMBF4Z8G5uw==
X-Google-Smtp-Source: AGHT+IGdfM7ZRhJKbLTZ3yVa5ET1b0iJCVoUvItzdBrd7Ol9ksqn1v2z6enDdZegm9UydZGVy5biZQ==
X-Received: by 2002:a17:903:48f:b0:1e4:24bc:426e with SMTP id jj15-20020a170903048f00b001e424bc426emr1861087plb.28.1713421216842;
        Wed, 17 Apr 2024 23:20:16 -0700 (PDT)
Received: from thinkpad ([120.56.197.253])
        by smtp.gmail.com with ESMTPSA id h10-20020a170902b94a00b001e088a9e2bcsm691770pls.292.2024.04.17.23.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 23:20:15 -0700 (PDT)
Date: Thu, 18 Apr 2024 11:50:09 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v7 4/5] PCI: Add PCIE_MSG_CODE_PME_TURN_OFF message macro
Message-ID: <20240418062009.GD2861@thinkpad>
References: <20240417-pme_msg-v7-0-9c6208cda90f@nxp.com>
 <20240417-pme_msg-v7-4-9c6208cda90f@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240417-pme_msg-v7-4-9c6208cda90f@nxp.com>

On Wed, Apr 17, 2024 at 12:59:42PM -0400, Frank Li wrote:
> Add PCIE_MSG_CODE_PME_TURN_OFF macros to enable a PCIe host driver to send
> PME_Turn_Off messages.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
>  drivers/pci/pci.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index 02f46875fe2d9..36381fc7ebd32 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -30,6 +30,9 @@
>  #define PCIE_MSG_TYPE_R_LOCAL	4
>  #define PCIE_MSG_TYPE_R_GATHER	5
>  
> +/* Power Management Messages; PCIe r6.0, sec 2.2.8.2 */
> +#define PCIE_MSG_CODE_PME_TURN_OFF	0x19
> +
>  /* INTx Mechanism Messages; PCIe r6.0, sec 2.2.8.1 */
>  #define PCIE_MSG_CODE_ASSERT_INTA	0x20
>  #define PCIE_MSG_CODE_ASSERT_INTB	0x21
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
