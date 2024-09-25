Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 597D11A4E83
	for <imx@lists.linux.dev>; Wed, 25 Sep 2024 23:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727306481; cv=none; b=GQU2P2OzR2Lxb/r2xHFkejdzttbWBmDgNlZi+Slch5ROmqdMABMMF+qsBVZVOsxQgXhevyZq7+TgT3faEwlziblUAePSuc5LBAcxvAowkansI2KH9Oqwu0evId1KHR4rECvxl1gWVej2I0tWVoWBm0HtUIw0qw+2iRSqy6CBaw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727306481; c=relaxed/simple;
	bh=9MdjDmzaJSXdmEpYVFV1tpaG4DOpRWuJZAVX4CUD5lY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=pjXQhVxWmvY47j7g6TF2JGKxV18QziwHUhFVI+J+9cg/qdVZSMzqEYV6SaGQhCja90yg23KoulguLvHRAxMO5YGx/jyxmpcQcBYdwseAVXKbYZe4znjOLItAQr5HeJttlQ+YUwDJmCtaSoSkqRAoqY28fkf0JRfcdyLZl4SWZUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=In3goJUt; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="In3goJUt"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5c718af3354so336157a12.0
        for <imx@lists.linux.dev>; Wed, 25 Sep 2024 16:21:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727306477; x=1727911277; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Y0/b/12goaJOUtphQuMfAjI4BvBF9ykQVTYDGjgY+w=;
        b=In3goJUtbHq+m5y4Wwd6LHvJ7gA6yZKpIKg5dMPbDqJdZUvA+pzcyJ3DDu4CgJCHkY
         sZZPVyB7YsjZbXpR+z0OzYuX/9KRe7kJu9KeHvA0wCuVCJ0EzJPGzpx+s7zDvLg6gnhu
         SwK1uw7k7BvCWwnTj5HN6SwgJiUp1lkzfNWWb3koYQOQVFcqs4vz2cWP+CfKMNwgKuOg
         XqpdvCnIxCNat9Ajw/taoWB3f9GcSERnwaB9eIi8r0oFM3Auo4iF+LsSxMbPku6e6/pZ
         zgKgwu4gd46+PZGhX89X5mYllcnKZXiw7r02C5CgL9u9EzaZMBS1WlTKCKb0uP9lYZfR
         Msiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727306477; x=1727911277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Y0/b/12goaJOUtphQuMfAjI4BvBF9ykQVTYDGjgY+w=;
        b=lGvvID1p82wZVLazoq4+Ik9Y5K2/Zdjzxeb1yOk45M+9A+NE+G37SLXky9cOmVIxZf
         cNq8i7Z0TQg8YuRdAk8VfGPPYn2SfI53lqbvbsDBEdiQAq5rPFOGLD2Z4b3feXq9gstK
         TmHp+5ubIP7NpnQWaKezIbwlpFcrSGSP5/TvIbOJfKFZZcA+DEKsggeVfwzS4isd5IvV
         GMSmLhH5ekLJcHos0xfBo7qKydOqqBg5x2FXBhPilcfY4GuwqPx5f5f2/Hilf9XETX0I
         8+fZLg4mSWXhuIuMQ4agoedkywY85lPVLlKT1nJQKdfIIj1GI4lQ5+YIAAfVQmNUpBtM
         +m8Q==
X-Forwarded-Encrypted: i=1; AJvYcCVONt+hlH0fYkWUtN08+ETetnbEGM6UjyDk34E41gf9Lb5/DMiaCu1uujHHALy7CL/eli8=@lists.linux.dev
X-Gm-Message-State: AOJu0YyOoW1BJuZNkutm3ZpPiXgD5qKqInaaeW9Bxtzmy7BCh92iogBB
	9PkpuQhB7JPFUcQMRcO8N1TLwYDgaksfMTUoxToh/lvktBVujgwM
X-Google-Smtp-Source: AGHT+IEMfbfQnQA9qcYuWORwKKxs2GMl24az24OZdgZIQPCbXrTDPL14Gi7TSLFD2svMh9oBJTgYAg==
X-Received: by 2002:a05:6402:354a:b0:5c2:6311:8445 with SMTP id 4fb4d7f45d1cf-5c72060a8edmr3765685a12.2.1727306477046;
        Wed, 25 Sep 2024 16:21:17 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c5cf48c315sm2481026a12.15.2024.09.25.16.21.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 16:21:15 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 6/6] arm64: dts: imx8qm: enable dsp node for rproc usage
Date: Wed, 25 Sep 2024 19:20:08 -0400
Message-Id: <20240925232008.205802-7-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
References: <20240925232008.205802-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Set the status of the dsp node to "okay" and assign and add
its reserved memory regions.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts | 27 ++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
index 62203eed6a6c..7ee69ce7b193 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
+++ b/arch/arm64/boot/dts/freescale/imx8qm-mek.dts
@@ -92,6 +92,27 @@ vdevbuffer: memory@90400000 {
 			reg = <0 0x90400000 0 0x100000>;
 			no-map;
 		};
+
+		dsp_reserved: dsp@92400000 {
+			reg = <0 0x92400000 0 0x1000000>;
+			no-map;
+		};
+
+		dsp_vdev0vring0: vdev0vring0@942f0000 {
+			reg = <0 0x942f0000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0vring1: vdev0vring1@942f8000 {
+			reg = <0 0x942f8000 0 0x8000>;
+			no-map;
+		};
+
+		dsp_vdev0buffer: vdev0buffer@94300000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x94300000 0 0x100000>;
+			no-map;
+		};
 	};
 
 	lvds_backlight0: backlight-lvds0 {
@@ -640,6 +661,12 @@ &sai7 {
 	status = "okay";
 };
 
+&vpu_dsp {
+	memory-region = <&dsp_vdev0buffer>, <&dsp_vdev0vring0>,
+			<&dsp_vdev0vring1>, <&dsp_reserved>;
+	status = "okay";
+};
+
 &iomuxc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_hog>;
-- 
2.34.1

