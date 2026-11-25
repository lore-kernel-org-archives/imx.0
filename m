Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629923;
	b=lIQX+swrPjjE1LuT7Dyrh3GP4kjeCQg/Yc7c/j/8U4jlkUeBOyA/3gC47fRe2co9/yNq
	 48Gj0as4mijvEuWZJpRox39Acc3L7js1gRBTRBQCp3DaO+VDTyLqeYJWKrvJ7GTy6TMDC
	 v4Dg9MZtGM+G7ilpA54kcARMgHoX57ZwzcB8FG6dT1rtOzmlADdcjWkeR/TAPxJ0a+lW3
	 EyoEEhB+/IJGFUQBqtzfTQBv/lHULxHK5U+rIXFl1g/DMFOK66JRV6FHiQpBEoe8D/roR
	 w4UPSzKxvya352MORF+oSUJaN94DphVwG7WFG2IKLRiT5rfHuz/fjJaPaMprhcuWg/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629923;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=BDYZUtoH+xHXmkCKiObcgJTkjLDTrTovJF7lk+UpUHAnjC45OhiUnjB6OWsh3YDbLWay
	 KM/h/ulmFKdcevq0+17YIAOkDioMd9/Oz3ypc8WRVLAy/hky9Bov1TMDQA60UgFZMWY51
	 3XhBTSpZNs59haMHy0HeXwpbXqJ98aJ0Fjz2ahBvY3ieq+7GaccWiNa24LP/I13E3r11x
	 mjXCPNYF8W06dYi4Oxu3GTSvCVFbYl3swoPUt9KdA5nDPyrwneIRyc2d3Yhv3ajtI81k+
	 SxdgrfTeX2j134d9p+vnSp0pk74oQKzcFvzD+qHSMTQeWKiaiHhSZiW3P0gjXinWfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="mfUz/1l2";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763B6606A323
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 763B6606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=mfUz/1l2
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 2018D1A17E2;
	Wed, 25 Nov 2026 18:05:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3B3E60480;
	Wed, 25 Nov 2026 18:05:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 047B911E6B0E0;
	Wed, 25 Nov 2026 19:05:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0anl0ccCCCZoc0bFfoM8ANcczII5sgMZtQxxCyWtzo8=;
	b=mfUz/1l2y9B5Q6PYTyl08Q0MPGeJPFMZpJfKF9f2H85BLYXnVbJYV0sNQ22zUAufCKepkb
	Io2t55gOPfDO9liSeZnvG1Zys75fC1wGTQP4yBD/ORz31SyTAedq/74Q/EhMxOEzdBmpGB
	U6Lk1CEjUx7XJxAc9NPu+MsghaHtJVDTaRnL63mHusx5uf6jnKvNpkrXIouXBa5xzPbrz7
	/dxrCjLyC4O5LF90xXlF7CquGb858SGCsEHjZ6Rp18lypoOzkZV2+mVVWqfrwYJ8FRZKbX
	DouSvjBzu3hp3KbICuKu7eJUO/IvZY+zqXc4eE+nL0NgzdPeGME/WefmWEkC8g==
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
Subject: Re: [PATCH v13 2/5] drm/imx: Add support for i.MX94 DCIF
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-2-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990451.846133.506244474972901657.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:37 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> The i.MX94 Display Control Interface features:
>  * Up to maximum 3 layers of alpha blending:
>     - 1 background layer(Layer 0);
>     - 1 foreground layer(Layer 1);
>     - A programmable constant color behind the background layer;
>  * Each layer supports:
>     - programmable plane size;
>     - programmable background color;
>     - embedded alpha and global alpha;
>  * Data output with CRC checksum for 4 programmable regions;
> 
> [...]

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

