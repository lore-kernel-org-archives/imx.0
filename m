Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31E73B841C
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756304; cv=none; b=HVzDfb6lY/cwgyxNfb7Mw0xyVrlzbdGshQmCFGNp61CGry03VAy4+0olVCfHbCZYvOZ7PkR4pCooLHr8/sdTOvVNByizMCcD5xDAKeugbkXIV8yZOeT0ILy/muHSjyZGsXo1BocrmR6yMXeGb6MXoCVhTNTK3L3YGt20zFOFzUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756304; c=relaxed/simple;
	bh=0g+5SuVx4QLgYk/EVjQdUmmRnPVzGRD3nxARfUiWhc0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=mwhGZI/ndoOkBHHT89tnh03bA7n5V4GokSohQmm12GbJLOB5JKCFbnZHJP6aZNphUdVNcko4SJ82SB97TCLqp8x1Q0B0U6XjKKyNVqcaAmJWSzlIv2EeCUERiRGopW6MnVXqHOeLLNEwkFg5tprTmeGIO7MCdlwX0VJ1hGiMNzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PV4Jawz5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PV4Jawz5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84AC6C2BCB8;
	Thu, 14 May 2026 10:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756303;
	bh=0g+5SuVx4QLgYk/EVjQdUmmRnPVzGRD3nxARfUiWhc0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PV4Jawz5ZtgoBkVBXd0imRMVQ1QlayJyYHgLc36ZR4s+GIVTfI2jKMGu+iNo8a0Is
	 x8S88xhIbDsR5GAH290V4nrUoK01g5d4E59wvfv00Xubt/VYM55EJgl/YS4wpO1/dq
	 B91kDDuD4AD8FeiKnXrEFSgC/KsX/2HgUabv28IhNa26/sIiSzRbBERsJDdrekepHo
	 zlplEZpBbE/Tnito8ctQmVerxty2tMoTdR6mZVBdX3NX01MEQz6cK66ZBApheVTwS5
	 F/yEhKEelVlTUUCGovsdsClUOYQAhYKY1KyV5ZhEPA557TIUKZKKD7+SHPEyBU0zbA
	 Y8c4WbNo4dqTg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 5/6] net: enetc: fix initialization order to prevent
 use of uninitialized resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260513103021.2190593-6-wei.fang@nxp.com>
