Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EE77F7F7
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185378; cv=none; b=snTb/lRcn0chDQj/CQ++czMgPUn/newAuC8rSEoUYLfsr/OYv4WSHJ4QYm2DJJZn/nlsNsxTS0cyZscx3ZZpGLsEJRsiF69zRHO9TfDySJbPvZ6Fr3CqqYJjnH3V4yvms5An3LSK03+OHYHIisRMP22LFyYVh0XHT7aD+ADUGvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185378; c=relaxed/simple;
	bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S3sWuGj8xrysocTnlQorty6LqS5JAoi3iScScSJx5W5C2HcnQICGPe5rZlxTK9oXBLlwWk5d/sGcabh7GZgi9t0CdpY7LEe4aFrvnw/mnBLne7aE3ne0L9RcL2q05ctZUL7QM5k6pPbqFb89wjmw4X2iO7h3hUVdt2Y2XkFydzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mnnxoW9H; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mnnxoW9H"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-418671bac0aso3490235e9.1
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185374; x=1713790174; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=mnnxoW9HmLbxFcc0FeFpJKab+UdEG3Hxvb5ZDqZXCukTIEzIZC5YY3F73rC7D0WFgg
         xhzz/b53YdxN3VWAdqrHf+r/wlJAR/aQXJWsIsQgHnnxxtHScye4mGyh/RO63Yq52RND
         y4tRfyylOYr3uHjYik8947w5QRP1pq3UAz3WdLm+7wo0SAU+RtVlI+M3MMFnJO/5uZ9Z
         ZeMHK6QDxLpPJ9NGOqeaVlvxrzu4ytskSmQiqOESffFp3yubQVsGkkWrAUxjRb4HeDmi
         kM6hyrz3SQyD+w1m+AJF6Tkge7onBIFU6mhV7fR7JR4s6HwbfLdGlyVj7QmtqN54mgAz
         cWJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185374; x=1713790174;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YIJFnYRyaWXrPlltVrIgYB7IVIKl7WksqYGlHILtZ0=;
        b=VQdVN/A1OgQgH1Vg3F/HdE/bo5a85qbqeGQlb7D0z4hAOhikmpRfjajurUO+tVnGpx
         3WDHrN3OZLF1Ob0ZzxQd+bajALrxpgkFr9luQfTHLOXfFMpgZjORC1e9UGL1giYlQk4V
         Fs0/F9P9qfjkITe9iJgfaT12fQ2Z/1GZ9QMi5GDwVbiCfxooZ8Wi2j2BQL9n3x1gY3cB
         oDld4ny4ZqXiqOCzmABo116z81I1JdcFMUaZ4xi4rAaSAk32Bst8D9PJRfy2imbjOcDT
         Kbxjj87PJ+aSrdlkCGnR13PRHA0o1AZEZuk6whiGidyJQEbBOSAgQEDMhtv7/yczPJge
         hdJA==
X-Forwarded-Encrypted: i=1; AJvYcCWL9D7rNI+jxT/ZJa3FVYGROoQFA6u/uCCrUKA9Eu7whiuxguEZYnORRWwt7mdCiVgnSA9NwQZ4HhxSCTt9pu/hnpeK
X-Gm-Message-State: AOJu0YyyZ7LL9TKxob4KKDmJNkd/5SzEuXoLwC4e60Mjr2bBmaPk7E3m
	UGKE2+PRO63ogt3ogV4ck/Q4yxjR6zSj+6ax6xVhcXTPTkJE+qGUGGhcwF43QDw=
X-Google-Smtp-Source: AGHT+IERNVIb7kkkXkEPWlxI4SlxeSXGIdHfAlszM7dr954BuhwHUlim2WOUoHyibBjW2LFxYJ6i9g==
X-Received: by 2002:a5d:4e0a:0:b0:33d:fb3:9021 with SMTP id p10-20020a5d4e0a000000b0033d0fb39021mr6183299wrt.54.1713185374316;
        Mon, 15 Apr 2024 05:49:34 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id p5-20020a5d4e05000000b0033b48190e5esm12005471wrt.67.2024.04.15.05.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:33 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:31 +0100
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
Subject: Re: [PATCH 05/18] backlight: ili922x: Constify lcd_ops
Message-ID: <20240415124931.GE222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-5-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
