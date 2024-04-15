Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E046B84D3D
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185397; cv=none; b=jvAfgwi3xsW9ziDtWtdXhgRJ2BpsqOO2l42Htkkkhrk8/PS1YrGbzG+Wk7hqXRZmCnq9m2qUIzujLpdFZGHJHEvU3DsdOhMtIi3xkw3+Lvg+yx5vo7rpZ+vAeRw69j94iO6cIVMW6XgV/cbVl8DzhMA2APpuciLdny6Z/dn8Yno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185397; c=relaxed/simple;
	bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OlMl1R+uihBD2T9C7n34qg8Dp5bxtbFsqRrksd0CPDfuQCNpeGN/MmO+S45RZX4lE5iago4QQjvOmP6hYsGeoR1PRSyVlcgE0LS+aYgacyOXMKvWLHZgGOOHcZZPWwixQfXmT+LO6B322zfK3XhW6KWDl4hnb2zFSgY46P5E4g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MctxMwv1; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MctxMwv1"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4187ccbcd40so1937215e9.0
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185394; x=1713790194; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
        b=MctxMwv1Cit+wwfl7kIdz/qI7ThW8em4uaAcm/nrQsu/TgGSSwY+5GqzoFNIV3D9PH
         Wh44qmggulc7CcODVwfP1NOI9NqUba0a1GRxcat4X2RArY3YNVqQuEZxChKLkGORxoYD
         cwloQQIuu9KtfrakFJzieY6cHMx64xF3jkH2pUydMUkowI3D3KswtOnrOROxb56mT7b6
         kp7TJ3OTp+0d1PdMfdJhdGw4l5gYwSooT9IFsmVe3cCR3babyYXxHac1q8ESqigpsgIT
         CniknwAYM5l270z41w63EkdX5m5ssD3FszXPZkzqh3hMKmouUhTAUXgJB9PhSaG6vCz3
         SfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185394; x=1713790194;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YQTOMiU6gYM5FdXLFvC0kzpvxWDYETwVK1r4K+Qq21U=;
        b=HL/XzKu/vqjmfvOfSK2aMPxLemVIcwsA08Tx4BcnqIaWjtDBBIRnd8v2WwwNYQkGfe
         lDR5aWIFlYY7RClCAJEyyu8juUTc88nEcYL7IsVz2irzhwlmhrQX7QQM+CvctNbcrmPU
         sn8uxnyTIT86GiPPUR7NkpWwdtPnZdEfmpc460idiE3QWmF+DDElq4eOnNXW4/CrCi4X
         SxpomGjPqXTCT/5VcYeyWg/YaIrYPqkePFS076KkxRN+Rz9qns37P7K8jDGY3VI4dnvO
         qhyHAKXzSe8zZTaJ427AaaRa3PwHkc+tYHPr1ubLkcAIl0jsRiqc8mw9u82C3CvszsCI
         isqw==
X-Forwarded-Encrypted: i=1; AJvYcCUTEvt4/2v/m7aPW6Q356m1lcL7VpzROU12yg48eWQdbZEx486Qp9pb4Mz6DqFbo1oiUhIZj1w66EnMX8FJc9cC5uoI
X-Gm-Message-State: AOJu0Yy7P/NBLTsaw7X17D5IflhZGtXW8648yF6jFW36ODc49Z5oxEaH
	qkeVzim3ZjfSmPcj+sC9PjowGEP6ryObWhdgc9pQyNDTiQN0JR5MmZwM3A2MXPQ=
X-Google-Smtp-Source: AGHT+IE0jfEg8j9eNQ32UlJgwwRwcJBMnq8mxk2glq1rj3pDzq37W/GBcRUB+mKPUDxRmuZRlave7w==
X-Received: by 2002:a05:600c:458d:b0:416:b74d:eb94 with SMTP id r13-20020a05600c458d00b00416b74deb94mr7708786wmo.1.1713185394484;
        Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id m16-20020a05600c3b1000b004182b87aaacsm8741388wms.14.2024.04.15.05.49.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:49:54 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:49:52 +0100
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
Subject: Re: [PATCH 06/18] backlight: ili9320: Constify lcd_ops
Message-ID: <20240415124952.GF222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-6-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:36:04PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' is not modified by core backlight code, so it can be
> made const for increased code safety.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
