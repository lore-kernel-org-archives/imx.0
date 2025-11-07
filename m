Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380FE26F462
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 16:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762532442; cv=none; b=KmwLvZTbXIeWYG+YOna7bMfQGWv8yEElEairx/6JU/oFHY8zxu24bDptdEw17+QhIim5DC3cLZJqODWVPKFL5a312GwBNkWkocFuYiSVzZeiGccgg/d/5TywR2tEkIr9hPN+niG+yKCH5kdS/goIj8UPrXy0moQdV+Z5hFzv2yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762532442; c=relaxed/simple;
	bh=Fqsv7T5UOZsDf8OyIMapY71LUPMEa73mHQs1iYV1MDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kTPMi8yWvnC5w836h+Ac/NlgRYMaErA6jaNqKR39nlTuX0/joS67rjuBpgmVwvt/zSgVKBd+w8vrMuPUpj4hFywDp8erhxmC/j9Czdd5Q2cbRjSH22YlO91v7McZ2CI8NXYpws043a9nAqEoHDp5q3oj436RJyEheT7svAX5ErM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=J9El0Zk5; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="J9El0Zk5"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3ee130237a8so615378f8f.0
        for <imx@lists.linux.dev>; Fri, 07 Nov 2025 08:20:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762532438; x=1763137238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=J9El0Zk5Ajwa4EaZhFtPBHWWQUmNuezklN5uPlrdj2W9IGbMsrvcmhZJht5EF5fLQD
         mduMKu1+XYfUNc3AOpfX2kAbeYXX2fO9krsLwqMge4CioVraDuR23avPhYNgTRzgA1bv
         s+w99gVQ/ptTW1b7N6SBxwJaIhYmkUJTd11T9ptqe8F7IcnM00wdBo4ljf+whRn+xeNk
         h5wWcDpSEZk/rYmfxrXmaIZlHEX4DrYFCxJEmtcPVeLOzm4tr+cMbcwX533L2g22tEIR
         S9vrHl3jpROCp3bPyRlcYWxBqVLNpP9L94jYZ8YrXOLctEwvpkv3JkqrNebRb1miPME+
         N3Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762532438; x=1763137238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wDYDeeQ/vWAVkTVZ2tumPs2hnzhDw4b29aU1EHWCyII=;
        b=D9BvhIvFAXQqYwt4xMkzGcisGzxhnuhr6YbjQZF+RR3Bly8RJrBQdPbjgJH1mfymk9
         FmUJa1VUprTGjcM0U6YChO/iBVr41L3lq1j8nlvyAbNZ9ZD4jHtYT2GDe83E85S/SCuf
         tLxQPdPRYJSW5GfUVg0FQh6L+yXpBs0hmHRYxGoMtEKFRcxdfcbO9rpLMGT/bYWDYYy+
         VSLjznYu6m+NF0KtB2TXARcDD1wt5tz95yfUbLXw5WfyHZVdkq297QMl6XQ8NwPbuuxO
         8bWUPThGD30LhusKDbMPFMUjDur2us3lziMCutBo9PEw5G7OFMN4OuHrVz5u6RuC69Us
         drJA==
X-Forwarded-Encrypted: i=1; AJvYcCX/UPDTp+fC16OjpZOrDhPWlnSaOWtioexEKhQ7EHh+YWsz/S6TvpDYK8Aiwytvqzqa04w=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNh7CYGnuiR+fB2ARxUwxxXvrphA0zX//lY8WDGGc5IZnorzcp
	bB7t8U2bGgFgyR8D1RQgIP24Qw1XjZFUT5irUjuakfHxFOmcCWDCLJZoDPMk6Y/JHBU=
X-Gm-Gg: ASbGnctKABwDGjJrbubMD/3jQ6YH+fJ6aKam+X0YvBYxpbDUvOsgjRXuRm/AsNLyYV7
	gIye38i8k+Ug/YfRyZZ2f9EXRuksUBbwKax09/t863XtvEmlgjxgNn8MUTBdMkCS8FEXKOAcZuj
	vB3nj8KZ9FB9aFbFmDeCy8yb6bmcArup5qsyrn6nr+9SLnm8tLJXspuRzE19FphgbuI6dxx50cy
	xAONR7xzwsExu2T5m47CRavsFV0h8l2BnwuKkky1j5DBMDiHXPNQ6YoOZjD1H6SC7TVfPBTUQeq
	Bp5w3+jq9VPvSA0Axs3uiKpcy9za7uUo6SFfatKI+xKMKcClZTjp7f1TUiBafQ+4NoCmgXP8TeE
	cfo19i8m1gc2BoW5v4B0KIGvF1jHxyHwwf1dAKvMSBoBgzA0SOoGgHNZ9HnNgZQtRR3eOo3qEJZ
	sZpnlpSiuUJ0rRFfGklL/0slKUhKmIhQHgKQfp5MjpbcQASxCwYjBRtNo/5to=
X-Google-Smtp-Source: AGHT+IFcgdIpQe62FnRg4rVkke0TruBClBrbAABNqXTY7mPIIJ+cQeAzHNDnmh9vCKPrBQJ6NHkN0w==
X-Received: by 2002:a05:600c:1c8e:b0:475:ddf7:995e with SMTP id 5b1f17b1804b1-4776bca6415mr30487885e9.12.1762532438329;
        Fri, 07 Nov 2025 08:20:38 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477641fdbd8sm48938385e9.5.2025.11.07.08.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 08:20:37 -0800 (PST)
Date: Fri, 7 Nov 2025 16:22:33 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Frank Li <Frank.li@nxp.com>
Cc: maudspierings@gocontroll.com, Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlighty
Message-ID: <aQ4cyVKzgBUfpsj9@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQ4Vb4eUmSX0Nj6+@lizhi-Precision-Tower-5810>

On Fri, Nov 07, 2025 at 10:51:11AM -0500, Frank Li wrote:
> On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > From: Maud Spierings <maudspierings@gocontroll.com>
> >
> > The Maxim MAX25014 is a 4-channel automotive grade backlight driver IC
> > with integrated boost controller.
> >
> > Signed-off-by: Maud Spierings <maudspierings@gocontroll.com>

<snip>

> > +static int max25014_probe(struct i2c_client *cl)
> > +{
> > +	struct backlight_device *bl;
> > +	const struct i2c_device_id *id = i2c_client_get_device_id(cl);
> > +	struct max25014 *maxim;
> > +	struct backlight_properties props;
> > +	int ret;
> > +	uint32_t initial_brightness = 50;
>
> try keep reverise christmas order

I thought reverse christmas tree order only applied to code where the
maintainers called it out in Development/process (e.g. netdev and tip).


Daniel.
