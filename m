Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCC52EEE60
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233041; cv=none; b=ioV+5DbfVdQCENETPSiS3bDteIZcIziF7bctxIxfQB9lmcEhJ11ycKQ8gjPchwuQlB8fyzibrc3FPr1io37ShePnzNOSeB/jIP+BaiznysDt8TFMfcZQLiRCed0KQNkrwLkwh8z2EbUlGCxCuVs5Ztw6myRomTp2H9YqmaChIEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233041; c=relaxed/simple;
	bh=N0EkunYoLumQyS6IfQjGxbyNtFKPcQz8K5oxl2nlQ2Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=By6H1/5E1FUp4lc3v07bWHBgHcp1xEUikwfBnJIDslbM7nHIxVWjnBphmlu/RDc6DUNJoC4oVU4MuqERLPAalHt7lRxos8q/KgK0rFbv7J2ITg+u0Elu1lbKCA/xE4A5G6j9hq3SzzLzzP6BHhfMwRIiLikHIx3JbWfoP7akU/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b6u28J5O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b6u28J5O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 788A11F00A3E;
	Tue,  1 Sep 2026 03:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788233039;
	bh=ZOHDy1FAdq5OMccH6rrNIKXs4eBeZZNCVweIhehUWes=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=b6u28J5Onia+BRkDFNKp80K6BnyOva1k25oxbiSGND5L6U7yMaegR7XVyU6k5jHqP
	 q3o11my1rhIBQTmgC7y7UU+R2spwZAc6SYX2SGMs/XCwSOtZ45XGDkhTJJ97hHoeHR
	 V4VIVtOYRpbYqqG+SJ2e3rhasYExKX4g53sfbqqU+BCBifDn2n2OZfA95kuHgg68zr
	 KcC7I6GDAZYuHA6KsBeP2w8OVLcC4XOrKQB/tRYRWV3QloMkpngK0eC5OBtwv7v3hq
	 c05nX23ie6tjVIuOkns0ECeEXNvbfE9vKPS0nPDhPBQVHem25bNSBgIAZFYZp3QoOO
	 EyLkApD/DAm9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 03/15] net: enetc: add link status message
 support to PF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831025441.635045-4-wei.fang@oss.nxp.com>
References: <20260831025441.635045-1-wei.fang@oss.nxp.com>
 <20260831025441.635045-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:23:59 +0000
Message-Id: <20260901032359.788A11F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Denial of Service via Synchronous Polling of Untrusted VF
- [High] Logic Error and TOCTOU Race Permanently Dropping Link State Notifi=
cations
--

commit 0897c02e67549130fea1a46e3080e9af30c83727
Author: Wei Fang <wei.fang@nxp.com>

    net: enetc: add link status message support to PF driver
   =20
    Add link status message support to the PF driver using three command IDs
    under message class 0x80 (ENETC_MSG_CLASS_ID_LINK_STATUS).

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index a89a5a418a23d..e21414acdc0d0 100644
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
> +	 * read the last message, PF cannot send new message to the VF. To
> +	 * avoid sending messages to such a VF, the bit corresponding to VF
> +	 * is cleared from ms_mask. Because the MS bit can only be written
> +	 * as 1, writing a 0 has no effect. Writing a 1 when the bit is
> +	 * already set is undefined.
> +	 */
> +	ms_status =3D enetc_rd(hw, ENETC_PSIMSGSR) & 0xffff;
> +	ms_mask &=3D ~ms_status;
> +	if (!ms_mask)
> +		return -EIO;

[Severity: High]
Does this logic introduce a time-of-check to time-of-use race condition?

If a VF acknowledges a previous message by clearing its MS bit immediately
after ms_status is read, the mask will remain zero and this early return
will prevent the link state from being updated.

Because the early return prevents the shared MC payload from being updated
in hardware, and there is no retry logic, will the VF receive the old link
state when it eventually reads the register and be left permanently out of
sync with the PF?

> +
> +	if (ms_mask !=3D old_ms_mask)
> +		dev_warn_ratelimited(&pf->si->pdev->dev,
> +				     "PF cannot send message to VF(s) 0x%x\n",
> +				     ms_mask ^ old_ms_mask);
> +
> +	enetc_wr(hw, ENETC_PSIMSGSR,
> +		 FIELD_PREP(PSIMSGSR_MC, msg_code) | ms_mask);
> +
> +	return read_poll_timeout(enetc_rd, val, !(val & ms_mask), 1000,
> +				 200000, false, hw, ENETC_PSIMSGSR);

[Severity: High]
Can an untrusted VF use this synchronous polling to intentionally stall the
PF's execution thread?

This blocks for up to 200ms waiting for the VF to acknowledge the message.
Since this is reachable by untrusted VFs (e.g., running in a VM), can a
malicious VF ignore the message and tie up the PF thread?

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
> +	enetc_msg_notify_vf_link_status(pf, PSIMSGSR_MS(vf_id));

[Severity: High]
Does calling enetc_msg_notify_vf_link_status() here block other mailbox
operations?

Because enetc_msg_notify_vf_link_status() eventually calls
enetc_pf_send_msg() which can poll for 200ms, and we are holding
pf->msg_lock, will a slow or malicious VF block all other VF mailbox
operations and link state processing for this PF?

> +
> +msg_unlock:
> +	mutex_unlock(&pf->msg_lock);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831025441.6350=
45-1-wei.fang@oss.nxp.com?part=3D3
