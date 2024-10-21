Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584C1CCB3C
	for <imx@lists.linux.dev>; Mon, 21 Oct 2024 15:53:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729525989; cv=none; b=TP/ekKk3+6IQUEaVNPqczZgUMFZS2oH5tvGdoxYZqKj9/eCkzE4ZRxjcWTskF91cSzQkqzP/dyyBe1+kc29Q/LBbpwlZ5IAoWsMDJG02Nb4ff1TyW7NjuNM6CaHal5TJAVsllVNjrtNXUuTJNUVf11IVDgd4XfSw0ekh6JJzvkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729525989; c=relaxed/simple;
	bh=Sw1Bzb82rcjdsOFSPq5AGlkPnJMB/ljcdy+n+JSSh2M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=A7a8Tyz9X7nKiLefOeB5WMzn3lqAy/ZvY6PPPYJ39qHZUZJXQu978DEBVi7xqljO62kWomwZoYwGfz01OeYZODyIWc9a7+T5iZ644ZyS2TeiuU2mblYGtJhEsFUtjXstL9bOYrXAxGoz+FaDn34BSlso6fl7wpnKSn3L+CsADIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g+n+65Io; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g+n+65Io"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2fb51e00c05so64856231fa.0
        for <imx@lists.linux.dev>; Mon, 21 Oct 2024 08:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729525985; x=1730130785; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hh7X0fydqIufhtd8PZzP/EIASN+FGLQT9ALrXUwVIA0=;
        b=g+n+65IoSZeoPUruwE/BYlLEr73s5JISQ+MFOQW+iErcXY21hjR48LDLSqmhT4SojQ
         SpOKihHyo438CXNXFWs6nf2pNh6vEfLoaoXe3Dv/MbPKchFWXId/8dh7W0QKYZBdSxY+
         DFIfBrzkLWEUEisgLM/d8gggfdqDPGh/LYZ3TqqLak89EeizR+i2QzE6JfBTV+hKmjvS
         TohNmUbzVyOvkmUeoG1abGkPAiq8naUoSCBRCXnDB8Orss+KYjFr6XLdkHI4RZLQnkQ4
         RmRsM4hSpnWWcHz+5mf89aDhUbssItJxFK6sk8fQfU7EjVM2kzjJVmrUxAMKTljpZo3M
         nU5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729525985; x=1730130785;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hh7X0fydqIufhtd8PZzP/EIASN+FGLQT9ALrXUwVIA0=;
        b=QzQbTW8D82oZld/8mTQzMi53UHw2pwMnNGaeWgy40Ct9uNh/oud31t6ogqmCkXV+q5
         rmeUB0S5zbQILLbMPYzIgWAQ9eXjfiq3EHRVHdlwxdeE/KjLBJ3ANuscG3GCqPLoe0J5
         1tH1vZEUpDNzU2H1Ai4U16PXSB4DNrMmufo9/4fQ4yU5fsdKNhD0DYq+TQ2lhihUzj4W
         c/z+vA0jFTOvj/yLVDjVN07Jt0RdU1crt42/nqttB9Uk4eUPKfwXoLv8YNw//Fr5sXv/
         +3LXufyZVF0/akzaqagBR5gzIt4DbtcvJdBiOVvuKnEIsdm5b3semPJ5tsP0CaA9YStN
         mO0Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWRn0rIcfQxHZT9FQxWAbgqba5QXl30gWH6InlgeXBq3I3lCJBv57awTQaRAe/5JnmdOY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxD+z4THBXjs5vHXVi0lXwIlTYPMWtE2qLBDLujy2CAApAE2wOp
	lV4hk9/cb7o4ugnyJsfx8BLGXugzRTdIEvG/g2sLGXowGOBSvaX8
X-Google-Smtp-Source: AGHT+IGYrgG25Z/I0gGtpppxwAYbzIVLhyYw2kd6/eNRNxaHCAl3YECg5/S05qSKVfqTqP9ANYFRZg==
X-Received: by 2002:a05:6512:3b20:b0:539:901c:e2e with SMTP id 2adb3069b0e04-53a154eb6famr10055650e87.58.1729525985072;
        Mon, 21 Oct 2024 08:53:05 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9a912edfd0sm218614366b.67.2024.10.21.08.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 08:53:04 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>,
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Frank Li <Frank.li@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/6] arm64: dts: imx8qxp-mek: add dsp rproc-related mem regions
Date: Mon, 21 Oct 2024 11:52:18 -0400
Message-Id: <20241021155221.112073-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
References: <20241021155221.112073-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add missing dsp rproc-related reserved memory regions and assign them to
the 'dsp' node.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts | 21 ++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
index 936ba5ecdcac..4c4e71d39bac 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qxp-mek.dts
@@ -21,6 +21,24 @@ memory@80000000 {
 		reg = <0x00000000 0x80000000 0 0x40000000>;
 	};
 
+	reserved-memory {
+		dsp_vdev0vring0: memory@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: memory@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: memory@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
+	};
+
 	reg_usdhc2_vmmc: usdhc2-vmmc {
 		compatible = "regulator-fixed";
 		regulator-name = "SD1_SPWR";
@@ -63,7 +81,8 @@ sound-wm8960 {
 };
 
 &dsp {
-	memory-region = <&dsp_reserved>;
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
 	status = "okay";
 };
 
-- 
2.34.1

