Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B6835F612
	for <imx@lists.linux.dev>; Thu, 26 Mar 2026 09:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774515757; cv=none; b=tDnDvGpxccU8w1+2BplDrX9zL64anOrz1vShmB35tItrLuGPz4J0O40Osc3bDHsft5bcHq3ttIA3q65cU7ph7/bQiqqPNXN2YXwBeghO8K2+iVjIjQeqR+kUOyF+n87fOImTj/CfLaL73LxOGel0PvinBKocwAId/3rCmo3VFRU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774515757; c=relaxed/simple;
	bh=Y5TUtL3qwR6CH6Df5dxrSWhYp82PygO+Kjo3xGwmpg4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CLOJfQmPux5r5xXcwHjlS20L6cSZC6peJtvaAGrZdbl7wTzb5sEERvnJgumdt7ASKCnlodmAvwFlIot+NQYeB0D2wCp9tuJHQ8gWIKkkuhn1Dlf3wJAY/Ee5G7H6Fp90Nu2X7xIN2KY7Hu1doEEAJuZI/skVF49d7B2EbbLiD9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FO6PuLd2; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FO6PuLd2"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so408342f8f.2
        for <imx@lists.linux.dev>; Thu, 26 Mar 2026 02:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774515755; x=1775120555; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=FO6PuLd2FR50Bs23w2Q6e3DDQo0ajY1oq8etHP2yv/ODUkatdV71sh771fPseX/Z81
         fA1d87mtIxjQmAU1DXyCnavl+j91P9TbABxteA5iYtVfLlLB4nKDphEC+QBE9pP/VKt3
         SwpFtTpageV1vKrU3K+QebowOmM+9Uivu7esZbqt2c66PmPlShCxIh3Ppd3bikj0A5lC
         np+MPFtuR/EqMBOT2rp9fsPvjqGtJrlpitoikXViblWC4QfkJCZv6Rzw6W0dNYQIJtbf
         0H3Z2RW1sHtvoK+RP/rFXzKS3m1keQBCCD/SbfdmTy+GDmCBb7X7IvQGVHfpVhD174U6
         XMFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774515755; x=1775120555;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T/Ix3s+Tgcoiyysg+QDxh6RK5P6qQb9s+C3grnl5iwo=;
        b=Qc3Ok4LmQLpL4MgePexkpdKk3YU4yVHdhmNC71Par8KLHXFkKuSaOyuDFwpn3yXbhs
         2Q0sAaluZA3sbBvdfpPYLp4Om7+PqgWu2H9W5n5DO8oIN7/41QgU0BmnpJ43YfxHoSBX
         EV1gBFDfEp4qicmR6rgDwfwjHzOC6OjIFyPQInufQZDUi+VvqD0s0sVVi1ZCy/g5xoeA
         NrNfB4JrhwMQkIp2RBWAuz5dZzt8KwIQjIHAlDvSCfZy3yFxPCylASt+rn69g+L5hb+k
         dCBwcYlu2XCPHjSh1fWW6r5G4PwI8kgDp0cOjuX4HmRW2AomGJImXNykDzxaZPO4PVFy
         NRUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgaSSR7jse2RnS4Ik6jmr1T0icUyZbEiuiODZif6aqlIBo9rDHrFHUcCMsqcAUwpIyuW4=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz4t7WlnnysvGcoG1t2bA5GmIwHNtar3ve2H+B6sm/QOGYOaFCo
	JYbdsp7EyMLGNxsdzmLnC7X2fBWWbRvPcYX9dH2rCGALgBEwVjQZzO5E81swbint+TA=
X-Gm-Gg: ATEYQzwnoM9XXnKXdQ7eZVpLdg3MCWwMPQ5pyPyZEXrJmaoDe35wrsl3Rtn/1Xm5B3H
	AmFVan3064nJtKWQL147Q1DzPXfQlfvEmCn0OLwPwE2E7WoOvQwbOKIW792PGAxUl7UgDhERE+1
	9QjmpY3nPFSIfC7GF0z+khK1Dop4444hWXHrh78hmGSGvo3UZ75VsWackn55iAXh3GAiXyQyHxI
	t8UqFcI5m9thp+IVkh3ne9Fieh7a2ZCLy7I2N8Ys3tCvTXvIoAaaNsDZg/5CufsVLV/pE/FTySR
	I5Y2575BsMrShaJ5KPGf8XfK3JbwqsR1Kg9tODimuSBMG7HTrkZYApm94XkraZOiGkqkJdaRdEI
	HMqS7emMp94LkqY/QJDoCkbExNp57jBPnTjGNCjR2Az1DPBciLoEs51iTO7Hj4oUJ3AFZ/IDQfJ
	hxS3Z9YwondT/GlG/wWauutgpwUHBqu4NHZwe5uxmVghUe
X-Received: by 2002:a05:6000:18a5:b0:43b:5095:d101 with SMTP id ffacd0b85a97d-43b889f58d5mr10149259f8f.27.1774515754445;
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b919cf069sm6213436f8f.22.2026.03.26.02.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:02:34 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <jesszhan0024@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
References: <20260325-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v1-0-10255d236439@pengutronix.de>
Subject: Re: (subset) [PATCH 0/4] arm64: dts: imx8mp-skov: add new 7"
 variant
Message-Id: <177451575363.103892.5315410631400617574.b4-ty@linaro.org>
Date: Thu, 26 Mar 2026 10:02:33 +0100
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

Hi,

On Wed, 25 Mar 2026 12:31:58 +0100, Steffen Trumtrar wrote:
> Add a new board variant for the Skov i.MX8MP based family of boards.
> 
> This variant uses a different 7" panel than the existing ones.
> 
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/4] dt-bindings: display: simple: Add JuTouch JT070TM041 panel
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/87535f27061f3443e813a64f59fb1b0fcb916e08
[2/4] drm/panel: simple: add JuTouch JT070TM041
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/7a5b966952c0232d7083a496261880fc11cc8c4a

-- 
Neil

