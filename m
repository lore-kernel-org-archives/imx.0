Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2391B74BF2
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185356; cv=none; b=RM1Vve2G3iqiT9GZcLt/8ye0DGq4Z3XNNbYxVE4xf0Vz3Nl4PbJvYn7JDzhSDbHRNu4CvMbRdnVGeMpWHllrbmLKDnOFuSfJS5UwmLUQWmj/QXaZZGBnH95uReEkydBzFGTZRgSgRiCTiTAWv/e86DFgZiju+str3vB411oCQTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185356; c=relaxed/simple;
	bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R+/JKeqfq8mHi35ktWV1lCOdWx/C1Cgc9qrCKei2ay2tZWc+0+jPR+FUhLpNF/2RGjmJ48z+v+2hDuvrT4H/rFjK1A2ur7XpZ+4pccbtZq5tFC0iyHR/Cj1Jm8zSA8PlvIiOYBucHsaSDNpX2Bt1bPRiZwHRjm5DgIE2cFY+yWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHLDCvUm; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHLDCvUm"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41882c16824so302765e9.3
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185353; x=1713790153; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
        b=VHLDCvUmkW7JYELva2Y+7FEgO1ZcduhlHfWMjTbIllR9lrLfqXgi8PgPUzsj1wtvi7
         8b147LJ5lglfGn8q4YiAGjSrl0XS8tOQXEAAUmxryBUY42DylXK1Fms1wN7UlodSfEGe
         AmVVNxfS7GTFIgdYlKP4k6YwMFV8CSIWeud+8N0c9flhmfWFORdv0ndnmbK5LOhyBiUO
         mjZo6O+Sx6d9xa4rX0rEXacf43THyUpTlI+Kgv6N/D4GmaM4t6evl8DJxR2ptiZkhkUP
         Hx0GAC/G2ZzkPdm8+RdZJTKzJ8mHV33RUO6JBxruG5MO8BoqRdwURugZDjqffBHPz1FO
         MjGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185353; x=1713790153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UimYHbIWNJzstbVfXQ3wDGyO5qJZelnD1Pr7R7RINlo=;
        b=ZflntEO8TYQz8rxbXenugG1uE0zv+yorGvxgvTq/Ck3mOV/w3eSgitlpWvf9DpCQfh
         SaiQ3KjWUK7J4XnNchudLfMmg7MwGtXksn+Hg0bNAsTIj5BurxW4ombTu0PTUDHBEapM
         dtVwOzcmjOjXqJWYCiKg+OcbdRVHFQBrwgGBNUHbQnQJtt4qGzcBeQw/Ja/mkUcEsTsF
         0sZEKRdoYwiWgkpUSDchqWu09RS3ho+wRgwkUwkjTmbXgOGFiW3bckUp/wR9288I1noW
         2QvK4im3G6Z+EXB0KE0hW7hQl0EU8v7clJtXpLQB4qc6GrgrwCHAcmhpGvifmdtI8/kb
         UwzA==
X-Forwarded-Encrypted: i=1; AJvYcCWzyE6xBZs3oaW18ISDY/7mTKMewWP0bYbsTihEbBmuANsgLhOtPNLfP9IA9qb7zuN+mS9cgDCav2t4bwFi/G85V0fZ
X-Gm-Message-State: AOJu0YwCeWpojrGor/Je2YHY4xioCAb2lgn4jjHMriCB79GYTmmtMYJ9
	I/o+MNfOXGec9WzFsb6AaS66SBRBN/rW4XDR4Tm7NBlLaB43Q/EwX8s1Ftt5tYU=
X-Google-Smtp-Source: AGHT+IGio3O7mWx35mEvR609b07A+RZnNzN0tC57IoZigX+R2Bsw1mIXox4a962UuZkyigWVe02A1Q==
X-Received: by 2002:a05:600c:358d:b0:417:4ff3:391a with SMTP id p13-20020a05600c358d00b004174ff3391amr7933682wmq.31.1713185353445;
        Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id d4-20020adfc084000000b00343c1cd5aedsm12044366wrf.52.2024.04.15.05.49.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:13 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:11 +0100
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
Subject: Re: [PATCH 04/18] backlight: hx8357: Constify lcd_ops
Message-ID: <20240415124911.GD222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-4-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:02PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
