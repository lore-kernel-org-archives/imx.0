Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAFA2A41
	for <imx@lists.linux.dev>; Sat, 13 Jul 2024 00:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720829517; cv=none; b=stMBa53/KmjNBKyiUUbCURKGPEHOfDUp5+jXgJVfrre3NizruJqoj2Lsedqtz3bD6K9QbJzWhJH7HBR8+keDDiDT/ZRu8dKwFt7E3x7k8suzM9EgjpDA9Ed6KO8xvJVFtRP7Uyem555lv+5EpLddmN9HGIlEQqMO1KWbjg6fHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720829517; c=relaxed/simple;
	bh=Phxk21ZRQHBWO8Fk+3b1KHjGX6RECntBicJRnbKr46U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZcy0Ledc1PEpV8tfnDn5SJhvO8BCCX+e152zCqI3w+eOGMJndzMg77qj3VRUp6KMUsQI+vwZ9ifcT4vJOBzsC9etTW770Z5xOk3Re8fBdDF0Qymqy88U/+AAjq4jSnpJdFccu886Qq62azRIWjWOxSJruVjGF9TyiNcdkP9g2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gin7wQY8; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gin7wQY8"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ca8dfa2cceso1931942a91.2
        for <imx@lists.linux.dev>; Fri, 12 Jul 2024 17:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720829515; x=1721434315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q7pphgwh/0pG0XDQwktVo+yWTDf7IpCH6Ju6MKVkTgw=;
        b=Gin7wQY8XLkoXDvS+7xsUzXhMgwYR0fmf4GYC/Ef1ht8yCua226VfGsK7+JJkEBOag
         QdO2+/VnDuXKnX3s0B4HGgM8OpTvspoApIsE/Bhit1nT/Ova/3yDjk+LAhupiZ/MwWD+
         NtYe0oPqCnv3rFYTFYJTBisL1JrpHakkxUc6FeG4/qqwjiAMHUifH3BUZmesJqzSmTAT
         PyvnJSjrgcf3oxOPctwY8aXFM7tM3JbJlrXDaNfDtW6RHaYRdZsLVyQ9DqR3KM4COTBd
         tVYWF63pVo8d1yiiC4xLa5/63Q76XeqUdS2LEupgqB1NhwcXZmwXsuGKr6HQzzjzFytz
         JkAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720829515; x=1721434315;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q7pphgwh/0pG0XDQwktVo+yWTDf7IpCH6Ju6MKVkTgw=;
        b=scopc8tDGIPX1pHw8CfPIIv4KZiThdx3DfEOfG6BVE5PeeiBr8T5xegsfxA/mMmUM4
         1WljagFPJLPhLMW9bNN45AQoDXq0QCc4NFDZPHsHu4V6eeahpST9QjCb5EEi1O69MiSg
         MPPwY6bWShd03UFh6FOwz9I2l5tNTrfl13VGED8sLIsCV19yWIjur2I2o4Fv0d5i5zRw
         zdjY3uCa9zJP30Va2J2Kto851DqQj0JeF1R5IyTOM8KlFG0+hdSXjpSZQwQtPyd7ag1R
         wSu4wH1pTnl2HWIxgdNobOo9Gnmys3HoRIpPoisfXZSXY/s1mfD+F+ZnMULishoP4Sby
         ZjUQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPvHkJMuwzPJ1acP70ilm+zCF/Q2ST4TDqtW4oTsO9EABng5pAxk7Vr38da+CaSjM3X+61w+JSQdchzWr4cAOwglq7
X-Gm-Message-State: AOJu0YwKJJDmAYzZcnI7oWihA3OcucFWwSA+2F6+PDiuNzQuSZNFpA0d
	42wHvBCYbl6skLp7/2dUaIGW7gRsGP9aU29KsrjY5KZD61U1opom
X-Google-Smtp-Source: AGHT+IEjh/xpVfdgoQwIz90ulydeyB6ybkbqta+ytUx2VzxoLaOfYGkrxLhV5izrDYes3VNsqaxoXg==
X-Received: by 2002:a17:90b:118:b0:2c4:dcf6:2130 with SMTP id 98e67ed59e1d1-2ca35d4b252mr10162252a91.32.1720829515082;
        Fri, 12 Jul 2024 17:11:55 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:669e:eb9d:e30c:18b4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e386d5437sm20011a12.57.2024.07.12.17.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jul 2024 17:11:54 -0700 (PDT)
