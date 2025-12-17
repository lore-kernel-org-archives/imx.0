Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9351034CFC6;
	Wed, 17 Dec 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966862; cv=none; b=cjx7Sx50RXTssgP4Vl7JxnGuNl7xRqaXdq65g9nl/HfFMa0aCigQffyrNApn856l9C15N1lnhnC5/8WQXiencWo79sQhW4k/E+V4cALpTC558TH3/W9B+cLkkfuga1HcNFnURiI5ArTdbtuTpxh+6n7MOpfKjlps3UWvBfYqlwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966862; c=relaxed/simple;
	bh=rm5sUUnmbJwOzq2saFlPKZTSMeSRpM0dRx2piIKaLKw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=d9Ql7ReK6WjTd+2FlRVOyLdnUL5ypcJYrgvIrZ5Tqq83REzXRMG8wjsAv2J9U4iRWOC9hV/A1wxBBq/w3MTINa8zqHQN3kcYwNQTvlnff1ydD+9mqR/n9ex/wwnQCAIgzpIZvP/ZwwKMuwY+p3ESYAWg5fqHAoc0P6wc+MreRTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nZgS2GXH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nZgS2GXH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BBBC4CEF5;
	Wed, 17 Dec 2025 10:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966861;
	bh=rm5sUUnmbJwOzq2saFlPKZTSMeSRpM0dRx2piIKaLKw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=nZgS2GXHVXIFe4wp8/XqV/hzDEt8Vr+/31BzhaivrsIoCXgGdsvdRD3yPKWE3R16j
	 hxShUUXrw0wI9TFn/+3uzHhqbjagVam8Y/l9TLB/U/Vfn7HJE8mIOF/sfqiC5RFYie
	 BuJzNVDk0DrazlsUF//TJqVje23fBkmKDOZlOqOcJ8mjAz4QLx3hH289d6INLJglPL
	 6n5Tf8IORua5W++yo8AvWakkSLlODewrFY4KKZWxdByOpZMxteb1kYCN2c9jr1oh9R
	 sA9Rkw5+u2KO8N6ZbvRYPXjKf0lv2YMd3NRC3n9CWmBsokskpXw8tZjBj7ATmKGpjK
	 oqndz40PlCOmg==
Message-ID: <5a69eb5665e9f64d2e1773f834bc4921@kernel.org>
Date: Wed, 17 Dec 2025 10:20:59 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 20/22] drm/bridge: imx8qxp-pixel-link: remove excess
 error message
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-20-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:53 +0100, Luca Ceresoli wrote:
> imx8qxp_pixel_link_find_next_bridge() already emits a DRM_DEV_ERROR() on
> error except for -EPROBE_DEFER. The caller emits another one, which is
> redundant. Remove the message in the caller and keep the one in
> imx8qxp_pixel_link_find_next_bridge() as it is more informative about the
> error cause.
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
