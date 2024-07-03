Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A728313D89A
	for <imx@lists.linux.dev>; Wed,  3 Jul 2024 10:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720000942; cv=none; b=e25Es6NDq8Beo+93SoY9o1XpSca0UbM3u/ShA2Cv5YAa6PWCJq/m5KykMFjRzxNIz1pQq9hGhO8ZEWDUF6nJOUTq0yaChVv+8Lm09veu6ztBAAGMjyKNMloVdhWcMpaB0DRcpg+Kvgr6VfjzUMqo7QON0eqaIjK2lt1z0+KV400=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720000942; c=relaxed/simple;
	bh=2BueQlBHNUIUsB9Kn2OPvhoSOi/prFH4uiBvlAu1/5A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BMBzG80//oXlGZnHXpePhHKAoRnHMrkYOf4fii4F0RDG+XTyHzrglJiHDKray5jGk5BNxeEWf4XFgYdrSM45gxeyAezE/vDB+69bIpHZKT4zBWXaRcRQAwpxM5nzKfWRdTaVYRm7uSevPuytiVkA8EKgz/97AV9C2xHOFYRxaW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=qKSr1CTf; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="qKSr1CTf"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-52e94eaf5efso1017033e87.2
        for <imx@lists.linux.dev>; Wed, 03 Jul 2024 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1720000940; x=1720605740; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oKXjwCiaLg72R2gJ/FT04OGaQAr4J9i9LzgGVlBH+qc=;
        b=qKSr1CTfWA0UtlP6BvPpjiE/JDU1az5Lb0fv57LtUAwYx/A6i6K5zsRs6EgGLpLg8k
         PXvdEXy2fzAmpFe+WuwkmyMHjnkA+wNtzGZzJ5Y59U788GB6USpdRtBzXPMVLOHtqam/
         ZCZQes24U/08qqvjHEfyL8ZkiF8iTs8fW5SXH+04PjQlAs40wJCTTOH7RJbDtdT9Fho/
         mb6GX3Cf+6oSfCRYYYimfIMtE/hauTSHm3cFO0RI/ugkEgtoFQsMhynbca7OAkmoThJx
         0s8B940HVEayAjW3qcq5Wpa8Hfq4FGP6T/bVQQ+aMKKfKM2+8Im48/0oR9FDZav+9Z68
         JySA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720000940; x=1720605740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oKXjwCiaLg72R2gJ/FT04OGaQAr4J9i9LzgGVlBH+qc=;
        b=uF8N9pFJ+u1NRzmMmlql+xzXMNudGyjZL5c6zb0eXxRkJZl8p+4yOxo5pgfGLBl9sR
         OParugLwEz8KJfIxrceRM3Y8TRLKmgtvHZ0kLijOs7+aa6ji2W7td+E9UdMRzml/6fga
         sLY+kVR/dkkNFeC5JRZ09CI/hMRntbwvm28IAuUbbMP2AMMzB3xmTVgBRmTFSyKzBKo5
         lxvwtNPrTmYdKyZlF10GrFkA53Ri38RbnAbZvVLUrufEWZ5bTzsSEeeWtS1FQ5s4pEQx
         Om4vqwcOcv9JNsKHBaazDVs8cELZO0Y0DK8YzAscEAr1ygilE5/1+Lx1BIvmpJ2oL+qS
         LJ5A==
X-Forwarded-Encrypted: i=1; AJvYcCU2kuy5TwzYihKKAJ67EdzhGjcqXh+0/PiT9qvQ8yKEEjFJHQ/3MdShJshHClWn6sF4vDbGv7c/l5g7pojA9ngjVMUa
X-Gm-Message-State: AOJu0YwhouR5ByaPUIhPTSdNynFwsU9cpbcTUgd7nOU7ZniIUnSWgtI+
	urF00gSSEtt+fnSNyyia27R+17PrM4JezNA4cy6TuAXZRiEmDVUZHVm4rdd5YQI=
X-Google-Smtp-Source: AGHT+IHzaRxDw+0xOP288QMyiqj94os0mlDtdORAYbbCky+tos45ZKFz/8bNjlRpBD4147ufyiEMjg==
X-Received: by 2002:a05:6512:b92:b0:52e:7de3:64fa with SMTP id 2adb3069b0e04-52e826feba4mr7443996e87.46.1720000939825;
        Wed, 03 Jul 2024 03:02:19 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:c37f:195e:538f:bf06])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0d8df0sm15560651f8f.29.2024.07.03.03.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:02:19 -0700 (PDT)
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
Subject: Re: [PATCH 1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio
Date: Wed,  3 Jul 2024 12:02:17 +0200
Message-ID: <172000093537.12215.11059064969197754180.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240702201724.96681-1-Frank.Li@nxp.com>
References: <20240702201724.96681-1-Frank.Li@nxp.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 02 Jul 2024 16:17:24 -0400, Frank Li wrote:
> Add compatible string for chip ls1046 to fix below warning.
> arch/arm64/boot/dts/freescale/fsl-ls1046a-frwy.dtb: /soc/gpio@2300000: failed to match any schema with compatible: ['fsl,ls1046a-gpio', 'fsl,qoriq-gpio']
> 
> 

Applied, thanks!

[1/1] dt-bindings: gpio: fsl,qoriq-gpio: Add compatible string fsl,ls1046a-gpio
      commit: f2e395629747e718a67b567cb84b49d14792b312

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
