Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5196728E8
	for <imx@lists.linux.dev>; Tue, 20 Aug 2024 07:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724137659; cv=none; b=BhsgBhoosJf59qLY0tf68GorNCZjwnEGM5PVY/kAutq7OfnNiBZwQlSB7gQbGsz5KTsFFrx4SZsbXURr2Ecvr6MJbPYICGYKh4b+Zet+SXjku65uRfBTEgUuTfoFvd/qzXLIBE0InubOLr5w2uLcH0S3dK+8R9WQEH1w0O6imOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724137659; c=relaxed/simple;
	bh=N4cZaTiD2TAnKc/GtGJvPcFsd+MoWbR0Bq08kXAMQQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8iPiYG0dYVwqPTW+rz08Jd+ukyZ8nY7BtFRAe2taKljTm4AhsqbqlHSgBFox1NriNPxkgBEL3Odc8sgQX8Tsmrv7rmXkLfUiAWAmJP+cdrgcVgXjwvaTjKhb28MVaUphYza+LjIfjm/NMiqBE6bvWNwIs1gbSnNl+qlj6dKnDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P9sfytdh; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P9sfytdh"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a864574429aso66750366b.0
        for <imx@lists.linux.dev>; Tue, 20 Aug 2024 00:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724137656; x=1724742456; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NJq9e4lwDir8ymmK7BffSX8xHDk0ZjFLqMtAmgoT2DQ=;
        b=P9sfytdhS5xPLIZLV/T3MQoK3kFOfHHWOEmCFGzANx5g2HsBYXdH4iDI2vT1KanKfW
         vyuPe5klmuYq7EXMYYWebkUowiu3ZAjN+eM6Wh7Oj+zRq1/yQFIz4060D3C8iF06Tq7N
         vWOkx0pHgERG8Uv/PCRYuNN7n0pxt4+15ZA961UV3gHvHVHGUodxM9POOdbSrsUfM69i
         PLKENUkkUCOEw1/D0SSVfNcOZmZ4SAQtQtdAq41fMlRHOhxhUDzrBALN8yKAhZcNtUXu
         moP12Xbp3zm8qKBMQuH+cVPJwfziv1jLDHiZ/MmsqHUF62JDegO8RnNac8ciZEAnCpT4
         w2KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724137656; x=1724742456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJq9e4lwDir8ymmK7BffSX8xHDk0ZjFLqMtAmgoT2DQ=;
        b=hLcxWMzixGX8VIBn+fNIX7cQ+slPLz6iI7U3YETe3G0Ym5lcCXBdsWhtk0DepLclVp
         BxPi5rv9jxlHkHU6LetNyHLadAlUxnPFuv2A3axsGw7phhJsV4m6tT8qlKaX9oDHtZIt
         SF7KFrGnBuQUXOPParyla4fhBxCH2f1Uh4yoQRktBPI+GggD67b6ac1UdOm+g/LaW+Xu
         MDe63ADFmkXnrwPS4vutRF8JsM6OO4DX2hRPk5Kle0ozknW2iRZg4Y1q604ip80HrOGw
         dN8XlTtvx0vyQHTQ4QlXSVZ+TfS7GnRjc1G1BgqvEWicP7zLK5Srd0GhlqcEFNnANLIW
         VGeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAUsEXJOGYNg/dWYB7pkz/TwJNuILf1dCCMZhTgksSxi1lGsofVcx6RZSnVvnxs9tCAO0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzV3tJIwVfh3ts5yXeSHya8hc9wuaSaXSqiuQA8x5fv1Y8HMWab
	7l2rb+p7qYR6iS0MxugWtq6payauaJ822EhxTbILNCWQZCm8/nty
X-Google-Smtp-Source: AGHT+IHzHNJYjEadwnvrSG+CXQSDiM//fUFKgBI8g22Xkp6aRr+rR6REvWVZn4RKx65+5e1n1/4lCA==
X-Received: by 2002:a17:907:c885:b0:a7d:a4d2:a2ba with SMTP id a640c23a62f3a-a83929d3666mr926201466b.49.1724137656270;
        Tue, 20 Aug 2024 00:07:36 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838c7444sm725952366b.6.2024.08.20.00.07.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 00:07:35 -0700 (PDT)
Date: Tue, 20 Aug 2024 09:07:34 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: hongxing.zhu@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org,
	kw@linux.com, robh@kernel.org, bhelgaas@google.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, francesco.dolcini@toradex.com,
	linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 1/3] PCI: imx6: Add a function to deassert the reset
 gpio
Message-ID: <ZsRAtlTDtxMYi6ug@eichest-laptop>
References: <20240819090428.17349-1-eichest@gmail.com>
 <20240819090428.17349-2-eichest@gmail.com>
 <ZsNbau03d5J0sLy/@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZsNbau03d5J0sLy/@lizhi-Precision-Tower-5810>

On Mon, Aug 19, 2024 at 10:49:14AM -0400, Frank Li wrote:
> On Mon, Aug 19, 2024 at 11:03:17AM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> >
> > To avoid code duplication, move the code to disable the reset GPIO to a
> > separate function.
> 
> Add help function imx6_pcie_deassert_reset_gpio() to handle reset GPIO.
> 

Sounds good, thanks for the suggestion.
