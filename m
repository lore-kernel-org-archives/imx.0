Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24FB3222577
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588406; cv=none; b=HT3W9x3Xz3oQ9JBORfOAMrkTquOlZlDM1kqNFSudUVGNHWIq+g9uRXZGTJ64/D36ADgj6KqrxffPQOMMK/lMrQoZPq1tDNnWfLjqBkFB8vQN/kbYZgdF8/AKVtjNw+nuh0WET/2NdCOAG8UYpgQ/+KrKJqzy46+lvSgTqXjsAtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588406; c=relaxed/simple;
	bh=712s+CZwtbCsu6iB8mRETbiuzFlVQdvECgHqf0Zlhsw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=JhMCEOgbvaM/OrTSo8wpAwC1gx/1DXqCFoNireLX15PGGlTc8M7rBstcx6YVbKOLOLhQBD04Rjtjm5iU3barHWEOPAssOUlAwMib9bwrUoXAp46c25Yh3Vw6Z64Rs4WKtYi34vfKVKJjQLFcDkza4UZ/rtPpiWuobtlXHw/2Ywc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hLAls5fz; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hLAls5fz"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f6287649eso5535976f8f.3
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588403; x=1741193203; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=hLAls5fzS2Q0/QszVdb6cbt+uQMOo3aF+DAvhkbqMnv4tLMmdaguVUZv4HXn+PM6BC
         aLDreU7b3tAp5D6jJwsnm24xvjBW2+zI8y4kz+8diLyT0gF0zw8rSKBmkmPM4vm8LsFb
         eplcsVy/oSMWyAjVDTiUmUYIkfCYxZDvVAe++E6McUopErLXvTBqVKOrZzv2V++/HkqD
         uul93772cRslrXUe93BgBvQdWAEOflVQQLfgcU/jjgQp25dpYOprSpSpT5QILKpWn1Zq
         LBorbXBBA+YEi4MRfmU87AilL0TWWvId2COvrTSkOmY7m4ZYFSSpnJUNPJda7wEqJgq5
         G1yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588403; x=1741193203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ia5D1StmV4CnXYyEpke0sKKPWzBMRVegEo2c54oP3lM=;
        b=rwIhnT72yV0uQI4Eyqok+TVjokFQ7E/xdp/fOBVzKEJU3DBDM5fIIJmznKQ6a81CPb
         lZCxvWJn5moRMRVWTtDxO+smSEUHDk9OyfMz7zgOO+SfxMtNVo/X0Z/k1/Go/G/ajanI
         7Dfet60Tg3IVy9yUIrd7gknZwidsn8hpv4miDrYYzfBoO1uw2Bk4m3pKisN/yfa5RKnr
         5GpwPuSIqibrCq9L13VZxyVb7epz2GQu1M4qC8J1TFNeGAXng14qiG6kcjgIQmwmIe11
         JrnHvge11rDZWIL/lSThJWKZ2Mh3DW+nmSPErcyTTZK9MfK+W0vEML7XX3iOy0Si76iF
         19+w==
X-Forwarded-Encrypted: i=1; AJvYcCXhfWXfqNTLEgia7yc0281dcTGRj4BoK2RqKMkvjVzYtEinx0T+Acg2EJhZZ03ltbhmQQY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRJMyjRXI191NnioGzR5aFq6u/VhDkQFhUCEkYRV3K4V4Oih1P
	55rCyjuzCYdOBBX+TtKOVA/pQqsHg7WVluDTxzzdMc54iVAhvGSH
X-Gm-Gg: ASbGncsZzKLcIcF5eUWBTGy7ItTTH5ZP+7Aem4u4AywxggNvWeAIrupoPXFXn+h1oBX
	k40h46SGY5fBOwij9mm1NkZJGW10uQxCReqp0sg5e3AdGu/aYPsLFW0AnsW1luJvL+8oQN4jlez
	c8L/xb42a2Yd9Atg6pM4EQU9n8ZEdm914kwIqrr+psAw8ePyVQV6x0165Ueg0XX4ABa1BRT9zlb
	66SE+a0Y5wEeDp+N1LR2Up0KIiKkozQIhjQXd4U4p2xb2qYBO6mwdPTS3nGHNFt6tiXR8Qpirfs
	c1Rb5v7FrABcltFQeMK2clyRnpDt2Q3CtbYiHmdIFXHCeb+yNX2rktFOigmkFvSd
X-Google-Smtp-Source: AGHT+IGWZHwSsvPWIGZD7v0lzUemtXIqVysf29/KMNwus1o2RKo13ASNNOWiAsEb7Vjp9//75b552g==
X-Received: by 2002:a05:6000:1789:b0:38f:28dc:ec23 with SMTP id ffacd0b85a97d-38f7079aa1bmr17417528f8f.19.1740588403302;
        Wed, 26 Feb 2025 08:46:43 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:43 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
Date: Wed, 26 Feb 2025 11:45:12 -0500
Message-Id: <20250226164513.33822-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Needed because the DSP and OCRAM_A components from AUDIOMIX are clocked
by AUDIO_AXI_CLK_ROOT instead of AUDIO_AHB_CLK_ROOT.

Fixes: b86c3afabb4f ("arm64: dts: imx8mp: Add SAI, SDMA, AudioMIX")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index e0d3b8cba221..86c3055789ba 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1619,10 +1619,11 @@ audio_blk_ctrl: clock-controller@30e20000 {
 					 <&clk IMX8MP_CLK_SAI3>,
 					 <&clk IMX8MP_CLK_SAI5>,
 					 <&clk IMX8MP_CLK_SAI6>,
-					 <&clk IMX8MP_CLK_SAI7>;
+					 <&clk IMX8MP_CLK_SAI7>,
+					 <&clk IMX8MP_CLK_AUDIO_AXI_ROOT>;
 				clock-names = "ahb",
 					      "sai1", "sai2", "sai3",
-					      "sai5", "sai6", "sai7";
+					      "sai5", "sai6", "sai7", "axi";
 				power-domains = <&pgc_audio>;
 				assigned-clocks = <&clk IMX8MP_AUDIO_PLL1>,
 						  <&clk IMX8MP_AUDIO_PLL2>;
-- 
2.34.1

