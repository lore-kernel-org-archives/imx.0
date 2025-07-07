Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028828C2B6
	for <imx@lists.linux.dev>; Mon,  7 Jul 2025 23:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751932008; cv=none; b=NoLxZ8xve+hr+8qDolX6TdotIdKMQki5CKvxQkQi/k/aiIJ0Y7fm9HxEl03Qa/XuFMrhiwVmD0jsE9uLmYinrtpBi7TwQ0P5mqbIjMumkHbXVGgqx1gr6Y96b1lP8BjaMXtkERX6TA6SoDWqBgdNGvc0U6QWX7Lhx69UqbU34ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751932008; c=relaxed/simple;
	bh=o3FVkmysu3tJXsHOQ6TCDKU9zD/cWySQyVScEurxVxo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UcT6MCCP0UrjtWI0LupgW2kr+YgdeuIvmFGOZWPo4WdSPC9xxZyL3n0XP1RavYGVyk5IuKZip2akkyDduIKXLfFHUdk4YcKtq3RP+l11SHzNEyfnbJkzQqsjAnoEv2u7pIxfpqgwN7nhdk+bUEUZq3BspTmNx5EC9Xy9qd8pcq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KxvINf+/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KxvINf+/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-60c5b8ee2d9so8243845a12.2
        for <imx@lists.linux.dev>; Mon, 07 Jul 2025 16:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751932005; x=1752536805; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/XPk1root0WuK7dRHLh7WX2PMH42V/Cq4joNrRdgfqU=;
        b=KxvINf+/L0Vzxm158R6sZWqow12cxyFvgVZ+ZlcRWxy5L2iLMQQ9oQ/APpj7cmYpsd
         3aZTJmeOPah8ofbeXi3kXYK+I4muU/7oxKyiS2uGr+tl+T6ehU/tIV4O9ja/HZYLb6nx
         K21Av+44201L+2ftahOkVy6diCoLWQ0LnY/ggWzXqyTCTAgyL3+BqTafplc0rVErfE0J
         Vbw21UGWhW6dEeLadfADCg1RRJLs3Lo1dEOzoFzQ4hHGkcLocE0PHnb9AUlw3kTT14Vc
         aeKQc3yoTZsEJsZ6QlqxFFy8qZNfcFkS+iNcQX+MDBpi7JtSzRlGJBdT3izjhIsx/S9Z
         IgPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751932005; x=1752536805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/XPk1root0WuK7dRHLh7WX2PMH42V/Cq4joNrRdgfqU=;
        b=HmXfepy9yqhyuDpBA+gQvzgQHi82FUWgLLgPm1wUjd+SuhMnnio4n9G3tgZ3ykjnXP
         zr8oxtsJxa6r+WSU2SuWK0gkcoxwm0q86QiMPadlKDbdH1DA4K9DTULkScTT7qQGP5dK
         xVRjjdmMvn/SX9Xm3jeSd2KI2oRFjRYBXD9dE+ewhEvc4mvEknNr1iKaO1VM1cG7O46C
         CL3tf4zk2m0TWVGAEGUiEa2wCoQCOp1wOFePEVzntrYqEyy016Iy/HFvlMQRVYBF1V4G
         lpEixWZXpyIzZfNKB2uip8OGQwOmisJZ79B7XwBs5WDXq7eP/Qo0mOcdR9qUmztv12CV
         7jNg==
X-Forwarded-Encrypted: i=1; AJvYcCUlZ8fRfSNEX5EovVIc5U+R6aG8LjI4Ivy2pF5l+kG+czywyhpVqBpmCxPld89DcmMZmFc=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxv2+RvCq9zMekAq667F8J3qVY8bDKkttGBqTZRBUZgVuu0ZRzA
	7K9WM5Ip9xvov5xmJyk46P2GeJMXxamHbx/KYzzIM14pvo9c0U+OxtrR
X-Gm-Gg: ASbGnctD1WXr+PzXeYvyHk/mTRkPiqi+4asinqwiwm0zHf2gKz5KTqIzoNjKjV1cHzU
	7cHAb7e13tohnUvlBCzxHMqiErhjwoFOok36ncsVopWKW0GScFMJ5AuB2MJJ6wA7Y70/OJKSd18
	XPMv9S2L4QvAvKRTUzkfungykbWEsFJwvOtruxjmRvYljjmoplcjaT2ffRtFSS4NJ1Ack7iegMg
	R0OFQA65ao6zl2aozTXEtWOHGnp1Y/0mcjSXEir9huNBjiIh2mDyxcYNjM4livtVFCx1KQSc62W
	iUUlDJxii038jMTEXbsPAVahCMTYk57logt1wZF6kukLHPJ7bUfQVpLwaaUlpcBs/DlpNDlyk52
	b0CEOf5rw53L9Ze+/krIAPOs=
X-Google-Smtp-Source: AGHT+IHg/S+OKZXPbczL7aJL0lISW8YY04z127Xz3XTz7Zqi0kh9ari/hi5JHoRcoVlD1C56s6ePwQ==
X-Received: by 2002:a17:907:7293:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ae6b0ddd818mr93226566b.29.1751932005103;
        Mon, 07 Jul 2025 16:46:45 -0700 (PDT)
Received: from playground.localdomain ([82.79.237.69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm781539266b.7.2025.07.07.16.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 16:46:44 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Mark Brown <broonie@kernel.org>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Subject: [PATCH 2/2] arm64: defconfig: enable i.MX AIPSTZ driver
Date: Mon,  7 Jul 2025 19:46:28 -0400
Message-Id: <20250707234628.164151-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
References: <20250707234628.164151-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Enable the config (CONFIG_IMX_AIPSTZ) for the i.MX AIPSTZ driver, which
is required for platforms using the AIPSTZ bridge (e.g. i.MX8MP).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 739b19302865..4d7a60444bf5 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -262,6 +262,7 @@ CONFIG_GOOGLE_FIRMWARE=y
 CONFIG_GOOGLE_CBMEM=m
 CONFIG_GOOGLE_COREBOOT_TABLE=m
 CONFIG_EFI_CAPSULE_LOADER=y
+CONFIG_IMX_AIPSTZ=y
 CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
-- 
2.34.1

