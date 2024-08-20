Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6746318E34A
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 07:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724137608; cv=none; b=YwjkmmGQXaC7AUYr/Vfq0Sp6Qwt03by1DsgRLNM2PEU2bKEz96HoUzZXMP4kY6DybhkTypmCR3EYp5Eke7uldrLWvuvmFLC74tYUH2DGBhPm7UfwnaTDGApKspLhkOjHW2vF8iC/F5p7EuSZkhvnbTf/da48RL/BBq6Qwlhn0XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724137608; c=relaxed/simple;
	bh=RBmBgqN1/2wimlwuDiZGTR/Ixgo1CtMYbgT6F6Br6Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ACP/6g9vjZXxmxzFtYLgMoFatwBGdgLx50EreJ6A2OpU3zCrl0bNojDabZfOAR7eocGam+I9KRvMloA4ai6JasKn36VhjowrpIULPX8FJ3J8yTqurRKM+fxpD3nPDEFGTzNK6gau8gYuoPfTnzB2jMO/Yx+xlX0PXob0d4Z8qTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Rwaujv5y; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Rwaujv5y"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a864574429aso66681666b.0
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 00:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724137605; x=1724742405; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e5XzteqfPZidWAoDfu8CD574QN5U/gDbKmwzV72JOdA=;
        b=Rwaujv5yBFSHd3W5wD3rv4tuTbrR56vdtEPtRaFM30zGwtwERpAKLfMRaxvQ4ypvHW
         WlCc0YdQrGnv8dJUMUYibeoC0ww6GpPZdcFlDA7kSVFYy63d+2k6Cc5uKxhcBhwVDSGl
         gMpAgyQSxhdC4xFx08GaJK3BSzSDO/K2D9OcOonk54RbRor9pcUdjPC1QjA9Lwf7sq0P
         nfJVz0FpbSG/f6k2MceDrRl4BMz7IXyAxqpJunE67YlqRHFdTd9uHh00yQBRDGcA6j5X
         8rgTMDxzzROMbuIqOSNlSTLFGglW/iHr4FV4hKIUEkZs3jNL1c141W06ZPV6534z5605
         8cUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724137605; x=1724742405;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e5XzteqfPZidWAoDfu8CD574QN5U/gDbKmwzV72JOdA=;
        b=tqJn9n5B9SR6aHBsOExPF/u6w9ATCoPQyceuB41i01aDRZHzMW0sILyEt5odNVVB+2
         IzYD7/ZaNxtLUDLS5DgjCkkCpSXZrwx6NZPRb+PWgGD1LV+1NTSNhc2OEh2KRmnR4bN8
         h3iBCjlQ9b2H4uGPr9vADYUOrGpJI0xE5ceZAQWZbSr0ESEN4a+a6dewsUWI2WegGg2p
         z3To+FY+vb6efTlTV4qnbU+E8NT6Z5gaLrR9zpqb+DUcLh4lSPOwKCJeGSsI7ZiUadlC
         H3opdh5mGxuh80gpjn6s3qnDAAsGpwNdy67SEwizvtMe0Nii+yG8VUmis+yUzfpDBGA8
         y/7w==
X-Forwarded-Encrypted: i=1; AJvYcCWeAfZUsrI0hyjn+4xOKQKGEFlhA0IVewj3RXrzN/Dp4rpH8hK5zEwMkD8FohT2KUutIcVYVIkLdL0C9bOec8L8lRQH
X-Gm-Message-State: AOJu0YxwG/mRz/k7Vj/QQnt+x9gcHxGdOUQwrcRhhjGpRtXTsVl9STug
	JWZUncnZiRUxOxfHkTYtlS4ZX8q/OV8nNnNMtCLGwp2PVUwQwI0/C4z7lEm4
X-Google-Smtp-Source: AGHT+IEstC0d2nHwmzLD9xJbJgCd+PEu3VEWl7DX2uj2D5dGQCq0bpbLjR9G9F10l7LskAcu5QNBOg==
X-Received: by 2002:a17:907:d3ea:b0:a7a:97a9:ba28 with SMTP id a640c23a62f3a-a83928d7a91mr936572066b.26.1724137604359;
        Tue, 20 Aug 2024 00:06:44 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a838394669esm734318766b.143.2024.08.20.00.06.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:06:43 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:06:41 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 2/3] PCI: imx6: move the wait for clock stabilization
 to enable ref clk
Message-ID: <ZsRAgfKJ5VZ98AZM@eichest-laptop>
References: <20240819090428.17349-1-eichest@gmail.com>
 <20240819090428.17349-3-eichest@gmail.com>
 <ZsNaeV29s913HU6E@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsNaeV29s913HU6E@lizhi-Precision-Tower-5810>

On Mon, Aug 19, 2024 at 10:45:13AM -0400, Frank Li wrote:
> On Mon, Aug 19, 2024 at 11:03:18AM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > After enabling the ref clock, we should wait for the clock to stabilize.
> > To eliminate the need for code duplication in the future, move the
> > usleep to the enable_ref_clk function.
> 
> Logically, it's better wait in imx6_pcie_clk_enable(). But not sure why
> it can reduce duplication.

I'm using the imx6_pcie_clk_enable in the if statement on resume for the
i.MX6Q. If the sleep is not in there I have to add it there as well. I
will check if this is still necessary with your changes and if so would
update the commit message.
