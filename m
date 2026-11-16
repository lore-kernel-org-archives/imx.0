Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794853506;
	b=pCXMlnLEU7gW0EyycpePWjJIMBrBCMXVgaDKHLbOsBeJSN49cOlsAfvzE+LwLNbo55Gg
	 o3opIoRK2e5rjeKz2iFpdrSIbSCTFYsar7H9nbdVuniQeugpwlt0TAd0n2CU76ew5S68P
	 U/lBd/osoHIN92UvXCGP9DvpluEo835I6q2rZkX0r3P59g+KWOBghGCvQ9Va4TiXyp4BB
	 sVcEmcCuUiAaPpCET4YB4A4SZqQdv6V5OQ4lkvoggRnlfNVMCDGby/EV19oNcD22Keau8
	 hZKzGM1TWKPpdZNG7qwu60rHDG5quEITJ0ufaASGSzT5W/MTCqJy0fv1BL3x27KlbRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794853506;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
	b=zM7nHWQM0oI0C5OlAgWJGNqXID7YX+7pNsO9X02STAvdfe+cFT3tzPvH4IP89EmV+28u
	 9/Nov0VBKcZOhC1XMySHKnSr6ulpdgbPdsBrS3Z9Q8gDLa3sP1Cd2BLzmfEigvnm3ReQW
	 zEVQhimSWhhtFemqYKP6m+qNrJf9gi6gwgd/CjSeI7slhf0zYnwJzvn7ESSKGsmaARAzH
	 HGcCko+3x/y6ZFkWjJEnzxcRvXp9rbHlcSugIBFLXQaBpNwiCJueA0uRDPCeIjQEX+Qxz
	 h8AkoOf4tYoNXdwZhLhkwnNYW/KstPEIZv57Le7bgARg9Snp+n6dD3JCM2wMEjVCsIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKSDLKP1;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E51C606A32A
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 18:25:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E51C606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oKSDLKP1
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so38025365e9.3
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 10:25:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794853504; x=1795458304; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=oKSDLKP1aA81GW0PokAf2I1DvpmquxAjlif6D79Kr5nWT3BVUu1/jQ5z3zQvGzB/wZ
         DM8Eokn21pnzvNwjkCmWLHXQx2NlRYO8kRx+0ZDWTLp600gr+rUCRdJdAvVeAmAwdYXP
         UocBscxQKY99kheSVR5alYPtTEAG3Ng64pQ6GtU73TH8JP0V5egBLnSpePAUlL6jvImv
         vtXqDKctjA2nf1uTylLZCf9j6K3H1Rt5C7Kq6lFsWzLdppuJAzi5O6YloGcnsqXzYcur
         4cXwkPzaZGO1Ap0DpWhMAsIZRXwjupFYXxScDe8O9z48Q1PVCAj541LgVg8wY7z5Gcby
         xJMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794853504; x=1795458304;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EjsiR+6jJ8ZmBsAFEuHSjNRWBiCgBYf83KNABOGKFps=;
        b=AygExX1qnE0Bfi8BHB9p/kTyuklG85ApyWw5bGa2cvRj7gUsXm8oAI60U/lWOCKR/q
         wcgrznMi8KW37YlOcIORuAoX1q7sUtznGHnH6KdHi99g/facSdbN9J+OUYPZ7vil2Ai/
         oUd5EDvdoah4tEFX+pTFzQRt77D/ogfzoroviPd80R7/TTAWhXcNFIDIbwsqnb0kNfmX
         wh7DaVw+Idk1N6lOR5n89jrkRjNGHg+zkTOUIpSOneHDKKc7A0KOqe6eBa1W1hOHK19V
         EaTfjf3v4fhh6OaRnYXju7bw9H3VjUJ661en2BIJn2T26dSwEj3A9D1FXsIEUPb8gMIn
         OYJQ==
X-Forwarded-Encrypted: i=1; AL+hErFxJvWOlhl1X+86wy5bQ67M5sSbDSeZn1y61zPFpuAa0YqPsQeVnZaFTzRgdyF/lITzWJ0=@lists.linux.dev
X-Gm-Message-State: APuU4Z+b91D/KmKRpJKKe/w3NMB2dOSzv+v5TAqDtzG9rKguA6mojtvz
	dH/bpRJ8eZ4uNvKFs/CGD5Lj8os5PNmgInyCVRFiIPgAT/pqz3/YpGDH+37WEv0N
