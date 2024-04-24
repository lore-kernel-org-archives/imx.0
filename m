Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA60158D99
	for <imx@lists.linux.dev>; Wed, 24 Apr 2024 10:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713953301; cv=none; b=h/Rq9oEXph2mEHY5rbTqtEllDrrSmOsuGHLtB4JzcgJGXpGY8LHjQqijUFu4II2PFGwCNb5ij1OEkkTHO+E8ZC39t0i+rw4uRxIqK5T8aTTbLk3V0l/24cB0iPkg4yLlkZy7ML4FsAgBiiejDm2AOgM7rnoRhITebPkUNdckbzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713953301; c=relaxed/simple;
	bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5B6bGunhYyePBzkqYl1xIpkwuhoOflkPUx2cKP+y2PkiuEwWIcNKNPF+RZkLUCpv/UbM+qO+er3o9BSpsnX8h6ZhGZm5yJIdouuhA3X0vb9vinLRSeu1w/NA0YiEs3WpIgTj43MyHWOrZ0qoPjfiJF0ppJ3wNc+Lso9pQ1mOoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OIvB97vR; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OIvB97vR"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-41b09fb205dso2460815e9.0
        for <imx@lists.linux.dev>; Wed, 24 Apr 2024 03:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713953298; x=1714558098; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=OIvB97vRhFSyIkl/KAvu1gSnn+f5Z23O2f640axUHP76ciTgvXuNwR/Ww6D5NVnsoi
         12yZw6ZE6Pn7FIC+3mTBF9/OIl/EZ9TfM5a/W7O6FC177HlpiXHZc104SuvzUAVw6Nr8
         F+Q4J+yLJ6KxaNAHfNxtnCwgq1bvNh1HQQlIE9klIBU6x7qAAIwBgjI1riVSPAnV1iNS
         UT1a9y+kD/R1wGbyKWxzw2ces63NJUW8i7W9HF6QK2qfUbvv/OGJiqYAM+5taQP1a/59
         /iMYoyFKPakwhuyhGHOioaOBd3uRjLEzCIaEf0wtWnji4BOCBytUckIbeALlSM/V7O/P
         FeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713953298; x=1714558098;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWKDax4TuNvBE1FyIl8irPm+6EhpYQ3vGRHf4jX8q2k=;
        b=BD8zyp/rlbrfCM0XauIH6FwQD2TAYr9HRCEw6pJrvip5nED74fCXIUSy2rKIjqv6aY
         Pbg1cqe4AywVRrHWFEIxlzvTu5i1OJq4E3vU5TEsclPPX4uGCgmEuKw+Vn1oKIKIm8+c
         kugxaGkB7dmyFt+40C7GtIgo/Fu49GPPmDpPxryLtcqGPFstrcuiYXvPoZAqgw3p4+uG
         /XhBlwI29bBSKpvWbiJxORopvenXz2WcVtOkw1ovtFPiKfOay8Lzhr5PWSBKe2naShrm
         shOEkk87E9VmY8/AAL9ZzMTOoPeeYWhnVKN52Khfb5ru/jMEajOBm0cPQ5DsyKpBPlJQ
         pFmw==
X-Forwarded-Encrypted: i=1; AJvYcCWlVi8/2h2yCSHn8yixZynPsVJQmkubMMWvCz/0FM7oWQflk+WqqbxAO7cKDThp2B0EkPwRj1CqbFOzG9/SlBnEJeKH
X-Gm-Message-State: AOJu0Yy6YP46qFf7qCmzVOCrFkKE/7RojRAFIyzn7nS3JQJ7ogwNrL+5
	vYo0jOh4UkwtKD+e4/0Zh6cBzdbWxVIwQ5xYcu+j8bQAcTkfaDsYeIXqqFtAK8c=
X-Google-Smtp-Source: AGHT+IF77S0eO7Dutrp6EQMSf6hVu3p2iJBEOx/XxaPtob8SJQvhDdTvZkjJjS4pcN8hkeXUmu2lXw==
X-Received: by 2002:a05:600c:45c6:b0:41a:a521:9699 with SMTP id s6-20020a05600c45c600b0041aa5219699mr1556544wmo.4.1713953297960;
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id jg3-20020a05600ca00300b0041affdeeb99sm1634085wmb.39.2024.04.24.03.08.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 03:08:17 -0700 (PDT)
Date: Wed, 24 Apr 2024 11:08:15 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Helge Deller <deller@gmx.de>,
	Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@linux-vserver.org>,
	Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	Alexander Shiyan <shc_work@mail.ru>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Subject: Re: [PATCH v2 19/19] const_structs.checkpatch: add lcd_ops
Message-ID: <20240424100815.GE1567803@aspen.lan>
References: <20240424-video-backlight-lcd-ops-v2-0-1aaa82b07bc6@kernel.org>
 <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240424-video-backlight-lcd-ops-v2-19-1aaa82b07bc6@kernel.org>

On Wed, Apr 24, 2024 at 08:33:45AM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core code.
>
> Suggested-by: Thomas Weiﬂschuh <linux@weissschuh.net>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
