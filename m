Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D6583914E9
	for <imx@lists.linux.dev>; Wed,  1 Jul 2026 17:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782926383; cv=none; b=SoYhzxfRcyNlCM7Dr1aXzj2Ck+pxZK/kVZBDCkVRuOMqBH9PY2HI/uM793ZDhi0N+WEVde8JO8CYvAYIBUmofLfwowXqtHlqo0DOiel4MqCouZl+WKeaGQuOx/umQY+mIx5azjeHmuXVRHs08LLvmDNsfTbth9JSvpMXi9F1M94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782926383; c=relaxed/simple;
	bh=vj4xt35+yFypfI4zYD/RTd5QCw84XhaDn1ZS2j5Xkzg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYLpsL264LhvsnwmTCnAP2AccoIdTzH4++zn8hyzZA1az00lZD45ostsVGwYjsLlpKunnhe/1pE4l8ohcIOB5wKDMY3cLtbqnGI5B3fRpGojSV0WCb6CfLA1qlB/ae8eziDBAFeQ1kCjiFXIQkOxLaBD2T8Wil0a+fjkS6rUhrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y9QUWxlV; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y9QUWxlV"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3FD07C4FECB;
	Wed,  1 Jul 2026 17:19:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 030955FD9D;
	Wed,  1 Jul 2026 17:19:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C7306104C948E;
	Wed,  1 Jul 2026 19:19:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782926376; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9IjGriL20aUDrYKm6+vTu9029BmucxRxhyWYYY+OsIA=;
	b=y9QUWxlV0KdIf9f/c4LLTFZWCL9K6cSxJ/+M78N1Z9c1zI/NLsntj7oPAFKCXCpZxmnZxy
	alT4YKxKZFYGyT+BFHqW0GwcfRgehJWuH9JkuEfKyuWtyVMIjOGqF6REFNJmf+kUMt7Q7c
	0PvtvmNs6hOoxfJ9G+p6z+B6fitYNygvlI4q8INBZ/lDSbL+LWeTJ9zzcs0mS37NuSJHfj
	3BgM+ueb3u+bs6Wwtv5v11Km4oq8x/vkwCS4/PvbFL9S+u1ExOoV+SQo311mp5LfzBDoDN
	2w765HyEMzksiUMFNcnPmxeZWvdxOYB8q1B2P9ciZK/JxfRGj40HEvUYuJwHeg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260619-drm-lcdif-deferral-msg-v1-1-ce2392dca985@bootlin.com>
References: <20260619-drm-lcdif-deferral-msg-v1-1-ce2392dca985@bootlin.com>
Subject: Re: [PATCH] drm/mxsfb/lcdif: don't hide lcdif_attach_bridge()
 deferral messages
Message-Id: <178292637135.3330226.15837707987617382686.b4-ty@b4>
Date: Wed, 01 Jul 2026 19:19:31 +0200
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3


On Fri, 19 Jun 2026 09:02:13 +0200, Luca Ceresoli wrote:
> lcdif_attach_bridge() uses dev_err_probe() on all its error returns to
> store a specific deferral message.
> 
> However its caller lcdif_load() calls dev_err_probe() again on error,
> overwriting the specific deferral messages with a unique, unavoidably
> generic, message.
> 
> [...]

Applied, thanks!

[1/1] drm/mxsfb/lcdif: don't hide lcdif_attach_bridge() deferral messages
      commit: cff96362794a5c1f3adb013b4a46c7233149a629

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


