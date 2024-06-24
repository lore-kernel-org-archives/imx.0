Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A85F2AE96
	for <imx@lists.linux.dev>; Mon, 24 Jun 2024 15:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719244173; cv=none; b=mb6RxRMBvtIn2qF7sZK2Odws7vuUGNhqG1GB77SZiFefmANiy9ouVMrHjlWRezsVuOp/OoaR21eCSQtmo8RlrNCofKdaPNByETlbgKkCEyjLDfnUIWeTIz+HHqz97Yj06G68QWjtRUit35KS6QRN+rLcjKnREJdLzkqOImUgH5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719244173; c=relaxed/simple;
	bh=a0UJSp2q0uve7X5kQB5gD7q6GeLF7iCBBBnuERdm2ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPk4zfZLDxyMixTbYvhr1Fxl880RXn2dKbwsjZtVMLI6/vetdzy6/MYfbNHL0WTMd/FoAIyeh/AWg4w1oYFywGUdn6V50tdEymGL2n8dnpO7OS96BUtytjVDv4dzhI0980SAfJj0thxRL4+y9IVGQSWhJeFHuQgz0R87HEcl1Pw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xz8pFZG6; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xz8pFZG6"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-42138eadf64so38263815e9.3
        for <imx@lists.linux.dev>; Mon, 24 Jun 2024 08:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719244169; x=1719848969; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9kgIYkCaEISawG3z3/PKDsfUfni6CT+YfmQGd+f5vk=;
        b=Xz8pFZG6yWN10CfQ6/aPhS01TpLShSxVMHcte7hRMYiAOd1y2yMafNndA0pSj7cNOJ
         7SXeNmc3wIXa4sZczbHAWFVIYKfj9XMkTDeFO/YBP26D5SpvQwknH7vMHwpKa1fXJ3yJ
         XmjhuRe1LyW6hEg3MHdg7obnnJ7u/7msDJ6I+Ohz5JAf00VKTiDGN6wHEPaYe8vCjliR
         cavj64Ez6qozbS0ibHTtd2wQo4MyLuH5OGkaiGR7SBHdxSBnGQeusuh/5EJjLxZ6uof+
         LxbU2IHNOsISUWzA7aIYJQAELcgPv15ItIdZ+0RR5Bhw2gjkVfO0jaAJ4Oq5KPRuiz5U
         J+bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719244169; x=1719848969;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9kgIYkCaEISawG3z3/PKDsfUfni6CT+YfmQGd+f5vk=;
        b=NeKThPRTmXQZRW/IK+1hyGgRf1VQ4cR9MUBRokxl5uRYJnABDQ0yS7/AvZaezXkSqq
         AmzTOCm6ITdwKJTpZzJrZvw60G94W5CUXUS/Df0D1hIH9fEcFnkQWc5Aph78D9G2/wMu
         g05GCt2wGdrBKth5pejOYuwVO434eu6cVn9ObK3ZAYORKpk8sJGaacCSNmv2AKSw26kD
         X450aKx4PBBUMFCBMyobD1e3oSIh5k/4iYLg7+0GXeQxGSQHTr6QpnHCaLaynqbEfaVX
         BMVtM36IvslJe1meIcKaj0dx3lYABGtgWSkPEZmLdNa5OWiGmQEpG2StpN3JiClE6LVI
         5iPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXT3DNXFBTqlfgY4fmRiwZ1dCRADaEH02SuhKycBEdA/MTQXGORjOdNo5g4nWhi18Txb3vRUjqwUPzV+n/SR9yaUuD/
X-Gm-Message-State: AOJu0Yy1yjPt09fQTn7rQ0aDGMZdsPb6iBBM796C3Y3bTcDVc2FHYASw
	Msz5oGjxLcoLgUEcicxkUMdrmjEixHrMH9RYUasmpw4Cftpvu6C8
X-Google-Smtp-Source: AGHT+IF2O0vTFTR2Jv5inHaCYhFCJMD7FD4fHIJxFEqeF2HsybT87gdE0Y0w/WzRojs+ABU4W/YZag==
X-Received: by 2002:a05:600c:548b:b0:421:f04d:ebd2 with SMTP id 5b1f17b1804b1-4248cc349afmr33870795e9.22.1719244169043;
        Mon, 24 Jun 2024 08:49:29 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:b172:75e:e42d:1a1d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4247d0be80dsm177295645e9.19.2024.06.24.08.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 08:49:28 -0700 (PDT)
Date: Mon, 24 Jun 2024 17:49:26 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, jic23@kernel.org,
	lars@metafoo.de, nuno.sa@analog.com,
	andriy.shevchenko@linux.intel.com, marcelo.schmitt@analog.com,
	gnstark@salutedevices.com, francesco.dolcini@toradex.com,
	wsa+renesas@sang-engineering.com, andrew@lunn.ch,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [RFC PATCH] i2c: imx: avoid rescheduling when waiting for bus
 not busy
Message-ID: <ZnmVhlTK4JmzXdyk@eichest-laptop>
References: <20240531142437.74831-1-eichest@gmail.com>
 <ZnWaxtfgmLk3SplP@eichest-laptop>
 <ZnZa7x3kaYrzFkiV@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZnZa7x3kaYrzFkiV@pengutronix.de>

Hi Oleksij,

