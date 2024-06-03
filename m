Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118F13BBD5
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 07:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400622; cv=none; b=TKIjBIsE28Eevysem7feTqu8szSNUSOJ0ft8cJyV9BM9626RmJTgEYv6uGt4xT1Zrg+Fu769i6TPiiwHC5SkyvuH5vOfyg+CkvZx2Nbtx90Y9Uej28fxQiJAG5uJrgYw2AgzS0+Kbxwe45yaNaRlXm9lV0iJpxYQfQJJFstgwDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400622; c=relaxed/simple;
	bh=m1D/sHfPfHRZFlkY+CEB8mS07gtrCM2m0LDbYaEiwPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QRsCeP3oKm0MCeIR8uoNWQaeVzf/87ELUWfUrrGjc2baGJqCfG8YJEQBm7lQf12pRHE9uhXzE4I+TNmU+/qnJFgpOSIMlov+aACaP4Si1fTUDj+SlNCbWcVL76ytwwiEXzl9bCUtQodjtlZU2Fqf0ZcFXqo8FW9sBPedt8CGVCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D1uEPFP8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D1uEPFP8"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-35dca73095aso3337063f8f.0
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 00:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717400619; x=1718005419; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9+3KpBVqTTJeo965A1KR/YlsEUxQQiOfIdsh4+kRbIs=;
        b=D1uEPFP8+5XhzpwEYoVVZHnOlGyUAak1+VWHh/rUhKTjU8HISSQ5hiHnywlOB4vyMJ
         9zxYU8PemphHRjprwvLrnl39mTmwJsgDQY66V2RE6wwQ3zstKTc/b/1JbrPC4UCJvwch
         C/d+HpTZ9oMTSvr8QQQ7gRRRy3Zii9BLaOZ2aQTqUEomTYE3PQubnAXK9NQjafqBiugf
         GvHIXJuATUGmJmyVMteUyvBjgZHLHbMSUorr34+McDGNYL86N3wYozOtd9Wh1DHymOAr
         LmMuqu5Cvnp4NvcipAcb1a3LBEJdX7GOIFvpSIwiAETh4NRLZV6p7FSJkZD8Hon9lJmb
         wujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717400619; x=1718005419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9+3KpBVqTTJeo965A1KR/YlsEUxQQiOfIdsh4+kRbIs=;
        b=dhors/erJKhd8227IhTZhlScicIbAcXG7fqqlNdf1op4yhUCNBsp/bW4Rj4MPGAZMd
         ee3G0H0TgmeBjTTYOZh4MrnWUD6FsbFd6EQ29Vlbrak2H7+SbGOB7aLiL+SY3Tg3+5zy
         6iVNfVRyLhck9x3uaEgf02iny7Kw7uCHdpu9mWu05DRZ30blIVbbK7/1j+gn3mB8sJfm
         QLtXDoudwZO9LRRcHlNKGxV9APG6lTES0lF6lj5fklRUn01f8UR9Zq3mIkQjwdAKlJrk
         MRPyseKhogojFRvH94x+8NZjKJn4ePoAnB6vGWpcRckw44bdMZgQOoFRFNEd8Q+0Ryqf
         hjdg==
X-Forwarded-Encrypted: i=1; AJvYcCW/qBFBypjXGRTHkJ1IUn0IkUnvTVKQS/xb0YkSV8ETpNNPHn0YAfUJpxsTT+Z5Ly6AIaBMOy5m53sjXCXTB1K1TPbB
X-Gm-Message-State: AOJu0YyEF3uHNZZ82J89PUB53GNeqbF1wmozSCXJ34bng/G2SohvJilt
	kH/y5VDjs+aRiS/CyvpoOrr5WuPhRuc9vKYQMPXUJ0uaK9tAKbL6
X-Google-Smtp-Source: AGHT+IEanqGnQyE0VRVI9jQex6bQ4+XQs3Oue5+MhhMZ/CjI0wOwj0rSpqUdBr/gjbzmQgzPke+uJA==
X-Received: by 2002:a05:6000:1944:b0:34c:cca6:3d18 with SMTP id ffacd0b85a97d-35e0f333b6emr5523593f8f.68.1717400619152;
        Mon, 03 Jun 2024 00:43:39 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:2b03:375:843f:be9d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-35dd062ea66sm7981749f8f.78.2024.06.03.00.43.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:43:37 -0700 (PDT)
Date: Mon, 3 Jun 2024 09:43:35 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	u.kleine-koenig@pengutronix.de, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <Zl10J9H+8k0KXAPR@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
 <Zlnidi62gEWwdQ3U@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zlnidi62gEWwdQ3U@smile.fi.intel.com>

On Fri, May 31, 2024 at 05:45:10PM +0300, Andy Shevchenko wrote:
> On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> > the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> > bus is idle. The imx i2c driver will call schedule when waiting for the
> > bus to become idle after switching to master mode. When the i2c
> > controller switches to master mode it pulls SCL and SDA low, if the
> > ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> > clocking, it will timeout and ignore all signals until the next start
> > condition occurs (SCL and SDA low). This can occur when the system load
> > is high and schedule returns after more than 25 ms.
> > 
> > This rfc tries to solve the problem by using a udelay for the first 10
> > ms before calling schedule. This reduces the chance that we will
> > reschedule. However, it is still theoretically possible for the problem
> > to occur. To properly solve the problem, we would also need to disable
> > interrupts during the transfer.
> > 
> > After some internal discussion, we see three possible solutions:
> > 1. Use udelay as shown in this rfc and also disable the interrupts
> >    during the transfer. This would solve the problem but disable the
> >    interrupts. Also, we would have to re-enable the interrupts if the
> >    timeout is longer than 1ms (TBD).
> > 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
> >    timeout, we try again.
> > 3. We use the suggested solution and accept that there is an edge case
> >    where the timeout can happen.
> > 
> > There may be a better way to do this, which is why this is an RFC.
> 
> ...
> 
> > +			/*
> > +			 * Avoid rescheduling in the first 10 ms to avoid
> > +			 * timeouts for SMBus like devices
> > +			 */
> > +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> > +				udelay(10);
> > +			else
> > +				schedule();
> 
> Isn't there cond_resched() or so for such things?
> More info here: 494e46d08d35 ("airo: Replace in_atomic() usage.")

The problem would be that I have to disable preemption during the
transfer, then cond_resched would do nothing if I understand it
correctly. However, an I2C transfer @100kHz for 3 bytes takes at least
240us + overhead (e.g. waiting for the bus idle) which might end in a
close to ms ranage. This is what concerns me.

Regards,
Stefan


