Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1233B36A34F
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378282; cv=none; b=I21mzV0rl/aCK/fefoDCb5P+mYiEU2xIRGq3ER1u9hRCc0nDuKJCQII/4LrWjl+jPZjCQO5l1pmtO0/+TTJsZ7vXMLidd4QhRgng11IcyFzRbgwJatHva/NcdOD9JUjFnAPl6RbT5Gb4Y0w5AmrU1nBYKvpqvjdTYyfJasLfysw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378282; c=relaxed/simple;
	bh=Fxdlux4xKPEUY23/deSXomK7ZVU4GMGdOEjfBvmQcWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OLI4iq6h6oCKH+1jIcEQbUbYBI6hoxkZyu+juEINKJ0aXtNwhmaldLiZoZwd6OHr6jFqvfNlB2kxOV5WhfXw/uc5YRjSb6IFGdpGyWjoJTsVQ+5kgEVaHcohHGpH+m6w3oOdRVCS6A6rI+W4sbz5Yg8VNslQ2NlXMD7JuOV1vqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R9HjEjGP; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R9HjEjGP"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4924e6fda5dso9875745e9.0
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 02:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378279; x=1782983079; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=twZyJNe4oKAUakpXmtBipZs2eMFjp62u4eaHu+ufJQQ=;
        b=R9HjEjGPQpis0ensBtjVepkxApoRnMnAN3FGYGtg/FMRSALCX4djzLVl181sLzhw51
         fBrFR7VclScHqMjwqPhP0fGd8OvHP+ZiYNFffcqHbEtajgyQYpHtAMzWSb5sDMxboZ52
         lPuPFyHI0XLcN6W0+/txtaMTlWmCS6Q83KezuBmPliUQxmKGvkKcE9UUEBmY7yySkCDJ
         UnnNYEV6aiVjkZBXXdcuw5csWBHGXS+Vs/sPstRpIPSUxfppjoP8p3WPFlqKe1jlCwQD
         +6F/A2A0HJDYcJQSjTOLBDqIm2rN+tqgA6q9GcL3KnMiMsQEITSes7G/7lU7oNrWdKJU
         8ZCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378279; x=1782983079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=twZyJNe4oKAUakpXmtBipZs2eMFjp62u4eaHu+ufJQQ=;
        b=epF4zr0dB9nCr9zUaQ5JFYRnEt0ZrHNy64EY0rKoloV50zGbihBkQxJuzFkiTYggqC
         jD1cq8FXlu5jfIKV3dirsnH/WCcx+Obrm/43Hl1d0dKkk+B3cPCxvyDbkwqDntdz42wB
         2EndnnHSBs0cSC4gYYXSxh0T8/pDLh19P0jirswVnttXHiL+FOQ1FOYhDDqXN6NInzQV
         QztfFbOMY9ylnZCuE4ELjTThPwzhXsW+tCWsGUKpFUz2T3WGhcwfvFKkUQj3MTccq4ls
         pgrspY6V5G+WvEQSPbPV5wEiNgtsmuWuEDd40wzRdnE6W+Fmmj9EbqEhXAjBSbWNgbKd
         VHNg==
X-Forwarded-Encrypted: i=1; AFNElJ8M739LrD6IsliJX991c4Ko7ZSGPHgsNVVElEX6w2eEZSbGgE+HdEbAGuYaJyD5/MQGXxw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzgmRKhAyn35Vpv7eyuZfEKEZvV3X0x4DYTKn0d7urLD9Mfdgd1
	41IIkYVCNgooveqsA0TD4RM2MXTptXGddUk8BzFuwoOj0EJ44G17ozDN
