Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B12B81D9A5F
	for <imx@lists.linux.dev>; Tue,  5 May 2026 15:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777995970; cv=none; b=ZRP2xO3G7pU3/xUvwqvqeEB8eCF8dmQKCx2ig0m2qbf8YU6JqxMPS8bkQYOKWwQgZ3krLC+LDACvTiiOS+m7JN4Wf4/ex/KLrnQhkzXtB6Vr7YZ2F/KiXpMYKtvOcPF4EFWWlP0YzV1ibSktNCVccn7HYiX8SrcekLQiIHZpxgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777995970; c=relaxed/simple;
	bh=hOWdw/8tlxpGakpqr7bWAnaXfURocrWcsI9GHDYbefQ=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=ajbEKhxHtqevv42gG14vIY+PPWtYXSYOZHm6zn3eJcEAhs84NB9F34FCNwN1ujaiO/LY0tDJvBqu7WrqnhoM1zOOamtYAfrZJ46IYB0Sqj6wD5PyOeyQwI6QzJg/Hx1rQRFmGvUKHXG3+RSOfozg6Kp6jQQsx6pnt31z+PME5kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WSRaFgs5; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WSRaFgs5"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 333FF1A3525;
	Tue,  5 May 2026 15:46:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id F3B666053C;
	Tue,  5 May 2026 15:46:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D7AE911AD0217;
	Tue,  5 May 2026 17:45:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777995963; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SamjpVdgQYl7CQ+dyd24kWWXqJfurKa3W3nweeuzGDk=;
	b=WSRaFgs5iK8VmLp/1TOvE3ewfpUqT3X59uEVMDTCZnkS8AdhVcZXfDx4JiX7O5G0E9A0WH
	yqsqFRrz6ZWcnQAYk3T/rbnMwAt8AmXcatINdi0JausY2SxTNKzzG1zVApqGeAt8RQvxa0
	OMnWoE7vtCPXiXi4MBO+0c2I37RgNBCfzXEOSUKKLT5fzaeWrFEPCPLHLek5A95gH5U+3L
	flt5zhgMzlsw/Rv3WGfZC9iSu3bAKhzNUHgILI57aK8hOK8Sx6zDkSGjWS1TusFazUIK6h
	+HlsoJtOj6ZYSgGmGoFuX2LlVfX8KiEgnnqt5fxzPGl8XAUUsoke1MBsevXydg==
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4] drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with
 device_node cleanup
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Liu Ying <victor.liu@nxp.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
In-Reply-To: <20260505082145.603262-1-lgs201920130244@gmail.com>
References: <20260505082145.603262-1-lgs201920130244@gmail.com>
Date: Tue, 05 May 2026 17:45:52 +0200
Message-Id: <177799595269.1278867.7014321900391904487.b4-review@b4>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3

On Tue, 05 May 2026 16:21:45 +0800, Guangshuo Li <lgs201920130244@gmail.com> wrote:
> drm/bridge: imx8qxp-pxl2dpi: avoid ERR_PTR with device_node cleanup

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>
