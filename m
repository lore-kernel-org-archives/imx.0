Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6931B4879B
	for <imx@lists.linux.dev>; Sun,  3 Nov 2024 06:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730614998; cv=none; b=FujioaCM5UDlibKLQDJjAqvGbikrkJGtdtt37xEqFhnptzISQsHlagPwvhJ21lv9xxnPjaRr6ap2zX2fEXBSdzFbz/DMX/2SoD3sZnN9EEm9Ap9cp3VWtEAYbfzcnfDt7NM/5ygMmIy6dAhGZtQ0cipPxr51xho3vgyNDQ4sVQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730614998; c=relaxed/simple;
	bh=Q56+5QNfRtOM8EEn8fU4O4IQMvKqEAw92GjD4833tHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cWVEGLREr/QZ8k0f/aOhdH8pSEo0Y8rTiJQxOMBG0AOmtXG9gQ0ltoN3vhLtXlfsATEWK93NPo3j/MFburTVF19MRb3Qe02KjF9ZsK81Ojva6fn8p64/4c2RaW7KrRlou2JTizFZWm4Puq/t/EtjGpitQVu2CeJbHtDBuFDdZA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwOmq6kF; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwOmq6kF"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-71e5a62031aso2600074b3a.1
        for <imx@lists.linux.dev>; Sat, 02 Nov 2024 23:23:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730614996; x=1731219796; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Qhm+LitePBXQsySKsmg7fuQgH8MGcEsYsJ0eyWGhL0=;
        b=PwOmq6kFi25l0n++fUJ84I+YXYRyDpdmp7l4cKXAnG+H9iQ7WVl8qpLhapyHl3Wxol
         CR/3xC9MUHKJWc+mG+tCvf4UVW2o/tlE3xbFH7wmSqhKWMyIPO9O0YhrzhJ2y6UgEEw7
         /3C1QdFErBgbL2ZfT0sVdkOZydN7W65yENoNcVH4j2ff2RoIC9PTyQW23Av7i2uUC06D
         uPdCLYdUs0bsgFIxIZEu/g5NU+N1aSxLP+8P6GYquHddjPbvWTsAeId1U+VA/H++CIYR
         2Vz8QwRK3bPEqN9/l1qVG848VC+t0UHp6Bie4OZbkt9EZuN1b/7Hzraks+XVUctybS5o
         cDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730614996; x=1731219796;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Qhm+LitePBXQsySKsmg7fuQgH8MGcEsYsJ0eyWGhL0=;
        b=NgbEFsysa9G2FNeXO9/N3T2fU2dK8Dhfw6WdFozfQJF9+lkKecrWx3uI/Jy0dkniIA
         p7eNKeMhR36gGx8q4hmV9bTbssYEhymEXzZWhAHbYrE2pOYPrmEwvvidES/0PNfcwYCt
         bS0DVjqm18RdA9pD5YLFj74NTevanr5K37fGTMWftTpvHWJ1gbwoI4RgtsvoEN2TWW8E
         1+6sK8UlowF4Lgwl0pUfiTgzkD3v9f0Scl57E/EK/dCn8p/4udCViu122WWNqzuiRon3
         a9++cibJ1LkM3LN5SkKS97hSq/3GziFG48RQl3P0wRlm8cpnTNf232QiK89kVJuRD7uN
         LCZg==
X-Forwarded-Encrypted: i=1; AJvYcCX8BpZ9GoGPS0yXBbcmUpG7jAavH6USYUZ4rD+FVkcdYgWPO5EgocETfz3gS7LGnt0+9Uk=@lists.linux.dev
X-Gm-Message-State: AOJu0YxV6YmK+t54PTm30IE2gcsyvitjLxAZXGjGryY1VlwL1ilEljsp
	rmq3BEdOFoWTlNXESUqLICuwNK+7V+J4YWUtViCtvyRggjh7XiJm8zGuvybaPg==
