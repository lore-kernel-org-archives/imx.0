Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F793273F9;
	Tue,  7 Jan 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736292081; cv=none; b=dgPRxqEKoYN6hDaR45c/6UJ/WdGg5rijFrHP8D/akinS1fDQWiipcEKQ82h1i6y4+zZSoUQ0Rn6z3ttgP9lddzag6fQ9T713dbNBw+N3HGMIMRK/4hqz3tKsB9DAM2ZsmYWWl7wpmHI4aAK1jZEkak5lMMEbvmdk3PZP7LPWN+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736292081; c=relaxed/simple;
	bh=Kilm1ZAdWzy3rPEDUVkX5c9b+aYHLITqsZsNfgNyC2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEjiWGjhQSq8PDSBDXcQGRfrMslgIx+cwZVLJZXX43GC1NamwvoBFXsy7DB8gicFqVaGOCmxZiOggkk0TL/2UrQTi0wiQSdeGSHzRWq55E9teG2OLPKFgkmLk88NXw0aDxb9efETDfnUrl56R7sK++nlUiL0jXpkbOI5yZJQH2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sUgylO24; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sUgylO24"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F12C4CED6;
	Tue,  7 Jan 2025 23:21:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736292077;
	bh=Kilm1ZAdWzy3rPEDUVkX5c9b+aYHLITqsZsNfgNyC2Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sUgylO24DAttxYL26qZXve5hvrgsTvvOnKU7yq7oY/O13PXLgH2yaUT8j3dzbDI4F
	 G9gnqx8F2ap2hpu7iaASyaqHOfJli9UmxBevnHSF7UXBo7Bqje8zyZzfoNad0rvDYK
	 vctghzjYXEqQ6+9kIBAuHDSzFRUEXsjZP0JkDg0Y3iyXzdr47eYgDJZl8innUNJuU+
	 Bs1ibYZaqkYXENoWmYZnZVM0qE0RP3h0HMurlFB65jj78ZeB2qN0Ewezg7o0W1sTRR
	 FZ36XWzWe1sJeV5wOs0+d6l8bAnqoQBa1Xeo3tBY8iJRyz6zCy7HUDFNEaPVtGoBOM
	 wehUeO4yRC1Jw==
Date: Tue, 7 Jan 2025 17:21:16 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: imx@lists.linux.dev, Simona Vetter <simona@ffwll.ch>,
	Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>, Robert Foss <rfoss@kernel.org>,
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jagan Teki <jagan@amarulasolutions.com>,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 2/2] dt-bindings: samsung,mipi-dsim: Add imx7d specific
 compatible
Message-ID: <173629198495.2036683.9877314471091548361.robh@kernel.org>
References: <20250107094943.518474-1-alexander.stein@ew.tq-group.com>
 <20250107094943.518474-3-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250107094943.518474-3-alexander.stein@ew.tq-group.com>


On Tue, 07 Jan 2025 10:49:42 +0100, Alexander Stein wrote:
> This add a imx7(d) specific compatible which is compatible to imx8mm.
> This silences the dtbs_check warning:
> arch/arm/boot/dts/nxp/imx/imx7s-mba7.dtb: dsi@30760000: compatible: 'oneOf' conditional failed, one must be fixed:
>  ['fsl,imx7d-mipi-dsim', 'fsl,imx8mm-mipi-dsim'] is too long
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/bridge/samsung,mipi-dsim.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Fabio is clearly confused, and I prefer this patch over his. As 
it is probably past the drm-misc cutoff, I applied it to DT tree.
 
Thanks,
Rob

