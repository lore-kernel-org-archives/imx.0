Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A56552F508B
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 15:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752679244; cv=none; b=ddQaFc3eM4D4ic7RWo0V2+BSqwMN3TCLc357gTYxreTXGClDZpr/3c1Bb09k3Iz5qxuCT6l/kLyLIHqbyjcj6748k9Isv0IPmUsfGhKZcRtE+pQlgq/yvQgdER6USzM4btAaDODXEGYnOhwBjADXNgEtYJOcrOlabbW20PiCygo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752679244; c=relaxed/simple;
	bh=tXWo9DI0U4S27QdRpkx8bqAWOudlVH2rRpbfURoXpLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SVexJm02JatoxOvbiU0Vn7vVM8t5booSEFA7fgwOS5VWHNITAyxx+GELuVGQog1IFcRW61x+2wZtqZ913xWIkksahH9geOdFhly9wymAt2UdNCgvdqD/mv14NRVDQGV3vYo7XrcRohNj6W6pat3fbIrzFg1p9re7NmPGLybn1Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=It7154OG; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="It7154OG"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-23649faf69fso55724365ad.0
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 08:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1752679242; x=1753284042; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0kvAy9JuKk7cJOpP3kEzrHj2nDxIOe89eZJRSs0ppsc=;
        b=It7154OGx3n+WKa5F7iQJsVWo4fhUYRgio52dTkiSq1xEA6evq9/Ugh81Lvz0G/YYU
         t6Sf7P3rQc66mH/q1tKYyjeqc404cE1gRh3136YkSor6RLHlD77Fj9prAwz/FaQP+22i
         wWDOB/F7pmcthyqmZI9PcuW/JozeDK/DKaXbE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752679242; x=1753284042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0kvAy9JuKk7cJOpP3kEzrHj2nDxIOe89eZJRSs0ppsc=;
        b=S84hQVB1pCLj47KWbv19EIc1oejxMfDSpx9ThEH97qS0N/sMx2A0do2aBMdXnzbJ72
         IVYNU2SZ/lR9iCXewzbsc6lMDUFmlG866zD5R1j/5RKR80vVKbICAvuuRncc8k7iWHmf
         x7iSO0MT1JvEAIKFe24q/QjaKyj+OCP6Bt9iuH/7r74zDTFI0kUPYXYO38FnzcfzTDJ7
         1S9nNt9XEf1dqdiO3YsU0iJXmpZQirTYok/2XXHgXVyhmJh33sTz6lBMDaiEGbZhNn7H
         L2H16NvOkx9SjnofVQoICkCTMNK4ZRrofAb48Orwq/EP/v56WXQGzU5aXKGtgEjrpeqk
         TMKg==
X-Forwarded-Encrypted: i=1; AJvYcCWQKSKEFE9SdTOkLo4mLRF8QneDxCT560WXBe7BHGvOTnHJ0Rs7EfQkQ8lU6+qnUflObdU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcHImlq3kh4U5fCv8vUn/dcGGrU6Wr/5K0zvieeVrgziEG9ykx
	uIn2chP74zEoGu5XL9sbvE9qSns5Aqq6a7oG/kFVCTJAuEzuCCuTDwJFldXA5aPaoQ==
X-Gm-Gg: ASbGnctWdW7qqI7rTxYdh0gKLVj+jOpCD62LX+8pstatX40NZ8wwOxWmIN9J9aAhWoU
	oTCVfXoChXS5n1kvKLTjm1Yi4M3J32TOvwMZEZA1p2ow9Ny2zp/rOpN/+FEPe1vmW0ps/6pT3H7
	pCMHTKKW+SkDwAtn7pblYntJy6E6qCIeZmVWia/1vUwsBBfkWd3/l+c3syCj/1qrSdtH/F8AlBw
	GKrhxrPhfKkSbqMHDvaGch/uQaZknqXfqJz2pBCgNeBVez4W4vJFrNH34byT6/gLqxJC5JPr4yM
	02iMCRc7eaD3ySuc+lSpcS7Y0c7UxysQIjfNEG3kNxGBywdOSORxO/DPVV/LvQxppU7RqVi2286
	yaOCBzyXAi2uW+SThpPEGjW+92srn762EM7j7ECDXrqoofUBL6i8bDFyyZdx5k1eRG38ggDs=
X-Google-Smtp-Source: AGHT+IGcYoDvzs2xrFfDj2S6BlQ3ZOLJw8uglFXYfVPAkAzuv1JUfWvGeNjcSV0DwEnPsEttZXrSDA==
X-Received: by 2002:a17:903:3c23:b0:237:d486:706a with SMTP id d9443c01a7336-23e25778025mr49299945ad.48.1752679241689;
        Wed, 16 Jul 2025 08:20:41 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:17f8:90f2:a7bc:b439])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-23de4285a38sm126118035ad.44.2025.07.16.08.20.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:20:40 -0700 (PDT)
Date: Wed, 16 Jul 2025 08:20:38 -0700
From: Brian Norris <briannorris@chromium.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Bjorn Helgaas <helgaas@kernel.org>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>, Roy Zang <roy.zang@nxp.com>,
	Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
	Rob Herring <robh+dt@kernel.org>, imx@lists.linux.dev,
	linux-pci@vger.kernel.org
Subject: Re: Does dwc/pci-layerscape.c support AER?
Message-ID: <aHfDRm2S8N8Qus_m@google.com>
References: <20250702223841.GA1905230@bhelgaas>
 <aGW8NnHUlfv1NO3g@lizhi-Precision-Tower-5810>
 <aGXEcHTfT2k2ayAj@google.com>
 <tikcdb63ti6hbpypusxdiaoattpuez5rgpsglzllagnqfm5voa@5eornv77pl4i>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tikcdb63ti6hbpypusxdiaoattpuez5rgpsglzllagnqfm5voa@5eornv77pl4i>

On Wed, Jul 16, 2025 at 12:47:10PM +0530, Manivannan Sadhasivam wrote:
> On Wed, Jul 02, 2025 at 04:44:48PM GMT, Brian Norris wrote:
> > On Wed, Jul 02, 2025 at 07:09:42PM -0400, Frank Li wrote:
> > OTOH, I do also believe there are SoCs where DWC PCIe is available, but
> > there is no external MSI controller, and so that same problem still may
> > exist. I may even have such SoCs available...
> > 
> 
> Yes, pretty much all Qcom SoCs without GIC-v3 ITS suffer from this limitation.
> And the same should be true for other vendors also.
> 
> Interestingly, the Qcom SoCs route the AER/PME via 'global' SPI interrupt, which
> is only handled by the controller driver. This is similar to the 'aer' SPI
> interrupt in layerscape platforms.

Yeah, I have some SoCs like this as well. But I also believe that I have
INTx available, and that even when MSI doesn't work for AER/PME, INTx
might.

Do Qcom SoCs route INTx?

> So I think there is an incentive in allowing the AER driver to work with vendor
> specific IRQs.

Yeah, I suppose even if my SoC (and Qcom, depending on the above answer)
might work with INTx, it really does seem like an arbitrary decision
about what SoC makers connected which DWC signals, so I suspect this is
true.

Brian
