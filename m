Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09F593C416A
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171264; cv=none; b=d9wEW4R/mNRTk1FdzwSz9S+0DAL21bYfHwaeqDjx2EKLZ9OicSLPZAazN4fcLkEi+wBGMZDWhpEfiJdk4/pMN5Mx+6OggTCIvJSMlRjqLwnxZZQUg7KzR4CBMMjPAvEt76WWcuWmeHqMGOmDigaOpLyjB3vuddQ2OgcHIyPrI2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171264; c=relaxed/simple;
	bh=TsKZaeiZG64CalLhFmdgWB0Rtb8QWxu0uc9rebg36i4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=H3WA0hmFva/7WOg4opMur0cC8RP7M8QA1DfLageK1gNQ4wT2ZvwCjV0o1NcmimGnwgMemJF9DM2MdV13ccEr5S7PyIC/P+/VjtUSlxM/wAJv2tqpy8lhT92dw5UbPyz9IKRQiU65GT6ZysBmx2MzefKQw8IfVaZqjO5uh0gH9ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aQ2siR/Y; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aQ2siR/Y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B12861F00898;
	Thu, 11 Jun 2026 09:47:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171262;
	bh=bP/9dhKvU5Eat074fcgcVAX9tKBVsGsV4qQYM8Yq2ZM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aQ2siR/YxxO3hZ42MLQ0ZQIkJ3/dHoZWWnuRuGy+TN+5kVylLXXsTzk4Frfi0COme
	 njU+o8G1gISboO6wp5WIa2EuYoZJjUKkvOiEnruS6B4u7PwhrFEfscrE+FdKwQhAIF
	 +bB4Q8r5uSaS0gqk18+nHry4VoI00vZlv9nokTBacs1oMKQmlp7zHJty3ognOAIyA+
	 y0CqoxNNeIoAMe8+/QTNnya6A2L6gCiJy//dfriurmbvtYc16k3wRkVOZGEn5RVPfq
	 S6i8x9E6htOaxbZu1vilWnpjrLSZkjY5IQwt092QWWgiM4jPxaFzlZWoSfywgOcp5j
	 jqCIMnDhSHNQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 14/15] net: enetc: add PSI-to-VSI link
 status notification support for VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-15-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:42 +0000
Message-Id: <20260611094742.B12861F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Race condition in VF message workqueue teardown leading to unhandl=
ed hardware interrupts.
--

commit 56c5e3ce01133d9549230bbfb6889bc307567cb5
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add PSI-to-VSI link status notification support for VF
   =20
This commit adds infrastructure for ENETC v4 VFs to track PF link status
changes via the PSI-to-VSI messaging channel. A dedicated MSI-X vector
handles incoming messages and schedules a work item to update the carrier
state.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index dc9a0f74a2e34..ba7686fb32ce9 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
[ ... ]
> @@ -415,6 +461,122 @@ static void enetc_vf_netdev_setup(struct enetc_si *=
si, struct net_device *ndev,
[ ... ]
> +static void enetc_vf_msg_task(struct work_struct *work)
> +{
[ ... ]
> +	/* If ndev is in the NETREG_UNREGISTERED state, return directly
> +	 * without processing the message or enabling MR interrupt. Any
> +	 * future caller that reuses this work item after the device
> +	 * returns to a registered state should enable MR interrupt again.
> +	 */
> +	if (ndev->reg_state =3D=3D NETREG_UNREGISTERED)
> +		return;
> +
[ ... ]
> +	enetc_vf_enable_mr_int(hw);
> +}

[Severity: High]
Can this task re-enable hardware interrupts after the OS IRQ handler has
been freed?

If this work item executes during a probe failure or races with
unregister_netdev() during remove, the ndev->reg_state check might not
protect it. During a probe failure, the state is NETREG_UNINITIALIZED, and
during remove, this check can race with the state change.

[ ... ]
> @@ -493,6 +683,18 @@ static int enetc_vf_probe(struct pci_dev *pdev,
[ ... ]
>  err_reg_netdev:
> +	enetc_vf_free_msg_msix(si);
> +err_register_msg_msix:
> +	enetc_vf_wq_task_destroy(si);
> +err_wq_init:
>  	enetc_free_msix(priv);

[Severity: High]
Can this teardown order cause an unhandled hardware interrupt?

If enetc_vf_free_msg_msix() frees the OS IRQ before enetc_vf_wq_task_destro=
y()
drains and disables the workqueue, the work task could run and unmask the
hardware interrupt while the handler is already gone.

Should enetc_vf_wq_task_destroy() be called before freeing the IRQ?

[ ... ]
> @@ -528,7 +734,8 @@ static void enetc_vf_remove(struct pci_dev *pdev)
> =20
>  	priv =3D netdev_priv(si->ndev);
>  	unregister_netdev(si->ndev);
> -
> +	enetc_vf_free_msg_msix(si);
> +	enetc_vf_wq_task_destroy(si);

[Severity: High]
Similar to the probe error path, does freeing the IRQ before destroying
the workqueue allow the work item to execute and re-enable the hardware
interrupt after the handler is unregistered?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D14
