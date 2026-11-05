Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793875189;
	b=Vh7g/NiaXqpYJqaU4C6WbOpc++a7hQDuc2ZtGmdbll62gowVQ481+59FwhgpQY7kdlHJ
	 FDuY4jc1vxn0yZ2S1aPozKbGzIwnyH0+HfdGRQa3tlfdcj9QtH+GFhDPeu0CUAikpGf/K
	 +9zAjefLE9c1Cx6BavXAwdY+P6WXUZ1fFViXHQy6KbQQLBjRvzJqix4CbRAyvumj5HATw
	 KyiRCsQeMR97oUNvsXSb7GTXVYzYsNNaT9AnEqRK7mygcBMYhOF9NCwgYIXr8tNLTBO4K
	 xWhMA66keGG3t/PiFk+AAqvi7HVwnCoQ58puOo2LmkT6ogksLNBazRQ3hqTVqyi+cTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793875189;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=S0lQGcZ2eVZ2H87dToHJurXFAdWacHjZn3b7RiEzmRk=;
	b=zqUgND1Srj70/YL3/3LoX2PCEjP3lTGdVN1v9rArj27ytSQ+lMuXhlKi6Cxxqt9SJlyN
	 y/mY3/zXtdBm11x94shQmFwmtPrmQVnJw6ecRT39cRKa9EvSsEjVu175Q8OPeFsPqWZvi
	 PD005yjleen+zJNVKrcBDbhsjR0AthGZfHyexC2zyc2MoQmB4IZrH/X/WVibbv8r0DIzk
	 9jwMEI0DVMaRRYGy9ZYsK5GbudRKMYPj59qROw8ir75S4ABZBtYJ6HNcqNQLgELEVRbBa
	 ayTWHmohYZGiwM/7a3dgUWH1+tE8jeqmM5tjymgdY6BnQ493DN5A9M99tH6UIeGduIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HllXUFhc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D6F7606A32C
	for <imx@lists.linux.dev>; Thu,  5 Nov 2026 10:39:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HllXUFhc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8AD1F000C1;
	Thu,  5 Nov 2026 10:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793875188;
	bh=S0lQGcZ2eVZ2H87dToHJurXFAdWacHjZn3b7RiEzmRk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HllXUFhc1RXCzPaYZihQbgOim3h/tURX9M4/FRp89tYWr/vnWdPjgx7ez7BW0eHWE
	 o/1YCjTzdRgVn0nad05ATG337UbJzuCgfrjjUa1/ZOO7LemyVO/+NKp6FJ7QZsYObr
	 HFROEtp7qF95zccz/ctmZ6maoy50xA6UCzECzlceM+HQzkTwAzb6416BLTtBpBKo/g
	 zMMoekbHTiHRcsGmbhlhjwL4KSrlZ0zfrXJ52b8WaaENdYz7ObuZOSJf+2X7RP0FHu
	 3JdJLroMdk6ux2eucfV5wEKoCgR9SzNP4FdBeMYHaV5pesck1b2M1bReZE41MTybFL
	 U8/H60KDrCAwQ==
Message-ID: <sashiko-outbox-198870@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] mtd: rawnand: gpmi: Fix possible NULL pointer
 dereference in gpmi_nfc_exec_op()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Stefan Ghetu" <stefan.ghetu@nxp.com>, han.xu@nxp.com, miquel.raynal@bootlin.com
Cc: richard@nod.at, vigneshr@ti.com, s.hauer@pengutronix.de, imx@lists.linux.dev, daniel.baluta@nxp.com, linux-mtd@lists.infradead.org, Frank.Li@kernel.org
In-Reply-To: <20261105103410.4424-1-stefan.ghetu@nxp.com>
References: <20261105103410.4424-1-stefan.ghetu@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 10:39:47 +0000
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] mtd: rawnand: gpmi: lost error and OOB access in gpmi_nfc_exec=
_op()
--

commit 17db1082d69f752c7e093324fef48f49184391f5
Author: Han Xu <han.xu@nxp.com>

mtd: rawnand: gpmi: Fix possible NULL pointer dereference in gpmi_nfc_exec_=
op()

