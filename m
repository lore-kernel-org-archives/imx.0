Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70BAC33A032
	for <imx@lists.linux.dev>; Tue, 19 May 2026 03:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159857; cv=none; b=c41hffU414JItw4TGsTjkNDn/c8kWEZPf3PcxSYGa3bM3beM/TIFUaH7t/zt4K8Hl7k1O8yH0v9v1Def6V4sfMoPBOpTPMrYeAozlVsFoxyUH6GEph1sWBTJHPpG1XXQsR6nVlRo8A5YSLwJB0uHQyV7HgRGjfb0LJxCKS+uSj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159857; c=relaxed/simple;
	bh=TbX0aQqadfcSlWHs4n6HMS7hksqdEV3vT+mPm99kgi4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TslH3BzFroogtxZrgqB7awfQdJhJrc1qPOpEjMEkIzfsT6yCx2RImlh8D5zgBZ013oTSeiFNPiTSAOGbwccevz+0j/YD4Zgj6W3Ikac/5P2GjIIDEgCe9Ex6YAE1/q5rF1/bGJHb3RKE2r0bFC0gbAmpr0g4OoksZO8SCa16oHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQHU9lus; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQHU9lus"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8ADBC2BCB7;
	Tue, 19 May 2026 03:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159857;
	bh=TbX0aQqadfcSlWHs4n6HMS7hksqdEV3vT+mPm99kgi4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=RQHU9lusShzOsMc9t+32UxzQXKgF9LXtv+tZ9XK+2DJ9U/j8d+jYrEVMju5yFFCSY
	 DEhkROH5ZiL0LHUGrSDmqFOJ+RJ6HC7SHh5ymHiJVAYoF32fgZL5l29jIhEPu66HNv
	 +bS2tp7poGhRHMPUOBA/Cf5UT884d7k3xXIP9nE1LOgVfbYCQDw9AywF01VuA5EC+6
	 CTZGWnPsgEdBRJi2LiEcxLI0IpjVKy0bBkmbVD6Qk5Lb7bBaPLVLh8Sc6TrQ/u5+vt
	 trnL1tp4KXcnYE0gEOciPom75JD9GOYXAUA/rncp1OoUYl1Wa28lZ0sFn7Ws4Qrg1i
	 piBNOnXvPWfAA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 8/9] net: enetc: fix initialization order to
 prevent use of uninitialized resources
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518030535.1057228-9-wei.fang@nxp.com>
References: <20260518030535.1057228-9-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:04:16 +0000
Message-Id: <20260519030416.B8ADBC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Subsystem teardown race leading to DMA use-after-free and addr=
ess tearing.
- [High] Race condition leading to unhandled MSI-X interrupts during teardo=
wn.
--

commit 915d29ad4ee423bfd331aa51df517af1e74461b5
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix initialization order to prevent use of uninitialized resour=
ces

This patch reorders the initialization sequence in enetc_msg_psi_init()
to ensure mailboxes and the work struct are fully initialized before the
IRQ handler is registered. It also updates the teardown sequence in
enetc_msg_psi_free().

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 39f057fe85c70..a999f1e7817f3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -151,14 +149,17 @@ void enetc_msg_psi_free(struct enetc_pf *pf)
>  	struct enetc_si *si =3D pf->si;
>  	int i;
> =20
> +	/* disable MR interrupts */
> +	enetc_msg_disable_mr_int(&si->hw);
> +
> +	/* de-register message passing interrupt handler */
> +	free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
> +
>  	cancel_work_sync(&pf->msg_task);

Can this sequence cause an unhandled interrupt?

Since free_irq() is now called before cancel_work_sync(), if the mailbox
workqueue task (enetc_msg_task()) is executing during cancel_work_sync(),
the task might unconditionally re-enable hardware MR interrupts at the end
of its execution via enetc_msg_enable_mr_int().

This could create a window between the work task finishing and the second
enetc_msg_disable_mr_int() call where hardware MR interrupts are enabled but
the OS IRQ handler is already freed.

If a Virtual Function (VF) sends a message during this window, could the
hardware assert the MSI-X interrupt, resulting in a spurious IRQ that might
disable the IRQ line?

This regression is fixed later in the patch series by commit
675d55bcc780129a27acba4ec3a3cd33ecd510fc ("net: enetc: avoid VF->PF mailbox
timeout during SR-IOV teardown"), which avoids the issue by destroying the
VFs before cleaning up the PF mailbox.

> =20
> -	/* disable MR interrupts */
> +	/* MR interrupts may be re-enabled by workqueue */
>  	enetc_msg_disable_mr_int(&si->hw);
> =20
>  	for (i =3D 0; i < pf->num_vfs; i++)
>  		enetc_msg_free_mbx(si, i);

Does this teardown sequence leave a race window where active VFs can corrupt
memory?

While this pre-existing issue wasn't introduced by this patch, calling
enetc_msg_psi_free() before pci_disable_sriov() means PF mailbox resources
are freed while VFs are still active and capable of sending messages.

During teardown, enetc_msg_free_mbx() clears the 64-bit DMA address
registers via two sequential 32-bit writes:

enetc_msg_free_mbx() {
    ...
    enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
    enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
    ...
}

If an active VF sends a message between these writes, could the hardware DMA
into a torn 64-bit address?

Additionally, if a message is sent immediately after dma_free_coherent() in
enetc_msg_free_mbx(), could the hardware perform a DMA write into kernel
memory that has already been returned to the allocator?

This pre-existing issue is fixed later in the patch series by commit
675d55bcc780129a27acba4ec3a3cd33ecd510fc ("net: enetc: avoid VF->PF mailbox
timeout during SR-IOV teardown"), which safely calls pci_disable_sriov()
first to ensure all VFs are removed before mailbox teardown.

> -
> -	/* de-register message passing interrupt handler */
> -	free_irq(pci_irq_vector(si->pdev, ENETC_SI_INT_IDX), si);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518030535.1057=
228-1-wei.fang@nxp.com?part=3D8
