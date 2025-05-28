Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC84229B0B
	for <imx@lists.linux.dev>; Wed, 28 May 2025 07:13:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748416441; cv=none; b=hDMInnEjHB+mgJF1Sjjy/ZijHn2KeoLp/MBfaw7BZ9Mz2u6kPT/Vnxg3xn+iGQG3bjNJKLtPxB/IwG0E7OrGS/HGrWADS1vhVl3efTNQcyE3TCjtpPNf5mmYBS1IMxDFGSKNTjI+3bVnYh1Rpg4cA+4pVwm+hFpWQDt1MTNK4Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748416441; c=relaxed/simple;
	bh=NA01JuBV6s2RqUnPspO8lP68OW1tJ4ZIkKhFb8sGOqI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aS8GXvV9PlMFFMHmrF3Mu8Iaggdgkts0AkyCeLbrjYEgeJ8bpHzLrFXwrxjS+pOgtsEl2lIs2+PQVOwQsf2kJpGR+/xjpR8iC2AQNYe91y+nYACRoA/hKyCaJdDYqYeUEI5pkJBub8Y9F5SEI+Bh+cMq4oxQw4MSp7qZSFKv7uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kUX3f/c4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kUX3f/c4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441d1ed82dbso47604485e9.0
        for <imx@lists.linux.dev>; Wed, 28 May 2025 00:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748416438; x=1749021238; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=kUX3f/c4KYfi2GjxCLAhBzkJcT8iZ+WC0mZ6kOICLRu4bDjTi2hOxmIuf9CcWw2JCq
         r+iRMmg2yqzEnQH2WYUFVGRjd9cCZ7Bu2EtKgDXX11lTByLp60/O+W3uKXh/HUD6l6n1
         tPehlAMG74RAlCXnYhArQVAx0PzNPJX+lSRQZofK30WZ1aKH00AtspYUMifFa6mMArxw
         LJcfpyQEjETZFwPeNTnKaxprrxOCnQNgBX/Ft70x1hfMOmkY1xybKCOjfJDlLn3sbUih
         lHalJroSpP/JiSdispZ0VlsNKgZPvqckBGwIC6wTMJsUFs+r+nSMKM7XbiG1wkWREgPH
         b92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748416438; x=1749021238;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z38qczvZbxO76S2l6qCCFYCsTxTOPBbrJdkHVddxqs=;
        b=rTXwyqt0KflRjhjqO9obu029FNZA30H4gOkyTursyGtxrMtqs7T89u6JisjT5lVoXT
         HD135tjvJlRJ/ZRXVRCqOvJUk47KGrVCIxzBH9gsLquxlz2++FS3Xh3froW12pFgT7I1
         uebDxCq4hg34AVmVCvINzUg0/KUt6LqCjpHfK0tM4Vg6vXWsAWtmdiSktE7gAj5BTMCO
         Glu/lIAJL1AVcLQ2l/Fe/n0jZZDcBmjVAeguCNUSX7Rb9SB15bZlA1rK9zyd13S0qNP0
         LS6zBdpB+pWGEKvQD0SmrSwSFOGKCL20qDIWppJIxd2AgcCWSiHJSmudSnhl7WQaWsKi
         OZng==
X-Forwarded-Encrypted: i=1; AJvYcCVqjyXDLZJLFvUdSAn/vqp2+krF3PMyLAVtu0+dOHFl5E5N1b3kKREDMIAGVwgV0YeV4ik=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxHzphIVNvjK2pfjct5k3h7ojnnBL/oguv9PK3/0/A0tbrhMxD
	/S11U0y2EkN5Y+ErO+j2lXUZl5Vw8JASCxSdY8tDHqsUvVHY1JNtGw1+
X-Gm-Gg: ASbGncu4hrdP766v+gQ6R1etia2UsRSNaZC1bQEWJjdIN2VGqfgxJb2YJTGpdCkgCAw
	iq6yem5ZwUsOSwnRX8NJdiEJJ6mExBELivlugZbkczNDY4eFcS1C5vK3po4t/8+8gXWu4mwvuH0
	oRl2hGa8RGOQTDHKDWH8T+idMbeAw5vuliAaDECvcDrOcE3ufSnrnoQksY0Wu5UcMLDgDgJ1dj2
	1H+ZbdBD7P00fQIDiVOlhA5sUHR1vkslU/FVNULtjaWp4jYUvT8SVgZQDP5p8TD6LS4i2/Gp8AH
	nJ54+tRG5WUpt2pPACjjGhR+yDiCCSKRxPoik7KB+i9UtjJsoyA=
X-Google-Smtp-Source: AGHT+IFUeDV6q6xaB+r06fKVdY1G8cH/8XvdGuTg+xFtJRhZxSlobft7u22w3aTFnbPx2ZJc7hHSZg==
X-Received: by 2002:a05:600c:4ed0:b0:441:b5cb:4f94 with SMTP id 5b1f17b1804b1-44c91ad6b5cmr121816275e9.5.1748416437876;
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72:0:a46c:90a2:a3c0:b012])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4500e1ddaeesm11501665e9.35.2025.05.28.00.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 00:13:57 -0700 (PDT)
Date: Wed, 28 May 2025 09:13:55 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>,
	stefan.eichenberger@toradex.com,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:FREESCALE IMX I2C DRIVER" <linux-i2c@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>,
	bsp-development.geo@leica-geosystems.com,
	customers.leicageo@pengutronix.de
Subject: Re: [PATCH] i2c: imx: fix emulated smbus block read
Message-ID: <aDa3s2TR-GvPmF3z@eichest-laptop>
References: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250520122252.1475403-1-lukasz.kucharczyk@leica-geosystems.com>

Hi Lukasz,

On Tue, May 20, 2025 at 02:22:52PM +0200, Lukasz Kucharczyk wrote:
> Acknowledge the byte count submitted by the target.
> When I2C_SMBUS_BLOCK_DATA read operation is executed by
> i2c_smbus_xfer_emulated(), the length of the second (read) message is set
> to 1. Length of the block is supposed to be obtained from the target by the
> underlying bus driver.
> The i2c_imx_isr_read() function should emit the acknowledge on i2c bus
> after reading the first byte (i.e., byte count) while processing such
> message (as defined in Section 6.5.7 of System Management Bus
> Specification [1]). Without this acknowledge, the target does not submit
> subsequent bytes and the controller only reads 0xff's.
> 
> In addition, store the length of block data obtained from the target in
> the buffer provided by i2c_smbus_xfer_emulated() - otherwise the first
> byte of actual data is erroneously interpreted as length of the data
> block.
> 
> [1] https://smbus.org/specs/SMBus_3_3_20240512.pdf
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Lukasz Kucharczyk <lukasz.kucharczyk@leica-geosystems.com>
> ---
>  drivers/i2c/busses/i2c-imx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ee0d25b498cb..4bf550a3b98d 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1008,7 +1008,7 @@ static inline int i2c_imx_isr_read(struct imx_i2c_struct *i2c_imx)
>  	/* setup bus to read data */
>  	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  	temp &= ~I2CR_MTX;
> -	if (i2c_imx->msg->len - 1)
> +	if ((i2c_imx->msg->len - 1) || (i2c_imx->msg->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> @@ -1063,6 +1063,7 @@ static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_im
>  		wake_up(&i2c_imx->queue);
>  	}
>  	i2c_imx->msg->len += len;
> +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
>  }
>  
>  static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)

This makes sense, we never tested the actual SMBus emulation. Thanks a lot for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
