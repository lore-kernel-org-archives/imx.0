Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFFF33B951
	for <imx@lists.linux.dev>; Mon, 23 Mar 2026 08:48:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774255703; cv=none; b=aQ43OtksgCzT2rLSZdge89c09LZrfC3bhkM3aUJyhSOxgMUIym7Tm26mql9QNjVceN26am9VzyWdkCmhGsftnNyNw3P1eHxlrl/rdpzYgD9Y8hBDRaHSDPbjspo8AoP2HyiKs8zerAzPKOdQONjw66slC99aCjoRsSiHg6R2fv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774255703; c=relaxed/simple;
	bh=bmimCA8H2hEtE2aKOouwiZmcnAiFz588K3Xf0CNXDqM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XfRmiR1AopkdM4FKzZTCcj6ryGwGEBwri8YN+in5EB2Xgbl6qTlkVYn/5LI3RrVYDa8lDpQ+8O+7eT0i5w4w+OhXNMsq5P65Zk78avB6bFWy2spGCi4FLIhjeWoMfiAIkrrxSnQpWYyD0DXhu7Lpp6f1beQ0+rWz9BAZ+bvgAw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aqwo8zS8; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aqwo8zS8"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-483487335c2so30197225e9.2
        for <imx@lists.linux.dev>; Mon, 23 Mar 2026 01:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774255701; x=1774860501; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=aqwo8zS843h/HYj1jdaon8Bc60GjCTYNZBPzQVYJKrUrsD6g0GRBEVnUkr0WcOiysD
         e6fvwqhzX5kbypKbk1z4x7eWMKO4ixFax0eJt3mY4atUQzMnuHNOQeknpMMDH4P7Ix78
         VoEESoYs29IzH8rMPlwmKBvY82UBrXfVE2VHgWP1SMGO3Pr11zwhLNJ/e0sxCCWL3se4
         QPtBFsYs18O4QvgZM8cVh7JYorMnsr1jitk9Y8us1MSy11yl1RmBJRe2aC0sHls1YjsS
         H0O60S5fqoayYcW5lqMBi7SZo/zq6YSwXuDal2+hKblXV+Tgt9c99VhAiAOmKZWzeH7K
         wQmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774255701; x=1774860501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+QzNDirO+Pun9y4cnI/mvQSADsIoA51wg/5R1jcim0I=;
        b=ipxXzACBRbHQtga2cwZ5lD7GcioXazcot3SxqFNW73cC0icqNdCo6qLMmyqrLCJoF7
         n1DqfmZiFuKKAO05rLnHlbSTB83HlNk+8aX88ZSWO4NGFw9s5HddLpdo7xe7WjCPuU9Z
         DuRMRo2w2yfdLsEk8qOShzkbLJya8MBfqoHTqh/3mr+/ZsqPy3+bKLJb5ilCkvRbiigk
         wyM/Z15v0mpxBcGXvMBRFi4Mf6EaCkxUCXxYFsHcPxtUEcy/GcvfYIKg/EkaQ8CbyRyD
         N/W4IqGs5DL9R6MyPFaCxK1/iXRDf4jI8u3m8UhxzxCWV/6rwHFmBNJ4ye5h7zsKwek4
         B4BA==
X-Forwarded-Encrypted: i=1; AJvYcCUvVa1X5b1Ck6jsX1U/Y5CIuJAzZsLPtT952UOaP3Ms9gpVwdDAQrPGGRD/kkOwOlaQNag=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzp+1z4WarM9gLOEajGquynaBf06SW1Rp/LazE+MDqNTYLTffzt
	WpeFBgzRIMT+GTnYrGtF5XdJu1sfaRy+j5sCKceszUj89BPC7JMk7jlN
X-Gm-Gg: ATEYQzz6iBTNt03C8+00/QhxHMAYDX/jiDvJ6Z3GqyLWOCQ6/Z0LjGwZ4tP4yvBPYDd
	ZyRsfR6SD04EHtl9yQlKiXn1n7mA3uGwzk7g8ExW0mQsJqVlNoA509jKfC16fWUe14bvLBtegj/
	dgJtR+G+hikgNEksmRQwhmuA3WmvxI7wAYOXfJHgy82smgUimHM180sDkZZ8qAkfEC/1H3Z3tGh
	a8fcKA0ykLoBRzVe9hh/8G3qIqDgC/r4L7dEoHWESG7lVeUF/sj/p9yUPfKfo7CHtLQE2mqOJw+
	C0bj0Nmak/Y6N433PC9WCvkw1QEhbf3xfE984npTgA3VAF5eGv+LdDIdj68qScxOD5Wopqzw92K
	FcSyTat2kipyGI2ge2241jHok7Ph0E5wdiCE1jMUZMo3PWRxk8R5M3IkIL4z5n5uPnJLQo2MxYl
	h+CU9tmv4/oGcI
X-Received: by 2002:a05:600c:3b10:b0:485:3f72:3230 with SMTP id 5b1f17b1804b1-486fedcc4d3mr161337325e9.15.1774255700647;
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
Received: from fedora ([82.77.79.23])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-486fe8367d8sm316822715e9.14.2026.03.23.01.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 01:48:20 -0700 (PDT)
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
Subject: [PATCH 2/2] ARM: dts: nxp: imx51-ts4800: Rename wdt node to watchdog
Date: Mon, 23 Mar 2026 10:46:13 +0200
Message-ID: <20260323084616.10469-3-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323084616.10469-1-egbostina@gmail.com>
References: <20260323084616.10469-1-egbostina@gmail.com>
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

