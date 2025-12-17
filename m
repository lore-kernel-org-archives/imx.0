Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A9389F55;
	Wed, 17 Dec 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967123; cv=none; b=VhtnJ39v2aqN70f9HtBB9hFV92AZEojF0clHS4GvNUzTPP/q0vuhN9L7y8ffOH49iANVJ+aGKF+kK6p0baEy6vSn1eYVClEH2BPFmkN6AVus9AUrcqoxreoTTB8YD6RkCzCHIPW8NH3NRclgxrJaqVKKlJYuE/tiDf0WSicf5rE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967123; c=relaxed/simple;
	bh=j6fWBAYEXtE3Kd4XTM6pOK9YC5GmGveHQTJogZwLkDQ=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=n1ZNzCCtj1sIr/IT7+cChiyGl2hTQqkhpaviUia/jK4QNvurVfaVeYzfJuEY2NnSubj+eyxLa+l3YxDZpwUVGMT1vLc8URBzWM/MpvyHvoIEryNq7l+ROzkFgYp1OSwWZrTFj1zrss+xIkwgEYgYSU7nfDmBMTnrnHl70QOjUVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rm2NHFhS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rm2NHFhS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 699B6C4CEF5;
	Wed, 17 Dec 2025 10:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967121;
	bh=j6fWBAYEXtE3Kd4XTM6pOK9YC5GmGveHQTJogZwLkDQ=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Rm2NHFhSLip7bSLXiPGfLGtjzkUVxs6dUDd8ey0B8wNTOtLmMaxmzMTTKRHEFzBWs
	 sdBBztUA8NDkaASfgt12Wb2zY3TIJdMJ9ZynH+qEpRy1GR9do4WKZMQIlJZeauI5Se
	 tXkstKJunbralmVZCVBcCXkWZeXUKvqZ56Vh/PLOObvKo05r8ZuWzAxbamZnSPdBx2
	 a+BViYe4R8LELixb5GNRs1I9i6d2zY/2ebsdiYDAyDpACOnCQfUmE8H8Wps81ikznb
	 +SPzb+Awo+LWePjP+k2iqoC3iBH8GNM7xvAoIYZTu9TJjr3BpObrFmqZ0kEyRbUgYI
	 /512xnZHl1/RA==
Message-ID: <b95966ec5cffced78db429efa87dcf95@kernel.org>
Date: Wed, 17 Dec 2025 10:25:19 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 19/22] drm/bridge: imx8qxp-pixel-link: simplify
 freeing of the remote device_node
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-19-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:52 +0100, Luca Ceresoli wrote:
> The main loop in imx8qxp_pixel_link_find_next_bridge() requires calling
> of_node_put() in multiple places, complicating code flow. Simplify it by
> using a cleanup action and making the 'remote' variable scope local to the
> loop.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
