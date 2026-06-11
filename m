Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 718603C4B6A
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171262; cv=none; b=mhHriXEJKKqCMkBUb9wmNymKEUXsw1cPd0ZLZusAW6+lQ+Vi3G86h9DLumIMHXz5ikdKDAsp6+I6uPNR94MYfdIIbnn1dKOkD/65x5hU0cEfFdxXMTSQMEJY9OVHyslR+JTFvvz9S//R8MqNOGKPsk+GmL6s2OXzH/GnKyGzMqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171262; c=relaxed/simple;
	bh=ZLsiaC4LdKugu7rkqCocpvMfg7owXfip97XGMlQzWHw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ui+rTsdXx179xDWdezF2FLRB1jtWl/f730rvekYCBcDfIMNI++FJgYauAlEmDKrASBtwHjJz+RacT1Q1B3+0wivpd3i9m+ZKkWeeWYzWVNSODJczGF+heGHP6xfPdvOWgEbTHBiqi0hpaU9csEsL6aOsNlQ2GdxdYN+XnCYXxeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FqwA+Pda; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FqwA+Pda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD94F1F00898;
	Thu, 11 Jun 2026 09:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171261;
	bh=sqU1R6VXVNPGo9XBmlxg//TY3Bjp+Fxu0v4e8LlpJlE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FqwA+PdaXUsm31GgFLqzTZIMHRckzI18fCKQWfKJ5QNfIbXjNO2+NiXe31P8VXHFZ
	 xxFjIgDj1ilZ55u4ZzY0m00nxi3HPTQ0klfYh0gHCRFgL3TLupeK3rLqT6M4t1VAU6
	 xiw/PV/iGI2nD12bvAP6Vvovz/uwAdphd+5A1OAFCXR3ibhQJiNYNRoiaBIHfIm9k3
	 BaKUgut4Eethy2AkUEts70xWyV4MN94tiLsbxjJpGpJz7s8YbbMCpbX9TyUdK8N/i3
	 KKXqCdtnY0BEqQBSLx/xdDhc2WVllqlHM2uzvfSUpQW/6OwijegMVfLD4SbmQfdjlw
	 QatHn9MSWMNFw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 11/15] net: enetc: restore VF MAC
 promiscuous mode after FLR for ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-12-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-12-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:39 +0000
Message-Id: <20260611094740.CD94F1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Untrusted VFs retain expansive multicast hash filters when trust i=
s revoked.
- [Low] Comment logic inversion regarding PF-set flags in `enetc_msg_psi_fr=
ee`.
--

commit 39a4c53c34896221262cf925fccff9665bc34780
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: restore VF MAC promiscuous mode after FLR for ENETC v4

This commit addresses a security vulnerability on ENETC v4 where a VF FLR
resets the MAC promiscuous mode to enabled. The patch tracks the PF-managed
promiscuous state, updates it on VF requests and trust revocation, and adds
an FLR handler to restore the tracked state after an FLR.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -725,8 +765,21 @@ static void enetc_msg_psi_free(struct enetc_pf *pf)
>  	/* PSIIER interrupts may be re-enabled by workqueue */
>  	enetc_disable_psiier_interrupts(pf);
> =20
> -	for (i =3D 0; i < pf->num_vfs; i++)
> +	for (i =3D 0; i < pf->num_vfs; i++) {
> +		struct enetc_vf_state *vf_state =3D &pf->vf_state[i];
> +
>  		enetc_msg_free_mbx(si, i);
> +
> +		/* VF may set these flags by mailbox messages, so need to
> +		 * clear these flags when enetc_msg_psi_free() is called.
> +		 * Flags set by PF are cleared, because these flags are
> +		 * unrelated to whether SR-IOV is enabled or disabled.
> +		 */

[Severity: Low]
This isn't a bug, but should the comment say "Flags set by PF are NOT
cleared"?

The bitwise AND operation below exclusively clears the promiscuous flags
set by the VF while preserving flags set by the PF, such as
ENETC_VF_FLAG_TRUSTED.

> +		mutex_lock(&vf_state->lock);
> +		vf_state->flags &=3D ~(ENETC_VF_FLAG_UC_PROMISC |
> +				     ENETC_VF_FLAG_MC_PROMISC);
> +		mutex_unlock(&vf_state->lock);
> +	}
>  }

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c b/dri=
vers/net/ethernet/freescale/enetc/enetc_pf_common.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
[ ... ]
> @@ -480,7 +480,9 @@ int enetc_pf_set_vf_trust(struct net_device *ndev, in=
t vf, bool setting)
>  	if (setting) {
>  		vf_state->flags |=3D ENETC_VF_FLAG_TRUSTED;
>  	} else {
> -		vf_state->flags &=3D ~ENETC_VF_FLAG_TRUSTED;
> +		vf_state->flags &=3D ~(ENETC_VF_FLAG_TRUSTED |
> +				     ENETC_VF_FLAG_UC_PROMISC |
> +				     ENETC_VF_FLAG_MC_PROMISC);
> =20
>  		/* Clear unicast hash filter and disable MAC promiscuous modes
>  		 * if the VF is untrusted.
>  		 */

[Severity: High]
Does this leave untrusted VFs with an expansive multicast hash filter when
trust is revoked?

When a VF is trusted, it can set a broad 64-bit multicast hash filter,
while untrusted VFs are restricted to 8 bits. When an administrator revokes
trust, the PF clears the unicast hash filter and disables MAC promiscuous
modes, but it doesn't appear to clear the multicast hash filter here.

Could a previously trusted VF retain its expansive multicast hash filter
after trust is revoked, bypassing the security policy?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D11
