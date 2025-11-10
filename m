Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504F9218AC4
	for <imx@lists.linux.dev>; Mon, 10 Nov 2025 09:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762768744; cv=none; b=Y+0QzSWQKM0VXhzBY3+Zti2wtB7bXIID8pOU+qVIISCH8zgCu/ITPPPFsgJ0fOgByXUnLspyQBtg2c0+C1zPriPlh4ZQmzbP4121Khu1Lbo2yK1q68lrktepEkW5+pxrM1yDgerd1Yd30Ez0/MXWch+jLM+Uch5HMHF5s2jGosc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762768744; c=relaxed/simple;
	bh=Ldxb3xiosslpoOJubQchwtbD2Q0t8Tiz2RiN7Ya71NU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpV/j4d7qEij7fI406kbmP/wJ0Bdc04dJf4yPqEl8UYaqgjDEArGPzqez4JDcxBD3nwUb4ykWFv3kiUBSW03JnYXQQ3NsdjdFLyLzJ7TFzRgbjYHAXdYJUU8TCukifQ8u4FdVfx+yjYKyo6zWhqSFHbZ7NF/Dcw0CHZM1kUtYvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=SRS3uUQ7; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="SRS3uUQ7"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42b3d7c1321so260862f8f.3
        for <imx@lists.linux.dev>; Mon, 10 Nov 2025 01:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1762768741; x=1763373541; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=SRS3uUQ7TSd+VPK8Y2vznnkIgYTcBQT69RbnvaPfbEj1SMUlXkRdCyAhKRsMcTtkJJ
         uaDJ4x+9WywUyOhtzKw4Ea7DFzlhZ9P2kZ2CmwEeKjeoWv0vWQDdTStR8zm8JDQCuKcq
         MUXJkjy4n1q1bJ9P8RmAwN+Fa4yd1FCCiYeaAt8rIoZ2VvHXwoF0/B+9RbpWar4AoqBY
         /PVcPyw6g1QwKXadI74eTtQSxhS/joQhUF5v1uWMoJrR7HQn06tMEa2dm54PexR4lbPY
         PD7+8lT1DWx3JeiatzMcPahsG8R3PIe4YH6+M8JYuYGBa00g8gqq+NktnHtCQbX/jza1
         eSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762768741; x=1763373541;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wKdtCn/XoTBMU0W91zbNyyVRdCbCwPGBIxEuE5k5q+8=;
        b=sU04nbd27diT+1cIPWN8z8iydTCqSXwFyPl5d3EXsntzLJW4C1cNnORESRasV5zn5w
         UULOH3RLJKOOYme/8+XrA+7x8z/3TreOKvjHiLoaphfJgJM7rJTF5KA/XFyPeHDtJS8c
         WsneLFXZEUk3SdIylrgA5OPmJ9cizOVihyHg6O+q6KJUInR0yePIsSKrcnUV1wmFmuKF
         ES03oBgI/hvYWr6/DD6PlBhMEv3VjRM3fGWoIeTSWEbzav/eTDmOzk7xYdfTYQwdMesU
         caRLKjl8/zs5LGTCaiAq/owEFhZzG0FZi9azw6k/rhm3EFJKVssPZJl2e+21bWtxuJnR
         D+wg==
X-Forwarded-Encrypted: i=1; AJvYcCUBMGnG3Mh+6FbxfdNd/e0OZAB9Brhq8aneYx33a7XEtIWI9Z0yhKndev1DKj7aFe2npUw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPmKaWrtz7CowNIrbh/hjb1VLSKVwtgLc8EjHm08uxc+2TEG/6
	As8XXKsgEw4j6P95hqzWR4FRSCpcAM8zuRDQDq+g2KvmT/PZkcVeiQEKQQOxI4sSMfY=
