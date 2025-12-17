Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BA75221FBA;
	Wed, 17 Dec 2025 10:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765968066; cv=none; b=NMWdxRFAnPYjs7wZbusCZBseeA9zMjtfINuDLvQWlX6zfdU3CcxGBJyVIO7YkNP31prmStS6EbBNGU/2h2kBEhGi9IPdRvw9rhDX4RNZC4h0kFqVC3aGVDEYhOQ7/9JPZqzLTXGUtZBuDblKiCdjhDAQlGDaJjuV/s0kqOfaS2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765968066; c=relaxed/simple;
	bh=HS77sf4V8YC7YSp8UgyycGNSNR1n+CSMJ+7dfOmB8yM=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=dBpZj0A/DKAQn+H8HER8lgYRTj73V5p4LU1WZh5Rd5Wu3SdV54oQSx4Qnx4K7NKjLs72Ag4JyYZgCTfL43hrMusiMF2z1Kj5aU8NCYc+p7UiFzsXSnw58FN9ScID5pIWidwRpz5LVLtk3gp/czR0r15cnt2ees9JRRxYR/pPyok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DQxUNVuV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DQxUNVuV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 128FEC4CEF5;
	Wed, 17 Dec 2025 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765968065;
	bh=HS77sf4V8YC7YSp8UgyycGNSNR1n+CSMJ+7dfOmB8yM=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=DQxUNVuVjHEimXd0sj6alZGotMu3GsO6SG4ExH0jB7DUFOOA7XPV0xy08fhrpjVu9
	 VciicFfPEd4ej90eC7nUpJeuwltg87Ozm+dawEbMOaPnfcLSvhLGWcEqLFme4UKIoT
	 uQfCTacFDVT3B2NMKlgrXN+ukZw/VFiX5AGD2gNBmbNwKf1FwNvLdGDMKZRZ/OJXRY
	 xfrw+/Si1SMoxQYcBhLu5J9cLyUzdfcS2pdEWlIGWPqYDU05zKrWEiw2XIrqRKKaZP
	 lsDuU6s4dd4tmJ/7s3sM0bSpZLLjx0yZPC+qJ3SelOpQbb+q/NXmymoUEDaS5XHrNh
	 E0ghXx1NPKEMA==
Message-ID: <654c1bbfcade818bfea35b52bc5e80ae@kernel.org>
Date: Wed, 17 Dec 2025 10:41:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 09/22] drm/bridge: simple-bridge: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-9-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:42 +0100, Luca Ceresoli wrote:
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
