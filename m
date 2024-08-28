Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BF48166F11
	for <imx@lists.linux.dev>; Wed, 28 Aug 2024 09:56:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724839006; cv=none; b=aNdMLJtgWZK0anqb5vQaXto9eJLhXrRewFEgjm970WK/P2wwZhRvgO/mr4GTAq5AD029vh5w+ykVFUXmzhujaJJWKh+9ixeNQfO7Ke6Noi5G1YeMtPEhoV4j86Zw2HXawxDPLXR5vxUktB21n6XCI5+HflMzXjMoyFBW4/gAFo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724839006; c=relaxed/simple;
	bh=/q8OT1FWSBwzCT//B0br1m39zEk9o8WylV6bm/hG5oA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AUvoxUQwvI4ZlqzuKZ/C7KSElh0pACBVGiVXTWaZn5W6A7uDB3lR3G0m/kZGencbDjcOISP47t51MVR/zQfz+Td1qdk0UZvN5B/afIgwPQtz7lnKMgn9y1SD7iSAHCLIV7ODx+XzgMDT0EHgsn4wRdYC04HAusfsmMEE4sbi23I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VZzQKT0y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VZzQKT0y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-42808a69a93so9238335e9.3
        for <imx@lists.linux.dev>; Wed, 28 Aug 2024 02:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724839002; x=1725443802; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5WSp6pvJuIICtYedmtvSJ2tIfRwNKUKk1n83ZQ3MQfA=;
        b=VZzQKT0y5qhK2YZ5EHQ6hx8lg90+py364ZyMIn9zk96mOg4TKu7JHUfofnKiPLbjU2
         mARo46Sv+CrJCJ4Op0Z0zgUEyGZNg0rclUFRVbkYstiBUakKznnbDlBKFg0qkdBZ+pDH
         m6i4jWlgS0xmtrAs3QZnHHR3AYigYFyuK79yekpePpTlJZqry9qtmF6nmpaO+ttVQUrg
         DKdh572JzgjK8JRYUyCXLBS9uPkpTrBYusCT9vx/hPskAskmr+0+K/7QtEKSx8+pVPbM
         z1t3CLsYIf1H2fNWj1FRHj3m6RBVwBVedix1Fs9+ef0SQ45+N8glEslCtaBZRNa7U2za
         +6Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724839002; x=1725443802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5WSp6pvJuIICtYedmtvSJ2tIfRwNKUKk1n83ZQ3MQfA=;
        b=OYyFJK/wLqWMPwL9YmNv9/qpKVBNSsM8umA4sTk/Tmdo0ckCoHZgllz4EgZGNjfOYt
         OMNhTEdl8OO6Rqfrgg4A08jG7QLQDUSwXQx0yzMN19GfUvDjjWUl5gOpgMMPnq0CqgEi
         BPdZp9vAyRAX45cHtaa+utlqSCMY9xc2WeaI4+kHJiSdwbEJXQo+8WHS5xudb/5nCk7f
         gUsaet1ukEweXFAwWoLvFJtfOgWAWRsSY6K8/NWxXv+WamcwTqCHUVztxzgPL4CWhgN/
         XAgr3uJ+6ZGoiiQmePJ8GJGdlLMJTjVxo6pFGNfjPcKlc8/IAq7jofAWNr71jiA8zpAy
         bOpw==
X-Forwarded-Encrypted: i=1; AJvYcCUalOxf7lx6MTGcYszyRYbk1HMcUJGQnSL3pyBbR8mM5ADT3trMmQHNDejiXR/5cWQWfRM=@lists.linux.dev
X-Gm-Message-State: AOJu0YygTb4QmQwuzh9jlTSnZRRhY3V6WE39sH/S1lNrZXcxyIoj7cWn
	SGT9hLyG8EkAMzqrb+ZpYKgT7G77+3bdsotKgDWp43EIldNhJMbRqBYLs2Sidn8=
X-Google-Smtp-Source: AGHT+IF+144nf5k6UKXIDPS3oYva4FiN2THGmZe68YwifvRzugslieNG8gx/OXdLJ66KxDFPkZTvgg==
X-Received: by 2002:a05:600c:4445:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42acc8a55f3mr70266565e9.0.1724839001611;
        Wed, 28 Aug 2024 02:56:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3730810fb33sm15067077f8f.13.2024.08.28.02.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:56:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/3] ARM: dts: imx7: minor cleanups
Date: Wed, 28 Aug 2024 11:56:35 +0200
Message-ID: <20240828095638.231569-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Few simple cleanups. I will follow up with imx6 and others a bit later.

BR,
Krzysztof

Krzysztof Kozlowski (3):
  ARM: dts: imx7d-zii-rmu2: fix Ethernet PHY pinctrl property
  ARM: dts: imx7: align pin config nodes with bindings
  ARM: dts: imx7d-sdb: align pin config nodes with bindings

 arch/arm/boot/dts/nxp/imx/imx7-colibri.dtsi   |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7d-nitrogen7.dts |   4 +-
 arch/arm/boot/dts/nxp/imx/imx7d-pico.dtsi     |  20 +-
 .../boot/dts/nxp/imx/imx7d-remarkable2.dts    |   8 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb-reva.dts  |  30 +-
 arch/arm/boot/dts/nxp/imx/imx7d-sdb.dts       | 608 +++++++++---------
 arch/arm/boot/dts/nxp/imx/imx7d-zii-rmu2.dts  |   2 +-
 arch/arm/boot/dts/nxp/imx/imx7s-warp.dts      |   4 +-
 8 files changed, 337 insertions(+), 341 deletions(-)

-- 
2.43.0

