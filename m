Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABABC145B09
	for <imx@lists.linux.dev>; Fri, 28 Jun 2024 08:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719562448; cv=none; b=tKEnX7xhDgRToptIhjoFi6ibHQLTYj/sQs9C0YKduaanxtnLfITOm+S/5uWkShnetix7ySTQBKdzQslxw82oW+6zWDiudryKkbXoAW3skJqQSO3ca/608b2KzDS83ZT4gG+Ne1lJDou/G2sAP5+yKECASmrhVgIpxczSsIq5/TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719562448; c=relaxed/simple;
	bh=nqRVrVZ5iHTB+ps1/W7+ndXdI8MuJhemXqbN2y63NUc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miITB4Z5h5PHQChZXl8Vq4qVIGT/nOV1amr7oEwwJTuXOLEZGvDwkVMbtu/JMeNZ+i/K/4w9iO5Smglt4m+UNjj2V0WnVxocrmgBkQoqd1uwxZA7E4LYEHt6UiD/+xx33IVJB8e+5JBO4RMp6w7qXmn8o9Xz93mYSHsZT5UC01s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=t5ITnhn1; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="t5ITnhn1"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-36740e64749so224306f8f.0
        for <imx@lists.linux.dev>; Fri, 28 Jun 2024 01:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719562445; x=1720167245; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M+A2p+KZRH/8xvrbpyHuEUhzOc8IOFJevUwe6fDGuuE=;
        b=t5ITnhn1DqKhKWAH4W3eEpsNLtUjnm6N56QVsHlX9UK4uwt42hcsTdefg74YiImaV2
         nzzady/ntMZhxqxB/5laZrCrayc4b6LMYl/1NvDbVg0voXOrvp076yYRcdYsoSxxTEO8
         +QkdXXxpr3Ig7VuFGhsGfIBPgcuNaulBeqoEwQFD5WEnp5OYoT2DMNU/JFqjofxBokw0
         X4righsVFdqaGkABJnhBL6zLPqIw7aPjc7dbUZXqoggYKopBzRnxPDvavOk77ez18zGI
         COb3PSQIURZPpVNP3ca4Uc7xBNsVVqTR3sxjWcA83t+DogY62WAs1qXuRR1F0bD4ZUdm
         1lsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719562445; x=1720167245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M+A2p+KZRH/8xvrbpyHuEUhzOc8IOFJevUwe6fDGuuE=;
        b=JBIt3bf0LYBU8nyreA5FxYvr7u0lFB2A9XsdrYCblSVeEqWGRUoY6WqdxRLXoaBCo9
         Nw/tYV2bIz/dIXO+mZuaMFyuxIRtbHvB/bb7i9NadlTOd45JfnqnYxGvL3gpVBrewEaZ
         4h2YRWSq3zVA81RZ5taILMVK8uWVk6SG4CFxYo8lxg/IaNPFqCwAYKUUgxQp5dShIHtR
         XWmOcx3prNN5fPdYBPswlYLK8xG+Fvma8Da/h6Oum+umnVneS9qA4VYZUDkO+jfv+PBM
         XRIL33GAmf74Z/LQyQvq7qqRYLYt0tIl5FVVZ5mhCOVCZxjIDJU6c7+cXLn5U1pAiXzB
         oI/w==
X-Forwarded-Encrypted: i=1; AJvYcCW+9fjk4/7kC8G8IOBnOxPQJIrgKWfV+o5FTHogiUueO8a7RCLr40Yex2pMuI2pYHzJFj/+Nuz1gLdOh5zx16GtJ70S
X-Gm-Message-State: AOJu0YwxCcMJ0+0toPnNArhjhxTkPC71d4BK+Vj6zSvsUYrQeQnapFha
	aW56tmtZ3Wis5GdiVuJH6bYQFp8oYxxRbNNWNFWAV562eMiSMpxsPJaWlZ/zH3s=
X-Google-Smtp-Source: AGHT+IGdgSQ/Loq0ddkVqf0l8lNw8JF9rgv9IPIxTPMHfTT2BIwjBV2OdOQ66kl/5H+IrO6I9TR51Q==
X-Received: by 2002:adf:fc0d:0:b0:355:143:b5f5 with SMTP id ffacd0b85a97d-366e96bf096mr9758192f8f.64.1719562444843;
        Fri, 28 Jun 2024 01:14:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:cb0e:590a:642a:e1f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0fb92fsm1479113f8f.88.2024.06.28.01.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 01:14:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	imx@lists.linux.dev
Subject: Re: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
Date: Fri, 28 Jun 2024 10:14:03 +0200
Message-ID: <171956244055.25464.5584663942925200358.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240627202151.456812-1-Frank.Li@nxp.com>
References: <20240627202151.456812-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 27 Jun 2024 16:21:51 -0400, Frank Li wrote:
> Add common gpio-line-names property for fsl,qoriq-gpio to fix below
> warning.
> 
> arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb: gpio@2300000: 'gpio-line-names' does not match any of the regexes: 'pinctrl-[0-9]+'
>         from schema $id: http://devicetree.org/schemas/gpio/fsl,qoriq-gpio.yaml
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: add common property gpio-line-names
      commit: 3550b5db3af4d0ff7f2ad07367af6427534620f0

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
