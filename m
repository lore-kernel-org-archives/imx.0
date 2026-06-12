Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29683612F1
	for <imx@lists.linux.dev>; Fri, 12 Jun 2026 02:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781230394; cv=none; b=h//y3rM5pFigSQmeni78gJRGmtg7KX4vOzCL1XmF0V4+Q+zcGktE1PJUBC9oPokU3eQJVXDKk8AfpZ/nxHgt0lMdrnsKDfGqe0l41/gVInLrhfWR2hDO+Y6wENUwfzwu47TbsHJd/QxGN4THnP25sS13eKJfAnVvbxUgCQrBpV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781230394; c=relaxed/simple;
	bh=fanhHdoQOYBIlzpRduVr3AcjdylyPRkDd/gth+08BEo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ora1b6uLbL8DXYzUjUAOs99PKK1goRD3Jt8KijJ3DtVct+qc2zS7x/VDmYfOir/s1tO8UJnAqwq7OvfgiF0VZ1AdkfekVfqyAiiPDRyLv3SDCTkISqQG83Yko3MMC0AVTUvWDMnYg+zow0u0ELiuhDHhSUdTy3DRHe2C0k/NCsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=giStFSXg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="giStFSXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C5651F00A3F;
	Fri, 12 Jun 2026 02:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781230393;
	bh=0Dz7UUQMPFxxKmpdvPsOlHPos2f0lCEhXQ35lCK4gxQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=giStFSXgTzD5bLBbIlkCN7fk52Lkvm1WPjvsKfLuJSzsdNxpGDHYfEmyXIJx8vfuC
	 wolExcQez2s60moezzrvfEX7cbr2lAGeb3d/fH2B54A+BnUcLIzWDAjS3K0esY/SLZ
	 JuUxqTqUNcIMCk7ihIHteDW9sfbFHfRyzCzkAbyot4PBe9sZYU99cc+3ap8xnk7unw
	 yHvd7rkNKZPyMk1SpL5TE3s9WeCDWx4SBWwY7sPevIk1dbM3qn9s/lYsNtxir0Isds
	 IanD+yg7ry9xXkl1HUUstLim66xG03Pbw//sxeX7icv+4oty+3v0HO2SxFsWN+R3Ge
	 LCDdObAh2QSuw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 net-next 5/9] net: dsa: netc: initialize the group
 bitmap of ETT and ECT
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260611021458.2629145-6-wei.fang@oss.nxp.com>
References: <20260611021458.2629145-6-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 02:13:12 +0000
Message-Id: <20260612021313.0C5651F00A3F@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] ETT/ECT table group size calculation incorrectly uses the number o=
f available ports rather than total physical hardware ports, leading to cro=
ss-group table entry overlap and corruption when some ports are unused.
--

commit fef50c5cec2c9c640a1d7dda90141b99f16c02ff
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: initialize the group bitmap of ETT and ECT

Initializes the group index bitmaps for the Egress Treatment Table (ETT) and
Egress Count Table (ECT) based on hardware capabilities. The bitmap size is
calculated by dividing total hardware entries by the number of available po=
rts
for software allocation management.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index fa7dd307ce130..d4475ad7ed6c2 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
[ ... ]
> +static u32 netc_num_available_ports(struct netc_switch *priv)
> +{
> +	struct dsa_port *dp;
> +	u32 num_ports =3D 0;
> +
> +	dsa_switch_for_each_available_port(dp, priv->ds)
> +		num_ports++;
> +
> +	return num_ports;
> +}
> +
> +static int netc_init_ntmp_bitmap_sizes(struct netc_switch *priv)
> +{
> +	u32 num_ports =3D netc_num_available_ports(priv);
> +	struct netc_switch_regs *regs =3D &priv->regs;
> +	struct ntmp_user *ntmp =3D &priv->ntmp;
> +	u32 val;
> +
> +	if (!num_ports)
> +		return -EINVAL;
> +
> +	val =3D netc_base_rd(regs, NETC_ETTCAPR);
> +	ntmp->ett_bitmap_size =3D NETC_GET_NUM_ENTRIES(val) / num_ports;

[Severity: High]
Does calculating the group size based on the number of available ports rath=
er
than the total physical hardware ports create an issue if some ports are
disabled?

If a board has disabled ports, this will produce a smaller group size. Since
the hardware inherently uses the uncompressed physical port ID to index into
the ETT/ECT during packet egress, could this lead to cross-group table
overlap?

For example, if port 1 is disabled on a 4-port switch, the group size becom=
es
3. If software programs port 3's configuration at base + 2, but the hardware
accesses base + 3 on packet egress, won't this overlap with the start of the
next group, potentially applying incorrect egress treatments?

> +	if (!ntmp->ett_bitmap_size)
> +		return -EINVAL;
> +
> +	val =3D netc_base_rd(regs, NETC_ECTCAPR);
> +	ntmp->ect_bitmap_size =3D NETC_GET_NUM_ENTRIES(val) / num_ports;

[Severity: High]
Similarly, will using the available ports count here cause the same cross-g=
roup
boundary overlap issue for the ECT group size during hardware accesses?

> +	if (!ntmp->ect_bitmap_size)
> +		return -EINVAL;
> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611021458.2629=
145-1-wei.fang@oss.nxp.com?part=3D5
