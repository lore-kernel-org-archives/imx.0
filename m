Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5D5B155756
	for <imx@lists.linux.dev>; Thu, 19 Dec 2024 09:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734599952; cv=none; b=ApIKATTxcka9g9RsF2gu+kCaze5Z4DRfgcqojoo2ImqmYP/cc46WYxZFvHvVEEJFJP1gLMisa5/WVmnUxDpPejTOa2b3gGgAZn/sL5Sj3qWpk3sOjzg2aOT7E2L0p9pdVPVl1tNsStHTTBo1LX6W+xGOM9hVB8Bw0H2dONx22TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734599952; c=relaxed/simple;
	bh=2pzXg6r8WcLgdnkjujmPrNasAAtlDRtHlv676oVeFkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g2LXomZbkGZin9WwCFtLiUteTyopJBP803ov+5AJKLzPi+hHdE+U2IZoLQBdToqskfmKxXYqPtLJuOMxrZvaLsIMKQuN/WykEntheccE0eKeeNjat4LTKhLYKIOgV8zOFsoLPn4NU65BqRG4Bi99EWtELAo3LAa4wedc/Ogrv/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+oPTjF7; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+oPTjF7"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-436326dcb1cso3636745e9.0
        for <imx@lists.linux.dev>; Thu, 19 Dec 2024 01:19:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734599948; x=1735204748; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=X+oPTjF7dmDc1rJggeUKmwt1SSKfGksR0QAIOT1KpEZM6xqaAD8OaYN8d5jVNUNHc1
         iXm7o5BUM3CqaTFqKRsEFXRu9eFlg+JUzhjNNR+WfGskR222x3GMMHz91rcMnCHT+XML
         LSPCwcUSgped1x6kKHuzNCK5Hes2ZYE0Hn05DUyDz7L4RYthDpRmVhQs+Lv5/HFdTlDc
         4J6/cz/U5VVUK/1itKLl6fBl0Imkw11A+kibbprZ48z3v4lenNMRsNRA4MQMQYpPSYTr
         e31qxPyNrbypnjffgzRtOlI6wAT7Qnitpjra/KxnMgJFrdNF5emtX9nFUN6GbSM5frvf
         3ddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734599948; x=1735204748;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euiOK8NNPzupxLdx+tbLr1TI8FnBjorvwfESAZao6H8=;
        b=FFdVlY65J2PI1ROwm24T05m2FpQEiu7+hRdzi5oae4rKUf0Q1+JyNx7vEkHLS3GB6l
         NJGgaCBGkHRTm2ZjTZ107lVR39Kt8gj63eI6SesTrlwftaq0TXKA7ahvTsW2IF8PRl4G
         Qoz7BHyA9sSj63M84KhCQMqGGMRgi61i6ccWi9K1Zo/l5iH4MlU4amehXKxO/JHFtDVz
         xhUWPaPTo+GqoqYmjaae7blqKKzucTP0kW0Nhc64VkE45idaOKwNknvsNnvSD2zYsD7j
         tjqRl/yJV/L8fvq8y+HU3ZTNpPBcyFYRuODARjCvn4lueckazkoZuN+Doq0/5vp3HmkO
         58ag==
X-Forwarded-Encrypted: i=1; AJvYcCX+suTHYTbjcHQsFV68S/1sHvtwTrZ8D1d0Cmo8yXelgtCLZPjpK2ivAzJS4/KHUqbp/X8=@lists.linux.dev
X-Gm-Message-State: AOJu0YztH/UYtjJU+nHkzLyFfpHntcYGBuRiWhuMlxvvZH+dViHnxYnB
	1pNysI5H9tuQVKWVPpQZ/3JDzhBivIauHXDmy3kV9cLuIOaXB6OV
