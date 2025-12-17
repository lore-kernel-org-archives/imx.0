Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FE3D36214B;
	Wed, 17 Dec 2025 10:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967150; cv=none; b=q7ASZEma/+hs8pPA3NaXyVnMAJ6yQ1Px4fCjiYHG/c79A6X53mRXoN9XIE9PJbSN+JzQlvnKePfmvEY5pZsuFOGxaVjzQAIL3PTLfmodTW6bRHwJhFMIZHECqbjD6IdSdbz2/lWtCORiwl2STv/I1XtY/JshiKZcRr3oG4BPcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967150; c=relaxed/simple;
	bh=GnNxtunhk2yGE92crKgwZuDyghpZFV6MjwtyyPhQ2Yw=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=jyOcqry5GZJZwDDuGiEwYMWdYn/FJ70qMNJN6yYbAB7ej6Ifm/VOZB16SBCRW4upc01dsaVueHKjq+VoRLn5OFRcZi/RTjBuHr5fjVqniKY8WiDDm7F53ZVrjA4ZDNddgDNTDdt9j5EG0KjNtOLx7ZuZeRxxZImBqtUfkgZBDtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YbFTZ/oc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YbFTZ/oc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672F4C4CEFB;
	Wed, 17 Dec 2025 10:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765967149;
	bh=GnNxtunhk2yGE92crKgwZuDyghpZFV6MjwtyyPhQ2Yw=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=YbFTZ/ocqRqcOLMTMFILNJXICobjQuhAvnKW71QN94skeBsUUZZrXpa9oyIL7q180
	 aDZCrv46lYFzWhM0uJgoZ+jlNKhDrOOZu/KHrXzJf9jrCrwOTa4ffpMNzzW0t5DpH8
	 6YA301b6LWbk2fVcMjIqMHi/PSX2LKOVPhb99OiuAJfhpYVZUZRhiWg7ViKjKgyPpm
	 dNdRREU/bPVPzTPFZknnUsYqACMtEajQG2UgYyiyNmvnEmG8y+e3hFkOENS8zZ9lf+
	 yXBfmQKV1K76D6m8N1wN3z/vaoZ7nZWPJC4umZ6tl1aQltuIQ/arYPqJ69xV9uLEcd
	 sNnkvhb9edgRw==
Message-ID: <e6df5ec2f2d0b38a533c3d154587948f@kernel.org>
Date: Wed, 17 Dec 2025 10:25:47 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 22/22] drm/bridge: imx8qxp-pixel-link: get/put the
 next bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-22-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:55 +0100, Luca Ceresoli wrote:
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
