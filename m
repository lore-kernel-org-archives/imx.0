Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4686E3EB7FD
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 09:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783503870; cv=none; b=Uoj4YZCAXWNzXie3aQGezBJJVKI21mRutbKBSHdSp0hjruEuopz4MZ7qNxHilUd0qSpoVr3TtNwn2jiuvyGWvxY1eOTb0xeqIdxtJuFEG25pxGXNDYPPfG7iNx4y7cNieob8vH1YJ6xi3YgiXm8B25gIospztTq4mXsW/Fiz1h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783503870; c=relaxed/simple;
	bh=/0XsQeYhHEwGoLyfl5349sTSkH5KRx00N7t6mhM3QtA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T0PTvoAzWSraV0kAOIMlr1OVioSu5b95t7s9yjC5eIRpO1S6cnNa0rBEVn+yTjvl1G+8RyUvfc5Lx6BB92Nmor0Clg+D4wo0e0IIrrkGraCN7NFVI0tO+6ZunvazmsXErvQwG2kErEnJeR1viV1Ew3sFWjG7VaLqY+rmZJP3aWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Be8lmEgX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Be8lmEgX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A712F1F000E9;
	Wed,  8 Jul 2026 09:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783503869;
	bh=Hn9Jq+hSskuJ2oSf8Klo6NhPMZ59jrTywnqApoSu/dE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Be8lmEgXSv7P3+NAZsGRKcnOia0e5/VfX0cJ6reWegaZZFfgPyqrv/Mj436lv2CG/
	 mBhMrcOGs97rX/e9AYht4JFvozkF5yLPLEUpj2xSxDmP+PtI286UNOU8pTTCWPPf7c
	 gdR6Jp0/W2swfC1TJeUGknAunVHOIqDVzv5CW1DKOLwrxOGP/awuv5h20VrLefQb5/
	 ufmJXG/vappcpNCllD0nBNwYY6bBMRlNkb2ef25A23DrJacrNzvUPgarKbhStFCqVD
	 86tEOGe8hARr0hT2fZ83WoB0Q3jZKRqJ+mMLk6RHZXlw1o4oPczkci/gL7m//ElSA7
	 4MmiOTb0HOPTQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload
 length on success
Reply-To: sashiko-reviews@lists.linux.dev
To: tze.yee.ng@altera.com
Cc: "Alexandre Belloni" <alexandre.belloni@bootlin.com>, linux-i3c@lists.infradead.org, Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
References: <cover.1783493867.git.tze.yee.ng@altera.com>
 <6c66571ae7166aa4b87616d900e6d643631ac355.1783493868.git.tze.yee.ng@altera.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 09:44:28 +0000
Message-Id: <20260708094428.A712F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [High] This problem wasn't introduced by this patch, but the Renesas I3C =
driver suffers from a KASAN out-of-bounds write and data corruption due to =
unbounded FIFO reads and missing buffer pointer accumulation.
- [High] This problem wasn't introduced by this patch, but the Silvaco I3C =
master driver mixes 32-bit register accessors (`readl`) and 8-bit stream ac=
cessors (`readsb`) on the same `SVC_I3C_MRDATAB` FIFO, causing endianness p=
ortability bugs.
- [High] This problem wasn't introduced by this patch, but the missing hard=
ware abort on transfer timeout in the Renesas I3C driver leads to NULL poin=
ter dereferences or cross-transfer state corruption.
--

--- Patch [2]: [PATCH v6 2/5] i3c: master: Report actual GET CCC payload le=
ngth on success ---
commit fb225c2de835cd1f0fc73a0e9829ada753363f62
Author: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>

i3c: master: Report actual GET CCC payload length on success

Set dests[].payload.actual_len on successful GET CCC transfers in I3C
master drivers so the core can distinguish requested and received
buffer lengths. Switch core GET helpers to use actual_len instead of
len when interpreting GET CCC results.

> diff --git a/drivers/i3c/master/renesas-i3c.c b/drivers/i3c/master/renesa=
s-i3c.c
> index f39c449922ca2..25a2b2ed618ed 100644
> --- a/drivers/i3c/master/renesas-i3c.c
> +++ b/drivers/i3c/master/renesas-i3c.c

[ ... ]

> @@ -1072,10 +1074,16 @@ static irqreturn_t renesas_i3c_resp_isr(int irq, =
void *data)

[Severity: High]
This isn't a bug introduced by this patch, but what happens if a transfer
times out and we later receive a delayed hardware completion in this ISR?

