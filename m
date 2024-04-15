Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1586C70CAD
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185258; cv=none; b=pX2b2kt1dkGU56MWBWULS5G0ghyPhk/XiOti1Mrb0N7SOw+E6S4EA9PQj0Sb58UzYGcdHsI1gUbGkz2uswRJmQNUu6khTLh/Jw83Nx6RZckLqLMms2UV270CkzkGmc2QfXBuIfxBYVDysNMYpQEAH/vJFFMTP9GczVxiamPb+pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185258; c=relaxed/simple;
	bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MdjGGXoLQcBIOZy6RzD3fBaOADAsRMR0urvfjbS/GGKG46LtYOAN5BNiSjjI8HWALr4vyvQZCkK37q+jkhQrse9ny9stjW3N2KL9PBMN8e2ExewNB6VqX0RNnej/Lphtc/ZNmlcyXGYQMfbJvYhGfQFryIpRSsRqCJlUDkSyw6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ME8Feg7s; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ME8Feg7s"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-41882c16824so291325e9.3
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185255; x=1713790055; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=ME8Feg7sEs/C5Z0rNZUyNw68cKseBYOPdM6OaFx3A/K28VvFwmxGyQ0y+A34nDOAVD
         DnoonEkCsl97tp7RQq+tk1RN2tG1m6tq3POzX5k2aPxCS0MElnq1le32L56IVStWaCS9
         kzABHCGPo/pq1jyzU13rPKgEmsChF/4vikY63ITPpdCvTOtpyUfMHlA5ROWxXKXrmK2I
         eQvryLPH52ioskx46Z84rE++GSGBRTBanxHoN+nwTquRv82UBpZwH9dydif5O2RMQSQC
         r0UHPHgD21erUQSGRdzDi2sEElCEbGngKlXARUexFo8mWt1kuX56wgi1+uBSM0TNZatG
         Ay3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185255; x=1713790055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t4xYvc7hHt8pbqXgosG7LpZfvaanvwAGHZrjcMgUgM=;
        b=Wi4XF+s69Zz8R16mNjgZaj+KGoxGZ5Z7n7Kf/6WLRy4Nx6RdXsl1BBU6eymHlyAZ9T
         SWnEyM4CqGciA9rfC2uRgOsV4aGB6uZuqorUaGxmrUAZydU1lvny1fdtIBT5DzrIu/SL
         AfdgtTXxFPlS+DD3/NNrzy5qe5ZA4Aph51WwRuzfcaVwQo9l6SSxitBHi4fWeQAIuvmv
         Vfp76nom+U7oUhBfBtGSWnP40IizMMOlBjlqDkbBC+Qjo6jPdEn789P7HhJcCiGJB/xp
         W0YVeUyz4p9tXy2FeBoyic26DWd93Y4CNLeifzAaN9iMKEMjpNTxUiD2mUhgStwJ1DPO
         WAGw==
X-Forwarded-Encrypted: i=1; AJvYcCWGoeZECMRPJU/pWUvZ3NkEp97N3Hpgkyo6EfK3gEqMczn6ZkJ84JIB+BpE47hQ50nTYCWUkyrmNaSiLals1ehud6/V
X-Gm-Message-State: AOJu0YwVoDGxNUP+EvpSIoEdMUPVMPTewV6eP2qPLu6uDCcwb8rZt5vd
	DK+hnZ0o4j2jiNZ/Eyd7I9PKfSYhVuosBSrraybvXMr75/F/m/Mv3IOTUfM7O4w=
X-Google-Smtp-Source: AGHT+IFkh12z6YoZcRxE26DaCtpPtJRpH8bNSc6xGkmU2C8eUzmYQG+zsWzJQF76MdI0E3ybiY+H/A==
X-Received: by 2002:a05:600c:4e8b:b0:416:3f85:d49 with SMTP id f11-20020a05600c4e8b00b004163f850d49mr7937971wmq.18.1713185255476;
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id n12-20020a05600c3b8c00b004165315d885sm19315874wms.11.2024.04.15.05.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:47:35 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:47:33 +0100
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
Subject: Re: [PATCH 02/18] backlight: ams369fg06: Constify lcd_ops
Message-ID: <20240415124733.GB222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-2-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:00PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
