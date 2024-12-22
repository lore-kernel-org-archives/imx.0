Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F21C19993E
	for <imx@lists.linux.dev>; Sun, 22 Dec 2024 17:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734887154; cv=none; b=OQ15cjxzc/Yju/9mb7tt9A66zFQrWC2fmrexRLV3swBTc5rWyGAeSZxh44DJGq49y5FUKiGez/u1H+oXb6k5GrmGh1++a9o4+wCtzyMZs4l0OPEUah2G5YS1IXuIwHWSIxInyd5wnG5dI+X4+AMNDfGyD5ye7eOQdiEN00rvFs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734887154; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kKWfnEkKOnC2+VvtVAeL1CmAkfY6jsS6wnBub0kbigBfOlwnRSRIJnoCtDBmlkc4Xr4dVSOtX4H+TmdqvBigO3kQLsSMEdy/Uc2HLqb9g0Iey7tVrFmo+Y8ySk85MhQzo/TMNpQfqMz6OXpXploN0Qy8KUdOXBy69F6ulSSB3TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=memGbeUP; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="memGbeUP"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa69077b93fso499877866b.0
        for <imx@lists.linux.dev>; Sun, 22 Dec 2024 09:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1734887151; x=1735491951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=memGbeUPqBkGtgZse+QliIV6mzLbsjt4aFJhV4OAdO4XJnRgOk0RNQWH+Q4DPNy6zx
         4J9cUrASCU8mzhPr75s/Amgzh7dg6TjLi9qTFhgmKNC6HdhkPhmoc/Ir1cMg2GbwmHk2
         hPBT2MVHOAjKStnIvs7ICfrNIBrPQ4WArVcwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734887151; x=1735491951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=rjn69PObpaRqK9TJfV4BbaRbaWANj+42xULYCpqwOTcMe7SWhRVRhryWn0qO6GVZWS
         gkTEuiAZJKYDlNHZHiT4z7qrPK9j94kxV5AxruMfjLKjcH7BCvgwQ14Dvq8rTnq2zE5E
         eYMkm7v5gB3rEFve9yMIBDsQi/3AHOC4ys/qV7Tr2OKO+kUqB7xClV9/mWfiNFqI90P3
         Pd6SEdWJuYYCZyzovJG5zyTo/5XNu8yl62tmEPOPmDVUtCO0k9Aqz+5K9AycUGZfdPxa
         BKQXiXleLB6ExyyXBnSDH7xsGpbwq2QLuJgIovtG7MMLIxM1EgLB29c6ks2SRt7EhOpI
         Jzxg==
X-Forwarded-Encrypted: i=1; AJvYcCVd4MLxZ9ymh40wSh0cfmeOegKUBuXdyLya5Ckft21bHZ769/IaFhzBhQpQ2QDLm6aj48I=@lists.linux.dev
X-Gm-Message-State: AOJu0YyPF6LXPF4SyMqnaMhuXCJFAFzlmv8/3SNMv5AvmDyvQvFUvYE/
	2/xspzKuL7RTcJjQlmPMxco3D9nQ2HuT+KecQHh3SpDQB+vlaTiT8Kgqudbtkgs=
X-Gm-Gg: ASbGncuR07a1IbBCpZag6TMd+rIGBUGDswbjRxGXfzkVQLOFvhRULnEoCXxPbyqrB0q
	mFIzSAYB9h0mNHOMZdpQ9mibgjGsfGipltdhCugicLLzV0/rqViPgkQwOLg3oMGe3FK4TT4GqZ7
	z2EtcA+n5dv+K79cTBU9DkPb8AVYuqJuNKp0OuzGsHuiltO8BixYQuelXahnrzj227tXD0kpWgh
	MKzAiH/0KKQqK34Sncs5dUqLVYKq2TrrA+z6bausu+tZsyuA7iIOgRAKA72ozBQcioEeUxVLXCU
	snY6Yh0C4q6cxOeVAxNVA2J20P/1/zmDA9nwXz8CESw8GA==
X-Google-Smtp-Source: AGHT+IE7qlrIBo/sacNeaS4a8N/VEhyD3V5TtGsjcDWXgBSetS3Ohl7c0tUQC6AZfXDecI4twS+cow==
X-Received: by 2002:a17:907:97d2:b0:aa6:ac19:b579 with SMTP id a640c23a62f3a-aac334b5806mr974631766b.26.1734887150752;
        Sun, 22 Dec 2024 09:05:50 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.amarulasolutions.com ([2.196.41.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0efe48d6sm414056566b.127.2024.12.22.09.05.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Dec 2024 09:05:50 -0800 (PST)
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
Subject: [PATCH v6 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun, 22 Dec 2024 18:04:22 +0100
Message-ID: <20241222170534.3621453-8-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
References: <20241222170534.3621453-1-dario.binacchi@amarulasolutions.com>
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

