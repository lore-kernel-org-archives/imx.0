Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794568495;
	b=ROEhWg98PiZl2tZdd0J8UjPH4z1+5iOUKs+0L53f+a24Ck3b+1pZ2g7GwSarz9PNnFsI
	 rEW/zQUuevgNilqmm6ZUov+XBfw2zzwhpi1vQbs9T67yPQ3Or+5d5n+tIOEQiuhPBZUf3
	 s8qTfpxhOUFFvjZjjN+HEm6bh6nDQn830kZ4yCK9SsHkYk0/EhJZdLVMhQsMtvrBYdxPg
	 pkUovUqm0wI6Y7u/sbQ8wxi9JuwdRgKc/DQbtaaMKCO1tYq+mm5cLsz315RwvS1dcadIq
	 0za8Y3S3OeVsYl+6wR583yRPyL2BbKvNDJjAqOMHg984aUQI8UQXdmsOoqDWIII7DlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794568495;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=dm+Y4UoccczspGqcTXua/0X4RBhuIew6v+iwrNY6IPQ=;
	b=yXvmV3ZVGwPx7IGrk9Mw1OyYd9wV2I1p/VY6d+JqVM2M/I55I8UWGkLKJ25vjeQ/xjDk
	 5uAxCIiJ5oq0ARUhjvfZZBOomMT6cE4L4BlUNGOOWbBUrskTTKTQVeMxgOWueWlzhR7Hk
	 usWd5uUswGm6WpWWH5y9Fn5d/abAOJF8S1Li/QATEKbeFJVW/1Vz+Z0SQ516nocbrsmCV
	 3bh0Kyxzhq6jvyg7Ch08o7F0JUy+VZTlJkt54vA3V8fLHrluuzs+P2AbOOfEE6OQzRs0e
	 XESj5SCuBht/NFh/vE84aoUBobahuRkVYFH1cnwLIe3uePOFZjqFYoKZjLYEemnKcSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exDIIZN9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41797606A333
	for <imx@lists.linux.dev>; Fri, 13 Nov 2026 11:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=exDIIZN9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948DB1F000C6;
	Fri, 13 Nov 2026 11:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794568494;
	bh=dm+Y4UoccczspGqcTXua/0X4RBhuIew6v+iwrNY6IPQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=exDIIZN9RcL8yEW/lzH8LoD64453Xlrwl9sT5zgsZL9memsP57N6sLT3aZ/DNhEYs
	 upAPsjHJ6LJP6jGZBGJwt+Ynve30XSDHoTPVZ+2P+GvZjgeiDYFPqX6ef8drjWDhRm
	 jUM1Q49YlRjJ8icUAycxDOkOnN2MVL+diSVfq7IEnl3ndWRZ2gOPDSQtwuTkWVmIf3
	 5Qcxj0tVhFqOi3K4roYAxFuS+0RHSL6tKsjx8dzyTCCUwfg9hHZvjkuYfXwBAYo3pW
	 Q9I4eOb3zzjri6FOOrT34eBgXNUzcfC2t5eI9I63u3KjbNlc+tRcsz3ZYjijLMaMFv
	 cySN5lOURSzcg==
Message-ID: <sashiko-outbox-212692@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] i2c: imx: test the block read flag of the message that
 is read
Reply-To: sashiko-reviews@lists.linux.dev
To: "Mehmet Fide" <mehmet.fide@gmail.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20261113110501.1142036-1-mehmet.fide@gmail.com>
References: <20261113110501.1142036-1-mehmet.fide@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 11:14:54 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found no new issues
in this patch, but noticed 1 related pre-existing issue it does not
introduce:
- [High] i2c: imx: uncleared I2CR_TXAK for I2C_M_RECV_LEN in
  i2c_imx_prepare_read() [1]
--

commit ce48b1bb4f3f90616018dca56aca9a327411019e
Author: Mehmet Fide <mehmet.fide@screeningeagle.com>

i2c: imx: test the block read flag of the message that is read

This commit changes i2c_imx_xfer_common() to check I2C_M_RECV_LEN on the
current message (msgs[i]) rather than the first message of the transfer
when deciding whether to use DMA for a read.

> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index ccf08cd63151f..9abe0a26c877a 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1713,7 +1713,7 @@ static int i2c_imx_xfer_common(struct i2c_adapter *=
adapter,
>  			msgs[i].flags & I2C_M_DMA_SAFE &&
>  			!(msgs[i].flags & I2C_M_NOSTART);
>  		if (msgs[i].flags & I2C_M_RD) {
> -			int block_data =3D msgs->flags & I2C_M_RECV_LEN;
> +			int block_data =3D msgs[i].flags & I2C_M_RECV_LEN;
> =20
>  			if (atomic)
>  				result =3D i2c_imx_atomic_read(i2c_imx, &msgs[i], is_lastmsg);

[Severity: High]
This problem wasn't introduced by this patch, but in the
i2c_imx_atomic_read() -> i2c_imx_prepare_read() path just below, does
i2c_imx_prepare_read() fail to clear I2CR_TXAK for an SMBus block read
([1])?

drivers/i2c/busses/i2c-imx.c:i2c_imx_prepare_read() {
	...
	/*
	 * Reset the I2CR_TXAK flag initially for SMBus block read since the
	 * length is unknown
	 */
	if (msgs->len - 1)
		temp &=3D ~I2CR_TXAK;
	...
}

i2c_smbus_xfer_emulated() initializes I2C_M_RECV_LEN read messages with
len =3D 1, and i2c_imx_start() sets I2CR_TXAK at the start of the transfer.
Unlike i2c_imx_isr_read(), i2c_imx_prepare_read() does not check
msgs->flags & I2C_M_RECV_LEN, so I2CR_TXAK stays set when the dummy read
of IMX_I2C_I2DR starts reception.  The controller then sends a NACK after
the initial length byte, causing the target device to abort the transfer
while the remaining payload bytes read as 0xff.

[1] https://sashiko.dev/#/bug/linux-09e3015b-fc03-4410-809b-82964cdfac9c

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113110501.1142=
036-1-mehmet.fide@gmail.com?part=3D1
