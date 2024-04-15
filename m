Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF59E6FE22
	for <imx@lists.linux.dev>; Mon, 15 Apr 2024 12:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713185215; cv=none; b=Q6/Cs2L1gxERPVvdLTW7od+Z+ZQoJeQQIIiS2lVCIVJ76hSmH6JBtyNfugtZvQ8FTfv3PAhg2Ufghs9xuaahJJrzhE3xMDQQjBGn8QJdhsLn3ixzjPQfg9FPY3AxRm1+QtWONiuPNcvUWo1gW8G75cl+eYsxHqhSR3lid3WmXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713185215; c=relaxed/simple;
	bh=LZr9b2jjHgXnxRQrIHWuOp1TQFMyAy7pMficXH8VXFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AGvGR+iO6pvHgvZamwWx6hf/fqpswfLLahxlOd93HurTZtP9/WZ4FDas+BUpOqjV1QoYBok7LQDtwZmlkiPzXkAvduK76xzNNssfrjQ//OHyEoaSDq1Rjbr3pLBZKQXROLsTd2S2qw/YSHTMlb0EnJQc4X2EpXyuxNs9tmpu2iM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IrEBBaHS; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IrEBBaHS"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-417f5268b12so27066975e9.1
        for <imx@lists.linux.dev>; Mon, 15 Apr 2024 05:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713185212; x=1713790012; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
        b=IrEBBaHSrGvLmT4T63hkSJ/a2WGsUYpm9e+0wtaPtuABAAGb6ZoZbNQEWuhXkbEk43
         2XRzxElCFBUQpqRk+UkB5ZUpVpqpbvMeM55z3FKW9ldZ1W9bds+RktY8NA4YmElM/VyT
         kYdwWm0pRQjip7EjtmrQtBEnASj/EGnLWH2uD2uzWZUPDgm8N/iE5PkGcajuS6+YYmz6
         01Pjyz8UB45Y2Snzt7EAjDOOP/HVhQC3tSP8t285WMuuyArXYasnzCshjwDaHLJHFfCR
         fmzNMKBvvIzmGFOSBcoUYqRgaCcVMKVntfFaB4dKBC2DjVd8CPL6id2r8gkqBAoeNUki
         E5bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713185212; x=1713790012;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbZUbhG0ov/FwjYBTgroRKws49tP3YZqZ1e9nA++yqQ=;
        b=EjI4keQ+33+SrowFNvJF+yH10Gz1/RQpNy5jAepdVZg62i9kwRBQrcGBbBrMRIH/ee
         ylv6dTXOwdXWWpgSV74GIsYAYKlOIKieI4jAPc7tzmf4MOxayKvhWd5Ka8kGO7PsJseD
         XGGAU2iLk005GQZhdJpx1w3n+21jgZVUIKk+riy2dbZmQ6UTcr4bcKA0N+QgMqGqqLAE
         u9LtzWXmj0FeDgZlEAC8DZv01qvXhwuBy+H6+2MfXqNZAh8jAmMeOZ+hsYagw/x+Od0k
         F2d8HNq6xvON3MUkSrMgU8EMzQag8gge8oehEJ3bf1+0qr9DwajhMXRQRc+d35VwlOlO
         0ebQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKjzfhN8PucCTeSjmUU5UnHoUgdUjE5bI3b7AMBl0yM3tVHzQ4KXTnPNN3eXR9ikM+hoNB/fzIhlAWZ5GojDK2LbRN
X-Gm-Message-State: AOJu0Yxz63hmoBqqO3vDC9sIdJ+k2AX0ZEUoUWRH8JOjULP/MX2eV5QW
	5jkzrCx0clqYTC5Q89gAIjSeGiYZH2EpQgHv54eOMI3Hm4JOQCbyFt999fwKS8A=
X-Google-Smtp-Source: AGHT+IGhmqnCG1TcWkxS+Zn15K31a+Oo01IPIQuW6ofPPWCyjZuMzPolU6GYhaxMv6ytY7keceZXhg==
X-Received: by 2002:a05:600c:1e21:b0:418:6cda:e95e with SMTP id ay33-20020a05600c1e2100b004186cdae95emr1418529wmb.8.1713185212321;
        Mon, 15 Apr 2024 05:46:52 -0700 (PDT)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id w16-20020a05600c475000b00417e36953a0sm14818200wmo.20.2024.04.15.05.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 05:46:51 -0700 (PDT)
Date: Mon, 15 Apr 2024 13:46:49 +0100
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
Subject: Re: [PATCH 01/18] backlight: Constify lcd_ops
Message-ID: <20240415124649.GA222427@aspen.lan>
References: <20240414-video-backlight-lcd-ops-v1-0-9b37fcbf546a@kernel.org>
 <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240414-video-backlight-lcd-ops-v1-1-9b37fcbf546a@kernel.org>

On Sun, Apr 14, 2024 at 06:35:59PM +0200, Krzysztof Kozlowski wrote:
> 'struct lcd_ops' passed in lcd_device_register() is not modified by core
> backlight code, so it can be made const for code safety.  This allows
> drivers to also define the structure as const.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>


Daniel.
