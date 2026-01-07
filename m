Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA47131B839;
	Wed,  7 Jan 2026 13:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767794221; cv=none; b=GiIVv4p2SiO0FIRef4nMzZjliM4oQPYhRnw6gG3YSH3fOOW7ND3PxQvzoUIy3RLyJErjNGDHmMpEdjKh5bQu/lUF8JdiDBoSP17sV4mYJxUF/skUDuGQXLerLNUwtMQHFeMh6fs2sO5TQbyAKJQmuGCY1BOw7qTwDrCtLfI9Bzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767794221; c=relaxed/simple;
	bh=BdOTDic/YZnjOyrf6Dqqn+m8nRtd8M1dJMTGpA7Ta4Y=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=cGcqE80f3AnN9lpO9tzasf16yQvVemZ9kSb18OLEEc+OYhZZv0vZYjMrROxYieN4tnGh6kjJ5ncLi6GHURwwx7JR1J7bklRp4vsYwP0+6Skw6GkeiYiU9xoShPmsp1LkzjLCdZMNuFac/vhHuPNSbvA5Objmw37ocKuWXvioRW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cTt+aXZm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cTt+aXZm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A9B2C4CEF1;
	Wed,  7 Jan 2026 13:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794221;
	bh=BdOTDic/YZnjOyrf6Dqqn+m8nRtd8M1dJMTGpA7Ta4Y=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=cTt+aXZm2PyYkFlvMWT2UKSIMOA+cXKthHOaZOQxKr20W/3XATrOp9hvTQPLYqG6d
	 DnQH9BYSfHH6iNWPdz3TTy234s8qAzjIbQdx2UGFaFnBC4RmCz08MmON+CGazVH5LH
	 yZTtaIDK0GM1uLnRVLYJaa0SxAPY7E+Ojrxm52Ibv5FSLo14fRIySbqXemhlagTI+O
	 XotU6gJA0Xsi7HDORuXEI+8twn130J5P78qwRnmll8LdzzquLOFWDYWh8GesNRn54J
	 Mm7iigEP9yYhPRPTA3DzrOcas2lnPMpdkVZYYwIzLFeh4Z6ruSGE9ORsH4S0FwwemO
	 pN/WjR2XS+7cg==
Message-ID: <647e07a6067f69e592fe24939b69249a@kernel.org>
Date: Wed, 07 Jan 2026 13:56:58 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 08/12] drm/bridge: imx8mp-hdmi-pvi: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-8-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-8-283d7bba061a@bootlin.com>
Cc: benjamin.gaignard@linaro.org, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, "Adrien
 Grassein" <adrien.grassein@gmail.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Inki
 Dae" <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jonas Karlman" <jonas@kwiboo.se>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu Ying" <victor.liu@nxp.com>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Marek Szyprowski" <m.szyprowski@samsung.com>, "Maxime
 Ripard" <mripard@kernel.org>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Philippe Cornu" <philippe.cornu@st.com>, "Robert
 Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Wed, 7 Jan 2026 14:12:59 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done by using the drm_bridge::next_bridge pointer.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
