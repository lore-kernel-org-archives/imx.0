Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C5043F4A3;
	Thu, 13 Aug 2026 08:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608666; cv=none; b=ABhQ0UtDFV4x614pv2YF/8VO2xMUP7D/VUrASaUuSrn8GynAdSO71TB3fVT/7CIyutNbbOhmdKczlC/iTzB/qR3ZCQTU43ZcTSC7Qwdx+hvQX0d6Wcq9IH8PjfSh/Z5P5TB4Eim6o5FdFHv9DNBQYqAqUS4uMUyh1A9vC3PQqf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608666; c=relaxed/simple;
	bh=9myTtBaXeHJDR0E/gmFXDtQRnDrIuFEcAlDD0u0F80Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=By/tn66kPjvJhhxkszyE6kd4I5InRDSUyTkHWSWq2yp6O8iHuG9suCc4yGdYeJQhSqZimK8MtnfPZhP+dmlpJwy5bmnsVwwIyn3irkzvhlms/Zxp6cS7IrtdeVVYKkV8EGsaP+jHlbCbcuybf/nzyISXDxCVPIro/SVsR2rxIQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CjWZhFXR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CjWZhFXR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D0411F000E9;
	Thu, 13 Aug 2026 08:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786608654;
	bh=LAbJLZQ6tRw+3JpuTTlFStB7YRIx6psZDSrH5XlcvdI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CjWZhFXRdNo09EhhkbEYURxbkgpci1IzSja/nd9HBfkBVZ0l/tt8HtzQUzID8buL+
	 sbmudUpL1K4Up5L9VmIjxL/LLI0Y+B3j3Q8FZhMcVnqiFh9F/TGatzVl2kZo4UCYkJ
	 Wt7eVJVPmzTlNH34yTN41/GJwHHqlguYuwkTtEliHjFxTfmTTEUM3G/0/AIWSC4o1f
	 jfYcFOyMiSYwgsn4k/su3ByKc3aRrTNDuJpfG9fe5wZbeH0tvSfEoTCebNftttmfTe
	 OVYZIvgdnhzHarOUWFThup8oGhuKfAZAQ/FPewd9ZUMeHUt77EDHCiRH+bOw47ZLDW
	 jPxftFuGAqIDA==
Date: Thu, 13 Aug 2026 10:10:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Cc: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Francesco Dolcini <francesco.dolcini@toradex.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: lcdif: Add endpoint bus-width
 property
Message-ID: <20260813-classy-boa-of-apotheosis-57207e@quoll>
References: <20260812132954.148571-1-francesco@dolcini.it>
 <20260812132954.148571-2-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812132954.148571-2-francesco@dolcini.it>

On Wed, Aug 12, 2026 at 03:29:49PM +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The DPI output of the LCD interface can be configured with a bus width
> of 16, 18, or 24 bits. Introduce a bus-width property to the output
> endpoint, specifying the number of parallel RGB bits connected.
> 
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> ---
> v3: use video-interfaces.yaml
> v2: use the common bus-width property instead of the legacy interface-pix-fmt
> ---
>  Documentation/devicetree/bindings/display/fsl,lcdif.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> index 2dd0411ec651..1f3daf002707 100644
> --- a/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> +++ b/Documentation/devicetree/bindings/display/fsl,lcdif.yaml
> @@ -71,6 +71,15 @@ properties:
>      $ref: /schemas/graph.yaml#/properties/port
>      description: The LCDIF output port
>  
> +    properties:
> +      endpoint:
> +        $ref: /schemas/media/video-interfaces.yaml

This won't work, you need to test your DTS. The port schema does not
allow video-interfaces properties. You need port-base, like in every
other case.

Best regards,
Krzysztof

