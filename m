Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61894D8D0
	for <imx@lists.linux.dev>; Thu, 14 Nov 2024 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731600107; cv=none; b=fAGxBqlotI75mKDrKqXS9zK4U26i6wOUGOCY2hmGGNQC+rS5v+N9dtqq2XJLreLSSmn9KXrOPIIboWSkIPZU/QcFK0aXHYx79nnK68tAwi7UdzO/lJfG1m36yxU0wC4kWZqFJ42DmBhP/4bFMvKZWrfkFd7KoHWfJmyxcDbEP64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731600107; c=relaxed/simple;
	bh=1EPzcE/kgZDig5Otxrs/UZexLcFi8WM1Xgs11JokbYA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=aOLMKwlOAdnlP9m/c5SEDp/G4WxuceOXAsVRZdZqyFLktPTRXMC1EriennRIXO/DVRe2twXI4l81cqL0IZiPdpyiPebpO4UBhUbUnJ2E9jIaR6bH8dHYed5zho09rZgN4XRvc7t+lOSAGcyWvDDu/S1bmHBZxCoNiCLfsr4Z+hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tKj7ExY3; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tKj7ExY3"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43159c9f617so6785015e9.2
        for <imx@lists.linux.dev>; Thu, 14 Nov 2024 08:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1731600103; x=1732204903; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3JMdSgtq+Ttm3L6LRQ+ruGkVxLt0T6TxcM+79MWVPjE=;
        b=tKj7ExY3uhlnlFQd9h0McVHdwEp/GzXY02zWCFElQn9/7WbqzGOla2sRmLR193I4ns
         lTdXwiZ8KyLVjXjiBX66NPyt7718y+XlnbvNFeL7cury2Y5CkJJGSKcUuTY6rkIUhzTP
         wylzVFTUxfJHVW8RwVXqSvLKfYBiD/eo2Do+hrr1JGKdU90IIGFN4oF8Ia3X0BjxrGSW
         rSkk6RvuDiiZzdZrMyLqbt3bKtASnoVH4lkbHqyHYWG/vOscJ4XtiyEINhIgeyob33LD
         ji8zvFIPo+Wi7KyTQyFGgnrOW+oMCbJRx9u6PnzFLYfI7pMlUoE42/k6Ozb2iWTv4ARU
         ZXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731600103; x=1732204903;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3JMdSgtq+Ttm3L6LRQ+ruGkVxLt0T6TxcM+79MWVPjE=;
        b=FjoMBMzWYuRrRjtfH3NIwEXxdJlKE5o2vbO9uyvlYCX8GMo0lUcf17TDDMDhb+4m97
         SYSxVBUeDxovLwPMXdLE8iG7cC/0qNpMJwzkr8fmLVh0K5fnMHIgxbNXgrkjqj9tkW33
         6WQNw8KUV9wsVBp0UN1ciGqQXl0HD0TUuXO3W/wcfptcFhgGerqGv5Lc07PtgSoX87Ww
         dyA5DZfTIjX42OHWu4fL3B2S14OWtHKnzlWwfUUf9Z/FBmXKIUBrmxtdtS43wuR9nOzt
         +6SLdpd485l9sKd4k0C6d9OdE4AyILTLIn4MlmAzhJdA36hqktM0yk0xii4VMbW9BQNL
         oufw==
X-Forwarded-Encrypted: i=1; AJvYcCUTKAxSG+y+xvwmI077SCC06sVsNcRLjlFWX01YaGoO8n8Z7+ne5rtv9kT9S1Dp/CHOlsc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwqFxeZegQvol4+WymCAkTRCppsGc4+E3t5ety1bYMHKbVGc2Wz
	sXa5cGU8GWQLCFvFXVnmxVj+HTa/pReLcz4H1E3JhAuViw7uOHec089chHcMV4Q=
X-Google-Smtp-Source: AGHT+IHU3640S++GiWHY22g8DyZvC0xVaN2q6y5oxKROmxj3Ujh55YAboEOHGvnPvVceKb9fEiHwew==
X-Received: by 2002:a05:6000:784:b0:382:5af:e993 with SMTP id ffacd0b85a97d-38205afeb31mr11196763f8f.54.1731600102718;
        Thu, 14 Nov 2024 08:01:42 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-382200fe00esm1139024f8f.42.2024.11.14.08.01.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Nov 2024 08:01:42 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: [PATCH 0/3] media: i2c: imx290: Add support for imx462
Date: Thu, 14 Nov 2024 16:01:12 +0000
Message-Id: <20241114-media-imx290-imx462-v1-0-c538a2e24786@raspberrypi.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgeNmcC/x2MQQqAIBAAvxJ7TmgXS+or0UFzqz1YoRBB+Pes0
 zCHmQcSR+EEQ/VA5EuSHHsRrCuYN7uvrMQXB2pII6JWgb1YJeGmvvmgO1Ku8ziTdsa4Fkp5Rl7
 k/q/jlPMLm8rouWUAAAA=
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

imx462 is the successor to imx290 (and imx327 before that), and only
requires a few very minor register tweaks.

Whilst at it I also fixed the todo over imx327 and imx290 having very
slightly different maximum analog gains (29.4dB vs 30.0dB) and added
that to the variant structure.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
Dave Stevenson (3):
      media: i2c: imx290: Limit analogue gain according to module
      media: dt-bindings: media: i2c: Add IMX462 to the IMX290 binding
      media: i2c: imx290: Add configuration for IMX462

 .../devicetree/bindings/media/i2c/sony,imx290.yaml |  2 +
 drivers/media/i2c/imx290.c                         | 78 ++++++++++++++++++++--
 2 files changed, 74 insertions(+), 6 deletions(-)
---
base-commit: ed61c59139509f76d3592683c90dc3fdc6e23cd6
change-id: 20241114-media-imx290-imx462-b6d1c24b77b5

Best regards,
-- 
Dave Stevenson <dave.stevenson@raspberrypi.com>