X-Google-Smtp-Source: AGHT+IG4AFUZuM3edwnngjVKBU1jcTHodIw4RW2EypyrkFK7ELfPVwTprbngwCPD9smyqFMmdBqcAQ==
X-Received: by 2002:a05:6a20:d70b:b0:1d9:77c0:61c6 with SMTP id adf61e73a8af0-1dba50bad20mr13962806637.0.1730614995661;
        Sat, 02 Nov 2024 23:23:15 -0700 (PDT)
Received: from thinkpad ([220.158.156.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7ee455a4994sm4819369a12.43.2024.11.02.23.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2024 23:23:15 -0700 (PDT)
Date: Sun, 3 Nov 2024 11:53:05 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Richard Zhu <hongxing.zhu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, alyssa@rosenzweig.io, bpf@vger.kernel.org,
	broonie@kernel.org, jgg@ziepe.ca, joro@8bytes.org,
	lgirdwood@gmail.com, maz@kernel.org, p.zabel@pengutronix.de,
	robin.murphy@arm.com, will@kernel.org
Subject: Re: [PATCH v3 2/2] PCI: imx6: Add IOMMU and ITS MSI support for
 i.MX95
Message-ID: <20241103062305.6cqftpv4bwneg2mo@thinkpad>
References: <20241024-imx95_lut-v3-0-7509c9bbab86@nxp.com>
 <20241024-imx95_lut-v3-2-7509c9bbab86@nxp.com>
 <20241102114937.w7jt7n7zr3ext5jo@thinkpad>
 <ZyZg1nlSPf5rvm8q@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZyZg1nlSPf5rvm8q@lizhi-Precision-Tower-5810>

On Sat, Nov 02, 2024 at 01:26:46PM -0400, Frank Li wrote:

[...]

> > > +
> > > +	target = NULL;
> > > +	err_i = of_map_id(dev->of_node, rid, "iommu-map", "iommu-map-mask", &target, &sid_i);
> > > +	target = NULL;
> >
> > What is the point in passing 'target' here?
> 
> See https://lore.kernel.org/imx/b479cad6-e0c5-48fb-bb8f-a70f7582cfd5@arm.com/
> Marc Zyngier's comments:
> 
> "Perhaps it is reasonable to assume that i.MX95 will never have SMMU/ITS
> mappings for low-numbered devices on bus 0, but in general this isn't
> very robust, and either way it's certainly not all that clear at first
> glance what assmuption is actually being made here. If it's significant
> whether a mapping actually exists or not for the given ID then you
> should really use the "target" argument of of_map_id() to determine that."
> 
> See v4 https://lore.kernel.org/imx/20241101-imx95_lut-v4-2-0fdf9a2fe754@nxp.com/
> 

Okay, thanks! I was confused by the fact that you never used 'target' in this
version. But v4 clears it up.

- Mani

> +	target = NULL;
> +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> +
> +	/*
> +	 * Return failure if msi-map exist and no entry for rid because dwc common
> +	 * driver will skip setting up built-in MSI controller if msi-map existed.
> +	 *
> +	 *   err_m      target
> +	 *	0	NULL		Return failure, function not work.
> +	 *      !0      NULL		msi-map not exist, use built-in MSI.
> +	 *	0	!NULL		Find one entry.
> +	 *	!0	!NULL		Invalidate case.
> +	 */
> 
> 
> >
> > > +	err_m = of_map_id(dev->of_node, rid, "msi-map", "msi-map-mask", &target, &sid_m);
> > > +
> > > +
> > > +	/*
> > > +	 * msi-map        iommu-map
> > > +	 *   Y                Y            ITS + SMMU, require the same sid
> > > +	 *   Y                N            ITS
> > > +	 *   N                Y            DWC MSI Ctrl + SMMU
> > > +	 *   N                N            DWC MSI Ctrl
> > > +	 */
> > > +	if (!err_i && !err_m)
> > > +		if ((sid_i & IMX95_SID_MASK) != (sid_m & IMX95_SID_MASK)) {
> > > +			dev_err(dev, "its and iommu stream id miss match, please check dts file\n");
> >
> > "iommu-map and msi-map entries mismatch!"
> >
> > - Mani
> >
> > --
> > மணிவண்ணன் சதாசிவம்

-- 
மணிவண்ணன் சதாசிவம்
