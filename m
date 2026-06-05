Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 984AF4D9911
	for <imx@lists.linux.dev>; Fri,  5 Jun 2026 12:11:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780661485; cv=none; b=FOk1v9F//WZV1/Rl5KJgoBMl9nsMJx11+Yl7s3UtqY1w9uy+uCcpSRpBjbFHgxycomoTUK9YlHd9i0fXtC1E6m+vgiKGekMuOd0vvM5vZ9aU6LX1OojNx920sazHcArTdIRbaj4O2n9GIc6GXBSeu8yxfnhrTgDBB61XNaInt6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780661485; c=relaxed/simple;
	bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Tao9vY0t+Qd0GT8YIUeeUZdQ264lWDABfhN2tnL7q9VtvJbjqlxZAuU7J5pBKjJ5eT/jzCL3BqSfHvDPJOfcdrHV8VSCtQjF3/Yw26poRjQR+BCIrrGVdPU8ARL91HEg5s9zrKUr50bxHSdI9xxAqUghgPcMBLEHaOYHaQcONKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RouAx4rc; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RouAx4rc"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-36ad15213fbso1259265a91.0
        for <imx@lists.linux.dev>; Fri, 05 Jun 2026 05:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780661484; x=1781266284; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=RouAx4rclxr/lkak9RvZkGYXrxJzYJsxjjxyJ2a6II82bDtagEIN++0R3A7/tVFSki
         CE2E671IBBeRectLzgRZk711NJcbXInTaJTHyaJyAWGWfDi4TUnI5U2JjMAD+9TntFs0
         uf/ilJfSak6MSzvrqJgY+icaQli3UivTBp7M6dYis1KC5VtV2C2yi/DhW9/MHl8bfUNN
         0Jj3ojCTm1+L3AgL4xczBuiA6VwqpnH6HooBiAU9LkHaZSC1RWqK8COU2Ef4hJwTlsmY
         oUSrp2L9G6aVEKcUUC3A+3wIvLVxNeKzBSE86P9pTGYw9aOE6tuPoKHKU4MMr1Jbwr28
         EaFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780661484; x=1781266284;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5RoN9ngqvHdCpUoddEnCEeh8fZSHGeByQdCtjfNZBdU=;
        b=QMDgCqQFUikWXPMzL4t4ga56yZZUL0mmX1prcqo6C1HuH7CgOGPsKIlgHKPNQGlR8U
         CHrRvhp5D8SSsYlFtzFcgg0LFeNfxEv6W17XAVK74k/liO/RhyKIRkmtq7o1BoIl0wBg
         BjCzuWoEjenR0+KrqP8yWxVjd8K4Iv+U3kDPmUNGiSd9dNg+DxXy2rFU5bg793Mw9ZCU
         oUxCb308Vxin/ZJ5uIhpOqEL/WDy0WLHjcLabgoodtRmOcmvN96bOhSMlTyyyJ+kmfaK
         u3oSqcCUFXnfc4EWuIELR7bXCfB5I4uJZOuGaBSv+/2mdpqYjTFyHc/Ua5D4it5fSwXp
         S3VQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mAxmVMUgkxNZnckQmug+kjaduFaMuQYDI0Y+rkfIRLadYa2F17/2PC6tqxvXNnTKAoBM=@lists.linux.dev
X-Gm-Message-State: AOJu0YwC7SNJ0tEhMG3uX1OnycSRCIyT+iaNUDrt/af7h/FYo/NgAbvM
	0KaHuaytJXxgRpxdY7khWNXXrvGMN76x9kGa+fr4e9CkXAGjrGvSaB4u
X-Gm-Gg: Acq92OHDrPnBjET368nTVxvg353uvNtVZJng5U/syE08dc3+GMD55XTOQ3TnXJgPcNS
	DQfTZZRQ4c3jja9hFXJSunxZBYv+WWFKybbR0oV0q5wwLU0v4c3ZIYnVj7XT5cQaYzZ/0Z+TigK
	3wHu2t7AcLqL2fGHKxMrmWQJVTEkZc9dsul0+qAm3cjQANDxVGeas37reH16UCc8vFuUCK8hxUL
	tyeMHsC0dekOYnBY2tuX/GMHaw2ZWRqg1PAjUqzH3GAytq1B+81q+95zb2PttT90AOVXB1Ki+kX
	4mU8Dq2OcnFc2XFABzwgNfbCouD5QZBu6TwOsY/ZGjxCoQXurw8aviXZ+6M+XEShP6VbCgButJY
	zI2kEz94UKQQ4pev5sE+cQEJuIst7Y8Cz3hjVaYjFBYQQpqJSEMkrU5WPiWso74U+ZSH0zgmx0B
	m5vnDqF0MnuPYhBbvafO6guU1LptM1r8oe+kvklGye8yU6I0y0zqbwpGUaIvrvxmdw2v4ME703h
	2gCTqcdmiUkOC7uSPYw9wiJIlXvJi6blClZaQ5apBz5NqEdRAbDog==
X-Received: by 2002:a17:90a:d40b:b0:36b:9798:4f6a with SMTP id 98e67ed59e1d1-370eee04b8cmr3336521a91.10.1780661483873;
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
Received: from lord-daniel-VivoBook-ASUSLaptop-K3502ZA-S3502ZA.. ([2405:201:2011:e829:4eb5:db6e:9a22:fd31])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6bf903fasm6300497a91.2.2026.06.05.05.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 05:11:23 -0700 (PDT)
From: Piyush Patle <piyushpatle228@gmail.com>
To: Marek Vasut <marek.vasut@mailbox.org>,
	dri-devel@lists.freedesktop.org
Cc: Liu Ying <victor.liu@nxp.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lucas Stach <l.stach@pengutronix.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Abel Vesa <abelvesa@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: Re: [PATCH 00/39] Add i.MX95 DPU/DSI/LVDS support
Date: Fri,  5 Jun 2026 17:41:05 +0530
Message-ID: <20260605121112.27866-1-piyushpatle228@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Marek, Liu Ying,=0D
=0D
I brought this series up on the i.MX95 15x15 FRDM (IT6263 LVDS-to-HDMI on=0D
LVDS ch1). It mostly works, but I ran into a few issues around DI routing,=
=0D
LVDS format handling, and DC enable sequencing which needed rework before=0D
HDMI would come up reliably on the board.=0D
=0D
I don't see a v2 of the series and things seem to have been quiet since=0D
November. Are you planning to post an updated version?=0D
=0D
I've accumulated a fair amount of rework while getting this running on the=
=0D
FRDM. If you're not planning a v2, I can clean things up and send one based=
=0D
on the current series.=0D
=0D
Thanks,=0D
Piyush=0D
