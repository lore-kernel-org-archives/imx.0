Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7236F1514F6
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 16:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425768; cv=none; b=sQVnuVn/4jqQrpj6/zBdyIm/d9nZFa3RXjGSwOc6Xpobwvqx0g1iacMwJ5jIxJH4sxGBmGItGDmRZKae45U6u1GXjlA9EB2p7Q94aoy6/sA0i1NcXL8Js7Cml/cdQKScy1lTgXqSwAJCOwB1Mf7HPdpwnTGYn9MV+d1fTqFwUXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425768; c=relaxed/simple;
	bh=KxcHnZYYoBmp7BD7P4s3CikLglkzwdJOyyb/R9wQQUk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T56KCfCtzslzQfkCsrqjjsC5zeM9J7vxgTLQ4pUN3S1SczTnqkHa7uNEYWrzgcw2TpI0nCVCYGc2cYq6WILGUmgRqDt48Rez24hikE2bkKAL/5L21PlspTaQ7EU7/e8HSndyhyCWAuH69oclnjCY5tyLOz1gI0K8BIEugyottCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyN-0002kv-71; Wed, 23 Apr 2025 18:29:19 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyM-001kOA-2j;
	Wed, 23 Apr 2025 18:29:18 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7cyM-00H6e4-2N;
	Wed, 23 Apr 2025 18:29:18 +0200
Date: Wed, 23 Apr 2025 18:29:18 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 1/3] soc: imx8m: Cleanup with adding
 imx8m_soc_[un]prepare
Message-ID: <20250423162918.en4zmphifvot43dt@pengutronix.de>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
 <20250423-uid-128-v2-1-327c30fe59a9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-1-327c30fe59a9@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-04-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> There is a common flow to i.MX8M family, map OCOTP register base and
> enable ocotp clk first before read Unique ID from OCOTP.
> 
> So introduce imx8m_soc_prepare to do ioremap and enable the ocotp clk,
> and introduce imx8m_soc_unprepare to disable the clk and do iounmap.

Wouldn't have gone that far, but the changes lgtm.

> With this patch, no need to spread the ioremap and clk handling in
> each soc_revision hook.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
