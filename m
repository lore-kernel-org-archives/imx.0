Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794851975;
	b=fTjZWZGmueQ+kO5dxtkKsdpUHGVvdGYaFD6W7qnQ0/M9/Lg0W4Jhau3J1lt3frPb0yUi
	 1U+YmMNuQ0/GXkw8A0XhjB9ysS5SLa8OGYqoJIcYNxsnjB5tyXsBnkIE9TFmh4+ji31uB
	 ahJs+Er62aLtS0GFl+d0wXNhT52iNPwl+ZRk6f3myPbpep+rAdQj40uI5931mJ30vbNae
	 vlILOwYJWdJ9JjihuengWqqRyoqjlf5gVQjxi8hbR7hq1VKX/Dd4BMu0qX6kkFx7DxQls
	 9ZLDZaet7TGugK1oyGs+sVHnuQR7lij5Tlo117J3CDPb6wvmrU7HC907v/4FyoQAWpA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794851975;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
	b=id7V0ygaFsP83nL88MCJkdocjVnTbl0pOEkIaXccM4nsLYx2k9L2ibJvZRlz9oJWp90I
	 JrC8lnuN5Vf4MJonrPcHH1tUaYFpBOAkCZGRoBPhT3WM5doIBRE3Vofkqr33XUSsA2Jfm
	 1yq6sngI8k4ow22ZGWZ+8CN5zwJpZdXFQHcXl8wh33/lLD+oVtqb/CchIIJm7+KIIv36q
	 VHQVcuNia6NvVTPlXL47DTodgDkyk+MD3x7L4JEiJjHTdIBqLOo5psB/duUo9Wq6TZXoZ
	 t2e/Es+3s1n7UF1g4CVlETvPkGKSToO1j7zvD6mghKU16Vt9icymY8dg0vk6eX/swdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTOFdZgm;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFB1D606A880
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 17:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFB1D606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qTOFdZgm
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so822635e9.0
        for <imx@lists.linux.dev>; Mon, 16 Nov 2026 09:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794851973; x=1795456773; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=qTOFdZgmRkyjLlSvsdQ+ui+TPK2WxNiEdHIBKtroOSKXYROKQDGB1rUycaaDI08Fh4
         d/9zsZnCDCyWeZZC/ODnWvpp+OhTPVjVnsZreHMBfmxTE6yA7iDUFDWe9ysXRjJIcPY3
         Z5lYaZb1Er+9OQYcrjUIcBcmJNGMN/ybmDV18vQR3SxFvRPnxvb9PdIxnTa5soKX6dpy
         jP8XbeZbuldK07/3lxjX8YwDA5S5/OL9r4yqRiD8CwUhp7LiH1zRSjUm03bxwj4oq2lH
         kpqoNBiNnFuCBev155LF2BXU4+jaXMdqlvhL1+1coqmmH9/LDRGokjCO6Sd3g3GxYCRz
         uSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794851973; x=1795456773;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+nvE593UQ9d0U2IPo3a1ExhnUFrCrkM14breEsOZj/U=;
        b=OvdnI7gCXnzMCbza2d+EIGGMvBommnFNhcHbDiNiX4QGqudsokWeam43tWkwoT2YFw
         O5P/ebHzV5bFhSjZAx1MZjY7cFWM+usmAv4P9hgHqhejKs9A+tp6fmR1qu6hXD+TNx8Q
         j+UsQi6RfAm0e2KsFieJaKLioNqE836XVFJlC5XB/NYBa0GOkdaqFK4Ph4xcjQvih7XA
         9EPAlJGOEEHLr6V6XGBN8/zkkodavQKGX0Y6exK3OnFenA8SE1kE5+p58FrhN++HqOSs
         xWTIELWf4n0jTRLPo3R2dZ46VGfogbCPEpmlDpRtnNWBjbVJJUdAa8c/Dkg1oQVZp63/
         1WBg==
X-Forwarded-Encrypted: i=1; AL+hErFTHlYDuht4mlOAwMrdKFQUqd07iv8WqsQGsn6QLdW8+S+/euEt4+vHV5D6wXGLMFPZR9I=@lists.linux.dev
X-Gm-Message-State: APuU4Z9QV8rkkSoWweXjUtzk92OSeYt5sf1ugefZjyvHc4ogKZx3opSm
	c1PWAuuE68X4tf9qIPA3vMQ/8W7n0gEL14DzYzjtLg2pfGckL2ppPK5q
