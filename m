Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75495333743;
	Thu, 18 Dec 2025 12:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766062240; cv=none; b=jceGsUZkYCRBdKydzyNEmuxasKUptVQ4FJFPooutmlheauSgqa6OmZAI64NojvHdAC0F7feQgxCouYc8ITDLb6yD9XyF5Fce02L419RaNCtTWgSZCcG5ZtOLyz0Zf0zIXfBVgqF3sng4jbXUapzN1MWKBeqbFrhsLuoaY4o2ZGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766062240; c=relaxed/simple;
	bh=Zhj03AbbOmOd3fZIlx006hZCyE5QvjNNAfFodJdpKhs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eWjkWEvaJQXboBxauqpRPljsyO549sY46Gwh2tSXNtX9SwTv0s/ZavreqQWrpHGFLAwcehsKCQjorKFHkz2w39a+V1ogyUhiYfRdTt1RzHpI05NHJ4h6fqNlHfzXD0Xl8P98M01qCgavr/5LrQDRZnzwWUTKgh/wBUldESvC6qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p7EbKW1d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p7EbKW1d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F473C116B1;
	Thu, 18 Dec 2025 12:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766062240;
	bh=Zhj03AbbOmOd3fZIlx006hZCyE5QvjNNAfFodJdpKhs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7EbKW1dGx7j7mWKhfmU60knOCzLOmUcabi+gxUzgLC+uEdwqWurPXJPZXuCCV0H/
	 H1slZ7+kvqFN8U0pnmWGBSaYi+x98e2WXTpJyqtIZuAc0Jq7UuuqPe8ogVNHIw+pr1
	 HfBwaGZD7uKTxNZKzXg/WAEN4h7f7okJ04vzQOLkAYaqjYQSOBkXi05ICZxcVd03vC
	 1NvhPTx6ft+8u/CYHxULLLWN9rNRm35YX+4KoPQlc3lzh21qEdCACl7S7KMGkA4/pU
	 EpEajcg2EuRSI3G2gFgRBhe3V4N0TGTcI8BrOn8DjU/ltSjj6888eDfGrpquQbkopI
	 W2k/RZ/dZUn+Q==
Date: Thu, 18 Dec 2025 13:50:37 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Alexey Brodkin <abrodkin@synopsys.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
	Fabio Estevam <festevam@gmail.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jonathan Corbet <corbet@lwn.net>, 
	Kevin Hilman <khilman@baylibre.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Liu Ying <victor.liu@nxp.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Phong LE <ple@baylibre.com>, Robert Foss <rfoss@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Message-ID: <20251218-shiny-rugged-bug-d1d3e8@houat>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
 <0ba037c65f9cadd51082abf2b7857ba7@kernel.org>
 <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="vszq3vrbwpm6jkyb"
Content-Disposition: inline
In-Reply-To: <DF0KBN5Y22XW.2RE8HKDFY87XK@bootlin.com>


--vszq3vrbwpm6jkyb
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
MIME-Version: 1.0

Hi,

On Wed, Dec 17, 2025 at 03:31:01PM +0100, Luca Ceresoli wrote:
> On Wed Dec 17, 2025 at 11:15 AM CET, Maxime Ripard wrote:
> > On Tue, 16 Dec 2025 18:58:34 +0100, Luca Ceresoli wrote:
> >> of_drm_find_bridge() does not increment the refcount for the returned
> >> bridge, but that is required now. However converting it and all its us=
ers
> >> is not realistically doable at once given the large amount of (direct =
and
> >> indirect) callers and the complexity of some.
> >>
> >>
> >> [ ... ]
> >
> > Reviewed-by: Maxime Ripard <mripard@kernel.org>
>=20
> Thank you for the prompt review!
>=20
> All patches are reviewed now except patch 18 which has no reply. I'm just
> pointing out in case it's something you missed.

Yes, I couldn't really understand the implications of that one, so I'll
leave the review to the maintainers.

Maxime

--vszq3vrbwpm6jkyb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaUP4nAAKCRAnX84Zoj2+
dkREAYDMzyGsQO2Sx3OBs9bux6ITkH/bFGwHZ4tpRgWit4a1jMHeNuozqpDBMT8K
WmLrt7EBgJR1HTyQ6KH6xqqoS2wwREqGdMPi/YcBXvOdlzPZCFsQrfYdAFhAw8ky
AW0aV5QIbg==
=GFoU
-----END PGP SIGNATURE-----

--vszq3vrbwpm6jkyb--
