Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE441DE3AE
	for <imx@lists.linux.dev>; Sun,  1 Dec 2024 17:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733075269; cv=none; b=oZKKEKF/jIWMtVa0DVM01FkN5rTmX9330oqevZlbDBVnF8en5y5w1dfY3niFx2NEthSlHwdr8STsgr5VlOmww1bjbKCoPdftQlpnwGNK7sSLkWd9i33Q6c4fQWU55CCPSHFEPzpgmgDmgfM/7+OpYo0JrdCtjHS+KTT/Nl8y5nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733075269; c=relaxed/simple;
	bh=w6n4rfeNbc+MoInkCIZ53r/EnS7ZauG85YmurhB5mWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MZHdYSwz5JMq9PhfqAa4dVp3HAtE9usEeZMp7eAzzvyGve+GDXsiRnR/yMp4Gb03i16qp9H2U9YmGZWC/VrA8YD4p4QdQmt4fqawPVTckHgE+LGTe1gsUBtjRFvPYwUugAULScs4kYng+gDuwpedzW7HEzqX/qvWJOe5uygh2SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=kTlHK6+G; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="kTlHK6+G"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa51b8c5f4dso514543666b.2
        for <imx@lists.linux.dev>; Sun, 01 Dec 2024 09:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1733075266; x=1733680066; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxJsjMJwTSMPDYd3KHgHpJeZxzAqqmLbUkKQAeNGZLg=;
        b=kTlHK6+G0nkx/bVGSGjaxJ4FfGaoBb6o4eX0sTafjJ8SQM+z1xUlRt0HIgqmSUS0vd
         AWR7GsfGl32+bEuHRBqc8GKYpe2z4tlQabJUYIRSuafNO5+uk2Iv7WcgHBZo5zi+jO9H
         gYbPWT9A9kCgNOgCsBDhcmppexBuJCe028M0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733075266; x=1733680066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxJsjMJwTSMPDYd3KHgHpJeZxzAqqmLbUkKQAeNGZLg=;
        b=Mafes4VTd4Mrbh0DpbuW1xacTTQvdj2oV+StT2KCvpIwAmJPk2k0v61xCUz3UJ2AyR
         XIfW/PscA7iZrpkgNYOD6pCpzUM8rjt+5D8d6UnS9SciymtX1AxTdGPnUhIJN+MPFEqG
         lTZH/i7DtDHd6szU+1bs5EVIrwnBz/Qj0cECVCTf7T0KswECBDoIPfWPjfIw5lsshkPO
         e2Lt8m1HB1nB3NJYuyIx0BIk+xzpOaJPgIeL++whb0s23x5DRSz+V81y/bJFxc+vKOXi
         LEaEud/k+Dds3GStLuOYlWCp3LiaHeivzxpGKUXPtBz8+xyGDs/Q/itqKLWQxhFRKkU2
         0umg==
X-Forwarded-Encrypted: i=1; AJvYcCXzCyIviY/C6bzLS01lSDMbNk4h+RsvsoIjSfU17CJwDVTMW0rUgGr7AUg3NDbDcwGij60=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7byMpbBQ5BxmEaNFsmAUAUhOKMuSQHjJ2rqr0IxzK1TIdbQOl
	UtmZyxsDKryKhK13x+XnYyplBWsnTcNsl/Cooadt04f7X1RuSOfZaKiSvahhTPc=
X-Gm-Gg: ASbGncvBwQqeeohR7ul5gcL27aTMfP9GvLfCgfV5l5NlvHe1VIeZtBHVZTyr3qxiSY+
	JJVZGpMUVr9PSCS0uLkb57l7bO/FK6pto1OdwK6PIJ1LqmNOC2FONFZqPYNrxg5Brma0vtI0Ex6
	jSb1o6lTKxYhDVQtwhhKBGDIoY9wIJcsvuRfUNcZEy+nIrmegn0oEE3ZuRqrX5qOYL7ZFiDfj+q
	CqpwNCmSGgYiODlHtYRA6A5gFhIVGLGRNw5lzBccXYKLX/glWrGRJeR4G322ghZbs6Yi/D4PDXK
	6eA1tX5nY9l9BStA5SRfd42SBpSDtDJSQDnXzrR7QumBkdKp4rUKFhkiHEO6c89cJRgLfCw8QeW
	DjJ5sa0y+Frp+PNqa
X-Google-Smtp-Source: AGHT+IEMnDbFieUd095y2eErzlydo05nTceNj0JCkVkJZiYgYFWL+9eesGwhsPTyw1VD3PBNGdcTHA==
X-Received: by 2002:a17:906:5a56:b0:aa5:50b6:a612 with SMTP id a640c23a62f3a-aa581093a27mr1555171566b.61.1733075265912;
        Sun, 01 Dec 2024 09:47:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it (host-82-54-94-193.retail.telecomitalia.it. [82.54.94.193])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a78esm415220066b.163.2024.12.01.09.47.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Dec 2024 09:47:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 15/18] arm64: dts: imx8mn: add PLLs to clock controller module (ccm)
Date: Sun,  1 Dec 2024 18:46:15 +0100
Message-ID: <20241201174639.742000-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
References: <20241201174639.742000-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the PLLs generated by anatop to the clock list of the Clock
Controller Module (CCM) node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

 - Added in v4

---

(no changes since v1)

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index 49be492b5687..aaa179784717 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -643,9 +643,14 @@ clk: clock-controller@30380000 {
 					     <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
 				clocks = <&osc_32k>, <&osc_24m>, <&clk_ext1>, <&clk_ext2>,
-					 <&clk_ext3>, <&clk_ext4>;
+					 <&clk_ext3>, <&clk_ext4>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_AUDIO_PLL1>,
+					 <&anatop IMX8MN_ANATOP_DRAM_PLL>,
+					 <&anatop IMX8MN_ANATOP_VIDEO_PLL>;
 				clock-names = "osc_32k", "osc_24m", "clk_ext1", "clk_ext2",
-					      "clk_ext3", "clk_ext4";
+					      "clk_ext3", "clk_ext4", "audio_pll1", "audio_pll2",
+					      "dram_pll", "video_pll";
 				assigned-clocks = <&clk IMX8MN_CLK_A53_SRC>,
 						<&clk IMX8MN_CLK_A53_CORE>,
 						<&clk IMX8MN_CLK_NOC>,
-- 
2.43.0

