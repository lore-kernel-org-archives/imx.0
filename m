Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFB61991BB
	for <imx@lists.linux.dev>; Thu, 27 Jun 2024 22:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719526428; cv=none; b=GaIv1ZnlbYWL9FlF0FQsRDZwkDhs6tZjmpfCWl0zlcGk+lZJ7mX8wkBjLGuoOg6MgatpUBM07X+C+6WOwns+P5zJ6Ezw2qiPKno98gRRxeQhzUQMhMJ0od0E/SM5SWDELj85EsxqiTV0VCp75y061Mk/6jvnk5/fKk6n0VgRfsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719526428; c=relaxed/simple;
	bh=PJtHNXt5xhdpnPi1S0hdgD9An4T7UhkzlMgAiH5twrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXoLu0e43Pgn1uilaiCZqaN17pg/GUG67Wl9wU1E3nPxyDolUR8CuKLDBLadiGbu45sA7oevNLrNEa/QQTjnN6HVGRJugdvKEAA3QBaw2S/ynFkZaZ0ygl2XEqa4lrKmKo2UGGUMjkKZtxUJs+yiJ+1t4WCfu6cefmu3NUEfyJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gm8lMVKn; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gm8lMVKn"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-424acfff613so29388415e9.0
        for <imx@lists.linux.dev>; Thu, 27 Jun 2024 15:13:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719526426; x=1720131226; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/rFsDxh3nwIfQg18F9xjhHPwne2si1Ovzi68PnLOqk=;
        b=gm8lMVKnGvyCYjRf/laDKykIPQK4DY0AlmpLaz1ZO6MvqReXh3HigAEnS+NFkMGrm2
         OzjrHJu9oq11VNc0yy45F9uX446zmebpvH5BSAq1Ty/lrt2U1rJ/mDYfO8tuzYaAjKEV
         bpkBxuaektqMVlLxhojhBa+p3I8CyGNomOj4I9djMcMcjAnZ3b1l4Fb9eyU6xMDvv38b
         5tau2dFlxZ5ciQtSJZOwxsY4+kmGTHQhEfJ3R/Dz81W8RDtZO6Uoow5TaEYyWkdxlwyV
         gepFZprmCt6uBep23W/FRLMFfTzNuJpeVRB/YlBTrq66t+yR1OtRqdvlhj9eEWx2Wytg
         QO3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719526426; x=1720131226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z/rFsDxh3nwIfQg18F9xjhHPwne2si1Ovzi68PnLOqk=;
        b=gbqMaxejZlk/9v73Or3vWq8IH9qu6mhbPqXlQd8yAJw8XVn+RXszDaOBTX23663ivt
         SBooDq70ALIvUQRkrhkVR70u5xnmi2Ut/H3tnxMlCT5qJ7jRUq+lsr/cFo4GWXMddXBi
         Jd/XCFa4PFFYLRPt0qrLBcmYaSSVmgK67e8YWRle/6FrcWHEtXP8T4HsBd7Rvtb3Sgr7
         DiiN4lnGnUlYO1RWrHVlfRhKNF/00aJRNu++PhoH5XMUSru1fAg1hXeVc/q5R8o/pyGD
         ZxWDHgs12aacJp0GxcW9ytpc+Zc8OMnmrXk862yde7DzkGfxdRrjg+pcTDkW/lKAr2CK
         fPHw==
X-Forwarded-Encrypted: i=1; AJvYcCV+NoVAf3kJCxUyNFQGMI1HqJqwvecIOHbxNFDir3H93WC8dx21TVqvZ03eX0t3BEMJGz17NAaDp0JDtXihRT9n+xhU
X-Gm-Message-State: AOJu0YwEKmQDWcIAUaykFS2Iy9+ZBBs9QWXzh7sVQi9eDlrJLovS/A/4
	ZTy12muYPyDAB4R0eZ/JBE1Y5X0eb7vfoLec8j4OEYiqvfxrAhVu
X-Google-Smtp-Source: AGHT+IHCtSExRriW/XH2nhOc1jBWGaEOWvV7SvmGoJ3haFGm6g7tuIWcotwJ+F3u6MEYEmrMnhpXIQ==
X-Received: by 2002:a05:600c:2e04:b0:425:641c:5f40 with SMTP id 5b1f17b1804b1-425641c606amr27217095e9.39.1719526425486;
        Thu, 27 Jun 2024 15:13:45 -0700 (PDT)
Received: from skbuf ([79.115.210.53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4256af3cf90sm9222035e9.5.2024.06.27.15.13.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jun 2024 15:13:44 -0700 (PDT)
Date: Fri, 28 Jun 2024 01:13:42 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"open list:FREESCALE DSPI DRIVER" <linux-spi@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] spi: dt-bindings: fsl-dspi: add dmas and dma-names
 properties
Message-ID: <20240627221342.zi4iw5nnvumyijyc@skbuf>
References: <20240627203308.476437-1-Frank.Li@nxp.com>
 <20240627215338.qrry6zpkusw5nazw@skbuf>
 <Zn3ijCEwiqgFfwTj@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zn3ijCEwiqgFfwTj@lizhi-Precision-Tower-5810>

On Thu, Jun 27, 2024 at 06:07:08PM -0400, Frank Li wrote:
> On Fri, Jun 28, 2024 at 12:53:38AM +0300, Vladimir Oltean wrote:
> > On Thu, Jun 27, 2024 at 04:33:08PM -0400, Frank Li wrote:
> > > Add dmas and dma-names properties because dspi support dma transfer.
> > > Fix below warnings:
> > > arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb: spi@2120000: Unevaluated properties are not allowed ('dma-names', 'dmas', 'little-endian' were unexpected)
> > >         from schema $id: http://devicetree.org/schemas/spi/fsl,dspi.yaml#
> > > 
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > 
> > For the contents:
> > 
> > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> > 
> > and FWIW, I noticed this as well, but didn't want to put yet another
> > roadblock in the conversion of a binding which was way overdue.
> > I was planning to send a patch as well, once the binding was merged.
> > 
> > But... to whose tree is this targeted? I only got a notification
> > from Shawn for patch 3/3 (the device tree change), but none for the
> > acceptance of the other 2 patches.
> 
> This patch base on the below patch:
> https://lore.kernel.org/imx/20240624-ls_qspi-v4-0-3d1c6f5005bf@nxp.com/T/#t
> 
> Sorry, I miss understand 3 patches already picked. Actually only pick 3rd
> one.
> 
> Frank
> 

Yup. I guess it's best to resend a new version of the (reduced) series
to the SPI tree now, with this patch rolled up into the dt-schema
conversion, and the review tags preserved.

But you might want to wait at least 24 hours since you sent this patch,
to allow people a chance to respond.
