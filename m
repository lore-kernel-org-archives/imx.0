Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB2B2472B8
	for <imx@lists.linux.dev>; Sat,  4 Jul 2026 10:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783161828; cv=none; b=cyG62zcgpXuvVNinVvR8DsJHnZdHjoZI4IOn81UmO9FEqdPBzVCf7gHiriJxOjDWbj4jaHw5pJ3AmruuR4b+AywiV7nzk60nnby2XlbMx9Hn/yVQOKrqg6W61tPPieNLVb6WjCvdBbk+10CPljm51HE9U9OT8w9G2qOxCOiVSBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783161828; c=relaxed/simple;
	bh=T33GM5XdVbeZG+nxWYHz8NB6ALcIjdJkbVtW1EnN4Sk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RfLXlCveMlCo5kgK3IlcRqTc4ydNEuHY8VUwyVJ1Qeybi92uMeV2OaglLD4z8LPn8vQGCYBqliCJVE537qlwyNUVdaSyTGxf/SeqkGWSRmg3CgPS4QtPy/ePoArWsgWSLCAB75DBRPA7GSNgXt5ECApaG9W6yZ/jlYXI0BlM8QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYBx2lLA; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYBx2lLA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A561F00A3D;
	Sat,  4 Jul 2026 10:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783161827;
	bh=OTlL8A6ipkiprG7ATh/cAQP1mrs5KAO08qhapDbgDZk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gYBx2lLAdSvSpUz57/JwrKoE1hVPeVn5iC/H1hsv7uSSppcrlNBgH8IvWFzUMW62T
	 pnVtlE+4tUnN6w5hRi8XkjJCmoL/YJm7x3iVEfnqsoOFNgPYl0Kd5fwp+CzHqmknjz
	 vRRkjf/yYNu163QBiS8KoYfnqYYN2PUNUXZRLx9KJ3MUr/Kxc99zm6IcAXKHIzwmow
	 NYBqAH0NG+4xBb6HeRBTp89GqAamekMj+vKRPWnAx46Nn2q162npnu3k7StCn2ttFz
	 NvZp/eGLW5fSBwz5tnzhw4GyEDJ7nC6AVQDUlOsE2dok+l0mLH7Q8/N3Wcpee3xOLP
	 vFH+JJbE7c3og==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 12/14] net: enetc: remove redundant num_vsi
 field from enetc_port_caps
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260703101328.550714-13-wei.fang@oss.nxp.com>
References: <20260703101328.550714-1-wei.fang@oss.nxp.com>
 <20260703101328.550714-13-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 04 Jul 2026 10:43:46 +0000
Message-Id: <20260704104346.D7A561F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Replacing hardware `num_vsi` with `total_vfs` breaks the structura=
l bounds of MSI-X vector allocation per SI, causing bitwise truncation and =
starving the PF of interrupts when SR-IOV is disabled.
- [Medium] Replacing hardware-bounded `caps.num_vsi` with `total_vfs` deriv=
ed from untrusted PCIe SR-IOV config space leads to out-of-bounds MMIO acce=
sses and out-of-bounds bit shifts.
--

commit aa0b3c99b21e1eb4ed8e7824db6286ae200b0d9e
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: remove redundant num_vsi field from enetc_port_caps

The num_vsi field in struct enetc_port_caps is populated by reading the
NUM_VSI field of the ECAPR1 register, which reports the number of VSIs
supported by the ENETC4 port. When CONFIG_PCI_IOV is enabled, this value
matches the total number of VFs reported by the PCI SR-IOV capability,
which is already stored in pf->total_vfs during probe via
pci_sriov_get_totalvfs(). When CONFIG_PCI_IOV is disabled,
pci_sriov_get_totalvfs() returns 0, but this is benign since
pci_enable_sriov() is also stubbed to return -ENODEV, so no VF can be
created, and enetc4_enable_all_si() only enables the PF SI (PSI).

