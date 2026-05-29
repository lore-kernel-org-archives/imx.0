Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320D4303A37
	for <imx@lists.linux.dev>; Fri, 29 May 2026 15:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780068065; cv=none; b=De+bxN1njg05AtRFZ4CEw4mJTtHMR+IYKIFy0IuM2zQ3YseQZ7pZfkW6Fo9AK4903is5sJTzWhGXUPZylP81z/Kv6A+59FPmrJ8BNC3L18o3V3Xi3ZAg8ucNE0dDTb0mGpZUUYdSZkiyL2A6RGc6BwYAOjwj0ALXm5AYz7v+ibg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780068065; c=relaxed/simple;
	bh=1kL+N58u039KnMdXIo0/YsoO+gTI2M1rlBm+eoC0WBc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eQmbjDFpPW8nZhrW9qPFp2rj2f4kPSZmDcuGAJT6jCR9aujQ8c7gSb2fUHGPylaVrp8dRp6YopDCejAmzlbQU+5RRw9s2NC9YnHnXwaF8V0YhGFqKJvv9Zpow/rKH2Xv/TKRDjeR9V2X3SscQ2lBvk4jhYIXnbITjV2EYxdsGyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[IPv6:::1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1wSz16-0002oU-Rc; Fri, 29 May 2026 17:20:56 +0200
Message-ID: <7ca82ce17e772bfe3b12c5c82ace96386eaff387.camel@pengutronix.de>
Subject: Re: [PATCH v2 0/2] drm: lcdif: FIFO underrun/solid color bug fix
From: Lucas Stach <l.stach@pengutronix.de>
To: Frieder Schrempf <frieder.schrempf@kontron.de>, Paul Kocialkowski	
 <paulk@sys-base.io>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Frank Li
 <Frank.Li@nxp.com>, Sascha Hauer	 <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Marco Felsch	
 <m.felsch@pengutronix.de>, Liu Ying <victor.liu@nxp.com>
Date: Fri, 29 May 2026 17:20:54 +0200
In-Reply-To: <01c33cda-e6ac-44a8-b1eb-8a8d7118175e@kontron.de>
References: <20260402183351.3281123-1-paulk@sys-base.io>
	 <01c33cda-e6ac-44a8-b1eb-8a8d7118175e@kontron.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

Am Mittwoch, dem 27.05.2026 um 12:35 +0200 schrieb Frieder Schrempf:
> On 02.04.26 20:33, Paul Kocialkowski wrote:
> > This series brings a fix for the FIFO underrun/solid color bug (in the
> > last commit) and two other changes that may help with reliability.
> >=20
> > Paul Kocialkowski (2):
> >   drm: lcdif: Set undocumented bit to clear FIFO at vsync
> >   drm: lcdif: Wait for vblank before disabling DMA
> >=20
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c  | 18 ++++++++++++++----
> >  drivers/gpu/drm/mxsfb/lcdif_regs.h |  1 +
> >  2 files changed, 15 insertions(+), 4 deletions(-)
> >=20
>=20
> Can this series be applied, please?
>=20
Applied to drm-misc-next.

Regards,
Lucas
