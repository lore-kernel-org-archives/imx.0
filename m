Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795652958;
	b=Xy5oHyImxehR+6YWPHR79inL9oWFV1yqstDmw4n6KXwEpGgj/WHtePS3uPCyw2bWZ571
	 DJ49asPtoHJTOeajvWxpDf2I+CuNWd3LUh0A3WgYN7aEHVoU9jdBF0I0+sVHFZ3yjMG1I
	 Oj53msv57+2GFgSHAHWkgbEhZ7FNeAlslOdUL/QdS3QELe9K0UwMNhxeWix9vtFTS+HbH
	 3kWSf+6HMy4fcAvWbtFQLb8WsZL/072sBXPy8vQg3/LVy6WxC7Se3oWXevS6Dr8IKjvWj
	 CyD9yQkvS4jmMk6Xyb+PRkR5ewd/LbDS7Op2YKiACkTbAGQ32nnOXVhu0+P14dJ7qXw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
	b=Z8v9cPFh/WTBPto5KauAO24riVQkMid1v8jbwvId79Zoikh3BYWVcslOvmH4EtfWpYNz
	 4pw93qjQyYRG+vRCqJoZse+rSPvtAInKKm1LGnxZMGPghaxQCudZWP/3+WWHYfHyBUytA
	 Im5U4SslTrYEPfmN4tkJjp9jbB3yTLVOkypIalhQ8kihcbLkT5vkm6iT5MFLxXLN8Rae2
	 AgQTUfdmN3Frocz6lBWBHti0HRUwW1sAAOXwA3tWuwitRlj1TC5W7lUuu41EG/aBWsiTg
	 mGWM3ivc1M52KmUNofL568xVw0QKW0Ww2BFzW85Z67eTHp4kKgssDEjeKCixTJ+YcRg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKwtvDc+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E526606A31E
	for <imx@lists.linux.dev>; Thu, 26 Nov 2026 00:29:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9E526606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nKwtvDc+
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so8370700eec.1
        for <imx@lists.linux.dev>; Wed, 25 Nov 2026 16:29:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795652957; cv=none;
        d=google.com; s=arc-20260327;
        b=CZ9JJcXfyWyXCflsYJ+iUMpZ0JPRy1C6FbolleNmkQQ4NhVJnxOQFIQrcfhxCtCvda
         FgjDSKJBe+YVIzaqYzud0CUiCYRAirjakpxdQBp8UUr3EUxTd2dmLzVpZ9PZetO68jk0
         sB0UQ2zsIWrO2AyHFGC722A/8Zui5zk7G+y/Ho5GRqmrg7/+60mvIvC+PIgWcYRgcSqL
         z3Zq7CRr0tEN09nlyLZVmojx3WLA2HhrQxqDyCJPS6v6y2fYX0BK6UuKIN76DvZSyUeX
         cD3/NG3iwGqIDFsnU8THYWJ12p4BeBruceI/0FRjLn2xfs+WUBvg8XZtzAT2qUvbC6ju
         FJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        fh=olLZNUCsbQmPF/X223fNr42fnxioOUtr1V4OdKHmQIU=;
        b=T8BF05N0kNjo3YKX64uLzK2qetgpNKGCuj575X77k8NpIffQLQ4usOJhh705U5w0hL
         bzZN1cFZSTzyWmPKzRvIrxy33mR/m/tocWeBMaEORlHBAbLPu8ARdJ1g8/4czGsy3E+I
         KmYVJftPUKbL0Hau/+EaLJr0xKwHjliCrmpf+0Qmf+tdtjowdw6Fcd4wJ8JGZW7sSoGx
         RhLxWlcryatnlfov0Tlh0cpmgcTwcUt2RFdL3vegikJneqezgNtjnHr1+0s2P4S2LpRn
         261XlkZTvo2w739unqlUMo+ZeMsfE7PssbQyZ9DlrWUNiRMw5FIX8zgouBZF+EB10QL3
         Keew==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652957; x=1796257757; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=nKwtvDc+gxdogeY+I/of2x4RSfeUb22hMTCqUomM/XSl9N5Csi6v5ACrzVrqGNg4Ev
         hXgw/bCcKpCTVDX9GauK+zdhAfOAbuvtJL/ziAhh4B4s09+8ihheN0bD6qaKSpl1dBPm
         JJbXUjthDYzAl6eIqOnKdNQLHiUWp85+F2CIj6DQS6y0FsDRJX0h3zXA5GtLGCr0X5Y3
         GSlf1Rt9xuTYojwQjMcV9fwNT5KJVsA5t68vOpLLPsnc5TR91XKKrNP7MDLC7puPm9xK
         v4oWVOs+0AqvFBBFd3reEaFkSeYXPuKFY0d3PoxSLE9WzJipYXCjlmkHoJ4LS45s9VWu
         t+cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652957; x=1796257757;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ica91CLq/2YhNsGz5gWhVwzBtrOD+YGQQy5zyrqi82Y=;
        b=Wd6EOemqEz9cioWoLdl5O3CDXtrzECqwbvyFfRyL4Ax/uLLMbQtBNbfgJuONmN65wp
         Sdv8fq10O5l3LguBL9gS7p3RkAm4dK14ERr4T4Xg8nKkcQCtbi7M4doqwxynclHSlTYp
         X7f5I/qHxsmyon/I42Aml/JUqbXNW5qcVVjeyFnDjJLDNTA9+qUCs1nr8cLQ9p6NWFZm
         xUw95hiRzfOpSiyNi/usRlBcimS3HllvByJAcx8b4+4/9zh/EjkmPcsPpS+GuMwb9MoZ
         kF0lK92pEhOd1ptfI8k7HPWY88LAf3j11DW5tfjqSeD9Sl7AUytbFuEnC8lSuNS7ZRJr
         Vphg==
