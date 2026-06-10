Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E219E3002DF
	for <imx@lists.linux.dev>; Wed, 10 Jun 2026 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781062080; cv=none; b=YCP7Gv/fCzBbpIz39hSwbovp1Tenpkv8VLHphvF4Box+EdzL2Y1egeGWx+9Mj2aEIlYv3LCbTXTyO+Mgw3WXguLq55u5vKGXT+5BGVo9b1FpedLcDSkepbKzuWlXC1srg+7+1HScfgiJqhtIYSgBPRRDMwYYtWaICKRXZn+nWkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781062080; c=relaxed/simple;
	bh=7Oux55TZ2U5RsJikKP8NccA4o++1Jzsf09Q9tMNRT5A=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=JKruTX6kUisC+paxKYpSAEyn03ToLoMf+NtOx7oA0cM+C3b2ls9qfDBWf3PoheNwOqKMw/sN6jvXFD9dziWcK80GIpPXqaeT7k0K/obhqVOxb3eki+4W9gYZs9RM8sV1IDWhOxoLX1OBsgvsM9rJYBEGEDza9XJt+NryyxON2N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCH7Cv9s; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCH7Cv9s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09281F00898;
	Wed, 10 Jun 2026 03:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781062079;
	bh=tw7TsIL51wWkWeX3E3bfUalCJg3J/xYibjufVDEbpfk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YCH7Cv9sWzL44Ck38dZc26xHCheUoQgdB7u5BsEepwxh8u/MeNxY2DKmbptqX75s5
	 4e1G1DY3sym6d3c5sZw06Nk8UAP9ARaxo4I6A73KKDnAADjDpPhFqepUpkgSDleu8R
	 x1xp9cRZfyU2zc8WLlOTMe37vQyMnhPFpr3suxyN9qP4ocvHe0xfW0v2IHaaOBpXIK
	 TP47fPNJbv9BVwG64AaRkYtVhEptbMf22sSFvjhy0QD6dL+GO5uKibhEg5YG5Ui7Zx
	 +BJGz+SrPI2PMsbA4L/uCRRjS1xJImheYxDtHjTKlyDTx5baWV2LV5WgSHI+zjxVg+
	 K47u6jw2LqIYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 5/9] net: dsa: netc: initialize the group
 bitmap of ETT and ECT
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260609032955.2066089-6-wei.fang@oss.nxp.com>
References: <20260609032955.2066089-6-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 10 Jun 2026 03:27:59 +0000
Message-Id: <20260610032759.A09281F00898@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] Hardware ETT and ECT table out-of-bounds access due to incorrect g=
roup sizing based on available ports instead of physical ports.
--

commit 86672a593cae6156b47d02f0d2ead38cfa53953b
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: initialize the group bitmap of ETT and ECT

This commit calculates and allocates index bitmaps for the Egress Treatment
Table (ETT) and Egress Count Table (ECT) based on hardware capabilities. The
bitmap sizes are calculated by dividing the total hardware entries by the
number of available ports.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index fa7dd307ce130..d4475ad7ed6c2 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

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
Could calculating the bitmap size using the number of available ports lead =
to
out-of-bounds accesses by the hardware?

If any physical ports are disabled in the device tree, the available port
count will be strictly less than the hardware's actual physical port count.

When the hardware performs an egress lookup, it adds the physical port index
to the base ETT or ECT entry ID. Because the group size is compressed here
based only on available ports, it appears the hardware could access an entry
outside of the intended group. For the highest allocated group indices,
would this addition exceed the boundaries of the entire ETT/ECT table?

> +	if (!ntmp->ett_bitmap_size)
> +		return -EINVAL;
> +
> +	val =3D netc_base_rd(regs, NETC_ECTCAPR);
> +	ntmp->ect_bitmap_size =3D NETC_GET_NUM_ENTRIES(val) / num_ports;

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260609032955.2066=
089-1-wei.fang@oss.nxp.com?part=3D5
