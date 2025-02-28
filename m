Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E03E526AABE;
	Fri, 28 Feb 2025 12:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740745710; cv=none; b=Cr8LYLaiNyfpf5Wv30LpL5jrUXhnXqkhJLxLsUxHPiYXlcZ5mZAMVgSg7oOHDtRDoQF1u/r6nSaVgTVkTOKWrZ/b+QEFrLxXy0SUX9YmQ6XQqnP9H/fNgbuyjaaaU+UxK2yGY+dnSNtPgWgVhHBH0NHynOHdsUQ7LJkFaHT6+uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740745710; c=relaxed/simple;
	bh=mTxyB5LfIETi+uJvOVDQqxXR+KxU8npM8MnbMmEt/n0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xq4uEDMVYDOqoxYZlLgrx7xhv+V7lMO24GBI+yZAHPP2I2t9pLX5VXPw7U/fx4LbLyqFy3ZvnDe0+L1di7LMi4kkqACFOcTtmoTBGZ2tn8SFAmaRf2ILAmRUdmJ2krDbuYsChuFNk8F7HRywCZacOrolhimXIYH7RW0f0pTHZ1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QvCon2Gx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QvCon2Gx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39577C4CEEC;
	Fri, 28 Feb 2025 12:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740745709;
	bh=mTxyB5LfIETi+uJvOVDQqxXR+KxU8npM8MnbMmEt/n0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QvCon2GxURZLGP41UlqCFBsm/k6EHWKtK8TKpZwIps0xE3JxVpXYPf6Idk0a1xcxm
	 OMwKPb5n2jzmPix3DVoA5xuVJkSxqzhK/zcoYynXQP1WMZh5MKWITEmC1bvVnMvUFb
	 jBUV46WR0Tdekr+Mme41JFuwt+PyAumTEjJ1pUkw75nbpfEAwjmeEF1TgJJZ28JvRa
	 6XrfTi4203h9GmQYf0apk3u1o9TZYhPbyV9/tTaYwXwDQ2sm9rENEEczzL3J+fz37f
	 aJzzs3zRkqn1JKGlRIhGK+QpPEfUXq8vipSlLS7fPPTXE71U4uZDKx81xyCEsloq/F
	 WJtfQ2NhJOctg==
Date: Fri, 28 Feb 2025 06:28:22 -0600
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	David Airlie <airlied@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
	Shawn Guo <shawnguo@kernel.org>, dri-devel@lists.freedesktop.org,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Maxime Ripard <mripard@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sebastian Reichel <sre@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH 7/9] dt-bindings: gpu: mali-valhall-csf: Document i.MX95
 support
Message-ID: <20250228122822.GA2321092-robh@kernel.org>
References: <20250227170012.124768-1-marex@denx.de>
 <20250227170012.124768-8-marex@denx.de>
 <174068152164.3906545.6393185343383919273.robh@kernel.org>
 <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77585efa-29f0-47ef-af02-d927a512b9ae@denx.de>

On Thu, Feb 27, 2025 at 09:31:48PM +0100, Marek Vasut wrote:
> On 2/27/25 7:38 PM, Rob Herring (Arm) wrote:
> > 
> > On Thu, 27 Feb 2025 17:58:07 +0100, Marek Vasut wrote:
> > > The instance of the GPU populated in Freescale i.MX95 is the
> > > Mali G310, document support for this variant.
> > > 
> > > Signed-off-by: Marek Vasut <marex@denx.de>
> > > ---
> > > Cc: Boris Brezillon <boris.brezillon@collabora.com>
> > > Cc: Conor Dooley <conor+dt@kernel.org>
> > > Cc: David Airlie <airlied@gmail.com>
> > > Cc: Fabio Estevam <festevam@gmail.com>
> > > Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> > > Cc: Liviu Dudau <liviu.dudau@arm.com>
> > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > Cc: Maxime Ripard <mripard@kernel.org>
> > > Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> > > Cc: Philipp Zabel <p.zabel@pengutronix.de>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Sascha Hauer <s.hauer@pengutronix.de>
> > > Cc: Sebastian Reichel <sre@kernel.org>
> > > Cc: Shawn Guo <shawnguo@kernel.org>
> > > Cc: Simona Vetter <simona@ffwll.ch>
> > > Cc: Steven Price <steven.price@arm.com>
> > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > Cc: devicetree@vger.kernel.org
> > > Cc: dri-devel@lists.freedesktop.org
> > > Cc: imx@lists.linux.dev
> > > Cc: linux-arm-kernel@lists.infradead.org
> > > ---
> > >   Documentation/devicetree/bindings/gpu/arm,mali-valhall-csf.yaml | 1 +
> > >   1 file changed, 1 insertion(+)
> > > 
> > 
> > My bot found errors running 'make dt_binding_check' on your patch:
> > 
> > yamllint warnings/errors:
> > 
> > dtschema/dtc warnings/errors:
> > 
> > 
> > doc reference errors (make refcheckdocs):
> > 
> > See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250227170012.124768-8-marex@denx.de
> It seems there are no errors in this list ?

That's an artifact that a prior patch in this series failed.

Rob
