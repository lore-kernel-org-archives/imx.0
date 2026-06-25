Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4863E3749F0
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378682; cv=none; b=nY86E+GEZt2Rxv5ot7GQOD/fqSRcxKB6Hi5+xcFVwep0tjc0H4liCRZ3QJqv19slpLPJ5JKD2vGPD3/fA80mCouQx+YY04aCo6xnNVQN9tbJdutxvi5Ek0+WkkhRQgf1guDGCF+j7GsOWgwCymjEIthPWHf3dFylNOcTl5nmGfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378682; c=relaxed/simple;
	bh=7Vni6aoU/U+1ED5C8Gh3fxPndlG3z+xryt5KP9cLmiM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a5BvTAA+exMhNRYWiEv7obPlbdfviQDtA2rfEHBc4rF9tAMiWDweGdX3LPgwIJ27qvuNduLTIAmq/2U3kGg4YPc+2LTWO0aq/05e1Le8lp44xShet7JVHUkzVPZH5to3AvdaFLVHgltJLsZD7sHCuTnH7Fgv06N/UBV2Jx5UXwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oz7WOozM; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oz7WOozM"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-46cbf263113so1455252f8f.1
        for <imx@lists.linux.dev>; Thu, 25 Jun 2026 02:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378680; x=1782983480; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G69PCEOlnq92SdyMP8AGIKg5XJgYw5Jrc7HuDLGgvos=;
        b=Oz7WOozMyIJIrndPeBrfHqo4FvsJIzusHX0BWwOLFuthk3xGdT2Oi7AT55bzFJRcbh
         M8gEHtl8FxYJ7TJ+dMlstxGn0hwfy7aij7S2ldpcnnfQq3d5lRZccYNvcP+bWkAMeFMq
         hQvqUe9mine+qxW8iaNEL7F/E7uibJ8TWZFkWtqfdV1XCd5dX0BHT2SMzYJ7sZobp5xI
         gkL3dQpJNbXph1k3bdL+solYGNKqnqGSGz9RBfznPPIo06CROyllWw0uX4LxV1K/h23q
         dG86l3aGXR4xaWr6kIYs0SWZKGQ2/+PA8IOCCz0fy+PfD+GP9K7UpBCHIEZp199VW2kg
         pNOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378680; x=1782983480;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G69PCEOlnq92SdyMP8AGIKg5XJgYw5Jrc7HuDLGgvos=;
        b=j4lqGKu7Malm2YOEVqiXxxzh48NUTkiv+j7hSYaRdxrd14ZieCHLy76Apv6qZW+gKI
         dA+uM+i9oANVN7bZzym7EEluKon/gTlU5lo+l6ja3U+rvvEg1H7mpD6v8LFtvAAfpEmr
         z8TOX8BMc8nV1JBYa3knYTY6ZcuXXnw+7xoj+ZuWhy0bG1KTrAeXcVbYq4zTVk+k4e98
         6ANjVkDtrQMYLIRZSjSYCaFiGc3WRfeMcZSZOx31jGhfZVpKYAKIMCq2c+7Yve579qNm
         a+nwrWm3ub7zXaTzal3ENTNUy796lZ6+n/KPs8+tAObyQmUB1XC7BdS2EhHCi9lQaGqW
         qC8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpoRf/qR6jw5Us+CFLs66QMpUN6mQjWXfn1N0Yyhw2sbukA/7OVLxUYEoAEZ9HcP/fvAOI=@lists.linux.dev
X-Gm-Message-State: AOJu0YxcacDOmiAhbEXOc70PwN3OR/ImR1S7gVxwgmRweCNOcwCzSlRI
	Zmyjx53gm3oD6GOPL/5UhIHrQewNmZEyZUMHJW/1WH5lMBZSzIRwxGfz