On Sat, Jun 22, 2024 at 07:02:39AM +0200, Oleksij Rempel wrote:
> Hi Stefan,
> 
> On Fri, Jun 21, 2024 at 05:22:46PM +0200, Stefan Eichenberger wrote:
> > Hi Andi, Andrew, Wolfram, Oleksij,
> > 
> > After some internal discussion we still have some questions which are
> > blocking us from solving the issue.
> > 
> > On Fri, May 31, 2024 at 04:24:37PM +0200, Stefan Eichenberger wrote:
> > > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > 
> > > On our i.MX8M Mini based module we have an ADS1015 I2C ADC connected to
> > > the I2C bus. The ADS1015 I2C ADC will timeout after 25ms when the I2C
> > > bus is idle. The imx i2c driver will call schedule when waiting for the
> > > bus to become idle after switching to master mode. When the i2c
> > > controller switches to master mode it pulls SCL and SDA low, if the
> > > ADS1015 I2C ADC sees this for more than 25 ms without seeing SCL
> > > clocking, it will timeout and ignore all signals until the next start
> > > condition occurs (SCL and SDA low). This can occur when the system load
> > > is high and schedule returns after more than 25 ms.
> > > 
> > > This rfc tries to solve the problem by using a udelay for the first 10
> > > ms before calling schedule. This reduces the chance that we will
> > > reschedule. However, it is still theoretically possible for the problem
> > > to occur. To properly solve the problem, we would also need to disable
> > > interrupts during the transfer.
> > > 
> > > After some internal discussion, we see three possible solutions:
> > > 1. Use udelay as shown in this rfc and also disable the interrupts
> > >    during the transfer. This would solve the problem but disable the
> > >    interrupts. Also, we would have to re-enable the interrupts if the
> > >    timeout is longer than 1ms (TBD).
> > > 2. We use a retry mechanism in the ti-ads1015 driver. When we see a
> > >    timeout, we try again.
> > > 3. We use the suggested solution and accept that there is an edge case
> > >    where the timeout can happen.
> > > 
> > > There may be a better way to do this, which is why this is an RFC.
> > > 
> > > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 14 +++++++++++---
> > >  1 file changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > > index 3842e527116b7..179f8367490a5 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -503,10 +503,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> > >  				"<%s> I2C bus is busy\n", __func__);
> > >  			return -ETIMEDOUT;
> > >  		}
> > > -		if (atomic)
> > > +		if (atomic) {
> > >  			udelay(100);
> > > -		else
> > > -			schedule();
> > > +		} else {
> > > +			/*
> > > +			 * Avoid rescheduling in the first 10 ms to avoid
> > > +			 * timeouts for SMBus like devices
> > > +			 */
> > > +			if (time_before(jiffies, orig_jiffies + msecs_to_jiffies(10)))
> > > +				udelay(10);
> > > +			else
> > > +				schedule();
> > > +		}
> > >  	}
> > >  
> > >  	return 0;
> > > -- 
> > > 2.40.1
> > 
> > If we want to be sure that the ADS1015 I2C ADC will never timeout, we
> > would have to add a patch to disable preemption during transmission.
> > This would look like this:
> > 
> > @@ -1244,6 +1248,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> >  	bool is_lastmsg = false;
> >  	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(adapter);
> >  
> > +	/* If we are in SMBus mode we need to do the transfer atomically */
> > +	if (i2c_imx->smbus_mode) {
> > +		preempt_disable();
> > +		atomic = true;
> > +	}
> > +
> >  	/* Start I2C transfer */
> >  	result = i2c_imx_start(i2c_imx, atomic);
> >  	if (result) {
> > @@ -1320,6 +1330,9 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
> >  	if (i2c_imx->slave)
> >  		i2c_imx_slave_init(i2c_imx);
> >  
> > +	if (i2c_imx->smbus_mode)
> > +		preempt_enable();
> > +
> >  	return (result < 0) ? result : num;
> >  }
> > 
> > However, we are aware that disabling preemption is not a good idea. So
> > we were discussing how this is normally handled with SMBus devices? Is
> > it just expected that SMBus devices will timeout in rare cases?
> > 
> > For our use case, the problem would be solved if we could get rid of the
> > schedule call and replace it with a udelay. It seems that the i.MX8M
> > Mini I2C controller needs a few ms to clear the IBB flag. In the
> > reference manual, they write:
> > > I2C bus busy bit. Indicates the status of the bus. NOTE: When I2C is
> > > enabled (I2C_I2CR[IEN] = 1), it continuously polls the bus data (SDA)
> > > and clock (SCL) signals to determine a Start or Stop condition. Bus is
> > > idle. If a Stop signal is detected, IBB is cleared. Bus is busy. When
> > > Start is detected, IBB is set.
> > Unfortunately, it is not clear how often they poll. In our tests the
> > issue disappeard when we used udelay instead of usleep or schedule for
> > the first 10 ms.
> 
> I'm not really happy with this variant. It can be acceptable in some
> use cases, but may have not pleasant side effects on other. Since this
> is still valid case, I would prefer to have a UAPI to enable polling
> mode as optional optimization with a warning that it may affect latency
> on other corner of the system.
> 
> > Since we know we don't have a multi-master configuration, another way
> > would be to not test for IBB and just start the transfer. We saw that
> > other drivers use the multi-master device tree property to determine if
> > multi-master is supported. Here another quote from the reference manual:
> > > On a multimaster bus system, the busy bus (I2C_I2SR[IBB]) must be
> > > tested to determine whether the serial bus is free.
> > We assume this means it is not necessary to test for IBB if we know we
> > are in a single-master configuration.
> 
> I interpret this part of documentation in the same way, so it will be
> great if you can implement this option.

Perfect thanks a lot for the feedback. I will try to implement this
option and run some tests to make sure it will not break anything.

Best regards,
Stefan
