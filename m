Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6E53939A2;
	Tue, 13 Jan 2026 15:44:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768319046; cv=none; b=N5ZqvjmW4y+2apDq3MNCEmfA8edQXdsg7YECpqKsaX5GoKktxo+UYsS7fFyd5mEvPWdH+rKLhcl3aggx4RZXzjsVVSU3g7EGGUNNdiRvPfNfqDNTu3WJmQvf3qo0g080bSCSdQ6PsZ3e1EUPOFxhfxCEgvon2JYwDVhEFCwES7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768319046; c=relaxed/simple;
	bh=PHMLXYcYeFMLCHsXk+6wPpFG2rT9iu0Lpjf1Mwx26o0=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Bi0OqNvghAP1t9xISK168kHWxYXqM9jJ3VAF6cEM5AfCfrxEEzMZc5u8CtPJUmlNSXOqfkP1n2dCfdx11ahJw98auYfrRWAL8LRUDcHFUdHUvq+0Nb/8+PvShsubWkjNQ5upoc2ZLGnJU9U9YvdtfKg2NTy9uq8NxiUohHiJPHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tmNtaCHZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tmNtaCHZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A405C116C6;
	Tue, 13 Jan 2026 15:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768319046;
	bh=PHMLXYcYeFMLCHsXk+6wPpFG2rT9iu0Lpjf1Mwx26o0=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc:From;
	b=tmNtaCHZhnOPkNQtKmhqE0bQ88+IeHPB6ckoskfF7ruYjI/e08Cv3ldpq51A8gL5K
	 qq0X+J8iT/Grf19XLTgb5OATfWR284kq/RnlqtUlkNoSxo6eibXw0WFnZlU02HB8pw
	 e2+yJczgiszrzdUco7ZUEptG4UiqdKwfUFwhuaLNX9Vu2S9AuNmlZtb6nkEmMVGIhX
	 KwjPuHC0MsPjRd7zhbOpkBnj44uodYV/nc/YhTg7NLH8IvjByTZDT7JyzL6OyBRWNg
	 BTT8J2U3ljOUcbgUGhMiYHM2lYIf0yxPl3TAE7HT3MbvSZLQTMV1LzFo+UA30q7ZDf
	 YE5fPWPxXXfBg==
Message-ID: <0985336fa75f27b7a85dd41e54a88e06@kernel.org>
Date: Tue, 13 Jan 2026 15:44:03 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 12/12] drm/bridge: samsung-dsim:
 samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
In-Reply-To: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
References: <20260109-drm-bridge-alloc-getput-drm_of_find_bridge-2-v2-12-8bad3ef90b9f@bootlin.com>
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

On Fri, 9 Jan 2026 08:31:43 +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done. Also switch to the drm_bridge::next_bridge pointer.
>=20
> This needs to handle both cases: when of_drm_find_panel() succeeds and wh=
en
>=20
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
