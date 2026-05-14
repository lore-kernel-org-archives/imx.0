Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE211238C1A
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756305; cv=none; b=lCwhpFdcnWIfrQtKiIivuxUNPWidJv5WuA5xk4mnylzp9/lFHTKx6ztngZp93vyhMNemizS9oBPnWG+v51kG1nMzzhe9JHcll8K/8a0HPzC+fAcq3PiswaRq4f7QJ/450HBZL6m2pPWlHNeyZFcLEgiqlIHwzf03HXMTxSV5280=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756305; c=relaxed/simple;
	bh=Zy6CDyIG48Ok7FIVr9qyyRIDlJJw/aO66ldCfsgpdKM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jjeXNbADutqd4aEsuyGM28KLWh1w1J8sYKIWKW4XEoB8t6jGl2cjRJL4bNKBstK2CFI8bNF9oQyp2dJ7d4sWB1mzBSQIzhYhU0eockfw9g/8m28FpIww5mensVvV68OaDkq/gw5iEDuH7lwWNioLKdI7tdwMZ/RsZxbj4gjGq4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EQIypqYb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EQIypqYb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BC18C2BCB3;
	Thu, 14 May 2026 10:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756304;
	bh=Zy6CDyIG48Ok7FIVr9qyyRIDlJJw/aO66ldCfsgpdKM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=EQIypqYbBpx2yOPEV5EJizUR3qAyWgT5KgR3g8Cf56rXsloyeEm5V17U8wy+nfLZY
	 IgvxCx5JXjtVjsudDmLYM1Nr3+lK4DgaVa5YaeK1Un/Bq9S39MFZY+nuXspXlaVhxa
	 PJNuw4yH/jw4RKWoo1ur75L7Apqpf+yJhth9ByDAdN6wnu9NE+m/D5yNrZPaz1DEVp
	 u0u6KCzV48cIe/u6KO0Zux+NNyDY4ZuiPfreggsI0/lbFWvxnRh0DnMyQ8Avg4GVt+
	 huvBCJL7rFmTUQ5Y6FA+Byejp54cqcqPvMKv7AmLwN0n7KugFbh1Ytv2Hviw1F+m10
	 xM3SkKxB4sJ/Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 6/6] net: enetc: add ratelimiting to VF mailbox
 error messages
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260513103021.2190593-7-wei.fang@nxp.com>
References: <20260513103021.2190593-7-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:23 +0000
Message-Id: <20260514105824.4BC18C2BCB3@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] The VF MAC address is validated directly from a shared DMA buf=
fer, allowing a malicious guest VM to bypass validation via a Time-Of-Check=
 to Time-Of-Use (TOCTOU) race condition.
- [High] The unbounded loop in `enetc_msg_task()` allows a malicious guest =
VM to cause a CPU soft lockup on the host, leading to a Denial of Service.
--

commit 88150cd0493bf6368f09cabbbd2a6aba99ee0cf5
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add ratelimiting to VF mailbox error messages

This commit replaces dev_err() and dev_warn() with their ratelimited
counterparts in the vf-to-pf messaging paths. The change aims to prevent
a buggy or malicious guest vm from flooding the host kernel log. This
ensures errors remain debuggable while mitigating log flooding attacks.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> Sashiko reported that a buggy or malicious guest VM can flood the host
> kernel log by repeatedly sending VF-to-PF messages at a high rate,
> degrading host performance and hiding important system logs [1].

This isn't a regression introduced by this patch, but does the unbounded
loop in enetc_msg_task() still allow a malicious guest vm to cause a cpu
soft lockup on the host?

In enetc_msg_task(), vf messages are processed within an unbounded loop:

drivers/net/ethernet/freescale/enetc/enetc_msg.c:enetc_msg_task() {
    ...
	for (;;) {
		mr_mask =3D enetc_rd(hw, ENETC_PSIMSGRR) & ENETC_PSIMSGRR_MR_MASK;
		if (!mr_mask) {
    ...
}

If a malicious guest vm continuously sends messages at a high rate, the vf
can instantly send another as soon as the pf acknowledges a message.

Because the worker thread never yields (e.g., via cond_resched()) or enforc=
es
a processing budget, would the mr_mask check frequently evaluate to non-zer=
o,
causing the pf to spin indefinitely?

Could this monopolize the host cpu core running the workqueue, leading to a
watchdog soft lockup and a guest-to-host denial of service?

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index 052cab48df514..73a899b00308b 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -505,8 +505,9 @@ static u16 enetc_msg_pf_set_vf_primary_mac_addr(struc=
t enetc_pf *pf,
> =20
>  	mutex_lock(&vf_state->lock);
>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC)
> -		dev_warn(dev, "Attempt to override PF set mac addr for VF%d\n",
> -			 vf_id);
> +		dev_warn_ratelimited(dev,
> +				     "VF%d attempted to override PF set MAC\n",
> +				     vf_id);
>  	else
>  		enetc_pf_set_primary_mac_addr(&pf->si->hw, vf_id + 1, addr);

This isn't a regression introduced by this patch, but does validating the
mac address directly from the shared dma buffer allow a time-of-check to
time-of-use race condition?

The pointer addr points directly into the msg->vaddr dma buffer. The pf
validates the mac address by calling is_valid_ether_addr(addr) and then pas=
ses
the same pointer to enetc_pf_set_primary_mac_addr(), which reads the mac
address again from the dma buffer to write it to the hardware.

Could a malicious vf exploit this by writing a valid mac address to the dma
buffer to pass the validation check, and then overwriting it with an invalid
or multicast mac address before the pf writes it to the hardware registers?

Should the mac address be copied to a local stack buffer before validation?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D6
