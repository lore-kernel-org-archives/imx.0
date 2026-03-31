Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CEA63EB810
	for <imx@lists.linux.dev>; Tue, 31 Mar 2026 09:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774947770; cv=none; b=aLxCGYKNjZg0SXTOSlRHnw1KNaQRviE5kW8C4mMZPY9Emh0QZgVPu568re+cbR31As66vM/SuUQApiY1p/cV8YYD2r2iAWb53HCpNZwBj7Fhd5uARzxWV4As10wCDxJtJziCyXsOUp5ujA7jRbiB80cU3R2It6lvbr0MG4qIa3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774947770; c=relaxed/simple;
	bh=JP75kpJ3w944vOwv2HN8fnrAxMGrV1zhSNUKnJFvGhM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mtv22nSpr8UqmvBGv2AUwt1hZkhBx7WgN6Rtf/DobOBgtKa2I9V+zKsdK6M3IdS+rZN6LIgK5K5PPNCVYYLRGiYss1k/rAFUR8FI2+5HSJhxTL25i7aQjd96BPMf7YIIK+DPLxQyYHukctbK3X/doW7Zi099l69GCJl9YcXIOYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=coJK5ro7; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="coJK5ro7"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4853c1ca73aso55514085e9.2
        for <imx@lists.linux.dev>; Tue, 31 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774947768; x=1775552568; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=coJK5ro7tm9XX93Fkj3l8PUYlXiEnlM8BDsn4eUQE+DAf6qUcfImp3XAWzj8M81cIy
         rWdFSSuIgX0Z1RSKB1/dQJh8Q7RqfGkgQO0wqwSweteygK8oCGCPS9Vnot0LsdpYetSh
         FNWfzmXaL8lnCLRbDJ1FEnu4iEQdmop2sKUhgLLB8CLEmB9MX9zy1rgKuEyaQmcEpoH3
         UF+Hpu+lPazu6/ay/VBpHo7Hi4x/g4+BC5HvQjxsD+4nzW1hsLUT0whxWygstA1Pxe7d
         KOZSu32n+gA9touxYYNTMv9XJprre6+XqmhNWkbM2mA9CFja7OslNwqDJUp0tefL1F72
         tWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774947768; x=1775552568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25UsXVOMiOy8Ukhj+maOqCoAane+gpYY6MAQhsl3cng=;
        b=ezs0F5IMA4cEQNXTI98os/w5CnuQq6dpi2VXz2Qxjfh6tw7ab5Rsil4v8fDMGLBnfn
         zxPoLH3CQ7oqGfGX5VMoyG2boWWHQZAxxq6A3L38IKQ18U+X78mFoc+u83waE8G/SsuN
         utLK91rGgAkEIGhNf4cEwulTIilYu9/FDFWmwVdUcDfAZIWYhtuzi4+qbXe90wxUVIIv
         vX0dcwHWkwlcWI9JJmh34fkFOUhjqkPaDy2mmxN35upqCfRwEKnB5YQfc1rbfD93JwXs
         L6QbU6sBAxyYzgxPxphFWxgWAnxBrpAn/PdQ6dFQGzd9RwJRj2fOl6lYvFr0LXW3b7ax
         Ud1w==
X-Forwarded-Encrypted: i=1; AJvYcCW0zJx6KYyiIevyMBfgaWG5MZSC8wnb3cH8xpRFS+wK/w6eXGkeqICpA4RAsJTzuSGIcuo=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywb1CcOeIukD0KujwMKzMPpT7Y/PYOYDS9Xe6OZerobPqXhdJg5
	qsNc9dGjusoNpNGXnkIbqB1ZyPq0tIHxUWt4nOE2/w28M1a7O030oe9g
X-Gm-Gg: ATEYQzy/f3wrbAFe1HKpyPJAU1zV6PmhCHpJ03t9DukjrUBl8fm4sXkw4lkUDgwUVUe
	k+rsDSlwYj4nDe5E/wh32Ylfpv3Uj8ziNhuI9705eG61onnf4L+CwVl4G6lVzySBPIBqhjPyTeG
	yibCRCdoHY1Me9D4WIw7own8GamfEFxo79z72FeUT/71g3Q5/FrXaAW2mADfFwnPruA6286iE1H
	q4eh9uWpw3qMsMD0Gvs0M0Vv0riZ4b/78WCkIwCGY6ekCY0uGRVzm2nT4UBgH5LzUefy7GyNgzX
	zszrttPy0rIP1IcF1G2kuQxVGp9uFsNY46SZiI/u0ltB0AYa9vHFTaD110waiWx6tQGYexbk+hy
	OpnMIVmfaur6BaE6+I49w9kksdrWyye+byPf2icdSdgVvYAu3CmQOLC2Hdl8e17CIHvXXMf/Hoq
	8Q0ZvEpoemOq0CC2Z4/AAte+OHtkJeMsRhz6AJlfQW/V/NFWD718EzlY72mTh7mJtmWXLcKBiWH
	KnLJxc/rgGZUTCAhJy0ImjaHmj46mpNAR/KZ29eQ44=
X-Received: by 2002:a05:600c:3b24:b0:483:6a8d:b2f9 with SMTP id 5b1f17b1804b1-48727d5a329mr283719915e9.5.1774947767403;
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80140esm19733365e9.4.2026.03.31.02.02.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:02:47 -0700 (PDT)
Date: Tue, 31 Mar 2026 11:02:44 +0200
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 1/1] arm64: dts: imx91-var-dart-sonata: add RGB select
 supply for PCA6408
Message-ID: <acuNtMwKMy8ka2j2@Lord-Beerus.station>
References: <20260327163243.17334-1-stefano.r@variscite.com>
 <aca1jdx0DjmmHqFk@lizhi-Precision-Tower-5810>
 <aca7ckVY9ure8Cwe@Lord-Beerus.station>
 <acbPUTPpGIJoqTn3@lizhi-Precision-Tower-5810>
 <acoxJ3KUVHqIR1yQ@Lord-Beerus.station>
 <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acqLWgY1_G7e0qOI@lizhi-Precision-Tower-5810>

On Mon, Mar 30, 2026 at 10:40:26AM -0400, Frank Li wrote:
> > Yes, it is exactly the second case!
> > It's just an EN pin, that enables a buffer to route RGB signals used on
> > the DART-MX91 som only.
> > That's why I think regulator is the right way for this case.
> 
> Okay, it'd better to emphrase it in commit message because _SEL is miss
> leasing.
> 

Thank you Frank,
I'm sending new version with correct commit message.

Best Regards,
Stefano
