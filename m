Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2632F7F16
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 03:27:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783049237; cv=none; b=aYqKa9i0BIFewQDs+3gYuXqHwsXqTEyoY6jA+so0PjdGmvtHkABpv/AvZ4X7njKtiZBUdY/Ag3L3GOQRDbVkInzLRDt+owh6sgqbbV3ZxGJ3L9TWWEn7KtH/aYAseuhM8gK284oXfdeX3oQfq5Iy1WWF3lexBDMFjehX/fdtVuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783049237; c=relaxed/simple;
	bh=2m2rRS310q16SvOxUdLCldSXIJWkh2P49TaFO6hlyQ0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cISnmN2KOmsdgx+leZjGjIn5Uchf4b3B/IEOCYcf3MHoGYb1qMvnpQrgTbFgtw1JgHbcQGap+aNJBNbbK9oFkbGRIVgqEmwuTkW+NxrXF+EE0BvZXXOhkA1G+HXSqq+7JBWiRaRdKzaI/CHo7k8V61oCWFYXpTM4idN6ACqpgnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PlGFhXH9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PlGFhXH9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A00E1F00AC4;
	Fri,  3 Jul 2026 03:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783049226;
	bh=DNbb1/PCKTB9HRLxkVs7NWAtL2Wwen+JuuQ7H6GgNH4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=PlGFhXH9j5alUHQtnoEbWCvpPJjA1y9IoEb+fKqKEhDe49R1HgE2D43adRWRAAmBW
	 eSqiKGACJugPZ2mNIj5thhppvxfcH9ufcsrK8SVjwurT0NCOJGfgKJVjOgCnb9cBAe
	 EYOTbqE3cMJG2zklqwc0xwvq9tHWMhXZCSDtRwxZpOTXaAwsWl8ONp2JfNQXNTCSuY
	 2fN11X+fL1FlIOfgQbITBXl4HHXABX9f0dP8cWkICOeVxq0/y1n4sDwkcdbajdN4vU
	 eIf/Xz3GMymNrk9Pc4nGx2ZY+gN+UZsrrtkobpj9ElVyheXpIVHpELQ+pdIDQC6vqz
	 uAE8FcsFr+Nsg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 14/14] net: enetc: use kzalloc_flex() for
 enetc_psfp_gate allocation
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260702025714.456233-15-wei.fang@oss.nxp.com>
References: <20260702025714.456233-1-wei.fang@oss.nxp.com>
 <20260702025714.456233-15-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 03 Jul 2026 03:27:06 +0000
Message-Id: <20260703032706.8A00E1F00AC4@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Hardware data buffers for Stream Gate Control List (sgcl_data) and=
 Stream Filter Counters (sfi_counter_data) use native u32 fields without cp=
u_to_le32() / le32_to_cpu() conversions.
--

commit e19bf50d7194e9cfc29fbcd1560a65dbc9d0f7a0
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: use kzalloc_flex() for enetc_psfp_gate allocation

Replace the open-coded struct_size() + kzalloc() pattern with the
kzalloc_flex() helper when allocating struct enetc_psfp_gate. This
removes the intermediate entries_size local variable and makes the
allocation site more concise.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_qos.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_qos.c
> index 7b17bca24f260..2aa0fcaafcd23 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_qos.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_qos.c
[ ... ]
> @@ -1242,8 +1241,7 @@ static int enetc_psfp_parse_clsflower(struct enetc_=
ndev_priv *priv,
>  		goto free_filter;
>  	}
> =20
> -	entries_size =3D struct_size(sgi, entries, entryg->gate.num_entries);
> -	sgi =3D kzalloc(entries_size, GFP_KERNEL);
> +	sgi =3D kzalloc_flex(*sgi, entries, entryg->gate.num_entries);

[Severity: High]
This isn't a bug introduced by this patch, but does the hardware data buffer
for the Stream Gate Control List (sgcl_data) and Stream Filter Counters
(sfi_counter_data) need cpu_to_le32() / le32_to_cpu() conversions?

In enetc_streamgate_hw_set(), native u32 values are written into the
sgcl_data structure without endianness conversion:

    sgcl_data->ct =3D sgi->cycletime;
    sgcl_data->cte =3D sgi->cycletimext;

and later for the entries:

    to->interval =3D from->interval;

Similarly, in enetc_streamcounter_hw_get(), native u32 values are read from
the sfi_counter_data structure:

    cnt->matching_frames_count =3D ((u64)data_buf->matchh << 32) +
                                 data_buf->matchl;

Since these structures are mapped to hardware via coherent DMA memory, will
this cause the hardware to receive incorrect configuration values and softw=
are
to read corrupted QoS statistics on Big Endian architectures?

>  	if (!sgi) {
>  		err =3D -ENOMEM;
>  		goto free_filter;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260702025714.4562=
33-1-wei.fang@oss.nxp.com?part=3D14
