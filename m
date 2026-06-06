Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07CE22F388
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730680; cv=none; b=rWzluQaFi7PRAW6WunLqdlHqtDWbQMRbMGIXvjqms1bfYtbD1nvGCQfgv6rkIOYMjr60Gzm5enF+TK8ZCXSLLgoSNACsvwc4SwA+TaIQznYOvT255FCtaa2RTHvaVoSiNP3/vAIvhNEuoWnYrN74CSLgCvPn2jq1Q4P4JqqGUmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730680; c=relaxed/simple;
	bh=cE9a6w/ISrtO0xhEICNj9PNXFNTmcCGlLmbUuRMGJKo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Wjv6bZCoBkJE5wVS+fk8sFAcY7mPi3Y3w6Ge9PhnNpCc6spOZCiB4RAZqN4n3vAYkqfBgihDGH1F9FqNEU/0t92GrHcTlxlHzn3z9eAI7NS1sAos1JL1Rd2zkuZmgvCgHyvCd+cmwDypnQI4W0UZslsF24w9QlaEMZcBwC/54SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Df4uTJ+m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Df4uTJ+m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50C3A1F00898;
	Sat,  6 Jun 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730679;
	bh=bv1Lo5Scb0jRV7FalIk2iPaGvDqEE8MRauAGtzPCDdE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Df4uTJ+mZUNF00UXSWGuXp6yWrPqwd2rj+D6qeDroaVdbCNHA52NkKZCQ5dMdh67Q
	 iB66lswRa37aWqTAnipvMaBMKYcv8AwUP/pHr8tZI2pyKIW37/wA8jSORxLHpzHVld
	 fUSj5BbAIO/MJWbVaHEV/L58ZIZcq1eyGv17k9f3XMbZlFDW/csalJHmgyDq5TSH5A
	 DvgOP9k5zd9B9I6RfYr7qhZbMYt4Oq+jQ7b6sPvsmtnWuEMUT81onZHi2l87FeKzTA
	 Uv54BC04TamZcbTr9xWj7v/6INbbihsLP3GQSMuc4W4CjeiG7+KUJ3u3UkWXY05IVE
	 mHrbl0H2XxOyA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 03/15] net: enetc: add link status message
 support to PF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-4-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-4-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:38 +0000
Message-Id: <20260606072439.50C3A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The `msg_lock` mutex is used uninitialized if the device does not =
support SR-IOV or if the PF initializes with 0 VFs, leading to a kernel pan=
ic or lockdep splat on link up/down.
- [High] A malicious or unresponsive VF can stall the PF's shared message h=
andler for 200ms per request, causing a Denial of Service (DoS).
- [Medium] Data race on `pf->link_status_ms_mask` during SR-IOV teardown ca=
uses a 200ms timeout on concurrent link state changes.
--

commit 7d8f9f9cc2f3db8a098f8342c6d804d1aeb36a72
Author: Wei Fang <wei.fang@nxp.com>
Date:   Fri Jun 5 06:55:38 2026 +0000

net: enetc: add link status message support to PF driver

Add link status message support to the PF driver using three command IDs
under message class 0x80 (ENETC_MSG_CLASS_ID_LINK_STATUS).

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> @@ -458,6 +458,8 @@ int enetc_init_sriov_resources(struct enetc_pf *pf)
>  	for (int i =3D 0; i < pf->total_vfs; i++)
>  		mutex_init(&pf->vf_state[i].lock);
> =20
> +	mutex_init(&pf->msg_lock);
> +
>  	return 0;
>  }

[Severity: High]
If the device does not support SR-IOV or total_vfs is 0,
enetc_init_sriov_resources() returns early:

        pf->total_vfs =3D pci_sriov_get_totalvfs(pf->si->pdev);
        if (!pf->total_vfs)
                return 0;

This skips the mutex_init() for msg_lock.

However, the phylink callbacks enetc4_pl_mac_link_up() and
enetc4_pl_mac_link_down() unconditionally call enetc_pf_notify_vf_link_up()
and enetc_pf_notify_vf_link_down().

These functions eventually reach enetc_pf_notify_vf_link_status(), which
attempts to acquire this uninitialized lock:

enetc_pf_notify_vf_link_status()
    mutex_lock(&pf->msg_lock);

Could this cause a lockdep warning or a crash when the device link comes
up or goes down and total_vfs is 0?

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> +static int enetc_pf_send_msg(struct enetc_pf *pf, u32 msg_code, u16 ms_m=
ask)
> +{
> +	struct enetc_si *si =3D pf->si;
> +	u32 val;
> +
> +	enetc_wr(&si->hw, ENETC_PSIMSGSR,
> +		 FIELD_PREP(PSIMSGSR_MC, msg_code) | ms_mask);
> +
> +	return read_poll_timeout(enetc_rd, val, !(val & ms_mask), 1000,
> +				 200000, false, &si->hw, ENETC_PSIMSGSR);
> +}
> +
> +static void enetc_msg_notify_vf_link_status(struct enetc_pf *pf, u16 ms_=
mask,
> +					    bool link_up)
> +{
[ ... ]
> +	if (enetc_pf_send_msg(pf, pf_msg, ms_mask))
> +		dev_err_ratelimited(&pf->si->pdev->dev,
> +				    "PF notifies link status failed\n");
> +}

[Severity: High]
If a VF is malicious, crashed, or improperly configured and fails to clear
its bit in ENETC_PSIMSGSR, enetc_pf_send_msg() will block the phylink worker
thread for its maximum 200ms polling timeout.

Because enetc_msg_notify_vf_link_status() only logs an error and does not
remove the unresponsive VF from pf->link_status_ms_mask, won't every
subsequent link state change also incur this 200ms stall?

Additionally, a malicious VF could spam ENETC_MSG_REGISTER_LINK_CHANGE_NOTI=
FIER
messages, forcing the PF to repeatedly call enetc_pf_send_msg() while holdi=
ng
pf->msg_lock. Could this stall the shared msg_task workqueue and starve
other VFs?

> @@ -361,6 +471,7 @@ int enetc_sriov_configure(struct pci_dev *pdev, int n=
um_vfs)
>  	if (!num_vfs) {
>  		pci_disable_sriov(pdev);
>  		enetc_msg_psi_free(pf);
> +		pf->link_status_ms_mask =3D 0;
>  		pf->num_vfs =3D 0;
>  	} else {

[Severity: Medium]
When disabling SR-IOV, pf->link_status_ms_mask is cleared outside of
pf->msg_lock and after the VFs have been disabled via pci_disable_sriov().

If a physical link state change occurs concurrently, could
enetc_pf_notify_vf_link_status() acquire the lock, observe a stale non-zero
ms_mask, and attempt to notify destroyed VFs?

Since the VFs are no longer active, they wouldn't clear their bits, causing
enetc_pf_send_msg() to inevitably timeout after 200ms. Should this mask be
cleared under the msg_lock before disabling SR-IOV?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D3
