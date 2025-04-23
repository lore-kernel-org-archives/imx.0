Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE15B2676EB
	for <imx@lists.linux.dev>; Wed, 23 Apr 2025 06:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745388191; cv=none; b=Ceah8AIIfWI+EKEOcOt2eG/5CMcQZ6mC6+0UlEqLGDM7m8OLsNpKB3/j8HuWCQ8ldxi0hvl7Ph/kzqB0+xnW5/40VDneEF+lEz4LZVzLaPg8oLBe3IrQZkhhFZp828HVW6TrEsndZgihWVazy7zVDPCvv9dRUpR0HKRyq6V12Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745388191; c=relaxed/simple;
	bh=6Nf3p87xmE+b+aldFiQfNcyvNboXQjvT/SrC191QSNI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BoGqkTDZU6Uvw9h2xlrUS+y3hAzlpKefbcvcoaTZua0jUkvXi37S/zft5x6Y7ldxRYAN2Jl6krvXqi3nKk3+qLGKfyzH7Qw4FOYy9m+X0DSVYWMa3VWHXeFLoqAtiRm1h5IpjznxHYIXXBvOCv6im5JsqlWHRU00k/WIoB3Q0HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=eFDDjj06; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="eFDDjj06"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso991017266b.3
        for <imx@lists.linux.dev>; Tue, 22 Apr 2025 23:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745388188; x=1745992988; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=eFDDjj067t/T683E6NC23fW2mg9vjHLjXBW7qQIQSjBb1wX6/0e/K0xwc93cTNrg2/
         cM6UxqVZFNdCokFbsOLP6lQ4T8AxKtdP6z7qmNVXr4pLHgXweVd4B/Bshut31peVvfgj
         5BeAGRc/prf/A5fzS52Xnp7Mi9uO7Y3GlqmjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745388188; x=1745992988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjH/2kqdCORlSdLYP6r4xpoVlQIwGobZVf64uO8zUM4=;
        b=wK0TbME3MQsXkEuQu0MPMt0W50GfqSrf0wx00GTecBAF0lIqKufn45jHfoAt1TfTQa
         UTvUYIF6Mo2YbDKBbYljpN5AP1gk8/5trMovym1Q5hjcFYssIudeiCtGjJR2N5mbwybJ
         LaDRMZR2EtxpqskOpXYOQxqEl3KRoJ347c/XpBJX4EGRYa+9HPF3vC1SOr781MhUhYso
         fvNoMRAZl/1Wrdtvo7uityeezyTHn05gp3/DlYogtoYmEj+s/y0DB6i9hfrbU6FxYAQV
         C8dP7zG58Hzgb4ZVH2Es0U/mCob7M/13SyvvCxhEJ08iYR1UDdiGuoZWqcprKteo/zHU
         Eg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWLanpY3wkwhFD8GWwHopSUlweyUZWuHxRwsOLJ64p55AH8gLYJo/P6SAKXxQwkTNfRK0o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzc/vMhrWpd09+Sza7e66LgYayEmCwF0VwnCtvg4Bh4qQ/jGaif
	nj7CXW88ScpwLLoNMXWPvJRZOR/KtBSK6Xjy2Wk5JeEaDdzwf7np9tNWDFCjCKw=
X-Gm-Gg: ASbGnctfZGmLWbyDVx8eV4CVO4jhTOrHqCf7W+kHC6BvwZqY30x7U7ShDOnhj7nMvIA
	IrJtK2SeQ9K9fXoHD4B8Xe8SZ5RfMladTrBYtou2SU1T5GA9DetSxWw33da7oqJDBahS3HDsUYw
	cgoaXM6/GNtmvcWkk7+NjbJiN+WBLxa3n5SyGL4c4pAvKZhyf9haiZOiIR/GOSkgh7MHiQEX6xj
	KUafQNGw4pmSZYlnR1W/q6uNzQv7m+ACSggLZvbQxqDI+5mlEx5U5v3q6UvncBod98LhtA5VBcg
	j9I8FTt8htqlUrmHqCvWGIxa/sBpFZaMpr+7jV0c/uj9DINY8jzSZAPVqdno3JFhExszBOKZKxT
	pJ1Mg
X-Google-Smtp-Source: AGHT+IELsWvXw7F5FZt767HR+UyBJn9wcMcKkXhJc6P2zEo6Q4Ars/jQw/zuDlIzWD0FzCHnIL24gA==
X-Received: by 2002:a17:907:9708:b0:ac2:9ac:a062 with SMTP id a640c23a62f3a-acb74b38943mr1561283466b.23.1745388187989;
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.29])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acb6ef9e7e6sm745234366b.162.2025.04.22.23.03.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 23:03:07 -0700 (PDT)
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
Subject: [PATCH v11 08/18] arm64: dts: imx8mp: add anatop clocks
Date: Wed, 23 Apr 2025 08:02:25 +0200
Message-ID: <20250423060241.95521-9-dario.binacchi@amarulasolutions.com>
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

 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index ce6793b2d57e..78d71aacd0a5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -709,6 +709,8 @@ anatop: clock-controller@30360000 {
 				compatible = "fsl,imx8mp-anatop", "fsl,imx8mm-anatop";
 				reg = <0x30360000 0x10000>;
 				#clock-cells = <1>;
+				clocks = <&osc_32k>, <&osc_24m>;
+				clock-names = "osc_32k", "osc_24m";
 			};
 
 			snvs: snvs@30370000 {
-- 
2.43.0

