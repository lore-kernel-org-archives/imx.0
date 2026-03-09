Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E35233AD9D
	for <imx@lists.linux.dev>; Mon,  9 Mar 2026 18:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773080253; cv=none; b=WTEXF6o+Nvsoi6Ez1OY3zTMI8QyN8bznL3+w3/WNxw2qlNz7ERE40yX2mRQ1S8khgco56Y9f8lPQThdMjjk8Glt+9ieFF4UzTLMirj3LrzIpc8pHBA8RPClK+q+xsoCgR4S64CPsTJuKUz5NqW4GitMEzD+9lKROfzI3N7ZEwNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773080253; c=relaxed/simple;
	bh=68SM8zTjuIJ/uBfyqR2b3NWqQ/EpoAw7wR9lSXlIIcI=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cYGZbyJ6nvRV9dmrr5Er/kxCKTvATqofelHoYCufwLDvo4Jha1PQT2cKANxspI1nT2okbmWPJmQ3MeaYx8Z10J/7jfdwMTjkoF8MHXszvafFI1F0mQ9wsdk7mhNC3MUzvVYh/Zf7y8vUyul91gluuH6tv45u6EtmaFC38RxX2E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mn3aqtG5; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mn3aqtG5"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso121213735e9.0
        for <imx@lists.linux.dev>; Mon, 09 Mar 2026 11:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773080249; x=1773685049; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=SK0O0QG/EC/tK5NkBJ2Mw/XSALNyyYRp9uLd2Au15Pc=;
        b=mn3aqtG5DN3NB6HwnncX/i8Bw6wiz9Ggt1OcTAkFFsgQCofx1YQSs+Xgdtmq60+fhB
         CjwiaYl7i8+uLlrM41/OZWDqFDojP0YSXbeJvy1U+5IHVz0HdejjVvKI+tkOyXQhZmNo
         cRjxPYJhWEytL1En3TyGeaijT55CxNYRNm6LhWlSqWPbwZ1KyXG4IkvY8YI8SjE70utP
         YCPZKimi8n0N6/gF7qhhpVkxluEOGJN3Ep45SDpyFJ0uUTquwl1Lb0xquJvlnGv9YMNv
         8JbSggZubtuil0zcB0Z6rNqBBdlNP0UgrIuMx6ymdcFJxVNoml2Kbns8rUT9AKHlfuSn
         8BFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773080249; x=1773685049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SK0O0QG/EC/tK5NkBJ2Mw/XSALNyyYRp9uLd2Au15Pc=;
        b=TpWdoa3UVidkySQTWuUUr31a5OSxTSo/f59TW2jJAGlLqaTtLMir9tQ+1XG3xwFTjm
         S6Xs70ti45xOaaN37C9+voQrDrF4uVp5juNiC93neeAA2j4hHfpNi+RShWreBosn727S
         1cud/xQ050bE1xQ3bHM/cSNhemt1Pygcob7GUuiF/thSXVvZUKa+eFCz99wD601ksKDV
         aaxzURU7IjGeNhrP+vFuRAdM2rredo4kQmC5e1LbNluV+wqxubFA8SIW10Aj38MMC9ri
         UXF+QYxtaF/NgGtmlXtyy8jH6zviOXWHXYR2L5erNlLs9o4wS971UOJABgIHrpwmvlU0
         1OUg==
X-Forwarded-Encrypted: i=1; AJvYcCUyxmJhILCByP0IRcTsuk7Abd2/B+7monC6R6h34AqhutszemEltAYyBprOCuostR0kioM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzghFuuKC7OGrNNLfdW4nteXXCdXB210aoIa9j2ZKs+W+cj9Kyh
	WNjVE3YYuDbneX0OR7MtprRbeC+CR69crqhZZKJ8AwoiJ/ofdPSOh5uG
X-Gm-Gg: ATEYQzyUd1JR65YJ3LIwR7v8aCiJGacBWQ9HAg+5WmI78cTcjpxfkyL88Kryeaa65mV
	BfE5hydXSLwzH4grYTUBakq8us4mOsyjvLPLEa0VybVlEBl4F3JIZ1SsoUYmBTTr3qaHnS7Etg2
	9aHvGbxBPtYHt0amZOF8cIykIHlrffnvr1k7kLub9YFB57vM1EL13JuLhqCOxrj25CeXRkLq+tK
	Cn/BO/vHHD7wtHsHlaf90WBOPtUZTWgtudgTAb3lS5TqHP7eOpgdheo01g8+k2M6ez+gPBgXCC6
	eUWPjMQ8S6fRCGKd1D+kRkeqHa3pPo9nDTyAIqfRLWUN/nuRmxbyFbf7imlXQs8mXLm8Vn7YIkx
	6T7aP6vGcFW8Rkxo++tF/5gZQh0i/H3Q6lOEGTgMdTX33JTsoz4ImdXss+VAnmx2KZUBlWsbzQr
	d42uOvxEyT2i/szQ==
X-Received: by 2002:a05:600c:6488:b0:485:38f1:5cec with SMTP id 5b1f17b1804b1-485419c24a8mr10040535e9.7.1773080248529;
        Mon, 09 Mar 2026 11:17:28 -0700 (PDT)
Received: from fedora ([82.137.32.29])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-48541b7f3cdsm8866965e9.14.2026.03.09.11.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 11:17:28 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	egbostina@gmail.com,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: imx8mp-dhcom-pdk3: Use symbolic macro for IOMUXC_SAI2_TXC__GPIO4_IO25
Date: Mon,  9 Mar 2026 20:15:23 +0200
Message-ID: <20260309181524.39423-1-egbostina@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, in order to configure IOMUXC_SAI2_TXC__GPIO4_IO25 a magic
raw value is written in this register. This makes the code not obvious
to read and modify.

Use the MX8MP_SION symbolic macro instead of the magic value to improve
code readability.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
index ef012e8365b1f..6ad824a7e07e0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-dhcom-pdk3.dts
@@ -345,7 +345,7 @@ &pinctrl_dhcom_l
 
 	pinctrl_ptn5150: ptn5150grp {
 		fsl,pins = <
-			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		0x40000000
+			MX8MP_IOMUXC_SAI2_TXC__GPIO4_IO25		MX8MP_SION
 		>;
 	};
 };
-- 
2.43.0

