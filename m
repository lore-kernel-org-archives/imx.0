Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B42137923
	for <imx@lists.linux.dev>; Wed,  8 Jul 2026 08:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783500512; cv=none; b=dOTH9WMeXHOn0o+sLQDwLrQin8TOTxUMopalNx8FpiykBJosy16m9J3JNhkFjg47RB6yrakt5+rowJnTeYNxhti3cu5YKX1dwuXtQjcO89n/qT0/r9xO37LSj7m1zUR3sOAGsttwn+qIAy5B8theiPdfWU31leKd8LY9K5lH5V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783500512; c=relaxed/simple;
	bh=VbR7QnqyAnEiFyb/BnGBFnYAnIcXbQzFv7M+O6KqPQg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NmIn7F3TQLnkKjZVDLQwTPZ4MQu0l9vCbovrVAwTkUBZ7MymUoMZL7WeNDGHJuy7AmhvzFEDHn5CEIy1b5MLGRmJSsE9zaEDV/yWw0a/2gTL7aFjAY3Fb9DTpCjeP+l0ux4gNEh9ZnKS2s5YCHMKpJV3c0EYoQYuLLAlgzXoWFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9IvSmSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9IvSmSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90E5E1F00A3D;
	Wed,  8 Jul 2026 08:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783500510;
	bh=hMExHXYyrR8PzqlED5QW5dk66mMwtUlXS9e4kQznJAk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=N9IvSmSMo4KhsFbnqzk/VzcEr3EPFKrjZNUotCqRAa3AFzPBz2qr7+6f+DaTu3+tm
	 ie21P0MUga6IemKTBk1I2C0uM3nyabbx0rAO1YuK95MJCIlyQ1chZXc3bun0eRkI+w
	 ad3x7PWSlM2dy17JPlYegEhXD1dAgECuYAMYvOKCY62pM3S6pH8DK8vhH2KffErQql
	 nqYxF8w0kgY3Esjqe2i9fTScidTmlJeHi4I4jKCN5iDTy1pllOJ+SxBfIFqjxrDaIL
	 v0IpqoR9/nZP0WPU5nWcHXE4vj9cdxM4hvgKbmxbKp6LKFosFM4SXw2MAKSM+9dUg7
	 xxeqouMmAthMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 12/14] net: enetc: remove redundant num_vsi
 field from enetc_port_caps
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260707081834.710730-13-wei.fang@oss.nxp.com>
References: <20260707081834.710730-1-wei.fang@oss.nxp.com>
 <20260707081834.710730-13-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 08 Jul 2026 08:48:30 +0000
Message-Id: <20260708084830.90E5E1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware ring overallocation when CONFIG_PCI_IOV is disabled due t=
o uninitialized VSI PSICFGR0 registers.
--

--- Patch [12]: [PATCH v4 net-next 12/14] net: enetc: remove redundant num_=
vsi field from enetc_port_caps ---
commit d0ac7548c05e5390933f00261830b4e5d8ae719a
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: remove redundant num_vsi field from enetc_port_caps

This commit removes the num_vsi field from the enetc_port_caps structure
and replaces its usage with pf->total_vfs. The justification is that
pf->total_vfs already reflects the number of VFs that can actually be used.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index cab79f81d6fe0..fcfbabb29d22e 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
[ ... ]
> @@ -255,34 +254,35 @@ static void enetc4_default_rings_allocation(struct =
enetc_pf *pf)
>  {
>  	struct enetc_hw *hw =3D &pf->si->hw;
>  	u32 num_rx_bdr, num_tx_bdr, val;
> +	int num_vfs =3D pf->total_vfs;
>  	u32 vf_tx_bdr, vf_rx_bdr;
>  	int i, rx_rem, tx_rem;
> =20
> -	if (pf->caps.num_rx_bdr < ENETC_SI_MAX_RING_NUM + pf->caps.num_vsi)
> -		num_rx_bdr =3D pf->caps.num_rx_bdr - pf->caps.num_vsi;
> +	if (pf->caps.num_rx_bdr < ENETC_SI_MAX_RING_NUM + num_vfs)
> +		num_rx_bdr =3D pf->caps.num_rx_bdr - num_vfs;
>  	else
>  		num_rx_bdr =3D ENETC_SI_MAX_RING_NUM;
> =20
> -	if (pf->caps.num_tx_bdr < ENETC_SI_MAX_RING_NUM + pf->caps.num_vsi)
> -		num_tx_bdr =3D pf->caps.num_tx_bdr - pf->caps.num_vsi;
> +	if (pf->caps.num_tx_bdr < ENETC_SI_MAX_RING_NUM + num_vfs)
> +		num_tx_bdr =3D pf->caps.num_tx_bdr - num_vfs;
>  	else
>  		num_tx_bdr =3D ENETC_SI_MAX_RING_NUM;
> =20
>  	val =3D enetc4_psicfgr0_val_construct(false, num_tx_bdr, num_rx_bdr);
>  	enetc_port_wr(hw, ENETC4_PSICFGR0(0), val);
> =20
> -	if (!pf->caps.num_vsi)
> +	if (!num_vfs)
>  		return;

[Severity: High]
In enetc4_default_rings_allocation(), when num_vfs is 0 (such as when
CONFIG_PCI_IOV is disabled), this returns early without zeroing the ring
allocations in the VSIs' PSICFGR0 registers.

Because num_vfs is 0 instead of the true physical VSI count, the PF is
allocated the maximum possible hardware rings.

If these VSI registers retain non-zero values (e.g., from firmware defaults
or after a warm reboot), won't the sum of configured rings across the PF and
VSIs strictly exceed the physical hardware capacity?

Could this lead to memory corruption within the ENETC device's internal
SRAM or cause DMA issues due to overlapping BD ring structures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260707081834.7107=
30-1-wei.fang@oss.nxp.com?part=3D12
