Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1640C33D6F0
	for <imx@lists.linux.dev>; Wed, 22 Jul 2026 11:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784719128; cv=none; b=K2QUJTqzqCa7x6LhE9Cj5H7Dq8zhx9SqI6XgCv9FvND+QQYkAvD+rprLijuFKIKzukx5mwLe8aR/UfmQeAqZfiOsoza0RZfkQ6a/OJF9JkcVeWRMAN32O9pD401DzQDVkqJiE0tcF2NqxdfkBRbpLV1tx81JWFgmkkxx4S74/Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784719128; c=relaxed/simple;
	bh=m+5icXg44L8UoXTkQAQ0uexZtogw0DmmjbuxXLmq23w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JUeNsvA6PFbeQ7sUzeazOUAJN5t3NbnNYivTnEPgxW1KDQsd+Yfa5ZAtEN8FaMCaR8RRE5TjP/yEPC/tS6jobpkpdLvSPa3VXZ4h6kxdgD243lmtkaGmfmpcBJ0ElJ4CsumrYRdzzrFzrgzDZpHpvafXLfOzzvJhOTC1kPZAk+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=isv23XNh; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="isv23XNh"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f707e5d75so2387221f8f.1
        for <imx@lists.linux.dev>; Wed, 22 Jul 2026 04:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784719125; x=1785323925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=isv23XNhNphttWFYjdgucgMATtM1Sr18yKh/WKtlmkD7mI+GHDDx6sLcb/IAwefwP9
         NsuF+6fsslUJm+DKgYDG/Gsz6kJAj02yhZ2rx0cHY17WB4j1neXyB+2UMLhgiLnpXxxq
         eZvUTzFc6b7KshnjC84d6lUWWOGMX1oIDugFvUENs525U+1F2BQnrPlI9eQv/4KjvERc
         TKc8aiA+/llIt7TQzy9vmwwrhnFw1yizifDSPeLBPH7qvoyY8OiOB1pJb/dvnH3Wgn12
         sM8jv2ObY5xxwoT1/j17RVeeVvluZTTI1nX9OF+iH6xv2RPJrLsqiaDFtra8pyCcxfCh
         SrSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784719125; x=1785323925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XEVQFga+mNJxLAziks0aejJBFPUIoIq1NAMdQ57DJTg=;
        b=NzKv3jGcomskP/8rWElwV4lJ2vmFGCwfGh4PLD5FyI4MuP9Sk5lP8jWuLn7HMcZZay
         UDH5NOB67uSrYEINWrOnmp5BrDtU5o01ZX4dob+wvxvUEmZMALqaCsAf0GjOHbRXCSxH
         CLG8NvNTv41fQeSpWy+zb0zEP4pPxi19ZUMRC1G61Ntmh8tfYs2dMJwppmN0gEQZWdL+
         u45FImoOIpvOHQXVo6uoI9VcdzT9+OVhtkrUft+eDv5dmpx/byN9HetaZ7HD8J0tIsmt
         Xbumz8XMM8Zp1S2NXt3VJc2p2uyjYtvoskcs5c964L5ew+Uy1QoyWPn4DmYPFptubUWb
         4emg==
X-Forwarded-Encrypted: i=1; AHgh+RqqeSdQzOPBYxwzTFKx457ApX4elh9ZIwgHzmoHa26Pt8sQiJFtVZmyYnfqlYkUQZGt0/Q=@lists.linux.dev
X-Gm-Message-State: AOJu0YyzUXQ77x43EqRN9uk6ByT0lxJ59UlrV6ttKoXvYFo4p8yVyEIU
	0Xf8oFHVFuUHtVqKCLkaJb71j6hchwhvltaJ7zo8V9lEzdM99w7hw4zz
X-Gm-Gg: AR+sD12F+M8dJL9og2yvh7kCOy4hF2f59brcXfZ6JmDHD9XJBLhiC+oV9PMIJbu9g+S
	Y+EoAR6zNXhUdSWHo+0V5fhpoXoxCjTA7d4r28W/jOfjkQ7+RFt9Al3OiLcOiCMnAjqzLjRRlYm
	vICbFYM8iO+zbt9V7DxqsZXCjRkqM3RpXAedRJxKEHKGKwI/pGDXS+Vf/Ext3E9NFJUrumzsQj+
	Vf79/CP9kSqCgt8k6mhjDmGm8MWPpUb+8zAC1PUfttZ5TUd86ufqQjlaikU1bcN/LxzJ3rGra+c
	AbCAM30RPi6TuynnxSATj5G3YPLKOnmYxqFvNbmhcmpO4/ecrAHhuWB/1qJzONkH4QMQD8W07kC
	hbdAEXZJHCH4eJktIx6xHoJE29TwD03pDmX2QrSxiIjOVcY4XLTmJFaMIYshQRhAND55RV0EYjY
	zAwfizwWXWxf3WLuWtGMnZxyvpViTbkyfBNpGBuTFml6UoUWleMDJ9gkwSj/bfzPzCaGL//b56m
	8JBz4mFvfYoWJ0Gl7JZig==
X-Received: by 2002:a05:6000:400d:b0:47f:8148:3af8 with SMTP id ffacd0b85a97d-47f81483b6fmr8180062f8f.43.1784719124938;
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c67339sm5345775f8f.31.2026.07.22.04.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 04:18:44 -0700 (PDT)
Date: Wed, 22 Jul 2026 13:18:41 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx8qm-ss-dma: add LPUART4
Message-ID: <amCnETDWQuSLXcMx@Lord-Beerus.station>
References: <20260722104200.17729-1-stefano.r@variscite.com>
 <3426538.aeNJFYEL58@steina-w>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3426538.aeNJFYEL58@steina-w>

On Wed, Jul 22, 2026 at 01:11:10PM +0200, Alexander Stein wrote:
> Hi Stefano,
> 
> Am Mittwoch, 22. Juli 2026, 12:42:00 CEST schrieb Stefano Radaelli:
> > From: Stefano Radaelli <stefano.r@variscite.com>
> > 
> > Add the missing LPUART4 node to the i.MX8QM DMA subsystem description.
> > 
> > The peripheral is present in the SoC and its LPCG clock controller is
> > already described, but the UART device node is currently missing.
> > Describe its registers, interrupt, clocks, power domain and eDMA
> > channels based on the NXP downstream device tree.
> > 
> > Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
> 
> Commit d879cc948e6f7 ("arm64: dts: imx8qm-ss-dma: add lpuart4 node") landed
> in next-20260721, which is essentially the same patch.
> 
> Best regards,
> Alexander
> 

Thank you Alexander,

I missed this one :D

Best regards,
Stefano
