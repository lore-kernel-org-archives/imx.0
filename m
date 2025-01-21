Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2929F1F426A
	for <imx@lists.linux.dev>; Tue, 21 Jan 2025 15:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737472550; cv=none; b=N9UYUFoPxKBqwc8QdSy+bBU+HgILdRu4jd7nqYKEpep+pIvLzmqfzlgT6INqy2tgltOZaENAZzbaDZgAYfsPG4+Tdnn7xo9isK1nfrebkBmmC9wKzMxWqo7yk2Y7W+OtUoVv5CC+X3UjhwDXVOY1RsB7RN9aapvaIRgdXkrAr5k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737472550; c=relaxed/simple;
	bh=VAOxaKNqT9HIaNEdqkFqK0wD2sSNhVsUuyIHNh+V45k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBRGEsNISYylaRVmIT8LkpikX+lxOolV5TmLzRGgqNg5UUyyAsVGcAF+VbP5OT+bkh933ui1z+wMK/T4Km0sSLIueF2k7YFK4VvENx7ayn2wrcd4QAZ1W7gdRtFcGTFhuYeJMHVJNLNtUh8T+F//nuK86KPiKWD4KCsm+i26IxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCf0opEi; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCf0opEi"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43634b570c1so42191175e9.0
        for <imx@lists.linux.dev>; Tue, 21 Jan 2025 07:15:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737472546; x=1738077346; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=ZCf0opEibGaQOexBqaHLcWzS7sszydgFWMXb1C8GAD0js36wn+289OVIGsgUMoH6k9
         +mqWwrglwsMLd5iRbXbCcCAbdk8/IivQeboWW/dXmJdx/tKRRDEOwghXJUctE6yC+DbM
         czpI2mGs9qrn+Gmm4HXzlSMf6TmRY+u7eomyKfRyPsnJQfMNYgWEGLzKi8KjOdUDfun+
         BltEaFS98yn3IoFVfQOo07dlUrw6yC0Az95bWZQnSVVg4Wq+hO7k2Aaja9EDW6PxfZ6+
         k00NwhGStiikS8qve9riJS83e5wmSn388EugZIRIY4H0lXENIVsu/ohVcZgU9THnE2sh
         Nhfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737472546; x=1738077346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SvugShSkE19vxPC4Zwoh2Wo9A7je9UiUf85WI3sjd/U=;
        b=CH2IP2Lwjz6OXxof6ykrTLDP04W1OxEvwi+0FVeOyxoY+LnjaDv4cXHWFaYAY84RJB
         7tPJEcJo2Pi9JAGPF9IAV5eMEkHiB9e4+Cw54Nw+HqmlBgQ9iiHYRXiEH4AcW/7TKcty
         AsMiBPPuitvnyH/d3/gasWOr6Q5c6TizdRxULW2HJFQEuT50WP43wJtsod549lEQqO9O
         3R9Sg00jjk6rLuYGP40TVT0bjyWsTC+AntBERhq3X/4eZmQ9al3z3CxyAeaCvkYj8VeG
         XmBmQKnEoqz6TMgo9e1zzPP5lyqI/SQ5S0FBjbYonmwRsWfoOKXMpdEPvsOcfUBvzwVK
         vopg==
X-Forwarded-Encrypted: i=1; AJvYcCW8swMVGvcfIo1SP48TJGxHOkYGAUQkyVuZEyh5whaS10aKPgw0YBSGbh28YvHlqyIX2Ik=@lists.linux.dev
X-Gm-Message-State: AOJu0Yynkb6Al83g8hOyaVxB9WGXlrd8/LFhGmetUy8DoPVXFrosSzvF
	i4IZjzcIFvN5c7VomPI72YcDIQLYi9YmUgRZ7Wn4n1bWypT1kdRQLHrCLryQknw=
