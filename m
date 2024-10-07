Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6862A18BBB4
	for <imx@lists.linux.dev>; Mon,  7 Oct 2024 08:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728291096; cv=none; b=tPvkUEDDeHgDg1V7MOzZu59XM4CLwuS1PPKt4SpyuU+1WGCXEti8yCRybcuU/zb99iSUrGZA8AebJ86alRDNRB4scdbA74jf2rOAY7sFME8L+rppADkP1bF+eRU+n4YeyF+Da/PGLVZzXKYt/dfbMlMtWzv+E9lgIWyHSDQ8X0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728291096; c=relaxed/simple;
	bh=HSyA+zMX3RIma3Uc1fDAr361xp36DCjhH/lwkvAxAm0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dP8bpvbos0FPCAq/hthuYb7j/HUcFpCeDc4caBOvbpumCFbRkxHFmoA+4fYUyyYLAFDN5RyMOPNaNjfrA94lYsXxpCA7Az7XSHgYvQ7X0U0/fqIG22V6GXoRWApQNPq5xzWaSDBMWPz5y34XsLw7g+qKJtcaefEOkckJmF+eV7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjSf-0001Ea-DO; Mon, 07 Oct 2024 10:51:25 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjSe-0005TO-UC; Mon, 07 Oct 2024 10:51:24 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1sxjSZ-000C69-2f;
	Mon, 07 Oct 2024 10:51:19 +0200
Message-ID: <b136e07f0dfd3142a01b11cd4e04d2b25e7428fe.camel@pengutronix.de>
Subject: Re: [PATCH] gpu: ipu-v3: vdic: Drop unused prepare_vdi_in_buffers()
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, linux-media@vger.kernel.org
Cc: Fabio Estevam <festevam@gmail.com>, Greg Kroah-Hartman
	 <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Pengutronix Kernel Team
	 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
	 <shawnguo@kernel.org>, Steve Longerbeam <slongerbeam@gmail.com>, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Date: Mon, 07 Oct 2024 10:51:19 +0200
In-Reply-To: <20241003122813.44746-1-marex@denx.de>
References: <20241003122813.44746-1-marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On Do, 2024-10-03 at 14:27 +0200, Marek Vasut wrote:
> This function is unused and unlikely to be used in the near future.
> Remove it.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Thank you,

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
