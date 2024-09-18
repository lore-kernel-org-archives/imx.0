Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4494D1CA6B4
	for <imx@lists.linux.dev>; Wed, 18 Sep 2024 18:22:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726683745; cv=none; b=NIeOmhWMaCR09+AcH5EFkoQG5DwQ5UXkptlIZQgSsaCFa5cAUxElZbMmuktB/EuyMqy4pSm5wSoYzES/hmPhikpI5oYyrJkR4kEKl8QJUx58NLoVIEkOFQhQ/ACOg7I6uO7OKlntgIdfN58A+owteoaba4rHnySR/DkC9Af5BWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726683745; c=relaxed/simple;
	bh=8YM19QzFCM8eGgz8EZ2bT7GjdvGuC+VGDNjHEuN4oag=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QVg/qLyOJlgswG7XMNuroNvgCuwrIcVud6UfrPiKgTOxFONMc09kMPaYXa3yJQXH+9vImRGCS4nBf4LEJIP869xlHzFvWvsL6RUfOcHHYU1I64v6I/XRSnfb6hKz5470pYAs3rW1XPVTWXp8s4kZspv/pT0OA5eMEZncczjC3gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KoSnDoLI; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KoSnDoLI"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5365cf5de24so9025423e87.1
        for <imx@lists.linux.dev>; Wed, 18 Sep 2024 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726683741; x=1727288541; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1DCE4EQe3FTB3Zd1ByKm20TKFtEumk9lprGlloVoGEA=;
        b=KoSnDoLIT7eqtoiw36MHwATz1SJjFDqIyFzB+a4CSWhs28zTthBXnLCoGJeon4Qk1S
         XZst03S60CJP6toUIydNUQ4zbrif3sgU/ARdL/AgRM+q6uyTNjhJVlHtnwCkfu0uZRv6
         8TxcoRlI8fPyQ/joC120aiy1pGo0KPbLtnEVkyTkrpWAOMIaqzTcSUOzdzuZm3iKg4/F
         uQ3FgzctY1N2cmRAJQ2wLYOBHT/Fmy92lzEcOb6ZnvKcDtEGE0Ihka/Sf2y6VZZxx5Wv
         x7T8nqM6qZfrX4cBcIA0z5+XrxERnBPflCbCyRZP0FXynE0r8S1dvOiR/UyMlyLfWdE7
         p7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726683741; x=1727288541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1DCE4EQe3FTB3Zd1ByKm20TKFtEumk9lprGlloVoGEA=;
        b=TF4ZbtQ8JsocZTgQfqQHT4YHu0zlgGIKL8siJfyRpZxMonEMuYD0Jeu0sclSfZD58W
         R31gjjgDmvrlDcTyW/9MquLNOwquPLDBJj5ZgCtbd6Bm5U6PIdvkh+UhY9eRyhVt62Vk
         EAJtTrgyNuYqNzwK0GV93aKeaAlwvVgC3So2Ak2UmvN/GOvjRUKZNd6ryG2Jv7B4QN7F
         5AJbzRemaeJN7nTQu8I8FlhgZXLosW8cC/QQTUR71x3w4k5WOec9rvF3hrqOkFvlzKDp
         TAQWj8fUcTrz2fuxR4XcGs4aWP57kNdf2nkjB2cLAYkzfzo5t7jGMWnv1cFSVEa8+x0J
         mwAw==
X-Forwarded-Encrypted: i=1; AJvYcCVRcuWo3boVRYOGOJQcTBoKM3iJrWt3vSZlT+DFtSSar8UwOeV50jj3Bysz2HkL11NdKrg=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsGskrrwWrvg5jvQUHz3jLDatGgsiP6uvwDo9gCoK6iW/fgJdv
	4rzYtiQiPR0U3uo00QzktVzzWlpFP0RMPlW+9YrxnwKg7zbO/tCK
X-Google-Smtp-Source: AGHT+IGEFT10GNPLQpnYd/skpk/L7HV79dsRiA8pFMtfFOceX/X7PZQXcIB8iPGV2an/mF5hnF4DUQ==
X-Received: by 2002:a05:6512:3512:b0:536:a4d8:916d with SMTP id 2adb3069b0e04-536a4d89286mr532824e87.34.1726683741352;
        Wed, 18 Sep 2024 11:22:21 -0700 (PDT)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c42bb5312dsm5200146a12.23.2024.09.18.11.22.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 11:22:20 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Iuliana Prodan <iuliana.prodan@nxp.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: imx8qm: drop dsp node from audio_subsys bus
Date: Wed, 18 Sep 2024 14:21:15 -0400
Message-Id: <20240918182117.86221-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
References: <20240918182117.86221-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

On i.MX8QM, the DSP is in the VPU subsystem, which
means that using the dsp node from 'imx8-ss-audio.dtsi'
is wrong as it's placed under the wrong bus. Luckily,
there's no users for the dsp node so drop it.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 3ee6e2869e3c..f8b577ebdbef 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -603,3 +603,5 @@ mipi_pll_div2_clk: clock-controller-mipi-div2-pll {
 #include "imx8qm-ss-audio.dtsi"
 #include "imx8qm-ss-lvds.dtsi"
 #include "imx8qm-ss-mipi.dtsi"
+
+/delete-node/ &dsp;
-- 
2.34.1

