Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B93A83B1
	for <imx@lists.linux.dev>; Tue,  1 Sep 2026 03:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788233039; cv=none; b=dDW+yz3ThqhbvyMlbYJbgCelw22fmrWhYwWxko8uS3MAlv5omaT2camuUlR+SJ9eNPfmupEbrmwqGEhsIE5KWPxvevSpN3B5ezE6PfyWuE9hXTmPwqnrEcADit33JlVIn+VQxyF5XAh0i5i1hufWDL5fjSaGGRV4wwI7GiwTTcc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788233039; c=relaxed/simple;
	bh=NqU2+Hr5uCtQm5uHkv3uNJ0iH353VbXE/FK8cJ9S9yc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jeGC7HOzHdYXY7puGcfSiW2JsGrZtJZEirZhRoz9fpp+6CH3W3OGANGQN59hWbWUQyf3cp6GxR/3WOUkEIoDZti/0Y//vINwylPyBdVoLyMNnFPIXntuPhVHcPqSPpJNULySAE2BngSbyetUPJRl0mjwVYf6/Qp6Q6t+CVRJDDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rw/ijvme; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rw/ijvme"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067311F000E9;
	Tue,  1 Sep 2026 03:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788233038;
	bh=OQR+5ts0BMHaIU2WhBt+uN0AbVq2Ot0u/cc8y+8zHh0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Rw/ijvmeiylAaVzjTfFoqb1uip0PWia22DE0C5F71KeHuH7mHcR4Y0s90kSl6PGWw
	 ga+qwacSbaUX6hzAF2c0zfzxP+JcZsBbEYvLDvzVCargpHS20kSHHglQbDSfju0grx
	 YQKZ9Z5UQltu2XXTgwGJgHVaPNbrkumI1tVMED0XRsYEgJff4k0NZR503blnvyMJCt
	 V8cSQgP0gQFtFul/p4+x5u0LBhm+6VaX+2p/bGiOiCHyZrUrCzzXsNZPtU1SsfoO7p
	 MLRrT6ohnCG1RmXzzmAkWYRGhYmeoiegLGjSAnZOFh2TEJY8NAL0RhIKruiqkUfj+W
	 ZOYPiXVOb+49g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 net-next 07/15] net: enetc: add .ndo_set_vf_mac() to
 the enetc v4 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260831025441.635045-8-wei.fang@oss.nxp.com>
References: <20260831025441.635045-1-wei.fang@oss.nxp.com>
 <20260831025441.635045-8-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 03:23:57 +0000
Message-Id: <20260901032358.067311F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Asymmetrical MAC address register access between set and get funct=
ions for the PF (si =3D=3D 0), causing the bootloader's MAC address to be i=
gnored and overwritten.
--

commit 7332ce3a436cebfb9b0a304898ec0b592d1b0ff9
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add .ndo_set_vf_mac() to the enetc v4 driver

Add .ndo_set_vf_mac() to the enetc v4 driver to configure the MAC
addresses of VFs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 17fd9ee27942f..eeb70feeb7737 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -579,6 +579,7 @@ static const struct net_device_ops enetc4_ndev_ops =
=3D {
>  	.ndo_hwtstamp_get	=3D enetc_hwtstamp_get,
>  	.ndo_hwtstamp_set	=3D enetc_hwtstamp_set,
>  	.ndo_set_vf_trust	=3D enetc_pf_set_vf_trust,
> +	.ndo_set_vf_mac		=3D enetc_pf_set_vf_mac,
>  };

[Severity: High]
This is a pre-existing issue, but while reviewing the MAC address handling =
in
this file, I noticed an asymmetrical register access between the set and get
functions for the PF (when si =3D=3D 0).

In enetc4_pf_get_si_primary_mac(), the code unconditionally reads from
PSIPMAR0:

    upper =3D __raw_readl(hw->port + ENETC4_PSIPMAR0(si));
    lower =3D __raw_readl(hw->port + ENETC4_PSIPMAR1(si));

However, the set function enetc4_pf_set_si_primary_mac() correctly writes
to ENETC4_PMAR0 for si =3D=3D 0.

Does this cause the PF (si =3D=3D 0) to fail to read the primary MAC address
configured by the bootloader or firmware during enetc4_pf_init()?

Since enetc_setup_mac_addresses() calls enetc_get_si_hw_addr(), wouldn't th=
is
read from the wrong register, assume no MAC is present, and generate a rand=
om
MAC address that overwrites the bootloader's MAC address?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831025441.6350=
45-1-wei.fang@oss.nxp.com?part=3D7
