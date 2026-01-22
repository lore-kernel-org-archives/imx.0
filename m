Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFCD33B8BA3
	for <imx@lists.linux.dev>; Thu, 22 Jan 2026 12:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084339; cv=none; b=aDziyOfon5360xnGQDbwYQG8wy7BprZ/AAMIHr5Z0FhYNvIdxxu0vcxFjXLL89C/9wpRmdwEDkVYSNQI7amLdxY9/J39E86nDIoI7cxsKA2KD0B+sLZyW0VyBIERZEWohRb7Ifm8SuJUG+O1jWPNxmlRndyfglFwMPXZ4lq1mQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084339; c=relaxed/simple;
	bh=s0PP6POZG+0DDhlnkBd6RLq6XlMNNCrkEEqlrLC8oio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EzAJ0iRX4Uby+w4x/os3JHgaflwGMIjtf1yP1trWH45lKVQmtgr3WOYIPN79o5nUo/OSSff3Fe3TnM5PKQmoIz7+fzfYOC3cQqq+t2L0JOcD7cupK8UyDz40DFA4bgruhI8LuYq74r+HMDwe75x/hCgLBDKFVS4m3oyFiE/kB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QlyCHDQ7; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QlyCHDQ7"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47fedb7c68dso9398445e9.2
        for <imx@lists.linux.dev>; Thu, 22 Jan 2026 04:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084336; x=1769689136; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Aw8PwRqcSFnjHYu9kruFq08beZFwPpI2ZTR02sRsPTY=;
        b=QlyCHDQ7p8v20gagOwWxrzuDH+1oxgSBMBYe8hk/HVfeFwQn2eMZv5UnyZrTCa1tq/
         A/fVZCnivZ5bt+I6oB4HXZIcNI3V0OZnjazTzstYDBfgSlh+NYdBUSdEZ2UEkuU01b1C
         G4hmDcPYe4OD+7xQL685bal45Tr3QY9Cza1eALol+NZcnanAF/1KnnVaBL6AGAX8+umR
         6YcS03h9dEGx+6dLXih16EdZlOS9Ryrfe6Z3Or5SguvtZc0HaDN/i50HrFyupfxQwyK3
         IuOQO8GBV/AntQ4GKZH8/YyhHq4cCqDDfD+VapAkbGEu+B/HEMoJvYuusbK8Dh2XzGJs
         znqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084336; x=1769689136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aw8PwRqcSFnjHYu9kruFq08beZFwPpI2ZTR02sRsPTY=;
        b=Q3W40m2V2Wj5NxwCZ2JgoB9BBpXCZ8Qx3XQRet8xL1rPBPQ1565IkMugyYLAjTYJ2v
         /1KbdtkPVwJBSE8ZTqftBkYrbxdRZt/SlFGgZat25M/lKle/RRfPJF2Tz849XKsGRpes
         49xwaN5snA1dX68Dpp0a4/o/aDn/5Etix4p6+gI+Jnv3dZTRjb4bZFvks4ZZxfkZwm2Q
         BvMfuNSRI30DQ8S86dmqlOk7VCZyxX/ZABzj8apYUEsmMx07rpzsbmLKDFquIN01lWsk
         KmrJPyOZw4h4JJiU7Wrx8/ELhnG9UPbc+sqdu2Dbb0eLirHF98lRumKHShC2LlCoM6XV
         Jlbw==
X-Forwarded-Encrypted: i=1; AJvYcCX6kLSpMd+JLtAxtQparx08MFnyqyyZxixvBGCpXOYbCMsHhAJkGzBUYy0KLXwNoAk5Yq0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzIqiMLM+lfAUSsdknq4pu7CjP39Ne0QEKSfsC9n33JG0SwgavL
	/SdcfeLeGTVz/HSxdujyGPWbb2zHA1YvcSJQtLpXX3yUtIURht/cp+GU
