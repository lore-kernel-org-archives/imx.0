Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E2733B895B
	for <imx@lists.linux.dev>; Fri, 29 May 2026 10:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780049478; cv=none; b=RmCgVmJweO/KZpLkelArE7/7qeT77bngb8nYSgQgNjLH/wYI8kZmU+aOsRYw2sNAVYC3ORHvM2ZBoJAd84f+rl8KrunmtElbypbOkLeeEKcfPiPKfYrTs9s6ZAq3sMM3MTl0B7faZazfcmvzq54CbDXervrLTXE5EblWzMnB4g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780049478; c=relaxed/simple;
	bh=goCzNe5aJpe/5il+rwmBp0a46eeCz/QD2HSkq25wWo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sZEcA+oLq+05TeG5dmQqgY5WGDnKen2CFeNQpgQL9uHRgg3G08Q1gY8knG400q7Q8Mx+2mqc77Ps1+hqg80AJTSbvpySPGRQS0xjBE0c+yINKCXF11fMQ+zTQiLjZTk9eI7Zv/4IuqXwWhI85W5sMFjsgZc4qxLNvf2zmlOw8YM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a5fHgOPZ; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a5fHgOPZ"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490686877a1so38775445e9.0
        for <imx@lists.linux.dev>; Fri, 29 May 2026 03:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049474; x=1780654274; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=a5fHgOPZXsjE5Lx4ZZRLdRX5kKR5tRkVW0quHh6rCS4UEBu0yEqNUgSi0H6ScgU2aP
         8gf49EK0nsf+Wo5y4UyJ/CBTFEXJpzRCGV57KpzNbrEJDv64Q2tAZJy6V9OoEDJfM7yW
         j8ISjPnYy2k4c3rag68lsnrGyDuY5RFfFWrTkWvq9OyYYVv+EGUHnXTEO2laJkXoXbsA
         yZAhy9h556VO2jj+VGEpLnWIuowv7WVplOPBLvE70I04jXt7p4u+Zd1/f72sRR4nB6Tc
         oa3AwwNukymrwyd4Uy//w9YB9W0joLBmjYlkEKUOYHj15Z2gAZqvViuABp3wEFX0RQWp
         hRkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049474; x=1780654274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mk66zAA8a3QudJhszauWsz7yQXjnbQNtZ8Tax/bPzfc=;
        b=O8+Ap1D46p5o2SDkjaYIPggm3pIOI7rn3/wTSjGy9/Yu8q9it+Wvodii71pu6QBt4G
         myoOP5gMpoUBdvXX/e3Gon//H9JEAjb0LZz2C6FiyHnPtB+c80i2SgCoFsKKl9MFE04e
         rLVz/SAGTAyAVaa5Im7YsK9Y584wn0ehgL6HOmrsdXQAZEnY4GTl1lpcYhSCWLouWZX2
         zZEXZr5HGWqYUjO4TZnwViN6MQKaHkM8bHQQiXoxweLOmH9562972x8wgu9pXzJm5jc1
         OuRx4+qnznYEne7Yz1/S1MGC5iq4e5iSa411yeX3GmyQi5TtdWbBG8H1wXetXJT1yHY4
         1qeg==
X-Forwarded-Encrypted: i=1; AFNElJ+5bVlTS3hDZ1B/iW3dQFHRM10kwXCoHSbtHDQXyvNWyohocnVwQmxLsEW74LmjZRl/41M=@lists.linux.dev
X-Gm-Message-State: AOJu0YyvbCsKVgbjcaPcLtqhR58e03SenRt+MLFqU3TEO1IgJCnSG6lx
	NNMRqXYK61Cy415gUtb42K92bsgO6+v1IVfDdmrJRmC/+fOY+zvEQ4pfXTORRg==
X-Gm-Gg: Acq92OF9lOBDq6ciG9OXqaGygFERGTxV5U1yytYu2UnyXWRFlW1Qt7igkUVEwnkzMz3
	QetKIeI4Y9eTL25phQ60Sgl5t882MHOoM9N6Z9P7ssdykWk+dFytvipKlDTvK8g7b/oN1bn7JmT
	hUPwM/oO4D1BJaxAIX9NoScBbGY2kfPJ3jHIatVUcuJowzuP4a4dYZ19nEtUVEtDKOPkopybki+
	alQKnbSVap8gX5hNAiNNwX2CpXHv3y5HjazUnDH92eXfkD/PYWgUW5G9oYtNCVONCrGiwK9M9TH
	v/sroX3rnV2ISJOPgWMTOwZGFB4U/DQDMMfMXXw3lNWN7Mpq4If+Q+OVv+xoDySSCcypI703sBm
	tRhWwZFmrunFr566M1e0ugRLjUSKKWarcC9Z67Du2o3sM4xh73YstUmqcxnTmP2TJ1yR3rqleDv
	8SCXbDLlnjfyTu3/Dg7ImbCyWNvYPV69fmPsxPtzIWurJUYnmqY67fMw1mnpjwMEqiR48c/JwmV
	Cu5FlTM0Q13yKHLNnaD3txHWkUP9kmgfjl4Kf5uL0Pnxk2VMNcMNEv8pg==
X-Received: by 2002:a05:600c:8b84:b0:490:3cf0:8d81 with SMTP id 5b1f17b1804b1-4909c62a2a3mr32056745e9.13.1780049473591;
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:13 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 3/4] arm64: dts: imx93-var-som-symphony: keep RGB_SEL low
Date: Fri, 29 May 2026 12:10:50 +0200
Message-ID: <d95755fc33593f4ccec6e1392924258ccf144a81.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

Keep the RGB_SEL line driven low on the Symphony carrier board.

This avoids leaving the line floating and ensures the board remains in
the expected display configuration.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index a5fe8432ae59..23b359e39094 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -222,6 +222,14 @@ tpm-enable-hog {
 			output-high;
 			line-name = "tpm_en";
 		};
+
+		/* RGB_SEL */
+		lvds-brg-enable-hog {
+			gpio-hog;
+			gpios = <7 GPIO_ACTIVE_HIGH>;
+			output-low;
+			line-name = "lvds_brg_en";
+		};
 	};
 
 	st33ktpm2xi2c: tpm@2e {
-- 
2.47.3

