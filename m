Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0EA84973A4
	for <imx@lists.linux.dev>; Wed, 30 Sep 2026 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790765027; cv=none; b=dtd92BGavEcfYyzN+EoutsdbS+l2eFsfECP2YczzUppLKMDWkXzBNDKHinFde9/y4NiaGO/rRRqG+wC5nzb3DFg/y8PKidZ9cA1B5zvzp3ocXVX3DHEISyz7LjikAuNXxtHT79Q1s9rfoQIcpaW9D+dczoaQ7ubYWPVa4YsKaXA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790765027; c=relaxed/simple;
	bh=9ayUJ468IBwRfm4IZUJTKdQdOmbu5XIPSAW4+dOlH+Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hC5RVJgggPhZu7oRGzDLHwpWALXxlopxZ2djsIXas6Sk3K5IS3iD4fkaLqsFIa80q98ODfOr6C2frAE6bu/b5IiOC5u1zQ9PBd/WDhwQv8Y6qYaKf24Db9SLbOSYOrWlnAEBYc2sw6e6EWmxyHVcoF4JRyUJBZvu7bTFkaC1/ZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=uwMIm2Zg; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="uwMIm2Zg"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C2D294E410CA;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 79C9160749;
	Wed, 30 Sep 2026 10:43:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6EB92103282F2;
	Wed, 30 Sep 2026 12:43:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790765014; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SkK7nzvmdXccAthjxNIG0aZSr8ABcmG303myl+zYPu4=;
	b=uwMIm2ZgNp+9UTQoK8f6qN0jFJlsClA7TYMdrOhRR30NVVR+4ZdxQGjNgpKEgLZFZW8nIZ
	SrNoCIqlXzss7mn1ttQ/Qxs9iwIOqGwaiIyHS7f8XJRsoU/PdS3L7SfsaglWWl5EzdiZS2
	fKkGKYH+p5A7avdTSZ+Ksneuesud+ZDK58ji934XC/j2wQoha9yjpQq+D1sCwh7KV9K4cl
	yWQ8zQiO6j8FZv5fMBwbnYrCNdB2ASYJVZK0k16+VvCMtx4suIiKP5ypE9nkNENHEehtFt
	lpEE48vI9N0KOP0Tc4A9tCy5r4AU1j21Swd8J7sOxaEPlmJPQM9Rfk/zt+9VFg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>
In-Reply-To: <20260917140042.118181-1-francesco@dolcini.it>
References: <20260917140042.118181-1-francesco@dolcini.it>
Subject: Re: (subset) [PATCH v5 0/4] drm: mxsfb: Support LCDIF interface
 bus width
Message-Id: <179076500400.452568.15346989916115503276.b4-ty@b4>
Date: Wed, 30 Sep 2026 12:43:24 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Thu, 17 Sep 2026 16:00:35 +0200, Francesco Dolcini wrote:
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
> 
> The width of the physical LCDIF output bus can differ from the input bus
> format advertised by the downstream panel or bridge.
> 
> Such a distinction is required when the LCDIF bus width does not match the
> width of the downstream display interface. For example, an 18-bit or
> 16-bit LCDIF bus can drive a 24-bit display by wiring the available color
> bits to the appropriate display inputs. Configuring LCDIF solely from the
> display's 24-bit format in this case selects the wrong LCD_DATABUS_WIDTH
> mode, changing the color-bit assignment on the LCD_DATA pins and resulting
> in incorrect colors.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: lcdif: Add endpoint bus-width property
      commit: 54d28d79d91d85090814fadc39ee050920de84e1
[2/4] drm: mxsfb: Add optional DPI output bus-width configuration
      commit: aafd4205a75de54cb46458bbc70f35a0be1d7533

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


