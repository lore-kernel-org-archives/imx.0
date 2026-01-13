Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6E24318EE3;
	Tue, 13 Jan 2026 15:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317540; cv=none; b=WN6q7GIZ6zLSgcmJoZcV+HuLW7uofj/BTeYYlqLh7O89/T5X+JObhtI7vzbtoSZB/l8MY9vOFxdliKhQNvvqbwSgfXwuPdkF9Osir72kPfINoaLMxHbEVyeQNKgqahF/ChusS2paKlowrGbe/Et5khs49JFlkhu6ZHF1+xnkxLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317540; c=relaxed/simple;
	bh=FyEYv38CjxmJMfeL9PV/m8tOA55M4SODjwx+UAXsv1o=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Gu4Db5MfJrZrzA8+1+dTTxmCTNTA2ET9DVL4nR6aIqeRwUmqgYO96Zi3NbLZQxklv2qr/HZ1BiFfQwT7JqWOoeMfc+wuVl4eQJEhM0ECI385xXbjRNen4WF9kfLR7Wplg6aLVkAppxtsFlwIIzMihHYs4tVGqQuzN0O3x9KPTSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZdtH9E+A; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZdtH9E+A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16234C116C6;
	Tue, 13 Jan 2026 15:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768317539;
	bh=FyEYv38CjxmJMfeL9PV/m8tOA55M4SODjwx+UAXsv1o=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=ZdtH9E+A6WMRwiK/NaAC9VbdFn4GnCEoEmNTjnnWf/p4RbPZrcYQGnW+ja3s/JKmR
	 t0Y7XxpzH4pwzIaDad10XFeFo9rPnTjrhjQF4SjICMJZaSvxREhdD/ErYJyVCBTayG
	 H5zQpW74TNUWS7EbvqCzOM1y0zaGQdlAw6bmRgLVtl/lrvf87b+p+fROZuImS1RyM5
	 u2APQ+UI4vjLx1iO4kzcflA/PSrkHPGTWLmb/OLaF6uZ8QLN+hijTLHHe6YmrustVt
	 8LQmGmuDu+mnjjS2d7dYxIEr2QEZZABOBYj5fPps9YCVkLVUnSG+NkVAVU18yOCgoE
	 qIIQ+IxvNOTDA==
Message-ID: <8818269aa401cc620a1485eb56cb757b@kernel.org>
Date: Tue, 13 Jan 2026 15:18:56 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-9-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-9-8bad3ef90b9f@bootlin.com>
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

On Fri, 9 Jan 2026 08:31:40 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Since the companion bridge pointer is used by many bridge funcs, putting
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
