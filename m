Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D84B22F388
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730683; cv=none; b=KGp4mWqNHEbi72R+m7iFgSkJf39UJlL9LunryAa7hWtmh2lgi+IL/kmXGHQI2gXCxK97EUGZui97TKd889l64Vhr1H60OaRNNUyJfw50Gn4IWAtFoJVJUQONGU1VCjd0wXPk+AyHB3ebCrL/FurNzyeXhdoZW3+MIjW+27iM4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730683; c=relaxed/simple;
	bh=72i5ZrndEFAd2+8U2koSGX3x47twyla4YcW2ayqd/xk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=dCmbcbFzEyQbKD6PkIO1gdbWnugw5iFfTZeij8xb3hp6RkXc+loCa/LantlzzcgU45zQXfa49i6j3ZUuB2LH+4PO5N0iy+Y/w5IgDjdR7XwiuDC0F02jIxnl8h9kY6hV1IU7psgz1IfeQqNkza7xlmaqmY0UP4Lf8Br1dwmioVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZgSL9dHL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZgSL9dHL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036A21F00899;
	Sat,  6 Jun 2026 07:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730682;
	bh=hgmEln9mitXswVnlLWHZlkz7LuIHvxLWlpJBlj+3MjY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZgSL9dHLhH+EpiJ6YkWJw0Sa9ufHDRgblu07cRujdNdt0ZCGIty6yGWPFJqaG8GpM
	 1fm3ERrEbvGBA3I/cTip+jPMcI3bIObdoK8MwUAjorp3hxK+EvbSdEpeedUq1i4Uqv
	 JdWeIFEZYkn3YriTZ1Rozot4pPOUpDVSRPCWYhnM/SR77PUdA3ualLdbNXyD200OeU
	 +Hy0ITNoryvZXBlfBP74djnPOEk2VPD1PiPaHJGCTFlkslthD0E6ya5nFrwc5AN3hq
	 5giuTFx4dSndZip5TgLOUdUpbOOwlWb1PGjwS032G/cYm7tv2dnOoDrHkZrqw5ILMz
	 /vZbNrEL8BkXg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 11/15] net: enetc: restore VF MAC promiscuous
 mode after FLR for ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260605065550.3038579-12-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-12-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:41 +0000
Message-Id: <20260606072442.036A21F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Critical] State leakage of VF configuration flags across SR-IOV disable/=
enable cycles leading to privilege escalation.
--

commit 4b3358f3b481a101e7878efe2d4cc289110ff9db
Author: Wei Fang <wei.fang@nxp.com>
net: enetc: restore VF MAC promiscuous mode after FLR for ENETC v4

This commit adds tracking for VF MAC promiscuous mode to mitigate a security
vulnerability where a VF Function Level Reset (FLR) defaults to enabling
promiscuous mode. It introduces a vf_flr_handler callback to restore the
hardware state based on PF-managed policies.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 2e081a59154e1..15c8b704b2b75 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c

[ ... ]

> @@ -283,11 +283,32 @@ static void enetc4_pf_set_mac_filter(struct enetc_p=
f *pf, int type)
>  		enetc4_pf_set_mac_hash_filter(pf, ENETC_MAC_FILTER_TYPE_MC);
>  }
> =20
> +static void enetc4_pf_vf_flr_handler(struct enetc_pf *pf, int vf_id)
> +{
> +	struct enetc_hw *hw =3D &pf->si->hw;
> +	struct enetc_vf_state *vf_state;
> +	bool uc_promisc, mc_promisc;
> +
> +	vf_state =3D &pf->vf_state[vf_id];
> +	mutex_lock(&vf_state->lock);
> +
> +	uc_promisc =3D !!(vf_state->flags & ENETC_VF_FLAG_UC_PROMISC);
> +	mc_promisc =3D !!(vf_state->flags & ENETC_VF_FLAG_MC_PROMISC);
> +
> +	mutex_lock(&pf->msg_lock);
> +	enetc4_pf_set_si_mac_promisc(hw, vf_id + 1, UC, uc_promisc);

[Severity: Critical]
Does this introduce a privilege escalation due to state leakage across SR-I=
OV
disable/enable cycles?

When SR-IOV is disabled, enetc_sriov_configure() drops pf->num_vfs but does=
=20
not appear to clear the pf->vf_state array. As a result, the state from the=
=20
previous session leaks into the next session.

If a previously trusted VF had these flags set, a newly created untrusted V=
F=20
would inherit them. The untrusted VM could then deliberately trigger a=20
Function Level Reset (FLR), causing this handler to explicitly restore the=
=20
hardware to promiscuous mode based on the leaked flags:

enetc4_pf_vf_flr_handler()
    uc_promisc =3D !!(vf_state->flags & ENETC_VF_FLAG_UC_PROMISC);
    ...
    enetc4_pf_set_si_mac_promisc(hw, vf_id + 1, UC, uc_promisc);

Could this allow an untrusted VM to sniff network traffic destined for othe=
r=20
VMs or the host? Should pf->vf_state be reinitialized when SR-IOV is=20
disabled or enabled?

> +	enetc4_pf_set_si_mac_promisc(hw, vf_id + 1, MC, mc_promisc);
> +	mutex_unlock(&pf->msg_lock);
> +
> +	mutex_unlock(&vf_state->lock);
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D11
