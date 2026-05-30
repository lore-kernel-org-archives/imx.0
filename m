Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D232E738D
	for <imx@lists.linux.dev>; Sat, 30 May 2026 00:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780102211; cv=none; b=TkZVDc6KTAtnbKRDYnheML7mGtTyaIFQP5ooLMgZY3W+sJzvkfh0ERbT4JAimi0HB4gPBNwAEX0odidDh10wMLhH1GYD3jziAus+tXQDTrLVOmwhyey4WEqtEpz3LXN21a0gfmXTxjNUEwgvy9FH0XW4WzezzcxYk9TB/C+hZVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780102211; c=relaxed/simple;
	bh=Bs6nrHaMKGxMcG1ZtxSZ1fPtGTvWJPrMX8V0jXLsmuY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=W+7ZPfWcCiyiMZUaVcQHfR883QDV/8yz3V0Od7JvOwWa8BbYEWHgRvOZNtb/3nHRQcmq7FQ/WLduVLTHzgTkw2G9+x2l7HYdrifoZkiETVoU397s/S+NJzcuNAkTV6ah4UCp0iWuUaDcySrqD+t2WYqMB05/TomAPPyZ37o4xVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lRyGjHEY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lRyGjHEY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EB691F00893;
	Sat, 30 May 2026 00:50:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780102210;
	bh=M5iU536H+ADru/55wScdvBn4Rjs9qqakm1iK7J9o6eQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=lRyGjHEY28S4ZFN/iG84rKLLxwLn4CpX532dWV4yKHjgx+ik+UFU2FrGnDB98g6NI
	 f+fT7lo+SX652A14K6TS8aEFzaynotvWevYtpbgcLSWiFfJuG7bDBmD12EXfrS9muA
	 xZGUrPRZTSnAeqFbuAOAsvvyJPdEVlI4r9pb+cwSR1qL90QxIVG56IVXqveBYH8gdf
	 Jpjq02zHRTZf8ssLLtNnvB5IIjTgtZ3o/FU6wuvtlSxrqAxtDMWpxKJDnFR+9fE1Ph
	 wzZ1z8D36sUN5+/rwoyrh5WKXBO8qHoP+z4ZmQe3NtWm/CgPwVE23skLuMRYZYsPkH
	 hYidytiZPn1IA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 9/9] net: dsa: netc: implement dynamic FDB
 entry aging
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260527100217.794987-10-wei.fang@oss.nxp.com>
References: <20260527100217.794987-10-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 00:50:06 +0000
Message-Id: <20260530005009.7EB691F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] Setting aging time to 0 incorrectly results in aggressive 1-second=
 aging instead of disabling aging.
- [Medium] Changes to the aging time do not take effect immediately due to =
failure to reschedule the pending delayed work.
--

commit d6713501ccd21f4b93ade1b9678b912b0922c0ca
Author: Wei Fang <wei.fang@nxp.com>

net: dsa: netc: implement dynamic FDB entry aging

The NETC switch does not age out dynamic FDB entries automatically. This
commit adds a delayed work to periodically remove unrefreshed entries,
along with DSA operations to configure aging time and flush per-port
entries on demand.

> diff --git a/drivers/net/dsa/netc/netc_main.c b/drivers/net/dsa/netc/netc=
_main.c
> index 1fe3b43e04598..cffa479e19b3f 100644
> --- a/drivers/net/dsa/netc/netc_main.c
> +++ b/drivers/net/dsa/netc/netc_main.c

[ ... ]

> @@ -1977,6 +2026,34 @@ static void netc_port_bridge_leave(struct dsa_swit=
ch *ds, int port,
>  	netc_port_del_vlan_entry(np, vlan_unaware_pvid);
>  }
> =20
> +static int netc_set_ageing_time(struct dsa_switch *ds, unsigned int msec=
s)
> +{
> +	struct netc_switch *priv =3D ds->priv;
> +	u32 secs =3D msecs / 1000;
> +	u32 act_cnt, interval;
> +
> +	if (!secs)
> +		secs =3D 1;

[Severity: High]
In the bridge subsystem, an aging time of 0 explicitly means that dynamic
FDB entries should never age out. Because the driver does not configure
ds->ageing_time_min, the DSA layer allows an msecs value of 0 to reach
netc_set_ageing_time().

Does forcing secs to 1 here break the ability to disable aging?=20

Instead of disabling the software aging work, it configures the work to run
every 1 second. Can this cause immediate MAC address eviction when the
expected behavior is for aging to be disabled?

> +
> +	for (interval =3D 1; interval <=3D secs; interval++) {
> +		act_cnt =3D secs / interval;
> +		if (act_cnt <=3D FDBT_ACT_CNT)
> +			break;
> +	}
> +
> +	WRITE_ONCE(priv->fdbt_acteu_interval, (unsigned long)interval * HZ);
> +	WRITE_ONCE(priv->fdbt_ageing_act_cnt, act_cnt);

[Severity: Medium]
When netc_set_ageing_time() updates priv->fdbt_acteu_interval, it only uses
WRITE_ONCE() without updating the currently scheduled fdbt_clean work.

If the previous aging interval was set to a large value and is then reduced,
will the system wait for the remainder of the old duration before waking up
and applying the new aging parameters? Should this call mod_delayed_work()
to apply the changes immediately?

> +
> +	return 0;
> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260527100217.7949=
87-1-wei.fang@oss.nxp.com?part=3D9
