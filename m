Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EF43101BA
	for <imx@lists.linux.dev>; Mon,  8 Dec 2025 10:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190163; cv=none; b=QDr0AalbGgxZKoyhBc3f5luuAbuHszPAxTwlBUED0KBbnLwaSDQzgFrsRVzXJ/JYsHPBaZyhKlnQFPNr7GP5HUkIx/5RYZIV9U9CspR6F483v2xPtPR7JX69QNekX63ORap6fZdOdB6KCrwBxpQlj+YrNc3m49cODUZPlw/esgU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190163; c=relaxed/simple;
	bh=s0L/F0IMsYB37Rxo4CHT7apF8oSazdCraUwxwRSEMFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtxoAGQ58Ff19YD2zqPf0sEDfjwV3njffMtFHKCiZhpCmlN1XszT5En8vJo5A+GlRrRXcj28ZPjKM/Z7oPjdqWagef9dv/lEsOLAmivFM7PR9+sY0yto0l03tQPAAm6+5v59LSniVwro/PwkO2DIzQzTsUkh4qLQGEwG+fkutIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=n+A5Wh7O; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="n+A5Wh7O"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-477a1c28778so55773245e9.3
        for <imx@lists.linux.dev>; Mon, 08 Dec 2025 02:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765190159; x=1765794959; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=n+A5Wh7OeeuSEecag3a0UGJ+Q73kd+2LQzyHD4CH4n4Coyi+liYbrQQMaq/+/uXbeo
         1k5ETzDxDrjdaA8Mgb5t1l850qghYYsIVOtlOmbbgN4rqtq67S+6JNQEXvwVFdpFwl+w
         YxIHQHSCrtsP7JCUIPSe7RbG7eH8KUYaoKP8yWYSKhd/oK1m1Vxfaf8+kDELLp95zZxy
         wwp7GJMwut9gUPeJAyVWxGu1CMJLbXd9J+gFzMfShFyqVmm3ScRtRaYcUszTE0zbl4Yp
         d0j+x4BfQIACGjiIQOX6gwOneIXHhv/grWeRvfRi+FLZ/VSbMpha5kwwmKwLQxVvOg8w
         d3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765190159; x=1765794959;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+E3SOYkqsEc+5aDXpHHAZRqmKpJ7LXworventsdWgtI=;
        b=kj3fkbmujOUR0nd9OkC6rFwirQBZvT8PIFt5ZUwyUTK1M4KJtY5cDelwQSwyJM+XB2
         THI7R+oJMiBO13bLIfNruNddYDZ3a0zRxJYWIz0kmwQ/9VIizQGaBJH3ghvpfgwrHFtM
         a6YJpJwe0LiY5Bv3nqgQslcc4NPotvUXKqyCHg9hQ4aupG5PsaiEtloWHBRPBX9mG1um
         1RYn8bf6rqr53Q9Iuo7N11w2LkUXKCt3MT6AKj0VQxTexvtzj7aT/a+nIWXKh7mV2zig
         jcbYVJIgEf7w+unTNqhzDa0FAC96D3Xnlr748YziTJ1+DzRkMs7sNMxlbKcrCxRv5T1H
         E6Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWQFNiHWCT50+++vti2BvdOTIP7pSL28mV8wScswiIMucNRF1nmfIGm5QY6bTtxfS7KsxU=@lists.linux.dev
X-Gm-Message-State: AOJu0YweDi6Yd/znGEMm7nPzjdmR9OK8ZtVAn9wRAwXixkLxNdVw3Fdb
	9gVgIhH6+DaWwfjXu3MWcvZullzLCrIeEhsBX9ES37zeT2TJ2irTHUAlfCtTTEPvGmDX9cQWfb2
	A7tYBErc=
X-Gm-Gg: ASbGncughvgDvvXFy4GZUslLkTYyMAa6MnHnWTgaIn9IOdEK6EG+q+6sNWv7NyoK4Mz
	oJiwFA1iZuXqln8RCC3ENPzHX+KaQUl++TUjdm09B5khP9EKhrb6jSL4Ol2w3ZY+ETZAEfbMKhO
	Na4JsDnYFhMfKaTgh8wjrtyyS07J7RqN9hrqygDsz95iRjx0jowMj+LtqgXKbjK4GxX8kQavEaV
	+W9TSK1Ssg2srtOov4NEmQ+NFvgm60UtHDnvAx62PxbxHEUCDuE+I8jeADRBMVAjto6TpBTzAVY
	wG46IdGWn4I3qGhavtw2Gvr7wqPVxYVXHjBHvljBuN9ZU3NDRpVl2x8asSugQXzkBn85VMCq1NP
	Y8T/pPG/WmPs59/A87dkVSyO4XE+eeS1JHyyXI4HxbvcO2CPggLzhczSNltYa8uRFegghP205jI
	wPvwBvR7CSQh/NvNV0yEVibnhVZzA0D4jGDeJaS1jhT4jh3UyVawbxivU9pkOB6wwIPaJoOA==
X-Google-Smtp-Source: AGHT+IGge21HXj48TLUzsA7ggUbHSFC0xO5HgqxGNKT4MTX7Oe0oV8kQd6FtV8OIYLtnHQGrRwLESw==
X-Received: by 2002:a05:600c:818e:b0:477:9fcf:3fe3 with SMTP id 5b1f17b1804b1-47939c87088mr76977635e9.0.1765190159388;
        Mon, 08 Dec 2025 02:35:59 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-479311e712fsm240407865e9.9.2025.12.08.02.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Dec 2025 02:35:58 -0800 (PST)
Date: Mon, 8 Dec 2025 10:35:55 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Maud Spierings <maudspierings@gocontroll.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 2/4] backlight: add max25014atg backlight
Message-ID: <aTaqCxsGj_waN92Y@aspen.lan>
References: <20251201-max25014-v6-0-88e3ac8112ff@gocontroll.com>
 <20251201-max25014-v6-2-88e3ac8112ff@gocontroll.com>
 <aTG0EK_zuSB-U_bb@aspen.lan>
 <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8a9a59b8-d5c0-46b3-8f86-a4cd910b7af3@gocontroll.com>

On Fri, Dec 05, 2025 at 04:20:55PM +0100, Maud Spierings wrote:
> Thanks for the review.
>
> On 12/4/25 17:17, Daniel Thompson wrote:
> > On Mon, Dec 01, 2025 at 12:53:21PM +0100, Maud Spierings via B4 Relay wrote:
> > > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > > with integrated boost controller.
> > >
> > > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>
>
> <snip>
>
> > > +static int max25014_update_status(struct backlight_device *bl_dev)
> > > +{
> > > +	struct max25014 *maxim = bl_get_data(bl_dev);
> > > +	uint32_t reg;
> > > +	int ret;
> > > +
> > > +	if (backlight_is_blank(maxim->bl))
> > > +		bl_dev->props.brightness = 0;
> >
> > This isn't right. Why would you change the backlight level just because
> > it is currently blanked (and sorry I missed this one last time).
>
> so just remove this bit then jeah?

Yes. backlight_get_brightness() is all you should need.


> > > +
> > > +	reg  = TON_STEP * bl_dev->props.brightness;
> >
> > The correct way to honour blanking is just go call
> > backlight_get_brightness() instead of reading the property directly.
>
> will do.

Thanks.


Daniel.
