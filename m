Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359B61553AA;
	Thu, 16 May 2024 17:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715879842; cv=none; b=cxsRcaWEWtSaXNTl1kRO2iz6zbEPKR+94SC8oI0Xs1V6niXFdXCKmZnHWrUl/VdnEmDvG/H2DY3/E+wL2KTE3Cyw6AtgQW4dhTm5jF6D+s3WjXpSr6aiiErfyqu63TuIoQWgF8BWEsT8Qe7RUBbrvMSG79qgdssLPOso7Z6U6Wg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715879842; c=relaxed/simple;
	bh=+9ep4E4ALUttjO+CaTJIyTPPObIWtAgLKOaiG62P4/8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GQj5UoeTuRb0LgY7nCMjxndf9vl6ByYFR/QGjgggYbXV/HvofM0/Nmp058TffAE+SDRrQzjK7oKOTmu16xFPdvh708zWYoyrs/dSWHGox7ERZ5l2IIJhQnAaQD3PDpSfTl7uxEITKl+evV5rGb99iDbBRdD+UmySuHonJb0zB0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1xnjiai; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1xnjiai"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03657C113CC;
	Thu, 16 May 2024 17:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715879841;
	bh=+9ep4E4ALUttjO+CaTJIyTPPObIWtAgLKOaiG62P4/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1xnjiaifHePS54zD9X1TOburYd+uayOwa3V9rdZnqe4IlCC/fRIN2fSq5fNZGo5K
	 2PPS/WxsS0fdyQsDyO/VCL5ocrZa9V9JWpcQ8D1xtfD35U7E6E3usPd7PEjkss+/Jw
	 kaoziU9PAglsmwY8h4hvNjveHBgjXHG+6nRp21HIedq8pOphTbAoWJeKWaDY45phio
	 oMWFkWb6piAx0WiLSR0+UspJXq7CS7OJynyqyKcQ5YOWGbwKJkm05dxlfWVgUc7vtm
	 uLectBhQ3N9H7GXGqzNK0U03i8jrehd1S5JytEm+aplNZuxRX7K8uMDTU1OdozQ6Th
	 P5MMi7eOn1o3Q==
Date: Thu, 16 May 2024 18:17:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: devicetree@vger.kernel.org, Andrzej Hajda <andrzej.hajda@intel.com>,
	Conor Dooley <conor+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] dt-bindings: display: synopsys,dw-hdmi: Document
 ddc-i2c-bus in core
Message-ID: <20240516-dill-exception-7ef1e9a1a473@spud>
References: <20240515062753.111746-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UCTs9d82BIhevYEn"
Content-Disposition: inline
In-Reply-To: <20240515062753.111746-1-marex@denx.de>


--UCTs9d82BIhevYEn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 15, 2024 at 08:27:44AM +0200, Marek Vasut wrote:
> The DW HDMI driver core is responsible for parsing the 'ddc-i2c-bus' property,
> move the property description into the DW HDMI common DT schema too, so this
> property can be used on all devices integrating the DW HDMI core.

Acked-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--UCTs9d82BIhevYEn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkY/mgAKCRB4tDGHoIJi
0jqhAP94jDx5vzCpjUTTo0IRSUg26A+svmD+AneDo1hxbXA/0gD/USEdNBXvLbFg
vXMTT2mMN3OlKcJk/qWTUKJe6EV/DA4=
=/C2a
-----END PGP SIGNATURE-----

--UCTs9d82BIhevYEn--
