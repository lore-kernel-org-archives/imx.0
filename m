Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AE82E7398
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780101871; cv=none; b=seOLvT9qYRD3p8MF3qTQ54uP7ASgK2SUThFzTGWiBEvTI/RA9HONylL8c173XjvQDnSuRK2STzbka+Uum5NW/bGcUZwgVgXvnZGVc1CoFGDRbsqH6c4j3n431/kzQq9hyU3xy93/Uy0M4PPaDIpoKgYkYRe67NmBiAomWAPxNwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780101871; c=relaxed/simple;
	bh=etjA9ZsheoPE8n98xAbiOxfGlemvyfHVKRr5nS8TApk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=U9hR8HKOuBYePA5umNZipd/xQs6b9RApH24KJdrszE3GD/JULaVn5ln/Mk/psoNY5ltdvtrVTcIUnZJMsItVM8Yr3mP9nOqpCMafCNoEX/Y3pXJSMMx0lau95YmPjCXyBZDjkwNDIf81xo4eD8mwdQT71IQ7pPX2Ejsu+4/QLhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UB+BwyPw; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UB+BwyPw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A76AB1F00899;
	Sat, 30 May 2026 00:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780101869;
	bh=Ulg99l2D32Ty77AClQadh7c42J1076BU6oPRQ04c6ns=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UB+BwyPwKzcz3WMMk61qsT8rV6t96qlnV8WTr+Urr76uv587WMCX3BAn9MPU0YO61
	 IVDhAs+V2yvndes5Klg2QcYE2B2VMhn9IoZ8BrNPEUmxujWPjp6dclhmarWNdnZsSJ
	 WHAXrUfgZ3beY+6g++acrFL+2lHIsilspIc8lP9w3f2QVxXh6YnCi1fih2DCZOC7CJ
	 Ak63vDSOanL18mMCvUIBJ4p9wFXZPVy58id+um4QJH30nRYuJz2g+ON8CbAdRUvFru
	 KzyDpVcU+zL6gbdW+8i5BJ52zVQTnu4Znd25a/kELcS6aLdfyvzIB+l72ZV7pz3HdW
	 J1gW8lvG4tYHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net 1/9] net: enetc: fix incorrect mailbox message
 status returned to VFs
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260520064421.91569-2-wei.fang@nxp.com>
References: <20260520064421.91569-2-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:44:29 +0000
Message-Id: <20260530004429.A76AB1F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] `__raw_writel` and `__raw_writew` are used for MAC address registe=
rs instead of standard I/O accessors, causing incorrect byte ordering on Bi=
g-Endian architectures.
- [High] The mailbox message structures passed over DMA use native `u16` in=
stead of explicitly sized and endian-annotated types, causing communication=
 failures between differing architectures.
--

commit 7c657b40dbc4f4dc4746436920b4e6e79230ff89
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix incorrect mailbox message status returned to VFs

This commit corrects the mailbox message status returned to VFs in two
cases. It ensures that unsupported command types return a failure status
instead of retaining the default success status. It also returns a failure
when a VF attempts to override a MAC address that has already been set by
the PF.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index a12fd54a475f6..27d4bb65e017f 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -493,11 +493,13 @@ static u16 enetc_msg_pf_set_vf_primary_mac_addr(str=
uct enetc_pf *pf,
>  		return ENETC_MSG_CMD_STATUS_FAIL;
> =20
>  	addr =3D cmd->mac.sa_data;
> -	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC)
> +	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC) {
>  		dev_warn(dev, "Attempt to override PF set mac addr for VF%d\n",
>  			 vf_id);
> -	else
> -		enetc_pf_set_primary_mac_addr(&pf->si->hw, vf_id + 1, addr);
> +		return ENETC_MSG_CMD_STATUS_FAIL;
> +	}
> +
> +	enetc_pf_set_primary_mac_addr(&pf->si->hw, vf_id + 1, addr);

[Severity: High]
This is a pre-existing issue, but does enetc_pf_set_primary_mac_addr() hand=
le
endianness correctly on Big-Endian architectures?

Looking at the implementation:

static void enetc_pf_set_primary_mac_addr(struct enetc_hw *hw, int si,
					  const u8 *addr)
{
	u32 upper =3D get_unaligned_le32(addr);
	...
	__raw_writel(upper, hw->port + ENETC_PSIPMAR0(si));
	...
}

Using __raw_writel() instead of writel() bypasses byte-swapping. Since
get_unaligned_le32() converts the MAC bytes into a CPU-native 32-bit intege=
r,
writing it directly with __raw_writel() on a Big-Endian system will reverse
the bytes compared to what a Little-Endian device expects.

Could this cause the hardware to be programmed with a corrupted MAC address,
and should it use writel() or the driver's standard I/O accessors instead?

> =20
>  	return ENETC_MSG_CMD_STATUS_OK;
>  }
> @@ -509,7 +511,6 @@ void enetc_msg_handle_rxmsg(struct enetc_pf *pf, int =
vf_id, u16 *status)
>  	struct enetc_msg_cmd_header *cmd_hdr;
>  	u16 cmd_type;
> =20
> -	*status =3D ENETC_MSG_CMD_STATUS_OK;
>  	cmd_hdr =3D (struct enetc_msg_cmd_header *)msg->vaddr;
>  	cmd_type =3D cmd_hdr->type;

[Severity: High]
This is a pre-existing issue, but will reading cmd_hdr->type cause
communication failures if the VF guest and host PF have different endiannes=
s?

The mailbox message structures passed over DMA use native u16 types:

struct enetc_msg_cmd_header {
	u16 type;
	u16 id;
};

If a Little-Endian guest runs on a Big-Endian host, the PF will misinterpret
the command types because it reads them in its native byte order.

Do these fields need to be explicitly sized and endian-annotated (e.g., __l=
e16)
with le16_to_cpu() conversions applied when reading them to ensure cross-en=
dian
configurations function correctly?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260520064421.9156=
9-1-wei.fang@nxp.com?part=3D1
