Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017AE3624BD;
	Wed, 17 Dec 2025 10:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966650; cv=none; b=Qy4Lo3NhqYguYKlO7dhYwuZT1u4wZJM2HneJ6G6yRTcL3A560AP7aKqV1BPKgbQKhKmRwLdnY3L9xav7oiew6ybBQHk2sVo1iONeVFT25OfJfQ4IoC6QzbAEvZu8j48USEe10wOun9bs9u51h/Yo8KfIuJ6NCmGdK04otT4HR1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966650; c=relaxed/simple;
	bh=5kPgttVA85WUBiDZ3+tveQVCEKPW/E4F6Uu67NSYlO8=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=aAFgtWaCYzc/fWK25VOg2togZpspOimtirNqSE4UeuOIOYAA0iCKoub3EaFHxBQqgx1/tJx7rn8Shv8d7RII+V6G0TD6qPqyCMMnop1wWKaLKxa+118ixkLpIQBe6CZU1qLmO+dKq+R5HRY1jOXhH10ZZYPncLad9NDXflUQ1OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mpFFuDbF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mpFFuDbF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B3CC4CEF5;
	Wed, 17 Dec 2025 10:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966649;
	bh=5kPgttVA85WUBiDZ3+tveQVCEKPW/E4F6Uu67NSYlO8=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=mpFFuDbFB2N995Z8rmUjbLTvUb+82/eMCoGzZKWMd8vBNeDxd8f3wGAoiRXkbMg4O
	 hCICfS8phbqqZ1sH2Pvr7I6HR9evkmyGbzSxYGZfEy+N0t8sCOW/EOmWn55xn3G/7E
	 xpEDOVG3QU5q6YGh6KTXk/ji/d50rdRM0A5MCp4djCpMX0f0mfzT7onVAjPfteGjiT
	 CojpYGIrSCcPsnZDVkEjTa8jwC4PgVgrSRwxI93g7nCD39c2aYuLpfTU8euPhVhiKC
	 zbqBImjqXr3h6cc9CvBghtSrf0h1FjIcLyVuhos2ifT/nuuXcZHVf52SDC2BW/UIE4
	 03I9XM+c/T6bQ==
Message-ID: <5797d5b801c1c43b31ddf70d385c8ef1@kernel.org>
Date: Wed, 17 Dec 2025 10:17:27 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 07/22] drm/bridge: ite-it66121: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:40 +0100, Luca Ceresoli wrote:
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
