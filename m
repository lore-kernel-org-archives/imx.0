Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A79369233;
	Wed, 17 Dec 2025 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765966693; cv=none; b=AcxnWtcOYjmD+12oFW1lK4LabLouPisUMVDo4PXF34iX2YAfQw1xeppnMaYvJ+K2iv/AC6MdNtnjWj2/U3egRxXw8WFqiHXfRd6XpvpafPsPB+zta9x1aCxUm7gkz6Bv5N/WC9cMxncjMkoLbGHBLuW7FrvtXLobq8PcwtDwl5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765966693; c=relaxed/simple;
	bh=iEZOJAy/iSZbPBkaO8hjqOZSzfOPhXxkhPIsof5U75w=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=cxwbmL79dnMzYg2C4Gp8TLhLphzUN9POjUJby5KEgutNoTqolnfVR8S+K4LtxSrGRb0t0rtDXGztS/yl78H+EMokQXKYwZn9amA+Jfd8DUowiZ7btnqCe0hBVOgnO6bldVS03/OQpCORR4rrhBEt9Pj4IufUWLXECBciIFwgxPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kb9tzUPf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kb9tzUPf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 564CCC4CEF5;
	Wed, 17 Dec 2025 10:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765966692;
	bh=iEZOJAy/iSZbPBkaO8hjqOZSzfOPhXxkhPIsof5U75w=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=Kb9tzUPfraLWCB6YRLZTzhDyRkjzd67uIhkKHgswPUTjEucZi1wx37fRmDY8nfsit
	 VL5LNJsFuVexMy0GBdx+yWXqgjmN3YYYHKbOYsy5kqAcL+clVuquARoFkqgf1kRjDO
	 KdzxVXXWOvMrcI6ThdGn4t4jQz06bCyvYgRm05Ue/MzUyTuylT+tvPVniahG/Eq3yS
	 JdkPLNh3M10JgbWiNqR1Pi0lIfYqsXvPfG+p8NmzE4zcMYVMVrMphifTonD4o+Xw/0
	 +9b8ssKCFLyfne0fNxpcfOw0OscH8FgukFU2B0wja7pS4FZ4rwwr2lGSVFTM7H3f7k
	 0CnwXHtjYytiA==
Message-ID: <035de7e7f585cedbe6cd28ce30ef5995@kernel.org>
Date: Wed, 17 Dec 2025 10:18:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next
 bridge
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
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

On Tue, 16 Dec 2025 18:58:44 +0100, Luca Ceresoli wrote:
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
