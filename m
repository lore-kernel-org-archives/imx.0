Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A783C4175
	for <imx@lists.linux.dev>; Thu, 11 Jun 2026 09:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781171256; cv=none; b=cLiALNFiaTG4x+opd+UQaW3U31mHEe8vylzShza4TWC4fKxb9xf9nnLohMhDoTT+Xu262ixVvXOtbSqKjRUNYWYn4mnmtp5w3V+1UEqHUwR/1pUC27E6HpDLTo2AltE348oSBY7pD5H0E/RPoXOPsIsTuv9hr4Ta51v6ZOF5Qm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781171256; c=relaxed/simple;
	bh=K9bZsMl1LrPKZCqH/p4lHcJuOg3aR1aZ2NVR0PEgjq0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=uK4F3D53xVl5/wqLN0opyX7EmodZhYF/4bsXD87Ezg04n5xEoq0Zzdb6oqrhMU4Y25f0KWKnQimP/cXojA9Im420bYth+v6ISTevTd5w62q2pE6lHy5KM3A2UtGoM34M3ND0q8cCN3GTBZLxQoCy42yaLrTcrOG1BaFH34nPPVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=evSTCgiV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="evSTCgiV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43EBE1F00898;
	Thu, 11 Jun 2026 09:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781171255;
	bh=DSIECKepmN3gGsdDByg4CPb1BWobaCFbDg3BpDesYpw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=evSTCgiVXyDB5qpqz+vC/3SbaY+SToieuqXUHWfOa/8pYkJeWI7iUUnvyzhP+9Iog
	 E9iVlv3oKYEwijEynMynF4jUrozWqUNjRS7Z6y5wJOV6ikI4UFayEcbhlQhMgGc8Ui
	 l7DuMzFoOQ2zsaSJBw70crtZIJykEG123d1sJ7fypQlGd+4/6Z8a2rxVb9R3A8VNWs
	 bawTxQaU6eXtIMjBa3aRYKwa8Crpk1LV7sPufgqt8agW4ZjyLTf0UKgJTEvkfm1pi7
	 vqyW7qM59AzNVgUM96Lby0sTHGW+bKvMFteFdY/IsFMzHCzrg1Ii9Vbs3CkJeu23ps
	 0SOkLWqSUt0/w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 04/15] net: enetc: add link speed message
 support to PF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260610091844.3423693-5-wei.fang@oss.nxp.com>
References: <20260610091844.3423693-5-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 09:47:33 +0000
Message-Id: <20260611094734.43EBE1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Pre-existing out-of-bounds heap read in VF mailbox handlers due to=
 unvalidated message length.
--

commit 6b55ba2c40a6c04cf0db8ebb97921067e4376ee1
Author: Wei Fang <wei.fang@nxp.com>
net: enetc: add link speed message support to PF driver

This commit adds link speed message support for DPDK-owned VFs. The PF
driver replies with the current link speed when it receives a get link
speed message from a VF, improving link state visibility for the VF.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index eac71f90d80bd..b24903b23a616 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c
[ ... ]
> @@ -274,6 +277,84 @@ static u16 enetc_msg_handle_link_status(struct enetc=
_pf *pf, int vf_id,
>  	}
>  }
> =20
> +static u16 enetc_msg_get_link_speed(struct enetc_pf *pf, int vf_id)
> +{
[ ... ]
> +}
> +
> +static u16 enetc_msg_handle_link_speed(struct enetc_pf *pf, int vf_id,
> +				       void *vf_msg)
> +{
> +	struct enetc_msg_header *msg_hdr =3D vf_msg;

[Severity: High]
This isn't a bug introduced by this patch, but could unvalidated message
lengths lead to out-of-bounds heap reads in mailbox handlers?

In existing handlers, the PF driver calculates the allocation size based on
msg_hdr->len (e.g., msg_size =3D 16 + len) and allocates a buffer. If a tru=
sted
VF sends a message with an artificially small length like 0, only 16 bytes
are allocated.

However, handlers cast this buffer to larger structures and read fields
outside the bounds:

enetc_msg_set_vf_primary_mac_addr() {
    ...
    char *addr =3D msg->mac[0].addr;
    ...
    if (!is_valid_ether_addr(addr)) {
    ...
        enetc_set_si_hw_addr(pf, vf_id + 1, addr);
    ...
}

Since msg->mac[0].addr starts at offset 20, reading it from a 16-byte
buffer causes an out-of-bounds heap read, which could leak sensitive kernel
memory into the device MAC address registers or crash the host kernel. Shou=
ld
message lengths be validated against the expected structure size before
processing the messages?

> +
> +	switch (msg_hdr->cmd_id) {
> +	case ENETC_MSG_GET_CURRENT_LINK_SPEED:
> +		return enetc_msg_get_link_speed(pf, vf_id);
> +	case ENETC_MSG_REGISTER_SPEED_CHANGE_NOTIFIER:
> +	case ENETC_MSG_UNREGISTER_SPEED_CHANGE_NOTIFIER:
> +	default:
> +		return ENETC_PF_MSG_NOTSUPP;
> +	}
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260610091844.3423=
693-1-wei.fang@oss.nxp.com?part=3D4
