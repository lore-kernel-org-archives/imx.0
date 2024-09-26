Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1678915699E
	for <imx@lists.linux.dev>; Thu, 26 Sep 2024 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727349419; cv=none; b=OR+tB5vkCwmap+1GFmF6BoEmL7y7SqPKxwEHrTRClFN9RWnxgbbXzsP3wXmBtBVR+BQ0cVS6mKcVV7NYj1viT+fak8LNjggglaDzoqWHWtmvOfFK0k08T/1RBhipzdPf+6Ubu9IXMbzR3M1szq72HBFhsRh/cEOYdPxQf37q6tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727349419; c=relaxed/simple;
	bh=gfAYz1FhSJF0mcztXmglNZGa5Hr4CN8dL+gZRiY39Ww=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FSK27G9K5fSz4XLo7Xxrf6TwvcoSUtB6XiTptTX2XRn6Xmirq6U4g7222FvVd1L8a94Gy7bFCiDAcXPYJz0Iu5AFks6X4sX7+VTIMgt08xNGSXOqNgbsb77sonHRi5JRhm6nG8xin51vPzGRxfSxYBByLB59kMPHc/7PRuyNviY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stmUI-0006bC-4t; Thu, 26 Sep 2024 13:16:46 +0200
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stmUH-001fje-Eu; Thu, 26 Sep 2024 13:16:45 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1stmUH-0005Ig-1D;
	Thu, 26 Sep 2024 13:16:45 +0200
Message-ID: <b1c5fb155c77355ef2889b6e054a5c0696481ebd.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/2] media: imx: vdic: Introduce mem2mem VDI
 deinterlacer driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Marek Vasut <marex@denx.de>, Nicolas Dufresne <nicolas@ndufresne.ca>, 
	linux-media@vger.kernel.org
Cc: Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Fabio
 Estevam <festevam@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo
 <shawnguo@kernel.org>,  Steve Longerbeam <slongerbeam@gmail.com>,
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-fbdev@vger.kernel.org, 
 linux-staging@lists.linux.dev
Date: Thu, 26 Sep 2024 13:16:45 +0200
In-Reply-To: <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
References: <20240724002044.112544-1-marex@denx.de>
	 <20240724002044.112544-2-marex@denx.de>
	 <85a5a42667e5867bc45da31baf045d4c9557f5f1.camel@ndufresne.ca>
	 <6b45e30c-b215-4f7a-91a4-fde05d78f737@denx.de>
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

On Mi, 2024-09-25 at 22:45 +0200, Marek Vasut wrote:
[...]
> > The driver is not taking ownership of prev_buf, only curr_buf is guaran=
teed to
> > exist until v4l2_m2m_job_finish() is called. Usespace could streamoff, =
allocate
> > new buffers, and then an old freed buffer may endup being used.
>=20
> So, what should I do about this ? Is there some way to ref the buffer to=
=20
> keep it around ?

Have a look how other deinterlacers with temporal filtering do it.
sunxi/sun8i-di or ti/vpe look like candidates.

>=20
> >=20
regards
Phlipp
