Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF5C3749FD
	for <imx@lists.linux.dev>; Thu, 25 Jun 2026 07:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372272; cv=none; b=aqqQMYWRBVnm1I3A9rJYMMBpenTwgqqKsCOozvPXZBouEydo3jooq/oQjVK0AnWrkx3RrEt0nxHsEK6he76b1nJ94qnYjk4DncArcGtpwn3bu/4ugJawCdbBDB4J6QhuNBixtVE+K539IQGtpMeFL0u8DkKSwENEK1Hf4K2qzz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372272; c=relaxed/simple;
	bh=sm61DZnkOSbMPAgSJoMbaBpjM/Y3KdPwSPN7vVXeEZY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=E8BxQ6fj1NF8P3oWjk3M7wWQdfHTxbn6gwt1kXRuCjKm71dUsJ0OxSH4riWTuf7dwwy3WP6c5KTHaKdmVT/hwN2UDpRRzKdqDTW4Uw3eHu8S6uBfpI6OHKp7YJ11IvI5YPf5WDUoSYpLUM6q+1Tf/PbEbkKoP6ZMctAs301T62k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PuwAJ/HY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PuwAJ/HY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0E181F000E9;
	Thu, 25 Jun 2026 07:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782372270;
	bh=9M/qVFWqf+4F5fWJrXOq4DALZr9ia5RpXGO00P3mlKg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PuwAJ/HYNLWNcgazUCpEZjDxsqZXUgy1VCyx1kPr61cnh0LxZZ/koCnqlw+AyjQ0F
	 qLyw0ZU6MudkPD+O9H5Vk/6ReC+pdxrkDmWV901YYAq1jh10tcvJI8jr9PI+P+nv0F
	 4024kd0HtvxnX0SqaiLvpJBB4kcCXSBIjskyUHPzSPIz12Fc8i9EGUCW3PcOWlL4nr
	 kUuLwzrfOA6NqDySpQaHY5BBryrXhfBF919dCpDEQDabisQH7jt84YxXokvblh73fX
	 Rb0iaT9B6n2oOYFsxPPsk8HdPa2LCtRYLo+Wt3tz8oTnmb291fkp04bklYhCQ2W2WJ
	 +cBlAvLclw9WQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net] net: enetc: fix potential divide-by-zero when
 num_vsi is zero
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260624072726.1238903-1-wei.fang@oss.nxp.com>
References: <20260624072726.1238903-1-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jun 2026 07:24:30 +0000
Message-Id: <20260625072430.B0E181F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Potential divide by zero in `enetc_port_si_configure()` when distr=
ibuting remaining rings to VFs.
--

commit acc8f735fcd690e1b12e85278ec996003795aeda
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: fix potential divide-by-zero when num_vsi is zero

For i.MX94 series, standalone ENETCs do not support SR-IOV, leaving
pf->caps.num_vsi at zero. This leads to a divide-by-zero in
enetc4_default_rings_allocation() when distributing rings. The patch
adds an explicit check for num_vsi to return early and avoid the bug.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index 4e771f8523580..437a15bbb47ba 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -322,6 +322,9 @@ static void enetc4_default_rings_allocation(struct en=
etc_pf *pf)
>  	val =3D enetc4_psicfgr0_val_construct(false, num_tx_bdr, num_rx_bdr);
>  	enetc_port_wr(hw, ENETC4_PSICFGR0(0), val);
> =20
> +	if (!pf->caps.num_vsi)
> +		return;
> +

[Severity: High]
This isn't a bug introduced by this patch, but while you are fixing the
divide-by-zero here, I noticed a very similar pattern in enetc_pf.c:

drivers/net/ethernet/freescale/enetc/enetc_pf.c:enetc_port_si_configure() {
...
	if (num_rings) {
		num_rings /=3D pf->total_vfs;
		val |=3D ENETC_PSICFGR0_SET_TXBDR(num_rings);
		val |=3D ENETC_PSICFGR0_SET_RXBDR(num_rings);
	}
...
}

Does this code also lack a check to ensure pf->total_vfs is not zero?

If the hardware advertises more than 8 rings but SR-IOV is disabled or
unavailable (making pf->total_vfs zero), could this trigger the same
divide-by-zero exception when distributing the remaining rings to VFs?

>  	num_rx_bdr =3D pf->caps.num_rx_bdr - num_rx_bdr;
>  	rx_rem =3D num_rx_bdr % pf->caps.num_vsi;
>  	num_rx_bdr =3D num_rx_bdr / pf->caps.num_vsi;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624072726.1238=
903-1-wei.fang@oss.nxp.com?part=3D1
