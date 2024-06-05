Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D62653C482
	for <imx@lists.linux.dev>; Wed,  5 Jun 2024 15:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717601428; cv=none; b=J6ZRck7NiLJBrrutwJs/Gxx3bPlWyN2WTryzcW9C+BnknF+pFirexZEJI2hFZNwWFMNPp/SAsBRf2uC9P/kEEQPbOaiEPwtbpN7OdJU3RbAA87r3rHe3Fgj7sqooPiEr+KAexy21pW3eq3TlJLecA+EWOL6ARpS5jK5OuAU3KUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717601428; c=relaxed/simple;
	bh=iIKb8ImpcFM7FLCF2b3wsKc32YMxOrtwphavIe6/i/8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SCpMGnUMpHZHZc12lU9Tsh9SXAnB1xRcEUJm3MgBcrT5JwqrfSXTXRA4LiduR/tvEA7Myj+lIW4GbkT+IGiJEFR15h+6khc8F0NXRCs2OxMdx5fGn35pMJinGKOFbWCm9jUP6N8gRw5bijINYgsiwGiT4KdBUqit0ydhsd70D/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K0VgB14s; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K0VgB14s"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-35e573c0334so640767f8f.1
        for <imx@lists.linux.dev>; Wed, 05 Jun 2024 08:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717601425; x=1718206225; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hap7oZQjiXolWb0TG4x/8PIYUXhCowcxT4O2Z37q7bE=;
        b=K0VgB14sIKsrhJ9BX1+RixPJAnXe39/WFlAMcpX5TChy/w74LbpnopzHrhYEwTdqZb
         Kq78u9Nl4hSkah/DGb9hno2j6ZQnSKzQWjJBCsRJ4snbrS/40ewWyukd8snxqu86Npdd
         vg7vRsoGw1aWnz+n62l01cv9eMRMlC/cZDCGiWddpwa25kkYR24O6S0+DJOYue9Tkijl
         iK4kO8JLyB0zTpkCAGxUGIqpyZR0DANz4/u173NYkbW/dTSKhqnOLvsxXq98EYLHij1P
         fXVY4lwbiqWVfbKqholBCApnnzUW6YwBgiO9Kk9e8oG0lXAxskqwrZ2OG8p6VaVSPV/M
         omAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717601425; x=1718206225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hap7oZQjiXolWb0TG4x/8PIYUXhCowcxT4O2Z37q7bE=;
        b=Rha4cY1MpBtFWX01OONmUozNQUZeqlhiO4ckWSex0WvQ1FWZ9t32wFXwKrjYcSJd3A
         2BPm+Q5RhZcYtQskpsSXdbLx9D0/armWPA2zu6UX+me6bl+7EzABErTDkNUWI95O/uBc
         kddUf022OXdZfb4C8RddBOPKu4vQp2vDrW3iuKdJZ2P460nyzvP7LJ9f6Zg16hA31zyd
         HUabitYauc1GffuRt45Ir/1Lh1orDAYKdsRJDN+my17VJf4n337nUA5O5gaJ0YfA8HCB
         Frr+uKtMgPxk2g3fCjK0IrfyhFXtEFChYlGi7lwba+t0oOETal7Ft4VNdl6kGFHIQT4u
         3liA==
X-Forwarded-Encrypted: i=1; AJvYcCUcyM0pxj2GKgIl5f3IH9hMAY4SZTKEqythwI5GCR6Bz/5p3pUJ6czEnxXq3Z2TljmWVRoToUvJnhy7bPKf2l03DOtQ
X-Gm-Message-State: AOJu0YynCk5jlGVFyUTNrT//MgwdUImXgnjtfTEkzf1IsfbYg1aaEa7J
	YEp6XOtcWsSvZecDF+I3sguowE1rAqLKLXtdf1m+VwdQHItdLUYJLRPbuyN0If4=
X-Google-Smtp-Source: AGHT+IHsc8jn6cblWRS8ZJs0k550/fR3mhgoGD0nh+Eg1QnzR+/NhFWfH0bnt6e5vLPUxqVfuXLe3A==
X-Received: by 2002:adf:e512:0:b0:35e:60e6:c8a6 with SMTP id ffacd0b85a97d-35ef0c73ffemr10926f8f.6.1717601425363;
        Wed, 05 Jun 2024 08:30:25 -0700 (PDT)
Received: from krzk-bin.. ([110.93.11.116])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215814e7cbsm26222295e9.39.2024.06.05.08.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 08:30:24 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/3] arm64: dts: ls208xa: use defines for timer interrupts
Date: Wed,  5 Jun 2024 17:30:19 +0200
Message-ID: <20240605153020.104717-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240605153020.104717-1-krzysztof.kozlowski@linaro.org>
References: <20240605153020.104717-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hard-coded interrupt parts (GIC, flags) with standard defines
for readability.  No changes in resulting DTBs.  The comment was saying
interrupt was active low, but the actual used value was active high, so
assume that the code, not the comment, is correct.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
index cc305e629bdc..040a48c88fab 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls208xa.dtsi
@@ -241,10 +241,10 @@ map0 {
 
 	timer: timer {
 		compatible = "arm,armv8-timer";
-		interrupts = <1 13 4>, /* Physical Secure PPI, active-low */
-			     <1 14 4>, /* Physical Non-Secure PPI, active-low */
-			     <1 11 4>, /* Virtual PPI, active-low */
-			     <1 10 4>; /* Hypervisor PPI, active-low */
+		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>, /* Physical Secure PPI */
+			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>, /* Physical Non-Secure PPI */
+			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>, /* Virtual PPI */
+			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>; /* Hypervisor PPI */
 	};
 
 	psci {
-- 
2.43.0

