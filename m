Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8516036402C;
	Wed, 17 Dec 2025 10:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966662; cv=none; b=pxcsn7x2ubwtS7/ltDz2hMjR7MmzEETONIGfiXssp+9yiHSc3vhdRK1hG/aXKZBbNg6ZcUmGAXVwaWA7idJtJRrOl0dlNh+RkPc/LyUIhHNKRvzT2IMX+UMM+fub5AlEPWb+VxZO8arJhq9H8N+kSIvsZocogwyV+jCdlZQJuIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966662; c=relaxed/simple;
	bh=8fiVn2ZgRAMxuWDCmDkwSx5n9MWlyH2AXOpyMgeTHX8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ciRvXGFABIbUJiWPUdVHcBoiN0lYqR+Sgc1eDV0/StVIMHk9y9rMRnoixiH3Te6luNv6Pei6Q0/dchu8lc2xgD2RCNtgdyim781ISNQ+HHa/E5fcw825dtiwX89uLTZbQEl+CYhePa8IrbAbi4mymfHg1en6IPAwEMcyXqle6tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8QQZoCT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8QQZoCT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C3F0C4CEF5;
	Wed, 17 Dec 2025 10:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966662;
	bh=8fiVn2ZgRAMxuWDCmDkwSx5n9MWlyH2AXOpyMgeTHX8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=O8QQZoCT+lo88BxSzfhcgkUq6VKTur72pRBybceuQse7jqMKd6FlDzGYkUt7i1AeZ
	 7LcOhYiaUxuWdL4eSBq9rk/9Y+kqfExxZ9L3YVx9hxYE3S1MFB2LyZ0JaPAntmfxiM
	 Ce/XNRdPiukqzVKcznZESth9KZuoinj5JdAmcjDWb3pgeU4a147CDYNyJ0YXsFXJLJ
	 8c0ujjOLNMSfMWpGkWW1BIUXIq01OSt/7OD/TYx2gcuaGFk/u7QMt/ravwFpV16pqD
	 a2g21PzDbi/Os82PBlGocEX5OMiKj/PA0UPZUyhaFZSWwBtFnAyiOeO9RSt1yC6Nkn
	 g2oL1QZWYwKTw==
Message-ID: <c88ececc4692f3b9d8d5284bb398470a@kernel.org>
Date: Wed, 17 Dec 2025 10:17:39 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 08/22] drm/bridge: imx8qxp-pixel-combiner: get/put
 the next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-8-b5165fab8058@bootlin.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, "Alexey
 Brodkin" <abrodkin@synopsys.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Hui Pu" <Hui.Pu@gehealthcare.com>, "Jernej
 Skrabec" <jernej.skrabec@gmail.com>, "Jerome Brunet" <jbrunet@baylibre.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Corbet" <corbet@lwn.net>, "Kevin
 Hilman" <khilman@baylibre.com>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>, "Liu
 Ying" <victor.liu@nxp.com>, "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, "Maxime Ripard" <mripard@kernel.org>, "Neil
 Armstrong" <neil.armstrong@linaro.org>, "Pengutronix Kernel Team" <kernel@pengutronix.de>, "Phong
 LE" <ple@baylibre.com>, "Robert Foss" <rfoss@kernel.org>, "Sascha Hauer" <s.hauer@pengutronix.de>, "Shawn
 Guo" <shawnguo@kernel.org>, "Simona Vetter" <simona@ffwll.ch>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Thomas Zimmermann" <tzimmermann@suse.de>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>

On Tue, 16 Dec 2025 18:58:41 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
