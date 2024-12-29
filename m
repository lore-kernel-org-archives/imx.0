Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1468319ABDE
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483849; cv=none; b=HJcl+vaaGxsVLBTTH3DMMqRbTvSt/Cq58cLNNI3DWlu9jyzXslEEy5pWWPs10CNtpjuizCj1DwMi4p/uAkxp+9XeZgP4DAx8oioL74gsdJHqLTmzHpPacKE/Eq6bZDKWD2jBsJHHd4ci5AO52PrVwEytKSCIK58SrzRzfLgU9so=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483849; c=relaxed/simple;
	bh=vc25/TFqvg0Ekr2Sm4G/VkkviBdPeMF5e7FdTWNCvAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bJn0LxITDX8NZJ6ckZ7I6qrDqAhbnjG/ri36tVVNx7EIlsozc3xUOdmsqqpd1GKxtoAmF2ur2/AgBpUniiTKU3W204Wfqxa15jXOYnh0BnY5rPYdDwo3vLynw4YZpQevBfptGBRhkZH2ILTjInLf44aWtt8vh0KES1PUHCEvFWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=O5fzkNsk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="O5fzkNsk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-aa679ad4265so1722997866b.0
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483846; x=1736088646; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=O5fzkNsk7j5UkYlpeRI+Xg3fs/snZlfOA6kt4+DfA+CHBM/rsAJQM3OcuJGxhChTyx
         GwIs1Sw35q4nxfE2bMDMNuKesXNoh04rCjOBWk8oUT5DOnBFM7tdZlcRN4aEDr6MdAqv
         D7MAEs/yBp71tEESOA+R/QHP808QZAVAIbTdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483846; x=1736088646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BHj8xJJDjB/nn7+FV+WNgNcGZHPneQlK/63TZumKERk=;
        b=V4aZGDCpc3bfWKnPiJnsPK1J/cQxOnKbI3QHvHzj3UkhJjSHK/zf56HsDaCp5GwqYP
         k5wQjN35kvcqzwT8e1MfRNoBnvwVDcAo0z/0aQ3VXQw47VC4HvNYXJInz/GpA+JjU0/L
         RtMmbOCKEnnnCTknxOHhbX0IrZxD9aMq1PisHhmsRQ9ufW8lx+gaL84s1zfTOOzbgShM
         kEjRQL5VSjC/E0+fXnXfXzj53cA3Lhql1Y33GbVK0vvVK4vNRU0XfC3y6GsU/dWdxls3
         FyUNid2d0FeffY+4qZ4Qk9V25R9NGoRfrBy6J3FKsQ2p0g/9uNMh39IYKW1KgtbgwK+2
         UMAw==
X-Forwarded-Encrypted: i=1; AJvYcCXQr2w1JOyXuxZ3A+jqWJDn++aiHUNdcPqPoRKYiiTEDFbucE93iOCjnkJKfl88dggFxFo=@lists.linux.dev
X-Gm-Message-State: AOJu0YyB9jIhOZVsUaNQSrDyf0lMzJo83pyh25RYDCbxE2Qnavt0wSNj
	K2ZF99OZHrOy94VhI6vYSKmHXqY1+Ks20aJw7JTULkPJsIF8L+gF6mD+zYuWX4w=
X-Gm-Gg: ASbGncvVfxm8qmDTLYpgdSQG8JEV1L9TMv6ppziJ6f6Xdqe8XAP/OEcV0mPDE+T8U4V
	Cu6pI+ZUkbo1PjKOXKIz2aVVxCZ1WHAR75mx7FiMz5AuezBg8EMKx3+g08NlmpMrA6ThN67Wpc5
	kTDxqesP7/EWwG/CRGig4OFZbNDR+2tsTs5ZO5yfUHXP1KG488z7CTy1Fj6LouY83loGxOB2Wm8
	MkUDjZ25mVhMOYYQtlo1Hm6nFCjto7UrpqBrWvFGhXlpSY+0dZNSz/LIiOgIWQ4JZuEY0Q0seAD
	23vJa/ePVi/akQvXVsM4TQ==
X-Google-Smtp-Source: AGHT+IE9irkaow+qaH4xXnif+LMSxixYb24+xXMhBwgXh6+OtcomA+ytcyRHDSj5KcZLfwK4yNuYsg==
X-Received: by 2002:a17:907:9482:b0:aa6:8096:2049 with SMTP id a640c23a62f3a-aac3350c059mr2950970366b.13.1735483846571;
        Sun, 29 Dec 2024 06:50:46 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:46 -0800 (PST)
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
Subject: [PATCH v8 09/18] arm64: dts: imx8mq: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:33 +0100
Message-ID: <20241229145027.3984542-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
References: <20241229145027.3984542-1-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mq.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq.dtsi b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
index d51de8d899b2..1d1424a136f0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq.dtsi
@@ -817,6 +817,8 @@ anatop: clock-controller@30360000 {
 				reg = <0x30360000 0x10000>;
 				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
 				#clock-cells = <1>;
+				clocks = <&ckil>, <&osc_25m>, <&osc_27m>;
+				clock-names = "ckil", "osc_25m", "osc_27m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

