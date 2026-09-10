Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10241450415
	for <imx@lists.linux.dev>; Thu, 10 Sep 2026 10:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789036649; cv=none; b=DUnFQsWkbU7o8OOznQaIygI6bmOtLaFkCw2vbLyt6SyFg7PcUH5iVxLuBhN8dZ3Qe9KtXvfmJ2SUXDSUaixhiTYIJolwPoHAidl/UxnAx63uSpNEVYkMVfj8BvQ/F/AX9d0N4M1plU2GOWaB7RR6jCiB0RKIgVeibaLmxhZsocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789036649; c=relaxed/simple;
	bh=rreqp54aVTt4Ibbf3JAyDS/Wg10u+9947YLHcFkBzA8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hJMCyaCNAdF/jR3PIC2dV8vBhFnDbNJ5/T50IGXYqqdJFp6OEj086at3voJLc7yyaKiUhZW+ZbQGLtKDIokNjs6+H91e9p34h2HOEUOvEfJJmDtV5GK6mOYlvKbtYc1deOA/1qKb2OLT5/TBSpAhpjxjCOUCpjaoZ61SWRAnZfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTrT8W40; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTrT8W40"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5931F00893;
	Thu, 10 Sep 2026 10:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789036647;
	bh=Pc/Sxsf7W5vmhiu+yBWzm9crsCNhcijRTBL5ojjsyJA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=aTrT8W40rkdz5IgJpNLb/4tfehh4pfg3mluFVSSCzUV42u8RNoz6GH8KGayaBtGm6
	 JDwx3R57a1uGaQ3TLa9XoXyOhs5YPUnCSAdIGolRHeJAvQGfI2WnwKkYj3VkZmYQQs
	 kiAfjjsYuubTSs/xkfSCiR1N0tF0rXAyUqKyS3sJsZG4qsI40qSKusBj6EhvcJUnCv
	 y5mCPUoA/inyxAQcrfYWLLZmS/qzcREb3ducJTZHCfyWbnLiOUSzsziGeLWbFqDCF5
	 iXEzK5fTNMohWeQWHO5RE9Z8ob9eOi90oRMGmBv1s73S1KoK6OJITLpMqHjqA7rXHQ
	 7fkq/RFC53+Ww==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 net-next 08/15] net: enetc: move mac_filter from
 struct enetc_pf to struct enetc_si
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260909100733.1139689-9-wei.fang@oss.nxp.com>
References: <20260909100733.1139689-1-wei.fang@oss.nxp.com>
 <20260909100733.1139689-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 10:37:27 +0000
Message-Id: <20260910103727.9E5931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Fallback path in enetc_sync_mac_filters() reads corrupted hash bit=
map due to union overlap.
--

commit 5d26a4aca1dc2966f5003f268c0a69349efe5210
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: move mac_filter from struct enetc_pf to struct enetc_si

The mac_filter array currently resides in struct enetc_pf and is used to
track unicast and multicast MAC address filters for the PF. Since struct
enetc_si is the common structure shared between the PF and VF drivers,
move mac_filter into struct enetc_si to prepare for MAC filter support
in the VF driver.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_pf.c b/drivers/ne=
t/ethernet/freescale/enetc/enetc_pf.c
> index c467dc05510ef..523c713247805 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_pf.c
[ ... ]
> @@ -60,10 +60,9 @@ static void enetc_add_mac_addr_em_filter(struct enetc_=
mac_filter *filter,
>  	filter->mac_addr_cnt++;
>  }
> =20
> -static void enetc_sync_mac_filters(struct enetc_pf *pf)
> +static void enetc_sync_mac_filters(struct enetc_si *si)
>  {

[Severity: High]
This is a pre-existing issue, but since this patch refactors the mac_filter
storage, does the fallback path in enetc_sync_mac_filters() incorrectly read
corrupted hash data due to a union overlap?

Because mac_addr and mac_hash_table share a union in struct enetc_mac_filte=
r:

struct enetc_mac_filter {
    union {
        char mac_addr[ETH_ALEN];
        DECLARE_BITMAP(mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
    };
    int mac_addr_cnt;
};

When there is exactly one unicast MAC address and the exact-match insertion
fails (e.g., due to a hardware timeout), the driver falls back to hash table
filtering. Because of the union overlap, it appears the fallback path will
read the raw MAC address bytes as a 64-bit hash table mask:

    /* exact match filter */
    if (em) {
        ...
        err =3D enetc_set_mac_flt_entry(si, pos, f->mac_addr, BIT(0));
        if (!err)
            continue;

        /* fallback to HT filtering */
        dev_warn(&si->pdev->dev, "fallback to HT filt (%d)\n", err);
    }

    bitmap_to_arr64(&hash, f->mac_hash_table, ENETC_MADDR_HASH_TBL_SZ);
    /* hash table filter, clear EM filter for UC entries */

Could this cause the device to drop valid packets or receive invalid ones by
programming the MAC address bytes as the hash bitmap?

> -	struct enetc_mac_filter *f =3D pf->mac_filter;
> -	struct enetc_si *si =3D pf->si;
> +	struct enetc_mac_filter *f =3D si->mac_filter;
>  	int i, pos;
> =20
>  	pos =3D EMETC_MAC_ADDR_FILT_RES;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260909100733.1139=
689-1-wei.fang@oss.nxp.com?part=3D8