X-Gm-Gg: ASbGncvbxL9KoNxAwu8xQQ5WSC2wRsbWzL+p2iM6aeEat3YYvmrXhlOyx01UgOg1Xo3
	tlquQQ1yR8ca7ySp+2Avs91+2gwnuw+jHpBJHekYTLHD08GUVrfIZTh6YoogHBJChqO8hEpJnbE
	6aAGETRllzPuCYO3sIUeecKe3iOgC5ASJUK6awnTbYSls67xesIS2IiYSemKWO+GYKPnCmOuMYX
	txhtu7nZmc8qJBdo1mu3u1cSipAnmILAcdbkW6MyhsX7IObY1Zi0EyI+k42gTrdLJq3y1rhhaTW
	RnOGOA4wTsE7DOXwCngNBPqY4PGJklQetCM5jHk3QW0yhTHUL1vqZifv9kFYFdZr3JwQFq42S/i
	e4ILbAMCWKzDxCCiz8y7qhf/8FDZevyz4xkQN3foeCd24xub12PoX/MzIgv03qIPaMevolu9WPn
	skouOj4MOAQcSf0uHCX4TKy0SL80ZfQkeaqc3S2fiMsv7nOd2/dY1wqAbOXvI=
X-Google-Smtp-Source: AGHT+IESDCHlcbXRXRa2TG5aApGtSH2moJB6JVIAkSw02ybwWPI2qmXCnmEZcdOIcRiKJ320ee1qvg==
X-Received: by 2002:a5d:5885:0:b0:429:d19f:d959 with SMTP id ffacd0b85a97d-42b2dc1ab24mr7071023f8f.15.1762768740534;
        Mon, 10 Nov 2025 01:59:00 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b32ecf522sm9799000f8f.45.2025.11.10.01.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 01:58:59 -0800 (PST)
Date: Mon, 10 Nov 2025 10:01:11 +0000
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
Subject: Re: [PATCH v5 2/4] backlight: add max25014atg backlight
Message-ID: <aRG359gIeP48V2ZZ@aspen.lan>
References: <20251107-max25014-v5-0-9a6aa57306bf@gocontroll.com>
 <20251107-max25014-v5-2-9a6aa57306bf@gocontroll.com>
 <aQ4a2SBDldYgQb56@aspen.lan>
 <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f4e52cc1-9c5f-4069-9079-83be794ab2b3@gocontroll.com>

On Mon, Nov 10, 2025 at 09:40:07AM +0100, Maud Spierings wrote:
> On 11/7/25 17:14, Daniel Thompson wrote:
> > On Fri, Nov 07, 2025 at 01:49:59PM +0100, Maud Spierings via B4 Relay wrote:
> > > +/**
> > > + * @brief control the brightness with i2c registers
> > > + *
> > > + * @param regmap trivial
> > > + * @param brt brightness
> > > + * @return int
> > > + */
> > > +static int max25014_register_control(struct regmap *regmap, uint32_t brt)
> >
> > This isn't a good name for a function. It doesn't really say what it
> > does. Please find a more descriptive name.
>
> Having a lot of difficulties find a succinct name that fits better,
> max25014_register_brightness_control()?
> max25014_i2c_brightness_control()?

I'd focus on what it does rather than how it does it meaning something
like max25014_update_brightness() would work.

However, at present, this code is only called from
max25014_update_status() so the simplest thing to do is to move the
code into max25014_update_status() and remove this function entirely
(then it doesn't matter what it is called ;-) ).


> > > +/*
> > > + * 1. disable unused strings
> > > + * 2. set dim mode
> > > + * 3. set initial brightness
> >
> > How does this code set the initial brightness? It doens't set the
> > MAX25014_TON* registers.
>
> Yep forgot to remove that, I discovered the backlight core takes care of the
> default brightness, so I removed it from here.

What do you mean by this? Are you sure you aren't relying on another
driver to enable the backlight rather than the backlight core?

> > > + * 4. set setting register
> > > + * 5. enable the backlight
> > > + */
> > > +static int max25014_configure(struct max25014 *maxim)


> > > +static int max25014_probe(struct i2c_client *cl)
> > > <snip>
> > > +
> > > +	/* Enable can be tied to vin rail wait if either is available */
> > > +	if (maxim->enable || maxim->vin) {
> > > +		/* Datasheet Electrical Characteristics tSTARTUP 2ms */
> > > +		usleep_range(2000, 2500);
> > > +	}
> >
> > If you really want to keep the devm_regulator_get_optional() I guess
> > maybe you could persuade me it's need to avoid this sleep... although
> > I'd be fairly happy to remove the NULL checks here too!
>
> Just wait unconditionally?

If you think it will be unusual for the driver to be used without enable
or regulator then it's ok to wait unconditionally (all examples you
have added so far have an enable pin).


Daniel.
