Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57B92F431F
	for <imx@lists.linux.dev>; Wed, 16 Jul 2025 12:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752667455; cv=none; b=cy3VWGqZ4t9wvZ1NGM6HtWJ+14fpJbVzchoIQin1wB/iioErWFivCGj0cXgXaTLH3P+gx7W3Qd9HAFFuJEqIPKh236FWWEjSHsVcP8wI9oKO4GrZSXxA8MeWN1DZzlnj8L4IWgg/avKYSabQ/MG20DeJSyqShzM/OFvKkpBAM5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752667455; c=relaxed/simple;
	bh=TvaafB06rCr8tuOU9vZPWgCbFPy7lxlkirtCxoG7TnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ugsCu1jXY2DSf7GzF86uCBHXdq+Qx6tnjCbqy/LAvFS43p4gp9KRAF4qH0UCgqHXapX9rcX9HmgM5N92ro3eSb7h/0+XlLewG/q93iRFLdxurmvjH/zoHEMzmVkykY43PPNJJdWAoxrrF4YdSZxMu+0WfRA/U4nXk6xmVihbMSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=I6e1QaPq; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="I6e1QaPq"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6099d89a19cso11826148a12.2
        for <imx@lists.linux.dev>; Wed, 16 Jul 2025 05:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752667452; x=1753272252; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=I6e1QaPq8P7ARQUOM4nIyP48TR/ddjFufJ94TDHAh184ebVV15c3MW/ExuVza8Oa+V
         vRiwB20bdpF3POzTLg7Z1e1lqiKueVK6QZ50daVm/JPJZW6BgDbyhPvPv9RzqqXsq0JW
         rAEV8r2gAN8OW189oQAvYzGy+n/0DdI+z5GE0g01OfdZJaDe11dogzsYwC4O4QF6u4AW
         lacTTMw6Vtn3DH7yWpgziGT2WFCzKYHbf5ElIcfCzzTGhOjXmKejnmI4pBnGCgzogIfY
         egR7dIH1VLEK5M9FaNCU4GNudn+7rnG78Klsj/hSx+6mjrwuXHkK3+l4vMEK/KoFcG6S
         ODcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752667452; x=1753272252;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsXEE1hISIb4cJAFw3dYr+DwstAQXXeJCNfdlxzLq1c=;
        b=IjM2Xm1qRlBWyfWdpHehB43DH4tiwxXF8750qRsY7vN2ATy9U5/fPfoJ0I3w+WH6MU
         YK1dnb4oT2WPxN3fWB8tOZ+aLleNMk2QPyiyBImMWN+OQWHJ00CgyZQWoPHw4irdXaBT
         7lFnf+LCM0P1CpUKzL14YyrhsIZO2DbJCsXFZsdcuNG0wDuwdA5gwR6TWbzwRxODR+Be
         jvOhh85T+sKXRcMxonn1Ewz7cmQ9DKBk2h3Rc9QGm2TZI7veey1o6haICOmjIrvRXquH
         anMtGlasWI4QZGBbYHNisI4ssnJk7C1HWIUDiki7EPmvLy9Z0RYmjnwCX7ezM6Ki17YK
         NY7g==
X-Gm-Message-State: AOJu0Yz0VRRe/CpJc0doPNPHCfy/FPpmHmCoMsCZLFkeBUlSyWQgiJpt
	k4IIXqai9pQZtiKaH/ghrvT8n+YjMGiJ8PqrfBwVSylyxhcCj1si1JWar5jdLF9jCeU=
X-Gm-Gg: ASbGnctnsGBlNSfn4U5Ebq/iH/ewq7nJYBJg/46NKzguDimNfamajVBqTCL4MZUKJ2Z
	RyWBmDPHf3rNiPbuKpPgmDegBauIoRwxD3wRhAsroAmeKxU53lmEtVPOsOdQiwpbtil00s3LGIL
	/+9WY/Fm062ZQLrz/ubjMa2SaTUUfqckVv+2WDoiQ/HgVSZhYx+fWQ/HzUBEqcgu57JRRPNqXvf
	voNFKN0+cVF185oizwtFibu4/tCSq8/ydyhQSojR+4aNXP4izxj4Eyxk5o+2am99heQ/BjB85DR
	mkjLmaJh5WWf78MV4PO3AkI1dRk4ZTq/3Mu3O5ee52Gr97v7TQLYx/BX9DG4qVyhYHUtauHy0KZ
	0w+BsVW7kIUZFlyFrnXJ4i38Q+XdfQQ==
X-Google-Smtp-Source: AGHT+IEhSGvwKZCfWmTvLUG6dGYIJWTd4OdkmaI9VTlT7Ykv1sEpL5pIQSQFmLdV3hms4bc49wFnVQ==
X-Received: by 2002:a05:6402:348a:b0:606:df70:7aa2 with SMTP id 4fb4d7f45d1cf-61285bf41c5mr2186091a12.31.1752667451997;
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Received: from linaro.org ([82.79.186.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-611c976d9f7sm8622193a12.54.2025.07.16.05.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jul 2025 05:04:11 -0700 (PDT)
Date: Wed, 16 Jul 2025 15:04:09 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Message-ID: <aHeVOYUhLu8uIhFe@linaro.org>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
 <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>

On 25-07-16 11:15:05, Laurentiu Palcu wrote:
> Currently, besides probe(), the platform data is read in both suspend()
> and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
> structure.
> 
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
