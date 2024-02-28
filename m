Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB98113AA27
	for <imx@lists.linux.dev>; Wed, 28 Feb 2024 11:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709120270; cv=none; b=TBqHepjunbda1Jjj/HnxI8Zm9dUghTmnMiYPu1mT1o++ITLbJGpEM+KCz3gw3NrdT3lkIVgvWN7RL85hFG37a16WcZHlKsW8iMZhjjTOpKk8Yr3WgLpd4+0VRcuN6T6k2E77rh+VdWxtIipar0RsNqfWSNouogojHzMnVVCfNf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709120270; c=relaxed/simple;
	bh=FEijyJYWtEmQVABgrDhnznqkp29AKzk0XPKscgxFVJY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HpJgct4mSidEIpEYz6E/NJUOwSycYGpqj8Xw9yxaTu4pHCkKLhNCA3Fhvhn1CLFYEk/HSFwWs5bDZje6nHBqx6HACyz/DtWVHYMs1gmxeJlCjrjT85aNRB+zTT8o28W0i+UiwSmJP9upGDDgLy+9FOOV8TABuOigBu4HhzirsLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BrrmN0ss; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BrrmN0ss"
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-7c76a566218so252334539f.2
        for <imx@lists.linux.dev>; Wed, 28 Feb 2024 03:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709120268; x=1709725068; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VjHmD27Zn5f9qcl1J3ud5c045eXb4S8qmKaQOkxlviQ=;
        b=BrrmN0ssgO6kDKHgF4VAxh7Qew3k/am2D/DUFhhzi4xFNOl9bpcQetWUZyzDaKJ7m3
         Rs5Ul5HHmF8n89gjS5durmxvqekDQDlLcoZZfREke8qYK9Bkx5+vojGICrB9NSvAyD9s
         i3wPhzgi4NO4+UXE/Nna4bYuLp2Q4NKMMTgP8i6Gw6rFC4Uis9oTaNtanW3U8stDNMUz
         QQ4tjRW3wIC2mCPURABSao2P8fuKRp20Dt4n9xcze44niu/o+futxMixx+hiuXWe4WkR
         RrVdso+iyA/yjxXIZ9ve+dKfTy5ZJtq7JtOA71DkszyixXbYwbsO1KSy0z65PfCbGmoh
         nAiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709120268; x=1709725068;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VjHmD27Zn5f9qcl1J3ud5c045eXb4S8qmKaQOkxlviQ=;
        b=Qn2XRPqkVRq0W2KqNE3pffZt2HAsxHk0YzehbUT8A6MPtpv97PtXc6sjQ6cZyFBITC
         QnmlimYjFa1mzMAvpE15KDYSF/GUxKF4l+vAAeeeGwJGA+vVWd0Y2oid0KkLBdNH4DeA
         SPgf8mX2eqGqnhxz+Mo6RO16kbusLBBxqFuMfh+FRf4OxkJWn6nzyllHHHIvBnPbsm61
         qTMXJKAdM0jwrngaQl0+YOkqixdwodj4q9+GHBOGjir74/Op0KGAwqDZd4nNeOZH93zm
         S+aflb214lBbqzASptAl7FypJmnqxPA1lZH7FNqP55SFOElvgySa/lZVQ+Bo+Mp/rp+J
         Ktng==
X-Forwarded-Encrypted: i=1; AJvYcCXbkJH20WN9zGRmc5yT3KN1Q/2JxzVa9pMzhFOrhyP0P8TjnakBCOqvngDvgkhmXRLevi2QLe+fK20Sl7EquDgZHPq2
X-Gm-Message-State: AOJu0YwsqwQloXp+XAUsz5ZPBgDgpnSdYm4uQQpydv3SICr0kVlJW3CO
	mL1P04F3zj8YbpvbLXFji1DjrZz7ycH0fWs6YU750BlsS3QI2vjO
X-Google-Smtp-Source: AGHT+IGw+AwPTdvF2K2zzuaTTuvgEgfn6uZbhI7INlVZj/9AQPcv5DRB1Uszb8mE8Xlc7RpERydtsA==
X-Received: by 2002:a6b:7219:0:b0:7c7:8b50:fedf with SMTP id n25-20020a6b7219000000b007c78b50fedfmr14907652ioc.4.1709120268020;
        Wed, 28 Feb 2024 03:37:48 -0800 (PST)
Received: from aford-System-Version.lan ([2601:447:d002:5be:abe6:89f4:1061:8343])
        by smtp.gmail.com with ESMTPSA id k6-20020a02c646000000b004747d876aefsm1833147jan.6.2024.02.28.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 03:37:47 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	Adam Ford <aford173@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] arm64: dts: imx8mp-beacon-kit: Enable HDMI bridge HPD
Date: Wed, 28 Feb 2024 05:37:36 -0600
Message-ID: <20240228113737.43434-2-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240228113737.43434-1-aford173@gmail.com>
References: <20240228113737.43434-1-aford173@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DSI to HDMI bridge supports hot-plut-detect, but the
driver didn't previously support a shared IRQ GPIO.  With
the driver updated, the interrupt can be added to the bridge.

Signed-off-by: Adam Ford <aford173@gmail.com>

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
index 8de4dd268908..d854c94ec997 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-beacon-kit.dts
@@ -405,6 +405,8 @@ adv_bridge: hdmi@3d {
 		compatible = "adi,adv7535";
 		reg = <0x3d>, <0x3c>, <0x3e>, <0x3f>;
 		reg-names = "main", "cec", "edid", "packet";
+		interrupt-parent = <&gpio4>;
+		interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
 		adi,dsi-lanes = <4>;
 		#sound-dai-cells = <0>;
 
-- 
2.43.0

