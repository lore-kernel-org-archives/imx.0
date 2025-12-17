Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E482D8DDF;
	Wed, 17 Dec 2025 10:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966845; cv=none; b=gD5Wg/Lbmj4hB6FGHDrHwvPPdkuFFySbwnoH/24ku0P3EdfLmsfZ+ZKwW1iaN2s0oZUxdk1SRY75875KW/y3wq+oqF/PKu+vbfjPsI71OnpAMFXEPW9ZEDoslKdxTm1EosJl/OGeBRu+O5VBmO9wQ/TLnlzIXBR6eVHlurMcaf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966845; c=relaxed/simple;
	bh=dxjssOhapttl/JgPFJB+rkPJ6SCnWIsVEA8zbjgmVQI=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=nlDUALek7jdcc9VECwxiN3kjFs51J7bXD3ly7cqazvDT52L8ysVCwNvQi9esBKlXvCEYAQpsTf3DMatt+VoZfrYpMwcA943RVQBJGPxE/TQ5T1xD0wMGDCW5GuxWvKNEifqaCwpo0AFHhBLtOQH7+hcs+XbKkpAblR8cp0sT1+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=He0K8SMt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="He0K8SMt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 965D6C4CEFB;
	Wed, 17 Dec 2025 10:20:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966845;
	bh=dxjssOhapttl/JgPFJB+rkPJ6SCnWIsVEA8zbjgmVQI=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=He0K8SMt/9Qtq9EjcLEdPmwBMRQcAIpI9KkILD5Su5RLT2cV4ZDpNo3IXhx5uhez9
	 TV8En5Z/zShsXs4UC3e6bk8FAXOvTyJa1CKCECd2KVVjo0oRTMS/rye19WBqifE4ba
	 rVm02WZYUzbN7OK+e0VxNuXyDdxWj4adLKm8+73wOtR7QmbgK62Ns3xKi1kqxRKGnt
	 c44hyRR9Dz9ToWVOcT4Pj3Gk9A/2ynNOoskTAfmi6xbS0Uw3llgqkyTDS16DjwG6Ne
	 CSmjy4C2Mp5NberoC9Ei8LGePq2GT/M6WbWZq2G7C5tFwVphtirDOv1UuLp/bI7jxV
	 fe9vrJ/LEW5UQ==
Message-ID: <21d359fbd3c0279ad82ad3dc0f2494b3@kernel.org>
Date: Wed, 17 Dec 2025 10:20:42 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 17/22] drm/bridge: imx8qxp-pxl2dpi: get/put the
 companion bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-17-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:50 +0100, Luca Ceresoli wrote:
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use the destroy hook to put the reference on deallocation.
>=20
>=20
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
