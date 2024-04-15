Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC65839EA
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185679; cv=none; b=M8Zf4vcPmN4HkiEb0Zr588XXjKSO5UXXqGAFQeO/y6FqXG3fiJcNjIaE5iXLEsjKHvnq5PjN/w7Ky/tajDuvSfB59qiT8eHxtWoOCv4KX1IUXor5bPsOtu8Gt1pQmzBPDF29m4uA6MWxbFiy73W09y1j9WyIsCw6+P1wT6YMae8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185679; c=relaxed/simple;
	bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mwmEkNfeVIfRN5yvem3rJyWzyjzT5WNkRLMu5kHNiknHwNe5CLlcxUG2yW/mMyi43tfvGJ7NLFLw4THrzqaG3Z0Zw/0erleED7pTTi02KbPLsd55ln/9z0l/lRBhehaNvXjGXWg3HcpNAUi8dWE/PRm0IaOjah0txKlOvvUbEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SfRMZhB4; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SfRMZhB4"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-345522f7c32so1237811f8f.0
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185676; x=1713790476; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=SfRMZhB4vsvQZsmuz0mEzeWoY+HL6349mhksBInI97HguLzbLSCZQUAB5gGPTX6LG0
         KXCqj+vt6nG+Rd9Pp2mY+m7tHheFnu6ffqr+P2E347bvH30otE3jJxXpDmhbkLt0sRx+
         hp/19bR9yNvcEpkDCX/GshT6fomhsyNKBzqNcnvg/qnZRsbx4Y/2PngaeIxauqwOhUVF
         fCyE3S28PiFIbw4RUXEYyvLFJwU1onSluzEsbQwb6tQxbDLmLp48fXPm1njFqSUpdwrS
         IIanNZfxBo5vFQ5y0FPSumHSVCeANt4rBAoi9gIBN/HBI4DoB/ivHc+iVNugsmtg7V9+
         O7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185676; x=1713790476;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuhwG+KvJtimhWZKcxuFPkQLiPrb/07vzj/We9k9VWQ=;
        b=eSZo9V2vUmy7/KJ4RMATDd+IMUc/0Ks038OiF6INbUQKfzeXfOZkOWLvI+JjZJV2v+
         q3xvJvk+cjWnIOuzFN78p9uxLcv2j/8H8ZHmQlXMAgmYVXo9CtyHtetgIZiGwxXyQi26
         CH0vwnUOO6KZ0sUwZvflRqSGmPIlS2zdwZ2gUDr10VN6wjhC+PcAJUkZSk7KcJaiQZlW
         MHzxjgj0JdUiUBr6zgFt4AcgcJyhmM2GEB2wHPv5WFzrk1+PLwpWuVGJuweUNSh6+Laa
         ynWR3ck+C3R2YvtZiiDQQg99lHXY5yW4wF0j5N9cwabc1T0BlYYbUBDeNRLTCxXH9xvH
         BIJw==
X-Forwarded-Encrypted: i=1; AJvYcCW/1hRa5rIiAqt7S6YtYsi+N43SqADUYqtNuNeZJOBiSJlQof2d4lhLxbX8aPJmqloiXu058TzMpkZU75lPHnGV0lGq
X-Gm-Message-State: AOJu0YzrDYkZBRvK5xCv+3fQ+5GKZp0+P7OAUyWfikmmsl2ebTIcETDD
	lKolK2l+dBrskgTUUD/x08X/To7cGYfTwjlZOFbyPZ5NySlUEXHUI2Qrh7F7vq8=
X-Google-Smtp-Source: AGHT+IEPwOHcdqSsBfyETbLBvAQKa/2hIYBPy4DXezVg6jyWxDrnmy5YGJEuZgB1Fbd9ZZPXlD2MlA==
X-Received: by 2002:adf:e545:0:b0:33e:7fbc:caea with SMTP id z5-20020adfe545000000b0033e7fbccaeamr7391360wrm.34.1713185676156;
        Mon, 15 Apr 2024 05:54:36 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id w6-20020a5d4b46000000b00341c7129e28sm12009728wrs.91.2024.04.15.05.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:54:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:54:33 +0100
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
Subject: Re: [PATCH 11/18] backlight: ltv350qv: Constify lcd_ops
Message-ID: <20240415125433.GK222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-11-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:09PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
