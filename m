Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9D126ED3B
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 21:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353852; cv=none; b=f3fQqXaV09025zE/qiM5tgWoWkAF8+l92IEtMVPvG/oOO+xrTZj7iL7Yt9vp1/Oj3dBkJY/CCF2vCf4IhlpdF+bi3RYET7GIuHkHgMYUZ+Qs7eZS8Y5gZdLn1yD5wwMlu6QxRgdTelM0abJMjdyZGwcK0h9qQbJBqmxhzUElZ+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353852; c=relaxed/simple;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LglQ/dYXTflSPIKuXkRDy1gIfo3946+fEyYjJDp/Z977wQ5VBrZp28UE1+vopHYPAB5me0su4TSX+QIxXK8CrnPCB8ll9eLTlKqJwmA48V5NP76U0434ICXcaVOUjDx5eT6hObRd/B31/gJ3qMuDhCJLpB64zPIEe2M0oICNTyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=cvEheZHe; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="cvEheZHe"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2a09757004cso42452635ad.3
        for <imx@lists.linux.dev>; Sun, 21 Dec 2025 13:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353850; x=1766958650; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=cvEheZHeeXNTXZw5HaJukHQmG6cbwMHMt7ayA2msHR3wHcBfDQ1Km3nM9gH1l5W1Zx
         dVz6j2MahfS16I6FfnytQVpsBC2W8OheGi0Wx4LYqSQdlxeeCdJh0LQdMkTWBug5RvQ9
         r+OIxiOuBafJ2yTgfBID9mR9/BtfTJTHveB2tSswASzHlV+Z3V6PaFrwX5AI9r2IC3Mx
         TZbyUG9A14bgc7iRM5c1adS5GWKu6jWeq4uB8IhH4KfiP4AMfn7jSlWA7JldZtdQZlNb
         e9pCHfforuIdHboyWqZONLPYDxrIbA/fKU6MaU51tRMHCpme7sgdaDKgeb0DGaas18dF
         ey3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353850; x=1766958650;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=TViKolCMrTdTRwOav1mc18hyEalhfvbJN6C1nyRMf2/VjLqmtlZL4rQ9AwfGhND/e2
         uvDhcwhaD86UNPcM3R7MPtn0cab4m8k+duyMqvrp08qrqIqv2F/6tJk0b9dOi8wYDUpu
         4XIhPHEIr9HQKAaAw2nfSf0NQlKnogg0oxeDWYGW3AZrl+KxSjEV3shkQAJBu97p038K
         twUHzU4Kht1FhmC2LpZgTuQJkIb08yriIDVc4VWscKAaRue0PFaOoGCirmGKbDOks5yI
         wbSB16Vm6cc9jT4Pn27Wqj0f+nyCo2Pwwys9oHwK2et8CIY8cmmLz10I6FkgpBHcyhAp
         +R8w==
X-Forwarded-Encrypted: i=1; AJvYcCX017wLQ9m9MpUwfS/EAP+jmqPedRBeg2bC3kXr6QXeRU3TzWOM858Ba2ZRGc/Jsb1/cn8=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+PRCwXZrMFCj9oYgb13GXYz0q/i32gpdI/X9I7SUQS5pl70jM
	h+R0xU60oC03/Ez39GbC20FTlUjvc0vXNkdSh8zufvINhlf12f4+vJKce194rSxJTbXDw+Zz3Fq
	TcpfuQn3vlforJXJVesu0f8WHBj8VkCY=
X-Gm-Gg: AY/fxX6oJBg6DuQSbSq6nuj7vd6jH50UNLiMV1mdWJhCVD0LMp2TNsHQBJxJcW4pkQe
	J3Ushpm/M8weAvFYJeVYuqAtvIesCbC5HJtmPhGWFLVQejlHI9gWb3K3FzVIKOS7vFczptX5mwe
	mDP49lb70Mk/fW0OKFHCs2UBgZWh3vmyGrbtE0WElJbFa/wj4uk5vVX6A1juY4p8TnXH+ob55Sf
	ASjm/RrnctzD0iQlGxuelAxoREWooe6B7NGVkxd2KdSwDHtdlCnnTneP88FAXlRka9prqpRQb0g
	XEGtdsyJQGjAJwBXsbGD23A6KYUO
X-Google-Smtp-Source: AGHT+IFmGLO1ppe7sd+ZWkCXr5M/lVGVTY4CkYOHQyHuMOoqYtObXJlv15dAaXOXobOy5zBtPFDXPUKZsDC8LF455xI=
X-Received: by 2002:a17:902:d2d2:b0:294:f310:5218 with SMTP id
 d9443c01a7336-2a2f1f904a0mr102182675ad.0.1766353850211; Sun, 21 Dec 2025
 13:50:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-11-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:39 +0100
X-Gm-Features: AQt7F2oD-fq9YbJ8bBaEtNQvS-l_6JEvIhNv2LhoefMzto1ImTx3Z1Dec3fhOSc
Message-ID: <CAFBinCArG=-pNRHZTdZX1CDDPrs02zpRJ29GSEUA6TcUckQvww@mail.gmail.com>
Subject: Re: [PATCH v3 11/22] drm/meson: encoder_dsi: get/put the next bridge
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, Phong LE <ple@baylibre.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 16, 2025 at 7:00=E2=80=AFPM Luca Ceresoli <luca.ceresoli@bootli=
n.com> wrote:
>
> This driver obtains a bridge pointer from of_drm_find_bridge() in the pro=
be
> function and stores it until driver removal. of_drm_find_bridge() is
> deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
> refcounted and use bridge->next_bridge to put the reference on
> deallocation.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
