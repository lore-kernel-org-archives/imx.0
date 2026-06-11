Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B373C1961
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171261; cv=none; b=MmvlKCZThPjdNrdlW/LPSFWjZEAY8k+bEyPtUvTvu0HfCLT9wvUkY1JnoAiL3bLb3jYAz/2j3MfFfqQ7kNFtk5V/UsZI7tc1S0c+UvS+SzRNY+Z6Skkv+Tx2QX1pQ+uI9ITqfPuMXVlW4H5OqzwBxk3RQuqjUMbVmFopSLDgTfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171261; c=relaxed/simple;
	bh=wL4oAXXvw13jig7V+v3UbMZlxKYumOQgL6LUl+X9tCg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ko6ey/s7VF55KBDiTkJzr87Xl8bALJSFUUOR2Iu6LiCwML//u9SGRem2hdmsWm8NaprbttlIGqWI+0CzYaWQPi6v3zn14KAtb9i2k2BNQVUMrbbj1bXRzjibVvmx4Ft4VbfVK8lD2Fr0pBqHRK2QEQEFVIzkafqIXps3VXwn4Nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I/dJHSdx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I/dJHSdx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C11D1F00893;
	Thu, 11 Jun 2026 09:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171259;
	bh=895StaTZHOp4uIbTEjTkBoGSBdPBNh9ptGvi7wnHNZ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I/dJHSdxkjP5uC4gumCpbz52UtgJ+ISAWAV6/dbI1l7lZ/q01a1JX1fA7TOx2/7fb
	 dEQamW/JlfIPvoklDqQybynWkzjF8Nrc+Qbi7p0Au4hW31K5pmEjhCK7zN9Oj0+/+c
	 LIamRv/qoLe+2NE4TEA5mfwIJxWfB4Ncmg48K/3MCOw6ANr6cCtXd7ce/kMAKGVPLR
	 XuA6Yk8QxHPHygbuVakQzcoAoHBDxuR1dRfRv654hgdgI8NhvpXjw3CO8RWarJfkOp
	 0qmgCYxnNjufBnL3IWDjvCZ+z/x735q8RwVSWuWpOICBv8NU9F6pOdWxDlqTyJPzP7
	 sMHHSSeSS6OMA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 03/15] net: enetc: add link status message
 support to PF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-4-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:38 +0000
Message-Id: <20260611094739.1C11D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] An untrusted or unresponsive Virtual Function (VF) can stall the P=
hysical Function's (PF) shared mailbox workqueue and block phylink state ch=
anges by forcing a 200ms timeout per request.
- [High] Dropping link state notifications for slow VFs causes permanent st=
ate desynchronization.
- [High] VF link status registration races with phylink carrier updates, ca=
using permanent link state desynchronization.
- [Medium] The error path for `pci_enable_sriov()` modifies `pf->sriov_enab=
led` without holding `msg_lock` and fails to clear `pf->link_status_ms_mask=
`, leaking state.
--

commit 36849ca6cc467beaae907837bf9648f05856b5c8
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add link status message support to PF driver

