Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 034443815FA
	for <imx@lists.linux.dev>; Fri,  3 Jul 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783068385; cv=none; b=qJOEVQL2FeGXXS3dC55DCEC2dN7hsANri1dsvDrCrxLq1ILheMdK9J5YUbWbqkZY87EQLJeN7SbdpC1VHzVhEHrB8Lvn+mMtjwSWyM8aRxehJAXmptrxcsKAA6xZTYVPi0vKdIu9kQSceS5Ls3D5Md6aW3q9yJnanMc7OF8IsEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783068385; c=relaxed/simple;
	bh=IT+jxrhfm+hmKKPCzcfibZSJDcxQg1VMKfZ/g39Q2Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K8vdc/DJ7qhiCsORbU+BkIWjT6md5SVa+E6E7n/3hmxGUiMJTv+ws3CQEzA7geIxR+mfeTeouzVewX3F36PJCZ39TRo8I6Sf64rp1Mp4sJluBoSLjBcINr+Pcpw5orM5an3zW3EjftycYkmY4Xp2drpnCFNoe/2ODYg26pMxiOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K30DbGAf; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K30DbGAf"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493b7612475so2652115e9.3
        for <imx@lists.linux.dev>; Fri, 03 Jul 2026 01:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783068381; x=1783673181; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+RLRzA3ro3zl+cujzGRMZ9GCKdfl5rt1S6Cb2aE3ttA=;
        b=K30DbGAfJrEetLqgJKmsX49XqkAYct4e5DyIXjDY0RKOL5cnfkpuSGF6bl2XPirfp6
         +ERJmCwez/q1fX21HoHIQQpnVe36LomglGeOUtqWMMAU1O7JXFsnXBt1+ZMZTD24G1I2
         ja5j88k2RVyLMyzZ3IzfTbYShGgNDbqpzGtAsim3d0gRgeuF3kFatYd/r9eES2+oLU3N
         Tflcc1BmnA4CbjMBLgRuikxfGu+A3iC8eqPxYnZdFjoQDe4l1cRQyS14tX4wb0Ejd/Nl
         9LGwRd4t1paLQNldw6QsjDQ7ZlcmjiE7PpMOOumvFZcX2JTGgGsw9tEX+jGCwwxYGJof
         a6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783068381; x=1783673181;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+RLRzA3ro3zl+cujzGRMZ9GCKdfl5rt1S6Cb2aE3ttA=;
        b=cWelgrAbL33Q25MrLvDS4Lvxk3tvE0kAfwe7nuVcannR/BBmCRvlz0uion0R5U1n9W
         uqcmQVL8ySrdCtK9rw6Gwl93LdRWLptMkN/4NVUhNVcLriyr9bXU/uqQfAQfIwrfKD9H
         ZKSrN2iXGjVVkksorgY1Bt0bhfABaNkubeOLHJFxPS+in5yBMztpoJqqtKY00da0nGyR
         QGYr0ZT1V3chAAVGKUb23SI2cIRE5mvM/GApJvVm9BEV8WMDFMaj3SLP87PtEUXIAO5D
         TF+ztD0ZP9kXcU7/sJf3TOcSO48asV1hZgb1mqjVnmYKBJ1JQg6IMwFPUqXTr/ryAwJe
         J8PA==
X-Forwarded-Encrypted: i=1; AFNElJ9yIVdlLFWj3zUhfB7Hhy0txb8h8xpJrGOZEJvoeSY/btRVyC8QlERB5YPtAJ4eA/PxYPo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzKDGktbr7alZ9yNHNZQuO7IKyOncQs0DgUvgRmDiVO9SrAjiZM
	SaXlfAU6cogU7xnsbrWZHD9DOdvtAL3gwtYw3cxsZEljtGz443HJEeev
X-Gm-Gg: AfdE7clyqAyvAVRnjN8P28UPpG4AiVuPzm2g3sWpLUs/f2/fN6CWO1EvpG7LtjSi8m4
	LepnbkurA99p1wWbkhGTNZPSkkfxJ0vSCxiIX4waDvMHAb7oNCwsWCh1pIBOhO3yC+7DZmJ610/
	dHQHw+pC0atbG4At63zYxDG29/X/mLUBxZjWSugNQX7X5xIKP/Gjj7rFdnZ7aXy7OQFKJ9jMGH2
	XIQ7h6lN6dsyN5kQv5Hlmy3jj5K3zAUztXHdEtgqTufG+Q9r3zr+pDq/fyw/iJuCqZG5bTJC+SY
	spBruecs7AD1hjFbJHQ1fuuDkXVn6/cuBP1fMiaOlHMt0IxmgAyl9ocu+5Ad+NK1gO0SWlEDrXE
	8KyVmpqyfWxDDunK6sXZTksg6P0p9a+VGdIzlJ9yhXGuwXXW+IC62Wp4xTTh2FyVdy3j8F3BTJj
	ht0GVA04idLnwLacFqfp182j1R2jKY7+Bmg2QSroFMWZ5PP1oTvLO9H+oHfmryiZpflQzD1+tcq
	d/5muWbAXz90OeGKPau4t9PNw==
X-Received: by 2002:a05:600c:2302:b0:492:46c3:c7dc with SMTP id 5b1f17b1804b1-493c2b50755mr81163285e9.14.1783068381013;
        Fri, 03 Jul 2026 01:46:21 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cfb6f199sm6335505e9.3.2026.07.03.01.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 01:46:20 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v1 12/15] arm64: dts: imx8mn-var-som-symphony: add wakeup sources
Date: Fri,  3 Jul 2026 10:45:59 +0200
Message-ID: <9223b0d0cadaa8a3340f8866b550d5155aa2b621.1783067947.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783067947.git.stefano.r@variscite.com>
References: <cover.1783067947.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Mark the Symphony carrier board GPIO keys and capacitive touchscreen as
wakeup sources.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 4898018f030c..c98dca8e7889 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
@@ -40,18 +40,21 @@ key-back {
 			label = "Back";
 			gpios = <&pca9534 1 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_BACK>;
+			wakeup-source;
 		};
 
 		key-home {
 			label = "Home";
 			gpios = <&pca9534 2 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_HOME>;
+			wakeup-source;
 		};
 
 		key-menu {
 			label = "Menu";
 			gpios = <&pca9534 3 GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_MENU>;
+			wakeup-source;
 		};
 	};
 
@@ -187,6 +190,7 @@ ft5x06_ts: touchscreen@38 {
 		touchscreen-size-y = <480>;
 		touchscreen-inverted-x;
 		touchscreen-inverted-y;
+		wakeup-source;
 	};
 
 	rtc@68 {
-- 
2.47.3

