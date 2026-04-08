Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4C8355F4C;
	Wed,  8 Apr 2026 06:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775630532; cv=none; b=u1+fM4Ohz/45o7Dh8oqoCHmnuIlrijNC3WDYBq44Nlnjutoq49dIC2Hh6bRPRrxJGR/60UsafriGoPZLonXQlWF+JdXBgxrrGQmgr0K6tpWWcKej17DhWGRcMCqW4B7mODEbIq2ZP5fIwA5Y9+4Zl5voglFJKT30nMdX1KdxWog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775630532; c=relaxed/simple;
	bh=K/0wv+fOWMmmL54MkEbG43hnF9nGhokOwwcPwONb1fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sQVa8PSd1xEyvI/BXS2aoTx3fEnNXLNyewmhGTpaleRgsmQZaC2s8pwSeq0HOF67FtT/FXUvd4iEuzuCtW2656i5UrB3+A7/fvHcYTXXEr7EisQezHy8imcerMKqG39+3BCnCXU4mK69TGbaWNoXAj4r0dapqYdrIzuOJoENQa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvL3zwTt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvL3zwTt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A685C19424;
	Wed,  8 Apr 2026 06:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775630531;
	bh=K/0wv+fOWMmmL54MkEbG43hnF9nGhokOwwcPwONb1fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZvL3zwTt6o0HrXxgwwSY93aWOOFU78x8ZMj1E1oJbrRBdZio7fw+YtE0hGxEMYfYq
	 p2LPdESq2NhcABpGFFVF4yeEH7vv6pwYmJ63anAebfk4u+QHVXfD9aJQS5imP8E8E3
	 vdKv7KU5997Bh8HNhfOhJ6DhnqEnHaDQG0IvoVgsW/40BSIf8hvdqI3YRk+tvY9023
	 vUsN3KiG2epiZbLWgEB+1uLRL4+sSa1wkc0ByAmLZ8lNTTKcQ8uHz7TqWipqvm8/Df
	 hnKO5GAJHlvHAQy5A8cGSRby7qshGMrSH6JPH5hUilf8lEvfRa+hgxwn721WvmlJgK
	 rGyrmM/8MydkA==
Date: Wed, 8 Apr 2026 08:42:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: imx@lists.linux.dev, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	dri-devel@lists.freedesktop.org, Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Ying Liu <victor.liu@nxp.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v21 3/8] dt-bindings: display: bridge: Add Cadence
 MHDP8501
Message-ID: <20260408-large-marigold-pheasant-bef65f@quoll>
References: <20260407-dcss-hdmi-upstreaming-v21-0-4681070ab82f@oss.nxp.com>
 <20260407-dcss-hdmi-upstreaming-v21-3-4681070ab82f@oss.nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260407-dcss-hdmi-upstreaming-v21-3-4681070ab82f@oss.nxp.com>

On Tue, Apr 07, 2026 at 02:31:27PM +0000, Laurentiu Palcu wrote:
> From: Sandor Yu <Sandor.yu@nxp.com>
> 
> Add bindings for Cadence MHDP8501 DisplayPort/HDMI bridge.
> 
> Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
> Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> ---
>  .../bindings/display/bridge/cdns,mhdp8501.yaml     | 131 +++++++++++++++++++++
>  1 file changed, 131 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> new file mode 100644
> index 0000000000000..77e16ee9d855d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,mhdp8501.yaml
> @@ -0,0 +1,131 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/cdns,mhdp8501.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cadence MHDP8501 DP/HDMI bridge
> +
> +maintainers:
> +  - Sandor Yu <Sandor.yu@nxp.com>
> +
> +description:
> +  Cadence MHDP8501 DisplayPort/HDMI interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8mq-mhdp8501
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description: MHDP8501 DP/HDMI APB clock.
> +
> +  phys:
> +    maxItems: 1
> +    description:
> +      phandle to the DP/HDMI PHY
> +
> +  interrupts:
> +    items:
> +      - description: Hotplug cable plugin.
> +      - description: Hotplug cable plugout.
> +
> +  interrupt-names:
> +    items:
> +      - const: plug_in
> +      - const: plug_out
> +
> +  cdns,bridge-type:

Drop property. Graph defines what is connected on the other side. And if
this is for different devices then compatible tells what bridge is that.

Best regards,
Krzysztof

