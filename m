Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B88338925
	for <imx@lists.linux.dev>; Tue, 19 May 2026 03:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779159856; cv=none; b=azqafv2jt0ad8lDUtjEdrn+oTAf/4AvPfn+pdmXYdXkZxQMZIPEsAy3znE8yPtSohBrB3dHih+jI7HTfgReVFvYjaEU+CDObu1LXxDr+7CvKizMUrf/C8kJIcwz5E9OkADjGNq75+ymHrUC8yrLbAlimsH15kNaFHZtxso5zDQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779159856; c=relaxed/simple;
	bh=HoQMoTYFvD9r3+E7+WvTYnMjS6D3CXElbGjCzfZghQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=m2z2g+EWGwp/viMQHFAc9U1bgWwPAf3ptghSrYgqUDbsvFYQ6eV4FTg2vAk4RO96Kaygj79Qo6pSKlL8nEqihbiwjpAPmavFdYneV4pfcdETof+cecTHUvUMYqO+VuD3qo4TEejW89mYrXEe0fYodbL8qV7o73+/fyqAaWQ9mfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cpeb1Mtl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cpeb1Mtl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F22C2BCB7;
	Tue, 19 May 2026 03:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779159855;
	bh=HoQMoTYFvD9r3+E7+WvTYnMjS6D3CXElbGjCzfZghQg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=Cpeb1MtloMwmbuR8kQdW6Bkfog/axaGK7cVgDQxJpybX1i5gAaTfUF4wGWkGjOVjL
	 thQxcQcITp1YHlzBXkszDwhFWRgEIG3+1RTNj+qom+5UE3/THUGeswW3CV6jGTB3U/
	 BdlQqhvj4Kn02C049CuXKI1el8RyhYojZr+m1eGScGjeJ5vHrWJMSqET54+NG93ITd
	 WHPPt56UU1ZOQZ7Qy+qQ9iTRoIi+CnOCfCZRe5KJF9CuhRgcn0aweUZI/RnlCIurWl
	 DgBORCZEvTXjD7Vi9J9SRRA83lcFvMXrCMnMuZ2Atq+lfu5MQTo3+UcHgC0qyDbyhk
	 tYfBGUTJz/few==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 7/9] net: enetc: fix VF-to-PF message handler
 unbounded loop DoS
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260518030535.1057228-8-wei.fang@nxp.com>
References: <20260518030535.1057228-8-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 19 May 2026 03:04:15 +0000
Message-Id: <20260519030415.A7F22C2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The patch introduces an unrecoverable interrupt storm (CPU loc=
kup) due to a race condition between clearing the Interrupt Detect Register=
 (ENETC_PSIIDR) and the Message Receive Register (ENETC_PSIMSGRR).
- [High] This problem wasn't introduced by this patch, but leftover message=
 bits for VFs outside the active range (`i >=3D pf->num_vfs`) are never cle=
ared, leading to a permanent system hang (workqueue loop previously, interr=
upt storm now).
--

commit d9295f8cbd6e76e55e6e57bfbfbb77472222296d
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix VF-to-PF message handler unbounded loop DoS

This commit replaces the unbounded polling loop in the VF-to-PF message
handler with a single snapshot read of the message receive register. It
bounds the work per task invocation to prevent a malicious VM from starving
the PF worker thread.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index b4d7457097e60..39f057fe85c70 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> @@ -32,32 +32,32 @@ static void enetc_msg_task(struct work_struct *work)
>  {
>  	struct enetc_pf *pf =3D container_of(work, struct enetc_pf, msg_task);
>  	struct enetc_hw *hw =3D &pf->si->hw;
> -	unsigned long mr_mask;
> +	u32 mr_status;
>  	int i;
> =20
> -	for (;;) {
> -		mr_mask =3D enetc_rd(hw, ENETC_PSIMSGRR) & ENETC_PSIMSGRR_MR_MASK;
> -		if (!mr_mask) {
> -			/* re-arm MR interrupts, w1c the IDR reg */
> -			enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIER_MR_MASK);
> -			enetc_msg_enable_mr_int(hw);
> -			return;
> -		}
> +	mr_status =3D enetc_rd(hw, ENETC_PSIMSGRR) & ENETC_PSIMSGRR_MR_MASK;
> +	if (!mr_status)
> +		goto out;

Could this cause a regression if SR-IOV is disabled while a VF has pending
messages, and then re-enabled with fewer VFs (a smaller pf->num_vfs)?
Wouldn't the leftover message bits in ENETC_PSIMSGRR and ENETC_PSIIDR for t=
he
now-inactive VFs remain set?

Since the loop below only processes up to pf->num_vfs, it looks like those
leftover bits would never be cleared. Could this cause mr_status to remain
non-zero but unhandled, leading to an immediate interrupt storm when
interrupts are re-enabled?

> =20
> -		for (i =3D 0; i < pf->num_vfs; i++) {
> -			u32 psimsgrr;
> -			u16 msg_code;
> +	for (i =3D 0; i < pf->num_vfs; i++) {
> +		u32 psimsgrr;
> +		u16 msg_code;
> +
> +		if (!(ENETC_PSIMSGRR_MR(i) & mr_status))
> +			continue;
> =20
> -			if (!(ENETC_PSIMSGRR_MR(i) & mr_mask))
> -				continue;
> +		enetc_msg_handle_rxmsg(pf, i, &msg_code);
> =20
> -			enetc_msg_handle_rxmsg(pf, i, &msg_code);
> +		/* w1c to clear the corresponding VF MR bit */
> +		enetc_wr(hw, ENETC_PSIIDR, ENETC_PSIIDR_MR(i));
> =20
> -			psimsgrr =3D ENETC_SIMSGSR_SET_MC(msg_code);
> -			psimsgrr |=3D ENETC_PSIMSGRR_MR(i); /* w1c */
> -			enetc_wr(hw, ENETC_PSIMSGRR, psimsgrr);

Could writing to ENETC_PSIIDR before ENETC_PSIMSGRR introduce a regression
involving a race condition with new incoming messages?

If a guest VM sends a new message in the narrow window between these two
register writes, the hardware would set the MR bit in both registers again.
The subsequent write to ENETC_PSIMSGRR would then clear the newly set
message bit, but the bit in ENETC_PSIIDR would remain asserted.

When the task re-enables interrupts at the "out" label, wouldn't the
uncleared ENETC_PSIIDR bit immediately trigger a hardware interrupt?

Then on the next invocation, mr_status would be read as 0, and the task
would jump to "out" without clearing ENETC_PSIIDR. This would re-enable
interrupts and potentially cause an interrupt storm. The original code
appeared to handle this by unconditionally clearing ENETC_PSIIDR when
mr_status was 0.

> -		}
> +	}
> +
> +out:
> +	enetc_msg_enable_mr_int(hw);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260518030535.1057=
228-1-wei.fang@nxp.com?part=3D7
