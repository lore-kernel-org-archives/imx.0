Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF43213C9CA
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 07:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724310242; cv=none; b=r7A3Idxe/wKtxwJQ+fKGZl8pT4nYUwUOF3wVTBhZPHSDLRa6i0n2FKuA4pRVeish6m8CRGx5WP/ZlUJ21N1gp0kD2dnl45rHIekBbCMH8gLs6n6DA8WBzrPYHd1g3rZpOx8WZvL82p5TkmNnb5VelqNgNz/vOZAkGrwkp8PKxDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724310242; c=relaxed/simple;
	bh=nCCjJe0NO298qZPYGd28WFSkU7iQ94z0usdgpghLI1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g7iVLMynGyu5LTd7SIQSMdRZzcAMQIVjQTs8Ka1pQ6HBw4/uZdmtgG2OkZn96pEXpLuhP/WOg79DqGGGtLMBSUppMRVgAQkT5NdNRWHvJRdJo8TSeA9ySLppcWbFoWCPhLI1lD6FaZkhRDXl8Dvgcu9bDl8ljdvVM/JwfWdbLbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCCChbqC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCCChbqC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-a868b8bb0feso69091666b.0
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 00:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724310238; x=1724915038; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ykeo+6OejcW3LfPIwBroCbu3h8SlZxm1Q6n/Z4Ckav4=;
        b=TCCChbqC1Lylrgl+O14TCYpxhNrxLLaMhCOSzgZDwMkN7G6LnKfnVvKOqEpqkgTTop
         fimgkUHuW7xzd0O4k2Xw3jX5VWtDY743WLUacqKySC8iH2v4PbfOb9LrBJ5htr/Em6ZI
         nN+qHKH6O6kxS4nJfnUTmFH1rXPJVDMyE4fb1cOTbBXm7f78bAKMwvgNMXAJAhbf0QYU
         jB3q4Iwtx+8VBCdTn6v3g8FDX91Dk1Im6DjECTl//oyM+U/SzknealJoS6AfxCS60/dh
         nCFai9b/b8zoDJawPlZvl8E4WFQak7e8P4vbNDTlcEf2hO5l1FdVbhTBnc64gov0BiUF
         ISjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724310238; x=1724915038;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ykeo+6OejcW3LfPIwBroCbu3h8SlZxm1Q6n/Z4Ckav4=;
        b=p22A4uOkDQiYP7p5GZP+ewv836cSLB0DQ6byYY5MOjodJuTQdMshGUzfnRLu+C9WkI
         2VZ+SsRnp0REXkqR34nctEQQgReV9hZxAzyc/d6X/ojnPZ4EI3VMhGH0mYy/+gfLARUE
         vkw4dfT5755GAwHxltdPjGq40ScUxnKkDYedDd4/rtBwLYuMyNjsX+QbImPvoOjO7VsD
         za4eV+QPbzmj45P0PgrqfDuKdZafoVgYU3LClFWvDyIenCPuQyBdIuYhRJABUe7blRCD
         iYdosvN+z1Yr0tTMv9/58OuwMrNrkQ3RZScp/WfahcjrkMAYAwaZTX0gUSjyahoZao+E
         KArw==
X-Forwarded-Encrypted: i=1; AJvYcCVGBsgCdRYk9fSHBly8NBWmMBSZ5Pv93XESroJF28aJO8jeMOgk/ZGNrHhywxeIVs/EZg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YyjnhnY09PArQdG/vPN9PlhB6S0i2A/F9lsSTNH1mmepD9JqV9V
	o4n7zYdMl46YSSIB9MC/6+Nyhul6psFPqlQytQJlRuSFP/BtpD9M
X-Google-Smtp-Source: AGHT+IGSsNf36l7LH2UrwwyDGt/7XMjWeoEqpb8pclMdRI6cqXUAmy7bZ4Hd98389PIbKXU7Hl9JnQ==
X-Received: by 2002:a17:907:968e:b0:a6f:4fc8:266b with SMTP id a640c23a62f3a-a866f135cccmr290948966b.3.1724310237810;
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:daa9:644d:3c2:44bb])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f436ccdsm72186166b.104.2024.08.22.00.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 00:03:57 -0700 (PDT)
Date: Thu, 22 Aug 2024 09:03:55 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <Zsbi2xcxBGE7o9uE@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>

Hi Andi,

On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> Hi Stefan,
> 
> > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> >  		goto rpm_disable;
> >  	}
> >  
> > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > +
> 
> you might also want to add the multi-master boolean property in
> the binding.

We discussed this internally and weren't sure when it was required
because e.g. i2c-rcar and i2c-tegra don't have it documented in their
bindings. Is it still required if it is part of the dt-schema?
https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml

If so, I will add it in the next version.

Thanks,
Stefan