If a timeout occurs, renesas_i3c_dequeue_xfer_locked() removes the transfer
from the software queue:

    if (i3c->xferqueue.cur =3D=3D xfer)
        i3c->xferqueue.cur =3D NULL;

If this happens without issuing an abort command to the hardware, when the
hardware eventually completes the timed-out transfer, wouldn't
renesas_i3c_resp_isr() blindly dereference the now-NULL i3c->xferqueue.cur
pointer when pulling the command state?

    xfer =3D i3c->xferqueue.cur;
    cmd =3D xfer->cmds;
    ...
    cmd->rx_count =3D data_len;

Could this lead to a kernel panic or cross-transfer state corruption?

>  			break;
>  		case I3C_INTERNAL_STATE_CONTROLLER_READ:
>  		case I3C_INTERNAL_STATE_CONTROLLER_COMMAND_READ:
> -			if (NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) && !cmd->err)
> -				bytes_remaining =3D data_len - cmd->rx_count;
> -
> -			i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, bytes_remaining);
> +			if (!cmd->err) {
> +				u32 rx_count =3D min(cmd->rx_count, data_len);

[Severity: High]
This isn't a bug introduced by this patch, but while clamping rx_count
here to prevent unsigned underflows, is it possible we still have a memory
corruption issue originating in renesas_i3c_rx_isr()?

Currently, renesas_i3c_rx_isr() calculates read_bytes rounded up to a
4-byte multiple and reads into cmd->rx_buf:

    read_bytes =3D NDBSTLV0_RDBLV(renesas_readl(i3c->regs, NDBSTLV0)) * siz=
eof(u32);
    i3c_readl_fifo(i3c->regs + NTDTBP0, cmd->rx_buf, read_bytes);
    cmd->rx_count =3D read_bytes;

Could this write past the end of the allocated payload buffer for small
unaligned GET CCCs?

Additionally, for large transfers triggering multiple interrupts, it looks
like rx_count is overwritten instead of accumulated, and the rx_buf pointer
is not advanced. Could this cause subsequent chunks to overwrite the
beginning of the buffer?

> +
> +				bytes_remaining =3D data_len - rx_count;
> +				if (bytes_remaining)
> +					i3c_readl_fifo(i3c->regs + NTDTBP0,
> +						       cmd->rx_buf + rx_count,
> +						       bytes_remaining);
> +				cmd->rx_count =3D data_len;
> +			}
>  			renesas_clear_bit(i3c->regs, NTIE, NTIE_RDBFIE0);
>  			break;
>  		default:

[ ... ]

> diff --git a/drivers/i3c/master/svc-i3c-master.c b/drivers/i3c/master/svc=
-i3c-master.c
> index 486c22840ea9a..e700392f0801f 100644
> --- a/drivers/i3c/master/svc-i3c-master.c
> +++ b/drivers/i3c/master/svc-i3c-master.c

[ ... ]

> @@ -1725,8 +1725,8 @@ static int svc_i3c_master_send_direct_ccc_cmd(struc=
t svc_i3c_master *master,
>  		svc_i3c_master_dequeue_xfer(master, xfer);
>  	mutex_unlock(&master->lock);
> =20
> -	if (cmd->actual_len !=3D xfer_len)
> -		ccc->dests[0].payload.len =3D cmd->actual_len;
> +	if (ccc->rnw)
> +		ccc->dests[0].payload.actual_len =3D cmd->actual_len;

[Severity: High]
This isn't a bug introduced by this patch, but looking at the Silvaco driver
as a whole, is there an endianness portability issue with the FIFO reads?

In svc_i3c_master_read(), the 32-bit register accessor readl() is used
to read from the stream FIFO, which performs a CPU-to-LE byte-swap:

    for (i =3D 0; i < count; i++)
        in[offset + i] =3D readl(master->regs + SVC_I3C_MRDATAB);

However, svc_i3c_master_handle_ibi() accesses the exact same FIFO using
the 8-bit stream accessor readsb(), which does no byte-swapping:

    readsb(master->regs + SVC_I3C_MRDATAB, buf, count);

Could mixing these accessor families cause data corruption on big-endian
architectures due to inconsistent byte-swapping behavior?

> =20
>  	ret =3D xfer->ret;
>  	svc_i3c_master_free_xfer(xfer);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1783493867.gi=
t.tze.yee.ng@altera.com?part=3D2
