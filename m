Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD5683CC9
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185693; cv=none; b=mWL6F38s2WZhvPWDGk8IE8DHvJ8ONzMOvj2zF+ZiiTGYFPSFyRsG8U4AQ1428RDXnqUnzNRHHE/jzg0JPp7/fnyaa3lx2sPL3ptUlz7RaG8jLyYRKhIZAJ3cF/rNUlRlUZNGSatfEqp9dIYsQIUun1KvudT//cNbO7IapFSOkFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185693; c=relaxed/simple;
	bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maZIQejsNv0e3YPiOn6HFIbH10mIpfvruRFyhP6S+LO5uYdCLK/7MT9IunkCntBWBKb8f8QZdO/1tirtgYFBWm7t1DNsEsouRmR30ZiDGtMlIQ0SOokRZu411hldWGfhbN+unh0bOc+SsbHQxMoM674KYtgrMpPgVtSYNTBb1aU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gkr0WpW8; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gkr0WpW8"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad2so38437641fa.2
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185690; x=1713790490; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
        b=gkr0WpW8uY9MtI7d9l8QKS3XMy1SZc0wi1WuA/cTJqzYP3Wk8zbf4reDoRo8udGYbM
         83REIMxLPpHPLTYtGGbN6PPxWR7DPLYXH5DSFHWbWTqVLtXyuHERhqtBP7VPz/Cf2+oI
         NJEJzIV+dUmO9GUJ3ZAuZFDuAUzLd/BkvKMeNPdQoZkc3pRWd/nkno3Oyf6KySyI1p1Z
         Ey48gBfh/PGLQZaZEN9tdPfzJ/Bg+LCYRMm9J0i906dqYeZBJdvXr+zs/Cj6z7vmTFk5
         fGRlOmVG1twJvnFL+xD62Bv30sDBrDv1IMwXGIsm+FOQve8zyI55lWNvCPsStKwTNRs/
         8/sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185690; x=1713790490;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=59f281dHkUN3AP2oLzzLuo3JgEJxzPeKM9+dan+z5jg=;
        b=VC69/mNcjAU9jO71vXn96XsOIH79fmWnL4M6kt8DAHfjIKwFiWU4ThFm3i6a0AqJrf
         GptLzVb6OSCKGi9BKaLdIXrOjbMF1ucl2jxANNDweTSjdsbdEGyAEPAIfXUPIJv+p4GK
         ASI20/Fao24anuJNfk7zNMmb+pCFHd+Hol2EwsRhBijL43w+gxZgd84ipKIh3FldjOJd
         em9AhDpI4mtGeQMKVpSw2vmB6iI/ideeun3dTHiZ/2pRkZiVPXyuMZHQwkNeQtHNyQQc
         R0TJ7jHuLUzObK1ht8LsgRRCExbZa6YbkS04FyqX+s8u3OAnuWO4Adx/ebZ8BuGfbsoi
         XDpw==
X-Forwarded-Encrypted: i=1; AJvYcCW0gg5XjjuqYHl9CZJoxgn5EuNi8bXrI41Av8OPNhYsmKplbu+ZQjKYnkDZcwMuj40W5gCcZVc7GpKx+wCjiLQBEjEk
X-Gm-Message-State: AOJu0YxJmPEnXLResUfNc9SCaoypdFt+mre8lN9tCZXef0SybghaOL1b
	4yQAWhLAHtM0isETFLjk1AYWo8Uyb1QwrbC07/NjFyAuMwyGuTbsL86MsB1QTAE=
X-Google-Smtp-Source: AGHT+IFrtoNRAy8uJsV4JsI0aS0ZrMcXBvUk3IjrcXoc1WAmiqGm9I5p36WylWsaC96BOzcw3ftNXA==
X-Received: by 2002:a2e:97c5:0:b0:2d8:abb1:b311 with SMTP id m5-20020a2e97c5000000b002d8abb1b311mr5397736ljj.44.1713185689650;
        Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c19c600b004187ccbca8dsm941622wmq.42.2024.04.15.05.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:47 +0100
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
	linux-omap@vger.kernel.org
Subject: Re: [PATCH 12/18] backlight: otm3225a: Constify lcd_ops
Message-ID: <20240415125447.GL222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-12-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:10PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
