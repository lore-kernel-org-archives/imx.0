Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74757227BB5
	for <imx@lists.linux.dev>; Mon, 17 Feb 2025 17:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739811656; cv=none; b=agazuVSYkv8xPGeJ/AD50V8+PGa7DIPZ2lc9xeKMJZKJvx2HEM78w+UlwGnVOPDhN2jKjp0JC/XlbrVi5Yzh193bAimCKjO9tdsK0Fbaj8i41ap/TsfkcceH93UGIph0UftMaqvNZCCTUxvqyajtfrcpaUPKtx7Y1VhBFABV6OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739811656; c=relaxed/simple;
	bh=JHzcxwkGTQ+OHOtDsXcrrca2cc1Rfq1hPqll8mFwPvs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j6TVdf9iJ7HWhvt45EHz6z/Y+cLl8poEOTESog8mpnXwhzkzx3i741GXohIfMSP4G+G1lItteuH5aRv4RHTavZduvpdNGS+zZuPDsJ7kxCRrj6OV5CcfGYFk0mV09erIJ7h5Ubi7V9hkQ2ftyf6jr3cUtQloXJXW0Ad0OCbRZSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EvmAEMlH; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EvmAEMlH"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-abb7a6ee2deso309031266b.0
        for <imx@lists.linux.dev>; Mon, 17 Feb 2025 09:00:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739811653; x=1740416453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqaLFrErmA8TuMfUKne+UP0vowW73z4ybOt+Ip1qbmc=;
        b=EvmAEMlHoGDnlT9YlXNSxO0zKALgubBSoyzH7cvxGv4oxCJAq9iLCLvsgrMiB/K/3z
         PwN2P7r1HW/r88JNrztwDK1Q++V0/2pnU9HcECEjCppdhtat5+FmooCtcNl6YCpIhnhX
         biPXzDVAzf0UUQwDIYvcItvl25rA27Vf2MzWIfiGqwggR97qTI/tJcFwp/uQmXND53Mh
         7rAqUqB/OvXMDwE2wnxfOtrWoKCWaZeksoIAA97Fm4JofXs77+IngWU4z1xnOf/SLIpy
         NxGaYcEnP7+Spxf2EuitUpL/6L0zuuWDZiMOW4EvmZuZoihmh1R6Swn2RtFCQ0LtdMa6
         W+2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739811653; x=1740416453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqaLFrErmA8TuMfUKne+UP0vowW73z4ybOt+Ip1qbmc=;
        b=H8d8V9OtdyjOGGekkBzgAIJvQpeDk8hpxCtiiWP28Z2MhmzGzDha/6PYFp502MNd6r
         W73vh5/SLd4VbXB+TzqWZMQscZlvIl6woRyWyfFidxCc80SWV9HobbY6Nl8lVPTvZqzA
         9ILZS6g+//OQ3K7XMrk0ScL51MMOEKSU9cEDIwCaxquxmsYHoZELMFmpCNeTR7XaiPqP
         uCeiWRpyVm2LuPFi57QGKR+4w4O2davewGWjoiVWimunQ7YuzmKuqwGV1Tfj6qcLTVBi
         /QRddIjwbzveMUA0rWFdRNXWYNCyjwNrYow+XShaF8LYWTMa5qdZQtMDTOV2cMjsGHF4
         ljbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW1evc1BGgNZ2awnw0CHuD68Zcd0L+sk5MqLKE+NBTXbuapB760fvE1GcdWfVFnApQ20s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzlDWTAbOxh5zNc9B7u1KcfS2WnZousUSgYRavQE/B0a541I777
	Hdnh5FKkduRz+cBIPk7mQgo7tiC05q3ZPchK1TU8cB8Fr7eiXluO
X-Gm-Gg: ASbGncuiDCEZwc9Mwj2g5ucRIJuB8Xi1xaOpce8BfMccvKrDFc5K2PrabqaeUNn3FLm
	kIvyIUdd6wTEdCD7EEuqFC0UoLncbWoCi83QHuEznSoUYPrx6zTnmmDqLIwNJ3aAnt3Q3kTRrFD
	XqC+AVTT8oYQaEgeOecGyqd6afGurXloFm7ARfqMAPPX4Kt0zlL9LtloPW5Gkk2+bZJI0/RyBtJ
	x/DvZ2vNXcXpLwWI9pR9S+zfRDo6doA0nUP+jFMzCd3AYyyLuwJ2baCiJZQ3N7bgJX01nT6p/xT
	dEw/VDmsvdqa8hceUVlFh5ARViuPAmEN7d/S9ID/mMLrMe83Jw7h7w==
X-Google-Smtp-Source: AGHT+IHrNiu7Mfg0Om2Rj3jVA5y5sNcTyvnjB9HoCWBNScTUmN+dS44zo9eg//XHmKb0LBd6UmiAuw==
X-Received: by 2002:a17:907:1b12:b0:ab7:bfb1:99c3 with SMTP id a640c23a62f3a-abb70e323cdmr1177370066b.53.1739811652549;
        Mon, 17 Feb 2025 09:00:52 -0800 (PST)
Received: from playground.localdomain ([82.79.237.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba53376aa2sm920570766b.103.2025.02.17.09.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:00:52 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Mon, 17 Feb 2025 11:57:18 -0500
Message-Id: <20250217165718.74619-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
References: <20250217165718.74619-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1

