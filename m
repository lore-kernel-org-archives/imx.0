Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2873164D0;
	Wed,  7 Jan 2026 14:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767795111; cv=none; b=PEXjIk2Wl2ct5vu2saWhkz3tnnT73jGe56Z+yLsXH3q1ADfPoicms6ueky93+aqroramLsfkJNQzxSDNosuFh4U6OPe2GXG2iqfCm7M+CG7qdkkhdw0pSL0SDi6/zNhm1fFT33+bjiFPA6q8RHGjMZJhWicO9xBkpg0rV7eEpoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767795111; c=relaxed/simple;
	bh=AtifbZ9dlYB5B7pMnTwF6U4zuHUg4AAtxUwmlBGabgM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=fTPtq29qKNjzWvX9q5OnmCI7XFa3i+jVfPVlCdjNqlKzoOGf/44YpZ13URMAaJsRUgq8+rSpFzuDe0HeYIspE49zJqhC+cUOXCEScPTBXbnGZTA0DN8r1Fxrgvut+7j00h+PYFLK1VMiMmIoEnBoVjSHr+udlN7CMTBPsnwNP9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PoFOS6yj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PoFOS6yj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AF1C4CEF1;
	Wed,  7 Jan 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767795109;
	bh=AtifbZ9dlYB5B7pMnTwF6U4zuHUg4AAtxUwmlBGabgM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=PoFOS6yjUEp/Ku0PSbiog971JRBJ6PZ+3kCcXxXM1T112J2ja/3UUNB4br3ITj3W/
	 w3nnqpjHkxMXf+QrPvuC7rUWRI61Rz5WxYZ1w3WwqgDNiO+cCYBiErps8kCL0gvqmq
	 w/s2tFI5q+155Wg4qsZDAVdfSSmI4I19zeD35/nje+HnET5gANiuiYuJ/KRoxGbO7F
	 pOcCMkZjhmWsl75ovylLNFpKpz9T1JwaMn4y6YscdE+AEEHZVeD7YSgmFoI+9z/6r9
	 spNLpw0XB21LPI499Uh7VVARGJbmLtONgj322D/1PbSl9bNyE4Mp34cCU6R2SQwE9Q
	 tSoamu4lgUnkg==
Message-ID: <8f4ea75e3ee9d192f0fe649338827581@kernel.org>
Date: Wed, 07 Jan 2026 14:11:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 11/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: don't use the bridge pointer as an error
 indicator
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-11-283d7bba061a@bootlin.com>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-11-283d7bba061a@bootlin.com>
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

On Wed, 7 Jan 2026 14:13:02 +0100, Luca Ceresoli wrote:
> In preparation to handle refcounting of the out_bridge, we need to ensure
> the out_bridge pointer contains either a valid bridge pointer or NULL, not
> an ERR_PTR. Otherwise calls such as drm_bridge_get/put() would try to
> redeference an ERR_PTR.
>=20
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
