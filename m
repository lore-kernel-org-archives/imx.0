Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02C417E8EA
	for <imx@lists.linux.dev>; Sun,  1 Sep 2024 17:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725213331; cv=none; b=Emha7hzM8LgFjTj75mptr62+bp0DjmrLeRzl2U9aHJptAIQegAm0uQ/DJ/FmO5Pr0UEG01mXQYdSwEQ4aMzrwd/spWzqoXm1LFUEjVBvUQMjlqpZLoBCMSyvfsVAy++jaeS4F+mDYe2Hspa/WLDk3fRtI2sXri5qa0EFeJT2dFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725213331; c=relaxed/simple;
	bh=IM/chwYrXihDE8FLF8hiPYl6Hkd/A04mZYL++PJG0ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sNZDARET1Ujf1Razb8DDI9o1w0C57U2qpuSXMech/XQuGkunkNjpMM1Xeezx+1HBzBdmIayX9Xx6V/86FBIFp2cFSMjBp6D2lgMSnXRhKJFYAUkM8oIFTmdZZFqpfPSKJZHxWh9Y2kcdjfLxtNIxvg87B2uUhzx9bnatppEdSe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-39f539a83e0so3149015ab.2
        for <imx@lists.linux.dev>; Sun, 01 Sep 2024 10:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725213329; x=1725818129;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPCSj8FBVReSaeYCO2iGVjW5XuPs23A+QCwQAzU/9t8=;
        b=azu3yZksnacaK92/EVRfcTlRYQlWkCRJ0DiCQq6KCxTqK20dWTVjSV//nhWe7j9oYb
         5njD/AOvh+MxCz7t8wzx3XT5Kn+cnpu0PdDM6oeFHOZ5DLHqAkPbTs+dJoDMMyXHVD0W
         hSlnfiho8+PyZI3JV8Vw88Bmo1KeX0MWPMsjKZspWwcaZFqELDbdAW/c7l07XqCdo49K
         ShVn/+mcuAk3a0woH5kFxwokbpucOHW5F7NeeHm5IvAQ/2nbl5BP0dNd/9XR0r+bLa3T
         Ble4fRYJ8rTniFQDe3CXxOXHr5YDDnfSE+We2Yt9BCmm/ieApQqY2a/2YWLBrf0BqhIh
         XmCg==
X-Forwarded-Encrypted: i=1; AJvYcCU10BWmdCVmt9/v5mV60r2JzrO4VIWe+xQIjHy4OhHlOWWN+0nzuL5m4gRQ1adFuW2gCkc=@lists.linux.dev
X-Gm-Message-State: AOJu0YzBYvGzXZhSpqmogJxg/M3B7eW7uMakCFJL98/ymNYCizHFg6cF
	+EwLkt8HZ3mUYlz6aNqbRAH6WOjGOUE9nQ3L07GP933BfLdtEplh
X-Google-Smtp-Source: AGHT+IHBzBuDzpmGhMq1SRqwPuQgXk2zIrVcNlSo1Z3AcvkCcvK8Npof8O6DWfAfKPf7z5UlPibP3A==
X-Received: by 2002:a05:6e02:1c23:b0:39b:25dc:7bd6 with SMTP id e9e14a558f8ab-39f49a1fc8cmr69803675ab.4.1725213328575;
        Sun, 01 Sep 2024 10:55:28 -0700 (PDT)
Received: from localhost (fpd11144dd.ap.nuro.jp. [209.17.68.221])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d22e74388dsm5295193a12.3.2024.09.01.10.55.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Sep 2024 10:55:27 -0700 (PDT)
Date: Mon, 2 Sep 2024 02:55:26 +0900
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pci@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org,
	devicetree@vger.kernel.org, Jason Liu <jason.hui.liu@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 00/11] PCI: imx6: Fix\rename\clean up and add lut
 information for imx95
Message-ID: <20240901175526.GM235729@rocinante>
References: <20240729-pci2_upstream-v8-0-b68ee5ef2b4d@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729-pci2_upstream-v8-0-b68ee5ef2b4d@nxp.com>

Hello,

> Fixed 8mp EP mode problem.
> 
> imx6 actaully for all imx chips (imx6*, imx7*, imx8*, imx9*). To avoid
> confuse, rename all imx6_* to imx_*, IMX6_* to IMX_*. pci-imx6.c to
> pci-imx.c to avoid confuse.
> 
> Using callback to reduce switch case for core reset and refclk.

Applied to controller/imx6, thank you!

[01/11] PCI: imx6: Fix establish link failure in EP mode for iMX8MM and iMX8MP
        https://git.kernel.org/pci/pci/c/c9d04436880c

[02/11] PCI: imx6: Fix i.MX8MP PCIe EP's occasional failure to trigger MSI
        https://git.kernel.org/pci/pci/c/f82e7aa14378

[03/11] PCI: imx6: Fix missing call to phy_power_off() in error handling
        https://git.kernel.org/pci/pci/c/3268637c4f74

[04/11] PCI: imx6: Rename imx6_* with imx_*
        https://git.kernel.org/pci/pci/c/09bec00b3591

[05/11] PCI: imx6: Introduce SoC specific callbacks for controlling REFCLK
        https://git.kernel.org/pci/pci/c/8bc6b9ccba59

[06/11] PCI: imx6: Simplify switch-case logic by involve core_reset callback
        https://git.kernel.org/pci/pci/c/79049b791bbc

[07/11] PCI: imx6: Improve comment for workaround ERR010728
        https://git.kernel.org/pci/pci/c/ea7eddfc0c9d

[08/11] PCI: imx6: Consolidate redundant if-checks
        https://git.kernel.org/pci/pci/c/dce6ed132a2f

[09/11] dt-bindings: PCI: imx6q-pcie: Add i.MX8Q PCIe compatible string
        https://git.kernel.org/pci/pci/c/99807815121a

[10/11] PCI: imx6: Call common PHY API to set mode, speed, and submode
        https://git.kernel.org/pci/pci/c/b7e35e029881

[11/11] PCI: imx6: Add i.MX8Q PCIe Root Complex (RC) support
        https://git.kernel.org/pci/pci/c/3474e6ceabdc

	Krzysztof