X-Gm-Gg: AfdE7ckHxRr3cRh1OxdQn1/fXqUn7vMkD6GwSleEBEGzVaWNuDhc873SVZRWYekVevt
	dgNNVZTTac8TVfJ0PQuwWbyCqGAXzS9PLMIGSHay0mPVPcctZ47JRy5xhn77GJyOEWACt/hHcta
	v6XWjORJxNJGvERNUp2g7vmwGSYAz2C+f/RrgOOZZ8bHasfBS2dzRzXi6Oo7V2y7iZlBZXGpl+s
	rTqikVSbxTLqudFmlC5QbnHcarx4dt90ttSbMpg6dEWAwqtGQNRKAtfrM3FYlj4GV36OHYU0iLA
	nXsJQfHttK3Wr+8tx2Pky4JkGpiLEayxDhG7nasBYwX5gvkJuIUYxcGDh0CDemGpgo1oYdcMwHX
	VgjqV4+QSevtxqJz3417ugERm0r8d6VVhGmuWsLCFPIqy+80DE5hBDJmcwZNkNoHHsg==
X-Received: by 2002:a05:600c:c058:b0:492:48c8:c705 with SMTP id 5b1f17b1804b1-49266865fe5mr18834925e9.1.1782378279131;
        Thu, 25 Jun 2026 02:04:39 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4926494f129sm47950825e9.0.2026.06.25.02.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:04:38 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:04:36 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Vincent Jardin <vjardin@free.fr>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>,
	Kaushal Butala <kaushalkernelmailinglist@gmail.com>,
	Shawn Guo <shawn.guo@freescale.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 1/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (atomic)
Message-ID: <ajzvJE5LuzvLmpZN@eichest-laptop>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-1-26a3cc8cd055@free.fr>

Sorry for the late reply.

On Mon, May 25, 2026 at 06:43:15PM +0200, Vincent Jardin wrote:
> SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the atomic
> (polling) path rejects it as -EPROTO. Worse, it returns without a
> NACK+STOP: the next receive cycle has already started, so the target
> keeps holding SDA and the bus stays stuck until a power cycle for
> this i2c controller.
> 
> Reading I2DR to obtain the count likewise arms the next byte on the
> count > I2C_SMBUS_BLOCK_MAX path, which also returned -EPROTO directly
> and left the bus held.
> 
> Handle both: NACK the in-flight dummy byte (TXAK) and extend msgs->len so
> the existing last-byte handling emits STOP; the dummy byte is discarded.
> A count of 0 is a valid empty block read; a count above
> I2C_SMBUS_BLOCK_MAX is still reported as -EPROTO, but only after the bus
> has been released.
> 
> The interrupt-driven path has the same flaw from a later commit and is
> fixed separately, as it carries a different Fixes: tag and stable range.
> 
> Fixes: 8e8782c71595 ("i2c: imx: add SMBus block read support")
> Cc: <stable@vger.kernel.org> # v3.16+
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  drivers/i2c/busses/i2c-imx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index a208fefd3c3b..14107e1ad413 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1415,6 +1415,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  	int i, result;
>  	unsigned int temp;
>  	int block_data = msgs->flags & I2C_M_RECV_LEN;
> +	int block_err = 0;
>  
>  	result = i2c_imx_prepare_read(i2c_imx, msgs, false);
>  	if (result)
> @@ -1436,8 +1437,20 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  		 */
>  		if ((!i) && block_data) {
>  			len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> -			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX))
> -				return -EPROTO;
> +			if ((len == 0) || (len > I2C_SMBUS_BLOCK_MAX)) {
> +				/*
> +				 * SMBus 3.1 6.5.7: support count byte of 0.
> +				 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
> +				 */
> +				if (len > I2C_SMBUS_BLOCK_MAX)
> +					block_err = -EPROTO;
> +				temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +				temp |= I2CR_TXAK;
> +				imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +				msgs->buf[0] = 0;
> +				msgs->len = 2;
> +				continue;
> +			}
>  			dev_dbg(&i2c_imx->adapter.dev,
>  				"<%s> read length: 0x%X\n",
>  				__func__, len);
> @@ -1485,7 +1498,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struct *i2c_imx,
>  			"<%s> read byte: B%d=0x%X\n",
>  			__func__, i, msgs->buf[i]);
>  	}
> -	return 0;
> +	return block_err;
>  }

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
