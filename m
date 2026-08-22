Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7BF493644
	for <imx@lists.linux.dev>; Sat, 22 Aug 2026 06:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787380703; cv=none; b=OtLDL+a9QieAqDOrlVzRNZ5PezoNK2r29RBzvxJDshOCfK+k02dP6C+NCN9GRC0FC5hFAiUJCmLvnKP/s7Ctq5/goeYRXY84jAgMsMhH1akEI+8vPxWNKOYu/v6HgDVdXy8GhwL8ibz04txvYdrZffMMbcNYMWghYb1GEPmodHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787380703; c=relaxed/simple;
	bh=ZPWOTWlpw992XTMU/+lFhCxMcbYuq45eR8eP46LkXkU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kxRZWUDohJw6B1Vp4P0BQSjP3QA8S00vIO+Xb0dbtu98HxIme72rL7heHLNfN2qk4slDNF+R15qTK+yTt8uud3REv6WxbBYvBTjaHtos/n4ELlI00Hw73ar4aAaieltpxjbCuHhUZWrjmbr/6SgcckEWkPylLS0pTJ8OhOdJ0i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFJSdPaL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFJSdPaL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACFA21F000E9;
	Sat, 22 Aug 2026 06:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787380701;
	bh=EyMw2dcBHtuk9qfeDLgTG09GaSFsCYi/jTJYl93EqJc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AFJSdPaLuAmpQZFzPk4TqJw1OoUMZL05FLzi0IZE1N8bkfADdENc1/u9aAsgo91p3
	 M6uxwCdDIx6wlHeDhc3eGOraynafWOTP9R/BDPHhPndocrkmScnMEW/F21X7KzDfCG
	 xmC8PE5fhOi+yW7qA1Xue5R6QJniAWyB79AtaxK/93h6z82K+0DGVeoDgOSfGiNKwD
	 /UDQveeWr3nq0+z0xlgKKVLqbiwC4ZrdR6scujTsr3NoV5ITRr4L6jrPVwSg9t1/gT
	 olze8QK2+jNVSy3nboNwtQCDH3OJulvxXu4d11xnG09TLliFNXnqOLmfBlxdT6PJ3c
	 azBz6IAiMVC/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 net 2/2] net: enetc: restore RX ring congestion mode
 for ENETC v4
Reply-To: sashiko-reviews@lists.linux.dev
To: wei.fang@oss.nxp.com
Cc: Frank.Li@kernel.org, imx@lists.linux.dev
In-Reply-To: <20260821064140.1315611-3-wei.fang@oss.nxp.com>
References: <20260821064140.1315611-1-wei.fang@oss.nxp.com>
 <20260821064140.1315611-3-wei.fang@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 22 Aug 2026 06:38:21 +0000
Message-Id: <20260822063821.ACFA21F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Unprotected read-modify-write of the ENETC4_PM_CMD_CFG(0) register=
 can cause configuration loss via a TOCTOU race.
--

--- Patch [2]: [PATCH v2 net 2/2] net: enetc: restore RX ring congestion mo=
de for ENETC v4 ---
commit bd5bd2aaf8ee0b0d3b280c89c74f1cacc1556562
Author: Wei Fang <wei.fang@nxp.com>

net: enetc: restore RX ring congestion mode for ENETC v4

This commit fixes an issue where the RX BD ring congestion mode is cleared
during runtime reconfiguration and never restored. It tracks the desired
state in a software flag and restores it when rings are re-enabled,
ensuring flow control continues to work.

> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c b/drivers/n=
et/ethernet/freescale/enetc/enetc4_pf.c
> index fcfbabb29d22e..9bb1004548abc 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_pf.c
> @@ -718,22 +718,14 @@ static void enetc4_set_rx_pause(struct enetc_pf *pf=
, bool rx_pause)
>  	enetc_port_mac_wr(si, ENETC4_PM_CMD_CFG(0), val);
>  }

[Severity: High]
This is a pre-existing issue, but does this read-modify-write on
ENETC4_PM_CMD_CFG(0) need to be protected by si->gen_lock?

It appears enetc4_set_rx_pause() and enetc4_mac_tx_enable() run from the
phylink_resolve workqueue, which does not hold rtnl_lock. Meanwhile,
ethtool commands (like changing loopback) trigger enetc4_pf_set_loopback()
under rtnl_lock.

Since both paths perform lockless read-modify-write operations on the
same ENETC4_PM_CMD_CFG(0) register, could a concurrent link state change
and ethtool command result in a race condition where one of the updates
is overwritten and lost?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260821064140.1315=
611-1-wei.fang@oss.nxp.com?part=3D2
