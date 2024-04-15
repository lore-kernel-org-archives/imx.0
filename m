Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63B9B7EF08
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185544; cv=none; b=djk1b6SjBZKKM/4R9znoOukzzSo1Huvy9J2qoZAtLxIMG6bg3VQvAtCNNeZPf70xIqlS80f5BKG1quG5Xflk+N68RTQznsEbumcgy2J1lr7gfY+xZ4snctOY5+pWrrEq5iNpB7cgIyGWz+n1QK9845O1SUDVlwp7SwsCLOg2Pk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185544; c=relaxed/simple;
	bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uU4u2jvv+ul+TxJ6zfVBTq3nxrJ9hfSPgS2YPLVa9RVpuBTy0O8ag3zz2COJUWFo2zG/D0JeX0WtQmwZTdQsnsh6HNBwWK/623k7TU2pUHmAFYGPz6S5/Hn8/UxU7fMzYbChUjR7OlDIzFni98YeqSG0bzguSWfAJMmfW3axmJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w2IFv7qi; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w2IFv7qi"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-518bad5f598so1656366e87.2
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185540; x=1713790340; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
        b=w2IFv7qiogyXH52Z+/UaeQ841k3VmuYFAl/KJLP9dJ16ovXuFPGDN3ZT5EbvNFC0AQ
         oF5tRPSRqHex1A1dIXVhpL7LvU1d7ADvGZG7linfgrF5WW6adHNZFd+IO/DhmVEUuxk5
         0FNT5iHTc9FA3ZG+G2kzEoSY6BOz3I28hlbdGvveTaT4vanoua08pGxy9jGCvA+HQAY0
         5xcqlExK6G2tb2YanHTWCeMfToXjqM4CBRrgTliCJwyP6Rj/dUyaRe1/h1A85S0Tc4Qr
         HBz8uWl7eaULp1Bu++f7M885+eXj5EZ0x1DJItitqv7u7jLGEj2g9IVm1WuWhF/3ifGY
         08HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185540; x=1713790340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=01ardidNL+/BeEuWA/146qtH9HDtmPA03ttD6ybAIEs=;
        b=hZ2Irs2CDj+HUuNUW7Ftzr1XbIRyB99B5mDWZ5GtWjKsfCvAS3eN/ZbH7gR5QW3/TP
         DuvlgkyY8kybg/G1c9ftKqlv6iKCr9qBOUrJrBVCcTlXH3ArR+cVPGG8z6wQL7ii0kz/
         hpcbC0CJluwJNhIsWyDsIgwWQ3Ja44tCqR5DcTi0xbGPQyLFfIAD5UcIaO4Z8PMyav/G
         ZV6oP90znFbSgidw91YuQN5Kar6DNTXKkkiTIN5LvlL9IDtVLjNN4uLbBtueBEsX+cn1
         GP1CCk2seCp0TxYMtFZHNn4t6qrkcRdpBcR7vhSSjck3Uu190HBTr+c4IfUXtlaECWby
         SrCA==
X-Forwarded-Encrypted: i=1; AJvYcCXI+Extw0pTHaPIL9PxGUWMaJOlhOuLNWODHav0EXUaVpy/v3+xMyIvCIdGvfgLPShdE5KrQ/dghrPET3ZF1hxXCytr
X-Gm-Message-State: AOJu0YyiusIkxdus+ydl2DvYJ42NaKIksEneG495pKtHF9h6oEdL8ZQk
	Pn2kJGh7mWPvXQezxiTNy62G1s5kdfFXmd7nkzs41TKN9m5yM1QXJ7SKCVw6OkQ=
X-Google-Smtp-Source: AGHT+IHu5tfg7Nur6nUM4tRHPyjM2leUDl2jKt9o9nLqolr31cl2B0ZsT4h/TE6rznaVk74mXQEafQ==
X-Received: by 2002:a05:651c:1543:b0:2da:901f:6ebd with SMTP id y3-20020a05651c154300b002da901f6ebdmr1300658ljp.41.1713185540482;
        Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c139100b0041496734318sm19430320wmf.24.2024.04.15.05.52.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:52:20 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:52:18 +0100
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
Subject: Re: [PATCH 07/18] backlight: jornada720_lcd: Constify lcd_ops
Message-ID: <20240415125218.GG222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-7-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:05PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
