Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BF7372622
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730680; cv=none; b=SoBjU5YIXFC/lqOOd67c15bLSy+mod2ZZF0n46olz1xGrYAu3W8xVwwK0f0nYS9scH1J2+lUN0n5n3aClBx2xJ9TycAdqKT6DPV8mGrXVZyV5T2Dj+0tF1MDGM0HmgkCIrjM2+UBWX/DLPOpEWB8bbxICA/konmhU89M8otB/6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730680; c=relaxed/simple;
	bh=fxf/Z963nffkADxOpY+yHA8Lsgh6UvgHtwfmYn0ktmA=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YQeNvy2MPR0PWnWi9g4M4BNarTBozxqSnfT1w99YPT2Pad7gRTTiJRIV6UTrcbM9DrU1VNEG+ae8XwPbGGz4Pq/iOjSLSq6In4Ni3+EVuxIKtKut1inOjR91FfBxIFK4ebrFjkVMMXLFZucz7G2Gk4eqRPElYpPe3nFa9mnFNHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ztp80l3C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ztp80l3C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E70F1F00893;
	Sat,  6 Jun 2026 07:24:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730678;
	bh=je/o4+5+ISdykCT6MGYdCN1oyVJVFe+eWQftGZSLhRU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ztp80l3COIGgt2WkwfEQIp5eUR1N+gQw/LroXGAnx2kLqSzdHvpAkYxYIzuzY/6vV
	 5RfQGwKUmbj3HlFAPuVaFRKkzIjq+28lG8N5Xa9wIFJw1/DgU1Q/ZiUVrrehsDVUmr
	 L1A9oS9qWY+mr6clbxyifbK8rfa5hyyMXHKPqt5jlOMTw5rD/k+IkMaLTCsphHqxBW
	 aNYCtfe8fHUjJaGBA9hp/XFhv0OiL59/25hlQF2aXFWxPG+0uL+OIPxy9LbYtHBDWn
	 zV6d1AXK73k0WGSPmGPHwmKNBbMIT0DnNzmHAaoRjoD3hYKE3czXdt4i8nu83gO97Q
	 2jWc3EypZ9syg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 01/15] net: enetc: add trusted VF support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-2-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-2-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:38 +0000
Message-Id: <20260606072438.8E70F1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] UAPI Breakage: The patch unconditionally denies MAC address change=
s for untrusted VFs and fails to implement correct trusted VF override sema=
ntics.
--

commit 6f75af6dda440eac57a8d16c81c6cc7d3ceba0b9
Author: Claudiu Manoil <claudiu.manoil@nxp.com>

net: enetc: add trusted VF support

Some mailbox messages require a higher privilege level to be executed
on behalf of the requesting VF. Introduce a trusted VF flag
(ENETC_VF_FLAG_TRUSTED) and wire up the ndo_set_vf_trust callback via
enetc_pf_set_vf_trust().

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index edc1277bb5860..156333ef26bf3 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -61,31 +63,41 @@ static u16 enetc_msg_set_vf_primary_mac_addr(struct e=
netc_pf *pf, int vf_id,
>  	struct enetc_vf_state *vf_state =3D &pf->vf_state[vf_id];
>  	struct enetc_msg_mac_exact_filter *msg =3D vf_msg;
>  	struct device *dev =3D &pf->si->pdev->dev;
> +	u16 pf_msg =3D ENETC_PF_MSG_SUCCESS;
>  	char *addr =3D msg->mac[0].addr;
> =20
> +	mutex_lock(&vf_state->lock);
> +
> +	if (!(vf_state->flags & ENETC_VF_FLAG_TRUSTED)) {
> +		pf_msg =3D ENETC_PF_MSG_PERM_DENY;
> +		goto vf_state_unlock;
> +	}

[Severity: High]
Under standard Linux SR-IOV semantics, untrusted VFs are allowed to set the=
ir
own MAC address provided the PF has not administratively locked it (i.e. wh=
en
PF_SET_MAC is false). Does this check unconditionally deny all MAC changes =
from
untrusted VFs? If so, couldn't this break backward compatibility and break =
guest
OSes that attempt to assign a random MAC on boot?

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
>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC) {
> -		mutex_unlock(&vf_state->lock);
>  		dev_err_ratelimited(dev,
>  				    "VF%d attempted to override PF set MAC\n",
>  				    vf_id);
> -		return FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> -				  ENETC_MSG_CLASS_ID_CMD_NOT_PERMITTED);
> +		pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +				    ENETC_MSG_CLASS_ID_CMD_NOT_PERMITTED);
> +		goto vf_state_unlock;
>  	}

[Severity: High]
Does this incorrectly deny MAC changes from trusted VFs if the PF has assig=
ned
a MAC? Since this ENETC_VF_FLAG_PF_SET_MAC check happens after the TRUSTED =
check
and unconditionally rejects the operation, it appears to violate the standa=
rd
semantics that trusted VFs can override a PF-set MAC.

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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D1