Date: Fri, 12 Jul 2024 17:11:52 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Jacky Bai <ping.bai@nxp.com>, Jason Liu <jason.hui.liu@nxp.com>,
	Peng Fan <peng.fan@nxp.com>,
	"open list:INPUT (KEYBOARD, MOUSE, JOYSTICK, TOUCHSCREEN)..." <linux-input@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH 1/1] input: bbnsm_pwrkey: Fix missed key press after
 suspend
Message-ID: <ZpHGSCzckXncmeRv@google.com>
References: <20240712224352.82190-1-Frank.Li@nxp.com>
 <ZpG2fNQ9-inLN8-Q@google.com>
 <ZpG5d1/EsOU4eJEj@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpG5d1/EsOU4eJEj@lizhi-Precision-Tower-5810>

On Fri, Jul 12, 2024 at 07:17:11PM -0400, Frank Li wrote:
> On Fri, Jul 12, 2024 at 04:04:28PM -0700, Dmitry Torokhov wrote:
> > Hi Frank,
> > 
> > On Fri, Jul 12, 2024 at 06:43:51PM -0400, Frank Li wrote:
> > > From: Jacky Bai <ping.bai@nxp.com>
> > > 
> > > Report input event directly on wakeup to ensure no press event is missed
> > > when resuming from suspend.
> > > 
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > Acked-by: Jason Liu <jason.hui.liu@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  drivers/input/misc/nxp-bbnsm-pwrkey.c | 36 +++++++++++++++++++++++++++
> > >  1 file changed, 36 insertions(+)
> > > 
> > > diff --git a/drivers/input/misc/nxp-bbnsm-pwrkey.c b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > index 1d99206dd3a8b..9675717ecbdfe 100644
> > > --- a/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > +++ b/drivers/input/misc/nxp-bbnsm-pwrkey.c
> > > @@ -38,6 +38,7 @@ struct bbnsm_pwrkey {
> > >  	int irq;
> > >  	int keycode;
> > >  	int keystate;  /* 1:pressed */
> > > +	bool suspended;
> > >  	struct timer_list check_timer;
> > >  	struct input_dev *input;
> > >  };
> > > @@ -70,6 +71,7 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> > >  {
> > >  	struct platform_device *pdev = dev_id;
> > >  	struct bbnsm_pwrkey *bbnsm = platform_get_drvdata(pdev);
> > > +	struct input_dev *input = bbnsm->input;
> > >  	u32 event;
> > >  
> > >  	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);
> > > @@ -81,6 +83,16 @@ static irqreturn_t bbnsm_pwrkey_interrupt(int irq, void *dev_id)
> > >  	mod_timer(&bbnsm->check_timer,
> > >  		   jiffies + msecs_to_jiffies(DEBOUNCE_TIME));
> > >  
> > > +	/*
> > > +	 * Directly report key event after resume to make sure key press
> > > +	 * event is never missed.
> > > +	 */
> > 
> > How do you know that wakeup was caused by the key press on this device?
> > As far as I can see the driver requests the interrupt as shared, so we
> > could end up in bbnsm_pwrkey_interrupt() even if button was not pressed.
> > 
> 
> In bbnsm_pwrky_interrupt()
> {	...
> 	regmap_read(bbnsm->regmap, BBNSM_EVENTS, &event);                                           
>         	if (!(event & BBNSM_BTN_OFF))                                                               
>                 	return IRQ_NONE;
> 
> 	...
> }
> 
> If wakeup was not caused by pwr key,  irq will do nothing, code will not
> reach to here.

OK, so the case you are trying to fix is when interrupt is delayed so
the key is either already released or it will be released by the time
the normal debouncing interval passes?

I think you want to reset ->suspended in the interrupt handler so that
this block fires at most once per suspend/resume cycle. And maybe move
it before calling mod_timer().

Thanks.

-- 
Dmitry