Since pf->total_vfs already reflects the number of VFs that can actually
be used, and is the established convention in the sibling FSL_ENETC PF
driver, there is no need to read and cache num_vsi separately in the port
capabilities structure. Remove the num_vsi field from enetc_port_caps and
the associated ECAPR1_NUM_VSI macro, and replace all uses of
pf->caps.num_vsi with pf->total_vfs in the ring allocation, MSI-X
configuration, SI enable, and debugfs code paths.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c b/driv=
ers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> index be378bf8f74d1..5029038bf99fa 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_debugfs.c
[ ... ]
> @@ -28,17 +28,14 @@ static void enetc_show_si_mac_hash_filter(struct seq_=
file *s, int i)
> =20
>  static int enetc_mac_filter_show(struct seq_file *s, void *data)
>  {
> -	struct enetc_si *si =3D s->private;
> -	struct enetc_hw *hw =3D &si->hw;
> +	struct enetc_pf *pf =3D enetc_si_priv(s->private);
> +	struct enetc_hw *hw =3D &pf->si->hw;
> +	int num_si =3D pf->total_vfs + 1;

[Severity: Medium]
Could the unconstrained num_si derived from pf->total_vfs cause undefined
behavior in the loops further down in this function?

The original code used caps.num_vsi, which was structurally capped by a 4-b=
it
hardware register mask. The value total_vfs is read from
pci_sriov_get_totalvfs(), which returns an unvalidated 16-bit PCIe
configuration value.

An arbitrarily large total_vfs from a misconfigured or malicious firmware w=
ould
cause PSIPMMR_SI_MAC_MP(i) (which evaluates to BIT(i + 16)) to shift beyond
the bounds of its type when evaluating:
str_enabled_disabled(PSIPMMR_SI_MAC_MP(i) & val).

>  	struct maft_entry_data maft;
>  	struct ntmp_user *user;
> -	struct enetc_pf *pf;
>  	u32 val, entry_id;
> -	int i, num_si;
>  	int err =3D 0;
> -
> -	pf =3D enetc_si_priv(si);
> -	num_si =3D pf->caps.num_vsi + 1;
> +	int i;
[ ... ]
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index cab79f81d6fe0..8d536a3831e3a 100644
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
[ ... ]
> -	for (i =3D 0; i < pf->caps.num_vsi; i++) {
> +	for (i =3D 0; i < num_vfs; i++) {
>  		vf_tx_bdr =3D (i < tx_rem) ? num_tx_bdr + 1 : num_tx_bdr;
>  		vf_rx_bdr =3D (i < rx_rem) ? num_rx_bdr + 1 : num_rx_bdr;
>  		val =3D enetc4_psicfgr0_val_construct(true, vf_tx_bdr, vf_rx_bdr);
> -		enetc_port_wr(hw, ENETC4_PSICFGR0(i + 1), val);
> +		enetc_port_wr(hw, ENETC4_PSICFGR0(i + 1), val);

[Severity: Medium]
Could this result in out-of-bounds MMIO accesses if a misconfigured or mali=
cious
PCIe device firmware reports a total_vfs value larger than the actual hardw=
are
capacity (e.g., > 15) in its SR-IOV Extended Capability?

Similar to the debugfs issue above, replacing the hardware-capped caps.num_=
vsi
with an unvalidated total_vfs causes this unconstrained loop to write past =
the
instantiated ENETC4_PSICFGR0 register bounds.

>  	}
>  }
[ ... ]
> @@ -299,26 +299,25 @@ static void enetc4_allocate_si_rings(struct enetc_p=
f *pf)
>  static void enetc4_set_si_msix_num(struct enetc_pf *pf)
>  {
>  	struct enetc_hw *hw =3D &pf->si->hw;
> -	int i, num_msix, total_si;
> +	int num_si =3D pf->total_vfs + 1;
> +	int i, num_msix;
>  	u32 val;
> =20
> -	total_si =3D pf->caps.num_vsi + 1;
> -
> -	num_msix =3D pf->caps.num_msix / total_si +
> -		   pf->caps.num_msix % total_si - 1;
> +	num_msix =3D pf->caps.num_msix / num_si +
> +		   pf->caps.num_msix % num_si - 1;
>  	val =3D num_msix & PSICFGR2_NUM_MSIX;
>  	enetc_port_wr(hw, ENETC4_PSICFGR2(0), val);

[Severity: High]
Can this cause bitwise truncation and starve the PF of interrupts when SR-I=
OV
is disabled?

If CONFIG_PCI_IOV is disabled, pf->total_vfs evaluates to 0, making
num_si =3D 1. The driver will then attempt to allocate all available hardwa=
re
MSI-X vectors to the PF (num_msix =3D pf->caps.num_msix - 1).

If the hardware supports more than 64 MSI-X vectors, num_msix will exceed t=
he
6-bit width (max 63) of the hardware register field PSICFGR2_NUM_MSIX.
The bitwise AND operator & PSICFGR2_NUM_MSIX truncates the value instead of
clamping it (e.g., 64 & 0x3F =3D=3D 0).

This programs the PF to receive 0 vectors (effectively 1 vector due to the =
N-1
encoding), starving it of necessary interrupts. The previous implementation
divided by pf->caps.num_vsi + 1, which structurally guarded against this
large allocation.

> =20
> -	num_msix =3D pf->caps.num_msix / total_si - 1;
> +	num_msix =3D pf->caps.num_msix / num_si - 1;
>  	val =3D num_msix & PSICFGR2_NUM_MSIX;
> -	for (i =3D 0; i < pf->caps.num_vsi; i++)
> +	for (i =3D 0; i < pf->total_vfs; i++)
>  		enetc_port_wr(hw, ENETC4_PSICFGR2(i + 1), val);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260703101328.5507=
14-1-wei.fang@oss.nxp.com?part=3D12