X-Gm-Gg: AfdE7cnm7KNw22tpDqab8NkE/NPPVmuwCkNcte4z0I5udQ88yM38+uQglcq34OJGszX
	zL0Af4DoV1doLbJ1aM/xlFrA+SV7KMVk1/EPwEKDlkWs2/b+RojFmZlZ/pGTZVUI40f+r8Z8otT
	HpsQsNjV8ttuGQHYT0lIqpy8mbxOxRcUO3rD3BhJkmLbqN8PqtWb/cJOCyukh5Wnsvmqh5Lly1o
	vQZbl5eL3+IEPyiqVNa+MExF/ATGpUIjGVihK0WKJI29rFIeaaJeP7EoMT2muM8caESiWq+xLOd
	JXJMXhhkDEDYtYIyh1mID7L/Z1IQcnPM3GJPbSntvRJFovTa393K8Kn4W7VHq9GSieADMqnmb3o
	eZbuaYc8hfszfvwq37ELIfPod+HSHBqpQ/hLkBkBCvCHtG8KKiNeIVWEYQPko6fjJ5A==
X-Received: by 2002:a05:6000:41fc:b0:46d:47bb:d711 with SMTP id ffacd0b85a97d-46dc0e050d9mr2295206f8f.23.1782378679096;
        Thu, 25 Jun 2026 02:11:19 -0700 (PDT)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46e3d6ba143sm209356f8f.33.2026.06.25.02.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:11:18 -0700 (PDT)
Date: Thu, 25 Jun 2026 11:11:16 +0200
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
Subject: Re: [PATCH v2 2/2] i2c: imx: fix locked bus on SMBus block-read of 0
 (IRQ)
Message-ID: <ajzwtNbCKXdxQAUA@eichest-laptop>
References: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-0-26a3cc8cd055@free.fr>
 <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260525-for-upstream-i2c-lx2160-fix-v1-v2-2-26a3cc8cd055@free.fr>

On Mon, May 25, 2026 at 06:43:16PM +0200, Vincent Jardin wrote:
> SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the
> interrupt-driven block-read state machine rejects it as -EPROTO. Worse,
> it returns without a NACK+STOP: the next receive cycle has already
> started, so the target keeps holding SDA and the bus stays stuck until a
> power cycle of this i2c controller.
> 
> Accept count=0: NACK the in-flight dummy byte (TXAK) and set msg->len to
> 2 so i2c_imx_isr_read_continue() emits STOP via its normal last-byte
> path. The dummy byte is discarded; block-read callers only consume
> buf[0..count-1].
> 
> Reading I2DR has likewise already armed the next byte on the
> count > I2C_SMBUS_BLOCK_MAX error path, so NACK it (TXAK) before aborting
> with -EPROTO; otherwise the failing transfer's STOP cannot complete and
> the bus stays held.
> 
> The atomic path regressed earlier (v3.16) and is fixed separately; this
> patch covers only the v6.13 state-machine rework.
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Cc: <stable@vger.kernel.org> # v6.13+
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  drivers/i2c/busses/i2c-imx.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 14107e1ad413..8db8d2e10f5c 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1061,11 +1061,28 @@ static inline enum imx_i2c_state i2c_imx_isr_read_continue(struct imx_i2c_struct
>  static inline void i2c_imx_isr_read_block_data_len(struct imx_i2c_struct *i2c_imx)
>  {
>  	u8 len = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	unsigned int temp;
>  
>  	if (len == 0 || len > I2C_SMBUS_BLOCK_MAX) {
> +		/*
> +		 * SMBus 3.1 6.5.7: support count byte of 0.
> +		 * I2C_SMBUS_BLOCK_MAX case should not hold the SDA either.
> +		 * So NACK it (TXAK) to not hold the bus.
> +		 */
> +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		temp |= I2CR_TXAK;
> +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +		if (len == 0) {
> +			i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = 0;
> +			i2c_imx->msg->len = 2;
> +			return;
> +		}
> +
>  		i2c_imx->isr_result = -EPROTO;
>  		i2c_imx->state = IMX_I2C_STATE_FAILED;
>  		wake_up(&i2c_imx->queue);
> +		return;
>  	}
>  	i2c_imx->msg->len += len;
>  	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = len;
> 
> -- 
> 2.43.0
> 

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
