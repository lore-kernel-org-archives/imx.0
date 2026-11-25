Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629929;
	b=zGAZoh8/LBmJrw3lp5++7gnekKgzNvj0aLz3kHCkLbPzLlfCWIrb5b6/BjqnZ07CH+Ux
	 t31g/EHYDHk+2beE6aKzaN4x9hEDAVuhX9Xf9frfpM4BTUVAlhfZhgOAyEYK3fvj1ugAP
	 dZmdASKPV6moLDAnAEfqlShgH1hnAEW+x6AhFjDIlKwijo1DrklpKD/NPpEyTppW/BqAW
	 i5SPZvtW/i98+ujpHujvGNGY/Y1fEJPHjHhkqHP8ojcUnSG811KbvdoAu1p9v0yiyiEqd
	 DHGo2PBEX9mBJM2Vis+UPJ4DVJIxzpXqO/7FGX7OjyejkB4CSlgBjCOyjmRQhyEgLrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629929;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=;
	b=TQFYH9fX4qs+utPpZqcwIVXrcunzJkEDg1WxBh3VU9iGORp+criu5phP0jky0HE7t34y
	 ojiydq2x5X843ssUZWaPmv3Xi46wTqKOAvxHMzxSuSVe95+XKcpT6mhgkx0Afsj4+bL9O
	 VBHxQ4RH/jIpF9cwi+OUQNiSYGfKr+vXxd68KBS7laxGP9nJd3YvbD2Uy7gqkANW1+1W0
	 oPjo5L/sid8uNR6eD5B0XlxA2MYirIsK6Z1bfRsdEeZ2Dvzl4olziTnr7XYy6cS9t/wfi
	 XVTkd1yal8Le5f8Ac8TqNzlatSab0X2Lw/GdkYYmk7gseTVydrUMHTFAvdhynHlEmlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zyFNXAhd;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C4606A337
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:05:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E3C4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=zyFNXAhd
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 21F0D1A17F3;
	Wed, 25 Nov 2026 18:05:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E2CFC60480;
	Wed, 25 Nov 2026 18:05:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A456B11E6B0E1;
	Wed, 25 Nov 2026 19:05:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629921; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=z0fn3F766wuQK7x5mxxCqW7uOeoT4GbYQhAdJOMmB5I=;
	b=zyFNXAhdALZuyx8Bv8QI3r5W/mRqMqrMtjWNM79N33AqkCAksk8tmkuOwLNkQtxWEPuk7e
	QuoWGXatVVoMJ63AXUAHhQ3HPh+7BSeV/pTScOyMnjEooBJMC8KHBZlA+3TXYuIaOS6Ean
	CDyrS76D9Z4KXxqP+Hc6XYNtytdFEKGvW80ufcjuk+a7FzLsKGxCUn5jXAdks1dkGAiczr
	P0RXbZbAnKLoEWBYJ8KNZ0gQxi81p8YcpI4PDfombMiU07T4t2EW5gtmMbDK6IF2tzt5Bi
	prJV1kiMj9n2cKIRgO8E/NnGFVU0ENCzexwWg4r5MSIc1EtBW7FtnBfV/qDSRw==
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
Subject: Re: [PATCH v13 4/5] arm64: dts: imx94: Add display pipeline nodes
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, linux-clk@vger.kernel.org, 
 imx@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org
In-Reply-To: <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-4-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990452.846133.17994433821419936260.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:39 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> Add the nodes necessary for the display pipeline on i.MX94:
>  * LVDS/DISPLAY CSR;
>  * clock-ldb-pll-div7 needed by DCIF and LDB;
>  * Display controller interface (DCIF);
>  * LVDS display bridge (LDB);
> 
> 
> [...]

Acked-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

