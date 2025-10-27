Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BCD32F1FD0
	for <imx@lists.linux.dev>; Mon, 27 Oct 2025 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557550; cv=none; b=sYKNuMIP4cDiGz5X0jVVGZHTXHCNea7NaL4Akz+nf0k+OQSEfV73qZYN5AVSy+wA1w5KAeaHIiqM7nrkLUyIXhtu1d9EmF6j4vXSFoHncwJMrDh+L3eIhjOBoKP9JkoNvWEQXfVzuE3wfS1OGyz3dYniXdRNO2lKL3jHZfO6NHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557550; c=relaxed/simple;
	bh=I+vPrkGtVY1KgrH1yltmYPBQNdvYIVKIbmnLGF2Vio4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DM9Io5la2c++zuKnokpS49ofdQo47+R5Fxl1pqQ1ViB2OaItQlWV4/8I37tW49PXX6LC2B/Dsq2jghnkr9k0PgayniNQPniWI41kv6JniQokOxmUGzp55BuLVie9W9oF/io7A0EiGlmjKvz17OopUmG8MODVd1fRmpwRQCl5e44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BlgoeuqX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BlgoeuqX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-63c4c346bd9so8639348a12.0
        for <imx@lists.linux.dev>; Mon, 27 Oct 2025 02:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761557547; x=1762162347; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c6jnR1l/knmmCE7j64ceFOiYUTsDgn50GkewewG1O2A=;
        b=BlgoeuqXLdgZzJfytOpFMIBj6S0//EBmHUd4JEDIrpFQQlL4bRLU3HD2JdmoUy1yrD
         oilKBVXEkgiOpt1nVEXtbbeK0MpbytkJe38me6OO7nPSlPyXvyaqjVv6RlSFESD6d2bV
         ue31AASJKlDo9ujrRd9uKUNd/uzgcsNTe2q+fjjFhE4s7DaCQLvBZGxXV/N7WPDebUAH
         6shNOKzvU5PX4/hxB4oSnwi+v18Jz+sh33JLuADmny6w9/OIuszBJCc1vv92x70/hlL6
         OnBZRRmUYkdW7BPTFO0zhF7j7+AEpyz3bLypy7HxLTRNUf+hqWoFu+CpOG2EgKKe2fWi
         ZgUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557547; x=1762162347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6jnR1l/knmmCE7j64ceFOiYUTsDgn50GkewewG1O2A=;
        b=v9EdapBTibEIhtGgKVGyPyn6T/29YfK6bos70+9AAuzbO1swLs+CTND45z+YWBEMcw
         w33/1Q2dAljueK8pont3aHLKQugrt6b2/IhPTvjN4ajzYeT29aSFBxt5zI1rLkFtdfaj
         QqRj2fGfH4STpMtrAp2pBN4EnrSkj4a+Nkmx/AS4eKYNm/Szo3tY0K8flYJZkw1XTEbo
         5jYnsDtSO0ctT8Wl4YMgBGnTGguPue4kUOC2K6BHigzPICGtr2yIQLvCGLPhMerH4whN
         oXNaLh75P7l1FhlfePnEZh/Cl12CO4n47w1/ZZXujUwzPNKLv4wpMufqeqysZpE/VNLJ
         1+KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXleiXwvXMq35wkfioz6/DJe69xYVEzmVt0tHnwdrJXg5eGKegFcKyLcn+/+CQHvU0FaJ0=@lists.linux.dev
X-Gm-Message-State: AOJu0YzdGYr+iaguMIdZjlSFD5EI088lxWM7PfP1RUJOETwleBLvLWta
	4GEq1n7qGG/hHuCO6hV4su3RSPf29dDp6aNZiewBx7I1KVdKscE7O/uM
X-Gm-Gg: ASbGncuGyiPX/QHENsE9sLHRWbPUriE3mtrc8h1aDJn5Fgk5/N51w/QZi3tiSL6d+dU
	pHhaNMzz8+JD8Iw8b0JET+aYaFxiSuLcUrDkqwJdpiScLu25SyavjyOUcdMn6Lu+UQBYANe7u3R
	0PukJgBqDok2EXfgyKaXQcjbQQBGgAA9LVqQdhB0soSUfh+drH8cA9jmisby4Rti6iQv+mIRzii
	PiY04OcKz/21O6qaLSlOpjM3Zs4gkhr1ZAm2r8ODkf9peB6XPaK3HmZE/4FVT+3zkh+HjSakhGc
	pZk33iohMcpjyAsvrP6SMDmzpIHH5IqCBRl4ZzQL21QWQjh75UoJB9uiilPx7M2hXfZ02sV8g2d
	0IAhh9kKroyzaWUZXoSPyJS7C8/AGkqo9JuYCBQe4tLnn/5TNlo9VlNlE5ms9JY8eeK2Em/AiQR
	gFdFkTziH4Wn61D2LVrRauuQoA0V9BOMDywmKqpsvAGMb38qs9h0uRxTq4QtHbpGGN2hJ69KTep
	jZDpWoE6BrErwtW
X-Google-Smtp-Source: AGHT+IGo4pfv6hPnOdMTXONgc4qw1GUfLg7rVGlLeAbdxBQfM+FdGB1kbkQsXhoL+4Azs4JdFAml5Q==
X-Received: by 2002:a05:6402:1443:b0:63c:84e:614f with SMTP id 4fb4d7f45d1cf-63c1f6b0b87mr34969695a12.18.1761557546755;
        Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
Received: from toolbox.int.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63e7ef6be28sm5681014a12.2.2025.10.27.02.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 02:32:26 -0700 (PDT)
From: max.oss.09@gmail.com
To: Max Krummenacher <max.krummenacher@toradex.com>,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
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
Subject: [PATCH v1 3/5] arm64: dts: imx8-apalis: specify adc reference voltage regulator
Date: Mon, 27 Oct 2025 10:30:09 +0100
Message-ID: <20251027093133.2344267-4-max.oss.09@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20251027093133.2344267-1-max.oss.09@gmail.com>
References: <20251027093133.2344267-1-max.oss.09@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Max Krummenacher <max.krummenacher@toradex.com>

This sets in_voltage_scale to calculate the measured voltage from the
raw digital value of the ADC.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---

 arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
index 686fce7443bb..abf6d543380c 100644
--- a/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi
@@ -284,11 +284,13 @@ &asrc0 {
 &adc0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc0>;
+	vref-supply = <&reg_vref_1v8>;
 };
 
 &adc1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_adc1>;
+	vref-supply = <&reg_vref_1v8>;
 };
 
 &cpu_alert0 {
-- 
2.42.0

