Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501633;
	b=sFoC23fQPKAlx3JKYEhi1BTg9ZYVJIrV/62kImHKPIvZB1dKnIY1U7G8FBmoRz1lwg6o
	 a//iQCd7YUy9oYuoduBHGlu+bdnMrx7pkquiCbzKGXMZcHGjNXYcsZn5v1kKFi+yaKu1P
	 tKRhskGLuJyz8gJ0nhDgnshjoh0DVO8r50kNfCoTfwGGTXPfMXP3rxfTxm/WQDVk6OpcG
	 A78zV6PqOCB/YoGJFpFQF2gPgiKxGAo0oDs3oZi6CPK1TQtTCD25DAurnU/sP3gG74zjs
	 chDYZ9pb/uobJYbx4BzB6lLi+wpocqD/5X9n175Jv5hWSOaFo72zRi4O04FmB4ZAVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501633;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=;
	b=h99ptYnFQnnkZwEVzo7/tbu3tibu71KtAB5obC8hPVIXbUbo9VaInH48gFEZDDKqTCxH
	 io/ZSNdZ9xNjS5wi/b1N/D64C/j3oFw7ih6vaVa9I27L+j0ebn4/NEgwSwLA/knm9qvTD
	 v0JrT8R/MSr5RhxSUFeVkEjRFfb7VbcH0TIH2O+iGKR6D8uFyTM4fA0Le6v0TbJjwe4Wn
	 d6oiCZpEfeWfxNm5ZdIkmpAlr7gSg2PRj2Q6Y0FjwB81UbNt7oGtme7zgAseGUBLyUO64
	 IT9q8HiNKEg2/RAWFTHopo51CMnvtko4BG+e6T2gn7rkiXcyfoNhKfb69cVx9tlsW6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blM14kIw;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6527B606A330
	for <imx@lists.linux.dev>; Thu, 12 Nov 2026 16:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6527B606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=blM14kIw
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 78CE71A1636;
	Thu, 12 Nov 2026 16:40:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49C59601AD;
	Thu, 12 Nov 2026 16:40:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A833611BC069D;
	Thu, 12 Nov 2026 17:40:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1794501627; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=NPENMsmu3+BS94VMSAUvkedwRU3NJYclxTKT7IXQmWU=;
	b=blM14kIwqeQ+LdPhURV+QXNd9dZpWq5sYV4WTJ87Eu5fTOxUa5YrWkpHu6Ev2On3EhCpYs
	a6QQSQ6U3HCTAOPcam5BeVKyeQWnOY812CEvxa9fuh/D0WKFpww623wzgt5Tehs2c/k6NW
	xyXIDhVVkuRJAva6HSB6jdYXtvgLcxnSLFOmOxy2J+TMSGw0167tKKVH5Dv6CcFd7l7hJC
	SsUw5YK+1pMes0fopVmk0rQxmX/khrgmE/tLc63Sm+CFM391EZh/0lOMDiz25cq7c9Qa1y
	jk/1HZAI7H2UWASETSrz3GCkHqo9Rl1lnxV8yZf7LxN9LviYMtjPdNwSEPEaCw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Marek Vasut <marex@denx.de>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
In-Reply-To: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
References: <20261110-dcif-upstreaming-v11-0-9e13c85ae0d8@oss.nxp.com>
Subject: Re: (subset) [PATCH v11 0/7] Add support for i.MX94 DCIF
Message-Id: <179450161929.2117501.14949541716164131629.b4-ty@b4>
Date: Thu, 12 Nov 2026 17:40:19 +0100
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


On Tue, 10 Nov 2026 14:27:40 +0000, Laurentiu Palcu wrote:
> This patch-set adds support for the i.MX94 Display Control Interface.
> 
> Also, included in the patch-set are patches that the DCIF driver depends on
> for functioning properly:
>  * 1/7 - 2/7 : add support for i.MX94 to fsl-ldb driver;
> 
> Thanks,
> Laurentiu
> 
> [...]

Applied, thanks!

[1/7] dt-bindings: display: fsl,ldb: Add i.MX94 LDB
      commit: 35d189bdab8542d8eaecee4a39e15c1eb737f558
[2/7] drm/bridge: fsl-ldb: Add support for i.MX94
      commit: 7678b7f2d38b5575981b1a7c09139a4660b66826

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


