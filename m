Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16EC3B992A
	for <imx@lists.linux.dev>; Thu, 14 May 2026 10:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778756301; cv=none; b=drKfNjCmE3jxDqrRDn/RbCQJATy0BZxjOuh9KW/i0WB+Op7+5IwPIFEnBE5E14O+jfPG11HyovswuyoxeDQphwfuzmgpng8HmDR3L9SpnP4HoWFSqw8AlvVwfWk+iUuuJX0HfBhYBvseqekQhm+/YkMh6oA73nF0pnr+Lkl7HFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778756301; c=relaxed/simple;
	bh=V56qGwAA0QUapxaEJLeWNeWT0dEzw0qpr2zOx9y6Ofw=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=FXBwFuf0OluIkNbDUgQE55NYEWae3TbWQ1/5QHxi9lMKL/zXbcCYVhwJU7jQpLhVQaJfyfZEoM/nfBkv9betXjeOKrRmwf63HTNZOV/ne0SQd5pNZncm9kopvqMyoHasNNZxTIQIAoxLGGoDxosj8aXeVMw3koBgLi+AmLKhjok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ODVSbJL3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ODVSbJL3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B993C2BCB8;
	Thu, 14 May 2026 10:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778756301;
	bh=V56qGwAA0QUapxaEJLeWNeWT0dEzw0qpr2zOx9y6Ofw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=ODVSbJL3hT9G+PRKy4plw/bpMDfPt6tmAQla5qc024UEym3+xYJXwtG8o4rGpK1zQ
	 cnhTLCG3YNrumJ9LsohpOCrFT00eh7WUi85BK2EPflF0lOcDApbzrzERHA74myGzIv
	 EvvJxvDNtLazRLyhlE/SWStQBzSZWSdwar4+kAHWhNCJcOwyag4eY9CVQSHCS5MTZx
	 BSACDSNPl/nhUylBoZNnt1GUc1H+tMNlVd/kwixOAY2n3nKZC2CfJ0lS32E+DglBR/
	 AVuN4xIF7I/pPqqeZC/AVf9njNLCyuHj29RZYFahrH5ly0PZtAO+j+JlTPxu6D3oMl
	 pwlgnNDJiXoWA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net 2/6] net: enetc: fix race condition in VF MAC
 address configuration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Wei Fang" <wei.fang@nxp.com>
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260513103021.2190593-3-wei.fang@nxp.com>
References: <20260513103021.2190593-3-wei.fang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 14 May 2026 10:58:21 +0000
Message-Id: <20260514105821.6B993C2BCB8@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Missing return value assignment in enetc_pf_probe() on memory allo=
cation failure leads to false probe success and a later kernel panic.
- [High] Endianness portability bug: Hardware MAC address programming uses =
native-endian __raw_writel and lacks memory barriers.
- [High] A Time-of-Check to Time-of-Use (TOCTOU) vulnerability exists when =
validating the VF MAC address from shared DMA memory.
- [Medium] Unbalanced lifecycle: The dynamically allocated vf_state->lock m=
utexes are never destroyed.
--

commit 1c1cbdf4d36cff2b27997a549d795686b791e573
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix race condition in VF MAC address configuration

The VF message handler runs asynchronously and accesses vf_state->flags
without locking. Concurrently, the host can change the VF MAC address
via enetc_pf_set_vf_mac() under RTNL lock, creating TOCTOU races and
torn MAC address writes. Fix this by introducing a per-VF mutex to
serialize access.

Link: https://sashiko.dev/#/patchset/20260511080805.2052495-1-wei.fang%40nx=
p.com #1

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> @@ -252,8 +252,12 @@ static int enetc_pf_set_vf_mac(struct net_device *nd=
ev, int vf, u8 *mac)
>  		return -EADDRNOTAVAIL;
> =20
>  	vf_state =3D &pf->vf_state[vf];
> +
> +	mutex_lock(&vf_state->lock);
>  	vf_state->flags |=3D ENETC_VF_FLAG_PF_SET_MAC;
>  	enetc_pf_set_primary_mac_addr(&priv->si->hw, vf + 1, mac);

