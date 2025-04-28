Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A5F5684
	for <imx@lists.linux.dev>; Mon, 28 Apr 2025 04:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745816281; cv=none; b=frc5Friy3ve1X1DpkcDxySwK3hBLLqbzHpyp20qKxHInPo/S+ci1JukZyl75bVOHwgMznEcyHWMMctVBm6DhDu9AAhOIKUC2KED8n0xXn63tTRgMrCu3OOqlmQacu+5dXG/tGwPV3mJwrePALjy5PSTpZtX+TnwtaQjGVN/g4JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745816281; c=relaxed/simple;
	bh=1Pd7BEe/5QE2amsE/bVBdnxt7TNs1q6JsqYcbWm4USg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E043Cy9s5ysUKPYU//PcsWbUVaHuv5zcl2zAAjnixoL1SPS1MkG3wg7HaQvONL5fpy1We9NfH22nLJulBUr0caBiXENyZTrWTYgV3hM2EG0lpjHT7IZ6NEjxKwrHQARWCSD6JfJiMYofFYOf9xXp0nZ1Df9CeQyLU/xsy5sV0H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SzUqGFJ6; arc=none smtp.client-ip=209.85.215.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SzUqGFJ6"
Received: by mail-pg1-f193.google.com with SMTP id 41be03b00d2f7-b1396171fb1so2693296a12.2
        for <imx@lists.linux.dev>; Sun, 27 Apr 2025 21:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745816279; x=1746421079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=SzUqGFJ6BAwkpf+582LFDFXn8ejkugjiQP5muMgYUvJaA4x9y1V6bU/Na+Nzq0N27L
         PZEw9xTdkJTmCMi6qTZizq0qUIsXMSyTnnF3efezq2AYcetxC7ZoMXcBNTRvsI1HWh4W
         yrip2Y97xjjPvVETmCMVPwacdxStkdZdmv4+RJHO5utjKFHgo8VSAfgqj9GLpPEgGRFG
         40d+0nP2M0QSqcWBGGo75K+G8bzkxhn1OxxW0Q5aC6fMhmK9xxSqPQoXImuIvujuaeNb
         Wl8Ix/jpd7F5G3h7BbmfhN+pKYszPzlZhSTUXxbpSy6VBHnw7tJtWOH1g3j3eA4QiDN8
         ItmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745816279; x=1746421079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iPBvAyUU311bbG2aZ0BYl5mxeYY4FqGUEKf9879Dmxk=;
        b=bFp7mJdL6ZiJwbHMy8Pzt2LG/mm9VeVGE0R32Wjk0bH1vzN5wHCgTbZFYBB9FRNG8j
         WTt6Q/QRj8NayfqnDmoFg0nqdAkGMU5pglYgDpKn4AVKK03QbaxaZ4LagKONOaalUNKc
         GbjJuGtWpuh6wd9EkeLR3Tv0QmP1SP26dJrMqgy/zhF38saVdYQm/fMV6dbtKkqHp3fk
         g1lppGSvvzcR94FK0PuGugvilirUvnCrvoXOJpoaRQqa2/7nRiZFwRkISJ35crqsCA74
         bjPpQd74NR9aNhUt73NsXCCSDeiIF9O67I/G+XEIKNQh1sUKECPwOPL0l17hfCW6xWQi
         hGQg==
X-Forwarded-Encrypted: i=1; AJvYcCW91oeyFs9uNu9kupEgFniRg280PDQHuj2ukGdbDzWh8R00hFZ+3x+FR2CeXKPX5/8U0OQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YwNHzPxFtUvCq9v26P338P7ft6/CqDHGSxHSJ0G9idPiY0Qojao
	FCE7C62AyWR5KLileRRjAWWZ7ZI5RqTuQU9v9IahkcQXkTy3MrHj
X-Gm-Gg: ASbGncszJ99BDNuuYcgTU3S+CVDMHe3Kev0wq6vAfdyBsG6CKUB18S+cUpUVm040sYx
	9qLcOGmdx1GY1ccFO9YaCoEZ5sh6t9LfT7+4bWkC2MqByGcc3F3gmXlSHvU6Fq4O6DVjrXZztr8
	MGw8WEmlvyTug7U8PIhczhkDAeow5q9+BV/iPzKNcqtLKus3vk4bP9HL2XXI31Ss5yX+NfrAD08
	OaFIZ6pewoEIfmXT34IeXzmdftCYkW9TFIhmcFl7XsQy1VsuNyjBFkOAzM+DVaYuH0dtqQlkowi
	WYVXeKzrn5oeyJIRcvarDA==
X-Google-Smtp-Source: AGHT+IHPWV68kDNnvcDOp3GF0LPKpG/CEzy0Pv2JiYWY15R9zmn4YM/P6w+2bnJu6lNJanewXlFw5g==
X-Received: by 2002:a05:6a20:9d94:b0:204:4573:d855 with SMTP id adf61e73a8af0-2045b6b0383mr14404423637.9.1745816278754;
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Received: from localhost ([2a0d:2683:c100::bf])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1b82c7adedsm2775300a12.75.2025.04.27.21.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 21:57:58 -0700 (PDT)
Date: Mon, 28 Apr 2025 12:57:54 +0800
From: Troy Mitchell <troymitchell988@gmail.com>
To: Peng Fan <peng.fan@nxp.com>, Troy Mitchell <troymitchell988@gmail.com>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Yongchao Jia <jyc0019@gmail.com>, Frank Li <frank.li@nxp.com>
Subject: Re: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
Message-ID: <20250428045754.glgyfhp2zn3l7wkj@troy-wujie14-pro>
References: <20250427-i2c-imx-update-v2-0-d312e394b573@gmail.com>
 <20250427-i2c-imx-update-v2-1-d312e394b573@gmail.com>
 <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459E722812D2B11D57AA17F88812@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Mon, Apr 28, 2025 at 12:55:48AM +0000, Peng Fan wrote:
> > Subject: [PATCH v2 1/2] i2c: imx: use guard to take spinlock
> > 
> > Use guard to automatically release the lock after going out of scope
> > instead of calling it manually.
> > 
> > i2c_imx_slave_handle() can safely be entered with the lock held.
> > 
> > Refactored the i2c_imx_isr function so that i2c_imx_master_isr does
> > not participate in the guard scope
> > 
> > So Using guard(spinlock_irqsave) simplifies the control flow by
> > ensuring consistent and automatic unlock, which improves readability
> > without affecting correctness.
> > 
> > Co-developed-by: Yongchao Jia <jyc0019@gmail.com>
> > Signed-off-by: Yongchao Jia <jyc0019@gmail.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 39 ++++++++++++++++++---------------------
> >  1 file changed, 18 insertions(+), 21 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index 9e5d454d8318..a98bf01c5dde 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
...
> > @@ -1125,32 +1126,28 @@ static irqreturn_t i2c_imx_isr(int irq, void
> > *dev_id)  {
> >  	struct imx_i2c_struct *i2c_imx = dev_id;
> >  	unsigned int ctl, status;
> > -	unsigned long flags;
> > 
> > -	spin_lock_irqsave(&i2c_imx->slave_lock, flags);
> > -	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> > -	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +	{
> > +		guard(spinlock_irqsave)(&i2c_imx->slave_lock);
> 
> Use 
> scoped_guard(spinlock_irqsave, & i2c_imx->slave_lock) {
>  ...
> }
>
Ok, I'll use it in the next version,
and if no one has other suggestions, I'll send v3 ASAP.
> 
> Regards,
> Peng
