Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793617572;
	b=humTHKsHjwTBQlSvOygCTh3wGC8kc6V0TH5StqokG5iiL+s9RgWc+9wedj1jVVIe/I4e
	 98yz40d7QqqWbJ0UwXo/L7dgE8CkhQ/GwIQnMJkbjwNe0oFF7CZBWTnlejtB2VeweWm21
	 O/Db4nfqBe/xNc+Gd9LeqkEx092VJTAm8JM/hZO/7GPc4B4GfmpJm4IwgfvV+1SMVlc2W
	 1IyHe+LaubbEcEfCgxgi+0FxDLCPOpNrEuPnrDaXEF5U1M1N+xeGW9oVGE5r91BnKysC4
	 iOI3KHnr5nwHiy3NB497ybtTRni+AFoHlI2cyLZRFxQnOl/RwlpEESk1znzPiw45fEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793617572;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=;
	b=IXVAzGmSDUMBzFM3IU1MFtVQnrjPNQwC6LZ6AifosAnWpmp7hKcsIOwt2TsEdCpF9pao
	 wU4TGhHxEKOVm+AYHBYijd12phtEtXB5ShOy5oUCYpy0hOV9n0sL08QPaVtuiDc0qljSU
	 o6ekm6Ikq3t/Bo3cAS9t8UMlPP0on7d8XCBoQTrIJojMAShRcLLAYgZBKIzMW0sbGQfsD
	 3X9LH24asbpwCrC9dBBbA/Isz301wpo/UnL1rOb5aTTiuAtioBcgDAl5yfJYNg/rou7E1
	 objk8lqGMOWxdH0Wepqx3UdhiTHhZt/WQmlHEEI/KINXFvikWjlwkoX0HK2kRFxYO9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IjrBJiTZ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D6F8606A326
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 11:06:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D6F8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=IjrBJiTZ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9C1641A140C;
	Mon,  2 Nov 2026 11:06:08 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2796B60750;
	Mon,  2 Nov 2026 11:06:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74D771032915E;
	Mon,  2 Nov 2026 12:05:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793617565; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VRgul/3wnTrfhZ6WCGiExBHWwBt8I+pgNAsbFHTgI8M=;
	b=IjrBJiTZgrOL1sPcxBV/JXRyLa1CSRDXNE2AffRAr9sHD2ILgDUWdC8v3Dc6lZGfcrMu72
	UwOyn6QhWF2Ltnd1Kx+fpCz873sNREMY21FfHfkXcRH2CJXfx6q11kz3tclTAqeVOq9mpI
	rUdZdLazEoOcrFSNSDe+LakKcOGwa8C1kCK/4qUhcOoXY126LkpZ/JARBKNrrZdKMIq5wJ
	ARGcWCrk2SeMYjIH4Z+Q9nSM/QblqPlK8hUoWlJF/bsNkUdJrWV153YzBT/mzWC7j306vK
	gi+BhrPcKgPnQEY77PBrKgR7RYcsNfFak1xsO7Sv7c/QoiEeWkoOTKXLQ1wqyw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Paul Cercueil <paul.cercueil@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel test robot <lkp@intel.com>
In-Reply-To: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
References: <20261007-drm-bridge-imx-lcdc-indentation-v1-1-3bcf98f3951e@bootlin.com>
Subject: Re: [PATCH] drm/imx/lcdc: fix inconsistent indenting
Message-Id: <179361755686.261447.18093822664278994585.b4-ty@b4>
Date: Mon, 02 Nov 2026 12:05:56 +0100
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 07 Oct 2026 14:11:53 +0200, Luca Ceresoli wrote:
> Fix incorrect indentation introduced by mistake while fixing patch
> conflict.

Applied, thanks!

[1/1] drm/imx/lcdc: fix inconsistent indenting
      commit: f55606c5c095586de20124943e615d9ffc1be339

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


