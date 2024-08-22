Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DED17D374
	for <imx@lists.linux.dev>; Thu, 22 Aug 2024 12:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724328238; cv=none; b=sHdb3Q7v1ibTmikasbAsB1fKwT7yt7tPZyNPQlEm+aC2vjLR8i/2zuf+7YrTiUKAo6MjvQu3un3gfNQlTCPseemncjusAAovK33rknLS+3FtBGNCvqHXJVbY9dLGJ5QKn8a8AbNa35h3dupEExGyjUR06xuZObreryn6WeHPPk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724328238; c=relaxed/simple;
	bh=/7JxRU4cpPBTZFx1w71DWizOwcTnSWrV3CmQH03IfkY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQrsG6kKD7CumoRHLRfVw/yickolivVWEckCzgDxKwiWc6RWfFL/Pv8/E/ORhjy18DXtrg9JA4FvXUDYSuk3MmnLXZUH5xAK8rlpv1fdZ9ej0TJlLo8dwM+yM/yb8XCHLSi9YpxdIJPfUX8APc+9nmIGJ1hHBrMWOWuf+deX3Gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KkSOHb49; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KkSOHb49"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4281ca54fd3so5434405e9.2
        for <imx@lists.linux.dev>; Thu, 22 Aug 2024 05:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724328236; x=1724933036; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AY16LwIBghLKS2thXS/HdTgvr57cr8ORfO+2U5rpJTM=;
        b=KkSOHb499m7QybPrGqWVHPbkB40z66DQsgHBurMibtemaOQamIaO6RlJ+k9jF+TYiN
         X3ACkufeKcZVKx5i1njARIcLXnq2D6JacAVqwfVFlc5jnXl5NR/FCynEL72E3tvLNb8g
         QR5WQFsOv3aalU1dhtqQr8Yq29knXheg8ATt+ojf5lavMChDpv401LN82E7zTI6U/10q
         HlvL5kZrAv7IsROmKQhyPCp0N7mn8sQ4rYEx5kjFGKhy3qEXvJnq9ati2/SSe/BZfXIi
         f44uveZ6eLoHp3cNVOjwFOldpB4uQ8fUWv74Rf0A4Anj2V2Ke3wRruPOeP0YtoKkeh0h
         zRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724328236; x=1724933036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AY16LwIBghLKS2thXS/HdTgvr57cr8ORfO+2U5rpJTM=;
        b=LwnsE/tV/bZIYxg0PrQgpQ1QfKyo7OkEyL6a5IFzggHiUPOSOMZP29ZlfJ2WKpCaae
         CLGQijbTQs7fk3CfCCm5xoYZvD4gZHYpV97+e5kZtZYZv6U1z9p3idDkA+JEewjmeJHE
         VxPp7Ch12yWdrMUAPTx1wxEk1AjJr8+RKi4GSvc2sNjL3NOOIKLiRQi4YDcKPZQ4A76Q
         Ilr76WKTga6m6qusFAR3lI+PQaoySLe2YgxWyeE8ikpiwJX4U0OscI4SIwSSMAOKk1xh
         /jKWVqhymdyIQmVCW6GjZLUuIL8+xFyFgFlQ6aLKhE76aO6SPri41Po1Me1sWCEDHg33
         01hw==
X-Forwarded-Encrypted: i=1; AJvYcCUt9cF73pqWHs6SSz5z3MkU7i/hCrHwxc5bZ90eWiVS3+r2/6za09cz1K+ryQGlTJ+Ga9U=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu2h1UhtWc98MRFOQha7H2qCZuGrQ/L+uUhQMiJvz6R1jZxNZL
	kl2bC99Q+55Ypq0R59Ugy7L5Bip7dOTG4td2lmZNXWbkUBHiOadD
X-Google-Smtp-Source: AGHT+IEFxPFmRaY+PNp14y1u8ekMx5ha3DFQw+w7+iWj6isuIlJVoOIiRVhai99HMnCgTpLp5x6Kjw==
X-Received: by 2002:a05:600c:310c:b0:428:ec2a:8c94 with SMTP id 5b1f17b1804b1-42abd11e2famr45807665e9.10.1724328235478;
        Thu, 22 Aug 2024 05:03:55 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:daa9:644d:3c2:44bb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac51860e8sm21974725e9.48.2024.08.22.05.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 05:03:55 -0700 (PDT)
Date: Thu, 22 Aug 2024 14:03:53 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andi Shyti <andi.shyti@kernel.org>, kernel@pengutronix.de,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	Frank.Li@nxp.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v2 1/4] i2c: imx: only poll for bus busy in multi master
 mode
Message-ID: <ZscpKSzdYklxIkjZ@eichest-laptop>
References: <20240819072052.8722-1-eichest@gmail.com>
 <20240819072052.8722-2-eichest@gmail.com>
 <zudo7zjlxqfxipsi2x7e4kyhckvkjreovrdmsfxp3m6clbbgzv@ina4j4qxu24r>
 <Zsbi2xcxBGE7o9uE@eichest-laptop>
 <ZscNO2PKNlK3ru_7@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZscNO2PKNlK3ru_7@pengutronix.de>

On Thu, Aug 22, 2024 at 12:04:43PM +0200, Oleksij Rempel wrote:
> On Thu, Aug 22, 2024 at 09:03:55AM +0200, Stefan Eichenberger wrote:
> > Hi Andi,
> > 
> > On Thu, Aug 22, 2024 at 12:21:30AM +0200, Andi Shyti wrote:
> > > Hi Stefan,
> > > 
> > > > @@ -1468,6 +1473,8 @@ static int i2c_imx_probe(struct platform_device *pdev)
> > > >  		goto rpm_disable;
> > > >  	}
> > > >  
> > > > +	i2c_imx->multi_master = of_property_read_bool(pdev->dev.of_node, "multi-master");
> > > > +
> > > 
> > > you might also want to add the multi-master boolean property in
> > > the binding.
> > 
> > We discussed this internally and weren't sure when it was required
> > because e.g. i2c-rcar and i2c-tegra don't have it documented in their
> > bindings. Is it still required if it is part of the dt-schema?
> > https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/i2c/i2c-controller.yaml
> 
> The i2c-imx.yaml has "unevaluatedProperties: false", which fill discard
> every thing not in this yaml
> 
> > If so, I will add it in the next version.
> 
> Yes, please.

Perfect, thanks for the explanation.

Regards,
Stefan
