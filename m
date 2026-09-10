Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC785453A45
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 10:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036651; cv=none; b=PtZWCRFGbDWuChst/UOSACH38f8rMMWVq3YftREEInuDrj6wOvX7DQQxyzgTsYQJRVOm28fzP9JOsEm9RTreY5V/jz02skZyuxbpv/vjWR0pNWkEVsSj261g/NHTzRGUQ2bai0kUWwfVBXvGt0IEIuCtWdTYl2hGtY65ub+HGx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036651; c=relaxed/simple;
	bh=AY3ufCsH1Lqld/IeCD6KF5QtmZCIFD6D/ky5oIYSVuw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RpQPGEvbJKh5nHdtquNVuWLktkeqzCS7ve1oDVzRQQvowlZBHKfod77v7RnJkf6yMJOJQcxohOROhOPFZbNJfpbThyEwLhipCF4r4pIFTdAIYK3dpRGZPFGNXzqJEjbwCMkh6jJTodb7TG9K/6nVO9OB5Y8umSHSZ91hy2NlmEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ilmmaDHP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ilmmaDHP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2ECA91F000FF;
	Thu, 10 Sep 2026 10:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036649;
	bh=r1FR7m5s7mZ16asm9xBWkFcwv5SmnqtyikEGiZ1rRPI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ilmmaDHPkUsRBrfzXfHEOt8SewTFeFeRqDWLgMsHx1sVMES23QKrtWCXSCTnS0x7x
	 pIE5GENUh2uqnBhpNgw1bsXiHrPKz5XbQa4OUev8h0muYUgkJex5V9QZYcwkz1sCb5
	 dMNMsbffyLSujPghah9DL+RcRcD9jxbFy4Nx14alJCU17R0yQlW1fz1CntZn+3/Oc8
	 OjPdCWPRATolRifUyUF6xRfain7N7ZpfouYaaRA+p8JNPyJjtoVtd+mrtcso7SJtDW
	 oZc2dmq7lWDhNWHBcl79c09HtXjKj2MnusER2lCnna9xwF2TtlvnAhONrnv5MMTqJl
	 Br1mgu32kFTqg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 13/15] net: enetc: implement
 ndo_set_rx_mode_async for ENETC v4 VF
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260909100733.1139689-14-wei.fang@oss.nxp.com>
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
 <20260909100733.1139689-14-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:37:28 +0000
Message-Id: <20260910103729.2ECA91F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

New issues:
- [High] Denied promiscuous mode requests for untrusted VFs silently ignore=
 explicit unicast/multicast hash filters, breaking network connectivity.
- [Medium] Unprivileged untrusted VF users can cause kernel log spam on the=
 VF because `dev_err` is unconditionally called upon expected permission de=
nials.

Pre-existing issues:
- [High] Out-of-bounds heap read in the PF driver when parsing mailbox mess=
ages with small lengths.
--

commit 331bb6ea55d892bf41dde3d27d3bf84892beac5c
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: implement ndo_set_rx_mode_async for ENETC v4 VF

