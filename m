Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32331CFEDA
	for <imx@lists.linux.dev>; Wed,  2 Oct 2024 13:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727874494; cv=none; b=th6iwzqN63DlmFFfyUeVkoix3oAKTswjTP6pbFTKCRycEqdKCcZxxXmr+dxqyuCwoDi3rXWyGbj2CS7gPzk/wR14E7QhgQ6okbAW2Ggy2tDrPHau9x5yt7NuS04wYtJUL/w3MoiuxDF48Q5y/MrO48JFIJ3lZjl2RY5HULRzzYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727874494; c=relaxed/simple;
	bh=ShT5aGq5RD3zJbBHa6K4AHTJryxZDp+SxPpWVZtyqGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L/cbeELPgp5PN2VpVUtKLhKXXG38+3NtyTSKhmwkmRPk6oEmV7A0SaV9GG3GG224XwUzG7U6QrXd0sHsvPZs9UkesXAtd494QnGRjo0rInhWXiMmBxs7evNiTaddciq+PtrqT/TLXk2V8irRXYrmJe/XHQPyE596tqEykFy9ohU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KsqS1Kgs; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KsqS1Kgs"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-37ccd50faafso4359108f8f.3
        for <imx@lists.linux.dev>; Wed, 02 Oct 2024 06:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727874491; x=1728479291; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d+vo+CngfnFXF6+FSmqK0SlB5GNZMtMWx22seKJwNuI=;
        b=KsqS1KgsphYMdWtAlz1YZ0xDKKrMyprLOnx9TyCGztNgBBCYAMbfMdPf/iY1CXjqXD
         sRvDGWFntrjOixzRg+bnlhdX8PrmbBVKbgD5NZcMeKjMYi1xNycTmdCn1VZcOe5tsmd4
         OOY96jWxUj6EfdkwWNTnU9yvBiNzQ47ZU1xZbkAQa1lYVVlCeApOyW07ZPUyTfEwYL3Q
         cRbU0Y+heZSIJzbddvajKWV9Ki6qn7KQrXc0vWvg7nRJzOSeF5MMbm4ZwUyrFlERSlh9
         qPh+Ce22sb4CXq+xhy9y/KcBWROLue+w2LT+AXKIAje+XdbYftuV/Uw9vzRb11N2qDC7
         H+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727874491; x=1728479291;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+vo+CngfnFXF6+FSmqK0SlB5GNZMtMWx22seKJwNuI=;
        b=ZxSAo8LNRsCVHIs0SycMjAaff4lS4omtspSxwqnww6qV0kzCR2VsFPYcMzMTY6mjKs
         WbJXpvT1ZjgWUz7UAQUyUG6UtMtdTAq3DOxtRuRDyxFhe4/dZLtCDFxvLdHV1lvcSLLf
         XXMPAAXghFoq1AdOoRsmwZCnvpevw8RUqG08r4Y2zH5w9GfHX8nyLPyF/XtY0oGzjNhv
         bNhS+ve7M7uQUKDPyr0KxFfbIUl+hWmbRQRvc49l43qUqJTsbunApVl/qrG8nPEMS3UR
         FmhQLiBRnf2U+S/cvF0EGwmwdkOXaobeyrCK4MoArNweXgmlP2K7Gc5+z4eY95wrGkWq
         u02g==
X-Forwarded-Encrypted: i=1; AJvYcCUFse1kih9gaM9mJqJT1yQJq98IcfQ3aHzVoMRg/YUA7V/ABFCN59V86MFw04m9v18gWsw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyS3VJSiJCxCP7bgFwOPiMX+yCw0yrJsnJrAEo3qZWwG48IhGrw
	q5qOvDFb0/Pp4xi1lg9LnM4jurMTMiTwNVk1rIg+a+NX2MUvGY9u
X-Google-Smtp-Source: AGHT+IF9FentvtlBTj0QFbrVHmGbx05S13YBVweR1DdtG3DoyI9laTrIrlgQf/nES/TeKn6ouzVbXg==
X-Received: by 2002:adf:8b5d:0:b0:37c:c832:cf9c with SMTP id ffacd0b85a97d-37cfba1239dmr2358739f8f.50.1727874490800;
        Wed, 02 Oct 2024 06:08:10 -0700 (PDT)
Received: from eichest-laptop (31-10-206-125.static.upc.ch. [31.10.206.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e6488sm13956736f8f.46.2024.10.02.06.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Oct 2024 06:08:10 -0700 (PDT)
Date: Wed, 2 Oct 2024 15:08:08 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: o.rempel@pengutronix.de,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v4 3/4] i2c: imx: use readb_relaxed and writeb_relaxed
Message-ID: <Zv1FuHlpeayZq-Zv@eichest-laptop>
References: <20241002112020.23913-1-eichest@gmail.com>
 <20241002112020.23913-4-eichest@gmail.com>
 <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6b070948-cf02-4f13-a220-0f6cfa21c41a@app.fastmail.com>

On Wed, Oct 02, 2024 at 11:51:22AM +0000, Arnd Bergmann wrote:
> On Wed, Oct 2, 2024, at 11:19, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > Use the relaxed version of readb and writeb to reduce overhead. It is
> > safe to use the relaxed version because we either do not rely on dma
> > completion, or we use a dma callback to ensure that the dma transfer is
> > complete before we continue.
> 
> I would still consider this a bug in general, you should
> never default to the unsafe variants.
> 
> If there is a codepath that needs the barrierless version,
> please add imx_i2c_write_reg_relaxed()/imx_i2c_read_reg_relaxed()
> helpers that use those only in the places where it makes
> a measurable difference, with a comment that explains
> the usage.

I added the patch because of the following dicussion:
https://lore.kernel.org/linux-i2c/ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810/

I can't determine if the relaxed version improves performance. The
'normal' version worked well for our use case too. Therefore, dropping
the change would be acceptable for us. Another potential solution could
be to use the relaxed version only inside the ISR. Would that be an
acceptable solution? What is your impression, Frank Li
<Frank.Li@nxp.com>?

Regards,
Stefan
