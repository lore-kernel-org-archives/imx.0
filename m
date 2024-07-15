Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF684D8CB
	for <imx@lists.linux.dev>; Mon, 15 Jul 2024 16:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721062010; cv=none; b=sk3ZeEWtnPU2nm/pDj4NdJl7g5wgOMcBXigpFEKKfyYPn520DnpOfTNunqMwBquGN4W4MDVUdO3e9DO2ruXMO6qW/1kJMysldsZHW7dgSIeCmfv6ePNcNNrOErynGnPImz9mf5DnDqMAfU89hnpMXv04eUcD2AtFc939mlG0BwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721062010; c=relaxed/simple;
	bh=yy9gl9pQz3F5fgfnipmdtFV0zJl13QipSJnEg+3xNDo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RapbzH/TZGD2VZ0mMpaotkbtABIM8On0ucSUb5G2aNe0K9pRvU5R2kow++ji/9Qb37cdDUX6L0JIB4zjUEpDLG6je8woz+fBOeGFgoUlaiYNZWgLbowVRDXaLVEK/pmVpHlx1Gpb9pII/WmEBb+r/yEiaCd/hsKKCHZFvp4fEis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VpKxefQX; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VpKxefQX"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-52e9c55febcso5846490e87.2
        for <imx@lists.linux.dev>; Mon, 15 Jul 2024 09:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721062007; x=1721666807; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=VpKxefQXK2TYlXKzw3OfgX4e479O4ueJecCBuwAXq1l5ZP0SEqtqy9TWWkYrY1LWSn
         mCTeVTVnYDZG2Oz3ufWSt3LPsDcbu/vb0MoW0kvA95cwKv5tr9KXd20qJGu4gcffcwoO
         h4eq5NTcupMkLNwBVN1WmIKmPcllDv+HEhVfzx93e3Q1GOXt1BKr2jbWNukxLNMV9vkt
         GKyI16RevJIXXRQO3TtKJQOejDmiki35XUqSJBXThBeAekvn4WdpTRYXBnTzb8EXeoUN
         VI30cg6OAUYxHhPYqxA+u0BYRl2Lj+1giejri4t3wq2bpCW7NhFNkQljEzatV71OkTwD
         irdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721062007; x=1721666807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wXLPtmmwbw0kH9maBt8kI0QUZhZ3U60BovT7L6yY3xs=;
        b=bt+yXBkqvokz2jug6kJbSd8KyetWMF3LHpyH/x2iyubh/IG+RmFShgK9FgTI3A8WxM
         oHuvGKPu2eaRvAcCpYrAQ+pe6as5IKfxNe7zNZVPHdQ3NKH5goBRIf7qeDgHfGVCrUsj
         hHluXnI4DWLb3QQdyzOjduwl9fOKekEqvya0klE/0L7BOJjOSXhHYh1OsmRlGjNpz0RG
         69npS1anTWINRWTcP/344iDV5i3PsyxmYRo+wEDZb0Mmcl/k5kDsnNrdY1MCBFA2i3Be
         /h5kX6fX1UEHXeVLC3nYnYtQmODJIMl2yKWdRkl2A+ELwB5xb1tEYnmCZfSv61plGLy7
         lDBg==
X-Forwarded-Encrypted: i=1; AJvYcCU1bWtu7Yc63ioAxqX6NDJ1zhZVcgCEAgeDGPSkZvYwXGUYM83+RlKyr3MF8pKCs5ryBE85e2zfjzoIWdzyWmJiDeKh
X-Gm-Message-State: AOJu0Yw+03yal642hDM1nHbVO3Txq0KGThsBx5CghkV4/rIVUJGdQbKy
	Neo6OQKdIU/SJ9hAMN4muCTO2v1cV2o7ph4DfEdTGGLjw77jdA7B
X-Google-Smtp-Source: AGHT+IG72IQ0ziiaJH2CaciU0vlZKlLL8khi4i7uyxWcd0QoI/uPAG9YPE4h/aM4tCxzi/2HTELIUg==
X-Received: by 2002:a05:6512:e9b:b0:52c:dfa0:dca0 with SMTP id 2adb3069b0e04-52ede1c782amr51714e87.43.1721062006412;
        Mon, 15 Jul 2024 09:46:46 -0700 (PDT)
Received: from playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-427a5e7749esm94316975e9.2.2024.07.15.09.46.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 09:46:45 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] arm64: dts: imx8ulp: add AVD-SIM node
Date: Mon, 15 Jul 2024 12:45:14 -0400
Message-Id: <20240715164514.8718-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
References: <20240715164514.8718-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add node for imx8ulp's AVD-SIM module. This also
includes its children.

Signed-off-by: Liu Ying <victor.liu@nxp.com>
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
index e32d5afcf4a9..1ffa4da23042 100644
--- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
@@ -614,6 +614,19 @@ per_bridge5: bus@2d800000 {
 			#size-cells = <1>;
 			ranges;
 
+			avd_sim: syscon@2da50000 {
+				compatible = "nxp,imx8ulp-avd-sim-reset", "syscon";
+				reg = <0x2da50000 0x38>;
+				clocks = <&pcc5 IMX8ULP_CLK_AVD_SIM>;
+				#reset-cells = <1>;
+
+				mux: mux-controller {
+					compatible = "mmio-mux";
+					#mux-control-cells = <1>;
+					mux-reg-masks = <0x8 0x00000200>;
+				};
+			};
+
 			cgc2: clock-controller@2da60000 {
 				compatible = "fsl,imx8ulp-cgc2";
 				reg = <0x2da60000 0x10000>;
-- 
2.34.1

