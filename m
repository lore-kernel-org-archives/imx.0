Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D533EEB3
	for <imx@lists.linux.dev>; Fri,  6 Sep 2024 01:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725587178; cv=none; b=m9LiomH4lH5bjfwNrJzW+CqQN/RkbecM0XKTfxfCmfSbY4pVnXl+IZJMzHzVhvkrTD/CuTWtZvuwNLMrF7Vesj/zVWICWF+vM9ybR7IkbndV0Zg48UasVAUOuzCBZlET/a7vpncnIjHJiUwRaSrxm/zBybj71st6sTMZzoymXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725587178; c=relaxed/simple;
	bh=U52adYQlvuMR7+RUlygia/EjbR8uM8aQF8WKlzEJLT0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=DRW1p9IvnxpHksk6LLlVHNhskU31hPxuK6zQLsf7Mx25FkoUcsEvydKJZ7WMupDe/GkLywo7qAaWm2SeaKVTGFr7pgCYT3rJ8PbBOJAZusLXqVeDiigfryRe3uJC60RT5ZddWhbrGm01TWM4hPKqN5b9Jq2JRkTQL5d6PPutcOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZmjIp5z; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZmjIp5z"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-718d79fb6f7so169024b3a.3
        for <imx@lists.linux.dev>; Thu, 05 Sep 2024 18:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725587176; x=1726191976; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UwnV3rN27k13ClzZkPYxKb2bde4aYZdPIxzu2F5jqrY=;
        b=ZZmjIp5z2HNocd7l7zg5S/TOrAz9fbG8H65ZooatUYHTCIHKRFo+FdrmsdYFvvfg8r
         HhBp6zNQS/fIMLLw3nLRxzfEf4vV0Qf0n2xTnyXtyxCW54T7FRLbTfyoKtp2bu0BSgFg
         291oAussthwtdn9y2SgnjJxWpnM4nHlp87AkWCOhGf1Ow60fNcgBfGQrlRllO0v7MQ/X
         d6HXn6VrAaRu5eNP7MCWH0mjdYiP+oDO8Lq3LjKeoDKUC+uVbDrge3j2jb7g5IXt5niR
         bj0dA1XSAUVCZ8mVhfUKBIPepTBw4jrwT/ff5Ix/pG5zPb8/GLdq4AhYBFET01XIUagg
         zevw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725587176; x=1726191976;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UwnV3rN27k13ClzZkPYxKb2bde4aYZdPIxzu2F5jqrY=;
        b=O+xMhmwxpCQjBL+/SdXaLlFRy9J2Ztwq0G0Rl+BVmtrDteF3vcGuHNp/THfB4KSBLM
         zajXrQph/F6Mc7HpDkP3L+Eg4UJJIQRGaKn/17WxSAXbdp1Szjf5JR00iVlhXYNYOU6l
         tXqQcd262JId2SyIbGMhICxxgyegimPo6b28TJdfjc8okVC1wnNUTEvAJMKd3RXChCVF
         kSbg9oswkjlYjF7sInrgDa6Jp7AgHxgYHMCGER7mSuQVV3ikXQUCJA5lJVaNxmy2TbGe
         Lxk2jSstTTxKIug7spNA+R8KUXjMRKw6xAm67+ZoLgsv6NVRazmSqQ6DKfurDqDoG5hk
         ongQ==
X-Gm-Message-State: AOJu0YxnR80LHAp88tcg/KALNxKOZgdDA1A8BRBvLlJ//V76i30tQvhN
	oUM3qD4C0axxWKbhDPmlu2/CQmoW2N4tbXoYeXQooznqZduln3qhxgcCmRnNuWEu409bj5oHP4p
	CAPq1Ta+l+RaUMT1Ijnkl2d/7Bv2pIr8o
X-Google-Smtp-Source: AGHT+IEhczTHvvDjVeg6Pvbvn7UtOLZBLuPzW6GomhWkIzl2gBVFJydJN91+AvoJ8LIJzWan+AkZyr71ZFB4mf7Tiyo=
X-Received: by 2002:a05:6a20:e617:b0:1bd:288f:e8b4 with SMTP id
 adf61e73a8af0-1cce0fea606mr26332456637.7.1725587176167; Thu, 05 Sep 2024
 18:46:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Adam Ford <aford173@gmail.com>
Date: Thu, 5 Sep 2024 20:46:05 -0500
Message-ID: <CAHCN7xLL4hrTK1OqsqUa78cdp9ZcG0sC+cO5QKC3x_Y9-QVzSA@mail.gmail.com>
Subject: i.MX8MP IMX-LCDIF Underrun Question(s)
To: imx@lists.linux.dev, Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	dri-devel <dri-devel@lists.freedesktop.org>, 
	arm-soc <linux-arm-kernel@lists.infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Schrempf Frieder <frieder.schrempf@kontron.de>, 
	Dominique MARTINET <dominique.martinet@atmark-techno.com>
Content-Type: text/plain; charset="UTF-8"

I have been testing various settings on the HDMI out of the i.MX8MP.

I noticed that sometimes my monitor would not sync, but sometimes it
would on the same resolution/refresh rate.  Frieder noted the LCDIF
was sometimes underflowing, so read up on it a little bit.

In the comments of the LCDIF driver, it's noted:
    Set FIFO Panic watermarks, low 1/3, high 2/3 .

However, in the downstream kernels, NXP changes the threshold to 1/2
and 3/4 on the LCDIF that drives the HDMI, while leaving the other
LCDIF interfaces at the default.

When I increased the threshold to 1/2 and 3/4, it appeared that
several resolutions that my monitor was struggling to sync started
working, and it appeared to sync faster.  I don't have an HDMI
analyzer, so I cannot verify much beyond knowing if my monitor can or
cannot sync.

Could the threshold and underrun cause this monitor intermittent
issue, or would this be something else?

Does it make sense to have a flag or device tree option to override
the default thresholds to change the panic level?

adam
