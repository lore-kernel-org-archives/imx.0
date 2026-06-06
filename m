Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A8F572622
	for <imx@lists.linux.dev>; Sat,  6 Jun 2026 07:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780730681; cv=none; b=kgybkXmuIHOOu/QhTgjdmqN9ge7WbF+FDaMPw5zkTptfeGc5LOdD9QwDE5CrQGhJzTrjA2O3btQVGUgCuP3cTsDXQIfTTsIMtLf9EVu0VeorKw1ouaa+O0OKYsmnJumOWJsUJVHa2qJVIiQJfTebsUSHhnMZD1mfmpmYAf8mIH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780730681; c=relaxed/simple;
	bh=xCpVKxKP2wtabXjzmZ6/aRzQTqktCH3GdTq70pBMBVE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=NRwUQvX+yPNwP1xtuWgGbKVhIzjgUbLnaEV70t0B//fVV+R4QDOAahfnU50MFX2dJxBXx7w06Wo3vNykTgwzsm8tPJgOo/7Fq4ABuRQAN71qb+iYqcEk/WZmYaJW9VRwse9mxx/U/BPF79zHpioZRF8P1CDZF4EbRt0SWfpX5sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gnj7hVeg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gnj7hVeg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F25081F00899;
	Sat,  6 Jun 2026 07:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780730680;
	bh=GKhdtXcoaPKa928Os6NEBXcwdZEPDSde8apTN+1jKJs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gnj7hVegoO1wuZdKMthZGKZ8ywXkOQJumY6tz8VUkMvAeMCtZ0ncDb+NOgp2n7bJp
	 6htNgdYssNmybmOzFMD06BWsqj/7lKm2ltL+45Uf0gRZ+w1fZqNA+sKV86a5zMJ/NE
	 WbPqf4xA2a9Ok+WPFcX0NoqBUVQVN+v90HQkIHm84ibIiXMSr9z+XW8tlMvSUiVA+l
	 vFyXK0msHu3MV6kkMrZJLtI4lEY9lek7iklxzhyO0XhN3a+N5UlgxIhmDJ8bv5AGvi
	 oxEYctEv75WEsOHmY0WBTWkCJONj3f+8g+XPiXajMLywJ7sl9gNqtkGH8Y06NyWvvG
	 4BwO0wrlcv5lQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 04/15] net: enetc: add link speed message
 support to PF driver
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: imx@lists.linux.dev, Frank.Li@kernel.org
In-Reply-To: <20260605065550.3038579-5-wei.fang@oss.nxp.com>
References: <20260605065550.3038579-5-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 06 Jun 2026 07:24:39 +0000
Message-Id: <20260606072439.F25081F00899@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] An unprivileged VF can flood the PF with `ENETC_MSG_GET_CURRENT_LI=
NK_SPEED` messages to cause global `rtnl_lock` contention, leading to a hos=
t-wide control-plane Denial of Service.
--

commit 3eea0a03e4cdfef39b34f0bcd2ee86ea5e1372eb
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: add link speed message support to PF driver

This commit adds link speed message support to the PF driver for DPDK-owned
VFs. The PF can now reply with the current link speed when queried by a VF,
improving synchronization and performance adjustments in the VF-side
applications.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_msg.c b/drivers/n=
et/ethernet/freescale/enetc/enetc_msg.c
> index c93b4e6913d86..49c1ca14735c9 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_msg.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_msg.c

[ ... ]

> +static u16 enetc_msg_get_link_speed(struct enetc_pf *pf)
> +{
> +	struct enetc_ndev_priv *priv =3D netdev_priv(pf->si->ndev);
> +	struct ethtool_link_ksettings link_info =3D {};
> +	u16 pf_msg;
> +
> +	pf_msg =3D FIELD_PREP(ENETC_PF_MSG_CLASS_ID,
> +			    ENETC_MSG_CLASS_ID_LINK_SPEED);
> +
> +	rtnl_lock();
> +	if (phylink_ethtool_ksettings_get(priv->phylink, &link_info)) {
> +		pf_msg |=3D ENETC_PF_MSG_SPEED(ENETC_MSG_SPEED_UNKNOWN);
> +		rtnl_unlock();
> +
> +		return pf_msg;
> +	}
> +	rtnl_unlock();

[Severity: High]
Can an unprivileged VF flood the PF with ENETC_MSG_GET_CURRENT_LINK_SPEED
messages to cause global rtnl_lock contention?

Because enetc_msg_get_link_speed() unconditionally acquires the global
rtnl_lock() to query link settings in response to a VF request, a malicious
or malfunctioning guest could potentially spam these messages in a tight
loop.=20

Could this severely starve other processes and VMs on the host that require
rtnl_lock for routine network configuration, resulting in a system-wide
control-plane denial of service?

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260605065550.3038=
579-1-wei.fang@oss.nxp.com?part=3D4
