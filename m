Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B8635FF75;
	Wed, 17 Dec 2025 10:16:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966599; cv=none; b=qfbccgEDbZEdcaeyokHe1dWWJSuX9DK+6cHT/AWhOpJEnI4EX0xcbOv1OFo/jPXPqMjce7qAR31iCF1lYTlNjpNGwe98KWdwEWcTQ6GWNF3dmxiBxS811qx2WtDOYRih4XPYsITzkrwaLqwlX7TBCDYc2JNGIMZ3dnBaXyS/Xvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966599; c=relaxed/simple;
	bh=Yu16XEyw9bLMDoYJ+zHkZL/aNjTnCdD95ceJsG17TPY=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=IbU/koZJfUDzNu/Gv9h/xY95WiD2qTkvPRYAkPSV0TuEFLrnR8INdU5MSVZhW2PM1W6ds3C2Y9oEoWB/uc9SrudcDXTD/+CIKruhq6L4pRS/nuscY14W94GH3Zc+5CupJX7ADQ5HB33x3OgzUshhQOQk+2EO/eIItlHC92BHuwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ElMTuzdR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ElMTuzdR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15011C4CEF5;
	Wed, 17 Dec 2025 10:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966598;
	bh=Yu16XEyw9bLMDoYJ+zHkZL/aNjTnCdD95ceJsG17TPY=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ElMTuzdRZleWASiV3LxMqxicO5YHge98mbmKWpedTzcc0xQNNAjaHtosz8X6w2kE8
	 Qum1hWNV9vbOT0UvO1CTqpeBsSsVkB3cnjDC7OKnTbDBpGVlDW3cLXB+0xqX/mvAwd
	 95xxMLuCHBCCAwQYh83GnylHhPwpaznEcNyKCOAepX8CznH+0RDr+El2FERhdRaW8S
	 39a+8OP0UJzX5uC5WOQtQhlDS63xZwpkoQsQaCKt1tn4IcF8rT3razMFMxZ0/RUNU2
	 YC5fwf5I5TrFXig1hKfkm9BcjqYIuFSgDuq9+cx4iIw5qnfGI9pPirpjBr/XQ6WZGO
	 GsbMJtYRl27XA==
Message-ID: <1644597c6c9e114cd27898a80014c699@kernel.org>
Date: Wed, 17 Dec 2025 10:16:35 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 05/22] drm/arcpgu: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-5-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-5-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:38 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put it when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
