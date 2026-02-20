Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A6623446B7
	for <imx@lists.linux.dev>; Fri, 20 Feb 2026 12:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771591498; cv=none; b=rSowxdokuvqev0u8EE/PC7yiDL9kwLWZCQLlzJqCPB8LAjBLm0li8hqDfXG4925dIlSu0NcoLLGddnaooxo7ix3jQXeZiXw9gjC715jBJVoRYRxID7I59jJR9vrD6LfggxIbagkhmSeLIDlUzF/FGPgrmihYlz9HSGsItrEYBdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771591498; c=relaxed/simple;
	bh=1uRygSfYY8fegxzfxzSpHnDlqtTI9l1OIlM0v0EBHUE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kFVoA8xYwin2RLTWqRQzR7zUe/wIYT7tQ9CW9ir8peo9R8RiSKi19S0PJw62acKOmzvjR3cQtiOtm+zbCAsTenTyIhI1OIeimOI2/0WgSuI6yhv0XLOqEUO7jQhv0kriqqNEOwa5UTAEr1qN51Nn5RISwJZXs0XhUFbklT8rvPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=eImEQMnn; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="eImEQMnn"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id B0DE51A0A32;
	Fri, 20 Feb 2026 12:44:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 864745FA8F;
	Fri, 20 Feb 2026 12:44:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 55D29103688C4;
	Fri, 20 Feb 2026 13:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771591487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Nj4Sruc+lNxj7h2GpORgNoUmKB3DGWmmf6h/HT8p8z0=;
	b=eImEQMnnz2rGoBWZL9YrluPhipygkv4r0wZE/3lz+jzY2fGTp0aUQAqiL3K1m9SLpLXurO
	8XFdf8Qgl5JrTzz1/JBWg65RpUWuZVN7UFxWHBa5vg0bh5Scu4tPDW1UN8G/dfSOedJyoC
	mznnCBS1Myc6fzgH4WJQxLYDuLQDxh+9coX+vToxA3MIkkVLXp3fauEh78wDyMctSACVxt
	vuwP9Dt16KaZAx594tXvgIixq7YICPcx+9I/jP58MPPwoaYEks6qBEV+vqs3jBL4nz8Bq1
	cB+SpHXp7wLyzQoBuSWAaJOXCc6FLj+V0jsLSnlO74dQE+gaU9nf8xrfzJOPmw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
 festevam@gmail.com, louis.chauvet@bootlin.com, Chen Ni <nichen@iscas.ac.cn>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260204090629.2209542-1-nichen@iscas.ac.cn>
References: <20260204090629.2209542-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] drm/imx: parallel-display: check return value of
 devm_drm_bridge_add() in imx_pd_probe()
Message-Id: <177159148142.510757.5758922562967714281.b4-ty@bootlin.com>
Date: Fri, 20 Feb 2026 13:44:41 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3


On Wed, 04 Feb 2026 17:06:29 +0800, Chen Ni wrote:
> Return the value of devm_drm_bridge_add() in order to propagate the
> error properly, if it fails due to resource allocation failure or bridge
> registration failure.
> 
> This ensures that the probe function fails safely rather than proceeding
> with a potentially incomplete bridge setup.
> 
> [...]

Applied, thanks!

[1/1] drm/imx: parallel-display: check return value of devm_drm_bridge_add() in imx_pd_probe()
      commit: c5f8658f97ec392eeaf355d4e9775ae1f23ca1d3

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

