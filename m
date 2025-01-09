Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D43C21C194
	for <imx@lists.linux.dev>; Thu,  9 Jan 2025 15:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736435540; cv=none; b=VK8whjLapo4iEyiAIYi5pt+8rz7TOzLfHrTrmM7/O3sWiNsKZ1CC48kL4DBSb0PxDhMRx8GQaJSHJ04FAjS6rfa7k1NxVbeeZtk1d+DWD8yV3vqwVEhFwav/NeNIvKNFVcs29FhNNDOXFrBAe3u5xTDLmGBJY03LeDm4vjDcK5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736435540; c=relaxed/simple;
	bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ByNfUoF//3wGZhtVr4OCARxpOSyJE+9QRgdAZR4rOZOhtpaI2GftIwnhk58+4Iq385rX8EoMDLpXeIJZf7GJWnpoHkFHb2A3IlaSxpkouYlg9kWxS8W1OlLF35Qm8JTOsdHJwiVBkyOICNqcSPiIeHQjMisBur8xO0OOOeXjqDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QhRXBzpe; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhRXBzpe"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54024aa9febso978708e87.1
        for <imx@lists.linux.dev>; Thu, 09 Jan 2025 07:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736435536; x=1737040336; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=;
        b=QhRXBzpelVMCOxPH6F/C3xlQCNmdfstMMvqCaLyBrSf6lhNk6tWT+cL0Aq+zZi77wM
         JH2unv1PvAGoiIACypuwz0q3viMfhj5JSJK0AYAueaiOl5I0tlSs47BP8aPzseOupskc
         quTVqnguVitDVOcTYNFngutCmkYNn790/Q5Iw6tElXA/y0m3+eMJJ9U6OHrBbrGMMD6h
         RW032EjHylaEJSI6HbiDc+PTNwJGL0+4yTm/MjfNT6S7Z7Urt5TQjNSU9/4c4SvKtvkK
         xJlKY7EXjIduaZSqsqtcf30YvXJRViLGgwZ79btDpIiRYxK5OSquWsXIVC5R4J5xUaTE
         CM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736435536; x=1737040336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KZ/s86xLkYT+SehY6xTa0g1XsTpi9QTPMcjn8c8nw7Q=;
        b=RoGLzqnUpPbMG35XqgMExgMH9bIz/pzXFLIPkMbNERkZ//NznV5d2U0PwgGyZAbffU
         S5yAGkXgfEdbgT1OMNiX4DtBnGdmGlZX+ko+p4tRpuizKLQfu6uJohnbhlYD1HmgN9/E
         +RUFCBzefNvqvd7Ewon2MuO86eFND3StyZzki49rG2rc1iXGwBmbQj67qQFtk2UiNpci
         0mGkvTrK2PnQwQcDjoJeqkzHp3Fg+c3AkJr0FX3efQE7puhrYjffBPZXsb70Kd4V++zw
         ORgCspNcrO3d4GTjCDulgIlTcxU2u0p5m2/vSiPpzAee6hy91KHvzk8IJTKX7B5VGGGQ
         GCYw==
X-Forwarded-Encrypted: i=1; AJvYcCV0UmyYAmrLN2lTPtzuTFoxIOOZbg+i9bT6Aq4Hmj0+HDXLGQtkGVKujeXFcLOG2R5Kdm8=@lists.linux.dev
X-Gm-Message-State: AOJu0YxerhDJETe5m9UnTl17/RH8AuJi84wR9t+5RVIV5ChXJW+bo48w
	bOzXehXHZ34kuectoVdNREL1f2APjIrSUHuTdxtYWmJr8O1ox3NDFcQSLJUaHfDybb/Igh8MhHQ
	r5g3rftgJjSiMDaD5RAUQYPhdQHs=
X-Gm-Gg: ASbGncsJMbznwb2XJIcq2PR6XXJdqdFFS9nGaj0bQ6ZcBX/byfdXo6NteJbFWeNr1f6
	FqeQ2IU99jvzRYQuaqJuVMh2sU2UkxD827fVcUFRV8cP3ic//fXzyCFzMCEYjTQOFcBT4
X-Google-Smtp-Source: AGHT+IGL+Nhstz3ldj2Qzy3BUu8CvkJW+en+6Pugv+G34XFXJODm1l6h5QLV865NrxoZTWdlJIMugE0m0c4M50RMq8w=
X-Received: by 2002:a05:6512:3c8a:b0:542:28dc:b692 with SMTP id
 2adb3069b0e04-542845b9480mr1829867e87.14.1736435536184; Thu, 09 Jan 2025
 07:12:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241107085705.490940-1-lukma@denx.de> <20241209105240.72d8d84a@wsk>
 <20241220112950.4673bb3f@wsk> <20250109153702.2d149023@wsk>
In-Reply-To: <20250109153702.2d149023@wsk>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 9 Jan 2025 12:12:04 -0300
X-Gm-Features: AbW1kvYm4YHhAiGIME9YVA_LVAHfPvIy7l1kmlYvyF8IFfpGO4Q1dallC36xIoU
Message-ID: <CAOMZO5ABPnB9ov7jtEmDSZ=efNh_yx3JcqqS_UMTXgie=8PcTA@mail.gmail.com>
Subject: Re: [PATCH v11 1/3] dt-bindings: display: Add powertip,{st7272|hx8238a}
 as DT Schema description
To: Lukasz Majewski <lukma@denx.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Stefan Wahren <wahrenst@gmx.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Lukasz,

On Thu, Jan 9, 2025 at 11:37=E2=80=AFAM Lukasz Majewski <lukma@denx.de> wro=
te:

> Gentle ping on this patch ...

You missed copying the drm folks:

./scripts/get_maintainer.pl Documentation/devicetree/bindings/display/panel
Neil Armstrong <neil.armstrong@linaro.org> (maintainer:DRM PANEL DRIVERS)
Jessica Zhang <quic_jesszhan@quicinc.com> (reviewer:DRM PANEL DRIVERS)
David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
Simona Vetter <simona@ffwll.ch> (maintainer:DRM DRIVERS)
Maarten Lankhorst <maarten.lankhorst@linux.intel.com> (maintainer:DRM
DRIVERS AND MISC GPU PATCHES)
Maxime Ripard <mripard@kernel.org> (maintainer:DRM DRIVERS AND MISC GPU PAT=
CHES)
Thomas Zimmermann <tzimmermann@suse.de> (maintainer:DRM DRIVERS AND
MISC GPU PATCHES)
Rob Herring <robh@kernel.org> (maintainer:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
Krzysztof Kozlowski <krzk+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
Conor Dooley <conor+dt@kernel.org> (maintainer:OPEN FIRMWARE AND
FLATTENED DEVICE TREE BINDINGS)
dri-devel@lists.freedesktop.org (open list:DRM PANEL DRIVERS)
devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
DEVICE TREE BINDINGS)
linux-kernel@vger.kernel.org (open list)
