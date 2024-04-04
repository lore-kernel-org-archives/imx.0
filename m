Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF0012AACA
	for <imx@lists.linux.dev>; Thu,  4 Apr 2024 15:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712246026; cv=none; b=Jv2kdFI/ONW5AWZIsLgz/Oo+G3dwrRPpJjEGp+v+EMM8xthzB8gKRQ3SN240qyimrontGw5q+DebcXlIOyErAJpnStdeGv1WyNTR4OQCCAuJkaTnSvfo0jauhxRzb7b8JcIjiWMctJ+MAbaNL1T8I5LbBDvFIS/21k3G1Mu2O4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712246026; c=relaxed/simple;
	bh=IOtUCFZKVp3dT19yR6jJ9GMvsH8zvq9FCQseOX3yf9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XaN/1DrP9KYShp42cOZalh6JynSaD8qsVwR7lSm5Y9Yjqx+BZzzK/EPD2ly5mR4To21MOVuk/LlTQc4CGBojaijcvJXnAfUN7EXSg3YYbxWD14nU1768L/FhvNySKYEhmSmBMtMC0qaY2VwOAt8t0xTDqW5SjVY6ujHI8FWek8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Pzw4h7lT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Pzw4h7lT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e2b137d666so6139905ad.2
        for <imx@lists.linux.dev>; Thu, 04 Apr 2024 08:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712246024; x=1712850824; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A76vBCCK1MtmEH4eG8ItKOT6t7ZQD66dj/w9DMvOXMg=;
        b=Pzw4h7lTvK5OMQLtlYHFtqGDJgV/jYmzG2RLycxsxySvx8/z/eCA84SAvNRt2skR4h
         yJrEICWb9K3oH52C/sgFif6pKnbAOoYH8+yTk6wsAlM33NR+pHpI+h8Kfc9p/mVPyiVa
         prmaQnqg4n4MrxUONvUAvl8RL5exihTbO/gKjdPBuW5/uEMOq2mGugMHyI+Rkt326zGf
         lV43+RxMIMMUK7+dZxN7uok4ICZM5YYtShTgWjHiGdr3LpuTg/q/Qzv6y4otpS2aWW1s
         QwDCO2R9xXN8Y1ISyHyikUht7txsoId6nrFEMlLHyWNJD947Kj4zLN1nDlxg4RqUs9Ru
         UvVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712246024; x=1712850824;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A76vBCCK1MtmEH4eG8ItKOT6t7ZQD66dj/w9DMvOXMg=;
        b=TepJuNsE8N/RLDR9oqw78At4YV1hESOw6dakK9DIa+bIKmsCDazXLeS+knZSMxwJIo
         Vd7dDoewZvybFcRDGF0NLEbIcblyE3skdZ6k047CbSDoTL3N09rp7GXlBcTfnhyunuKS
         zpF0ig3xHXYYndTQ1yDEcCsrnnUv89UsQoOmTy8pYliIwryjFHsTJf53AIYFWTbXoazK
         gii/zjUFAjDaubnVB2VMicNR7OzrPqwCOLVmSlSrzabU+h5sNx8/UZQaITGJkLn/WDuM
         /OLf2aJ/wRg4ivWEAxNj5/2SpZAfofQccueBg8a0qiVym1kDv9j/8xvnAm2wi92/a1Jf
         26SQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/RYRHyP15EKFafU5MtHr7k4fFEHyhCpe6EAlbuFaguEsrAHooSEuFVRAomnf78Nn7Ucelj/G59HU+0Ruz+cusLpz1
X-Gm-Message-State: AOJu0Yx1wBxpI3twAeHD9vCwZTh7iUB4L9F7A2Qq7qUoqQ/REPSDBbmI
	1KTgN7XwRHsp9ADHzlDSYEG+4mXYHNxFnFvBOrIOFn50CN93Rc2ObXy4O6M65A==
X-Google-Smtp-Source: AGHT+IHdHFRWhWuUy3OLIL8u9AasmKRgsmM+36CA87IVGIRfTrIK/xuFlhL0VT9keY1uCHdtZQz8uw==
X-Received: by 2002:a17:902:ce86:b0:1e2:5e2f:682 with SMTP id f6-20020a170902ce8600b001e25e2f0682mr3358537plg.2.1712246023633;
        Thu, 04 Apr 2024 08:53:43 -0700 (PDT)
Received: from thinkpad ([103.203.73.241])
        by smtp.gmail.com with ESMTPSA id n18-20020a170903111200b001e0bae4490fsm15599425plh.154.2024.04.04.08.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Apr 2024 08:53:43 -0700 (PDT)
Date: Thu, 4 Apr 2024 21:23:37 +0530
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
Subject: Re: [PATCH v5 4/5] PCI: Add PCIE_MSG_CODE_PME_TURN_OFF message macro
Message-ID: <20240404155337.GB35218@thinkpad>
References: <20240319-pme_msg-v5-0-af9ffe57f432@nxp.com>
 <20240319-pme_msg-v5-4-af9ffe57f432@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240319-pme_msg-v5-4-af9ffe57f432@nxp.com>

On Tue, Mar 19, 2024 at 12:07:14PM -0400, Frank Li wrote:
> Add PCIE_MSG_CODE_PME_TURN_OFF macros to enable a PCIe host driver to send
> PME_Turn_Off messages.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/pci/pci.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
> index ffd066c15f3bb..989681a0d6057 100644
> --- a/drivers/pci/pci.h
> +++ b/drivers/pci/pci.h
> @@ -40,6 +40,8 @@
>  #define PCIE_MSG_CODE_DEASSERT_INTC	0x26
>  #define PCIE_MSG_CODE_DEASSERT_INTD	0x27
>  
> +#define PCIE_MSG_CODE_PME_TURN_OFF	0x19
> +

I think this could be moved before INTx to keep the codes sorted.

- Mani

>  extern const unsigned char pcie_link_speed[];
>  extern bool pci_early_dump;
>  
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