References: <20260513103021.2190593-6-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:23 +0000
Message-Id: <20260514105823.84AC6C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [Critical] This problem wasn't introduced by this patch, but lack of boun=
ds checking on `pf->num_vfs` leads to an out-of-bounds array access in `ene=
tc_msg_alloc_mbx()`.
- [High] This problem wasn't introduced by this patch, but in `enetc_msg_fr=
ee_mbx()`, `dma_free_coherent()` is called to free the mailbox DMA buffer b=
efore writing 0 to the device's DMA address registers (`ENETC_PSIVMSGRCVAR0=
/1`).
- [High] This problem wasn't introduced by this patch, but stale hardware s=
tate in the Message Receive Register (`ENETC_PSIMSGRR`) can cause an infini=
te loop in the `enetc_msg_task()` workqueue handler.
- [High] This problem wasn't introduced by this patch, but lockless read-mo=
dify-write operations on the `ENETC_PSIIER` register can clobber interrupt =
states.
--

commit fa9d7e3799c5420c70515e10bd1626738a874ff5
Author: Wei Fang <wei.fang@nxp.com>
net: enetc: fix initialization order to prevent use of uninitialized resour=
ces

This commit reorders the initialization sequence in enetc_msg_psi_init() to
ensure all resources, including the msg_task work struct and mailbox DMA
buffers, are fully initialized before the interrupt handler is registered.
This prevents spurious interrupts from causing kernel panics or memory
corruption by scheduling an uninitialized work struct.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index fe9680a97b0e7..c156a566a751e 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -109,6 +109,15 @@ int enetc_msg_psi_init(struct enetc_pf *pf)
>  	struct enetc_si *si =3D pf->si;
>  	int vector, i, err;
> =20
> +	/* initialize PSI mailbox */
> +	INIT_WORK(&pf->msg_task, enetc_msg_task);

This problem wasn't introduced by this patch, but can stale hardware state =
in
the Message Receive Register (ENETC_PSIMSGRR) cause an infinite loop in the
enetc_msg_task() workqueue handler?

If the device was previously configured with more VFs, and a bit for a high=
er
VF remains set in ENETC_PSIMSGRR, re-initializing the driver with fewer VFs
might trigger a deadlock.

The inner loop in enetc_msg_task() only iterates up to the current pf->num_=
vfs
and therefore ignores the stale bit. Because the bit is never cleared
(it is a w1c register), the outer for (;;) loop continuously reads a non-ze=
ro
mr_mask and spins indefinitely, locking up the kernel worker thread.

> +
> +	for (i =3D 0; i < pf->num_vfs; i++) {
> +		err =3D enetc_msg_alloc_mbx(si, i);

This problem wasn't introduced by this patch, but does the lack of bounds
checking on pf->num_vfs lead to an out-of-bounds array access in
enetc_msg_alloc_mbx()?

The array pf->rxmsg has a fixed size of ENETC_MAX_NUM_VFS (2). However,
pf->num_vfs is populated from the user-requested SR-IOV VFs, bounded only by
the hardware's total_VFs capability.

If a device reports total_VFs > 2, a user could request more than 2 VFs,
causing enetc_msg_alloc_mbx() to iterate past the end of the rxmsg array.

This out-of-bounds write would corrupt subsequent fields in struct enetc_pf
(including the msg_task workqueue struct initialized by this patch), leading
to kernel crashes and potential privilege escalation when the corrupted work
struct is scheduled.

> +		if (err)
> +			goto free_mbx;
> +	}
> +

[ ... ]

> @@ -117,32 +126,21 @@ int enetc_msg_psi_init(struct enetc_pf *pf)

[ ... ]

>  	/* enable MR interrupts */
>  	enetc_msg_enable_mr_int(&si->hw);

This problem wasn't introduced by this patch, but can lockless
read-modify-write operations on the ENETC_PSIIER register clobber interrupt
states?

Looking at enetc_msg_enable_mr_int():

drivers/net/ethernet/freescale/enetc/enetc_msg.c:enetc_msg_enable_mr_int() {
	u32 psiier =3D enetc_rd(hw, ENETC_PSIIER);

	enetc_wr(hw, ENETC_PSIIER, psiier | ENETC_PSIIER_MR_MASK);
}

enetc_msg_enable_mr_int() and enetc_msg_disable_mr_int() perform unprotected
read-modify-write operations on the ENETC_PSIIER register.

Because enetc_msg_enable_mr_int() can run in process context (via the
workqueue or during initialization) and enetc_msg_disable_mr_int() runs in
hard interrupt context (enetc_msg_psi_msix()), a race exists.

If an interrupt fires while the workqueue is executing the RMW operation, t=
he
workqueue could write back a stale value of ENETC_PSIIER, obliterating the
state changes made by the interrupt handler. Should this be protected by a
spinlock?

> =20
>  	return 0;
> =20
> -err_init_mbx:
> +free_mbx:
>  	for (i--; i >=3D 0; i--)
>  		enetc_msg_free_mbx(si, i);

This problem wasn't introduced by this patch, but in enetc_msg_free_mbx(), =
is
the mailbox DMA buffer freed before clearing the device's DMA address
registers?

Looking at enetc_msg_free_mbx():

drivers/net/ethernet/freescale/enetc/enetc_msg.c:enetc_msg_free_mbx() {
	...
	dma_free_coherent(&si->pdev->dev, msg->size, msg->vaddr, msg->dma);
	memset(msg, 0, sizeof(*msg));

	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
}

Freeing the DMA memory before clearing the hardware registers allows the
hardware to perform a DMA write into freed kernel memory if a message arriv=
es
or a pending DMA completes in that race window, leading to memory corruptio=
n.

Should the hardware DMA configuration be cleared before the backing memory =
is
freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D5
