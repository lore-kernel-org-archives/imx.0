Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC62222371C
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211127; cv=none; b=q7QhRgtgWW7Wjy2u14nB96Scn7f1UF9UIoBElV1WDUYOV7HnusyRP1TOdzWQcM0dIemtqYEnMUL/4pgvasYhhDOpxGwZLPHLqcTloTfH1piiTlbPbCd7hoJ08irCGEMqiuJGgN36OC2AeR95ho3fbYaMFClIxGPUboV4/OI5RW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211127; c=relaxed/simple;
	bh=v1lj6aIoiBJtVUQdgMlwatZDrIj+3w6BOUH1TvFoWTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oxSER6a490313qKtmTpUsb+QJhLOcOJmBkIL7pwUufrk0nZwad/W/nAyTj9aCV7ms1oaYQX8Mt2liZNrucH+gjeiuUsgb8rO3pZcU3zftJgOMAzq8erukJSLb5RygLoFlkXW1djRFq6SAMw0FcOKYjIdBjX163bFgCd4rRvT9jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=OfdLhClJ; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="OfdLhClJ"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so48623505e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211124; x=1747815924; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=OfdLhClJfPK9QoDW+Z7b0dvR5hpL5fA0xbxPCjMAinjnsluyPky8jVNVbjRuoJosDK
         7S9REmZAJE9TrxX+W/Tq7N+xZEHiKwbwTUSbp+epMe89ng7Jbj6LLOLujwgzqLnMVlzo
         jlsRQrnBIEANN0HJuykPb0/LqvIt+w0cw3/+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211124; x=1747815924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhlcmOITgWC0ZjhzH5YcAyhWpu7bV5qwJnw5n2FjucQ=;
        b=uDq5Kr/uerX+yPUu4ibNZb7NS5a4f9kQE2xoC/y5ggEfkqJbHXK+2ybo4D1yS4wvFp
         iY1bc8XZ/r6U10Yz0loc5yAULE3HYu/GQX4znrJRCAD2PXpoNRk+pZlT4kchljO5E1oo
         JSNlivwX0io8MX+V6z8KH9n6VVZyUlc7GY2+93y8btsFH2HmLKIGsxCX75JhXR6Vl7Sr
         hHlYvPETbXV+pxHwvTBvl7Bik5QrmUiaNrUvTocjYr4GcOptxxP5NUT8Jnsm39rkbkzL
         fZWQhjPpOb2n2q85KEo0GnnZGUeHPlHNmx3ujWZkadpQ+bZ8d8AJ2zQti5nBO1Aufvl2
         6w3g==
X-Forwarded-Encrypted: i=1; AJvYcCUiyqSmT7f62DEsXtLG8tOkeEjmg/i7c7QL+dlykcjf6QM768kXaj8raMJfNIZQEDJxteg=@lists.linux.dev
X-Gm-Message-State: AOJu0YzxsRcLlkupiiSemlV6ty45VUPOXuVztSRhCHkS21E1x6DSkQgL
	ukZAXbHtCc5Z315s4/8zEcy7Ua57dim9/zGNp7xZRMc2DNQTfj45AP0xjSSxjjM=
X-Gm-Gg: ASbGncs6ruyzwxP8m7zN6dEKXEIZ8egRo5DHVnQl7skELEJtHrYH21zNoMgMHcvqSkB
	hXmC8zuLljqUwBp69nuSXEY9SsOYNt3VUBZJvXaqMwPFQV3Q1JHROigUcKmBD9jJ6NHba8MIosc
	ShKH1t8Nq/EXxf1n8QYWIAqWbvTpPbpofe05gsR3i9nSaAw6il/3q3yPififqGym5PjbVydSmZA
	nrbqO1YPnluq9Q8NCftJbAsq/StU/qrORa8TEJgyaaOo3WLyaINhluoQI/Y8PP7mtGgEEaTcaFb
	GsdADiB6d+pnJRxEjgS4Q7Voz9IHiN0xtXWL+lN70Hhhid7oqPanc+bhr74KymevJDklKDvrpCs
	m4nC/PtbdsOgVcY9WBPn54UGJOYwAuM7KMIW36ML+PQ0=
X-Google-Smtp-Source: AGHT+IGAQQ9NlUKuvedZ7pLG0Sc9I8RQwhVN2gN0j3XvRSIGwZgxGrZPudb3M0+2G9JZsIqwK0mXVQ==
X-Received: by 2002:a05:600d:d:b0:442:f44f:65b with SMTP id 5b1f17b1804b1-442f44f09a9mr11192865e9.32.1747211124008;
        Wed, 14 May 2025 01:25:24 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:23 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
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
Subject: [PATCH 9/9] arm64: dts: imx8mn-bsh-smm-s2-common: Disable PMIC SNVS reset target state
Date: Wed, 14 May 2025 10:25:03 +0200
Message-ID: <20250514082507.1983849-10-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wolfgang Birkner <wolfgang.birkner@bshg.com>

VDD_DRAM was disabled on standby, therefore the reference hardware did not
wake up reliable. Use PMIC reset target state READY instead of SNVS, to
keep VDD_DRAM active during standby.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index ea8d741c6904..633874b3bf66 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -94,7 +94,6 @@ bd71847: pmic@4b {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
-		rohm,reset-snvs-powered;
 
 		#clock-cells = <0>;
 		clocks = <&osc_32k>;
-- 
2.43.0

