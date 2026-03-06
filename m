Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52FB6282F39
	for <imx@lists.linux.dev>; Fri,  6 Mar 2026 08:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772786824; cv=none; b=Dz1FAEy+jBDLADkIV3Lluq1zVHJXlOYnNneFbMprmwgOYJ92og85hLzrmQDzwCEU1LJU2V0JxDTBVSc4mogR+LNDg7aCNpd5/YG87CWTxb98QrviFppNQnE7MDAlRLaGd/JN7ODMzb5AjnZxikPTt/5b1hJ3hQWxqgp0qJBkQrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772786824; c=relaxed/simple;
	bh=vQpsQyeraXy8poqd5yMRL6Sa9sAOtHpCCKJT1+3qt7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jr1qNEE08kwrOuGLaR4tqk1G3k746xInBXb+OnnL4+GMW9eoZsud3RhtLksGoRiFV5lqnzjyzsPV729jLEcba6i5sGls1WmaEGNKVz/rLyCg1bbEKxLujU7kmCy+2R7Iy8WV8XpupfV6mD81bSYz8UTr/m8qMXfU9iEvNF9NdXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vyQpn-0003Ng-6C; Fri, 06 Mar 2026 09:46:59 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vyQpj-0041QC-2g;
	Fri, 06 Mar 2026 09:46:57 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1vyQpl-00000004801-0Cgq;
	Fri, 06 Mar 2026 09:46:57 +0100
Date: Fri, 6 Mar 2026 09:46:57 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, imx@lists.linux.dev, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Marek Vasut <marex@denx.de>, 
	dri-devel@lists.freedesktop.org, Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/9] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
Message-ID: <dmqbmmpyi3ssvq67iqwbt6ww7tsaik7ifi5dnupmuhep7u5saz@ads5g7ette3y>
References: <20260304-dcif-upstreaming-v8-0-bec5c047edd4@oss.nxp.com>
 <20260304-dcif-upstreaming-v8-1-bec5c047edd4@oss.nxp.com>
 <b7968f1a-c4bc-4bad-bcf8-407ff2d8db27@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b7968f1a-c4bc-4bad-bcf8-407ff2d8db27@nxp.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: imx@lists.linux.dev

On 26-03-06, Liu Ying wrote:
> On Wed, Mar 04, 2026 at 11:34:10AM +0000, Laurentiu Palcu wrote:
> > i.MX94 has a single LVDS port and share similar LDB and LVDS control
> > registers as i.MX8MP and i.MX93.
> > 
> > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > ---
> >  Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > index 7f380879fffdf..fb70409161fc0 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > @@ -20,6 +20,7 @@ properties:
> >        - fsl,imx6sx-ldb
> >        - fsl,imx8mp-ldb
> >        - fsl,imx93-ldb
> > +      - fsl,imx94-ldb
> 
> Cc'ing Marco.
> 
> Recently, Marco said that LDB node should not have a reg property...
> 
> https://lore.kernel.org/all/4sofljffovrorpxe2os3jl745qfjoglvl54oqf3v7r5bk5f6aq@6y3jwn4abiqy/

Yes, this has to be dropped. All variants of this specific "IP" use the
same approach. This "IP" is part of a general purpose register layout
with very loose reg-field definitions: e.g. resets and clk-gatting share
the same register. Or a mux reg-field shares the same register as a
MIPI-{C,D}SI configuration reg-field. Therefore this "IP" is part of a
syscon and should be abstracted as such within the DT.

Regards,
  Marco

> >    clocks:
> >      maxItems: 1
> > @@ -78,6 +79,7 @@ allOf:
> >              enum:
> >                - fsl,imx6sx-ldb
> >                - fsl,imx93-ldb
> > +              - fsl,imx94-ldb
> >      then:
> >        properties:
> >          ports:
> > 
> 
> -- 
> Regards,
> Liu Ying

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |
