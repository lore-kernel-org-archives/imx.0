Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DFF266F1E
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 16:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745426114; cv=none; b=fpPsvogr0Do5Xg7mI+bBFf7y+7yJaF19G7DjNRRnNkF4OolC5jUCs37QLZp9ZYKWqiJOoQZ1uk1AXmqKo02lfxvUhgdHNC0VsGLBVg3loKtXGNUK7z3Pe6Lhn43isylv4227N8Hrf9JoYudQKfA8y0Euxy7mNwefkdBeJIpsVcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745426114; c=relaxed/simple;
	bh=DCtD7PnEVKv6mfFlASZvunhhFjRgPixis3tUNYPS2Io=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z0xze5MJkPk67wqd3NkruauTX1xp3Q6EbOvXNZnDW8ygsnrxY+ocTdiMHDjSRIyZlG+XapTvE7Xgkhy+453agA/b4ogVWtKM09fFi50Bi4BJt7uEeUAr+4HQ01cH3Mj+nt3ZW/nIXpGC5Ey2DUEJSEK5vqJtJgHiqDGqG4rRmf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7d40-0004QJ-EV; Wed, 23 Apr 2025 18:35:08 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7d40-001kTC-0N;
	Wed, 23 Apr 2025 18:35:08 +0200
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1u7d40-00H6jH-01;
	Wed, 23 Apr 2025 18:35:08 +0200
Date: Wed, 23 Apr 2025 18:35:07 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v2 2/3] soc: imx8m: Introduce soc_uid hook
Message-ID: <20250423163507.fuonemokpb6ugmlr@pengutronix.de>
References: <20250423-uid-128-v2-0-327c30fe59a9@nxp.com>
 <20250423-uid-128-v2-2-327c30fe59a9@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423-uid-128-v2-2-327c30fe59a9@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 25-04-23, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Cleanup code by introducing soc_uid hook, i.MX8MQ/M/N could reuse
> one function imx8m_soc_uid, i.MX8MP could have its own one.
> 
> With this patch, it will easy to add 128bits UID support for i.MX8MP.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
