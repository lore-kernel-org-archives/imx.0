Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 138ED31AF36
	for <imx@lists.linux.dev>; Fri, 14 Nov 2025 13:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127505; cv=none; b=YVwdpvpvdegF9vFaACvmhx1Hlkme/dApHeHBVcMeZ3Ddrwn6cdtYLwlfcXWKgi4drXq0hiN2XGK6fX+roTU3gTqJe0s3CX5aWBu0Rm4M1ACrj8Gs/d9TdgjiGhgnQKyDXJqOJIHFn6UJrecReMRotRTGcCfM0tp7sjBu2Pc7g4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127505; c=relaxed/simple;
	bh=26I9GTLb874hLw2vCdWMdaChtt9DDDr/+PTVQhi4eJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dRKkDU8DydoQ2BQzAfkr14CU4g2hyW7bkZSIMFgBrD3Y51wdr4eVqaVrb+gixDVwlUI1G1lvFeZNcKnpLXf9RSwogi4rsbP7pziF+n4NTDpM+zbPm/kVqYrNKCPEppAxFRgma1mXHz/ujGDu9xyv2giYIjrB+CEhhdv0qtP5sIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IQcsIAry; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQcsIAry"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-b735b89501fso176323366b.0
        for <imx@lists.linux.dev>; Fri, 14 Nov 2025 05:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127502; x=1763732302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWdQjfJEv17Sa7ZPlM69WVgkJ4xrrn+SVmA6eSQkM3w=;
        b=IQcsIAryWGKkVbUBQu9kD29+ZyegYK6pjr/o4sdogR0mmL3cs/5Cdh8JvicLUlBGxJ
         HmEwHQlQksXh0NYnR761YDyr/AyABBaReeU9serlQJ+qkT9bg4wcESZRCEUUguU5mdeq
         QvhFtk/KJYwzUK3zxZ9v9Y2XrQtdtr7zVuoLS73bLB0rGrHYwLveCsJlOfAeR4rbacFq
         lsNdoWgcDnGsfUPPdTnq6TnEQ9tM9h6thCkJN8/8mIIp++sgfwAoCIm0gp6K/Vm4a/NZ
         CiS8BMQCHbxewCwMZouuUFf1/0V8MaCZHfxXwOpKMRRLgKqPU3aLxl6CXiZNqbAeUt6Z
         u5TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127502; x=1763732302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VWdQjfJEv17Sa7ZPlM69WVgkJ4xrrn+SVmA6eSQkM3w=;
        b=hS0MeSyMRGWxmZrhF1zxvsbKqu1lT/+FtN3DS+jgiOc8D0qL/Q6pz3ka3eTTdMUerX
         K6xHCjON31PUDIKUENrtJOYnzt2sSx5bozzcwBJXe9MG+3MPXXiPLEFmK4z1o2rwMK/3
         Vw5c09/Zbe4WLBc75Q9JL++b64AjIL/+ariFKt3qcf3S3qB9ViVy0FJ2M0hpzuvP1Wao
         ascjWrQ1EoymUAXzfIXjDx8AQB5r6EOf/ssM753eQLsoKCa/RcwD4PcdPKAaFqEDHUD/
         tp1RKOaIvoTTHcRO2X6/lr7Es3hgGnjE/dszoqTwBl5XFUVIR5EOaLJ8iQX/phW0hSFZ
         cl/g==
X-Forwarded-Encrypted: i=1; AJvYcCWSE9KsJKhWNMMi9GlRhycsrDc274OwYG8iN/kgRD5eD39W4hzVT/8WPDx9QaQWhKzG/o8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCZU1KId5m29zhLKsJNjLveTCT1XuH83vhWOgLUC3G9Q7uavs1
	SVPmLFey/Bu/GW3ge3JCBUWL7K5BdUKu9gYF81b7iMH2TsZ9A7+2iVXD
X-Gm-Gg: ASbGncv9uLy7osqrreRwr6q0aJmoG+TrNjicq9EAEqPQjvOjmklGt+s5kLl92sw75Q/
	oKTT4PrBsDMrpoL8WXxw3smRcw8i3iHc28rKzWfKa/EyJpWVUFflaKCys0dZXYfP7RHZtQu31ib
	YGc3rgwN0WBEnnFH2ACv3jil+fyH0eGdArZP3v3etqhKaitKArhTCYJck4C10twME5ULzuXN7Df
	Aw3wj0RCjYtc+8KoEeqScP2DStC54jB5yQLtzrrJBywox8l6mp4IVXKLniDrTayKbaqXz4RlgAl
	kL9ay1U55oLKQpm8cTrqGYlrtYHDs8nvsvJR285FgiRLYnkWCnmxcSO5twIwBBqEyevfmb7h4BU
	0tuJpmOOHfEpZI3DmnUFvo3fI16MmnhztWFmX2EJUg5vvi9+2a9ev6RL2u+eErZJvxRvxaDy/O1
	jJJFZUa68V3aup6hctsZ8ykU0AtKb7vzeSGNfq0A==
X-Google-Smtp-Source: AGHT+IHL8SCZliSxbU3IoQx/aVhNRnS5pIg2oX9HCryB27tJyt6t44B6IxSN0UhqL2jYg3FBXXfTZg==
X-Received: by 2002:a17:907:1c81:b0:b73:42e5:a59e with SMTP id a640c23a62f3a-b73677edb7bmr274842566b.12.1763127502138;
        Fri, 14 Nov 2025 05:38:22 -0800 (PST)
Received: from SMW024614.wbi.nxp.com ([128.77.115.158])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fedb2cfsm385330666b.71.2025.11.14.05.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:38:21 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>
Subject: [PATCH v5 2/6] reset: imx8mp-audiomix: Replace mask with bit index
Date: Fri, 14 Nov 2025 05:37:34 -0800
Message-ID: <20251114133738.1762-3-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
References: <20251114133738.1762-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Replace the reset map mask with the bit index to make it clear that all
reset lines are managed by exactly 1 bit.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 drivers/reset/reset-imx8mp-audiomix.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/reset/reset-imx8mp-audiomix.c b/drivers/reset/reset-imx8mp-audiomix.c
index acfa92b15329..d993c294c548 100644
--- a/drivers/reset/reset-imx8mp-audiomix.c
+++ b/drivers/reset/reset-imx8mp-audiomix.c
@@ -19,24 +19,24 @@
 
 struct imx8mp_reset_map {
 	unsigned int offset;
-	unsigned int mask;
+	unsigned int bit;
 	bool active_low;
 };
 
 static const struct imx8mp_reset_map reset_map[] = {
 	[IMX8MP_AUDIOMIX_EARC_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask = BIT(0),
+		.bit = 0,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_EARC_PHY_RESET] = {
 		.offset	= IMX8MP_AUDIOMIX_EARC_RESET_OFFSET,
-		.mask = BIT(1),
+		.bit = 1,
 		.active_low = true,
 	},
 	[IMX8MP_AUDIOMIX_DSP_RUNSTALL] = {
 		.offset	= IMX8MP_AUDIOMIX_DSP_RUNSTALL_OFFSET,
-		.mask = BIT(5),
+		.bit = 5,
 		.active_low = false,
 	},
 };
@@ -60,7 +60,7 @@ static int imx8mp_audiomix_update(struct reset_controller_dev *rcdev,
 	unsigned int mask, offset, active_low;
 	unsigned long reg, flags;
 
-	mask = reset_map[id].mask;
+	mask = BIT(reset_map[id].bit);
 	offset = reset_map[id].offset;
 	active_low = reset_map[id].active_low;
 
-- 
2.43.0

