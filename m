Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBEB45198B;
	Fri,  7 Aug 2026 21:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786139008; cv=none; b=VieGbPOIhuHmx3/05Rfg846gWBhjEw2m/a5y3f/cLkjSTn9MI6xCTz+HgD/mZT+BZtZmJkV+nwcp6herI5x4qp+KyDYUyEENixZPw+Pw0NWePCC+loGIJ6DYHtFzGuK5AhuMFZCVJMG2itLVNxG7z4pihewKk07z0PKwT6Uxx/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786139008; c=relaxed/simple;
	bh=LbszAPHy9MOq5OmMMZZaMs6hgSsRc86J5D/l6sfgmzc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jPDqepKNxPimA4c4JKUxhUvS1p85McYFeLEUVYtzOHi9/yUAbV7TkFtFFRnMKMsyr3GxhU62fpU4KClhR8iKyytC9oPFsmJbT04mhjTpZ929tCB5j1VRcEN60pUCLDDzSXq7PbJ1F8u/1mgmVNp30VNVDvTpELTIoQSFfX2WAMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FCsmZMOR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FCsmZMOR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E3AF1F000E9;
	Fri,  7 Aug 2026 21:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786139006;
	bh=O0GWgFWa+KBYW+SsUAsbFeygA58QMJKApP/borqb9+I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FCsmZMORxswv2bDdmcWQFXbFXcIjplPP1RneiT0TWSZiPP8H0kubyXerByucctfk8
	 FtIlCV4dr4M15leD5VGrIfr+wGoGA9cRwUF9v+3wfLmmW6mlSlUVf7MSGaA5HNFFj3
	 PnEtyivYrP6jJvQeWzCUv0KUcGBFUj9LE6bim8hQoC1H/eQ+LRXMcYLLCfcy2vkQKD
	 YeK6DWtGst5v2i3fobrRN38C8ZOZqZTmsdtCX3x5Q8+76XcaFeSTiA4D/PQXkFMb//
	 GCfer1AOJQmHmTEIOfy/ja9FMLnssIPt8tUxvRvgztwx5p209uONfwwRPSk7Xcs9Xy
	 KCKM7ZsYKkVUw==
Date: Fri, 7 Aug 2026 16:43:25 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260807214325.GA2070489-robh@kernel.org>
References: <20260723093813.180089-1-francesco@dolcini.it>
 <20260723093813.180089-2-francesco@dolcini.it>
 <amI3HKLECuZBHLs0@SMW015318>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amI3HKLECuZBHLs0@SMW015318>

On Thu, Jul 23, 2026 at 10:45:32AM -0500, Frank Li wrote:
> On Thu, Jul 23, 2026 at 11:38:08AM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> >
> > The DPI output of the LCD interface can be configured with a bus width
> > of 16, 18, or 24 bits. Introduce a bus-width property to the output
> > endpoint, specifying the number of parallel RGB bits connected.
> >
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v2: use the common bus-width property instead of the legacy interface-pix-fmt
> > ---
> >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index 2dd0411ec651..6931f0ae3829 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -71,6 +71,15 @@ properties:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: The LCDIF output port
> >
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> 
> Is it better by use video-interfaces.yaml# ?

Yes.

Rob
