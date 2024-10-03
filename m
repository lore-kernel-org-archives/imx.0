Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E0A1F5FF
	for <imx@lists.linux.dev>; Thu,  3 Oct 2024 05:38:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727933907; cv=none; b=q4jYdOuZtzRPYTA2GU99m0JOTHDhlz9qkJGicIgkMxu40HgxUspqgFrzfIvhSSg3dPbjouxeA2/0f+cuxKo40qUIkcDeLaeWUDKTfwUgtQ0C6ZVT/9QNzQ2/WTfy8XY/FNsLFYBHp7xQRBannYEMTAvRDaQzr+b7fMi/njbjHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727933907; c=relaxed/simple;
	bh=OZf5T1dMlAEXY8gTRUkhfj9KW2sc8CDfqqYDFYBKrCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bt1MvjySeabBTnTo9pn7DvyNuAX4rdP3fkwns7LlG/gY709RMpZgVpu/GXQ9Cx8k8J3ZBQBvljYhiwwyFQkBLdjWqc8JdJz48V+qIsbEqnVgyeYw/Bg4lgo7Ii1SsbL5q90NGLXzPoaLciWQsA1J4Uh+iN3g5Hgkf2j1p+FIxho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nRq1ZVAW; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nRq1ZVAW"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2e0afd945d4so444863a91.0
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 22:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727933906; x=1728538706; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pd1LkdkCibllI1ORTg7Irg02FkDWiTpEyiSVdQth11o=;
        b=nRq1ZVAWSNU59jemwkgtCJ35ZmlpI/O0c2zSeG4TfwNgvFfFzMwaQ6/RgwOkBD/uLW
         CsHtbHLK7BudebeJHqgrPMUAUXHTN8OP6+reX3SYvTUFOb1XHp4K15dw8Npw9qlQpk9V
         HW0ps4FoNdzf7fLIaHW6IilRCGUvS7ZvEMnhy4iTVepewz8+zKl1K4AxKl8Lqh6C1fGe
         4YAm081GBN1io0vfxcPBx87du6+pkyerhWXE5znoSnITdEdmkEdb2qUDxCLID8Uzq7HT
         SSZDAhR4tCdCfsow8nrVTPpH1geR9mt3f+8Kn1Nh/R1vIWyO7oLueyrqj0gKyWlAu78b
         qlaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727933906; x=1728538706;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pd1LkdkCibllI1ORTg7Irg02FkDWiTpEyiSVdQth11o=;
        b=opyUbs3//3SIFTLEtTc2zIY2GU+uhFLZKpJvXYyn4uwtVSzk+fiwBMQi+jA9WEsRNM
         aezEMJBplHoCSAWWk8/I+n03E/oAyFBpA3irkJjvKEIWOQFoA6HIMdQdvWEgNp3LhZFe
         5JLy3jtBKW+AaNSRUxaN0YxeGZhi1iUH2sJRBD6aIc+tTogJUEQaEIxxGzZvx2qhxtq5
         XxV1O2TNRjOPwkannOXTC0/aa8KFnIdwBI0vgtR0A1boYxkBEoXeBov11qHVo/PaqGHy
         R9VFe/djdEuZplX7QFYdCotN+3DOD1OBkvPjE1WbhObHLrPTtDxglU4VyeAsvoCRQkzz
         d59g==
X-Forwarded-Encrypted: i=1; AJvYcCXrdBkzS0C3W4EbN05ZPOki2a0tmE9be2nHyF+hWz7hPE7tSqm6Klac1oxgytCCN0OeKCg=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq52NxiN0YNqPVPSgHGU5NTZdJmA1xVlxh86HK+2ncrh96dxpF
	0z5zyWIvnsm4xYyBLZTGlj+5NOP+TpX/xIOstUIIpyWHrFJbTBMxYJsulCJdug==
X-Google-Smtp-Source: AGHT+IETFJQL7nnoFerivVi2DQB/Jkm21orJvAufRoGLmUdngzWZk//7FXKGWhSccYa6K7py+Gxobg==
X-Received: by 2002:a17:90b:1e42:b0:2d8:ebef:547 with SMTP id 98e67ed59e1d1-2e18496989dmr6233335a91.35.1727933905751;
        Wed, 02 Oct 2024 22:38:25 -0700 (PDT)
Received: from thinkpad ([36.255.17.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e182634b11sm2043389a91.0.2024.10.02.22.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 22:38:25 -0700 (PDT)
Date: Thu, 3 Oct 2024 11:08:17 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH v3 1/3] of: address: Add parent_bus_addr to struct
 of_pci_range
Message-ID: <20241003053817.eycemurigrr6qy4u@thinkpad>
References: <20240930-pci_fixup_addr-v3-0-80ee70352fc7@nxp.com>
 <20240930-pci_fixup_addr-v3-1-80ee70352fc7@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240930-pci_fixup_addr-v3-1-80ee70352fc7@nxp.com>

On Mon, Sep 30, 2024 at 02:44:53PM -0400, Frank Li wrote:
> Introduce field 'parent_bus_addr' in of_pci_range to retrieve untranslated
> CPU address information.
> 
> Refer to the diagram below to understand that the bus fabric in some
> systems (like i.MX8QXP) does not use a 1:1 address map between input and
> output.
> 
> Currently, many drivers use .cpu_addr_fixup() callback hardcodes that

s/drivers/controller drivers/

> translation in the code, e.g., "cpu_addr & CDNS_PLAT_CPU_TO_BUS_ADDR",
> "cpu_addr + BUS_IATU_OFFSET", etc, even though those translations *should*
> be described via DT.
> 

It'd be useful to mention which driver has the mentioned fixup as an example.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
