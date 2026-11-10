Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794308360;
	b=49/8XcZXJB8wBoZVC9J/XTjvzQ90DcF0ZaYhUHeb6WuJPG/LfFFeM92rm7FSP0Xec56X
	 VqPfmrqwJWNX7E1JxmKCTe7jqTgGzAabpVH4smEOX6EqdiMdmpivLAcAPknwq4B12ldyp
	 cmLmyANH+PBdMa1/zRhPYxePD1gtrkH8Ds1RMsYxK8m/qbrlqAG5Nn0AZjKVvC8k0WGvm
	 cIeC5LA6830fdU3tTk4wFl+sGCCY80BjfsomhkG5sIwxKF5ayXERSr856Y6rI33Lzck0d
	 7XFQNgxbDzdEYm+svOH+TqCoT/AeSsdYZ9JOAzveYy0FdKsiRiSxaDJ1u3zB9kJinrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794308360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
	b=ohqb6JL3yo8B5mD1pFO+tifzvaFi4w2hckZ34NlTn9e2msDaoG1A3vQAItha4++A2T+y
	 EqrS7b1lRNtpcDQKS6RbA+M8ZX3Cqr8YHOvD/BOu5bMDmHhUqrAjrglkUkFP9KKljYBsU
	 98m3XpixSKXsu8fY+x6W+FK+bw69dyzuoYRdaoeVkx2m45v5IdQ7yWJZJ+j4SuXQyNzjT
	 6LB1iOrcPiML3Ad2niXkNSukUjFVJxX+TgK+53f+WDd41eFsiM8bEhaxXMwDSQENi6rPL
	 08bhC6jYP8NNL/e6W6FcyiwlbOfb/s0+jnllW1lR/3MjgmKCu2n++Yn8SbCeyixDteA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6Y9bexV;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEED606A333
	for <imx@lists.linux.dev>; Tue, 10 Nov 2026 10:59:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEED606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=o6Y9bexV
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so1211050f8f.3
        for <imx@lists.linux.dev>; Tue, 10 Nov 2026 02:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794308358; x=1794913158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=o6Y9bexV04qpS9xMk2g3FDjpB0VsN0enSKGa2s3RLevVmceiSUKp+TKtEWAP8LHasg
         RvfgCkotpS6BPHxd4IZIEiMLlZKLdnRBxxVJfVXRmZ3YsD7p+HsuCMGaTcJiGwQDrjA4
         MKxNbeaGLNRa0eYt0ARaIOaF+2EB7gBKSq2QsEkiyhws1mY4xajlYXW3FeOcQpOyZk3B
         f7MNuj8LvW0+lkuZrSE0OLXf0k/IMUfKZH38Ipaaz3jILj4zfrIoocnkaVYkIu918GTA
         ixAXNeR1I2Jzfc49oI2bsHX3tZdlUZPCPoepLQo3LyNb//YsLPXbeZ7xrNJ9Qn6ORsV8
         btVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794308358; x=1794913158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IjKNZxEaQEGxyYCtiVf+mg2UfD7EYalaSDJP9l6NSp8=;
        b=cpoZYLN6tzDvjFWfAXoI4v8+EHz2ABAqWDPsQXlyaHv4lUX1uiUl9ls8kx3/a39Gt9
         HbgVtzpi8FvcLWtwodCzgyL+59RsC8wMUODcMw9USbG4xx4rNnnGvBI4GMNadOa7C4BE
         w4eV4K8FlJgLHYi4XnMOOE+xHU7M/L8pcIqTIDoKmMJv0iJw/t6J82q62P4ItAyMLOsE
         YHdl/UurfWn9YhdxefHToTS8qMXQxpqqy4WBj5t18Z4oVxbUz07rFkqCHhufRhv87ZVq
         3edFs7BgBoZCNvT/jFbvmskLDYut5XVR5i/u9gUHbOOeMxCaxQMDIwzFd2kbg2ENTaMT
         hWdA==
X-Forwarded-Encrypted: i=1; AL+hErGRoe/mPoCffQK/ghs6avwkKm7Wd33DSxaM5aEtl3UNyO+tHVGatvO1kvpLgI7ZIolmtrg=@lists.linux.dev
X-Gm-Message-State: APuU4Z/UIIBspc+9BSIWssXXVc03FqQQuT1yRDHGJ2GTIfy8iiqJ3NtY
	Meui/G3+Qo7L6Niz1PR3I8YzAylgKQrcAm7lKs0DH45sX8ZgbPgj2aeC
