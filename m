Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629934;
	b=A2rgI9PuA2MoPlycs0DzvOztw49MVJEFiOsRZgNqqCXXOm07rMEQkOJOk6xKP+DRcjxd
	 /34MqL5fIQCtZE2fuoJ8FQCL8Iwh7MWeNncfprSuTy7fLWOr8rkDvuwqSeaY7Pt/j5ZD8
	 LzxE8qkcrj3MhKWa4QEj4nTr/W21eC9RD8rGlKbkItB8dEwxs6cbUvUb1ZMn4b7KOUxWl
	 QMKaV1qIqgNb0RktmUEXgD0WpbIFY7r/VeLCpO2B99YH7B+5FCODzoYSVmI+5AfZ+mSDJ
	 cVyObxAK4HKSB0bimXxOxKgEnU4uh/r4IWJVqQXhwZ+9re5XqqH9Ld5beZSG0DGqiPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629934;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id:X-Mailer:X-Last-TLS-Session-Version;
	bh=gjJnzkcMPhEPJ5/q666Im5Q4FNxL6hZMRuK1yLefp/I=;
	b=YSIcuo0FPDlfcMmftl0HfmJGAIdLqBVJV5VVphAPavK+T7vuEv5cCg/3Hhn4aTFWWVVw
	 UTJ3j17184EQmADwNv3/wOEFBpxEAv55c8fRa9kROxg9LuIKxu+dUIvQUdgwAyzTLCuWq
	 7MpA6JQgusv13azD++zG4uM8Jhkvxqm1YxUlLifdJtEWDVIgFHTsBa7k15h+XjUgAJHh/
	 8NUFSRUcTSOpQVqXgYoxHd4Zf1mwBi8DF+A14HxKHtHTbUCuJojiikdAjg0vC38LtOOqE
	 7iW4LTBp2CF376owLzBB3EOQrUhMVkViEQvDgLia6yvCvZLGg6huR0fHbg7iKcsJkxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNm17mS0;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47267606A68F
	for <imx@lists.linux.dev>; Wed, 25 Nov 2026 18:05:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47267606A68F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=lNm17mS0
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DEC97C2BB3C;
	Wed, 25 Nov 2026 18:05:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E8C0460480;
	Wed, 25 Nov 2026 18:05:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3289711E6B08C;
	Wed, 25 Nov 2026 19:05:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795629928; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gjJnzkcMPhEPJ5/q666Im5Q4FNxL6hZMRuK1yLefp/I=;
	b=lNm17mS0qvqEwvboUKPMid9SQ8CpkX8eQqI7GQDWRSmDkLE8f7U+brK688OGcnnK5igGZT
	2SbRz9c9mGnneagQcttxjU0NPGFtpfTBPT2BKMOHp8W9OluUMBoO95tN6xC27vlrPbx+zK
	J+kqtI/88n2fZMufcyEpxxAeV1J9dqjL7x6WYsepiaSbVpymESWecm4JRQuTBHXzOB450o
	OCDucrEeNc029XSVPqHLoYmuGNPCJl/fpqfKLZC+knKhugpO3UKANhiOJtg4Ho3x+JlLfx
	HzZ7WRBYaMoMnrmiA1aVQi2lkQl2tsG+Mv9KrdnBhBq8MeM4SZnKslVRrr1GNQ==
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
Subject: Re: [PATCH v13 5/5] arm64: dts: imx943-evk: Add display support
 using IT6263
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
In-Reply-To: <20261120-dcif-upstreaming-v13-5-966ac248773f@oss.nxp.com>
References: <20261120-dcif-upstreaming-v13-0-966ac248773f@oss.nxp.com>
 <20261120-dcif-upstreaming-v13-5-966ac248773f@oss.nxp.com>
Date: Wed, 25 Nov 2026 19:05:04 +0100
Message-Id: <179562990453.846133.15615766820554855508.b4-review@b4>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3

On Fri, 20 Nov 2026 12:50:40 +0000, Laurentiu Palcu <laurentiu.palcu@oss.nxp.com> wrote:
> The ITE IT6263 based NXP LVDS to HDMI converter can be attached to the
> i.MX943 EVK board LVDS port using the mini-SAS connector. Since this is
> the default configuration for the EVK, add support for it here.

Acked-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