X-Gm-Gg: AYBFou3kgEjzxHnvHyzgr3zFq86kVKewcqgB4FwC9R7jvjb2dOr7/AOVQxcDcF6mzSm
	Kls5PqoE+HHsx5qQiP4U3MSW0jR5W8wq8Jo4vUBbcRVIXtzfTkTb4YD7x3PYPBpsrq1WJPDj1ia
	Lyyqq+jPSXvummZtgoX4KiZ7p3jqESqAJBVTumOORUuSaOCdZ+JJ54cZI/zr96+Xddai4CV06CI
	aVGwPdJrszD9UvpTWiEBUpFeNLdl/Lw6JT21uiiIV0iy+OxN5/h7rrnrYs86AqIoGR3/wgZNWXS
	AKUOnJKVHzlcahQd0RSB0IDHK0Vegslqk5W0zDVwoS1srYxTW1lzjrMnuinBtDq1qZj64fNmWN+
	g4EmXwzuxd6qpXNSbioCUpWHwCMwZibl9LdNNbTHh4V1oGb9bYyAoepS/g1IeXuys3b7+nhkL2u
	BIOBlk+pX3TDzG2ssTlei0NX9FlGrsuBXM9TeE+bvfXhCWXYLl+lF969bFwhNqgKBCnzN+JVQpx
	zD+b2IOHgZUF7W1aMufcCmrssPbYKVLuo+AKudWwr8jb6+uPmI7jg1H6dWNL2PfVkJY
X-Received: by 2002:a05:600c:678a:b0:4a1:d49e:9ce with SMTP id 5b1f17b1804b1-4bb78372a20mr8533235e9.2.1794851972940;
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Received: from eichest-laptop ([2a02:168:af72::cb4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm22431108f8f.21.2026.11.16.09.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:59:32 -0800 (PST)
Date: Mon, 16 Nov 2026 18:59:30 +0100
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
	stable@vger.kernel.org, mehmet.fide@screeningeagle.com
Subject: Re: [PATCH] i2c: imx: acknowledge the count byte of an atomic block
 read
Message-ID: <avtEgpw9YpIzCj5p@eichest-laptop>
References: <20261116122707.1349139-1-mehmet.fide@gmail.com>
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
In-Reply-To: <20261116122707.1349139-1-mehmet.fide@gmail.com>

On Mon, Nov 16, 2026 at 01:27:06PM +0100, Mehmet Fide wrote:
> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
> 
> i2c_smbus_xfer_emulated() sends the read message of an SMBus block read
> with a length of 1 and I2C_M_RECV_LEN. i2c_imx_prepare_read() clears
> I2CR_TXAK only for a message longer than one byte, so the atomic read
> does not acknowledge the count byte. The target stops sending, the rest
> of the block is read as 0xff and the transfer reports success.
> 
> The test for I2C_M_RECV_LEN was dropped when the read was split into
> i2c_imx_prepare_read() and its callers. Commit a5d0b9e32745 ("i2c: imx:
> fix emulated smbus block read") added it back to the interrupt driven
> read only. The DMA read never gets an I2C_M_RECV_LEN message.
> 
> Fixes: b460b15b3cc2 ("i2c: imx: separate atomic, dma and non-dma use case")
> Cc: stable@vger.kernel.org # v6.13+
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
> ---
> 
> Notes:
>     Reported by the Sashiko review of "i2c: imx: test the block read flag of
>     the message that is read":
>     https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c
>     
>     Tested on a Colibri VF50 on the Iris carrier, kernel at this base, with
>     the M41T0 RTC at 0x68. The core takes the atomic path only after
>     SYSTEM_RUNNING, so a test-only hook called xfer_atomic() with interrupts
>     disabled, with the two messages that i2c_smbus_xfer_emulated() builds
>     for a block read. Register 0x04 (0x13) as count byte: without the patch
>     0x13 and then 0xff (50 of 50, return 2); with it the next registers,
>     the same bytes as the interrupt driven read (50 of 50). With a count
>     byte of 1 (register 0x05): 01 ff before, 01 01 after (50 of 50 each).
> 
>  drivers/i2c/busses/i2c-imx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151..1a3fc245d6ba 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1283,7 +1283,7 @@ static int i2c_imx_prepare_read(struct imx_i2c_struct *i2c_imx,
>  	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
>  	 * length is unknown
>  	 */
> -	if (msgs->len - 1)
> +	if ((msgs->len - 1) || (msgs->flags & I2C_M_RECV_LEN))
>  		temp &= ~I2CR_TXAK;
>  	if (use_dma)
>  		temp |= I2CR_DMAEN;
> 
> base-commit: 25e7ab89f4774b0f842cee0e8a20c11f755924d5
> -- 
> 2.56.0

Thanks for the fix.

Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
