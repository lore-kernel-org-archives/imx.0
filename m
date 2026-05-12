Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9123164C7
	for <imx@lists.linux.dev>; Tue, 12 May 2026 23:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778630373; cv=none; b=BRkvu+j71DvKWDGfcfCehKWMV49t/8f9yvrW1Uh3vGg4oG2K2ajODnHx2ewYjoMXzaqmd17yO+nO8u/wL+kf49Izi42LVh86dANrL3yBO8Ds7976pq23uIUS0aPaIDMWXjsHrOoY221uNM+gnVnPWR+DWDU9waa/lIUC4pBTSqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778630373; c=relaxed/simple;
	bh=PzoqKjQW80UBRuk9mjVVCUqaGJv6nabKVpLeiIsuey0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HsJBCat8W59U9dxkE1BiLu8BM8hk2dd0ZG/Xsu36f0eYXC4CMEXl9MRV7B3Kmol0b06S+MKO756PX45HnKJI9MhBDWuWmmWJ2yssPelP0zBZ7YG47qP/0BQy92Z8Smc1xEx6ZO7DbFY0/KEqzBVz/qlzuVq84FGTcYl52eTVXTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AJ2u/wJW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AJ2u/wJW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF9A9C2BCF5;
	Tue, 12 May 2026 23:59:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778630373;
	bh=PzoqKjQW80UBRuk9mjVVCUqaGJv6nabKVpLeiIsuey0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=AJ2u/wJWxQbQlcKA2jujcKJFN8hUnu3Xxj1tv5/pWs/QRFzhiZXDcfZSPwMLaHSSD
	 jGSNCZmoWYAMgZ7txbiuciHVjTnZKzAh7PokkWC5sO4Oh50/aZ4wpQ66vlcRUt5hmR
	 CBWVMUq3kDWzKE8aoCzPBJjnjpGPfks4n4wv2UANJqOJm2DF6DWuxf7iEr7C83EsBt
	 tqjr6+igTN8bERPiCxB95JosvYwhPS4sGtxptt2HyAz+ay38gZ5NTvqWywphsPduEx
	 5LwB+gc3tFSpU7onn941/UTBb6nwjpmoBS/Zbiiv2NXHOsAIfnwOWjNe2XnJLnNWYe
	 +pIw/Msga5feQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 13/15] net: enetc: dynamically allocate rxmsg
 based on VF count
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260511080805.2052495-14-wei.fang@nxp.com>
References: <20260511080805.2052495-14-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 May 2026 23:59:32 +0000
Message-Id: <20260512235932.EF9A9C2BCF5@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Teardown race leading to a permanent infinite loop in the msg_task=
 workqueue.
- [High] Uninitialized work struct race in enetc_msg_psi_init causes workqu=
eue list corruption.
--

commit 2a9ca5a7c76f884ea46d71ecd971d43269b7a246
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: dynamically allocate rxmsg based on VF count

To better match hardware capabilities and avoid unnecessary memory usage,
this patch changes rxmsg memory allocation from a fixed-size array to
dynamic allocation based on the actual VF count.

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.h b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.h
> index 9fcf1c58d59b4..d4f1041587f7a 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.h
> @@ -42,7 +42,7 @@ struct enetc_pf {
> =20
>  	struct enetc_mac_filter mac_filter[MADDR_TYPE];
> =20
> -	struct enetc_msg_swbd rxmsg[ENETC_MAX_NUM_VFS];
> +	struct enetc_msg_swbd *rxmsg;
>  	struct work_struct msg_task;

This problem wasn't introduced by this patch, but I noticed a potential
teardown race involving msg_task.

In enetc_msg_psi_free(), cancel_work_sync(&pf->msg_task) is called before
free_irq(). If an MR interrupt is delivered immediately after
cancel_work_sync() returns, the ISR (enetc_msg_psi_msix) could execute and
re-queue the work via schedule_work().

Subsequently, enetc_sriov_configure() sets pf->num_vfs =3D 0.

When the improperly scheduled msg_task eventually executes, it reads a
non-zero mr_mask from the hardware. However, because pf->num_vfs is now 0,
the inner for (i =3D 0; i < pf->num_vfs; i++) loop is skipped. Consequently,
the hardware's write-1-to-clear (w1c) register is never written to clear the
interrupt status.

Could this cause the outer for (;;) loop to read the exact same non-zero
mr_mask on every iteration, spinning in a permanent infinite loop and
stalling the workqueue?

Furthermore, in the error path of enetc_msg_psi_init(), cancel_work_sync() =
is
missing entirely. Could this lead to the exact same infinite loop if an
interrupt fired prior to the failure?

Also related to msg_task, in enetc_msg_psi_init(), request_irq() is called =
to
register the interrupt handler enetc_msg_psi_msix before
INIT_WORK(&pf->msg_task, enetc_msg_task) initializes the work structure.

If the hardware asserts an interrupt from a previous boot or kexec state, or
if a spurious interrupt occurs, the ISR will execute immediately upon
registration and call schedule_work(&pf->msg_task) on an uninitialized,
zero-filled work_struct.

Could this cause list corruption and crash the kernel's workqueue subsystem
because the internal list pointers are NULL? Should INIT_WORK() always be
called before request_irq()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260511080805.2052=
495-1-wei.fang@nxp.com?part=3D13