This commit moves the NULL check on the DMA descriptor pointer in
gpmi_nfc_exec_op() from inside the instruction loop to after the loop
completes.

> diff --git a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c b/drivers/mtd/nan=
d/raw/gpmi-nand/gpmi-nand.c
> index 527165ccc839d..333ba468ecaf6 100644
> --- a/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> +++ b/drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c
> @@ -2616,11 +2616,11 @@ static int gpmi_nfc_exec_op(struct nand_chip *chi=
p,
>  						   &direct);
>  			break;
>  		}
> +	}
> =20
> -		if (!desc) {
> -			ret =3D -ENXIO;
> -			goto unmap;
> -		}
> +	if (!desc) {
> +		ret =3D -ENXIO;
> +		goto unmap;
>  	}

[Severity: Critical]
Does moving the !desc check outside the instruction loop mask failures on
intermediate instructions and allow out-of-bounds accesses on
this->transfers[]?

In gpmi_nfc_exec_op(), each iteration of the for (i =3D 0; i < op->ninstrs;=
 i++)
loop overwrites desc with the descriptor returned by gpmi_chain_wait_ready(=
),
gpmi_chain_command(), gpmi_chain_data_write(), or gpmi_chain_data_read().

If an intermediate instruction fails to prepare a DMA descriptor and sets d=
esc
to NULL, the loop no longer aborts. When mxs_dma_prep_slave_sg() in
drivers/dma/mxs-dma.c fails on an intermediate instruction, it sets
mxs_chan->status =3D DMA_ERROR and returns NULL:

drivers/dma/mxs-dma.c:mxs_dma_prep_slave_sg() {
	...
	if (mxs_chan->status =3D=3D DMA_IN_PROGRESS)
		idx =3D mxs_chan->desc_count;

	if (sg_len + idx > NUM_CCW) {
		dev_err(mxs_dma->dma_device.dev,
				"maximum number of sg exceeded: %d > %d\n",
				sg_len, NUM_CCW);
		goto err_out;
	}

	mxs_chan->status =3D DMA_IN_PROGRESS;
	...
err_out:
	mxs_chan->status =3D DMA_ERROR;
	return NULL;
}

On the next instruction in the loop, mxs_dma_prep_slave_sg() sees
mxs_chan->status !=3D DMA_IN_PROGRESS, resets idx to 0, overwrites
mxs_chan->ccw[0], and returns a non-NULL descriptor. The post-loop !desc ch=
eck
then passes and submits a truncated DMA chain to hardware.

In addition, get_next_transfer() checks for array exhaustion using exact
equality after incrementing this->ntransfers:

drivers/mtd/nand/raw/gpmi-nand/gpmi-nand.c:get_next_transfer() {
	struct gpmi_transfer *transfer =3D &this->transfers[this->ntransfers];

	this->ntransfers++;

	if (this->ntransfers =3D=3D GPMI_MAX_TRANSFERS)
		return NULL;

	return transfer;
}

Previously, returning NULL immediately aborted the loop via goto unmap. If =
the
loop continues after this->ntransfers reaches GPMI_MAX_TRANSFERS, a subsequ=
ent
call to get_next_transfer() indexes past the end of this->transfers[],
increments this->ntransfers past GPMI_MAX_TRANSFERS, and returns the
out-of-bounds pointer, which also causes the unmap cleanup loop to iterate
out of bounds:

	for (i =3D 0; i < this->ntransfers; i++) {
		struct gpmi_transfer *transfer =3D &this->transfers[i];

		if (transfer->direction !=3D DMA_NONE)
			dma_unmap_sg(this->dev, &transfer->sgl, 1,
				     transfer->direction);
	}

Also, the continue in the NAND_OP_CMD_INSTR case is guarded by:

	if (i + 1 !=3D op->ninstrs &&
	    op->instrs[i + 1].type =3D=3D NAND_OP_ADDR_INSTR)
		continue;

so the next iteration is guaranteed to execute the NAND_OP_ADDR_INSTR case =
and
check desc. Should the !desc check inside the loop be kept (or present in b=
oth
places to also handle a zero-length NAND_OP_DATA_IN_INSTR)?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105103410.4424=
-1-stefan.ghetu@nxp.com?part=3D1
