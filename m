Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899963C1961
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171259; cv=none; b=e8+3YmK6Dh6ObG3okIuCSDI3vjeBl4W5kmr6+gk2LN032F7ps+tm1WdWyuppfTGzm7Mx59nazjQ7gNDSIdDsqftTL+P5ws8O+PtQaidjlhxTkjNVtT13wair1hmnFRN/UkgzY//ZMju0ykybUYVzMBrjRnAXhcBOZtUyjt32BgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171259; c=relaxed/simple;
	bh=Wo/a/djCBW+OMLVyOKnm2qHEx12dbePLaCcV/f77Y7M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ZRcrtB7LHO9FESpWdW2xUv2dNj7dK/a8OL3wdenll7BkL+nigX85VGUqW1yUquY2OtaVCePetblBe15ISqtV5SpX9kuWKS6rQ87F52sGqLra6WwAiI0OqBdYvzzIaaKYWkZ4P3Mgc6b8Ss9Vv/sGgxhWaqt4mUY8U2XwG7n533U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D4JHLdI1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D4JHLdI1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30AD21F00898;
	Thu, 11 Jun 2026 09:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171258;
	bh=s9ABDiPbYVFy5QrViqW2m39m4VXK+khpyiUMIEcrFH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=D4JHLdI1IJmRMt4DYZGh6/VQw36+IgcaCb6uSRDnwC3n10goDm1muzLao33AlSGMX
	 m7K8DbBPbVRTzKsLbsmwloEfb+wrNwRRq3eGT7SeWgR67u6ty6l2toDybbUD38w3vm
	 ZM/MrZdcOSEDrBeqKWL6sO8Gd0/F6dyYkf1ABb5ezlMoIJMCEZ8w86+9mHP12GwOBQ
	 nCbkxN8s5f6qJy34JtpQ20BU0/i4EgVc77ZVV71TBKrH50bxpohbiWxwh/BTtsJqba
	 wDT4XMy1W+V5mXv2B2jvurEbhS2YSMUCpoNnqMaXf8xI4qcNNM+2ZGzrXlSUntsrZz
	 1VRRNw58FUfFQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 09/15] net: enetc: add MAC address filtering
 support for VFs of ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-10-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-10-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:37 +0000
Message-Id: <20260611094738.30AD21F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Missing message length validation causes an out-of-bounds heap rea=
d when an untrusted VF configures multicast MAC hash filters.
- [Medium] Revoking a VF's trusted status fails to clear its multicast hash=
 filter, allowing it to retain permissive multicast filtering.
--

commit 77c31d3d766f02fd9aa7d5c04ff2e5bdf2b6e12e
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add MAC address filtering support for VFs of ENETC v4

This commit adds VSI-to-PSI mailbox message support to allow VFs to request=
=20
MAC filter configurations from the PF, including hash tables and promiscuou=
s=20
modes. It updates message handling, trust checks, and hardware register=20
access to enforce permissions securely.

> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -111,6 +113,139 @@ static u16 enetc_msg_set_vf_primary_mac_addr(struct=
 enetc_pf *pf, int vf_id,
[ ... ]
> +static u16 enetc_msg_set_vf_mac_hash_filter(struct enetc_pf *pf, int vf_=
id,
> +					    void *vf_msg)
> +{
[ ... ]
> +	switch (type) {
> +	case ENETC_MAC_FILTER_TYPE_UC:
> +		if (!trusted) {
> +			pf_msg =3D ENETC_PF_MSG_PERM_DENY;
> +			goto vf_state_unlock;
> +		}
> +
> +		uc_hash =3D (u64)msg->hash_tbl[1] << 32 | msg->hash_tbl[0];
> +		pf->ops->set_si_mac_hash_filter(hw, si_id, UC, uc_hash);
> +		break;
> +	case ENETC_MAC_FILTER_TYPE_MC:
> +		mc_hash =3D (u64)msg->hash_tbl[3] << 32 | msg->hash_tbl[2];
> +		if (!trusted && hweight64(mc_hash) > 8) {

[Severity: High]
Does this path miss a message length validation?

If msg->hdr.len =3D=3D 0, the allocated buffer size is 32 bytes (via
ENETC_MSG_SIZE(0)). The hash_tbl array starts at offset 20. Reading
msg->hash_tbl[3] accesses bytes 32-35, which is an out-of-bounds heap read
past the 32-byte allocation.

The ENETC_MAC_FILTER_TYPE_ALL case explicitly checks !msg->hdr.len
before accessing hash_tbl[3]. Should the ENETC_MAC_FILTER_TYPE_MC case
have the same check to prevent untrusted VFs from triggering KASAN faults
or leaking adjacent heap memory?

> +			pf_msg =3D ENETC_PF_MSG_PERM_DENY;
> +			goto vf_state_unlock;
> +		}
> +
> +		pf->ops->set_si_mac_hash_filter(hw, si_id, MC, mc_hash);
> +		break;
[ ... ]
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf_common.c
[ ... ]
> @@ -476,11 +477,25 @@ int enetc_pf_set_vf_trust(struct net_device *ndev, =
int vf, bool setting)
>  	vf_state =3D &pf->vf_state[vf];
>  	mutex_lock(&vf_state->lock);
> =20
> -	if (setting)
> +	if (setting) {
>  		vf_state->flags |=3D ENETC_VF_FLAG_TRUSTED;
> -	else
> +	} else {
>  		vf_state->flags &=3D ~ENETC_VF_FLAG_TRUSTED;
> =20
> +		/* Clear unicast hash filter and disable MAC promiscuous modes
> +		 * if the VF is untrusted.
> +		 */
> +		if (pf->ops->set_si_mac_hash_filter)
> +			pf->ops->set_si_mac_hash_filter(hw, vf + 1, UC, 0);

[Severity: Medium]
Should this trust revocation path also clear the multicast hash filter?

Untrusted VFs are strictly restricted to an 8-bit multicast hash filter
(hweight64(mc_hash) <=3D 8), while trusted VFs can set a permissive 64-bit
filter.

When ndo_set_vf_trust() clears the trusted flag, the unicast filter is
correctly zeroed, but the hardware's multicast filter is left intact.
Doesn't this allow a newly untrusted VF to retain its previously configured
permissive 64-bit multicast filter, bypassing the intended security policy?

> +
> +		mutex_lock(&pf->msg_lock);
> +		if (pf->ops->set_si_mac_promisc) {
> +			pf->ops->set_si_mac_promisc(hw, vf + 1, UC, false);
> +			pf->ops->set_si_mac_promisc(hw, vf + 1, MC, false);
> +		}
> +		mutex_unlock(&pf->msg_lock);
> +	}
> +
>  	mutex_unlock(&vf_state->lock);
> =20
>  	return 0;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D9
