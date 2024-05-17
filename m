Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AEA213D8AC
	for <imx@lists.linux.dev>; Fri, 17 May 2024 17:06:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715965616; cv=none; b=M5kNO5BlwLEJMBTCxbWL3jXfrTFLl+PPwjHlk72kABlWaJk58iB91J70kUQXbWgrCbC2a5S4r2NaVroCyMHGPgAOH3Ee1j12uenMChs9KmXS7yydU3mqRl66F4mfQ00ASbMXR48/9zCDI8jV5BCFUA6qfnrOjbA9s7P9a1D8Wl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715965616; c=relaxed/simple;
	bh=cmXJHYt0n27WurVX5CSCRo0/J6W6YEmPq397ULn1iWI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0nwyQaJWckuXA1/CuZMIP7Y0FfAvFaxLjgqgbk/qQudC4+d/WeMjGkmRY/UoOaNLxv3n+QgLlIBi4lwtayefHPJqLAFrDkUc+xRtSvsyHPIG91ionibp2BGT8+DP5zJP6hv/kjUVeXUVCxQgqv45L2Hyo6InRZSANiwaNbCuqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1eeb1a4c10aso14805465ad.3
        for <imx@lists.linux.dev>; Fri, 17 May 2024 10:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715965615; x=1716570415;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tX2V3zugpj22RtcaxmCt5d+IZOg/f7yrPNcCBjnFxnU=;
        b=D7tTZAZ06st64W/fOMXtVA2gN7aCD1bkOISLrkSELk8rFDMysanXWqyudXjIBt2BbZ
         6wX1FfZB7O+vFiLgAdNb8d9/1Jtf6bxUI2EZlJ8GriXF3zXMeDjwaWlGWiITjdY8CE3d
         vABWx7HpsqXpz5kuTBdh6/L+C0S9U4BzgGgIUsUyuj6bUDIeum3qRnK3P28IGU5OoN8L
         Q2jLU2H284w6KdyfSbB6YSDHEiXB3hxPDtxeA0sJTO04O2Ca+2d9B/8Y/gjsukk9SRHz
         /ZJnJojWFcgo1AcgluEFe5gqS7J1JeXwBn6kZ9YYjkGESm/MNnGyKxtUHgYgNblxq8tB
         onvg==
X-Forwarded-Encrypted: i=1; AJvYcCVySETpGIxhmqcrniywp1ngbXr92eZrI0djSod/U4btk4fXtBNqImd7ZI6h0ghVsptFdSFipHR10hmgpdP3WP71vJ7g
X-Gm-Message-State: AOJu0Yy41FDofaZ4mV3+pvA52Kc/PuUIsBVhJK2UKnWqT3ZzCF4zxX2h
	pdYG1H/g8o/48Fs+ewmDsV8heOsI81qt2KpaHOvkaQMYFBLHaC4I
X-Google-Smtp-Source: AGHT+IGcpPnQ6L8AUKPL7T4eaD+5vSlhDjJypWgo2jQ4+KxJfz3d5egB8JUeE4n7pXKePdQoJXgdpw==
X-Received: by 2002:a17:903:1210:b0:1f0:6f32:e13d with SMTP id d9443c01a7336-1f06f32e236mr164155385ad.21.1715965614547;
        Fri, 17 May 2024 10:06:54 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0b9d3b0fsm159107075ad.22.2024.05.17.10.06.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 May 2024 10:06:53 -0700 (PDT)
Date: Sat, 18 May 2024 02:06:50 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: cassel@kernel.org, bhelgaas@google.com, gustavo.pimentel@synopsys.com,
	helgaas@kernel.org, imx@lists.linux.dev, jdmason@kudzu.us,
	jingoohan1@gmail.com, linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org, lpieralisi@kernel.org, mani@kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v4 1/1] PCI: dwc: Fix index 0 incorrectly being
 interpreted as a free ATU slot
Message-ID: <20240517170650.GC1947919@rocinante>
References: <20240412160841.925927-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240412160841.925927-1-Frank.Li@nxp.com>

Hello,

> When PERST# assert and deassert happens on the PERST# supported platforms,
> the both iATU0 and iATU6 will map inbound window to BAR0. DMA will access
> to the area that was previously allocated (iATU0) for BAR0, instead of the
> new area (iATU6) for BAR0.
> 
> Right now, we dodge the bullet because both iATU0 and iATU6 should
> currently translate inbound accesses to BAR0 to the same allocated memory
> area. However, having two separate inbound mappings for the same BAR is a
> disaster waiting to happen.
> 
> The mapping between PCI BAR and iATU inbound window are maintained in the
> dw_pcie_ep::bar_to_atu[] array. While allocating a new inbound iATU map for
> a BAR, dw_pcie_ep_inbound_atu() API will first check for the availability
> of the existing mapping in the array and if it is not found (i.e., value in
> the array indexed by the BAR is found to be 0), then it will allocate a new
> map value using find_first_zero_bit().
> 
> The issue here is, the existing logic failed to consider the fact that the
> map value '0' is a valid value for BAR0. Because, find_first_zero_bit()
> will return '0' as the map value for BAR0 (note that it returns the first
> zero bit position).
> 
> Due to this, when PERST# assert + deassert happens on the PERST# supported
> platforms, the inbound window allocation restarts from BAR0 and the
> existing logic to find the BAR mapping will return '6' for BAR0 instead of
> '0' due to the fact that it considers '0' as an invalid map value.
> 
> So fix this issue by always incrementing the map value before assigning to
> bar_to_atu[] array and then decrementing it while fetching. This will make
> sure that the map value '0' always represents the invalid mapping."

Applied to controller/dwc, thank you!

[1/1] PCI: dwc: Fix index 0 incorrectly being interpreted as a free ATU slot
      https://git.kernel.org/pci/pci/c/cd3c2f0fff46

	Krzysztof
