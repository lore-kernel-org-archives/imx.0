Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7A9E1D9A79
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075254; cv=none; b=G03jfirHXBnV3cTcGD7S69nfa3C4y7jU3gewp1nppMoMUWiBz94l/jNzQvqYyDuZlbDcZ/pSNjx+XYd36R2CtoWeccoczLqE/m8hg5iYdBwfJkJmi7FrFGxJIiI2h5tN4y8y6w0wLBZQUouyVMY+9kO88d+/PTR1Yk+f0CLpr0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075254; c=relaxed/simple;
	bh=7IXa6n6R8jf8EtYbD7eJtuKKeIWgvUP8tyBiBe9Mka4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blYPSBCILWceWw8LN/X8kBBdQp+rmIZlxCUdW1PL9dKdLhLBbOf01btveu3oUk2zud0g4okAGIZP7SW07VCQrk/felS06/2ZXy/lH46j3eSR//D110JlRk1SmzzWo6+bCOrc3gJNoZD7g+LiaiBiSwSVTMbfCWAoBRKn9tlUyZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=AqTed+Kt; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AqTed+Kt"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa530a94c0eso568598066b.2
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075250; x=1733680050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m3DWv5cRaHU4Io1NaeAcsTV4k9nDv9YZHhdkDqWmPyg=;
        b=AqTed+KtPYY9/pJh+g6uTpgos6+5nqQYe+h6wZDQQykCUeVzeb58NggowLJCXFInIq
         c9HCAoSha/D09PxX0BIhM1xEShh6SiLlcvxRnLc5aZkrgfhpeW9WcWY1u/+pooai64Lb
         yBTv2UuTTHIkwDTx8WDz+5PTd8SN51zjy6gZo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075250; x=1733680050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m3DWv5cRaHU4Io1NaeAcsTV4k9nDv9YZHhdkDqWmPyg=;
        b=V0NeJcCQLZgWCO6Ct4qQqxHjvIJnCBDah9c8BLUelRoShh1JwLzJ5nxStdp+O55sFR
         A0x7Im33wsNLRAVBhO6gJ+4+GJG23n2eAkTW/AWivbQ9ZBEl9fc+IRFdOoqoewIoia5q
         2WHATFyqCethYR8cO4uoQkJ3gIjIYVWsggTQtINFQedPD7Rp7Zyu25SUKKegKJbgFt5D
         z7mvPgUUBpvvcVmLT26KLft7QtCzNgUrDxNYQxAyzegC+2hImNM3QdlT+8DEF2fabrZk
         lbi0TNQhB9ghCHFx7khsP0UrL8vCRiFiOVi+muAtTM/vpHgfpe50QjkxW8yVB0Njmd7t
         VmOg==
X-Forwarded-Encrypted: i=1; AJvYcCUC86C/psOXX336zj/0lu8lzr9lcoz5sb57Fsy67h4EfSsKcSbHY0QmY9klzo4GcROfK+A=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx93CQ0g7Y4gtDaIqHq8TxSutkyHsYjfz3XC52+cBOVM2IYdm3
	0/9Ikj4sjrhD8AqEQjc3zmv13amkXj4YPPhVgK3iPfPpAQni66yCTujVNvCsGYk=
X-Gm-Gg: ASbGnctGmqilAl20eD7tDVXl3w3TwSxAY5RGh6no4GBpA3diuwzhxRx5r7b1Lo80kuW
	VgyHLy3D/aBr2pM7wY45RlmsZSBFJGGdpz3kieWyrCAo4dHhCHwaxKY7ixoT/DIxOZ+CNVgFGe4
	HqHfz7Mj9AxM1jXrGatmuztTHG2HR7t6a98jsz8SrroBf+Hh46ir3BAbyeeDe9wa3YBv8sDVWYR
	TSQ5BmnXRyDWahqA141/jPB9uZSpfd5YiTEO2eGG4FUZiWntUx29v8QjDtAdeNR3BD177I9KIc+
	nA3quPuwVddj4NqDNUuYh2DTdDqT91oxdgaPo2ONns0yeyp1MmVBbKEmQhITjPs9oF7l+xTMy38
	6IJWq1nqU0CvGiYbs
X-Google-Smtp-Source: AGHT+IGjTr544po85HL/yFGlp7Fz9SND5Mszl3n0nyOzsFi4lUmL2IW6mDDVfOELB47d4l21pa4qgw==
X-Received: by 2002:a17:907:3f9f:b0:a9e:c267:78c5 with SMTP id a640c23a62f3a-aa58108aa97mr1582174766b.55.1733075250065;
        Sun, 01 Dec 2024 09:47:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:29 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 07/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun,  1 Dec 2024 18:46:07 +0100
Message-ID: <20241201174639.742000-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

