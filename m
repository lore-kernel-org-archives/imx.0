Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9537A344D8C
	for <imx@lists.linux.dev>; Thu, 14 May 2026 17:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778779568; cv=none; b=UkVjeyhOotqDBBx7B3ISN8783FExmMi79c04swb+dne8T91M69Rd8FKOEJbOaZhlF8CsZfVr+gofv5m/pDklLpAQE/tkOeZ0cnTr2nu10LVPQFrBrPTnL12ArDl7clcrYUx7ytL3IwHowCdyoVT8NBThprF0SG/1yi0BN3/FT6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778779568; c=relaxed/simple;
	bh=CayUSAvG7GveLy16UXqz5TS3K2BqOCkxt4Go+/dZus4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m/Jl/Gp8aDe4Y1IQEvoXxqMXFX+3eOFF/RtB3lBxbB5ybtmCSsfSiUjPZBO+G9SLHU/BGqrNTU3GHmjKO1iACe85MmtE7e+f4SRNmuKK45jOWe1N8x9Wjq/agmKr1PbzASj+aaZGRl5fGrN4bOiB12B8pLrn6kBy6Sw3V4J5eTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qTxtfel8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qTxtfel8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB36EC2BCB3;
	Thu, 14 May 2026 17:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778779568;
	bh=CayUSAvG7GveLy16UXqz5TS3K2BqOCkxt4Go+/dZus4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=qTxtfel8FFHPFzWEw3023ok8pWVXc8GMf+ZJgfVQuR7TGnr2jZ0FWfX0o0bLrNa75
	 3CKzbbuIGJqudCr/UV2uKEKEvEr0rSIJ5WmO5zWf7VVBuGITRKP0j9jQ4W25KZqpZX
	 72nf5zdeIWqAukKZ6sR21ZqxE8aX7zjto54sAMKbBwMocofwPgb8ZIjTB80k4zNp5v
	 QlDS70KJC5FWr0/E6qN+QES0qkpGM61vXhtB/AgV4H4rdI5BoaUQi/soYx30yLA/Q3
	 QzN3R4wV7txHaEq2q1KGUL5XMYQKiHM4N35k/83y8gE/qHB/N7he2EnEqRznCaO2+C
	 +IM4Ze63JHEfQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH -next] firmware: imx: secure-enclave: drop invalid
 overflow check in iobuf setup
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pankaj Gupta" <pankaj.gupta@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260514090321.2186877-1-pankaj.gupta@nxp.com>
References: <20260514090321.2186877-1-pankaj.gupta@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 17:26:07 +0000
Message-Id: <20260514172607.DB36EC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] Removing the `io.length > SIZE_MAX - 7` check introduces an in=
teger overflow in `round_up()` on 32-bit architectures, leading to a massiv=
e out-of-bounds write.
--

commit f1f29a6c58c5d6e658a6207ce15040a2bef1f1c1
Author: Pankaj Gupta <pankaj.gupta@nxp.com>

firmware: imx: secure-enclave: drop invalid overflow check in iobuf setup

This commit removes a check comparing io.length against SIZE_MAX - 7, as it
always evaluates to false on 64-bit systems. It instead relies on size_t-ba=
sed
alignment and existing shared memory bounds validation.

Closes: https://lore.kernel.org/oe-kbuild-all/202605081441.lIHK75ug-lkp@int=
el.com/

> diff --git a/drivers/firmware/imx/se_ctrl.c b/drivers/firmware/imx/se_ctr=
l.c
> index f88e581fc147e..1683b259864f1 100644
> --- a/drivers/firmware/imx/se_ctrl.c
> +++ b/drivers/firmware/imx/se_ctrl.c
> @@ -670,11 +670,6 @@ static int se_ioctl_setup_iobuf_handler(struct se_if=
_device_ctx *dev_ctx,
>  		goto copy;
>  	}
> =20
> -	if (io.length > SIZE_MAX - 7) {
> -		dev_err(dev_ctx->priv->dev, "%s: Invalid buffer length.",
> -			dev_ctx->devname);
> -		return -EINVAL;
> -	}
>  	aligned_len =3D round_up((size_t)io.length, 8);

On 32-bit platforms where size_t is 32 bits, can this round_up() overflow if
io.length is near U32_MAX?

If io.length is between 0xFFFFFFF9 and 0xFFFFFFFF, round_up() will wrap
around to 0.

If aligned_len wraps to 0, does it bypass the subsequent shared memory boun=
ds
validation?

	if (shared_mem->size < shared_mem->pos ||
	    aligned_len > (shared_mem->size - shared_mem->pos)) {

This appears to cause a regression where the following memset() can perform=
 an
out-of-bounds write using the original un-rounded io.length value:

	memset(shared_mem->ptr + pos, 0, io.length);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514090321.2186=
877-1-pankaj.gupta@nxp.com?part=3D1
