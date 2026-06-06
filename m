Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19AB3064B2
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730684; cv=none; b=FVftLLZYdhugGCrNuaRrJfSE/fqv7asxrpuf4St7QgS27tblzam8i2Qq1ynTfWib3PDVcCVQbU51JvavI8CIu/Zc90yw8uUXaTq8CwmCqIieoA1pRwr+BU/Ug1zMIcktsAjkC0MO+AxppMFmLDQ3ZmxBtZ4m9RZug16wS7S8F/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730684; c=relaxed/simple;
	bh=FXaChxnJNThOv/CN1a0ViUkb3I4UfFF93ONq+CJGhhQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oOkCVdCrwLL9Cmv7Dg2rrd7FHzrncCwzOwZK8xmvpmSioL0DmYHAkIQbM8gaElrgyW6IOBV2evzK8f9K41ojKu8cmDGtISHJ4fS/A+RsLzyCDhmdX1vkuBnmDORpC/JDIIb1yam8FzRxOEJ6M6PYjSxSAJRUUNkMsiWMMd91x4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R/E6YiJn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R/E6YiJn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFEED1F00893;
	Sat,  6 Jun 2026 07:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730682;
	bh=feTEHVNhYbnDTTS+0D7g4u/bbq11eDibXM6yihdbUNk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=R/E6YiJnEL8by9X77VWPCjFxKJfOLUqBs3DPoqOqFub4K3Kb47B/NtUbbjBYPQVlh
	 DuKSQR+b9DCI3lfsgWS9ujzNEdUWSk2D0MlNcScFo9jkxpt5K4etUVFp6NUwjS0sf3
	 j8rAakMSXcIAh2IbNMUEYRKeTN+hyEG0AF2de7eGDG8ksuakCxXISeCVkvu6Tg0JBO
	 RPox9iMwTOyLungC0Kj2c7l0gWpCDUg5Nugb03Pn5s2CzWEX32o5d9O/ZWNIwgw0z0
	 rcY5YI90NiHIpqu61mt3kATpWABbxUrS9iYLYrpjQHQU3Spe6KtJnpysnJbidXiicu
	 cYkP1xYTwB0Yw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 12/15] net: enetc: add VF support for i.MX94
 and i.MX95
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-13-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-13-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:42 +0000
Message-Id: <20260606072442.AFEED1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] The `pf->msg_lock` mutex is used uninitialized on standalone ENETC=
 devices, leading to a panic or lockdep splat during RX mode configuration.
- [High] ENETC4 VF driver data uses `enetc_vf_ethtool_ops` which unconditio=
nally reads ENETC 1.0 specific registers via `ethtool -d`, triggering out-o=
f-bounds/reserved accesses.
--

commit aabc7a8de39df35b07517a53cac397ac5c0fb902
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add VF support for i.MX94 and i.MX95

This patch adds VF support for i.MX94 and i.MX95 platforms. Compared to
the LS1028A ENETC, the VF device ID has been updated to 0xef00.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index aa8a87124b103..fdceaf36daa72 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -3745,6 +3745,13 @@ static const struct enetc_drvdata enetc_vf_data =
=3D {
>  	.eth_ops =3D &enetc_vf_ethtool_ops,
>  };
> =20
> +static const struct enetc_drvdata enetc4_vf_data =3D {
> +	.sysclk_freq =3D ENETC_CLK_333M,
> +	.tx_csum =3D true,
> +	.max_frags =3D ENETC4_MAX_SKB_FRAGS,
> +	.eth_ops =3D &enetc_vf_ethtool_ops,

[Severity: High]
Does this safely support ENETC v4 hardware? The enetc_vf_ethtool_ops
implements the get_regs callback using enetc_get_regs(), which
unconditionally reads registers defined in the enetc_si_regs array.

This array includes ENETC 1.0 specific Control Ring (CBDR) registers like
ENETC_SICBDRMR. Since ENETC v4 hardware uses NTMP instead of CBDR, these
register offsets are invalid or reserved on i.MX94/i.MX95.

Reading reserved memory regions via ethtool -d can trigger a synchronous
external abort or kernel panic on some architectures. Should the driver
define an ENETC4-specific ethtool_ops for the VF or check hardware
revisions before reading these registers?

> +};
> +

[ ... ]

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 15c8b704b2b75..868ed694e1200 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -314,11 +314,15 @@ static const struct enetc_pf_ops enetc4_pf_ops =3D {
>  static int enetc4_pf_struct_init(struct enetc_si *si)
>  {
>  	struct enetc_pf *pf =3D enetc_si_priv(si);
> +	int err;
> =20
>  	pf->si =3D si;
> -	pf->total_vfs =3D pci_sriov_get_totalvfs(si->pdev);
>  	pf->ops =3D &enetc4_pf_ops;
> =20
> +	err =3D enetc_init_sriov_resources(pf);

[Severity: High]
Can this lead to an uninitialized mutex being used on standalone ENETC v4
devices that do not support VFs?

In enetc_init_sriov_resources(), there is an early return if pf->total_vfs
is 0:

int enetc_init_sriov_resources(struct enetc_pf *pf)
{
	...
	pf->total_vfs =3D pci_sriov_get_totalvfs(pf->si->pdev);
	if (!pf->total_vfs)
		return 0;
	...
	mutex_init(&pf->msg_lock);
	return 0;
}

If total_vfs is 0 (as is the case for standalone i.MX94 ENETC),
the msg_lock is not initialized. Later, when the network interface is
brought up or the promiscuous mode changes, enetc4_psi_do_set_rx_mode()
unconditionally locks this uninitialized mutex:

	mutex_lock(&pf->msg_lock);
	enetc4_pf_set_si_mac_promisc(hw, 0, UC, uc_promisc);
	...
	mutex_unlock(&pf->msg_lock);

Would it be better to initialize the mutex unconditionally, or condition
the locking on the device capabilities?

> +	if (err)
> +		return err;
> +
>  	enetc4_get_port_caps(pf);
>  	enetc4_get_psi_hw_features(si);

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D12
