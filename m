Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABD3E1CEACD;
	Tue, 14 Jan 2025 08:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736843693; cv=none; b=rfMBrXiWCR6UcNNIazw4XldZxRM06I3g3NPNkhzpS5nHFIC96+Xa2ydrJVhNZU64kHd7iqeak8/gfvtJZ6fZJxPn4LZkFu+7nReA/ASKI5kBocrrQEKjdM2cJSJAkI5gbxpeZ4F3HtMFyWWcntRP/CV+Uc8yYXQY9fNHoXxZt0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736843693; c=relaxed/simple;
	bh=7dSaHofpJxvwalwOQnG7xDr2/PjqZEbK15g2hNfAOPE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJYaAU+tajlT8RXieGdWXcLQTFbjTIgbu4B6wukxzWoyZjPWqljlI8NewWWkYU7VzosWAD2uvbKcr56qegbZ5twQ5EmhXZ9gguPN/mApTFMF7sh1YQrSsMshcqeIswfwhEs1VxuBfmcTma2+ZpwQ8v9DkPk24EIRGDMlR8ylEmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S5/JHLs0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S5/JHLs0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86E66C4CEDD;
	Tue, 14 Jan 2025 08:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736843693;
	bh=7dSaHofpJxvwalwOQnG7xDr2/PjqZEbK15g2hNfAOPE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5/JHLs0tLYVTXW2+/GOcfyg/MgCXjTJtv5XEpLDO8pbytrOJoWA2JvY/JcyGzHr2
	 ThDl6r2KRZJtxxjafyDbJ67e4z5+DZ8zcERqNIlZnmAWkIx2G5Xppod5MpUB85jzAO
	 TxgLvhWvgs3wFP3mKlwaHLLbM131pPND3aDpTIftc9LqNM6P+O8UoQCwerQ6bfrN+w
	 VNU+plAKpLdQ6HB0NSunZbCao7m59cJDoOjMVw07CnA0OsJUVOVaFoHf+rdc4WGDXu
	 96nF7IFGGYoE6U8r+mbL21URPht4k7W5svIZqm425fh5I2XIY0u1ejdwXKXvGGOgVU
	 RZT4QXljBwj3w==
Date: Tue, 14 Jan 2025 09:34:49 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Guido =?utf-8?Q?G=C3=BAnther?= <agx@sigxcpu.org>, 
	Robert Chiras <robert.chiras@nxp.com>, "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] dt-bindings: display: nwl-dsi: Allow 'data-lanes'
 property for port@1
Message-ID: <c5y6mocsd77wj5lah6n47vtteqc5ekcrbdod6z5vtcnxhleudw@kfhpyoiylqqp>
References: <20250110161733.2515332-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110161733.2515332-1-Frank.Li@nxp.com>

On Fri, Jan 10, 2025 at 11:17:32AM -0500, Frank Li wrote:
> This controller support scalable data lanes from 1 to 4. Add the
> 'data-lanes' property to configure the number of MIPI display panel lanes
> selected for boards.
> 
> Change $ref of port@1 from 'port' to 'port-base' and add 'endpoint'
> property referencing video-interfaces.yaml. Allow 'data-lanes' values
> 1, 2, 3, and 4 for port@1.
> 
> Fix below CHECK_DTB warnings:
> arch/arm64/boot/dts/freescale/imx8mq-tqma8mq-mba8mx-lvds-tm070jvhg33.dtb:
>  dsi@30a00000: ports:port@1:endpoint: Unevaluated properties are not allowed ('data-lanes' was unexpected)
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> Change from v1 to v2
> - Add the reason why need 'data-lanes' property in commit message.
> ---
>  .../bindings/display/bridge/nwl-dsi.yaml       | 18 +++++++++++++++++-
>  1 file changed, 17 insertions(+), 1 deletion(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

