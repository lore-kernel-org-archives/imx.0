Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC19368D47
	for <imx@lists.linux.dev>; Thu, 13 Aug 2026 08:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786610053; cv=none; b=AnkaTIZZATsGqoiqzJ2wcCS+Mo+dF5sELN6FbFxhMdB8uwH4cSykqTcvQ/FRcxDuDnxC6mSD/619EdiDsgkDTr8XOG5MCPLsRbUu3wQEYy7+lBsFV35FQcN3JWuL5vaZLxpzYJ41CyqSuFySr5fIi/aQuT9gQc5a0TdcnrgTqH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786610053; c=relaxed/simple;
	bh=cJtrkwAE0/AwMlXE6GA9kcDCZyY31mzHywb9HBVFi3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0Z+DOLAboqU1r+p6kMH9r5cTiv0OboEVf759+lrwyhqorzm8QnSogH/xkaYSUSj8Jfpn0U4a+AcNMIozGe+Zr22pnQVNtYCChlsZQ4QKB758UeMiJE70efnPziAn5vtCu2AQ0ilo5z3uD9vRpBtBgsWzrrGjCgBRl4PErgAMWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=xSZV/gXq; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="xSZV/gXq"
Received: from francesco-nb (2-224-16-253.ip168.fastwebnet.it [2.224.16.253])
	by mail11.truemail.it (Postfix) with ESMTPA id 9B75A1FBAF;
	Thu, 13 Aug 2026 10:34:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1786610048;
	bh=7xjwtghHlk2Hu/nCWdg14GhhhCsWUBT8CAjn3KZOlQw=; h=From:To:Subject;
	b=xSZV/gXq/gh8q2vWa5+5RNpYaKm3SwFJk4OPD+WwW369+8GoL/OPto8pRtiw4b2Of
	 1Zr24iWHmsCq5Rpat/hVjDBxXNuBhVSG6E7/MvpthNTYzA8cPOXGpdd34EilgikuDE
	 qLdnwGvy96m/EU2gXKX5rLjkm1cCglHczpO4oITcL/+g5EPpkTV9ZOcEr3CX53Q3mA
	 sp5RmTD5Q5X+HTt7g+XT4sPbRYfxUkU87Q8IqluXor+lSZmPAPJ1XuByRX4EglUgin
	 kgRb5SHcLfBGp5z57/mwd5zIuYIHW7LzOg5v23/B1VnmuE4FfizlwL8MuTaiVSc6H4
	 oDsPeIf8SL8/Q==
Date: Thu, 13 Aug 2026 10:34:02 +0200
From: Francesco Dolcini <francesco@dolcini.it>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Francesco Dolcini <francesco@dolcini.it>, Marek Vasut <marex@denx.de>,
	Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260813083402.GA19687@francesco-nb>
References: <20260812132954.148571-1-francesco@dolcini.it>
 <20260812132954.148571-2-francesco@dolcini.it>
 <20260813-classy-boa-of-apotheosis-57207e@quoll>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813-classy-boa-of-apotheosis-57207e@quoll>

On Thu, Aug 13, 2026 at 10:10:43AM +0200, Krzysztof Kozlowski wrote:
> On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> > From: Francesco Dolcini <francesco.dolcini@toradex.com>
> > 
> > The DPI output of the LCD interface can be configured with a bus width
> > of 16, 18, or 24 bits. Introduce a bus-width property to the output
> > endpoint, specifying the number of parallel RGB bits connected.
> > 
> > Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> > ---
> > v3: use video-interfaces.yaml
> > v2: use the common bus-width property instead of the legacy interface-pix-fmt
> > ---
> >  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > index 2dd0411ec651..1f3daf002707 100644
> > --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> > @@ -71,6 +71,15 @@ properties:
> >      $ref: /schemas/graph.yaml#/properties/port
> >      description: The LCDIF output port
> >  
> > +    properties:
> > +      endpoint:
> > +        $ref: /schemas/media/video-interfaces.yaml
> 
> This won't work, you need to test your DTS. The port schema does not
> allow video-interfaces properties. You need port-base, like in every
> other case.

Thanks for the review Krzysztof

Given my testing was not ok, and I am not sure what I did wrong exactly
on my tests, is this the change I should do?

diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
index 1f3daf002707..89cea0c14cf1 100644
--- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
+++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
@@ -68,7 +68,8 @@ properties:
     maxItems: 1
 
   port:
-    $ref: /schemas/graph.yaml#/properties/port
+    $ref: /schemas/graph.yaml#/$defs/port-base
+    unevaluatedProperties: false
     description: The LCDIF output port

