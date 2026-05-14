Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952012848BA
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756303; cv=none; b=m8Sl2zaFvz7adDZn94not/bP5Giijud3CdLM4ki4YqYvwn+zzQc3V20klqM/kwz38i8nbHIs/ZTl8GKiciySOYxAYOFqMsf/MA6kl+1E+UsNMW0a2QHBDJ7uSNfMGMVhX1/quRyTiNr/yWhvUEjYcllhOGdzAxo3FDH78Q8yEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756303; c=relaxed/simple;
	bh=c9OG2AhwINnz5s4vHqD2MII6BtCaeLW4JUHjferOFBA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wj/BqBtv5ynuBXg7TkgAr2VXBCQ8+g3dbbWbQ+Mi0Qq6grPbB9XnamuzfCijwcLQrY/EmhaojyuV+sfyRMEge6REbMbCQt8F7QSCwDkcfh02R4O8/hebaOm0fqjWzeBpyXncLEh6zjoFExUa3MRxo2LB/Y8VcQJdhEA1U3lMZDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PN5NriGL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PN5NriGL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3D06C2BCB3;
	Thu, 14 May 2026 10:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756303;
	bh=c9OG2AhwINnz5s4vHqD2MII6BtCaeLW4JUHjferOFBA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=PN5NriGLvDTAt39t2jjcA+Mk+O0Pl64mjuZTodjJx2Ir3xoOCfkyWsT0echUjp8tQ
	 95HxXBbGpDI6bpUCIhWSqvj+bg4rjqaB7tK8nDWvEJ/E1llCDq5vb3RPx9qFdIte3V
	 iuOr+qYCE+2MU6uSHADsJIVEm2JDC1vcABUeZN0tN/gxYtFQ4VKCqeuIj56we8seG7
	 TkbdWhHAOL2imBBjf6kIP0SYhnKpK4TUKrswEV1fbLdqVmKYjMCRaiyZXahyLI+/Tr
	 Dtwtz9Y9aZMYQwanTYIeu8ONz+Dq0vwr3E7wZcGBH5ZaT66zEOSToHxPtJl3EElsmW
	 ejR4WVahM9r3g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 4/6] net: enetc: avoid VF->PF mailbox timeout during
 SR-IOV teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260513103021.2190593-5-wei.fang@nxp.com>
References: <20260513103021.2190593-5-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:22 +0000
Message-Id: <20260514105822.D3D06C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Missing bounds checks on the number of VFs against the fixed-s=
ize rxmsg array can lead to out-of-bounds heap reads/writes and out-of-boun=
ds MMIO accesses.
- [High] Missing cancel_work_sync() in the error path of enetc_msg_psi_init=
() leads to a potential NULL pointer dereference or unhandled interrupt.
--

commit 20bd14a48fb81c18f7cc12a0a4f0d93f01026fce
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: avoid VF->PF mailbox timeout during SR-IOV teardown

During SR-IOV teardown, this commit reorders the cleanup steps to call
pci_disable_sriov() before cleaning up the mailbox resources. This
eliminates a race window where VFs could send messages to an unresponsive
PF and time out waiting for a reply.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index 6939ab04dcdc0..052cab48df514 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -544,9 +544,9 @@ static int enetc_sriov_configure(struct pci_dev *pdev=
, int num_vfs)
>  	int err;
> =20
>  	if (!num_vfs) {
> +		pci_disable_sriov(pdev);
>  		enetc_msg_psi_free(pf);
>  		pf->num_vfs =3D 0;
> -		pci_disable_sriov(pdev);
>  	} else {
>  		pf->num_vfs =3D num_vfs;

This problem wasn't introduced by this patch, but it exists in the codebase.
In enetc_msg_psi_init(), if enetc_msg_alloc_mbx() fails:

drivers/net/ethernet/freescale/enetc/enetc_msg.c:enetc_msg_psi_init() {
[ ... ]
	for (i =3D 0; i < pf->num_vfs; i++) {
		err =3D enetc_msg_alloc_mbx(si, i);
		if (err)
			goto err_init_mbx;
	}
[ ... ]
err_init_mbx:
	for (i--; i >=3D 0; i--)
		enetc_msg_free_mbx(si, i);

	free_irq(vector, si);

	return err;
}

Can this lead to a NULL pointer dereference or an unhandled interrupt?

If an interrupt fired and scheduled the work item before free_irq() was
called, would the work item remain queued and run asynchronously after the
function returns, since cancel_work_sync(&pf->msg_task) is missing?

A prior patch in the series fixed the cleanup in the normal teardown path,
but does this error path remain vulnerable?

If the executing enetc_msg_task() then runs, would it dereference the
mailbox memory (msg->vaddr) that was just cleared if a message was pending?
Would it also call enetc_msg_enable_mr_int(), enabling hardware interrupts
when no handler is registered anymore?


There is another problem that wasn't introduced by this patch, but exists
in the codebase. During enetc_pf_probe(), the driver initializes
pf->total_vfs:

drivers/net/ethernet/freescale/enetc/enetc_pf.c:enetc_pf_probe() {
[ ... ]
	pf->total_vfs =3D pci_sriov_get_totalvfs(pdev);
	if (pf->total_vfs) {
		pf->vf_state =3D kzalloc_objs(struct enetc_vf_state,
					    pf->total_vfs);
[ ... ]
}

Does this code lack bounds checking on the number of VFs against the fixed
size of the rxmsg array (ENETC_MAX_NUM_VFS)?

If a PCIe device or hypervisor presents a capability with an artificially
large TotalVFs, would loops iterating up to pf->num_vfs perform out-of-boun=
ds
accesses to the pf->rxmsg array when SR-IOV is enabled?

Could this also result in out-of-bounds MMIO writes by indexing past
valid registers?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D4