X-Gm-Gg: ASbGncvRkjz1ajNW7y9/KkiULkiAyuN+lGTxP4UKl90ozdazrhVZXeQk8TYzOQF3TyP
	xtpUMwHUV/EpgX4l/FIIzU+gEt8DX9buGArFLKKyhMbxv4lHZTdnThL3mlk40YeTG/0bDPxo7Qi
	yLUwRAYAltX/IjGwB1ajIgZboivryEePJQmppfy98mUgtRUb6RnNk5XWHqDLgvdIf87V8Z3Nfh8
	CDwd8nHMnJXgE8jcDDSQdIAsbaJhjpgTgcsFVc82Xo+e5KuWozkwNIlXK7LqfBJkokPMwUn9gw=
X-Google-Smtp-Source: AGHT+IGmWQgLP0oShFNos3lRgIKGS81KPZyyyfYAl5Ap+K5h/aBJR8EY+XcHucmV4GzqhIiM28AjlQ==
X-Received: by 2002:a05:600c:524c:b0:435:306:e5dd with SMTP id 5b1f17b1804b1-4389143a66dmr152559035e9.22.1737472546502;
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43890367b48sm182318395e9.0.2025.01.21.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 07:15:46 -0800 (PST)
Date: Tue, 21 Jan 2025 18:15:43 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>
Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
Message-ID: <bf81200d-4a08-4ed3-b67b-d2cb1c1df2dd@stanley.mountain>
References: <20250120-rtc-v1-0-08c50830bac9@nxp.com>
 <20250120-rtc-v1-3-08c50830bac9@nxp.com>
 <a0403834-1c2f-42b4-81f3-ca4123fd2a4e@stanley.mountain>
 <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB8459FB98E6C52DCF3BE76DC088E62@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Tue, Jan 21, 2025 at 02:35:59PM +0000, Peng Fan wrote:
> Hi Dan,
> 
> > Subject: Re: [PATCH 3/4] rtc: Introduce devm_rtc_allocate_device_priv
> > 
> > On Mon, Jan 20, 2025 at 10:25:35AM +0800, Peng Fan (OSS) wrote:
> > >  int __devm_rtc_register_device(struct module *owner, struct
> > > rtc_device *rtc) diff --git a/drivers/rtc/dev.c b/drivers/rtc/dev.c
> > > index
> > >
> > c4a3ab53dcd4b7280a3a2981fe842729603a1feb..e0e1a488b795645d
> > 7c9453490d6c
> > > dba510cc5db5 100644
> > > --- a/drivers/rtc/dev.c
> > > +++ b/drivers/rtc/dev.c
> > > @@ -410,7 +410,8 @@ static long rtc_dev_ioctl(struct file *file,
> > >  		}
> > >  		default:
> > >  			if (rtc->ops->param_get)
> > > -				err = rtc->ops->param_get(rtc-
> > >dev.parent, &param);
> > > +				err = rtc->ops->param_get(rtc->priv ?
> > > +							  &rtc->dev :
> > rtc->dev.parent, &param);
> > 
> > This seems kind of horrible...  I can't think of anywhere else which does
> > something like this.
> > 
> > It would almost be better to do something like:
> > 
> > 	err = rtc->ops->param_get(rtc->priv ? (void *)rtc : rtc-
> > >dev.parent, &param);
> > 
> > The advatange of this is that it looks totally horrible from the get go
> > instead of only subtly wrong.  And it would immediately crash if you
> > got it wrong implementing the ->param_get() function pointer.
> 
> Thanks for help improving the code. I will include this in V2 and post
> out after we reach a goal on how to support the 2nd RTC on i.MX95.

Don't do what I said actually...  Let's find a better way.  I don't
know why rtc_class_ops function pointers take a device pointer instead
of an rtc_device pointer.  Or if they did take a device pointer why
not the &rtc->dev like you suggested?  But let's not do both like this.

Migrating all the function pointers is a lot of work but not impossible.

regards,
dan carpenter
