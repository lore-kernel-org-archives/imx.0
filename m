Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AF41DE4F1
	for <imx@lists.linux.dev>; Wed,  7 May 2025 15:52:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633152; cv=none; b=sIHNhSJZTJKQa8wQ+7KYPjjViv4R2omoU4xGU6SsQagTbqfNmKfC8ZafZDERad6se1roi+6EyUOdPbnoR8zyn5RJOMBxqvZiHvkL2AssvnAZTI6YPDBeWKCxBJ+k4sqIFAOx2isFPE2X0slm4Ej2CD7GhyC74R2vtauLl1ZkFC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633152; c=relaxed/simple;
	bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEQO6yGBlAAF3OPA5CsQRPk2jKV5KovL0fVrbdm6/UZ9pI0NYTgU0PzZiYlj4z3KtEbKea36c0D356J0VMYkuQ6erp1v7HNMc4A7kVKHXt5VJKHLXKclYl355EqL+dKxf2lnwSmypJAqCYBPH/MwzLEs5vgFI7MSVU3L1NL9knQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M1EglC3e; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M1EglC3e"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e6880d106so309285ad.1
        for <imx@lists.linux.dev>; Wed, 07 May 2025 08:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746633151; x=1747237951; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=;
        b=M1EglC3eswVVuh0FeKP++HhuJPD419KUjn0oNCUXtNio5x+S+/++xnpywsufbQxKnJ
         SGdDVO7N6eKnMhUIB2onZ9t/CSb6O8b9mqSW+gWRMhxP21Jr5QB5hsaly1TT7zDHBZut
         fqNMS+Iy/8mj1oiczgG9jbVDvDjlhRWiecg+nNZVzK/hzA0ITBJ92reVXccjkuTXRiAg
         5FmY9tX+aGEzXmi/5Ovh19UXNFcbRf7TGeArZyDijwcgTRy76FoZjhjVswng8X15QOmO
         HCb2BkmzCIID8I+HZa88ZcMIWt15O6DiWRh7GPXTQsVVC4MsMi+hUhKGLrIqDIzhe5fA
         z6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633151; x=1747237951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCmXTEs9MesTHuPpFJ/NvOgzXDUn8ZZ+zdOFzC8r5lA=;
        b=v63CESI0TssLdP8E/LKIDnArxJIag3sEbWYx2So7n+p6Gplu1+fhdTxGBBgvF5Dxkr
         WaVqqf62MpSD7yTtVU8rtw8Hy64csJ9d1hCCAOiMkIt6DbA8guii+Zy1N5r9N8TR14GJ
         hT1B31R8Vf3agCljs1ZNMwIA6TWSq6LysbPdjJ4iwIOz7ucu0qOtXAwgOyBNe+dADpsO
         4PhpHTCPk5phFFZeq0p3hNN9LAjNW+DqqU5X9Vzb2HlIFopzaSTaChqjHH+uISbHoLPM
         Zyu2QfKW89qFalKtMfZKTEwY/WFTL54bXqFY13n2QuDwvkCR0IyZIIILd7LLZWgAQNBl
         qz1g==
X-Forwarded-Encrypted: i=1; AJvYcCXXpLgITcxkvF1rU4BAWnj8ChzS3JxL4vCB6Uwvi1kzXThNhlk2UHQeoUU/qG5JSCSEtrI=@lists.linux.dev
X-Gm-Message-State: AOJu0YyiNIrrpVYnpSP+HQoGhA5wZhvFNqpRpBbJonv6z6THbtjrJjXu
	dorgqKGXOLw9QD4xJc/KIU1i8UzK4A3b6FeT/TLcs3kAtJwg9fYU
X-Gm-Gg: ASbGncsVBUrCFetJdw1wXHj2N1r8ZfHI72S3+r7z4edYEDFBgVQJ/JioLmgXHhauLRc
	yIN1yRiilZpXL0Aknd9oi400UI0a9ODOVtSkWfqrrEYTRcweiuz8HzCZJpOXnmA3hcmTlvEQ2+Q
	VnvrPS+BJ+hLfLH8v4Ay6oGSeeMSB4Ur1mQNTvSMTxhwvHFXN5Y4ZrvIOHpU8p7Ez7NxpfLkMR1
	jLrQ3/JA98KCmUgpRYMkCwyFBpqoDRnQzDruAXerYYtLH2ulJXR88rJihyKe2wo/V/Iklr7PU2v
	C4JZ7WNofyT97s2gZbWJ2rJCqBHYyDXYIMuOwiw=
X-Google-Smtp-Source: AGHT+IGIeRiD//5aB3Lp0GTAmkUq9HKBWgvRug2zQlreh3HMZNf0lXvR6y+wTe0PX9iANCSO8Ya92Q==
X-Received: by 2002:a17:902:d2d0:b0:224:2175:b0cd with SMTP id d9443c01a7336-22e5ecade46mr51329175ad.26.1746633150657;
        Wed, 07 May 2025 08:52:30 -0700 (PDT)
Received: from hiago-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e15228f62sm95204515ad.168.2025.05.07.08.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:52:29 -0700 (PDT)
Date: Wed, 7 May 2025 12:52:24 -0300
From: Hiago De Franco <hiagofranco@gmail.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	Ulf Hansson <ulf.hansson@linaro.org>, linux-pm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Hiago De Franco <hiago.franco@toradex.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	daniel.baluta@nxp.com, iuliana.prodan@oss.nxp.com,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/3] firmware: imx: move get power mode function from
 scu-pd.c to misc.c
Message-ID: <20250507155224.uoxabve2qxncioqh@hiago-nb>
References: <20250505154849.64889-1-hiagofranco@gmail.com>
 <20250505154849.64889-3-hiagofranco@gmail.com>
 <20250506044618.GC24259@nxa18884-linux>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506044618.GC24259@nxa18884-linux>

Hi Peng,

On Tue, May 06, 2025 at 12:46:18PM +0800, Peng Fan wrote:
> On Mon, May 05, 2025 at 12:48:48PM -0300, Hiago De Franco wrote:
> >From: Hiago De Franco <hiago.franco@toradex.com>
> >
> >Move imx_sc_get_pd_power() from pmdomain/imx/scu-pd.c to
> >firmware/imx/misc.c and rename it to imx_sc_pm_get_resource_power_mode()
> >to maintain the same naming logic with other functions in misc.c.
> >
> >This makes the API available for other use cases. For example,
> >remoteproc/imx_rproc.c can now use this function to check the power mode
> >of the remote core.
>
> Better put this patch at the first I think.

Ok, I will do that.

>
> To be simple, I think just export
> imx_sc_get_pd_power in drivers/pmdomain/imx/scu-pd.c.
> And add the function declaration in include/linux/firmware/imx/sci.h.

I do not think this is correct, since it is specific to the scu-pd.c
driver and none of the functions there are exported. I believe the
correct implementation is moving to misc.c and export it there, just
like the other SCU API functions.

I will send a v2 today with the comments adressed, thanks.

>
> Not sure Ulf or Shawn is good with it.
>
> Regards,
> Peng
>

Cheers,
Hiago.
