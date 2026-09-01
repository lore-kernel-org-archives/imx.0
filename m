Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50FA5414A1D
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 03:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233041; cv=none; b=SpqK3ywg+Jsifp/tDUn5ZfwdQdvA2JhemgK2oFtK7FTQcb+RuaO4KFZQq64I6i4ycIk580ziVQKIpFKJw7ldGs9ocr3bVyJIvAnQs3H4L5l4WZGXd0ipv8pBUpuHVJt95AVhR0YkeWJm1QFdGxSBxXk1h8KG6v0mnM6S1mybpGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233041; c=relaxed/simple;
	bh=qVY2D0ny8MRwcZtkB/F4y7vjDSsBQGrOUolrcBMpqGM=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QfULcUP5DhC5bH+iMoFlW2Q0aynFrcYk1BF3gyLcyOjidw4JuH5JGYM9Zk7ED+s13w+M99oHZgdtRIL5vAcnXAiP1Nqzs/Y3THUrBwlQd+AY6sEzFRfuAzABDWQjxHlLeV2Z1VHzrRG0dLs2e0rPcNplz79e5fF7MUbQUaGntpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ssb1piaG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ssb1piaG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B913A1F00A3D;
	Tue,  1 Sep 2026 03:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788233038;
	bh=WWcva4MeqEF6NrmpOpP0bX3DTZmVZJqcSLpKLsnn95I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ssb1piaG3TfvRwJN/WySUBULfOv6kSWmkcD6PrQ8ohXnjTgCCfTDCKP9kXzHHGuC9
	 c/PiaHlyOb8rdjzGd5L2xW1xDTlX1s9+NsumnXrKyDF2FRCTVEyMwIk7T6BxDKW6R/
	 fyKJpvUOWwyRqiTGYdcLtE/kY4Zw9UUCjC/qftLdbWJ6brPpJkTD0h808F01XupHx6
	 PzdbRFH5k9EI7BNIkt384Uq41ctXRzMija2zIeoIS5fo51zSyRlKRPZQGpT/gS4tTI
	 L3un+Wo6VRvpR7DbWkmQidVdV6610Q6yrJ3m9pyXI2b8l0CK4kSMZHtNYThcNh8NN3
	 Su5gr6rZ9o5Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 01/15] net: enetc: add trusted VF support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831025441.635045-2-wei.fang@oss.nxp.com>
References: <20260831025441.635045-1-wei.fang@oss.nxp.com>
 <20260831025441.635045-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:23:58 +0000
Message-Id: <20260901032358.B913A1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The patch breaks standard Linux SR-IOV semantics by unconditionall=
y preventing untrusted VFs from setting their MAC addresses, and preventing=
 trusted VFs from overriding administratively set MAC addresses.
--

commit d231761f64378426562111f6fe937bf009f559c2
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: add trusted VF support

Some mailbox messages require a higher privilege level to be executed
on behalf of the requesting VF. Introduce a trusted VF flag
(ENETC_VF_FLAG_TRUSTED) and wire up the ndo_set_vf_trust callback via
enetc_pf_set_vf_trust(), which is shared between the enetc and enetc4
PF drivers.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index edc1277bb5860..78114ab3e4820 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -61,31 +63,49 @@ static u16 enetc_msg_set_vf_primary_mac_addr(struct e=
netc_pf *pf, int vf_id,
>  	struct enetc_vf_state *vf_state =3D &pf->vf_state[vf_id];
>  	struct enetc_msg_mac_exact_filter *msg =3D vf_msg;
>  	struct device *dev =3D &pf->si->pdev->dev;
> +	u16 pf_msg =3D ENETC_PF_MSG_SUCCESS;
>  	char *addr =3D msg->mac[0].addr;
> =20
> +	mutex_lock(&vf_state->lock);
> +
> +	/* Untrusted VFs cannot set their MAC addresses by the mailbox
> +	 * messages.
> +	 */
> +	if (!(vf_state->flags & ENETC_VF_FLAG_TRUSTED)) {
> +		pf_msg =3D ENETC_PF_MSG_PERM_DENY;
> +		goto vf_state_unlock;
> +	}

[Severity: High]
Does this code break standard Linux SR-IOV semantics?

By unconditionally returning ENETC_PF_MSG_PERM_DENY for untrusted VFs, VMs =
and
container frameworks that rely on the standard behavior may fail to initial=
ize
networking. Specifically, untrusted VMs that generate and set their own MAC
(when the host has not enforced one) will receive a permission denied respo=
nse
and fail. Standard drivers typically allow untrusted VFs to set their MAC if
no administrative MAC was assigned by the host.

> +
>  	if (!is_valid_ether_addr(addr)) {
>  		dev_err_ratelimited(dev, "VF%d attempted to set invalid MAC\n",
>  				    vf_id);
> -		return (FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> -				   ENETC_MSG_CLASS_ID_MAC_FILTER) |
> -			FIELD_PREP(ENETC_PF_MSG_CLASS_CODE,
> -				   ENETC_MF_CLASS_CODE_INVALID_MAC));
> +		pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +				    ENETC_MSG_CLASS_ID_MAC_FILTER) |
> +			 FIELD_PREP(ENETC_PF_MSG_CLASS_CODE,
> +				    ENETC_MF_CLASS_CODE_INVALID_MAC);
> +		goto vf_state_unlock;
>  	}
> =20
> -	mutex_lock(&vf_state->lock);
> +	/* PF has higher privileges. If PF has already modified the MAC
> +	 * address for VF through .ndo_set_vf_mac() interface, VF is not
> +	 * allowed to set its MAC address via mailbox messages, even if
> +	 * it is trusted.
> +	 */
>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC) {
> -		mutex_unlock(&vf_state->lock);
>  		dev_err_ratelimited(dev,
>  				    "VF%d attempted to override PF set MAC\n",
>  				    vf_id);

[Severity: High]
Is this restriction defeating the established kernel purpose of the VF_TRUST
flag?

If a VF is trusted, standard SR-IOV semantics typically allow it to override
administrative restrictions like a host-assigned MAC address. This block
prevents even trusted VFs from overriding a PF-assigned MAC address, causing
a trusted VF to fail with a command not permitted error if it tries to chan=
ge
a host-assigned MAC.

> -		return FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> -				  ENETC_MSG_CLASS_ID_CMD_NOT_PERMITTED);
> +		pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +				    ENETC_MSG_CLASS_ID_CMD_NOT_PERMITTED);
> +		goto vf_state_unlock;
>  	}
> =20
>  	enetc_set_si_hw_addr(pf, vf_id + 1, addr);
> +
> +vf_state_unlock:
>  	mutex_unlock(&vf_state->lock);
> =20
> -	return ENETC_PF_MSG_SUCCESS;
> +	return pf_msg;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831025441.6350=
45-1-wei.fang@oss.nxp.com?part=3D1
