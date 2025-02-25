Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFE8263C86
	for <imx@lists.linux.dev>; Tue, 25 Feb 2025 10:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740479141; cv=none; b=Li4MSVRuGBFCpvROv6GlOKhIiV+a1PWhuTaT5Jt0UlMrm/YS/GZtbG4qhzDbco8o5pXintJlv5S33jBlnakoooDDpo3vH3NSWAWEmdfHNQHKUW3kPMkCLvRioI4po03Agagv6vOkWXAgSUVeOYi8U5mZ8K/oDaz4uq9HoER8wXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740479141; c=relaxed/simple;
	bh=lVx9GsbZg/PJKvZT/5kfAUjQoKKgydq0Aadd3S0x4mM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=RnrAbkskS24a3I0do6FCIPMowG+9/OfX8ao0b6q6QxPEtmYHZtO8ubCf3TNAC9tg8qVK4duLf0frIZxXEeitpedDNkFhwuloe6cVuAbWYS7eSCfICwNcjB8wOMvbeRl/Ki5b+h7TZPF6wNNt3w918yrO7CdjMsyKr8hPduI4JNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G1UYBxsb; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G1UYBxsb"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-38f3ee8a119so2648881f8f.0
        for <imx@lists.linux.dev>; Tue, 25 Feb 2025 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740479138; x=1741083938; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
        b=G1UYBxsb4A50EbHCDmilXyBevuZDs8FYxtohL3bTbQVtRCYy7lOUzWdz5knqQIvmGk
         dNqhPTM/N0QB54VcoG90XmCxrR8CcSmEm65toDsWLzFKkd4Bbr0kHZcCm0e4lAEStiTk
         SmveMS+1ue+A+uLnEzUBEqqMVUaDqq+J308g+WnGajYVlShO7ilnEL1wW0pN3k89rOg/
         iMmEMzUfhP62bPqNqoTnwJ8VwEK7EXuBG16h2kz4wwKpFRnQZ2GnEg4OJWCimaIqVKRt
         ZSIe9KUAY1tLkMG35Kv3tQPEcJ7IJEQvN8vTbKkZ4BbMUHsXb6nq31wT67twW6c93Fpv
         Kqrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740479138; x=1741083938;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aFoF7QyNRZ9r7+RHzos7assjg+PgG+3CLatxaRnVuRs=;
        b=cRfBMPNiLs+fLYi+lJSetGNHHv9VjATVd52TcYBbcwvSzS0QDtQN8Vh5BAAB1RoX7L
         sMNDhnefdn5uFiUnGg6td3fP3R8EjgjIkbHmnKXJE0VWFwRmGeapmmNNuPOUtRhs8GP5
         YKg0PF2bU6CCVuhZhl2yuLRULX1XjJXPOZxBZW8dzFmspLAfU9W6O4QWVZ9X6xKQnHI0
         Y3gHxWB7QqIriFiU+SuPhJfd9x47v8fyWecoWfORfDioC0eMSsanhk2S+BnwgY8/XOmW
         ZIKNvU12qyHc/l5j0Ny+2B5v2nv9uRnuIgIQmi2VD6B8YzqMZf/6JmjM8ilszOv7mTjo
         g0jw==
X-Forwarded-Encrypted: i=1; AJvYcCXXzX55K1KezHRQ1THPMl746bDA+jm9Y1jeSSNichKXe8Tc9xGk3ilw9jz/64JRa8seH7Y=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw+k83wqJ6UZT0CD6KQqaZFGBIKrswhm6byTqimsdw67Jq/iUx9
	bXCsKmcB3GWUZCTuIsbrw3OQ742pBODoNLb8j3Xti0JeLAMu9MGn8SG+fgW9yak=
X-Gm-Gg: ASbGncuk3On6UZYRpCCx7xUhbCnDZT351gRM5F+fXbWcahc2j+c0IELC9TkqJwWzEjV
	GHa+HLY4aWCYC7i2YqGfwTyIx0dht+I31v5n3Ys5u6/WdapThGoSZrVaz5zOUqQQLNvCJPmdvij
	Seb8ZhjyG7Ne8A4cCK/ZTjGOjjyVKFjGnjNPpjZgJQiqWMcTEJEu6kUaCTbm9hTP0/JIubfr/fw
	MgC/RWRMLGNHrQjPjGrH200kIvIB+mLjJfLY/1c9f7UcYfxBasWkSOlWfG8qH4b3lo/AvbivyzR
	jGVs0S2BVhGYCJrlz6LoQae72I4bSszwePPeH6w9vWaf0X0=
X-Google-Smtp-Source: AGHT+IF0UNTzcIoMzLzKcwrilDWc3geeDLz1AHdSa0/z4fJP99oSE9XrnUuGZC+x8acSBmNx8F633Q==
X-Received: by 2002:a5d:6dae:0:b0:38f:4b2c:2464 with SMTP id ffacd0b85a97d-38f708626c6mr12904963f8f.55.1740479138118;
        Tue, 25 Feb 2025 02:25:38 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86707asm1764378f8f.5.2025.02.25.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2025 02:25:37 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maud Spierings <maudspierings@gocontroll.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
References: <20250224-initial_display-v1-0-5ccbbf613543@gocontroll.com>
Subject: Re: (subset) [PATCH 00/14] arm64: dts: freescale: Add support for
 the GOcontroll Moduline Display
Message-Id: <174047913731.2131221.16812340325511859962.b4-ty@linaro.org>
Date: Tue, 25 Feb 2025 11:25:37 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

Hi,

On Mon, 24 Feb 2025 14:50:50 +0100, Maud Spierings wrote:
> Add inital support for 2 variants of the Moduline Display controller.
> This system is powered by the Ka-Ro Electronics tx8p-ml81 COM, which
> features an imx8mp SoC.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[01/14] dt-bindings: display: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/761992a4b4deacb519f4a6089936b7fd22b4aa0a
[02/14] dt-bindings: display: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/1a4d1d9f068506f4f334c03514d2e93e21830f19
[07/14] drm/panel: simple: add BOE AV101HDT-A10 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/b554c009da1c3c6cb8c4b5da2ac2f37fb527e927
[08/14] drm/panel: simple: Add BOE AV123Z7M-N17 panel
        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d34bd3c7cb84425dd6146a8d07af597b93ad4c4d

-- 
Neil

