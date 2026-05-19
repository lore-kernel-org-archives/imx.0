Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2911C338925
	for <imx@lists.linux.dev>; Tue, 19 May 2026 03:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159855; cv=none; b=mdksTbvjIUVULplKsDBomSVP+lwWAR16aA+EbJaKG5gDCwDlzRLj5dcwViqqak5VZLHyfOGEPh0w5AZK/bMLcfdmOK7gA5vf8blQQeNi4UrNS/SWuyXPKJ5Pa8t4HkvzP4u8j/sCxRwR6zJbcOmSf1z3hTYIpRskaTagfDhQOo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159855; c=relaxed/simple;
	bh=xa1con7ASPWgvCMTrQP7JC4nDeeRlYdES3yP9zI4zCQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VonsfPb6KlLf3G5rP20IElOBogQ3F4TVdutfJilNWp73Jo+6/EnV/C747wpNhJQ1DdnBZbZMXMTM/nAcarnZGaG/+Jy1u7qu7qRKDvGj5ibPo+j8Hmpj/19wVpdpDHNknmgz/tBL4QaUANUoHFfMC65lkJD8CCM/u5OJXtHeONM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrHS+MHF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrHS+MHF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A81F5C2BCB7;
	Tue, 19 May 2026 03:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159854;
	bh=xa1con7ASPWgvCMTrQP7JC4nDeeRlYdES3yP9zI4zCQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=mrHS+MHFLgSBS3ex9MFuUPznkXXAdVpywl5EEiQ7ZBiahtIQ+jcwKZ/M6Qw/eom6a
	 ifPBcFX44whWTXKBIpZgZxp/J6vz3EVII6N8J5Dny1k3qC7DKkfNizOrkElB1n5CfS
	 MTSnnCb5SXjMxpT9S9s+P7qkBU+YYT+Ef5F3VnR2QMS1aImm7umgnU7fwJkd4imJ9b
	 npZy3M9qWG+6PTuFx/kJOvuR75/EQU0Xx5jb9YPSIXJmvPkbBkXyTwF/N8lsPbmIUy
	 NoHAA6t+ds6blPJVbKG4AO5mZr9gDLrhuAcAPPhMQjfIpkRUK/dmsect2SlomsBlZQ
	 bxLfcgXDprceQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 6/9] net: enetc: fix DMA write to freed memory in
 enetc_msg_free_mbx()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260518030535.1057228-7-wei.fang@nxp.com>
References: <20260518030535.1057228-7-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:04:14 +0000
Message-Id: <20260519030414.A81F5C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Critical] Memory corruption at physical address 0x0 due to zeroing DMA t=
argets while VFs are active.
- [High] Unflushed posted PCI writes leave a race window for DMA into freed=
 memory.
- [High] Teardown race condition leading to NULL pointer dereference or Use=
-After-Free.
--

commit dd65c0648588abad91771aef96f48b4812bd1952
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix DMA write to freed memory in enetc_msg_free_mbx()

The teardown sequence in enetc_msg_psi_free() frees the DMA buffer before
clearing the device's DMA address registers. If a VF sends a message or a
pending DMA transfer completes within this window, the hardware will
perform a DMA write into the kernel memory that has already been returned
to the allocator.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index 40d22ebe9224f..b4d7457097e60 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -96,12 +96,12 @@ static void enetc_msg_free_mbx(struct enetc_si *si, i=
nt idx)
>  	struct enetc_hw *hw =3D &si->hw;
>  	struct enetc_msg_swbd *msg;
> =20
> +	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
> +	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);

Since enetc_wr() performs a posted memory-mapped I/O write over PCIe, does =
it
need a dummy read-back (such as enetc_rd()) to flush the writes?

Without a read-back, could dma_free_coherent() execute and unmap the memory
while the write is still buffered in the PCIe hierarchy? This might leave a
window where an incoming DMA could still write to the memory being freed.

Could writing 0 to the DMA address registers here cause memory corruption at
physical address 0x0?

Since VFs are still fully active at this point in the teardown sequence
(before pci_disable_sriov() is called), an active VF might send a message
right after these registers are zeroed, causing the PF hardware to perform
a DMA write to physical address 0x0.

I noticed this is fixed later in the patch series by commit 675d55bcc7801
(net: enetc: avoid VF->PF mailbox timeout during SR-IOV teardown).

> +
>  	msg =3D &pf->rxmsg[idx];
>  	dma_free_coherent(&si->pdev->dev, msg->size, msg->vaddr, msg->dma);
>  	memset(msg, 0, sizeof(*msg));
> -
> -	enetc_wr(hw, ENETC_PSIVMSGRCVAR0(idx), 0);
> -	enetc_wr(hw, ENETC_PSIVMSGRCVAR1(idx), 0);
>  }

Regarding the teardown sequence in enetc_msg_psi_free(), is there a race
condition that could cause a regression like a NULL pointer dereference or
use-after-free?

If cancel_work_sync(&pf->msg_task) is called before enetc_msg_disable_mr_in=
t()
and free_irq(), an interrupt could fire immediately after cancel_work_sync()
returns. The IRQ handler (enetc_msg_psi_msix) would execute and
unconditionally call schedule_work(&pf->msg_task), re-queuing the work.

Then enetc_msg_free_mbx() frees the DMA buffer and zeros out the msg_swbd
structure. When the mistakenly re-queued worker task executes
enetc_msg_handle_rxmsg(), it would attempt to read from the nullified
msg_swbd->vaddr or freed memory.

I noticed this is fixed later in the patch series by commit 915d29ad4ee42
(net: enetc: fix initialization order to prevent use of uninitialized resou=
rces).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518030535.1057=
228-1-wei.fang@nxp.com?part=3D6
