Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC2564084D
	for <imx@lists.linux.dev>; Fri, 21 Jun 2024 14:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718981264; cv=none; b=HB01NmWx46eifjK2CZgevOkDpX0yFrB+dxU1Ef1m9ko7VE1gj+CR2ZKMkUd8nb/vIQsvOw0Npe2Tjee8gPCiTWlFpsuN33G3erZu2kQi6HEeNmzs7WxKXdZn8wHCmLrvZRR1TLmHAB17/7u2AzfS1I468/XO9PDPBzQQy9dlzXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718981264; c=relaxed/simple;
	bh=eRz2vQgwJ1A+7iDLhmZYJGuIv7BJ+jvJRNy3WuWSPpo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqQcGSWJGsbxfYrn5jufNbEytmFLJrJT+I+OXnBZZrzx/Fr7RFxmmgZzzLB9Ma715txXFl940R2lSHojAlnoeGavUSyVb4YCiDlqVN6+suV+5oSZO2/FFpbI0XwBCJ5rna4tiu0pl0amibfElmCBkRSw/jgWJfxJnqyPzVQj3qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e3M8HiEm; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e3M8HiEm"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-42198492353so18342955e9.1
        for <imx@lists.linux.dev>; Fri, 21 Jun 2024 07:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718981261; x=1719586061; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/z44+Phcyrx8OYVcHmZa41w4yuoKh8jjDFK/DcSA2mk=;
        b=e3M8HiEmqXlP2X7j2jGMIAbKpwHyAsAw1QRIpIua8UvAFN5bGTpBAXGxLaX2A4NF2Y
         ViQOVAVTWrrrbT8lBbK2iN5QXohdKoa80/6Gp/0zp+fB3oe6sQQ8hp9i2nB7cOV+/5ZP
         KuGrOZCer1f0x/ZabqJuqrFfOU1+2STYKPcrV0IV61mDGJx2qIXqLS78G9iFPXSu1xtB
         WmCR2j8SkiAjAcDCGnki8NO+vIQcCxpAGANYmaUeQVs7KcQBPTWeDZhpZxUtZtVr0vWV
         v/ezDBvzRLPvF5yLoPAn1FBlt82TWwfVqmk0cyIXYptIWzwS800QmOBBoYJi3p1Ea6y0
         bqWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718981261; x=1719586061;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/z44+Phcyrx8OYVcHmZa41w4yuoKh8jjDFK/DcSA2mk=;
        b=AOAhwLnBhW4rAXlhVcqBrs9nl2uuf9M/PysjGKuno//wogkMtooQyu4K30IOYAoSIG
         /HqbzVSMF9ue/bP4A0IcxznZ1svrjNIrj9FL3dihm28Dp8LxG2PqHi4f+brYXNqWDDNp
         +zQ+uP1Scd6iuclgpsKhfEjYZpR1aOHeTSlQlMbjkLqT8/tvWZUPvLoLCaQzVY+LVH56
         FD9l2cZHGSc0zLgEaBZ6fNv+WHfkKBem1T/jRytbg4OM92kvkRbIH03cOfvWJJBOu598
         qMBH/S3n2uA8ogHn9nKAe6vf0FL0YR80RZwI3dRZSnw+MyaVqTEyaxvwiBcBUeZ1055X
         2bAg==
X-Forwarded-Encrypted: i=1; AJvYcCXjdbWTwDrW/+LJqm1ocKJUmKF+jacrMn2NVzWtax0uPhMWF8IGmpiMYu0oCIJ37HvczZvTGIVNKtRK2wlFzMBuGxBm
X-Gm-Message-State: AOJu0Yw2N/Dqwrx0LEEz4MbtPocYL1JDhWrwHjpYb7bSBeBzMQ6nhoew
	isXMayjRZygDcDjK8OKaA21VCOgIvXJ/inFF2Mnp7xYCLfo+czr/
X-Google-Smtp-Source: AGHT+IGkUiQ8/JHxqC9cXg/EgQkUBEudQn16W8dQas9PKPraVTUmyUfCQHL+5/9JPk9VV7HjRS/MOw==
X-Received: by 2002:adf:f98c:0:b0:35f:20da:e1a2 with SMTP id ffacd0b85a97d-36317b7d57dmr6247272f8f.30.1718981260653;
        Fri, 21 Jun 2024 07:47:40 -0700 (PDT)
Received: from skbuf ([188.25.55.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-366389b88easm1942929f8f.39.2024.06.21.07.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 07:47:40 -0700 (PDT)
Date: Fri, 21 Jun 2024 17:47:37 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev
Subject: Re: [PATCH v3 2/3] spi: dt-bindings: fsl-dspi: Convert to yaml format
Message-ID: <20240621144737.l7bwipq2i3grspxa@skbuf>
References: <20240620-ls_qspi-v3-0-1a2afcf417e4@nxp.com>
 <20240620-ls_qspi-v3-2-1a2afcf417e4@nxp.com>
 <20240621124211.pueymngpq5luokvj@skbuf>
 <ZnWQpa+rSXUhxCn7@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnWQpa+rSXUhxCn7@lizhi-Precision-Tower-5810>

On Fri, Jun 21, 2024 at 10:39:33AM -0400, Frank Li wrote:
> On Fri, Jun 21, 2024 at 03:42:11PM +0300, Vladimir Oltean wrote:
> > > Use part of Vladimir Oltean's work at
> > > https://lore.kernel.org/linux-spi/20221111224651.577729-1-vladimir.oltean@nxp.com/
> > 
> > Hm, you took part of that but gave no attribution? The portion below ---
> > is also discarded when the patch is applied, so even the link is lost,
> > FYI.
> 
> I am not sure what should be added in comments? 
> 
> Ref part of Vladimir Oltean's work at https:// ... (I am not sure if allow
> http link).
>  
> Or coworked-with Vladimir Oltean ...
> Or use seperated patch for your part.
> 
> What do you like?
> 
> Frank

Well, it depends on how much from that work you end up taking.
I would recommend taking all of it :) and completing the unfinalized
review feedback with your work, plus some additions like the standard
CS timing parameters. Then, you could keep that sign off chain and add
yours at the bottom. At least that was my approach when I tried to
continue Kuldeep's work.

If you take a very small portion, I guess you could at least move the
link inside the portion of the commit message that remains visible in
the commit log.

And for a significant portion, Documentation/process/submitting-patches.rst
says you could add Co-developed-by + Signed-off-by, followed by your
sign off.
