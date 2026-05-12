Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285AD37B02B
	for <imx@lists.linux.dev>; Tue, 12 May 2026 23:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778628872; cv=none; b=N80iYSSknTuWj2q/QG46HRjCDC6KjPT2S1Q5GtSHXx5wcyBS4L2FPaYb7YGNgo2Bv9hbmraKGMkwla3v+ixQoUG3iqWXq6rYTKiQN2GVuhcEYGiLjDnkeaXCtt0mK0+ErVBGy1rH7/bOSbFI1mxx7PZmFC7cB/qTPbEPLo6/udY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778628872; c=relaxed/simple;
	bh=ItuRr9HYj1MYHHJcZhuydsfbJbGNvcuUM+WM2IuEi6I=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=tz5MqhBuvSRGPaxV61sSUdZQYi1yONyNNv80rn3gC2JaooX25ec8lvEsV1g7moAWjhniweaUpsMouxndaxWEj5ptgId77NbVo9f1YRfss2WRCUOqz/4ahUZa6xDcTZX0vD3rWbpIUf/Ucv8Rv+8y383cDK9DtUhqtY6K9if37Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gMEC4w8I; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gMEC4w8I"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5B42C2BCB0;
	Tue, 12 May 2026 23:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778628871;
	bh=ItuRr9HYj1MYHHJcZhuydsfbJbGNvcuUM+WM2IuEi6I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=gMEC4w8IhBNTYrILglGtpkhSNbl/qLm2Rh/aBB0T9GMrlhpKfJtWqWPBL80/TsmmX
	 yHv7ZX9NpbfwChSYIaNH31xEvAKG7WI/dykmiCCmzXufdOTepVrICU8TczqGsWL9ge
	 bR752Br445Ktagv8igz4YL/pvsKHE6WH9CczVFRQn0840R5TKVbvgSeG/PCImA5HzG
	 QiDpgc3OlNepF9taLns+7E0aLyWsUwB4nsPl9kmTSx9fViTD79mHQq4tL69sb3MChV
	 2ZzDPGz/s9nu2H/sMXHSqd++sZC+H9FaosIiEVDlqhZgVCzzOykQwRFvK99LnzyvNu
	 6lfT4lChKx2kQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 14/15] net: enetc: refactor MR interrupt
 enable/disable helpers
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511080805.2052495-15-wei.fang@nxp.com>
References: <20260511080805.2052495-15-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:34:31 +0000
Message-Id: <20260512233431.A5B42C2BCB0@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Teardown race in enetc_msg_psi_free() leading to Use-After-Free.
- [High] Uninitialized work_struct access in enetc_msg_psi_init() leading t=
o kernel panic.
- [High] Resource leak and Use-After-Free on error path in enetc_msg_psi_in=
it().
- [High] DMA Memory Use-After-Free in enetc_msg_free_mbx().
- [High] Race condition in enetc_msg_task() resulting in missed VF messages.
--

commit 776ed9b5141bfafabe9032ba504482f8555f1985
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: refactor MR interrupt enable/disable helpers

The patch consolidates enetc_msg_enable_mr_int() and
enetc_msg_disable_mr_int() into a single enetc_msg_set_mr_int() helper
that takes a boolean enable parameter. This prepares the code for
dynamic interrupt mask generation based on the number of enabled VFs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index f3e78865617e6..73e32c9b65a89 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c

[ ... ]

> @@ -171,7 +171,7 @@ static void enetc_msg_task(struct work_struct *work)
>  		if (!mr_mask) {
>  			/* re-arm MR interrupts, w1c the IDR reg */
>  			enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIER_MR_MASK);
> -			enetc_msg_enable_mr_int(hw);
> +			enetc_msg_set_mr_int(pf, true);
>  			return;
>  		}

This isn't a bug in your patch, but is there a race condition here that
could result in missed VF messages?

The code reads ENETC_PSIMSGRR earlier in the loop. If a VF sends a message
after the read but before the write to ENETC_PSIIDR, the hardware will set
the interrupt status bit, which is then immediately cleared by the write
to ENETC_PSIIDR. When the interrupt is enabled shortly after, it will not
fire.

Should the driver clear the interrupt status before checking for messages?

[ ... ]

> @@ -264,7 +264,7 @@ static int enetc_msg_psi_init(struct enetc_pf *pf)
>  	}
> =20
>  	/* enable MR interrupts */
> -	enetc_msg_enable_mr_int(&si->hw);
> +	enetc_msg_set_mr_int(pf, true);
> =20
>  	return 0;

This isn't a bug in your patch, but looking at the surrounding code in
enetc_msg_psi_init(), is there a risk of accessing an uninitialized
work_struct?

	vector =3D pci_irq_vector(si->pdev, ENETC_SI_INT_IDX);
	err =3D request_irq(vector, enetc_msg_psi_msix, 0, pf->msg_int_name, si);
	...
	/* initialize PSI mailbox */
	INIT_WORK(&pf->msg_task, enetc_msg_task);

Since request_irq() enables the interrupt immediately, if a pending
interrupt fires before INIT_WORK() is called, the handler will schedule
the uninitialized work_struct. Should INIT_WORK() be called before
request_irq()?

Also, looking at the error path just below this:

err_init_mbx:
	for (i--; i >=3D 0; i--)
		enetc_msg_free_mbx(si, i);

	free_irq(vector, si);

	return err;

Does this code leak the scheduled work? If an interrupt fired during the
allocation loop and scheduled pf->msg_task, free_irq() will wait for the
handler to finish but will not cancel the scheduled work. After returning,
the work could execute and access the freed mailbox memory. Should
cancel_work_sync() be called in this error path?

> =20
> @@ -285,7 +285,7 @@ static void enetc_msg_psi_free(struct enetc_pf *pf)
>  	cancel_work_sync(&pf->msg_task);
> =20
>  	/* disable MR interrupts */
> -	enetc_msg_disable_mr_int(&si->hw);
> +	enetc_msg_set_mr_int(pf, false);

This isn't a bug in your patch, but is there a teardown race here?

If a hardware interrupt fires right after cancel_work_sync() completes,
the handler will execute and call schedule_work(&pf->msg_task). The work
will then run after the mailboxes are freed and the IRQ is unregistered.

Should enetc_msg_set_mr_int() and free_irq() be called before
cancel_work_sync()?

> =20
>  	for (i =3D 0; i < pf->num_vfs; i++)
>  		enetc_msg_free_mbx(si, i);

While looking at this teardown path, I noticed enetc_msg_free_mbx() calls
dma_free_coherent() before clearing the hardware base address registers
(ENETC_PSIVMSGRCVAR0 and ENETC_PSIVMSGRCVAR1).

If a VF sends a message before the registers are zeroed, could the hardware
perform a DMA write to memory that has already been returned to the allocat=
or?

Should the hardware registers be cleared before the backing DMA memory
is freed?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511080805.2052=
495-1-wei.fang@nxp.com?part=3D14
