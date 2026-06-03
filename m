Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0041E39FCBF
	for <imx@lists.linux.dev>; Wed,  3 Jun 2026 07:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780471294; cv=none; b=fcz5EuDtzlLqDym8GjrWysdp0y/kjwcuP82tmppZeu2FdCRCij2MRhXIj3+lXqcj9hmUwbOkEXob0/wuZpWqUiSePKhHKw+0cMCAAdRgkmmFmS2MpBIJusVuDwytZCA17hvwN23ZYte3CmGMeJoI43gymGGHyNsUP+42MemxaTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780471294; c=relaxed/simple;
	bh=1W7cSkTS7l7wgjNuTuL8L7UD64iVowzCDWu0eoGjWUI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=N6jxYmw0BJR4VhkuHAJ29Iju4vzMpelPAOnGRfJdut5BlAFCgKFMos5X8AREtS3sFR6qUd/aKZEG0goZMQ9QnrZrCuXsphyVRh5dNK7srqImjQFguEjVb7CbqN+k+5GPBbMxhzBQdBQXn94h2TCap85IOLKLkX4/DaIPf6yFoHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dA2z8fbo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dA2z8fbo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53C501F00893;
	Wed,  3 Jun 2026 07:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780471292;
	bh=Xe5VE7STFuO9a4uV07uvvbFEfRGoJJV64MjR8LfOD2c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dA2z8fboZSLfBk+oY4eoN2Xe/UqNq4o0jKD2gfnLqJbtyPJTfl8akYHPuW5pJOZfB
	 ltOR+ts/clQDiisr++suCGzDGcjb6+QbN+aftXp4HdZaY84qWDXjIiNkkjxxNtW7/5
	 O9ZDW/Ca53U0GVEdNbdGnSPv7TGFeEbn0oWaKH1HgeUe9F1LTwhb3f5k57gzRz4mvP
	 DZzjtf+VifPm0cTdgrNXLLJtLT3aAbEs8GBfgQG/nJSBgQSEkEfmL7N4z/tfSL3Jys
	 mMNrJjFudoJQw0cKb9EIYznIBgeKbxaUuxa/wSnJM2uEhxgV3wj04NkdMfOdcwUDEv
	 7WyLSOrOyausg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net-next 8/9] net: dsa: netc: add bridge mode support
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260602072313.3162120-9-wei.fang@oss.nxp.com>
References: <20260602072313.3162120-9-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 03 Jun 2026 07:21:31 +0000
Message-Id: <20260603072132.53C501F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Traffic blackhole when a port leaves a bridge due to missing `.por=
t_fast_age` implementation.
- [High] Lockless TOCTOU race on `dp->bridge` in `netc_vlan_unaware_pvid()`=
 causes a NULL pointer dereference.
--

commit 742a1b1728b1f9a1a99ef531550382edaead0751
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: add bridge mode support

Wire up the port_bridge_join, port_bridge_leave and port_vlan_filtering
DSA callbacks to support both VLAN-unaware and VLAN-aware bridge modes.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index a97121dda237a..5b58ce06beb88 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c
> @@ -1507,17 +1540,57 @@ static int netc_port_max_mtu(struct dsa_switch *d=
s, int port)
[ ... ]
> +static u16 netc_vlan_unaware_pvid(struct dsa_switch *ds,
> +				  const struct net_device *br_ndev)
> +{
> +	struct dsa_port *dp;
> +	int br_num =3D -1;
> +
> +	if (!br_ndev)
> +		return NETC_STANDALONE_PVID;
> +
> +	dsa_switch_for_each_available_port(dp, ds) {
> +		if (dsa_port_bridge_dev_get(dp) =3D=3D br_ndev) {
> +			br_num =3D dp->bridge->num;
> +			break;
> +		}
> +	}

[Severity: High]
Could this lockless access to dp->bridge result in a NULL pointer dereferen=
ce?

Because netc_port_fdb_add() and netc_port_fdb_del() are called from the DSA
workqueue without holding rtnl_lock(), this might race with another port
being removed from the bridge (which sets dp->bridge to NULL).

Is this loop necessary since the bridge number is already provided directly
in the struct dsa_db argument (db.bridge.num) passed to the FDB callbacks?

[ ... ]
> @@ -2009,8 +2285,11 @@ static const struct dsa_switch_ops netc_switch_ops=
 =3D {
>  	.port_mdb_add			=3D netc_port_mdb_add,
>  	.port_mdb_del			=3D netc_port_mdb_del,
>  	.port_set_host_flood		=3D netc_port_set_host_flood,
> +	.port_vlan_filtering		=3D netc_port_vlan_filtering,
>  	.port_vlan_add			=3D netc_port_vlan_add,
>  	.port_vlan_del			=3D netc_port_vlan_del,
> +	.port_bridge_join		=3D netc_port_bridge_join,
> +	.port_bridge_leave		=3D netc_port_bridge_leave,
>  	.get_pause_stats		=3D netc_port_get_pause_stats,

[Severity: High]
Will the lack of a .port_fast_age callback cause a traffic blackhole when a
port leaves a bridge?

Without this callback, the hardware FDB table retains dynamically learned
MAC entries pointing to the departing port. At the same time,
netc_port_bridge_leave() removes the egress rules. Traffic would be routed
to the departed port and dropped at egress until the FDB entries naturally
age out.

I see this is fixed later in the patch series in the commit "net: dsa:
netc: implement dynamic FDB entry ageing", but I wanted to mention it as
it breaks forwarding temporarily during the series.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602072313.3162=
120-1-wei.fang@oss.nxp.com?part=3D8
