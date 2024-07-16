Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E3819EEB1
	for <imx@lists.linux.dev>; Tue, 16 Jul 2024 15:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721142334; cv=none; b=GXqs2WVNV206jG+WkDarLjROXp6C8f20/OEwDyKbfVj144VlGJgdzIBLxJ/DOpDgq50l1YIfE7LhHNv7ATKSRs9uRNTq7ccDLfqvhc/ixZ0beRsxPSSLwJsBqQNevEXP+hB4SsUTeJ6aAxqEwL0fHoBBCuuTPnMTiaWzsc0RLR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721142334; c=relaxed/simple;
	bh=cprunrzR2Vx52GohB9P9vzAt1SjTpPE0piOrxfNcg2w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZyssK8W47sSZ/pArTjTmESmdh4IauluLcgAXna7JNiKnAAqsld+DI006GktVIB+1c/Vu7bZB9mgF3PzT6AcibAIva+VRTo0exRyaGPqQjz/wi6/QNg+h4ybpnQnuKpX/Vmzs2DMX2lwsnVn805C1M/CGNtJBpjR9at8GxlW0PAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YakP+CjF; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YakP+CjF"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a77b60cafecso663056966b.1
        for <imx@lists.linux.dev>; Tue, 16 Jul 2024 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721142331; x=1721747131; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oIsP9WfA0TMZUezHpRe4LD3xeHG2Pnug2FDZg/pF9jA=;
        b=YakP+CjFsyjbZscBC8JKt71nr0U2+7W6Ij6AhFcUxqqxP4YQOQusZYwHdJw/GYtxcE
         uO8fCIsZvT2EmmW/VH2u/p+wqljh5A2i7iOoRk7bAoCPqncV7KAhl5cPntiM2qM0cOm5
         q6xmKbVHEgLc/AXnNQDiyE7gL/gd9jH8LNqB/KO2s4olVCIVWuDJeYrXNy1dDMEN/dr8
         T31uslBWOauCZsTNFkl4ibs/ySqt12QkrcDg5SQ8HT/8XeWBF38pjGwZ0WBGCXWUzMhf
         k2bnqxgDX6Y2FUkBUwBSSLWg6CTyDxu5y5kYwNjI3K4pp1MJuukMAT0mtjjJRKVMjb5b
         rtMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721142331; x=1721747131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oIsP9WfA0TMZUezHpRe4LD3xeHG2Pnug2FDZg/pF9jA=;
        b=FsxLmmhwDG802dDkwPGjVy65dM6jggjIDR5GlfePP1fgQ7uXNppevPZaJ/9XnhlGta
         stnBJ/GWn3dKqZQZ4Jdyctf3zsteb8zyR2JhwQyoB3C3fiECkzH+dPSFEQa+kfJTAZ6c
         YF/qMRzSBdbrCGqRvxzto1255m6la1HGWaJ2T4CNamoqMv02rdJU8CumqCkPdQr426EQ
         f+y7jBmuYZ7ZJ75nXo7ajk5YWskCU5eXoID0Mn9/HawpKyigQ510b45lEJFLo27TGBhS
         39RfwnYvTw9VV9cOtI/eNtxOIja07Vo8p0Qu871R3VIS+YSR+i30y3oRLZ8ADUoc0iwz
         sshg==
X-Forwarded-Encrypted: i=1; AJvYcCXmC3DVGWbG1HFcS5Ix5POybnj40Esu1TbwNhcGaUhatqd36PC6El8TH8pUDgU2nr1dX9A/+lVh0Tfl72UMM1LziWxz
X-Gm-Message-State: AOJu0Yxsnwk+fHbAVckUevynuQFA1fh0nsvaW3c9UG52vJmNI38uPKN/
	+9M1+id7V+fypjAMUDIT8Gaf7pAiq/+JJ424qi3nnpL3DGmASn3w
X-Google-Smtp-Source: AGHT+IHu17WSkuVX0jxOAWCJadIe0O6dlHEv4dokYnccOiyPeH2LoXogdOhBgimTWYiWMAXlMX5fnw==
X-Received: by 2002:a17:907:dac:b0:a77:e0ed:8b9 with SMTP id a640c23a62f3a-a79ea3dfc64mr274375466b.6.1721142330957;
        Tue, 16 Jul 2024 08:05:30 -0700 (PDT)
Received: from eichest-laptop ([77.109.188.34])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a79bc7f1e04sm328378066b.127.2024.07.16.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 08:05:30 -0700 (PDT)
Date: Tue, 16 Jul 2024 17:05:28 +0200
From: Stefan Eichenberger <eichest@gmail.com>
To: Frank Li <Frank.li@nxp.com>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, andi.shyti@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
	wsa+renesas@sang-engineering.com, francesco.dolcini@toradex.com,
	joao.goncalves@toradex.com, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Subject: Re: [PATCH v1 3/3] i2c: imx: prevent rescheduling in non dma mode
Message-ID: <ZpaMOHhs1uDPAuKe@eichest-laptop>
References: <20240715151824.90033-1-eichest@gmail.com>
 <20240715151824.90033-4-eichest@gmail.com>
 <ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZpVWXlR6j2i0ZtVQ@lizhi-Precision-Tower-5810>

Hi Frank,

On Mon, Jul 15, 2024 at 01:03:26PM -0400, Frank Li wrote:
> > +static inline void i2c_imx_isr_read_continue(struct imx_i2c_struct *i2c_imx)
> > +{
> > +	unsigned int temp;
> > +
> > +	if ((i2c_imx->msg->len - 1) == i2c_imx->msg_buf_idx) {
> > +		if (i2c_imx->is_lastmsg) {
> > +			/*
> > +			 * It must generate STOP before read I2DR to prevent
> > +			 * controller from generating another clock cycle
> > +			 */
> > +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +			if (!(temp & I2CR_MSTA))
> > +				i2c_imx->stopped =  1;
> > +			temp &= ~(I2CR_MSTA | I2CR_MTX);
> > +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +		} else {
> > +			/*
> > +			 * For i2c master receiver repeat restart operation like:
> > +			 * read -> repeat MSTA -> read/write
> > +			 * The controller must set MTX before read the last byte in
> > +			 * the first read operation, otherwise the first read cost
> > +			 * one extra clock cycle.
> > +			 */
> > +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +			temp |= I2CR_MTX;
> > +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +		}
> > +	} else if (i2c_imx->msg_buf_idx == (i2c_imx->msg->len - 2)) {
> > +		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > +		temp |= I2CR_TXAK;
> > +		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > +	}
> > +
> > +	i2c_imx->msg->buf[i2c_imx->msg_buf_idx++] = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> 
> Why not use loop to read all data from FIFO? I think read_reg use readb(),
> suggest change to readb_relaxed(). The similar case for writeb. dma_engine
> will use writel() at least once when start DMA. it should be enough for
> memory barrier. 
> 
> Because it move to irq handle, writex__relaxed() will help reduce some
> register access time.
> 

I think there is not FIFO on the i.MX I2C controller, or do I miss
something? In the i.MX 8M Plus reference manual they write for example:
> In Master Receive mode, reading the data register allows a read to occur
> and initiates the next byte to be received.

I will test the changes with readb_relaxed() and writeb_relaxed() and
see what happens, thanks a lot for the hint.

Regards,
Stefan
