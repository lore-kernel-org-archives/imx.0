Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1C92F3C1E
	for <imx@lists.linux.dev>; Tue, 26 Aug 2025 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756202353; cv=none; b=hTqOMVI6pMuY2z2cGD93cv0LrIMf7QCfbwnIARomTMnFjDm6dz7AoMZf/1sUflug/UQqLGCl23+I/imCfM1XLbABIJBZNs//r/fgPQUhzaMNiNaCR/PmHURRlKmTJPMJMma1jAI2qAyZLwta2SFXTPYZdhfIDw4PHjTl5wjMLQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756202353; c=relaxed/simple;
	bh=TLQe8HKqVprzOWSS+QrcEEJ6qsTop6HAIBHPmWLduOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=quqRPWsAG2MdRqmE3ZGUFc2S0jncVBfr2KepYOnEQZzdQxr5fIBJfNxmVto51hgaoXoaNzBRQfIdq2PkvuRzK5+cVdCMshdx9pQQz1TeN0c1flzKfHaXjILs1EaBrDa+rjm6G+BXmEF3+13RxHQYWpXD+EPDI+/8wmofwTX6OOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=E/vP1PIb; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="E/vP1PIb"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45a1b0d224dso27723515e9.3
        for <imx@lists.linux.dev>; Tue, 26 Aug 2025 02:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756202348; x=1756807148; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=E/vP1PIbhV9342tmeXvGxiZNwps5PGriEmuuWtNF7t3Sfb9rXcBozK+iUTMB+yI2V8
         sBhCvS/4MnZOD7GFKn/50aCLgMv2DphvskNfuJTPaG0bpy6VjOh7z3ypgznqYt9Rgaia
         E+WlZiM5becHoVfwkxt8Iv0l2PygJaXE8asSOYkJ2Y1EQTqpJWwxVBPomvP0trq+PM3n
         1h368e8bZiK4YFOZMgw6u9NLQU+HFnOcxDYoB2e8e7W0KflJviWdOZdqguEuugk44c7O
         G7XsG+zqS3a/JKj3UuHCdvSpXQHApT/iJFOYrEZdPKV7//sAn3b6+Re7c1C9kpWEuAA2
         Dj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756202348; x=1756807148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l+Y0JVb+zyxoD2ZTloOvpkOul6QpmpNVbYqGaduRqGk=;
        b=m31Af2sm5g7qjsgkrd2UrrW4MYIaMt2f/AJVK+vVM8ntMwNJriZn3D1VIaL9X5OX9S
         ggq6ra2roSi9sgbd4SIcl6sPPHKoiLsC7lhnoIPUaeJgWDtjkEg5C8mM3VRsrlz0jgbC
         fRYcrgE1oN4c9xKAfCXlvQk2Fx7SfN+A6BV6TrjIHmGjtS5jL/Gz2uxBisWmW+FJesGm
         zuENH/emI2i6Am7xqjjMkHkoGBWxWqn8qdiERCe6s9v0ABMRciiiPoGDLwWfWDPGWxZ5
         fteaZGVvwR+M/hsBYtBMeABeNGKw+IR720dj1Ga6Nj0cnyYjOyeZhyq5qJhCuYpAazEA
         rn2A==
X-Forwarded-Encrypted: i=1; AJvYcCUNVuMoJey4F4ZEWLI4M8KDGt1qJio0FmgUUF2VqT4uwQwPfZQx4FbCdZf5MPLMiykEuTk=@lists.linux.dev
X-Gm-Message-State: AOJu0YwuKXhA763k1Nc+o/nh+LQjW2D3WFccjnyfQ4nhLP5QyGTooDAq
	y2qzZTqfk4iF1MS3bvp1/aBDzZ9126LndT5Uumo5IKUuHuW/RNXRrpJSWfCByWrii80=
X-Gm-Gg: ASbGnctwJP9Zk8Bs13AAvRGR3IaAC/B+NuDEq31ZaxywTzK2/3CmbJphJ9iFGl6m8Hk
	ci3M94wPfNgjKGAYwc1ybp+9z0pc+Iflf/10HR5A4e1FAA8ff2xlvtskngg+noFltQ1AjXhvJAe
	CquOgUuhjmix1qQ8RpN8F/8My7them2cRkqLEJwqvBdEB0YqxF3cNNMbY0a17jymuXDo3mVD/Ll
	QWzNgKBT1viLF8+skLOyLWTFeo+V02OKdensLbOpHq6wVdpQtR30ZHmMVKfQWQ8SjtIGiMtWhPf
	TuTHPaA3pZhi18b3aXKEhF8wE0usjX58hR2UxiP3k1ObuSPIejW6/4PLQvFr54xWyfOGz5OBrw/
	PcYnYyZIpG+fjot5vf8p139qUwq+OJyH4xiCch3t3t9faCA==
X-Google-Smtp-Source: AGHT+IHBhKg7IjKrhhcVMyL/r57y1ugEvw4mEz2iVwUNncB45EjnSI4PTdqiXHRrUmtm1gPJ4N/MCQ==
X-Received: by 2002:a05:600c:1548:b0:459:d709:e5b0 with SMTP id 5b1f17b1804b1-45b5178e893mr140193745e9.5.1756202348058;
        Tue, 26 Aug 2025 02:59:08 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:fed4:79fc:9440:6629])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6300da81sm60418635e9.23.2025.08.26.02.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 02:59:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH v2 1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
Date: Tue, 26 Aug 2025 11:59:05 +0200
Message-ID: <175620234226.21143.1718612785479357856.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250820164946.3782702-1-Frank.Li@nxp.com>
References: <20250820164946.3782702-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 20 Aug 2025 12:49:45 -0400, Frank Li wrote:
> Move mxs-pinctrl part into gpio-mxs.yaml and add pinctrl examples to fix
> below CHECK_DTB warning:
> 
> arch/arm/boot/dts/nxp/mxs/imx28-xea.dtb: pinctrl@80018000 (fsl,imx28-pinctrl):
>    'auart0-2pins@0', 'auart0@0',  ... 'usb1@1' do not match any of the regexes: 'gpio@[0-9]+$', 'pinctrl-[0-9]+'
> 
> 
> [...]

Applied, thanks!

[1/1] dt-bindings: gpio: Move fsl,mxs-pinctrl.txt into gpio-mxs.yaml
      https://git.kernel.org/brgl/linux/c/66edbb1e32eede16b261a90014451d67119fc875

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
