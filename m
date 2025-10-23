Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39522F14C
	for <imx@lists.linux.dev>; Thu, 23 Oct 2025 06:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761202598; cv=none; b=BPDmAnKppEfXWMT9gs3VRvx3teTII/n8QLiAW7ADWc4qqkN7rxynE8xAOClcSooQj5htkc0ubcR/ALXXCsjvr8sjRRJRdurbJhTGf+ya4vyeCNdidusoKgW+vgYUIl97EU7QfoKn95y6ZgHjSijeU/AXfN8i8Fe7QpUtYYsMzGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761202598; c=relaxed/simple;
	bh=OjQdk0BZdnyHlEpPWBMKC7iucCp4Zd2OGCyrXtd6FSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IThmVByyudZHCRY9DUDJU6LmDO8xGYh094FzDIdMEfqrU3pVshdDIwyu/qJkubuYNItaZ4W303g3tWbIf/pO4BptFbEkQiBnSqlvWb+VZqXeNoTaOuDSNIoS8eAqEjIg1F4kr6kq+27DEydjlWHOj2KMFfgRV3Zw7Yylj9MB9Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RII4cpjD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RII4cpjD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-47109187c32so1573065e9.2
        for <imx@lists.linux.dev>; Wed, 22 Oct 2025 23:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761202595; x=1761807395; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=RII4cpjDp80U85SmDh9xGL6OreI+HYERJnJ67pj4HAFE2QAjWMHkqWg7f/A94xy2Wm
         IBn52exEjgMLOJwjIkQvPWxNb5d695EuZ90FOlX6CkYmIKdpoZfMYw4eByv2+q3Fbe4O
         H/sBny6sMA02JuXqb5hD7+7FEEzeb9Ba2AsWD8SQJ6SFe9JRpYkcyipxHyQUMlf6hxpB
         tjV2nhtxVOZGNnVre7L6+uNTbSsnLrva/cuza4q1D5ABVlPe0RajKSDZAPwa+aB6cjAs
         C8V3EonY+d98e+Uz3ZpU2oRCfrNBnW2FDIFywKEeAbe/UY2A36HWlfLdKwIGvzQwt4kC
         f7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761202595; x=1761807395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uBL9lupI6VldWKtWDKOusMstyfxtbMzxrKyxN/4ZaQY=;
        b=b9OwHtbp6chWr8Z2yJ2+NSaLD2teVTjrjowTuV3qN7c7ErSdkAwk+OTwgYtZ2XtCVK
         IwGX7F6KwGJPqaziJLpsjsO5HdcAFboDtlUW+i5AmQMLrF5nIltVtb8dYMYVvpILcs4c
         ULJA8O7kwFtMeCc/saqWcA7Lg+hJCbpDLdPXuNM8yxOOkirQ/XAZsT2Nw3KyteYQL4fK
         c4QnK11DEc7Jj9u+/+/cXjgPqTEo1Pv58mUwxjZdeDs3xzL1747/4ps5IYFAnoIfDk1F
         vP4ywnXjINjXVTYWM2jASNslRtQxoAWNaX7f743CtVfTzFhZZlL37R+tzdv0JqBLLR0Z
         sbYA==
X-Forwarded-Encrypted: i=1; AJvYcCU7ZZlYmmur6ASBBTQjBevstpSyS+dIBLDnpgw6tRX2fkV1rKnDCW4yDcZcGZv/U6cArRw=@lists.linux.dev
X-Gm-Message-State: AOJu0YwHDiSJ0jkpEjsaknky8jJA0HcpAK4mDNRAAD8j8sRpmd5fo8w6
	vcixcnrPPTHBirQbjrudEtB+09KE/YuXTueq0BOx4BSRL+7g9ogmr0EbpbNRATfP4a4=
X-Gm-Gg: ASbGnctav0Yt3XfusWUSKnC7C/EQib87FNpTIgeonAoAr7r5wBXN4FkQF/ZRuzVfsWu
	7Up8TiNkXkQuDFN5eZ6/mHh02a2nxgFaNnoeNIV9S8Il1s19jPXNI+UDmVpiaCIyL3KsOztSzn2
	V1TwGyknAVe2JwJYPJDGkbbch9DX7Q0Vb0dueQJd9tfGv/vVM+Blz1EZMghNJy06e6vOAA/ktgq
	zG8lBddszvQxlBjy1kjd6gvHbEQbXJtPtc9ZhHKkRpBL8xNBJx84aQ2qOg61ufZ2nSOrJiBFGc8
	WludeLQnxa18F4szM7raR+71/gNqh55m3YoyBJQjDUhZmf6BPatbeCTETw1gaIJzJRPG3IBDjCE
	u9jX+ZqJtdh7WWR4siRasEyNJu1mN2cvmgLHatQGABaMKin6hcuSqutMdQDQcWdST3QFdzSzSLK
	EfZAfH0/o=
X-Google-Smtp-Source: AGHT+IGpQD/mtL5CvJA6o/mUd4UXTKshusdC3K11xj2LRMgyz3ANFxCnibnxcRJODpBqSTGDyYLPBA==
X-Received: by 2002:a05:600c:1493:b0:471:1c48:7c5a with SMTP id 5b1f17b1804b1-4711c487d74mr115681885e9.9.1761202594902;
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Received: from linaro.org ([86.121.7.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494ac30b4sm52576665e9.2.2025.10.22.23.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 23:56:34 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:56:31 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>, 
	Shengjiu Wang <shengjiu.wang@nxp.com>, Frank Li <frank.li@nxp.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx: imx8mp-audiomix: Use the auxiliary device
 creation helper
Message-ID: <4skca2rmh7pfasmptplp24uucst264idevjbjhid4uj3fbxelg@ap2mzqkmbqtl>
References: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023-auxiliary-v1-1-0a16fa4c3cdd@nxp.com>

On 25-10-23 09:49:32, Peng Fan wrote:
> Use the auxiliary device creation helper to remove some boilerplate code.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

With Frank's suggestion in place, LGTM, so:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