This commit adds link status message support to the PF driver using three
command IDs. It enables VFs to accurately perceive the link status and
report it to upper layers by registering for link change notifications.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index a89a5a418a23d..eac71f90d80bd 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> +static int enetc_pf_send_msg(struct enetc_pf *pf, u32 msg_code, u16 ms_m=
ask)
> +{
> +	struct enetc_hw *hw =3D &pf->si->hw;
> +	u16 old_ms_mask =3D ms_mask;
> +	u16 ms_status;
> +	u32 val;
> +
> +	/* The MS bit is set, indicating that the corresponding VF has not
> +	 * read the last message, PF cannot send new message to the VF. So
> +	 * the bit corresponding to VF is cleared from ms_mask.
> +	 */
> +	ms_status =3D enetc_rd(hw, ENETC_PSIMSGSR) & 0xffff;
> +	ms_mask &=3D ~ms_status;
> +	if (!ms_mask)
> +		return -EIO;

[Severity: High]
Does this clear busy VFs from the message mask and silently drop the
notification completely? If the new state is dropped entirely, when the
slow VF eventually reads the register, it will receive the outdated link
state. This seems like it could leave the VF operating with the wrong
link status until the next physical link bounce, permanently breaking
network connectivity.

> +
> +	if (ms_mask !=3D old_ms_mask)
> +		dev_warn_ratelimited(&pf->si->pdev->dev,
> +				     "PF cannot send message to VF(s) 0x%x\n",
> +				     ms_mask ^ old_ms_mask);
> +
> +	/* Writing a 1 when the bit is already set is undefined.
> +	 * Writing a 0 has no effect. Sending messages only to
> +	 * VFs where the MR bit is not set.
> +	 */
> +	enetc_wr(hw, ENETC_PSIMSGSR,
> +		 FIELD_PREP(PSIMSGSR_MC, msg_code) | ms_mask);
> +
> +	return read_poll_timeout(enetc_rd, val, !(val & ms_mask), 1000,
> +				 200000, false, hw, ENETC_PSIMSGSR);
> +}
[ ... ]
> +static void enetc_msg_register_link_status_notifier(struct enetc_pf *pf,
> +						    int vf_id)
> +{
> +	u16 pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +				ENETC_MSG_CLASS_ID_CMD_SUCCESS);
> +
> +	mutex_lock(&pf->msg_lock);
> +
> +	enetc_pf_reply_msg(&pf->si->hw, vf_id, pf_msg);
> +
> +	/* SR-IOV is being disabled if pf->sriov_enabled is false, so no
> +	 * need to set link_status_ms_mask and notify the link status.
> +	 */
> +	if (!pf->sriov_enabled)
> +		goto msg_unlock;
> +
> +	pf->link_status_ms_mask |=3D PSIMSGSR_MS(vf_id);
> +
> +	/* Notify VF the current link status */
> +	enetc_msg_notify_vf_link_status(pf, PSIMSGSR_MS(vf_id),
> +					netif_carrier_ok(pf->si->ndev));

[Severity: High]
Is there a race condition with phylink carrier updates here?=20

The PF broadcasts link state changes to registered VFs inside the
mac_link_up/down callbacks. However, the phylink core updates the netdev
carrier state (netif_carrier_on/off) only after these callbacks return.

If a VF registers for notifications exactly in the window between the
mac_link_up broadcast and the netif_carrier_on update, it misses the
broadcast. Because netif_carrier_ok() still reflects the old DOWN state,
the VF would be sent the DOWN state while the physical link is actually UP,
permanently desynchronizing it until the next link toggle.

[Severity: High]
Does this allow an untrusted VF to stall the PF's shared mailbox workqueue
and block phylink state changes?

The PF handles the register message in the shared enetc_msg_task workqueue.
It acknowledges the message, allowing the VF to send another immediately,
and then synchronously sends a link status notification via
enetc_pf_send_msg() while holding msg_lock.

Since enetc_pf_send_msg() polls for up to 200ms waiting for the VF to clear
its notification bit, a malicious VF could deliberately ignore the
notification and stall the workqueue thread for the full 200ms. Because
msg_lock is held, this also blocks enetc_pf_notify_vf_link_up/down from
executing in the host's phylink state machine, starving other VFs and
stalling physical link transitions.

> +
> +msg_unlock:
> +	mutex_unlock(&pf->msg_lock);
> +}
[ ... ]
> @@ -389,6 +545,7 @@ int enetc_sriov_configure(struct pci_dev *pdev, int n=
um_vfs)
>  	return num_vfs;
> =20
>  err_en_sriov:
> +	pf->sriov_enabled =3D false;

[Severity: Medium]
Could this error path leave leaked state and cause data races?

If pci_enable_sriov() fails after partially creating VFs, a VF driver that
successfully bound to one of the created VFs could have sent a registration
message, setting its bit in link_status_ms_mask.

Here, pf->sriov_enabled is set to false without acquiring msg_lock, and
link_status_ms_mask is not cleared. Could this leaked bit cause future
physical link toggles to mistakenly attempt to notify an unregistered VF,
resulting in a 200ms delay timeout on the link toggle?

>  	enetc_msg_psi_free(pf);
>  err_msg_psi:
>  	pf->num_vfs =3D 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D3
