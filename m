Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79AE4477F6
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036650; cv=none; b=kVP6lpYEktXrMP4eaIvGvYmGcCyoymzIRR4i4QTgpn//aDbxgzThNStJN6GqzTSsp5bR6rvaN/sRtzBSQcxI5qpKB8o2L8QoophQKoR4Q/R/rdlEacIvIIXcT5Yy1BCISBpH0aT/7T8oeKevYnHQ8rLIsupohJsVM9WkIZIJLtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036650; c=relaxed/simple;
	bh=FDL6zvNrd6Ds0P33Z5Y4+ojXKOmgHgb8w85yPE6BHh0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RhTUKt6tAdW8j1qAZoNBfAm7gBrrrDkKw3Ut94PiHbKdQln293TocU5hEYtCOTRrj/NBzslcmsCA2Kat2653fCaIhx9hmwfxo7+XX9JZXvz5OpluLPs2HcYMA0YVv6mFFCeEA2NmJW/YAiliu0QqskTicPbD0iDOnPmB55m+kc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LY9g4EuV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LY9g4EuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6631A1F00898;
	Thu, 10 Sep 2026 10:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036648;
	bh=lLLDN29PwIw42RRWSEV3ypDU5EirjlBvssdqfHaHtc8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LY9g4EuViL6fnKEHDWBU7joWdB7A/53MmiVyyABwYGtX9JqE73nR54RWtAwNj+182
	 f6XhaxHhSFDcP/q+uWbqNeOaqfQtZ6N8E5wgvc0tvFB78bJhlJDpVrXzj1joCiKzXg
	 3I7KAjIeU2U2OrvpTCrHgGz5aVLY2zl2Fm183PZYhsCfTEFCcaxd1m6qIsCdsfv+7m
	 +HqduAT5en2nsAaX4ZMhdE+l5hr2w0bGa9UJ0bm/us8qKx71pbrhCwq9MZHKTFVmjE
	 iyu2B2umBqxA7Cn3NehNy/iU3GgZNWzrJ51/Aro+IhNXrL4UmHXcJD08f7aPWUSN4P
	 m3ulNZZvePagw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 12/15] net: enetc: add VF support for i.MX94
 and i.MX95
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909100733.1139689-13-wei.fang@oss.nxp.com>
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
 <20260909100733.1139689-13-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:37:28 +0000
Message-Id: <20260910103728.6631A1F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ENETC4 VF incorrectly exposes `enetc_get_regs` which reads ENETC1-=
specific CBDR registers, potentially causing bus errors.
--

commit dcd5ceb06692837200f5c3183b3830a916b5816e
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add VF support for i.MX94 and i.MX95

This commit adds VF support for the i.MX94 and i.MX95 platforms, introducing
the new VF device ID 0xef00, the enetc4 SI ops, and the VF driver data. It
also wires up .sriov_configure for the enetc4 PF driver to allow creation
and teardown of VFs.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc.c b/drivers/net/e=
thernet/freescale/enetc/enetc.c
> index 80f0082f6c633..803c5c541a5c1 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc.c
> @@ -3794,6 +3794,13 @@ static const struct enetc_drvdata enetc_vf_data =
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
Does reusing enetc_vf_ethtool_ops for ENETC4 VFs inadvertently expose
enetc_get_regs() on hardware that doesn't support it?

When a user runs ethtool -d on the ENETC4 VF interface, it triggers
enetc_get_regs(). This function iterates over enetc_si_regs and reads
ENETC1-specific Command Buffer Descriptor Ring (CBDR) registers:

drivers/net/ethernet/freescale/enetc/enetc_ethtool.c:enetc_get_regs() {
    ...
    for (i =3D 0; i < ARRAY_SIZE(enetc_si_regs); i++) {
            *buf++ =3D enetc_si_regs[i];
            *buf++ =3D enetc_rd(hw, enetc_si_regs[i]);
    }
    ...
}

Since ENETC4 uses NTMP instead of CBDR, these MMIO offsets are not
implemented. Does reading them trigger a synchronous external abort
(bus error) and cause a kernel panic on ARM architectures?

The PF driver data uses enetc4_pf_ethtool_ops which avoids this, but the VF
data here reuses the ENETC1 ops. Should there be a dedicated
enetc4_vf_ethtool_ops that omits get_regs?

> +};
> +
>  static const struct enetc_platform_info enetc_info[] =3D {
>  	{ .revision =3D ENETC_REV_1_0,
>  	  .dev_id =3D ENETC_DEV_ID_PF,

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909100733.1139=
689-1-wei.fang@oss.nxp.com?part=3D12