This commit implements ndo_set_rx_mode_async for ENETC v4 VFs to handle
MAC filter changes asynchronously. It adds helpers to send promiscuous
mode and MAC hash filter messages to the PF over the VSI mailbox.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_vf.c
> index 322705202d49b..8cf38c426dae3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
[ ... ]
> @@ -213,6 +213,193 @@ static int enetc_vf_setup_tc(struct net_device *nde=
v, enum tc_setup_type type,
>  	}
>  }
> =20
> +static int enetc_vf_set_mac_promisc(struct enetc_si *si, int type,
> +				    bool promisc, bool flush_macs)
> +{
[ ... ]
> +static int enetc_vf_enable_iff_promisc(struct enetc_si *si)
> +{
> +	int err;
> +
> +	err =3D enetc_vf_set_mac_promisc(si, ENETC_MAC_FILTER_TYPE_ALL,
> +				       true, true);
> +	if (err)
> +		dev_err(&si->pdev->dev,
> +			"Failed to enable promiscuous mode, err: %pe\n",
> +			ERR_PTR(err));

[Severity: Medium]
When expected permission denials occur, does the unconditional use of
dev_err() override the intended silent failure path in the underlying
message sender, causing log spam?

If an admin has set IFF_PROMISC or IFF_ALLMULTI, any subsequent
unprivileged user action that updates multicast lists (e.g.
IP_ADD_MEMBERSHIP) triggers a netdev rx mode sync, resulting in a -EACCES
and a log print. Could this be used by local unprivileged users to cause
a local DoS or log spam on the VF?

> +
> +	return err;
> +}
> +
> +static int enetc_vf_disable_iff_promisc(struct enetc_si *si,
> +					struct netdev_hw_addr_list *uc,
> +					struct netdev_hw_addr_list *mc)
> +{
[ ... ]
> +static int enetc_vf_enable_iff_allmulti(struct enetc_si *si,
> +					struct netdev_hw_addr_list *uc)
> +{
> +	int err;
> +
> +	err =3D enetc_vf_set_mac_promisc(si, ENETC_MAC_FILTER_TYPE_MC,
> +				       true, true);
> +	if (err) {
> +		dev_err(&si->pdev->dev,
> +			"Failed to enable multicast promiscuous mode, err: %pe\n",
> +			ERR_PTR(err));

[Severity: Medium]
Will this also cause log spam when multicast promiscuous mode requests are
predictably denied for the same reasons as above?

> +		return err;
> +	}
> +
[ ... ]
> +static int enetc_vf_set_rx_mode(struct net_device *ndev,
> +				struct netdev_hw_addr_list *uc,
> +				struct netdev_hw_addr_list *mc)
> +{
> +	struct enetc_ndev_priv *priv =3D netdev_priv(ndev);
> +	struct enetc_si *si =3D priv->si;
> +	int err;
> +
> +	if (ndev->flags & IFF_PROMISC)
> +		err =3D enetc_vf_enable_iff_promisc(si);
> +	else if (ndev->flags & IFF_ALLMULTI)
> +		err =3D enetc_vf_enable_iff_allmulti(si, uc);
> +	else
> +		err =3D enetc_vf_disable_iff_promisc(si, uc, mc);
> +
> +	/* If the error code is -EOPNOTSUPP or -EACCES or -EPERM, return 0
> +	 * directly to avoid meaningless retries.
> +	 */
> +	if (err =3D=3D -EOPNOTSUPP || err =3D=3D -EACCES || err =3D=3D -EPERM)
> +		return 0;

[Severity: High]
When promiscuous mode is denied for an untrusted VF, will this code
silently drop explicitly requested unicast and multicast addresses?

Since enetc_vf_set_rx_mode() catches the -EACCES error from the PF and
returns 0 without attempting to fallback and program the explicit address
lists, could this cause the VF to drop legitimate traffic (e.g. IPv6
Neighbor Discovery) when promiscuous mode requests fail?

> +
> +	return err;
> +}

[Severity: High]
This is a pre-existing issue, but when an untrusted VF sends a mailbox
message with an artificially small length, does it cause an out-of-bounds
heap read in the PF driver?

Looking at enetc_msg_handle_rxmsg() in
drivers/net/ethernet/freescale/enetc/enetc_msg.c, it allocates a buffer
whose size depends entirely on the VF-controlled len field without
enforcing a minimum size:

	msg =3D kzalloc_objs(*msg, msg_size);

Then, in enetc_msg_set_vf_mac_hash_filter(), the code validates len !=3D 0
but fails to ensure the buffer is large enough for the array dereferences
up to index 3:

	case ENETC_MAC_FILTER_TYPE_ALL:
		if (!msg->hdr.len) {
			pf_msg =3D ENETC_PF_MSG_INV_LEN;
			goto vf_state_unlock;
		}

		uc_hash =3D (u64)msg->hash_tbl[1] << 32 | msg->hash_tbl[0];
		mc_hash =3D (u64)msg->hash_tbl[3] << 32 | msg->hash_tbl[2];

If a VF sends ENETC_MSG_SET_MAC_HASH_TABLE with len=3D1, it will read past
the allocated buffer bounds. Can this be used by an unprivileged untrusted
VF to directly attack the host PF?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909100733.1139=
689-1-wei.fang@oss.nxp.com?part=3D13