X-Gm-Gg: AZuq6aKXximK650V/+wLTRx0MBXbmNDn6bDWoBmoG6XxwrPLwgxpmCTeAtV3M++DceA
	OEYYFhWMrOfr+C0dxU+vZ2vEV0OD/TvjmZRoKzE/BOiKk4o1d+aFqJLGvK4OMiOG78cv/zORjNr
	MZ0qZAglq7J/2mBj4XUj3xTj4abhW5S2N9mgBmkuIgzsZNrk9JW7WOZjtxt9CLsj7/NjtnPewId
	B1x+JTTUGrCOj5Bd3RKCLIWofBYqvRlPy+Llg5LfMzqUhOcqsqbQNAkO/54B9Z2uhGhgqaErZ0e
	h30evKAhmuURj8JvE9iLmqimqZ//ALPVoPCtoXECThNGRWajRaC0kCfdkDR3faH/ZLz2wrdq/03
	KN8IL1dQwU4kEHJRH6o3+amPWF3EOuEqyROa4cICbCgWJROn9Ne2jxceqS0OqB+DSackuwJRAOG
	yiWq/ClxGaElQqU5qFhTEsqA==
X-Received: by 2002:a05:600c:3e07:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-4803ad094b1mr190051015e9.24.1769084335819;
        Thu, 22 Jan 2026 04:18:55 -0800 (PST)
Received: from eichest-laptop ([77.109.188.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43595e0a6fasm16302233f8f.10.2026.01.22.04.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:18:55 -0800 (PST)
Date: Thu, 22 Jan 2026 13:18:52 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>, o.rempel@pengutronix.de,
	kernel@pengutronix.de, shawnguo@kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V3 1/2] i2c: imx: preserve error state in block data
 length handler
Message-ID: <aXIVrFdTB4V6pnBh@eichest-laptop>
References: <20260116111906.3413346-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20260116111906.3413346-2-Qing-wu.Li@leica-geosystems.com.cn>
 <aXH_agPD8D2QIVs0@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXH_agPD8D2QIVs0@zenone.zhora.eu>

Hi Andi and Li,

On Thu, Jan 22, 2026 at 11:48:54AM +0100, Andi Shyti wrote:
> Hi Li,
> 
> I'm adding also Stefan in the Cc list as he has authored the
> lines you are changing.
> 
> On Fri, Jan 16, 2026 at 11:19:05AM +0000, LI Qingwu wrote:
> > When a block read returns an invalid length, zero or >I2C_SMBUS_BLOCK_MAX,
> > the length handler sets the state to IMX_I2C_STATE_FAILED. However,
> > i2c_imx_master_isr() unconditionally overwrites this with
> > IMX_I2C_STATE_READ_CONTINUE, causing an endless read loop that overruns
> > buffers and crashes the system.
> > 
> > Guard the state transition to preserve error states set by the length
> > handler.
> > 
> > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> 
> I asked you to add the Fixes tag here. Perhaps you need to add:
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Cc Stefan Eichenberger <stefan.eichenberger@toradex.com>
> Cc: <stable@vger.kernel.org> # v6.13+
> 
> You can get the information above with "git blame".
> 
> I'll wait for comments from Oleksij and/or Stefan here.
> 
> Andi
> 
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 205cc132fdec..05ba41144648 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -1102,7 +1102,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
> >  
> >  	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
> >  		i2c_imx_isr_read_block_data_len(i2c_imx);
> > -		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> > +		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> > +			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
> >  		break;
> >  
> >  	case IMX_I2C_STATE_WRITE:
> > -- 
> > 2.43.0
> > 

It looks good to me, thanks for the fix. I wonder if the functions in
the isr should instead better return a status and based on that we
decide if we have to change the state or not. Then we would have the
decision to what state we swtich at one place. However, this would
probably be too much rework for that fix.

Therefore, if you add the fixes tag suggested by Andi:
Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
