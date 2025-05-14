Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A52922129D
	for <imx@lists.linux.dev>; Wed, 14 May 2025 08:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747211123; cv=none; b=c1pJhGr9JLdjNBwoLXlxjn9o1tg4LdXnX181/Gj7JqHdRG+8nggt5L8TpjNvHbr6E+V+13N3K5943i9qp4bZPfcCXk7SzL4j9b/J33ufIvKpaCQyma7SW7A7NGXOQVALCA0G7H92piOwVH0iBthvPcAMGF45bJQQMmEeXWtLaZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747211123; c=relaxed/simple;
	bh=ZipZSEekCOwBPZ18Fcs5qi+NhaNjKzgEVYb+83pi89E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mW6L/QKcPw/BuyKIxXXO78+Yr1Mra6jPsILngkHQR1mKhW1MeIQlNYJnWQKP7Qq6bfCymkrntUhOnWGBEDPg498X5wCBqpEP6LeMWe/dv5GVej1lYioDIi3aOXlUWObxM0Rlb+tfRUA2M16ug3PwHsrFpH3KgHr8tkeT2dGehC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=XUe4KupY; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="XUe4KupY"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfe574976so47187335e9.1
        for <imx@lists.linux.dev>; Wed, 14 May 2025 01:25:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211120; x=1747815920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=XUe4KupYVcZUfoXYi1pwyt5P5p0Vn3vKjMbgKHLPmAHv6g2U1QxL8I6VQi9XuKD/t8
         25AS3GhX/VuDGuD8PvqmulJZqgshGr01DLdo/yS9aSFx2o+rB62nytdZJjtIvJQxvKc6
         +kpRa9kUU9BsLhfrF17R1vmNt36R5GBOXpBxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211120; x=1747815920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aKqfhyziPKh1buAFQiruekyv9kuJ09baYGjn2NGVAIE=;
        b=f7lxyPNl2LJfSHqLIw7hR8CYyfDFOrU1AX4V79ZgbhtE7Vh1ikH3g5R0Vq3o51h8Nx
         uZiFSx4Hnte1D1GLaHsy/k5MSEfAdjFEHShPyMJDCoMKOffRa6zJceKHjT0XHStgDiF0
         jsFwzcvW3uNo5WCAQq/gevSeneoq9MU2+uUvxIYEfd8K2VSPWksa1kYFphn7yDtPNj+a
         aTs0bEi0opw0zWO/fEaKdofsQfdT/3qs0XVeLV1KBsAp3trU+pE1aooNawA2sWzZaWmT
         cRJY6YuxROSZkfxbRjv2Iwkl/RF6vl6YMMMsxuiMROi6khCcyMQ+tDszblQYJaIzqwBN
         WmFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZtLqosJTyzaxa2klzq6hqZE8VWaBBp9nHW//1wUq1aIdhIoUrAM06agsxouX/A0+SDNE=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/74jPrsPbPpKiWdgatRr28toMSxdZ1gkq6FazUBXnWLqLAlOd
	QAWRYRkpBWTIOKc0E3kelumvDX20YJHr08lIObrD3YJkjqiqZjbOyKH6qBHugaA=
X-Gm-Gg: ASbGnctqpVrSuUuOUS6u//2jfCIpn5wss1EIssNNWeBeZVYwmfodopgHv10fJkTBg8d
	xzYmqjh/JwhnGQeYSm7iKwjkhc0MPcIEyOyzHsEBncQhrNVcZAE7LsXA3kNMU7wmESYfV77+2nR
	Rc466JBbVVdZze7/Ic+OPsvXKwYnyIfbK2y4LAFCAOkeKMyT5Zut9tmc9xroPqlKtOS1ZsjMq+S
	1knEYNJGl2lnNIawQXP+oPG2uOzdYM6OcaTnIz3yPisPe8GpUQD/itiL+SmZ6+hkZCE4beHFjup
	4retFS7BdiXtZL3d711JHiy59rbJV0bcKZ6fgYcdxMnjS6CPXTrb6W9ap+Tm1cmUNrrTtR/SxzH
	JcgQf4inIA8yoifz10vzpgnIMETc5azE78MRkmP5M7o4=
X-Google-Smtp-Source: AGHT+IHcoj4ReIr/iS8EBigcY3fpcStHE6rMJeIJaxLW28FmlfG9AFQQiTloWrHrTZYCmAs4sAUIcA==
X-Received: by 2002:a05:600c:1e2a:b0:442:d9fc:7de with SMTP id 5b1f17b1804b1-442f21696fdmr16799435e9.22.1747211119909;
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:19 -0700 (PDT)
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
Subject: [PATCH 6/9] arm64: dts: imx8mn-bsh-smm-s2-common: Set minimum value for VDD_DRAM_VPU_GPU
Date: Wed, 14 May 2025 10:25:00 +0200
Message-ID: <20250514082507.1983849-7-dario.binacchi@amarulasolutions.com>
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

Buck3 is called Buck5 in the BD71847 datasheet. This buck supports
0.55...1.35V. Set the minimum allowed value.

Signed-off-by: Wolfgang Birkner <wolfgang.birkner@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index fd12b97525d1..81fa0a8767e2 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -135,7 +135,7 @@ buck2_reg: BUCK2 {
 			buck3_reg: BUCK3 {
 				/* PMIC_BUCK5 - VDD_DRAM_VPU_GPU */
 				regulator-name = "buck3";
-				regulator-min-microvolt = <700000>;
+				regulator-min-microvolt = <550000>;
 				regulator-max-microvolt = <1350000>;
 				regulator-boot-on;
 				regulator-always-on;
-- 
2.43.0