X-Gm-Gg: AYBFou1kTplKQAJ4cLKILGKiDy7R7BE5s65ANZTYpCqMwJer0IvYu7Bxmtmdj0RmJat
	MzQLWDK2ZNrHN2aynZPYjPNDF05U3gsvreR+eExevaU5hEDrHNMtZjxZbEttH8rpCvGaAxHS9kN
	qSkTgpHtQJdjHZT7HYXdPE8MTX/SGU2oUCkPv8MqBrVcn2D7FSb9L9yc4aNlFpNROMemacGyuWf
	3P7WTESeYO7D+Qj3Wdk+TTRk8AkyDnbpn6skgA5iLiCcvGYHNRiH9Ogwh4GYataq99YeIj0PnF7
	SQ3qOq9QUeyJc3by1oy2ePpKMDyheKxmVMs1bUG2Jj3FhNcyn5oZKyXW6xWO1CnptizeY15H+h1
	+Mi9DyPLl6jNLXDat2KHF7SUA8r0MnWigvZYqfeKdOC1smV6PM7sm0ozM6yFVYF0In0hc8w9qAU
	RFx8t0gpTKGYfmmN7l8LGDU6DGyL6VprZ3lZNxYGsaIlxqfhivXDcMOyITrGSD8CsS8kJM1UO8D
	8ZGoxiY5BYD8M+GZRbRv9wtGLLfX+8SjmtLZBlSfyMyk+n7SdukBYBV6dNcmwWiCaZnciVR5ZjI
	9xBUdPs=
X-Received: by 2002:a05:600c:34cf:b0:4bb:6a2d:b440 with SMTP id 5b1f17b1804b1-4bb6a2db5a1mr110927715e9.2.1794853503457;
        Mon, 16 Nov 2026 10:25:03 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78430918sm5161735e9.13.2026.11.16.10.25.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:25:02 -0800 (PST)
Date: Mon, 16 Nov 2026 19:25:01 +0100
From: Stefan Eichenberger <eichest@gmail.com>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Andi Shyti <andi.shyti@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: keep the error of a failed read
Message-ID: <avtKfW6vYmwl6D-s@eichest-laptop>
References: <20261116125940.1368194-1-mehmet.fide@gmail.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261116125940.1368194-1-mehmet.fide@gmail.com>

On Mon, Nov 16, 2026 at 01:59:40PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> When the count byte of an SMBus block read is larger than
> I2C_SMBUS_BLOCK_MAX, i2c_imx_isr_read_block_data_len() sets -EPROTO and
> fails the read. The read of I2DR that took the count byte has started
> the reception of one more byte, and its interrupt comes in while the
> state is IMX_I2C_STATE_FAILED. i2c_imx_master_isr() has no case for
> that state, so the default case replaces -EPROTO with -EINVAL.
> 
> Ignore interrupts in IMX_I2C_STATE_FAILED so that the first error is
> returned.
> 
> Fixes: 5f5c2d4579ca ("i2c: imx: prevent rescheduling in non dma mode")
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base plus
>     "i2c: imx: acknowledge the count byte of an atomic block read" and
>     "i2c: imx: do not acknowledge the last byte of a block read of one
>     byte", with the M41T0 RTC at 0x68. A test-only hook passed the messages
>     that i2c_smbus_xfer_emulated() builds for a block read to the adapter,
>     alone and followed by a one byte read. Register 0x03 (0xae) as count
>     byte: without the patch -EINVAL 40 of 40, and a print in the default
>     case showed state IMX_I2C_STATE_FAILED with -EPROTO each time; with it
>     -EPROTO 100 of 100, as the atomic read returns. Count bytes of 0, 1 and
>     0x13 read the same bytes as before, and the bus works after each
>     failed read.
> 
>  drivers/i2c/busses/i2c-imx.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..c7fef98934d4 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1142,6 +1142,9 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  		wake_up(&i2c_imx->queue);
>  		break;
>  
> +	case IMX_I2C_STATE_FAILED:
> +		break;
> +
>  	default:
>  		i2c_imx->i2csr = status;
>  		i2c_imx->state = IMX_I2C_STATE_FAILED;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Looks good as well, thanks.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
