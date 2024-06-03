Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93F74206C
	for <imx@lists.linux.dev>; Mon,  3 Jun 2024 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717400104; cv=none; b=QWn7WAWRE8rykNnnOePXLPvIq+Ytqd62P31C6QZFcnWA0WV4EtEYCmTU3KIxd7Z4ZTgzyb/84ZAf5/kNTik/A6Ds8AXubs1QOly9yo5Qm8wIcQdITZUm6YSF4I5vAcbGFXiiVrlbLFMfdhCCiH71jqR5PY+pt2T93Km+MJYQY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717400104; c=relaxed/simple;
	bh=NKByOjzEgPFF13Q0AdwzXS9EvRu3omSeUKK5hLUrkj4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2RmTlQ/fmdZGUXWJI+tpiLK+oK6VKNefbXeus1hyjQ8pSWv3nJTiQBcLWt9bfGnxSV2qrn1QDCdUK1GvYpn164qPOMc/gBpocAOOpMKAVStwnWFhcu9YwTBj5Sk4fL657LS9f6syfsnJt1i+/+K2cMPVPbC0OQRw5gAMaw3cF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ekrgQ6Cg; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ekrgQ6Cg"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42121d28664so34622315e9.2
        for <imx@lists.linux.dev>; Mon, 03 Jun 2024 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717400101; x=1718004901; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dicgZOJvKn5T8RaFpyT/8hZCmr01MJ9Sp/DfGcqf1B0=;
        b=ekrgQ6CgS/ldS41cFXaKUOfOk5KZjj1OJ/W5d22nWRL3jlgwjfOm8K/E+E4BNBi3X3
         7nS6CkbyVcIC1CdhmOP0yhpM8dPkPOc6Wo2tehsR82gbGBoMJa4NDKjrUMQ8bcPh1ou/
         STR59qf7oR2qjDEsFYSC5lnaIWoV0tHD2YaGiF11ZHwIXPLO/Zy1X8G+wy1xXSNFscPW
         6TpP8HTt+j8mjqqJ5C++MbYBGh+Zgo3tkkYv6Irb6m3vtxJYisIFz0uIpVXuJwgRUpnh
         8njjwS3Rx6IWlxcnD8UcFMIXN2U03m7DHkdFRwfexE06kVh/l4QY9UirG2eZVaWLljc7
         XZ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717400101; x=1718004901;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dicgZOJvKn5T8RaFpyT/8hZCmr01MJ9Sp/DfGcqf1B0=;
        b=oazb2FtRpBf8v7Rh2lo7/xksEbzdJNdefEU8/UeGwFFNufnuVB0rw4b04XLddszzfY
         aKSuIZwa0GG9qK5ILfP4v2+pNtmoxnvOcZRX8orTwjzxL477pEv9IN34CJk0znLi6IDc
         mbLeE/nN+kwiOBUWko4B90hg9oZkF5ksFoozFsqagpNDRJ70fyNPcL1kHHVcwLSf6XzG
         nEefQ5MtpE82CiOM/0+gBk0h1RGYCGTI9yLGB2xjI3c82mwW4SN+ogzfP3MJvXzHkbDD
         wyUEURLmfoUjUJC0izJVcdsxeCSU3fooo3zhNJujRaZ1EnZMdONBFlvnNfQI6+Aqd8z5
         aUGw==
X-Forwarded-Encrypted: i=1; AJvYcCU+MowAPFA+MJPF+hpcSG4QLZF8LZrkyOfTk526GXrqgpJ/xvk96m5c0Kos9oOAnMsgzPXrpAI+auf06PIzHb11BJ7/
X-Gm-Message-State: AOJu0Yw1v9vwSYzQJ6O7JXc7VZQpfB56S/PX5swiCu3AycoPv8zR4X3M
	dF3UbeGX9ncanQcx78lJAyXBdbVldfL5tywb/nMuvgl3Imjs1Su0
X-Google-Smtp-Source: AGHT+IEEgeFVnXmG6lbJKYsvkxGXa9tP597wtFh2250QbRrm/he4vpWuR6MbekVDIbwfm4OL4KByBw==
X-Received: by 2002:a05:600c:45c3:b0:420:171c:3d70 with SMTP id 5b1f17b1804b1-4212e05daa7mr70827895e9.16.1717400100851;
        Mon, 03 Jun 2024 00:35:00 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:2b03:375:843f:be9d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212b8a5658sm107324345e9.34.2024.06.03.00.34.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 00:35:00 -0700 (PDT)
Date: Mon, 3 Jun 2024 09:34:58 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	jic23@kernel.org, lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, u.kleine-koenig@pengutronix.de,
	marcelo.schmitt@analog.com, gnstark@salutedevices.com,
	francesco.dolcini@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <Zl1yIsE6f5JJY89S@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
 <f5d537e2-b102-415f-bc22-c949fd859344@lunn.ch>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5d537e2-b102-415f-bc22-c949fd859344@lunn.ch>

On Sun, Jun 02, 2024 at 04:31:27PM +0200, Andrew Lunn wrote:
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
> > condition occurs (SCL and SDA low).
> 
> Does the I2C specification say anything about this behaviour, or is it
> specific to this device?
> 

The timeouting mechanism is normally used in SMBus mode. However, for
this specific device they still call it I2C which is a bit confusing.
The difference between I2C and SMBus is that SMBus has a timeout while
the I2C uses a recovery mechanism. Besides that the two protocols are
identical.

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
> 
> 2. has the advantage you fix it for any system with this device, not
> just those using an IMX. Once question would be, is such a retry safe
> in all conditions. Does the timeout happen before any non idempotent
> operation is performed?
> 
> If the I2C specification allows this behaviour, maybe a more generic
> solution is needed, since it could affect more devices?

Maybe I could add a smbus_xfer function to the i2c driver and then
change the ti-ads1015 driver to use the smbus_xfer function instead of
i2c. However, I would still have to disable preemption while the SMBus
transfer is happening which concerns me a bit.

Regards,
Stefan
