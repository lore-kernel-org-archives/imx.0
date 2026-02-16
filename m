Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837552E9757
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 13:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247932; cv=none; b=gxaXMGkS4aZefMcvjYM6WFK1gpcc5MnxEeXo0fQdyEXDPCEPCmz9s0Jil4fVjO3bJHLTf2LzUg1wnRfUETy3HRjYBgHFS6G4YmK+szh73dIgp/MHkhh6sQ77M98mMXVDNG67zNqg85/q2UwDZzc36rFMEBqSQAnIduTxWMvGiPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247932; c=relaxed/simple;
	bh=DL2iodwjQzfbBC8TjTr+C/KE9ucSLmyCYRjnx+I5gbw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ro8dq2ORTRTrXle3Xxo3PYMnhf3oaeWZBItYBF8dcoNqN28wD2+gX+fkVd5zVvx7qrYABaNKEQgmYHEEFm8ry+0IX02/4aohcVBhashZ8QlgxtQp55n9Y0ftUi9CsyLN8kYEJQpQj4FruEN4AOSm45iRNLqekcHPACtIpogRAxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUs-00074P-Sv; Mon, 16 Feb 2026 14:18:42 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUr-0014Zk-15;
	Mon, 16 Feb 2026 14:18:42 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vryUs-00000000C1r-2TUz;
	Mon, 16 Feb 2026 14:18:42 +0100
Message-ID: <663e399a7492829c0c368a2e24cfc4a6ebd55780.camel@pengutronix.de>
Subject: Re: [PATCH 1/2] drm/imx: ipuv3-plane: decouple zpos from plane type
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michael Tretter <m.tretter@pengutronix.de>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Shawn Guo	 <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Date: Mon, 16 Feb 2026 14:18:42 +0100
In-Reply-To: <20260216-drm-imx-underlay-plane-v1-1-2dcbd1fd4ef5@pengutronix.de>
References: 
	<20260216-drm-imx-underlay-plane-v1-0-2dcbd1fd4ef5@pengutronix.de>
	 <20260216-drm-imx-underlay-plane-v1-1-2dcbd1fd4ef5@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
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

On Mo, 2026-02-16 at 13:44 +0100, Michael Tretter wrote:
> The overlay plane may be placed over or under the primary plane. Using
> zpos to determine, if the plane is the primary or overlay plane is not
> valid anymore.
>=20
> Use the plane type for determining the name of the plane in the error
> message.
>=20
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

