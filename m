Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E6C2673A8
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388190; cv=none; b=oPSnA+bN51y2DC1l39QjlQTG9QABe8E/PheCQCXZZlncHadkv3VM2kCNcXG1oNjcsDjPZ5vsV7DnurZ1pACovPwxSib4BIOK8g2kH9ss5R7Cv4PMn0yJlY4VQ+MIGMNfQACNjFj6UJih2QbwgKe90lZmh5j9g2shrDXV8wg9bpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388190; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VhNBMhETOe4PHzdq9ktDrkqdN9XaXO+GhlB8sHqFRsSiaTfysK6JsszDczmgraC3F5jMLbYzj2xN2XO0lyWFsRKDJVTgHVTCLjX0TG86XXQPmzqewScycWgj0fLOUl8WcHSJOJhyl7kn4QYmogVFWdWsbq50jk6dZlp8hY40Zsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=rMMauZEC; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="rMMauZEC"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aca99fc253bso854604766b.0
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388186; x=1745992986; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=rMMauZECoFv/LVkNV4I9Tyf/rwjJwUF/JvnXlo1DfckivZzROVsq50VMuoNnUE5g6G
         /GLdx7AT59t/6H5VHPwBuWCjDWy0IzQFw+z8j2A7BahQ7RsGK8dTVvAez9b/o+4gqkzA
         tbToMdMcRao6hvOUKfcmHeh97gmh0vqMh94j0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388186; x=1745992986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=AC93sjD+keCOItsxt1dvxItcaKG549mZSieEJ+4ZkbpR6YuRZgUWJZOAHQVJEBm8Zf
         clxpXNaikdmHzixRqX+RyUhuhg7EdpHjxYdINzG5SUpN+xh6wP+XrjcVVDgDHbvpKZII
         +YLr9hnL1+zLkpTt1Oi2aAjckyB42np2uQBGM9YyRqo0/7LCc8gQTBs5tp5LINb5K6cQ
         RmLQdNBQ+YzH77obVCXnMOGF30JjJJAJO81Ai7P8ct6RVTha44q8XxqwwxOpETxN2szI
         gVXHsmauyj3qlWe2N3a2xuq0n5kMEWjEII7EBlZR5zgUczhWKQVk5PIKdLhrl09PpMw5
         5JkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVjoDbpNwgOY8rXje2jSFVTVe7kgAEntRg5XcIYS557WZLMkmS/bwwqK7U8OVa0ljyQpfo=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy/fa6pDK2IWk4WJsrxyhNJt+jRyIZxLsfMBeUAxkv5vs4T1C1d
	35b4VlGzbKZ3uWvJJdKY5T07wDlU2RC01lnj+cigGkeg/u0UAcVttkc384fhTOc=
X-Gm-Gg: ASbGnctltSez06dYQiNcX5/Y3FCG2oEStFSyB4tFBe8XGRITvYSqUpi5LYT6S54lSln
	vG+G5V4b2cf/nG0F7cNXwI0Wf0WnoXCOco8cBT2DqaZR6gXcxcFUrP74l9oDKv9XbZ2R/sM9I7J
	dPciraO+SEEfcI5nN19RuNh56G6HKGMHxkovA+FQ4vsofujUI1AkUS8a9NnlA0wnIx05GL88guw
	1yZADTAkDc5rJu7qyDaY8EvnihiY41MuLqTfUKDOgXrA07d4Xn8PqJ1epvBljlfS2jGEdy7feqb
	qfkupVrTKyi7CQ1a5DaQihI3CIWtkb6Gkl5NfNJz4Nzb3WpZyxCTYKltNT76meiYmre+UA5gsqW
	VAL4D/QIY6IIOURA=
X-Google-Smtp-Source: AGHT+IFHRVjgmo/Rf2x02+US2TOfqy1M37ZfZe16WxtkqyYMdziLzd+0fdDR5em6xjEUFwKXEO/9vQ==
X-Received: by 2002:a17:907:2da4:b0:aca:cad6:458e with SMTP id a640c23a62f3a-acb74dd6021mr1627869566b.43.1745388186587;
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:06 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v11 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:24 +0200
Message-ID: <20250423060241.95521-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
References: <20250423060241.95521-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add clocks to anatop node.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v4)

Changes in v4:
- New

 arch/arm64/boot/dts/freescale/imx8mn.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn.dtsi b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
index a5f9cfb46e5d..49be492b5687 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn.dtsi
@@ -606,6 +606,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mn-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