X-Forwarded-Encrypted: i=1; AL+hErGuEUkHci1+86cHDP9Yj60kB3/lYRVuRfLppBh6k19hKQXfn11DIRgdh9wWHtU5hA5+9sU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8PYRXU75JEWW3zAPxPQkkc+lFJ3hl10WWhcS79If3PRJM3MPu0
	w/vbZ5yzxz8WHq6majbRDlh2lrl6Evk5bbmd0Ad7PCzbYe7P2HEji0oeYAVMqcO004W/vQPnq9q
	St7XAA5TCHt6i/ygo9u2H/RD6ZRiZDfc=
X-Gm-Gg: AZFdTZdeFEvCVl0uz7625K2JgDMTVzq1Ds4kK30WXb2S0nAr2DFn9ZgRld147iqR2ww
	dEk6w0iKj41p6khE/q/Hq7fdgiE58+ysLBBySGwnUf5GEht/nLLiUJzStXtqiywUj6DXvpvJiSc
	sI2JS/x41JFf2uieblfXQIEFo4MN2ealFhjZtqojhTsRDKB9441XzSeZ8EO2h0YDGb8/RQ55DAm
	xR8TdhCFQ+ztqj1bl4lJ7bEPuKfLdmhvPXAt1oZqgsMuxTh7vyu+AwhU2yTfYc9rM2GCz6xewcg
	RD2muIVo9bvROcMLmqvsXxkVtwYDi5L9S4vfVXrVz3Qui9xkI0/sdJYuM7DPvL4Ht5qDcMIelMU
	LvS5YT5pHU0+z6Y2CN8nzcClzed+BrIymbUz4wCo=
X-Received: by 2002:a05:7301:dd8b:b0:372:32a1:b384 with SMTP id
 5a478bee46e88-38571510675mr21743896eec.33.1795652956755; Wed, 25 Nov 2026
 16:29:16 -0800 (PST)
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261125072026.2997493-1-prasanth.r@lineo.co.jp>
 <20261125072026.2997493-5-prasanth.r@lineo.co.jp> <awdYin-gfFlMzm5K@SMW015318>
In-Reply-To: <awdYin-gfFlMzm5K@SMW015318>
From: Prasanth Ramesh <ragaprasanth@gmail.com>
Date: Thu, 26 Nov 2026 09:28:39 +0900
X-Gm-Features: Aa3M54ppWwPKU2GXBN__reMNMjMzYNk4yHpP-osEJU5EF1y5sgVMcffyz3AkPvI
Message-ID: <CAG7eodGWsRtuQWgN5=7c7b9E7JKhLXAhZxRGgbDW9JpkSzhX2w@mail.gmail.com>
Subject: Re: [PATCH 04/12] rtc: mxc_v2: clear the wake IRQ on unbind
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-rtc@vger.kernel.org, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Support Opensource <support.opensource@diasemi.com>, Paul Cercueil <paul@crapouillou.net>, 
	CL Wang <cl634@andestech.com>, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	Prasanth R <prasanth.r@lineo.co.jp>
Content-Type: text/plain; charset="UTF-8"

Hi Frank,

> Needn't it at commit message, you can move it after --- to tell maintainer
> you use AI help.

Sure, I will move it in v2.

> all devm_*() API need check return value.

Will be fixed in v2.

Thanks,
Prasanth
