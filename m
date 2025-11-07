Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA143043D5
	for <imx@lists.linux.dev>; Fri,  7 Nov 2025 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762511298; cv=none; b=k0R4CD74JO/cBa3gE2OWlGNguXbvUkTol2vmvAaAaa7qM0iPg75x1cbbkkIk+FDAfeRvFg777sS5DQ4Cv9CjXGFYwXV9qThTK3EUv+CRmAwoyEHo6n98Azca9pQcYW7lfaEuKA0iIkQGjO8rzphoZRHYYhqLDRbPsGz3gysWLbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762511298; c=relaxed/simple;
	bh=r5pS+4bEmRoRUM2DRztyodk0Lbb3HGgXQieKfomHaaU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fHDQo2G4/hSQ3/fr3C2Abp3CMdVPlW19cR0ZFs5rwPXcS7EeuGPTkxDztnC5tVb/85IlRY07mIjr5UZvL3zbmUmLDcXo9VzcqKhRtKIaBLiws5ju6/4EaOE9o9wvcofPhkH/Yx/FGYuleDLYLSncMb5ZSHpGBF0zz0a28gPbsBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhR-0005Xe-2b; Fri, 07 Nov 2025 11:28:09 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhQ-007VqR-2U;
	Fri, 07 Nov 2025 11:28:08 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vHJhQ-000000003gY-2vNj;
	Fri, 07 Nov 2025 11:28:08 +0100
Message-ID: <065cc19c76bcd19a3919e77df4ead48952181a33.camel@pengutronix.de>
Subject: Re: [PATCH 2/3] media: imx-csi: explicitly start media pipeline on
 pad 0
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Steve Longerbeam	
 <slongerbeam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Pengutronix Kernel Team
	 <kernel@pengutronix.de>
Date: Fri, 07 Nov 2025 11:28:08 +0100
In-Reply-To: <20251107-media-imx-cleanup-v1-2-f82a693c28f4@pengutronix.de>
References: <20251107-media-imx-cleanup-v1-0-f82a693c28f4@pengutronix.de>
	 <20251107-media-imx-cleanup-v1-2-f82a693c28f4@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
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

On Fr, 2025-11-07 at 11:16 +0100, Michael Tretter wrote:
> entity->pads is an array that contains all the pads of an entity.
>=20
> Calling __media_pipeline_start() or __media_pipeline_stop() on the pads,
> implicitly starts the pipeline with the first pad in this array as
> origin.
>=20
> Explicitly use the first pad to start the pipeline to make this more
> obvious to the reader.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
