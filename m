Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47A514831F
	for <imx@lists.linux.dev>; Tue, 25 Jun 2024 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719318775; cv=none; b=JSfZzgEWKp02+LwtYXmGMQJF3NFHgI5Hv496C6ebomBkwxsPoFHhGM3KB/WPKw/THr9Twu3WINgjteRohnSAuFUTfQ+dHL1mxSzyTYaWo8VKo2/UrC5xZnj9dYEOE7FWN7m3p76YWQYild0lsljF6gODeV95z6r2Hbrhd2Cyphg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719318775; c=relaxed/simple;
	bh=jax1LOTh2JiPAGq4tsyp2HMkEK6vupoll6oTv96ic3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BAlOR+Lir71zrmC5JVLGrV8yCbK0A9/XWrv1VbMi5YINEvKjKRAsZnOTKlYVUc/uti3GpnaeqqOcRAWeMGQD3V5LTPINkqYZPeflRVNmM+DK+0w1FCwwckrdykc1Jpi/iy2wTWfpEy5Lj55prEwXr8GAyfaCYznqrLRU95IZ3X0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PBuRjD8u; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PBuRjD8u"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52cecba8d11so946749e87.1
        for <imx@lists.linux.dev>; Tue, 25 Jun 2024 05:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719318772; x=1719923572; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vJG5YoibKlpkyRo0y3DdOvaMl7oM0h1j0RRMvKszlts=;
        b=PBuRjD8uFmv9XaesLjTlY52cCE3eeW7f+pO+ltK8i00IsImLJB7UyuCA2S38IeQOuK
         F2A2z7PcWFQM6qgkoXfId+XJ6PNbaZE+ZLyb/CSC4et8MifsNDKZLmnN9zLoV6VAaZvN
         dn3FeZWdcEH6sXF33BcemdM2muxSfbZ2FmkeVSx0x0XSIPnU+MWJVuT9p6SEoHG2Tc8q
         R4rgpR/p+k4xdKvs1okHzi+xWOHJf30ULAGq31ecpZsVeVrEw9wn+GThBPIaOK4ARW2/
         v+ILD7xiQ+okD0iJzHTgJrmn+wAWmRXwlsAFPVxoJhFEtTPz9zPPFXkZskRwiBZbyHBv
         iXUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719318772; x=1719923572;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vJG5YoibKlpkyRo0y3DdOvaMl7oM0h1j0RRMvKszlts=;
        b=pvoiATGjw8G+iUK8fa1yQge7ikJ/Eq5d0H1I1+tsV7EAc2vmOk4mjh3xOwfJeIrhWx
         3xZRXPLCrLXfhHUWbc4l7a0tNf4JwBZvNcrLEYAhHLgyHf5qBjqBEbdkCcYDFqq/QZ1I
         4Z0wQMSuHzKMF/bzSwryxmPBb4waXSe6ZfOkB72JDxn31tYWehv/TdSwG4vu8SFczcFO
         8Y576Yv65FnBXI559RGicHSwpMQiU6RduAY7K14KYQ9zSebuude4kjruPZbkoEwc6JDC
         aAGzfuMyo2xEZSJOhrYO09eqdLYVMGqpF+ccv+L2uNr3+xkb2U28rxOmtXO8SCBrx6zx
         4T2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrTr1+Lz2IeXl1PPrJvmChgq3zrv2gIOeywN2hi91JALr0MEP3ZHRSijqIRve7qekp/r6W7JE74/bvhcSgleJafB2S
X-Gm-Message-State: AOJu0YyLxwzH/EtMkZzwGX3It7ozQqTfYsDOzYZpQXXv53poXTiNnVtD
	2u+2IBdsH9Fc9S9MUbfPCtwpHXYbd/PsPf1CB96VdKu0kjwRoS7I
X-Google-Smtp-Source: AGHT+IHrq4jVzTqZE1uNfWg9tb8O22LmO6dOjioBxfQu7ZNX2sgEezbk18ODgnKQ/Wh+Kz6njYn/XA==
X-Received: by 2002:a05:6512:138e:b0:52c:e08c:a0dc with SMTP id 2adb3069b0e04-52ce185f753mr5189826e87.51.1719318771577;
        Tue, 25 Jun 2024 05:32:51 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-424817a9667sm168583705e9.15.2024.06.25.05.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jun 2024 05:32:51 -0700 (PDT)
Date: Tue, 25 Jun 2024 15:32:48 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v4 1/3] spi: fsl-dspi: use common proptery
 'spi-cs-setup(hold)-delay-ns'
Message-ID: <20240625123248.2svpybglw2ydd6gg@skbuf>
References: <20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com>
 <20240624-ls_qspi-v4-1-3d1c6f5005bf@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624-ls_qspi-v4-1-3d1c6f5005bf@nxp.com>

On Mon, Jun 24, 2024 at 02:55:27PM -0400, Frank Li wrote:
> Use SPI common DT binding properties 'spi-cs-setup-delay-ns' and
> 'spi-cs-hold-delay-ns'. If these properties do not exist, fall back to
> legacy 'fsl,spi-cs-sck-delay' and 'fsl,spi-sck-cs-delay'.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v3 to v4
> - check spi_delay_to_ns() return value, which may return negative value as
> error code. It will be very big value when cast to u32.
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
