Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12306347BAF
	for <imx@lists.linux.dev>; Mon, 13 Jul 2026 18:26:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783967199; cv=none; b=YXxLCjsvqt76Hz3G/a3lCDahle8/zGo0RgMGxTR/EjkMAxhF1kWuqJr+aX1As61Ct6/HsdS6HKS2t/31ZHuKZekSx9Q3Q5kiSe5TANIALLDnYrcSWrvMs9F34R0VG5+nNf/WrdwmGBnXzN0FW6qO40CeTvkwqeVEudyNEpqb4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783967199; c=relaxed/simple;
	bh=Iyt/8c70E14w9HCdSrHVcRsUlZasMHvcwR0tmOYfAUM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tM00tTz9rpqRYgKAfd4h0jfzEKUXBI1/+7mu+6O12YyMMjvaUHwYApUQpM6M+YEgq+AKoF2iOEAyCAbtxDhCdNNBMinCACBLmkLanwXswWplzan63a3IU6nVDujghuQMdpc3IQCI/2kfGRQBkB9jYmwHn/BZzbi2UwP8Ju/Gm5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CFzkxtzS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CFzkxtzS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A9141F000E9;
	Mon, 13 Jul 2026 18:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783967197;
	bh=X5H6KVyLK3TE+v/HODkxAgyLNeFFO0o0+iUzO9nkNHk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CFzkxtzSVWT4zok8mf9YvFubc7ASN2Sj1I8CuxEapzUDYMkSRhchIEvxqvpi7y/wq
	 IWJEIZXARbzvSxZ4PDcwxBiUjU4cDwnR1s2R/fFGTkfXv+oqtvUICfhHIRSUWPhNJf
	 eWYNPXoZ/5MOgGvoW9OHPu0eLYvwO7gIOOVzYehqvd2YVX2OsQioY3b6yd1J69lG33
	 MjYyjMi6xf/qzkXZOfp79Yzv4Pk8G1sjwcaoocK/7s3AE28HIuV1ZhpGQ8Mos3zYM0
	 btoJJYkc+tZyqIv4e4tCGyKdDPdJeVv9R+8DW6cHDwHYBjCF+SiNYN3zgvPbVJQ9C0
	 0WkQG+g/C1P6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 1/2] i2c: imx: fix locked bus on SMBus block-read of
 0 (atomic)
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-1-073ac9e103a5@free.fr>
References: <20260713-for-upstream-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr>
 <20260713-for-upstream-i2c-lx2160-fix-v1-v3-1-073ac9e103a5@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 13 Jul 2026 18:26:37 +0000
Message-Id: <20260713182637.8A9141F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `i2c_imx_prepare_read()` fails to clear `I2CR_TXAK` for SMBus bloc=
k reads, causing the block length byte to be incorrectly NACKed.
- [High] The interrupt-driven SMBus block read path (`i2c_imx_isr_read_bloc=
k_data_len`) fails to properly terminate the transaction when receiving an =
invalid length (0 or > I2C_SMBUS_BLOCK_MAX), leaving the I2C bus stuck.
--

--- Patch [1]: [PATCH v3 1/2] i2c: imx: fix locked bus on SMBus block-read =
of 0 (atomic) ---
commit a24ce0b5e738f113eb95ff9fc04f3d425bba30ce
Author: Vincent Jardin <vjardin@free.fr>

i2c: imx: fix locked bus on SMBus block-read of 0 (atomic)

SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the atomic
path rejects it as -EPROTO and returns without sending a nack and stop.
This patch properly handles the in-flight dummy byte by extending the
message length to emit a stop, releasing the bus.

> SMBus 3.1 6.5.7 allows a Block Read byte count of 0, but the atomic
> (polling) path rejects it as -EPROTO. Worse, it returns without a
> NACK+STOP: the next receive cycle has already started, so the target
> keeps holding SDA and the bus stays stuck until a power cycle for
> this i2c controller.
>=20
> Reading I2DR to obtain the count likewise arms the next byte on the
> count > I2C_SMBUS_BLOCK_MAX path, which also returned -EPROTO directly
> and left the bus held.
>=20
> Handle both: NACK the in-flight dummy byte (TXAK) and extend msgs->len so
> the existing last-byte handling emits STOP; the dummy byte is discarded.
> A count of 0 is a valid empty block read; a count above
> I2C_SMBUS_BLOCK_MAX is still reported as -EPROTO, but only after the bus
> has been released.
>=20
> The interrupt-driven path has the same flaw from a later commit and is
> fixed separately, as it carries a different Fixes: tag and stable range.

[Severity: High]
This isn't a bug introduced by this patch, but does the interrupt-driven
SMBus block read path in i2c_imx_isr_read_block_data_len() fail to properly
terminate the transaction when receiving an invalid length?

When a length of 0 or greater than I2C_SMBUS_BLOCK_MAX is returned:

	if (len =3D=3D 0 || len > I2C_SMBUS_BLOCK_MAX) {
		i2c_imx->isr_result =3D -EPROTO;
		i2c_imx->state =3D IMX_I2C_STATE_FAILED;
		wake_up(&i2c_imx->queue);
	}

This aborts the transfer and wakes up the thread to clear MSTA without
gracefully nacking the in-flight dummy byte. Clearing MSTA while a
byte reception is in flight causes the controller to drop its master
state while the bus remains physically locked with SCL and SDA held low.

I see the commit message acknowledges this flaw exists in the interrupt
path but defers fixing it to a separate patch. Since that patch is not
included in this series, the hang remains active in the codebase.

>=20
> Fixes: 8e8782c71595 ("i2c: imx: add SMBus block read support")
> Cc: stable@vger.kernel.org # v3.16+
> Acked-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Acked-by: Carlos Song <carlos.song@nxp.com>
> Reviewed-by: Stefan Eichenberger <eichest@gmail.com>
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
>
> ---
> drivers/i2c/busses/i2c-imx.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 28313d0fad37e..cfd1e63359e75 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -1415,6 +1415,7 @@ static int i2c_imx_atomic_read(struct imx_i2c_struc=
t *i2c_imx,
>  	int i, result;
>  	unsigned int temp;
>  	int block_data =3D msgs->flags & I2C_M_RECV_LEN;
> +	int block_err =3D 0;
> =20
>  	result =3D i2c_imx_prepare_read(i2c_imx, msgs, false);

[Severity: High]
This is a pre-existing issue, but does i2c_imx_prepare_read() fail to clear
I2CR_TXAK for SMBus block reads?

In i2c_imx_prepare_read(), there is no check for I2C_M_RECV_LEN:

	if (msgs->len - 1)
		temp &=3D ~I2CR_TXAK;

For an I2C_M_RECV_LEN transaction without PEC, the core initializes
msgs->len to 1. This evaluates to 0, which leaves TXAK set and causes the
controller to nack the very first byte (the length byte).=20

A compliant SMBus slave will immediately abort the transaction upon receivi=
ng
a nack, causing all subsequent data bytes to read as 0xFF. Should this check
include the I2C_M_RECV_LEN flag to properly clear TXAK?

>  	if (result)
[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260713-for-upstre=
am-i2c-lx2160-fix-v1-v3-0-073ac9e103a5@free.fr?part=3D1