X-Gm-Gg: AYBFou1sj52olcA5D0a5bsJTsRehmf5/HbJvSzyGqHDEwN1RlCrSrDUsSoUqmEXK4qJ
	hkM64EzrOewbJlZba1s/3cHpNWwoW+yPp611z6SSVJExIhUCwC8Thh0+kYiC7V3/he20EWd5dcF
	tEGmshi7xQ2OmquJf4+OLDEchLjb8u8+ek065WJdo9zf1iYdWojzsVgmHX32G42KhcJh49O6hJf
	35GYq+ZAUd+UvtvWSK8NZBqWV2gooEB5zf+fPLu1jyz7iBJoC3t9EJXGs61MJevIedNUVFXv82Q
	YNcgN/7awLZT0GLrVCWpmYws6/ExVH98fmuQvSR786ADJOGPhaeoq+7GKil4z1kkKiHdEJCFM6m
	AOQhgG3wi8+mYr1sC+CSbdTddO+ctwKpoD+fdh6sasPJcqK7Z/ujCN8ezsjLe1RINtt4Ciap9tJ
	BPJnhWlUjtUNpe4b9AS64JTZ6ZDN+fd6MmqQMZ/3Ksugz7bJl+4UtPWXApWG3HcV38QmpVHXJVa
	56F3LByHLwIeRymn1Lql6ZJLYTbzziA3wLLU1vmliZ7W9EPKHE3ZzrJfCTloWuCBNRE0BaEbV5K
	KK2CuALHC2IkhtyXlLUKYGAZ0kFN1GJQJibpLy45kzilcoNXG4MJ5cOGpa16iuDyiprO8ox939d
	csbRZdGxiLuh804GYc/HZV/fRhBwuzQn5ebVznzQdlb74+fMWAsQ=
X-Received: by 2002:a05:6000:993:b0:48f:d7cd:a5ac with SMTP id ffacd0b85a97d-49828d36961mr4278277f8f.0.1794308357856;
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
Received: from [10.0.1.33] (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm2933551f8f.20.2026.11.10.02.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 02:59:17 -0800 (PST)
From: Antoine Gouby <antoine.gouby@gmail.com>
Date: Tue, 10 Nov 2026 11:59:13 +0100
Subject: [PATCH v2 1/6] ARM: dts: imx: Add generic HDMI overlay
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-colibri-imx6-overlays-v2-1-9776c186d953@toradex.com>
References: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
In-Reply-To: <20261110-colibri-imx6-overlays-v2-0-9776c186d953@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Antoine Gouby <antoine.gouby@toradex.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482;
 i=antoine.gouby@toradex.com; h=from:subject:message-id;
 bh=a0eIgXbh+uCZSw0edG05JIfZzW/ZFfMGZsGT3FOJLus=;
 b=owGbwMvMwCWm0rPo7MxLN2YynlZLYsj69JO5ZeElmX8df7/dmxifWr//6Lsm0bVnWB2FxEQN2
 O5nTloQ3lHKwiDGxSArpsiS8URVkE8hRNaDozkZZg4rE8gQBi5OAZhIUgTD/8oXOWsjGTq7l/xe
 kXR1wvdvcSYnH1+OuJzEnKAm/Xsaw2aGf8YRlW1fFnkVs0wJuW+8XKrc5c+fc7KbZ8QtOHfHIqy
 slwEA
X-Developer-Key: i=antoine.gouby@toradex.com; a=openpgp;
 fpr=68E425110E20541D48088363248CA2CD99D2D899

From: Antoine Gouby <antoine.gouby@toradex.com>

Add a generic device tree overlay that enables the HDMI transmitter on
i.MX6QDL SoCs, to be shared by the boards where enabling the &hdmi node
is the only change required for the HDMI output.

Suggested-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Antoine Gouby <antoine.gouby@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/Makefile      |  1 +
 arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso | 14 ++++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index a0ad7ee583e8..d03a8d2845e9 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -85,6 +85,7 @@ imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
 	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
 
 dtb-$(CONFIG_SOC_IMX6Q) += \
+	imx-hdmi.dtbo \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
 	imx6dl-aristainetos_4.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
new file mode 100644
index 000000000000..efb7dd5c16ae
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx-hdmi.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Generic overlay enabling the HDMI transmitter of i.MX6QDL SoCs,
+ * for boards where no other change is needed to enable HDMI output.
+ */
+
+/dts-v1/;
+/plugin/;
+
+&hdmi {
+	status = "okay";
+};

-- 
2.55.0

