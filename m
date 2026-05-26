Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 520EF3BFE5B;
	Tue, 26 May 2026 06:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775735; cv=none; b=nNpIkDdMbJEyIaNL3WkQKI79EscKUVMqpoTU95JcZOR7pyksF6QCI12/y/kpoKkJvziTLFeuTe3o3KjGZrEF4WAqkRMg/6+DZWrX5Fllxs/z3Yhr4mCePREHih5rnFmuaXbiDVw1ubS8CRaecJ0X6moiJOIWy0zryZC6i5Jlh9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775735; c=relaxed/simple;
	bh=JBiKiioTaFEgp+hBSfeXL+pdpcnpeAnAxda5QPdy88Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7eyzjtH0MlzTz3cr2txuQhNpvWCGLBdvpvkKWYCnUGXZPuygl328xujNx2Ow5y+Bv3RX6QO8sroKUoqylho2DsSjlQAl1QXiUu2OqBt/cDN+mPn6Llib+Cfuv+RkmPtQvFL/Cz6pgfRqKkiMBkHQYwPqbVijwihA4KE7z8D/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dmKlvR1P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dmKlvR1P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1C01F000E9;
	Tue, 26 May 2026 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779775732;
	bh=OCWUJFzRzWpsVt0mzkAdr0+7Usmub6EZk2ud0WrKyuw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dmKlvR1P0DtGjfLNgdV4jrQxB06YlPmKAAis7L8A9S9J6onI38+STIwcmF1APCYbf
	 iVFT9G5RaEOC8xw/rRNjLDE+uTruN8P4Vme9pBpmdkRtAJOVbpfezzEvbL9EqK7MFt
	 xBQKB6LxsL+1wIPjiGb0TFywk65FMVHYd8btFqRbkNm30xrFDojvMzHfbZ2dw3Z3as
	 eRKrS9TipeeAvTl3eheEFum4yN22Vdhd8ne7sn2IJjNH0KKTmL06S+WRGXXJjclRDl
	 QFRavisKIHTRS5YeZ/Dn7ZYfmVWhvhWPP0UwVrJrBKIhdmfuNHaDAWIucsj0Xc20ic
	 5OUcXXUgeX2Xw==
Date: Tue, 26 May 2026 08:08:50 +0200
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
Message-ID: <20260526-golden-bobcat-of-aurora-fd1fef@quoll>
References: <20260519-dcss-hdmi-upstreaming-v23-0-5615524a9c63@oss.nxp.com>
 <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260519-dcss-hdmi-upstreaming-v23-5-5615524a9c63@oss.nxp.com>

On Tue, May 19, 2026 at 02:42:28PM +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 136 +++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..57e7e95199777
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501-hdmi
> +      - fsl,imx8mq-mhdp8501-dp

We are at v23 and you will be getting the same questions till you
finally fix that commit msg.

Why bus/connector is part of the compatible? Device is exactly the same.
Please read writing bindings - it covers exactly this case.

Best regards,
Krzysztof

