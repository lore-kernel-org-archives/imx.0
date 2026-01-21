Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2DE630AAA6;
	Wed, 21 Jan 2026 02:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768961501; cv=none; b=o1VwZwzGW08aaQHNZJNLiaCdttKaTmqcws9sjr6K/CXUOdNJiSJIA0lY2E9Rj3AkfOVJbrMRkqANsIDaIlb97fzAjZOhJ2fIVnOBI3/38SffFvrDKSGj5H2llVwkvrxn4J3gej7lXjQrOQV07QGTGD7cGkotrzfZTsqnjjGfvZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768961501; c=relaxed/simple;
	bh=/KGdhDaKaLBJN6yZlpLTZ1ZclR4grZLUB70QioIqzqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PKFWa2MNX0QfM0SPLjxULU5XqoXNNs8fSbwpXOl8C4zIIcHUv1k7TFi4bbaw0rBrzpIWKT4Eoh2gkFprhE+c4TxsTvIkRhKf6s3TQkwBCUIOIYAmor7jTQMBgTgyfcWKyTu7QpM1FbsA/VXEG7a25MbmryXuWK9f9QaAsXx7LKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JmuJmz9n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JmuJmz9n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A20DC16AAE;
	Wed, 21 Jan 2026 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768961501;
	bh=/KGdhDaKaLBJN6yZlpLTZ1ZclR4grZLUB70QioIqzqo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JmuJmz9ne2giYJgM05lbIVAzQnrqRB6rgNu6X1zj4EbT9rnhG1hqyFu+EBKmuKRQP
	 eU668ym8IXwTvFEDAz7kz+p26tFNneupjsiJdyY6sIalr5Fa6BJ7s23aEcL2hY8OY0
	 vU991IsPI+vUmnPHT5wNraIMNh4LZ8KTOEPcMG6EdzkSK8cA+lZnSdc+wKB3S7p5Pv
	 z6z+1LGle9Jzwi5lOorBhCAB2j/x4kj4o5kP/Z7oUEuL9yBomD7IY2tcI0PL6NDMjK
	 lrIniiMpO4RMq024RDeqq2NV9XF2ufGIIJYGysjfjMiQtLSk1zSYEeFqzR+2avYMmu
	 Kv4XK3xtDWGfg==
Date: Tue, 20 Jan 2026 20:11:40 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Peng Fan <peng.fan@nxp.com>,
	Liu Ying <victor.liu@nxp.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	luca.ceresoli@bootlin.com, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v9 1/3] dt-bindings: soc: imx93-media-blk-ctrl: Add PDFC
 subnode to schema and example
Message-ID: <20260121021140.GA1677576-robh@kernel.org>
References: <20260115-v6-18-topic-imx93-parallel-display-v9-0-2c5051e4b144@pengutronix.de>
 <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-v6-18-topic-imx93-parallel-display-v9-1-2c5051e4b144@pengutronix.de>

On Thu, Jan 15, 2026 at 04:24:51PM +0100, Marco Felsch wrote:
> From: Liu Ying <victor.liu@nxp.com>
> 
> i.MX93 SoC mediamix blk-ctrl contains one DISPLAY_MUX register which
> configures parallel display format by using the "PARALLEL_DISP_FORMAT"
> field. Document the Parallel Display Format Configuration(PDFC) subnode
> and add the subnode to example.
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> [m.felsch@pengutronix.de: port to v6.18-rc1]
> [m.felsch@pengutronix.de: add bus-width]
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
> ---
>  .../bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml | 78 ++++++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> index 34aea58094e55365a2f9c86092f637e533f954ff..d828c2e82965c7a4cd69a67136047d83c96b0a35 100644
> --- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> +++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
> @@ -40,6 +40,58 @@ properties:
>      minItems: 8
>      maxItems: 10
>  
> +  dpi-bridge:
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - nxp,imx91-pdfc
> +          - nxp,imx93-pdfc

Looks like there's a register for this at 0x60. That should be a 'reg' 
entry in the DT.
