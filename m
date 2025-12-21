Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859F82580F2
	for <imx@lists.linux.dev>; Sun, 21 Dec 2025 21:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766353837; cv=none; b=WI6145TB/Rx52AGWnrjx3Mb8QUgiFuHU3zm0+CgUuJT2QgMVW/mq9W1kd2UCpCsj4NLnmY1KciH1LRx9ECCfmg4lKD/fPqErpuI4eIRuuMEYnlAwGqbOcvb2twRhrXKrATv1B1SJWoroJUnCcRXge+dhRs+65ZE/9pETvPP3VBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766353837; c=relaxed/simple;
	bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LvLItA9MkZ25lMRuyZKPtIxA4FyjkQEAgIyv0yw7WTULoKHwPV+D7heU+cY4YdHBM+sVb4K/Qwi8A7QrY6iXXeB4T8oY+xdJ+fQUCamwnaY7L6R3vyVPIjDYlRgaenHV8lIwSDHcLw2wmWjzuqiMog6q3pufPDMhOfZu2dMSHu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=dLRWbha/; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="dLRWbha/"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2a1022dda33so27373885ad.2
        for <imx@lists.linux.dev>; Sun, 21 Dec 2025 13:50:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1766353836; x=1766958636; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=dLRWbha/728gEX+t5UyeXKFv+vExq9YB7c6NO5IMDVDrWceHnBjUoP+ClQlCTq23sB
         s7vohnI/OwYcg8cS36N9w0uMCDxOhwSdfvxaKXCijmOc8hRLQnrk8rLzD/tt8dvuuI63
         a27Lp0THLde1kfX5sOW8/mQyYNx7LD3FKzmlp5AlizokRjkxOgGnL6lhhtzkPobxeX4J
         Zu7HQR0jQ0+3fM8McS/v9dGfokawDeI5vnpkz8r0wPimLo3DU8Zg4mGT9llb7c+/msH2
         RN96eZ1dbg612lwbUH8bs4dLI3pM7MEmHEEIfzK8kYgWZNPHYj30dbO3D2FeLufbwu/H
         SY3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766353836; x=1766958636;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8ESPuhbHJz02YptQK1tw7Lrl7Cucbn6A3EDj5euzbk=;
        b=vCKZaJPBbYR2vdEoVnxOGBEN9nWiNpEje0NI5hi8DA0YuM4R3gLlTWQqSVNkv/a+7H
         fRa82T+F/PVn3cI3dRvBBhLQeOmiTVGyJOEARGbwsJy7HxRDM1/62wwpwjZzQ7DrJ/nL
         G7U6eXKwCgV/i9yEKnhINOxshzNXHOlJaGC16lCbQ+H1Q+tJTR2ErnwZWGP5gA9dbIrr
         So30sKs9lKh2Anu3wkmZjbVnJkbcTMtkWr77rGxF8M2JOI2lOJq4QxuW94Uyojc5HiIn
         gqENDSHQSCeqGeaF9XJXEE27CdJ2/FrGnaUoszwSfNWXpCpQUbZyc825K62wLI4faOwq
         jDwg==
X-Forwarded-Encrypted: i=1; AJvYcCW0aXgwrV65EV3dssBZfxDHYQgqU99AsMcf9bAK3FVnz1g5E4GLb4gvSayY21Lk7/UorKI=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7gDPh1iPb3sfQtiYZ4h2Jg38CWwpAmsBQpebDZYNdhxk5/ruv
	i8m/3i63MpH67WcrHw4v9mRjTIGiVPwXubfT4J2oaqnNM/GGWJCT+vaDUzVBgwcQXhn/I+Bw86f
	Xoo1305Nkam7AJZ2mqp/A3sMu9dm8VfA=
X-Gm-Gg: AY/fxX61AGpSGrcTDI6VjqEMpCrwG8NxaNEfU3Opdi/CJrc8LQD+XFpI+jGC8LMVJk8
	ldhT+4gwQblaOqLSrfHBzjZoWjkMZOiBJfXUSe4tttG/Z2XtT0hOz+RzcpkEChXD497ZLEfjB0L
	x1c/wzYDNMQe26Pw5hsuuxgirxsc+Ff4C2OG7qSXov0yk2izbaSl4n+9XwfJgmXDygL3n6SydjF
	Bv+dhQDySWl7l/lfq655nzsdZ3P/bxsOrOY5pMpO06ZgAXVNjaoEV2QIuLfM/2ryvBlunrRePU4
	8X3ZptQo7YN4M9jcMRUUvh84koei
X-Google-Smtp-Source: AGHT+IGw0n+Vw3mSNWIuK6jiR5TwNM1Orq2NMptHhH0WFtIprggK0653bvytXvjKFmmgd9+xofkm/n3sIE9SOEugciA=
X-Received: by 2002:a17:903:b83:b0:2a1:388d:8ef3 with SMTP id
 d9443c01a7336-2a2f222bc6amr92154845ad.18.1766353835637; Sun, 21 Dec 2025
 13:50:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
 <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-10-b5165fab8058@bootlin.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 21 Dec 2025 22:50:23 +0100
X-Gm-Features: AQt7F2repQdtBoV8d-ez3LVKkRTtOC5SATWZ81V_d9C-sFP5czyoEjd7MirbIfc
Message-ID: <CAFBinCDt=9H1ccXatr8JYA=atG+vDCBX9x0xor9kibUfo1NKpA@mail.gmail.com>
Subject: Re: [PATCH v3 10/22] drm/meson: encoder_cvbs: get/put the next bridge
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
