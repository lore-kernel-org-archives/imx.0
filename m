Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4E352D7DCF;
	Wed, 17 Dec 2025 10:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966827; cv=none; b=apwW2opeIycruJpAtYTkXOjoYUFMMi418lFNqiLbDQC6l6rjyNH/IANzGFF+HRUTSxIPYEqr2/RqbwP6grR1VGdJSo93mumt+1+g+CQVAY+vvHh7S2jWxHxFzMk8qR0OJK1yGuwvbtuZQ8Slfqy2iOqqYE9BJQw16Yn8EVRW8Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966827; c=relaxed/simple;
	bh=aZrYYj31P00rmoPAjldcIV31JBxU059fWZEZlTBVTW4=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=ck/h0Hyn2pxlof9CKmxF7Xy+r99k0xnDEcLgWto1y0l6MTcvIeV15ngR9aeKS9O9kAv+rHN8Rl6Z7i346Q7TG8p6aP2n7WKzBUnXRXY7B++wwdjEu58odIgj5QECi6lmas6sVfbuETI+LoPRKxwguuy4mxTXXGWi2AmiKSgO/Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M2GjA5DL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M2GjA5DL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E467C4CEF5;
	Wed, 17 Dec 2025 10:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966827;
	bh=aZrYYj31P00rmoPAjldcIV31JBxU059fWZEZlTBVTW4=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=M2GjA5DLvMKbOZ5lP2HBfYjWXJmD8orW95ptixcb2IldkPJy0U+hI6gwuWyXyXqOa
	 k20bv4+04PcoRppS0ExrXbPsSyNufkWloKdHvSvEUm/17xgXag+AWZUeBGfoIZqXPW
	 EqTcRLDJ6D2wejo/qST1VsJdTnNHGPKz06LOuLSgH/e0SW9gBlFnVlWUWKECk2nOgj
	 RS+y4M/nx711KhOzb7Jh1bWF4EfraEy2tSdu4ThyLM1fnIF7Ou5HsJ9OzqzAgH/YbB
	 TOsVGMbdNPJ5M8YTql9ikqi7BkQdu23WeZWt0pDOTvU3sPw9HVROTj7IKAicMtQn2J
	 sqPabP1NpvGww==
Message-ID: <55901cff3f0021167c6a3abecadfd3d6@kernel.org>
Date: Wed, 17 Dec 2025 10:20:24 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 16/22] drm/bridge: imx8qxp-pxl2dpi: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-16-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-16-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:49 +0100, Luca Ceresoli wrote:
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
