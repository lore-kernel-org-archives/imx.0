Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BB130C359;
	Thu, 28 May 2026 07:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779953839; cv=none; b=YcImGcc65L/Keq99QN/Mxf65PJ83YzP8AbWDotEHDOoJn6SqEB+aPufcmDNQsZeGZf9bmKrdizuCrG9qpRnZ1PxcUlabryojtDh9HqC2GbvHb17eMqMwsR1nMkrrGrJzmdATZSnsPdiM9Kkbit14mIfqT1D7lb7to46EmXYY5Zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779953839; c=relaxed/simple;
	bh=WAYHpQQhAiVaamKGzgBVjax2JzPvYqtGuIgdpTd1Oo0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FST5a9Nh5KMTfdff/qksdUQpZ2O73KCIB6zTNCDkNyPBNGWbHlNDgwpT3q5QQUS7dmWbYqlkq+HOcxp/UQvTPEPGWF/A692jYFNdcJ7Wgu8A+uGbHdbCuE05D+vTanq/EmJU7vaXEf4et7k1gfWp0RyLokCDYH6LEn+d5WhGIUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IqZlZ0jZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IqZlZ0jZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 720781F000E9;
	Thu, 28 May 2026 07:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779953837;
	bh=sjMCyOJicGcnsOK1p3JsmbDECVIS3LwVFxzgQoZgP/8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IqZlZ0jZUWdyRo9TVikWIWSsxSzUCcde9CJs9ADiitZiyWPh+Myh3azKEFD7esWp3
	 ZKOsVF6bKCuoUZSY+u+1/Bj4Lm9AG1WA5aRFhk4z3SKMTg/xjUB9lXC8pOQ7EOmSiS
	 EYEszxyhtL0wcO/FOt1OTPDHdCwoPw0URBbak0gAsbFN3YqcOT/xLTx12Ch+kSAXLm
	 G1k8Am2o9o/oqwVB61n00/NeSAiCN04vPqnZAO8S26D1MAjX37DQAb5ADQ7ogvEWvP
	 h8IY3x4Ku1K5h4epJh5621y6jwHs+0GXRoLASvWi8VMek6/APjGK9gn9JcMY1htqai
	 2Hs+lm+otW/jw==
Date: Thu, 28 May 2026 09:37:14 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux@ew.tq-group.com, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v23 5/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <20260528-watchful-nippy-toucanet-8ecf39@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
 <20260526-golden-bobcat-of-aurora-fd1fef@quoll>
 <2301c829-5203-47ea-bc26-09f9e3b459a4@kernel.org>
 <6oub7yyy22dtrevw7oayaqkcncz6tmmddy6fb75gsn3z6yfe3r@zr5lehbaohof>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6oub7yyy22dtrevw7oayaqkcncz6tmmddy6fb75gsn3z6yfe3r@zr5lehbaohof>

On Tue, May 26, 2026 at 09:44:53AM +0300, Laurentiu Palcu wrote:
> Hi Krzysztof,
> 
> On Tue, May 26, 2026 at 08:10:43AM +0200, Krzysztof Kozlowski wrote:
> > On 26/05/2026 08:08, Krzysztof Kozlowski wrote:
> > > On Tue, May 19, 2026 at 02:42:28PM +0000, Laurentiu Palcu wrote:
> > >> From: Sandor Yu <Sandor.yu@nxp.com>
> > >>
> > >> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> > >>
> > >> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> > >> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > >> ---
> > >>  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 136 +++++++++++++++++++++
> > >>  1 file changed, 136 insertions(+)
> > >>
> > >> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > >> new file mode 100644
> > >> index 0000000000000..57e7e95199777
> > >> --- /dev/null
> > >> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> > 
> > Filename must match compatible.
> > 
> > >> @@ -0,0 +1,136 @@
> > >> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > >> +%YAML 1.2
> > >> +---
> > >> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> > >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >> +
> > >> +title: Cadence MHDP8501 DP/HDMI bridge
> > >> +
> > >> +maintainers:
> > >> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > >> +
> > >> +description:
> > >> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> > >> +
> > >> +properties:
> > >> +  compatible:
> > >> +    enum:
> > >> +      - fsl,imx8mq-mhdp8501-hdmi
> > >> +      - fsl,imx8mq-mhdp8501-dp
> > > 
> > > We are at v23 and you will be getting the same questions till you
> > > finally fix that commit msg.
> > > 
> > > Why bus/connector is part of the compatible? Device is exactly the same.
> > > Please read writing bindings - it covers exactly this case.
> 
> The device is the same but, based on the FW, it can act as DP or HDMI
> controller. For 8MQ, the FW is loaded by the ROM. I did look at the writing
> bindings doc and I assume you're referring to this exact paragraph:
> 
>    - DON'T use bus suffixes to encode the type of interface device is using.
>      The parent bus node already implies that interface.  DON'T add the type of
>      device, if the device cannot be anything else.
> 
> I don't see how is this applicable in this particular case. The parent bus node
> does not imply the interface and, as I explained previously, the device can be
> either DP or HDMI.

True, not parent bus node, but in your case still other nodes could define
that this is HDMI via graph.

The problem is that device is the same thus you cannot have different
copmatible. If you look at your driver (although that's not ultimate
argument, just a hint), it clearly needs compatible only to tell if
connection is HDMI or DP. So again: device is the same with the same
programming interface.

Therefore same compatible.

> 
> > 
> > And this was BTW completely different in previous version.
> 
> It was indeed. However, the problem is that there's no way to detect
> from the controller's registers if we're in DP mode or HDMI. In v22 I
> added a DT traversal function to detect the connector type from the last
> node but it was suggested to me that having 2 compatibles would be a
> much cleaner solution and I agree.

Well, you cannot have two compatibles.

Discover the end connector. Optionally phy argument can tell, although
usually not that direction (the phy argument would tell the phy provider
how to configure it, not phy consumer).

Best regards,
Krzysztof

