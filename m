Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8919C3CAE73
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 18:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774288840; cv=none; b=DubdZJUAbCLMzFWJekDrKzRxB9Q6aQFny7jEVE5JIxsSvwCwF3yNDXGOJX6Bde4YHcBF/XuKFcjYcu/DfrjRByQF5N4sFVs7hYhf0pXRcfrVEyB6zwMgyuZBr/NO1fPxND1rV0GnimN4VNKer1FySSddFDjGAoUzJwRqeR6iTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774288840; c=relaxed/simple;
	bh=bmimCA8H2hEtE2aKOouwiZmcnAiFz588K3Xf0CNXDqM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iTEqF1TTtEgE6nmklBO6p9LEd6toQMk+Ivh3l2V/fZCOmKUQ+sTxhRDkyxmToxNT6n3S4IBSNXU3iTqlPJmLu+TXPEpmCUwaqHoPe+rdU6OyXZv9W9aRBEGWSDc9wxr9naSVhL8bzkz53sbPKyWILqDDILEZOMHimR+cR1jpFRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MFQxFLWt; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MFQxFLWt"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852e9ca034so29370635e9.2
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 11:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774288838; x=1774893638; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=MFQxFLWtaSQpuuRdLBsiSIz/juK4Z+rwHh/AbBms8+jlX47SkdbmpP0Luj7Kuf2fC+
         S1Oi6/CsKWtAhbTTwr1CALFS7REG9MpvkrQ2ZQCzHHfifm5XtmLfvVRiUmjtW5hB9OG1
         Q1TlXXQOXEwnobl/FmMgZiYy/ZewDZPVflQMXqQSExorLb1z3We3Sd62MCI1jc8FDCms
         UUhcl5hMYXbHtPwLjDIeBAQ+UvC5Ay762hM4UHMMiyvRd37d42i3dzig8lNmUDVwl3pa
         fzsgwCtSnLxIq0Z2SFyEiGGWPDrqcSLd0YUarLRQE5NObVXCWNbLovERITPs1KqzIBGr
         PjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774288838; x=1774893638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=TzWuojaBGLKVJHY7p2kJmLWgMGH/xOS17lD/ooT1wJftEGkFuZj18boIKrJ+Dii7gN
         yERqX5zy4FgmqXNN9ZZlcl30SvgQU5kvKjvV+f6mTR8wIiByj/b4K17pOE0HuJFdNd6u
         lmKIPaVlMEMo4skSk688aTkkBDFsTJJXFab+oKhDLXC/XIBhNpl0RK9tEQhIuRj4cvyR
         XjoAcpJi4ETAk1R43Xl6lwYmZY8CLmhbQhs5YzDgrvV1rgevMcYd9QQlTetiyKUUzoTq
         0khZYeAn87eyvHxYmK4AObKFpGO58YDRnvZw1ddoqbnTCWN+oDF9TVxrLWk6fSGEtN4+
         cM9g==
X-Forwarded-Encrypted: i=1; AJvYcCVHDo6jfKatfrShYCs4A6ipFXybByBuF6L6iX2uE3qyfvblQ5E/1KkjISVwyHE/ByndcPA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb6Ge0lQewqP6zpR+JsikivShj3q3jfYXyyQ2aTSNYfHYVpM/y
	LVbwcbM0iNaOt/hnlhSr/xHxXEKiRHez3pf1vDD93ydPsJqjY+0HAQyO
X-Gm-Gg: ATEYQzy64ByxRhYvgCA7ZqKjk6+xWIFZ5AYOiFiZOy6eVqSmbdav8vvrMtngCtFw5xK
	Y0eqprsv+loSFhp6VeSlYz9/E7psq7IEPIiRa3z9tYC3H07d+UAmf+ggAvZqesDRSBSgL6Op37j
	SzztqWzSYpT+a0zWvhUvPyxN1eBAf2OP+3bDRQ3ji28KgcRgM800W+04NxLfIPyiIWtupiuqFtw
	hhqRlpdZrRQRXMqUbl5aSjlKJAIdYYe4pen0QsY0ex3Qi7UZEpkisyKyXLrUEtEhCKf37c9YT5/
	G/bcXGijyx15urKoXotx2vr/WetMHfSu1JPgOfaXw5Mv1rOS45ZRD50N2CTUvuCYRkvOXHmLFcb
	1bhJc7MBwHfCtVS0j3IacbWxrGllOyQUJGR0StYKfblC/qH5Jmbj4dfzLIqvZHljVgt7pXBF4mW
	AjSvzrA4IY9s2+
X-Received: by 2002:a05:600c:8b24:b0:485:3dfc:57c with SMTP id 5b1f17b1804b1-486fee0fcf6mr185652555e9.21.1774288835808;
        Mon, 23 Mar 2026 11:00:35 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486ff1d3befsm84419925e9.32.2026.03.23.11.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:00:35 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
Date: Mon, 23 Mar 2026 19:59:45 +0200
Message-ID: <20260323175948.302441-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323175948.302441-1-egbostina@gmail.com>
References: <20260323175948.302441-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Technologic Systems TS-4800 watchdog node was previously named 'wdt',
which violates the core watchdog.yaml schema expecting generic node names.

Rename the node to 'watchdog' to fix the following dtbs_check warning:
'wdt' does not match '^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$'

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
Note:
* This patch is part of the GSoC2026 application process for device tree bindings conversions
* https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

 arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
index 5118a68db..3610ce395 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx51-ts4800.dts
@@ -155,7 +155,7 @@ syscon: syscon@10000 {
 			reg = <0x10000 0x3d>;
 			reg-io-width = <2>;
 
-			wdt {
+			watchdog {
 				compatible = "technologic,ts4800-wdt";
 				syscon = <&syscon 0xe>;
 			};
-- 
2.53.0

