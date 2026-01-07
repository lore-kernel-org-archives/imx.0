Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41F8D33BBC0;
	Wed,  7 Jan 2026 13:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767792859; cv=none; b=TRNEgKmm/TAf0kAMNhQqCL90lJEAJpOsf6gN/vDymvdUUfc0ZJ6kQJ5YRyTqRoTAjtKIaBe9zB9Vpd8R9S5fUwJAZq6Bb6qjoDJOzjNSL/EkG5TyhITzRWP8GmpPi7vnq0g+CaQYeNM3zjqBnIuGlbjMH6gj1muiEAQXWhkmqWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767792859; c=relaxed/simple;
	bh=2QtxPB4O11+KaZ0o4eJv9y4N9YG3MEL4lpbPyh0e+WA=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=uqX9sh+bfT9+wCUi2MdOSm+2U0FkK7eIHDnQ9rij+BRLJVMXZZ89mvWm6rsy1N6nJFP4nh674kpSWD6u/Jv0BMBXUTKHRJhUGTOhSxcyrzKpHXOqA60hS2nI0nb0V5jWP6RhRAYHfylEmKBF0Kx1X0G466Yrf7eIiyOuNku17Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b/tZCTvf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b/tZCTvf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94D57C4CEF7;
	Wed,  7 Jan 2026 13:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767792859;
	bh=2QtxPB4O11+KaZ0o4eJv9y4N9YG3MEL4lpbPyh0e+WA=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=b/tZCTvfCfHByza9l0a6Ji0KswDphXz/YHcBcze19Mt7spGm2wvy0JoFbmhpITj6A
	 va1jFI0ieMytMgvgjaWUG/c776zK/TAeA79iUyM+qLfmyVtXFLUumyEjh1FPfVmIZl
	 CXiiYWZ21e+CerVbF0Kz0EkbDYqn9WVHjitFp6R7el9Z9vbO6laGH0WKSQvkgAFPIG
	 TjE5kaMAhJT3Tu9twlw1iJRC559NecBHPmNosSvSyC2R2YJ7LExR1f9AqRbDTCKiJk
	 V5bxBYmlGSzlv9QunRZK4K2WdoN1hSUWduATYu6f1vU5N3S6S24IEGv5/l4jCIBvlV
	 4V1tVqOfNN9ng==
Message-ID: <89c4c08341b8f6098fb93a8a65ea4727@kernel.org>
Date: Wed, 07 Jan 2026 13:34:16 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 02/12] drm: of: drm_of_panel_bridge_remove(): convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-2-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-2-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:12:53 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