X-Gm-Gg: ASbGnctHgHnRi7V0f6yMiovDWY+9UxXllqBdzDKS9WkqUqR5J6OBwXDBNe+F6ICxj6n
	AlLTrcSfmjMjPD4OjJQgqXRdSDJihqp2H+iSVxVJvODJLUQMZWjxgGOMe+YPQ7eBFhGn09R0HzB
	k0Lnv/fYzizzn+WEq6weY5fvKVdSa87H9r82p9Y9Zxy4RnbC+FOHdu5sDyVklnDfIR9gWDBXrr1
	KqM0Vg5Es3anKFOxXzgTMtIX5NEP3+dW496MN3TofclziQIQ3Vhf2rS
X-Google-Smtp-Source: AGHT+IG0fZL5g+zEG/fpP6eHHf2IPe9NkoBsaKGeRiza0EwWdk6u44xsj9AYe2YdbuChkpugl2kmMw==
X-Received: by 2002:a05:600c:4f08:b0:436:51bb:7a52 with SMTP id 5b1f17b1804b1-4365c77e3e9mr18873865e9.7.1734599947763;
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72:0:7407:1f5c:37ef:e8ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm1056999f8f.92.2024.12.19.01.19.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 01:19:07 -0800 (PST)
Date: Thu, 19 Dec 2024 10:19:05 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com, Frank.Li@nxp.com,
	stefan.eichenberger@toradex.com, francesco.dolcini@toradex.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] i2c: imx: fix missing stop condition in single-master
 mode
Message-ID: <Z2PlCXSG8qt5_3ni@eichest-laptop>
References: <20241216151829.74056-1-eichest@gmail.com>
 <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <w3x46is2s463ektusvnyu5tt2rinz7eae2ekzyqw2urw5yh5ga@pfzrgzpxjc4y>

Hi Andi,

On Wed, Dec 18, 2024 at 07:16:23PM +0100, Andi Shyti wrote:
> Hi Stefan,
> 
> On Mon, Dec 16, 2024 at 04:16:40PM +0100, Stefan Eichenberger wrote:
> > From: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > 
> > A regression was introduced with the implementation of single-master
> > mode, preventing proper stop conditions from being generated. Devices
> > that require a valid stop condition, such as EEPROMs, fail to function
> > correctly as a result.
> > 
> > The issue only affects devices with the single-master property enabled.
> > 
> > This commit resolves the issue by re-enabling I2C bus busy bit (IBB)
> > polling for single-master mode when generating a stop condition. The fix
> > further ensures that the i2c_imx->stopped flag is cleared at the start
> > of each transfer, allowing the stop condition to be correctly generated
> > in i2c_imx_stop().
> > 
> > According to the reference manual (IMX8MMRM, Rev. 2, 09/2019, page
> > 5270), polling the IBB bit to determine if the bus is free is only
> > necessary in multi-master mode. Consequently, the IBB bit is not polled
> > for the start condition in single-master mode.
> > 
> > Fixes: 6692694aca86 ("i2c: imx: do not poll for bus busy in single master mode")
> > Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
> > ---
> >  drivers/i2c/busses/i2c-imx.c | 8 +++-----
> >  1 file changed, 3 insertions(+), 5 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> > index f751d231ded8..cbf66a69e20b 100644
> > --- a/drivers/i2c/busses/i2c-imx.c
> > +++ b/drivers/i2c/busses/i2c-imx.c
> > @@ -534,20 +534,18 @@ static int i2c_imx_bus_busy(struct imx_i2c_struct *i2c_imx, int for_busy, bool a
> >  {
> >  	unsigned long orig_jiffies = jiffies;
> >  	unsigned int temp;
> > -
> > -	if (!i2c_imx->multi_master)
> > -		return 0;
> > +	bool multi_master = i2c_imx->multi_master;
> 
> with this small adjustment, I have applied your patch to 
> i2c/i2c-host-fixes.
> 
> The idea behind the change is that variables are sorted by 
> length, forming a kind of reversed Christmas tree shape. It's 
> not a strict rule—some communities enforce it, others don't, and 
> some follow entirely different conventions.
> 
> Since it feels somewhat arbitrary to me, I don't enforce it 
> strictly. However, I personally try to adhere to the reversed 
> Christmas tree rule whenever possible.

Thanks a lot for doing the change and for the explanation. I will keep
it in mind for future patches.

Best regards,
Stefan
