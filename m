Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E824176256
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 11:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718969167; cv=none; b=A+O2DHhOV6yWbGLQfMMo393yJZMabjTOghVBQ2c2hxWwlhzCWPz2GJq4Gj7sYIupw6lLEl8myKZvK/6bwXLwUkDOFx5FG1QOh/6iekI4qhIEjaXITJWzQFEr0SKMCZLbdjpjujqlF7X69t3+bfz2DP41wk8T5qxbNWxbkEYhfvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718969167; c=relaxed/simple;
	bh=Q8DyGdBcYAgq64z9X9TWI+/sf0rsMrpXcgbn82Vmdc4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FHJfWWm1GJHqy368+l5/54ZtXPdUoKAxChIVRlp7YUvVgJhP+D/G3QbQy1eENayQ7kfPN6D/J8hIGAThHmBkqXzG6yZ1Q7qHwWmKid7KXr/nNtbDUNT2/vBnisPoXmUnlSyssmi548F8ezFx+2TAT3rQZ7a3g/mWEEawsnEnDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FzX64Vdw; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FzX64Vdw"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a6265d3ba8fso193239666b.0
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 04:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718969163; x=1719573963; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=i8sLZv1n+Ku2QMjcmS+4EdIPRc6Cam45MqmcajWwNAI=;
        b=FzX64VdwwCMCbp9heimzzHT2e/usvZGgso56gCAbM4MOCIt47TqNjom5OUTpqjvqw6
         DMKj/NR6zi9upA+tFzr5dSIh5WURfO/NvOUCZ/UGwDrjhObPETXn1fhJjb38z/0InV7A
         3oNewqnRTUTnjQcDIKZSKssStgjOCcgZ0O37yaoMEDgtFgo0mSile41UnkH3W9leeTHV
         kDepL+JBfE85YkLPi0kszgagVpf6AXJdt6MwjW3x8QPqvY8i1Qnq0Cjl/Ury7mopUYpw
         dD8ppZwDa1F0hqNS8oQ0iCWgnjJqD3DXJ3cZdgKsKrHnW5fqRrK57b60B+MbTS8Ez0y+
         l0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718969163; x=1719573963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i8sLZv1n+Ku2QMjcmS+4EdIPRc6Cam45MqmcajWwNAI=;
        b=QvUXg6zMGgXw+IOGlvqbfgJtpgq62rXRPT/gcOT1onxWL/muVtXx47mR7Iqvu9n2uf
         cHgshmmjr7lFjM0nsvCoF6Zv2VbinMH1wULrJfVCXl07L4ZfR0yxm2l02VjtPua5xHPo
         CznczBlG+N18zVtwylS/fDULp3D6JIBqZ8rwDfd+iuM/P1+SbJ8wFQ+7NHtp7p0HLPYU
         EbFGDTPtEA2nGj57nJ+bD9x8vvN7l9d5GNC+NXbPZL0JzreWqvYcN6LqAHF01Dbj0OBC
         mmdCssm3jzG2tewbqHbeuvChBpxGdF5Dn6KdTvHgxZGmQsms3anYOrcHI48twMxxmKpZ
         T+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxtrZYYXOOBP3cgpimTn6I+BH2C+M403C5ats8M8yVcjgWrsMGPSSt0/zuyc7N2rlnuFfrxbGpD37clZnKLUyGRK9F
X-Gm-Message-State: AOJu0YzptmhLG+G25kJdHQjj9fV7I2Bj8G3TJ4TOb+Zr3pRegGaBFnjP
	W/7uEsN1sRcjD3GbCLU8Q31+jHFo/Cd0W25ZZFxU/QZU4JPG7oCtbZh4OWJj
X-Google-Smtp-Source: AGHT+IEyjIILM29yLfV/vXCYggcQVFh0n6Mx/M2e70SYGzH2rtFIwFqH2zYjTAuliqRLT+DG1jMAKA==
X-Received: by 2002:a17:906:d283:b0:a6f:6701:cd5a with SMTP id a640c23a62f3a-a6fab643427mr420372166b.44.1718969162970;
        Fri, 21 Jun 2024 04:26:02 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a6fcf48b17esm73795266b.88.2024.06.21.04.26.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 04:26:02 -0700 (PDT)
Date: Fri, 21 Jun 2024 14:26:00 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 1/3] spi: fsl-dspi: use common proptery
 'spi-cs-setup(hold)-delay-ns'
Message-ID: <20240621112600.sshdjicucwtigq64@skbuf>
References: <20240620-ls_qspi-v3-0-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-1-1a2afcf417e4@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240620-ls_qspi-v3-1-1a2afcf417e4@nxp.com>

Typo in title: property

On Thu, Jun 20, 2024 at 12:58:27PM -0400, Frank Li wrote:
> Use SPI common DT binding properties 'spi-cs-setup-delay-ns' and
> 'spi-cs-hold-delay-ns'. If these properties do not exist, fall back to
> legacy 'fsl,spi-cs-sck-delay' and 'fsl,spi-sck-cs-delay'.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  drivers/spi/spi-fsl-dspi.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
> index 0a2730cd07c6a..7c1f8af9d215e 100644
> --- a/drivers/spi/spi-fsl-dspi.c
> +++ b/drivers/spi/spi-fsl-dspi.c
> @@ -1018,11 +1018,15 @@ static int dspi_setup(struct spi_device *spi)
>  	pdata = dev_get_platdata(&dspi->pdev->dev);
>  
>  	if (!pdata) {
> -		of_property_read_u32(spi->dev.of_node, "fsl,spi-cs-sck-delay",
> -				     &cs_sck_delay);
> -
> -		of_property_read_u32(spi->dev.of_node, "fsl,spi-sck-cs-delay",
> -				     &sck_cs_delay);
> +		cs_sck_delay = spi_delay_to_ns(&spi->cs_setup, NULL);
> +		if (!cs_sck_delay)
> +			of_property_read_u32(spi->dev.of_node, "fsl,spi-cs-sck-delay",
> +					     &cs_sck_delay);
> +
> +		sck_cs_delay = spi_delay_to_ns(&spi->cs_hold, NULL);
> +		if (!sck_cs_delay)
> +			of_property_read_u32(spi->dev.of_node, "fsl,spi-sck-cs-delay",
> +					     &sck_cs_delay);

Keep the 80 character line limit please.
