Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8A2B3D890D
	for <imx@lists.linux.dev>; Fri, 22 May 2026 11:20:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779448843; cv=none; b=kY6acwkfxXFGrFD96V5loMGlu64uuBjYqcyTgbfx8kqMl7HnBdEyJC77YLVlA1QTyKMx1dWfnAQ32/MtifD0hoDJiFAjk+Kg40e5qOJJmAZdJtmbMCRX3o2IkoD7oVS1cTPSZoSkDDEtqrihr3Ss2LdGsL2cLt792U/aFRouJN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779448843; c=relaxed/simple;
	bh=0Pw7565oM9nQ9BpHuXyhwCjYRS5Et2891IAzzti/3GA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SW1W4ATG3TD+/o8ifMpfAd/iuu7nwPaDLg/Hje9YJPwfcijxGutAjSMPGupzsh+d5IygitXPUtyK1JNWx8uZ4k1+QUcbFyaAbh6SQR/LESO4wWXtqw6xaxpJRsbyGSi25ei65NiOLmlz2rqBg0Qf2lLmvEToWRQLld4LF5p0dwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFTwAJws; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFTwAJws"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490426d72f7so6542755e9.3
        for <imx@lists.linux.dev>; Fri, 22 May 2026 04:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448840; x=1780053640; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=rFTwAJwsbbM8MnRk6NWZSpLzNgAZbTCEts4rr29hY4Ot6ru/FEuqdHOLDVxzUhKDma
         ixsXVlb5+3zDZZ4SpwMqmkexFp3LhLbHdesgZLQ+9ER8tgrUXqYL9z8DuskgJ2UN3cfI
         MWfEzfxKulXXgPFmENVxwXvbNUPClMnQm5NKTpdzrd9ABTGKnfctOO5iCDneOEdPrlZg
         6mcHS594x5hTRkkeNCrsPodO1mPASvU/dhDfsB9BjCnqhryYVkY+0P+tFJ0E3Ku/C4Me
         95IbtxXHC9pNGjarPV320Eisn+tVsGPR2vXSjP/zuXrIkM39rG62SYIALTKCiNpPLxdo
         S3PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448840; x=1780053640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tjPNYdwrOQ7VZzUkHlZPDHNe5mCfkmGw4KFMZphd8TQ=;
        b=PPQQ6bxBwr7wZSmIrQMTDSU9w4Ze0SyyaZV0JB1yCHc4tdxhJ4KlfAtpsJXuDyrznk
         aOBovVnNXELn0ArpSU7BbJK5yjj9lNfFBI/2zs60MHvDLqNMugXo/xLJUf4gRUz1XKkj
         f59Pa+krhKQB5nKAnCFln19eGGCyefkQdjG8Xkusvq6xg0ZMtusSM75Dv+MsKaZaDK/V
         cm1CnZnKQTM1m69QIblfpAKbgpzZ6JismDVv5yYJ8FLQPsgwXxjGubScx77YwSP7qOHh
         /sL0NuOwXZqSKwmntyXjIH1JxiDpmRL7sJlVdkTQvXN4pTFwNGeVWVVNiKWm9K7UJ5pB
         qwWg==
X-Forwarded-Encrypted: i=1; AFNElJ8VGJY/GQ9Nb1KH9ykrd1NvtUwa8yfowsCQqDRJHR/1LANaysOH7K1W1tBpRNyIIFMtQ3I=@lists.linux.dev
X-Gm-Message-State: AOJu0YxqVvzusZ7d+Ymy3LRLlWO4+sndTrY0Ja+SH1k4bFmsbtMUK/QB
	q+3pZTfB0eimZZ56L4QCjWz01Bt2ycKf3pjN07QrugDaeoC+m1cD0p0Y
X-Gm-Gg: Acq92OGFxqaD1zFKfD9IGfZOrfaHCYsrEMXadiIN/05RH588mYao074UWGK+2tdpKvP
	IBVGV9IuEHTPaOm6E4oP46DYLbQKExu4w5lAi3ESUf3OQS2PujsnhD5MkNkXIQCHw8iI33VvDD3
	6RNlRcYFfqEf8sBoNcCNlCNS4/sJkM4W4wM4+GUb4IVjAxVnUJDsGJBJnZuOD0ICC0j1uboqBkH
	hmvVGbaJHqzugBdsFrEldPHFGSo5CZ/7knMmRMZmjKPC0eedOxh4pAN5LjENNhcq6NSLsQNwY+f
	VV+eig1dzJccEFSBG9QaOwv/IcC78HyKEouP7rBT4LsZP2mGBarqcvG3BhupS++N285wnXyrSqy
	qU/evBmooD+ufC1C9iKGwMvmmj7fOJ+UQBhw3yINBPg97tcchkmFCrb/j/bM13dj4bR+uVn2ygP
	mdKRPejpxFHX90pyW8DGMuz00XCQOYA9+/pCNL39JfRECz2h0jlOCCPIvAWcE5mo2PPnv+8pQ=
X-Received: by 2002:a05:600c:a402:b0:490:3d62:eb0 with SMTP id 5b1f17b1804b1-490426d7019mr33176065e9.24.1779448840049;
        Fri, 22 May 2026 04:20:40 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:39 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: freescale: imx95-15x15-frdm: remove common rmem regions
Date: Fri, 22 May 2026 04:18:48 -0700
Message-ID: <20260522111849.783-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Remove the reserved memory regions that are common to the MX95-19x19-EVK,
MX95-15x15-FRDM, and MX95-15x15-EVK platforms and are used for remoteproc.
At the moment, these regions are not used for anything and can be included
in an RPMSG-specific DTS.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-15x15-frdm.dts   | 21 -------------------
 1 file changed, 21 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
index 0f43e3be7058..f9b0e266754d 100644
--- a/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-15x15-frdm.dts
@@ -188,16 +188,6 @@ linux_cma: linux,cma {
 			linux,cma-default;
 		};
 
-		vdev0vring0: memory@88000000 {
-			reg = <0 0x88000000 0 0x8000>;
-			no-map;
-		};
-
-		vdev0vring1: memory@88008000 {
-			reg = <0 0x88008000 0 0x8000>;
-			no-map;
-		};
-
 		vdev1vring0: memory@88010000 {
 			reg = <0 0x88010000 0 0x8000>;
 			no-map;
@@ -208,17 +198,6 @@ vdev1vring1: memory@88018000 {
 			no-map;
 		};
 
-		vdevbuffer: memory@88020000 {
-			compatible = "shared-dma-pool";
-			reg = <0 0x88020000 0 0x100000>;
-			no-map;
-		};
-
-		rsc_table: memory@88220000 {
-			reg = <0 0x88220000 0 0x1000>;
-			no-map;
-		};
-
 		vpu_boot: memory@a0000000 {
 			reg = <0 0xa0000000 0 0x100000>;
 			no-map;
-- 
2.43.0

