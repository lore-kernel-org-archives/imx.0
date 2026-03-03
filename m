Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B3A38D;
	Tue,  3 Mar 2026 06:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772520734; cv=none; b=j9xnQ7j69FC2JsIbUUTgKR7JhG6Llf4eQlu8B4OkFWlOlaXJUKYgQg3zJrAPVSR8+tDeBsDHBKaLarHw+eF9MzT+GsmDY9tgITWfG9CsQBReRI3vLot3NzWY0RZoronI9MesC0DncBmxmhC0ldht8tdkW3J1+rYQrBR5za3L2Hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772520734; c=relaxed/simple;
	bh=Owqa1+BkD4lML8DGZaHaxD/+Qjdb8XC9nOLsnGsYOZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovE5lzOE7ZItvj8JfmatYj4j/T7PobzQ+Np7qMJLSO07dCekNEDqJD/2m9gwn9rcQ8RmLPtg2S1VLG3LMlJWpzE93KFqz6MTxP9JX12Ne6ftVdWbwCA9xQteRW/DeSWA3t/zqXavKVoDy29adfOTUJF0X17dsKgnbFRs5sgdCa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YYaKW9Jm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YYaKW9Jm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF898C116C6;
	Tue,  3 Mar 2026 06:52:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772520734;
	bh=Owqa1+BkD4lML8DGZaHaxD/+Qjdb8XC9nOLsnGsYOZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YYaKW9JmjNm6gflUdX7wNc1usXBX8vu6crMoN3Xs5bGrChZp1dJx/xfwLRY0MBE5r
	 yaMHxZvE7mOBsITAKzrnhQSVFLyFyoPW3SPgE4rnEod9YGrZUjAd4WDfUhKnA0Z2EA
	 T8UgwEgMwjVtS/8gYrdsW/XbTKmM2HUl7qFNYJVDcGkHuZ2DorC55fqvbaZsNffAdk
	 kNCPOKOdnm9/AUIcMw93VIMiV1iAYemIPIjfmhQaFcBJF1go0VyiY5Uh0vOSOlOW7A
	 2jaMBImXFc7b5pyGuS8Os6t38An5ePscxnMil1n9G+5/rDV2/Wp8AKYTnO1avLF4kw
	 a68aUtP4GWZpw==
Date: Tue, 3 Mar 2026 07:52:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hugo Villeneuve <hugo@hugovil.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com, 
	antonin.godard@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Hugo Villeneuve <hvilleneuve@dimonoff.com>
Subject: Re: [PATCH 13/14] dt-bindings: display/lvds-codec: add ti,sn65lvds93
Message-ID: <20260303-solemn-umber-loon-6e4bb7@quoll>
References: <20260302190953.669325-1-hugo@hugovil.com>
 <20260302190953.669325-14-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260302190953.669325-14-hugo@hugovil.com>

On Mon, Mar 02, 2026 at 02:03:49PM -0500, Hugo Villeneuve wrote:
> From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Add compatible string for TI SN65LVDS93. Similar to
> SN65LVDS83 but with an industrial temperature range.
> 
> Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> ---
>  Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