Is it safe to use __raw_writel and __raw_writew when programming the hardwa=
re
MAC address?

Looking at enetc_pf_set_primary_mac_addr():

static void enetc_pf_set_primary_mac_addr(struct enetc_hw *hw, int si,
					  const u8 *addr)
{
	u32 upper =3D get_unaligned_le32(addr);
	u16 lower =3D get_unaligned_le16(addr + 4);

	__raw_writel(upper, hw->port + ENETC_PSIPMAR0(si));
	__raw_writew(lower, hw->port + ENETC_PSIPMAR1(si));
}

On big-endian architectures, these native writes lack byte-swapping, which
might result in the hardware register receiving the MAC address bytes in
reverse order compared to little-endian systems. They also lack memory
barriers, which could allow the CPU to reorder the writes.

Could this use the standard writel and writew accessors instead to ensure
proper CPU-to-device endianness conversion?

> +	mutex_unlock(&vf_state->lock);
> +
>  	return 0;
>  }

[ ... ]

> @@ -499,12 +503,15 @@ static u16 enetc_msg_pf_set_vf_primary_mac_addr(str=
uct enetc_pf *pf,
>  		return ENETC_MSG_CMD_STATUS_FAIL;
>  	}
> =20
> +	mutex_lock(&vf_state->lock);

Does the addition of this mutex widen a race condition where the VF could
modify the MAC address?

Earlier in enetc_msg_pf_set_vf_primary_mac_addr(), the addr pointer is set
to cmd->mac.sa_data, which points into the message buffer msg->vaddr.

If msg->vaddr is in coherent DMA memory accessible by the VF, the PF driver
validates the MAC address before taking the mutex, but reads it again inside
enetc_pf_set_primary_mac_addr() after taking the mutex.

Could a malicious VF exploit this double-fetch by writing an invalid MAC
address into the shared DMA buffer right after the validation check passes,
bypassing the check entirely? Might it be safer to copy the message to a
local buffer before validating it?

>  	if (vf_state->flags & ENETC_VF_FLAG_PF_SET_MAC)
>  		dev_warn(dev, "Attempt to override PF set mac addr for VF%d\n",
>  			 vf_id);
>  	else
>  		enetc_pf_set_primary_mac_addr(&pf->si->hw, vf_id + 1, addr);
> =20
> +	mutex_unlock(&vf_state->lock);
> +
>  	return ENETC_MSG_CMD_STATUS_OK;
>  }

[ ... ]

> @@ -968,6 +975,9 @@ static int enetc_pf_probe(struct pci_dev *pdev,
>  					    pf->total_vfs);
>  		if (!pf->vf_state)
>  			goto err_alloc_vf_state;

If the allocation for pf->vf_state fails here, err does not appear to be
assigned a failure code before the jump.

Since err would still hold 0 from the earlier successful call to
enetc_pf_register_with_ierb(), could this cause the probe function to false=
ly
return success to the PCI subsystem?

If so, this might lead to a kernel panic later when enetc_pf_remove() attem=
pts
to dereference the unallocated device structure.

> +
> +		for (int i =3D 0; i < pf->total_vfs; i++)
> +			mutex_init(&pf->vf_state[i].lock);

Is it necessary to call mutex_destroy() for these dynamically allocated
mutexes?

If kfree(pf->vf_state) is called during the probe error path or during
device removal, freeing the active mutex memory without destroying it first
might cause lockdep to report use-after-free or list corruption warnings
when debugging options are enabled.

>  	}
> =20
>  	err =3D enetc_setup_mac_addresses(node, pf);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260513103021.2190=
593-1-wei.fang@nxp.com?part=3D2
