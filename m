Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C08FE6FE36
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185330; cv=none; b=m3rcSbXtMo1Ckc8g2q0efyBBQuaSwvuE2ls8fOY0MTB7hUjxHAvATuEa0R7NKCygzZd/KoAfd76Sze7MCGqExei6aUiHX3yumFuXfQ8UwpAe22dibwh+4bScWVEd90iUtNJJTIT1y2eVwlg7pgZRzJlMcafzzqQcY1axUbLFJBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185330; c=relaxed/simple;
	bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bklvVuKDRbAp4cW/ZuiInMnr56C83dgMNgPFSzwzDRllf9JMzVwZ++cyWmhwe9YN7TpXXIlps/0S3zVe/OTuepMw/SU3yeCBQ9gMEd3uV7pmyCYM7WfZN10jmN3ckrGz+UdPf57T7gJVwmCWRfbWvf/IJUsYbOH7ooqHLKql60Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lobGfhUd; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lobGfhUd"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-41879f3d204so2432455e9.3
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185327; x=1713790127; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=lobGfhUdO8nHla6uCYb0NR9Qh30Pt2lC1pQzR+D2purx6/TWI6He6W3AMGIhkBmVsw
         lR+ca/gQNRqVv4OmQBK3Nw9YiOB7VMFeTxtuOkzllAT9yfxWmKxiqdLSs3O7YxvMcJcB
         v+FzziojKaJt0+FHSENowpGWyINyBbbPWaOjEqVwHN1weG8d3dt92YpeXSnqie4AAimP
         YTauvZYfGv+SiIjn86JbpUzbA4kA8TPi7GpwSM2ceWOvkAiEr3mfQCbg/LJorGqITC/T
         7C5s7yMno2wKOfHXqUX8dxVWSnNOSaUPm8C01uJnJgVCRUSUu2OPYoHSRxxuRRuzeYBq
         youA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185327; x=1713790127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYBgV11sH3JLVboFSXkJgCoU/xJb2f3Jo4YenY/vo9Y=;
        b=d1DNcsa22rMKFd0cwiloLEAgSV93ChZH7OYRXi09aSdT13f8+1VBmU2NhRbaPqBGM2
         XAojyYdlvt4YTMxL8xrIr5z5sZiLXIU8u58ahTlyPI6XVEluluHh3006gMWhJhxCJfSc
         oBzzyJ6w2h1mnRq6kS3ieM3dJp5FyjbpuvjKDIZRxflewcouqRjpvUfvpiu7l3O2q2o4
         vkioH+AK752QfNqiEUl3+godU/S+3OcVNrQ3didPOc/Y+8ABgfGi5+iOVNVUDGux/YEQ
         ua/kVLfJ1SkCZNwwjv8I5JUV2iicUSQne4wofOoy6CmxcAnCDNiYHYn8w6+/pDZIzPpr
         lW3A==
X-Forwarded-Encrypted: i=1; AJvYcCWls2Am8dnqqbt7ih/CZwSzhq9IVuMt65pNAUhU2SmIXgG99PEh79ISf2S9+1sNwaUxzTitAFJmVRQw9WR2XUeDj2OV
X-Gm-Message-State: AOJu0YzMdw0VXyMp65Nc2L2JlMnJpJTUm2Y0A7ggQ3+taQlwqY6NZhdY
	cTmyu5a6CIgVU23zYENwD6BenDS2J8/LrQYMJ/mdZPvNzKtYSWUpacx0m8XvdMk=
X-Google-Smtp-Source: AGHT+IHAa4VIIZPfYQm1PVHVmrI/agaXvepugvesuVkXOga7yarPxPBfCgzSQL+8bsNFdokUf2ibJw==
X-Received: by 2002:a05:600c:3511:b0:418:3f54:1132 with SMTP id h17-20020a05600c351100b004183f541132mr3484001wmq.12.1713185327355;
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id a13-20020a05600c348d00b004186eb69a55sm2411188wmq.25.2024.04.15.05.48.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:48:47 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:48:45 +0100
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
Subject: Re: [PATCH 03/18] backlight: corgi_lcd: Constify lcd_ops
Message-ID: <20240415124845.GC222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-3-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:01PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
