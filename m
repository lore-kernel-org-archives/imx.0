Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DF613C3E6
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185667; cv=none; b=YimePipbdWuwM1sQMROTBhC+pSHGhJvYbx1i7LWoJWJgZj8FPRr8/YlBKWRvHyE/FWXekD/aUG0lCCIDHynjiUPQJ4OPKm84/a1It11uhyXtAI7h15XvreR/B1aymLzPhTT1k4PyR5rfb4XLXmt6FZ4MXmn9lZRQ7Rqe5w4jMFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185667; c=relaxed/simple;
	bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r3Cmyz5Nqe2rbdP6TNx+CVemwgYPa2Kc+WSCPrW5Ip7AC6p1+o8O850Laj+NNw6O5jElnBnqQ0/jwhY6hgBD6+hFdWDY+ENlSHDrjpmLiHgUbhsCiFj+4WKWjFg27BvT95iyl4sV7FdPB8LnlDsuzMN5srVFVZtYp1/9fj+G3q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=fPNT611A; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fPNT611A"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2da0b3f7ad2so38433851fa.2
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185664; x=1713790464; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
        b=fPNT611At2RTMjts21y0smS4l7y8QrmegCjGK3xrdMZdWQ4cFOvo2SOWsAwhhJFsb6
         np9lBXWBQfOpytisTbVBEFtUbMwh5vUTPqV+ET3wQizwh5M/Uvr4HtsVaoVRPUqSCnQ7
         RK7U5Qkk8bPCqWcQ2wunUCyAl4/dy8Yc58eKGSjAl1mCC/zjD3w6+/9qs8Yyd2jrBn6+
         HZsf2U9RDFUAmR0z3q0Xq+8tF67NwPvhZHjK9nPXK8hgxAjVw1TyWUw4XmO16XFdv5w/
         BD3Ihrh+DfHtVUX8q19bRzWn7NIKTO9KrecwMXbzCKUrb0wSrI6mZUv9Vs0tRGvM2qpD
         vMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185664; x=1713790464;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hy9MHFehUy/zuX4NYpy8UxQhRHJAuB0rX2A35+Fa/0=;
        b=XDn1ry0n0X13LnZauAZvzghLC4dgtBFHAxI+S+iHAjZUmPFsN7XZ2nrsQFoeSO8HcN
         c8fHnpOhrxZ7w/klPT458ovZrtHk+fTwbCwTo3oFTkYNkSdPRPEX5V7oKkcosFG9oxtK
         E08ZegFUVG+ZLMnRx/q3OHQ7Ug1Ciin0u6jvrtaGPjWG6561jmbxyKf3MA615VP38mJ4
         6cxYtnSWuBv49FFMmPi8k/+LaFXRhNhHYg1uInlI8uZaLYo6exeDonKVyY6fG7/8mBF8
         HGM7FFL9l+7Yk8xyzS2bIjDZi+RyjT9olqIJGOI7Zi33W57rUZA3u5aeshK6pHzUwCo0
         0vxg==
X-Forwarded-Encrypted: i=1; AJvYcCX25ejiE7ouQWP4fFE0Jzx8p/95CubyE3Mqm/j5Fy505/HvhoOyLF+x8asC50zbMAz5fcL3jJWNwdamESylA5QjTpGa
X-Gm-Message-State: AOJu0Yz/+ZIsk/3zumv7fkkWzsiuZPtynQDOtXQD9kJKloGqkFn589z2
	2TFMI8sFDPgQwodO2GeceJNBOQRLhAbkjPpUK8jdfMNjJue1bQlO8Kbattm5CaI=
X-Google-Smtp-Source: AGHT+IHWAIlGaPkDWCdPgAXfWq/+MLUcSYotiH9LGBzmKnQ4SFxdrNrzwncOrZpKE9P8st08sqCGFg==
X-Received: by 2002:a2e:7a16:0:b0:2d2:4637:63f with SMTP id v22-20020a2e7a16000000b002d24637063fmr5787093ljc.45.1713185663909;
        Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n7-20020a05600c4f8700b004181ed7c033sm9730638wmq.24.2024.04.15.05.54.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:23 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:21 +0100
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
Subject: Re: [PATCH 10/18] backlight: lms501kf03: Constify lcd_ops
Message-ID: <20240415125421.GJ222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-10-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:08PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
