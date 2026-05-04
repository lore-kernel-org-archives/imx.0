Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8404391E7A
	for <imx@lists.linux.dev>; Mon,  4 May 2026 10:18:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777889909; cv=none; b=ucpaMTu6Xyekwy5BhpG1AUU67i+/F3psV1nLPs503f0ajOWnaJUQUVjJbtu1YRgMQNsV/RLD0tDw3cQyZnN9Lih62zT4y2DhZTkFXgLiE+B+/v1rFbsmwEx7gHAd3xCvy5Ca+v9sNr2NntShuMzZyQxtJjtcKWekQrwz2lIhAno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777889909; c=relaxed/simple;
	bh=EtdS6y3CXM5CB+2/yC0ZEfZT46CFZ6oLSEnxdDSc2iY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oqEXqZTSXrVx6lCsZhxmwGZqLuBzHj4yOpX26wCmGjsmdbdXnU2NC/FfpyT19dHlR6PYAQ7vmICbzwlPLWnc4U7ejSdi3PjzB+WEtJrFtPlzrB7bHV3RAGWfBYBYzsorCevowelcmsDUCpE0CKqwhVLDVqquFF/S+Z+U9Hyd4RY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=y5KVyl5r; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="y5KVyl5r"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 551691A350E;
	Mon,  4 May 2026 10:18:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1FC045FD5F;
	Mon,  4 May 2026 10:18:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 31A7411AD2634;
	Mon,  4 May 2026 12:18:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1777889904; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=FFYFj3cS+32kdh6iscyaRgMTftC7LDL3TybYyPKLyps=;
	b=y5KVyl5r8t6lQy6MGnFNSqdNvb33m+EsSq4JviTs2xwRoNPAVk4ekBn7oKPxJWKULiqpTj
	EH2ZjuYHrymSLkS3r7SbLO1qEuY8OLmu2FN8lBdw7f3SKarq9Nxrw79CgveyVwdHmXB1NQ
	xyUSOcp5W7WB9jMWjzEBq4mUSCOsW/q7aOnAkR4kTPwQOu/q7qdN4jdV0ntnXbsgJjnK/8
	rWMLC7NBOIy/HT9Wzm/R0LMDZQGT7L8TcDKTkZt322CrhmeJUOsTAjsv8tMiFhjpBB459B
	wPPKmEQhluoKhKXDBjdgnC/d8UXpEZwVLtFxnGCl6Z4UQgVppMN0QOyAHHL4jA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Damon Ding <damon.ding@rock-chips.com>, Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260429140024.192432-1-arnd@kernel.org>
References: <20260429140024.192432-1-arnd@kernel.org>
Subject: Re: [PATCH] drm/ipv3: add CONFIG_OF dependency for
 DRM_OF_DISPLAY_MODE_BRIDGE
Message-Id: <177788989685.160168.8237474738653611517.b4-ty@b4>
Date: Mon, 04 May 2026 12:18:16 +0200
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


On Wed, 29 Apr 2026 16:00:11 +0200, Arnd Bergmann wrote:
> Without this, not all dependencies are met here.
> 
>   Depends on [n]: HAS_IOMEM [=y] && DRM [=y] && DRM_BRIDGE [=y] && OF [=n]
>   Selected by [y]:
>   - DRM_IMX_PARALLEL_DISPLAY [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y]
>   - DRM_IMX_LDB [=y] && HAS_IOMEM [=y] && DRM [=y] && DRM_IMX [=y] && COMMON_CLK [=y]
> 
> [...]

Applied, thanks!

[1/1] drm/ipv3: add CONFIG_OF dependency for DRM_OF_DISPLAY_MODE_BRIDGE
      commit: 528578941a240e0916942bbb5b910c57bbfb3614

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

