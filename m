Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C861E834B
	for <imx@lists.linux.dev>; Fri, 31 Oct 2025 12:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761915069; cv=none; b=Iie9dDiluDSBDrkHBLIBXt+xHQ956TzjcSDPaiZatJy+Bbm+vl36eSyo++t2GWrz+4jBXbJLYYBieaQoNQH0rhDeKfxyk6AddfBeNRCtq4qXir9KXw4xNWADgJ9GMCHvs2RRS/NZq7zDQ0ufW91Wx1b2SefIqxdF/E8j9tji1aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761915069; c=relaxed/simple;
	bh=Ug8IOVgjasY3stOjuvtaJgMJUnmgn94MwSPp4Jf04B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n6uSzyEdbJPhDPJOlh8Ca3s/1BdGkI5Is7PZd2gGZOye4L8LmG94HV6U13kSXufWhkRfhKRBPH0ef7aqezo/ksFtxkD38d6kAMziWc9iTkor1TRfs0i9HJVmJwjNlj9GvicZcYvvzQq/XjZYLgZh7bPE38Hh1c1Yzbmqk4QXNyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gr5ndaEp; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gr5ndaEp"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-471b80b994bso27762385e9.3
        for <imx@lists.linux.dev>; Fri, 31 Oct 2025 05:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761915066; x=1762519866; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=84OopfA9mZxUTjhIOMCRmTS5zKmOVI3F35SNw7q2yS8=;
        b=Gr5ndaEpVogeF9iu1nsF9JbrMAYqFFZo7UZrXDWJheVsWnJxzv+1DHLQoWxrcUtnQv
         I5IFRssjPenw6Bk9H4wGJNMYTkmIJI9ZmF+VQKUH3D+opDwAcKQIURNsdqskNerUkyb7
         kbF91ZWLQP3lwcfSiYz2WXeucfPSZN258YzEEgUsF3LzpTTqyrEyXgeC+J3e4maOuyGJ
         TYyiM1lMXu10tqMkErlAI0p+NtGuoUqAziuQVkUP2axG0/+XDbcr73vkufHubL0g4a01
         2PUrlC3qRnaikTwZ8OGvvK5mOoAMHxrix4wt0l5aGvjGxp/sHv87iFXQOfJr2Q0FEpGg
         FV3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761915066; x=1762519866;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=84OopfA9mZxUTjhIOMCRmTS5zKmOVI3F35SNw7q2yS8=;
        b=a4LD698b/Msv8jRFltrCyZFRVqZZiQF4B1lMI2tiaRQvJDtt0bmtaGD+pcoD77RfO0
         IAVeLuvE1Qi+b/oCCDOF2xktoahqccfpGDm6Lz8W7duik1ADgWu+Lm28lz1IhPY+xi2i
         gBOMRVHiHJ1NQKrMbcF8oV4wvUuy5FgENafsENWqxIjplQe/H/y/pzv092YA+h3wV1ep
         zwTaHIydyQQUoGk/fnuUWhfc0VMkrg8MuXnDdFY5fQ7lJqS7S8tUQNc9dBG0dPP2t8co
         I/n9TCwv3lrpzvqp1fLn/br+d/0Kcqlh8yIxKlk5FVkWSKb1bP55u2mCkcEcaCSUyLX4
         xRsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmqZW2QET+vBOL0fn6UkUL/JH2mETCtksaHCVtcEvek02epyW3hNaifFSuQ9jelvERtEY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzrkovxMuqbsIWRMI/WCN9s67DFBgpJEGkrAN5i90QdWx4pMeIt
	qWRbk5pXN59eTxpwUqxXN92cz28m7DcClOtlxAA4mCv9FIyr8z+RyWwX
X-Gm-Gg: ASbGnct+vwWQ+S8LXaPAbCZOhsrKCXJEoPocfz6hNU4lnEDOYlWALwj/+nUoR5JHoQE
	g395fqx1prB/AvQPWXKiHuIkPDkJ9HDaBYxiFlIqGKEwHjxWneLWJ+fQcxppWo6RS79ReatWQlJ
	M9qkwOTCxcSJlyhKzwcg39ge9XWuZGUdgaGIfGedavh04hB45TjChSfPk+ysDHUWU6J+b7WcKEp
	dmMh/y2I8mhZAo/ZHFIqzgW5qs7eeFYO5UEHTl8fu/NxNJGmLL5SD6bbl8sdVOlGd6hikpjoz/2
	SFSCU1c7z7UhiH8wNxFbQt4syXuuNVSC8qn3WGjbgdkInHD52N42WaLbku6WTGaMIY/eGMeByLt
	6R4wBWF+qENjMIhAri7+nm3yEXCBO7+n3XP1I7ZOmlA0V34+ppDVbHPfc+p7GPW6txU/98utJRw
	ESVoY8IY5F4hNN1TUORfH8vb5ebZfXwKQaMLEPe8hMIikOHQvlflNCUmGdYgJkcIZ0p3mTTCcQ5
	mi3rGSxfDwyEbcW
X-Google-Smtp-Source: AGHT+IGB0cRZQfP//mvz/xRWB0n6w+4bOdOBWvxAmCGMTwbSqhPC6TI42uARNBDnwNWcdV2q2zNChQ==
X-Received: by 2002:a05:600c:3e8f:b0:475:dac3:699f with SMTP id 5b1f17b1804b1-477307c1470mr32473225e9.9.1761915065568;
        Fri, 31 Oct 2025 05:51:05 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429c13f1d4csm3144559f8f.39.2025.10.31.05.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 05:51:05 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>
Cc: Philippe Schenker <philippe.schenker@toradex.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/3] arm64: dts: colibri-imx8x: Add backlight
Date: Fri, 31 Oct 2025 13:49:41 +0100
Message-ID: <20251031125003.275033-2-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251031125003.275033-1-max.oss.09@gmail.com>
References: <20251031125003.275033-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Philippe Schenker <philippe.schenker@toradex.com>

Add a backlight node to colibri-imx8x. The node can be enabled from
an overlay once display output is implemented.

Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
index 8e9e841cc828..318fe4db1b64 100644
--- a/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi
@@ -3,7 +3,21 @@
  * Copyright 2019 Toradex
  */
 
+#include "dt-bindings/pwm/pwm.h"
+
 / {
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_bl_on>;
+		brightness-levels = <0 45 63 88 119 158 203 255>;
+		default-brightness-level = <4>;
+		enable-gpios = <&lsio_gpio3 12 GPIO_ACTIVE_HIGH>; /* Colibri BL_ON */
+		power-supply = <&reg_module_3v3>;
+		pwms = <&adma_pwm 0 6666667 PWM_POLARITY_INVERTED>;
+		status = "disabled";
+	};
+
 	chosen {
 		stdout-path = &lpuart3;
 	};
-- 
2.42.0

