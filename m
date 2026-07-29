Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB91230DD2F
	for <imx@lists.linux.dev>; Wed, 29 Jul 2026 02:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785292158; cv=none; b=CeaP8YbbDaVhG1ziggEnMtSl2GwRWA5hF5zvAzRMVoL18xtocPmj9jErumh5Ek2lfdXr1TZetLHiEc/DQ5+l89aGhuiPopfJsMTCknqGZfNjoD1dnoQfPBdjri6yQTy80WoGte7uvzz79Jaa21aZEXwcM0WIqoKfkIWZBDYuPU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785292158; c=relaxed/simple;
	bh=YQBIly9BnBCj2nVcCO01MjRqbTo/Zy81FNNwpeCyWAo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=T7GCpPQf7hM4EPSTOtUzJddjNOZOu0Dg0wFUfZxDwtjO6zDUGr1ZTQu3+mU2joCsxLyhpdxDyn2WQelVRMZKBnYvRukaqfr63Ty7HDVXfdHYXVHozrmvnRXd9yyI9Uou2t6n2VgYMrFR8h/gTJum50RV38mD9036MFEdiH1LCkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZpUTORk3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZpUTORk3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490F91F000E9;
	Wed, 29 Jul 2026 02:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785292156;
	bh=K12VBsrRlCDNEDV/U/h/gwlb8gK6cvOErZ5ocTCS8GI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZpUTORk3HTOYgo7P00mKs3WEyxB4LlET8euOVKo9fbw7KeUEDmR6F7dryX1AAPZPV
	 8xaxFlD8Y8nsr4CRwmj3eN9KXLVfDXjYtQNLtW8kgc8cffKFoDFBQBYdQb1RwYZ1yq
	 2wpMLFjkRsBuXEosKJ0+6JYdTBOl67L0NpaZzlfs39G0/DGFzvExYpCKR9xP+NL8Kg
	 +pqvJ4RKiZ3WBbHeVaAnvVJ3RhJb8uRCr7GMTi9QnKHZajVC8GuE9LzBPR6VhOqGf0
	 EsWNeHipXukHfCh07ZLlizJ1E2fK+GfDo4eR3SlhWnQh5m0SPSTk31G8Mmbyweo0/u
	 cx+JU35e6wGQQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/2] net: enetc: restore RX ring congestion mode for
 ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260728023217.2499420-3-wei.fang@oss.nxp.com>
References: <20260728023217.2499420-1-wei.fang@oss.nxp.com>
 <20260728023217.2499420-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 29 Jul 2026 02:29:15 +0000
Message-Id: <20260729022916.490F91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

New issues:
- [High] State desynchronization due to TOCTOU race condition updating the =
newly added software flag.

Pre-existing issues:
- [Critical] Unprotected read-modify-write of hardware registers leads to D=
MA memory corruption (Use-After-Free).
--

--- Patch [2]: [PATCH net 2/2] net: enetc: restore RX ring congestion mode =
for ENETC v4 ---
commit c984fc5e7d3c90c2dfd0f53ae9ad32adf715c689
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: restore RX ring congestion mode for ENETC v4

This commit fixes an issue where the RX BD ring congestion mode is cleared
when RX BD rings are rebuilt at runtime without a link status change. It
tracks the desired CM state in the software flag ENETC_RXBDR_CM so it can
be restored during reconfiguration.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 437a15bbb47ba..8db5a47fdbae4 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -748,6 +748,7 @@ static void enetc4_set_rx_pause(struct enetc_pf *pf, =
bool rx_pause)
> =20
>  static void enetc4_set_tx_pause(struct enetc_pf *pf, int num_rxbdr, bool=
 tx_pause)
>  {
> +	struct enetc_ndev_priv *priv =3D netdev_priv(pf->si->ndev);
>  	u32 pause_off_thresh =3D 0, pause_on_thresh =3D 0;
>  	u32 init_quanta =3D 0, refresh_quanta =3D 0;
>  	struct enetc_hw *hw =3D &pf->si->hw;
> @@ -764,6 +765,8 @@ static void enetc4_set_tx_pause(struct enetc_pf *pf, =
int num_rxbdr, bool tx_paus
>  	int i;
> =20
>  	for (i =3D 0; i < num_rxbdr; i++) {
>  		old_rbmr =3D enetc_rxbdr_rd(hw, i, ENETC_RBMR);
>  		rbmr =3D u32_replace_bits(old_rbmr, tx_pause ? 1 : 0, ENETC_RBMR_CM);
>  		if (rbmr =3D=3D old_rbmr)
>  			continue;
> =20
>  		enetc_rxbdr_wr(hw, i, ENETC_RBMR, rbmr);
>  	}

[Severity: Critical]
This is a pre-existing issue, but could this unprotected read-modify-write
lead to memory corruption if it races with enetc_disable_rxbdr()?

If phylink_resolve() executes enetc4_set_tx_pause() concurrently with
enetc_reconfigure(), this loop can read ENETC_RBMR before the ring is
torn down.=20

If it writes the modified value back after enetc_disable_rxbdr()
clears the enable bit, it would inadvertently re-enable the RX ring in
hardware:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_disable_rxbdr() {
    ...
    /* disable EN bit on ring */
    enetc_rxbdr_wr(hw, idx, ENETC_RBMR, 0);
    ...
}

Because the software frees the associated DMA buffers during teardown, the
hardware would then DMA incoming packets directly into freed memory.

> =20
>  	if (tx_pause) {
> +		set_bit(ENETC_RXBDR_CM, &priv->flags);
> +

[Severity: High]
Can this result in the software state and hardware register becoming
desynchronized?

Since ENETC_RXBDR_CM is set after the hardware registers are updated in the
loop above, there appears to be a race window. If enetc_setup_rxbdr() is
called by a concurrent enetc_reconfigure() during this window, it would
see the unset flag:

drivers/net/ethernet/freescale/enetc/enetc.c:enetc_setup_rxbdr() {
    ...
    if (test_bit(ENETC_RXBDR_CM, &priv->flags))
        rbmr |=3D ENETC_RBMR_CM;
    ...
}

This would overwrite the hardware register without the CM bit. Then this
thread sets the software flag, leaving flow control disabled in hardware
when the software state expects it to be enabled.

>  		/* When the port first enters congestion, send a PAUSE request
>  		 * with the maximum number of quanta. When the port exits

[ ... ]

> @@ -949,7 +954,10 @@ static void enetc4_pl_mac_link_down(struct phylink_c=
onfig *config,
>  				    phy_interface_t interface)
>  {
>  	struct enetc_pf *pf =3D phylink_to_enetc_pf(config);
> +	struct enetc_ndev_priv *priv;
> =20
> +	priv =3D netdev_priv(pf->si->ndev);
> +	clear_bit(ENETC_RXBDR_CM, &priv->flags);
>  	enetc4_mac_rx_graceful_stop(pf);
>  	enetc4_mac_tx_graceful_stop(pf);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260728023217.2499=
420-1-wei.fang@oss.nxp.com?part=3D2
