Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FFA199396
	for <imx@lists.linux.dev>; Sun, 29 Dec 2024 14:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735483846; cv=none; b=DJiYa4mW2wNbsELwnYAXgAuHhreDZdYiUQxro5K50Cf7jihqWt+YFM1Sm90UXQV5a1H7B4wugueqQEQ+trfFqm4ja9/TI37KnbBIoVPJU+IeJiMAXou4hIEBUl2Gj6X3zGjgKXIPXUIdjh9Z1zxPqQvsdZoNIZIjf39Iwluilqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735483846; c=relaxed/simple;
	bh=MWwhsP/1Gq2jtC+XMH/+PSmlpfJmY2R2gm9uwDR4fZI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lSOURF4NDFhOSv0AxSnebpj/C7rwiOYfs7TslycWevy3c0P4vFpNIPIS4vmlNc2qpBmPkZPlM4CpTlBoyZJKgCPsMrjep06SYqe7hf3uY79zKF3KkL8tdPb8ZoffUqkpecL9mfEG5Z6sbTjJ40/mwJOei/AmSwgD30MG+4Xn0BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=QeQznSC6; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="QeQznSC6"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-aa67f31a858so1520362966b.2
        for <imx@lists.linux.dev>; Sun, 29 Dec 2024 06:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1735483843; x=1736088643; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=QeQznSC6Wj0oIA5JyiCJdJRV0fiwkPIm6r0D64WH7NhIOUb4/QUTpaHQ3HL8fXktMa
         546UipNyJJs+A8IHVVCPArOkcd6etXlLnK0DE7IxCXWCBOcXcPZ2u390t88mhz6oNzdh
         xC45dCsnh+3KWvX1FTQtw0Irvfj8NGRUbjMmA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735483843; x=1736088643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mr8rvSiMKhhr7+g2wBjSbr4ZapMlTY5YRIRH4XPzpek=;
        b=MQygztzhUPO2MDFMgDXFzJ8M2awUZROIUtcOxC9CtlF9l9b1WFa8+qrr6fAdS+8xmG
         VbGuVEDUOiQ5cDUSfhZ7WZ3sz6ujbOrUU1uz5f8k9txzNwS58lp7E4plHZGZoy9JMOlo
         RdyW1I0JFlCxb2VS7VPf0MX8fu+kB8km868AV7KyV0V+PeXWlXS1hAl4lgmEO4+kN09s
         CPD6wh5wVwCUfZ2GnNNzsxDoh5uo5dUiAlovkLma1EswBPXnMV8eIyPzPqeV19YpATRH
         G3qtiZM1tl7SRyDseKVrixp8MPm9VSZBGB4wAFGXxPUW6ehGU/NimMxTZj7Np3h/9kkb
         7STQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKUvdIQeAsZ3yCeHEKQ3+RGNhB7ozUz0Kbyk9BX4oTPYoL4uY/5MPvcVPLxzc4/x8k9x8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwwBcLbObVTOlpHRm27OxCH2EN9mBKgLYL2y1qi00fCMwyE42nw
	+opvj1JXLF5SH8QqepEFGHkaLQgvHYmN3ATZnZaWM4Qpc3rKCAyeSPDQ/mrE1aI=
X-Gm-Gg: ASbGncuMqHdRbv8Rk+2v06Upr42XLsqCiZJoLNNnVLWKe3nzQ+74g93JuNHf9xJu+0m
	7NRp0lZ+ypktyDYnARV6cAG5fpWqwstKx6FQ1XEOQ/5VuwE1NJ0kQ/iPqs48m9kYF/WIaitv5aY
	63VlRY4BNu5CB5V9sWWLODBlx6o2HLbZrUuKYOlWgLCOT4/EJAWE64s6L1KXpboTpI0nJ2sQO0t
	cGkuQUjfjSX0rWaOvLEIkH+69tiPorH0YxP3v+n7N8SaIisE0iVxFehHOFgUsQECpA6HezEx7Ek
	ne0v90/ecpPCDHek6Uh9TQ==
X-Google-Smtp-Source: AGHT+IFDrY6B7oSvA67ot9ukQjCg8UM4FQr4YLiQDwamuPsObDrBp+CwuA86CFPPQhHpy2R/frIabw==
X-Received: by 2002:a17:907:d9f:b0:aa6:9ee3:e51f with SMTP id a640c23a62f3a-aac334e377amr3135317166b.41.1735483843575;
        Sun, 29 Dec 2024 06:50:43 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.43.175])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aac0e895080sm1362084466b.47.2024.12.29.06.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 06:50:43 -0800 (PST)
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
Subject: [PATCH v8 07/18] arm64: dts: imx8mn: add anatop clocks
Date: Sun, 29 Dec 2024 15:49:31 +0100
Message-ID: <20241229145027.3984542-8-dario.binacchi@amarulasolutions.com>
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

