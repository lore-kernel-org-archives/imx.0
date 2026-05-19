Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C9093E1220;
	Tue, 19 May 2026 09:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184798; cv=none; b=ZALj6aK81MvPZiIoRytKmThET+YHgN/cjmO9KWAU+oXuWFA/WOppyZhq+pmZMRxHXyov05AcO1UbrS7NVnhAiXkKWabNdnoLJkHqSEpr/JsknUmZD7Ny3cgV5XLTFGbok/MY5VNTsUGFxsdtiDIt2bD8jaSqCXx4ZCMwS7gaEe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184798; c=relaxed/simple;
	bh=Z0vKOc7r2kW2KPOzWgaoABhrSGC1H7vmq3e+2RoG+fU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VhN9anY6StmaRN+fAslsGaTp3PHAv9ORUwd6YI+zEIbt2qPPWg1QYwWcOuFH0XrndP/pueI/z+5uV8Ox81yKF1UayKYfd9za6KjJHQcMHv/p2qMC61CGpyIQqU6J/PvfUvLihFNarSII/p5TlFAs4I5oavG6J++fw8StB/td5/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uazA7qn3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uazA7qn3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72E2AC2BCC6;
	Tue, 19 May 2026 09:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779184798;
	bh=Z0vKOc7r2kW2KPOzWgaoABhrSGC1H7vmq3e+2RoG+fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uazA7qn39Omh173quvgScKbx7HCKeRL5BymeukmCnA2ZOHIFCW/MgtzRgHnrHVrbd
	 qfQ5XibtlS9lWsn8JHXxV9Qi0VGwv4ZDTjjJfmmpvqpPeHYCcCyu5atvr/7ZjHTR7+
	 Vql7GU3IIDUO3yVHftc8PmZ5D3Nkiu2cZak8x7rP71GIlwypGcAMfKRmyW4hpzJ4Vp
	 s8WhQEx86QlmYKnW52dSCN1l4aXGhnDJziAmG99IpDBrraDENYAihAtv7UXTE5ipp9
	 ASX5F+OrGZ8e5ytGfKWmvXUjN/6kdJvoCdUMg4qvfD78Fj5+Nx9zROKvAftMrl59U/
	 NtMVqdyPR7SCQ==
Date: Tue, 19 May 2026 11:59:55 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, 
	"open list:DRM DRIVERS FOR FREESCALE IMX 5/6" <dri-devel@lists.freedesktop.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>, 
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: display: imx: Add television encoder
 (TVE) for imx53
Message-ID: <20260519-azure-mackerel-of-judgment-dcab1b@quoll>
References: <20260512223137.1190096-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512223137.1190096-1-Frank.Li@nxp.com>

On Tue, May 12, 2026 at 06:31:35PM -0400, Frank Li wrote:
> +  ddc-i2c-bus:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the I2C bus used for DDC (Display Data Channel) communication
> +      to read EDID information from the connected display.
> +
> +  dac-supply:
> +    description:
> +      Regulator supply for the TVE DAC (Digital-to-Analog Converter).
> +
> +  fsl,tve-mode:

This should be a required property, based on current driver code.

> +    $ref: /schemas/types.yaml#/definitions/string
> +    description:
> +      TVE output mode selection.
> +    enum:
> +      - ntsc
> +      - pal
> +      - vga

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

