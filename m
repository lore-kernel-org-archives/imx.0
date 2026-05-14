Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE9E3B47C6
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756302; cv=none; b=c0ThRchVmhNsowpNC7X/y2qwbMUmJBuhsLU591x/MjLxr4Uh/Y52MlwCh+1NDyR3ethispO2a9Z6EOV3ohbTS1/oi8hF8Bg5vSObNGdEFfX26nc1WYqMUaDHCvVifOH8CTSnTduxZQ+oiTKQsgyiQFuFumvc9fh0wV7M+YO/ByU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756302; c=relaxed/simple;
	bh=VudyFqotvrY1bBkboKSvmYRbA1msT8emN5iF4c/zSSc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HdvIzka9Gn/eH7mk2ufI7ag2TJqDPz/RQXiturpFUmxxqs401JqRymjWS3zCWG6mk/1EAUp62C4z2wqi5vkm8yCxBe5ypUMc6wadoGk/XoYYRZxQVwlC4efMx9a1waOFRbWVgCV8X2u7j6rDnwI2HDZ5v8s/TyBMB6GwQ5dxSxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hbQ4G0V4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hbQ4G0V4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3302CC2BCB3;
	Thu, 14 May 2026 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756302;
	bh=VudyFqotvrY1bBkboKSvmYRbA1msT8emN5iF4c/zSSc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hbQ4G0V4b516lbhnJDxEpldVy6V1ZSmpTyZENCEvNBrvOC/QwFuCBqiqWlRfWDWvA
	 zbpFuSxtnw8eqxMiaIrhL8cQb1WxdZRx5AXqnSyScjpEG18Zw1scUj3AmivjTMtYdo
	 RhKuBQ+Z4SawwChBNSHMS+CXbWCk1ZsdjKrfJCdX4G+enqssH3rgD5qRNeyrU1XJaE
	 8VPaOeRQeX6v9tu8i21hElb42vI/iimFml771Se8rXIdf0ojy1C0mqdo2Ne4zlkC8m
	 EvI4tDEsZtec+6CN0D/aCXRRwwz/FQnNszJU9h0VTVcYls+ljCqX4R1b2lGIjby29G
	 WBid67Sioy/nw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 3/6] net: enetc: fix use-after-free in mailbox
 cleanup on interrupt race
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260513103021.2190593-4-wei.fang@nxp.com>
References: <20260513103021.2190593-4-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:21 +0000
Message-Id: <20260514105822.3302CC2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Reordering teardown leaves hardware interrupts enabled after u=
nregistering the OS handler, causing pending MSI-X interrupts that crash th=
e kernel on re-initialization.
- [High] DMA memory Use-After-Free in mailbox cleanup because buffers are f=
reed before clearing hardware receive registers.
- [High] Initialization order bug in `enetc_msg_psi_init()` leading to kern=
el panic on pending interrupts.
--

commit 7775e7cd27db0383dcec0aee22ae84d6c2378ee2
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix use-after-free in mailbox cleanup on interrupt race
   =20
This commit fixes a use-after-free regression in the PF mailbox teardown pa=
th
by reordering the shutdown sequence to prevent work requeuing.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 40d22ebe9224f..fe9680a97b0e7 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -151,14 +151,14 @@ void enetc_msg_psi_free(struct enetc_pf *pf)
>  	struct enetc_si *si =3D pf->si;
>  	int i;
> =20
> -	cancel_work_sync(&pf->msg_task);
> +	/* de-register message passing interrupt handler */
> +	free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
> =20
> -	/* disable MR interrupts */
> -	enetc_msg_disable_mr_int(&si->hw);
> +	cancel_work_sync(&pf->msg_task);

Could moving free_irq() before enetc_msg_disable_mr_int() leave hardware
interrupts enabled after the OS handler is unregistered?

Because VFs are still active at this stage, a VF can send a message.
cancel_work_sync() waits for the worker, which processes existing messages
but then unconditionally re-arms the MR interrupt before exiting.

If a VF sends a message now, the hardware asserts the interrupt. Since
the OS handler is removed and the vector is masked, it is recorded as pendi=
ng
in the MSI-X Pending Bit Array. enetc_msg_disable_mr_int() is called later
but does not clear this array.

Upon the next SR-IOV enablement, request_irq() unmasks the vector, and
the pending interrupt fires immediately, leading to a crash.

This regression appears to be mitigated later in the patch series by
commit 20bd14a48fb81 ("net: enetc: avoid VF->PF mailbox timeout during
SR-IOV teardown") and commit fa9d7e3799c54 ("net: enetc: fix initialization
order to prevent use of uninitialized resources").

>  	for (i =3D 0; i < pf->num_vfs; i++)
>  		enetc_msg_free_mbx(si, i);

This isn't a regression introduced by this patch, but does the current
implementation of enetc_msg_free_mbx() have a use-after-free risk for the
mailbox memory?

It calls dma_free_coherent() to free the mailbox memory before clearing the
hardware DMA address registers:

enetc_msg_free_mbx() {
	...
	dma_free_coherent(&si->pdev->dev, msg->size, msg->vaddr, msg->dma);
	memset(msg, 0, sizeof(*msg));

	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
}

Since VFs are still active during SR-IOV teardown, a VF could send a message
during this window. This would cause the PF hardware to perform a DMA write
using the uncleared receive address into the just-freed memory.

This regression appears to be mitigated later in the patch series by
commit 20bd14a48fb81 ("net: enetc: avoid VF->PF mailbox timeout during
SR-IOV teardown"), which disables SR-IOV before mailbox cleanup.

> -	/* de-register message passing interrupt handler */
> -	free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
> +	/* disable MR interrupts */
> +	enetc_msg_disable_mr_int(&si->hw);
>  }

Additionally, while not introduced by this patch, is there an initialization
order regression in enetc_msg_psi_init()?

If request_irq() is called to register enetc_msg_psi_msix() before INIT_WOR=
K()
and enetc_msg_alloc_mbx() are executed, an immediate interrupt could cause =
the
handler to call schedule_work() on an uninitialized work structure or lead
to a NULL pointer dereference.

This regression appears to be fixed later in the patch series by
commit fa9d7e3799c54 ("net: enetc: fix initialization order to prevent use
of uninitialized resources").

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D3
