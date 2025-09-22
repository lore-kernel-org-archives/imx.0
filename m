Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DD122425E
	for <imx@lists.linux.dev>; Mon, 22 Sep 2025 20:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758574044; cv=none; b=mz6TZI+KeuWwUBUybSQeFpRc/1lH1u4LMAbnnvJ/4bYhazysOkwQjOprIRAEsQxgKvt7qCuJF8s6LPrDFpuCPz8CHYUauaJ9UbEgk1SbqeZ6UWXZ9Xs/cZSooSI/zdX75bJJkAUN1G60PadSp8xRpXpMwNIt4KFCG83AGyl6kkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758574044; c=relaxed/simple;
	bh=yaYM25E2I7kWwhhZKj7Y6d0J3R4l+LJDu3rAVcZ7Tww=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SK+C2WHwEFh0Pl6yW3p3q/aCP1dWW8ybrYXM8Jz1MurR1HXJOesg/ZinMzpcF/RcD1RyLBr8esU8wJkzzuMu9D4jP60XN7UqO4ilIFmWhs0KK/RAd9DAb8GCcOQvMpk4JiP6MJP1g4um6fTKTmKTfOYUUI0GRMKeV5gvS9yYqQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MbhRg5mI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MbhRg5mI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45ddc7d5731so33721205e9.1
        for <imx@lists.linux.dev>; Mon, 22 Sep 2025 13:47:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758574041; x=1759178841; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PfSwXekC6IkZ+kGhNkKolv5g+HvkF8QkaHCWr3SNIrM=;
        b=MbhRg5mIrChusJG7Rk3HaUrfDvt/KYvVQu/u593avebjNTvT1SF/bsdUtNKcxNkMpE
         SDX96ZW8lMIQhFCOx+yqcQjj7NOd/1NfaGYo/hwyMRPMEu18t66FY8p3cehqikqhFynv
         7GOC+7HX0uF70b1JnCUrSx2OaGDSzsC2qwoQsYX7OsHMRUyuo2PP/ac1X+ADSm1AjTr8
         6dlLJNLdnFFyOxohHpJ8ceOXtHCaI/3u20uWclKFycItV2kANylqrBEIeeEUEb1Otvzl
         N1aAY769y+qW/I1IBzs4ZJLXOSqtUOI8nUtdtG4YC5lBPShzbzlCfNLRJs9EiRCqIQXf
         78Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758574041; x=1759178841;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PfSwXekC6IkZ+kGhNkKolv5g+HvkF8QkaHCWr3SNIrM=;
        b=dRgL9cl0+rzwOGkeOgrC15IulKL6lrhnOk1BaV/rWVVNjNfiz2rRGldVOARvSht74t
         wZm6kZweSLW0utThek9UnSQ+K5bujy2DUwVwCSjgomfS5dNq/onJ+E5BaRf/28bLgKC1
         NIS77JC3pgluMdQZ36Q32vJIAeb/JYD8F8SEL8PKTIyz3jp9FEG1V+k1Qwm9uDjixwuS
         qJJAjkTwRTvEtAHidcX79OoQwJK/wJ11ACNDpAOD/1QS9AOoQT9eKWS4GUA2eYWsV8Ab
         PFktiyLlGsMTfnPaNu3wn7kgA0ZqnkW3O0ZdmR736YsI+SGxFph/3n1esQuNPbM0rGou
         yR/g==
X-Forwarded-Encrypted: i=1; AJvYcCXQed8L0veMI5PecMBFZ8Z92CNtVzmhEzpPKSWMTlbG8JCntjU3PZNh/XZ4XYq3ql5ofs0=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx73kKo0vYPKI4YvdynN2lR2gJLxAdacx8p43+mJpIn+jPjaSLd
	Z6C0jS9suSzQ7U8qFniMn/YcwooZpE/KeAsmyze/N2p+ds6KJqZn/Yqj
X-Gm-Gg: ASbGncu25lf5V0G/Y95btb1vlnY8raw+tfKx9rbYEl+sJ6tlYgnDuEYjIcpfD+T8hYk
	/e3iS5YFvl1tNBYF8uxA5mv34ZCwnlXbelXtwL53ITa8WgaWw6NuCO4fZfrocvApt+Ed0D0dvWz
	HVpUvCozVORFOes+O4y6OygBy2ofLaNe5PmLjwndgWuoRAXFeln5OLm0U31XOZBefxbx9/Zmunk
	UsJA5pc7EUDi1jTZ7NcGcFHJQkB9bY5qWzJkxMzsn/sxrlQBrsRfPAsAvHOt5bW8Hb9lUWbzVNJ
	WyPHA6MeVdXa5U32vPvZTO21jrwf4vDrxWIPfhWrJ2QHa7j3Ton25mY1PXQUGdbIePr9iF4gH40
	Df+nNuDDauKPN9ZADiHSuS3nENC9FEzTNE0M3bNLbZvx7uJaglbWQbhb0Iv9OLuJjrXRGEjsAaU
	TKWpTEPg==
X-Google-Smtp-Source: AGHT+IECCjDDAx3uDMYDGlfUfhS/ShZ0dPDY5PytWnVtywH6kn+8b3I6KI51B2Q05ThPYpKMFrKCwA==
X-Received: by 2002:a05:600c:1390:b0:45d:e28c:875a with SMTP id 5b1f17b1804b1-46e1dac98d2mr2034855e9.31.1758574041182;
        Mon, 22 Sep 2025 13:47:21 -0700 (PDT)
Received: from Lord-Beerus (net-93-70-53-177.cust.vodafonedsl.it. [93.70.53.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46de4d67625sm39840395e9.16.2025.09.22.13.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 13:47:20 -0700 (PDT)
Date: Mon, 22 Sep 2025 22:47:19 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [RFC] arm64: dts: freescale: imx93-var-som: Align dts adding
 missing components
Message-ID: <aNG110oUmn4Ap7c4@Lord-Beerus>
References: <aNF1KOCs0eHL1Njb@Lord-Beerus>
 <CAOMZO5Ay87qRmWoCELRqCkfZtK+28bAe=0Lvwhzn3RCRKyjX=g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMZO5Ay87qRmWoCELRqCkfZtK+28bAe=0Lvwhzn3RCRKyjX=g@mail.gmail.com>

Hi Fabio,

On Mon, Sep 22, 2025 at 05:43:15PM -0300, Fabio Estevam wrote:
> Hi Stefano,
> 
> On Mon, Sep 22, 2025 at 1:11 PM Stefano Radaelli
> <stefano.radaelli21@gmail.com> wrote:
> 
> > Before preparing the patches, I would like to ask for your advice:
> > should I send one patch that performs the full DTS alignment (describing the
> > patch as an alignemnt of the dts with the actual hardware), or would
> > you prefer a patch series with one patch per peripheral (e.g. one for
> > codec, one for PMIC, one for WiFi/BT, etc.)?
> 
> Sending a patch series with one patch per peripheral is preferred.

Great, thank you so much for the info!

Best Regards,
Stefano
