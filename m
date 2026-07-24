Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F4D3A48E3
	for <imx@lists.linux.dev>; Fri, 24 Jul 2026 19:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784921415; cv=none; b=cmxbxB0eD9tvioYEn46eOMVFiXtP4y8vIjwjD/zhoKL6i838qvvsXZXXsvcSR4JoUkZjzHpFa+2t17cG7fbH9oLIshatOVdDSrhxvRhWkK1lJySMj6NWiart7YpyLcxpGqNpccORTR2JNiN/uQJlyefTeLhYmKqY0zgwXA0vHuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784921415; c=relaxed/simple;
	bh=LjeWGr1mKSAToTNfp2avz0FOizHKh8Z6yXcbz7L/7ik=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n2i+8TKV24XOFTfPicv1m6fJonc+x05b9OP93hyw2WqGPhfzubH1ENKFC16SLrMPOhNNvDi/t3bc0YXs1GFYChanjn8Kd+6TD76Fnjfrepu+lZRMOEETw8KBZnw3bavyNHxzFNl8o4ljfRS5f+tmEWwtVIY4X3M4dqSqO4H/e4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BXlaWhs3; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BXlaWhs3"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493f6de72faso6900665e9.0
        for <imx@lists.linux.dev>; Fri, 24 Jul 2026 12:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784921408; x=1785526208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=BXlaWhs3Ct+nPmy4sB3yXN1WlvhCyIN/UeTeqOM9RBXDsht7/sS/AcAWrctWiTKa3/
         zF9n6yoLxKKxf51KOXvhbnz/suzU+fYizZZQp0fEkpPSMzfcHeq7yYF9BKkVrYdctnjW
         wINt8L3FWd56OKI5+mzCbIUnT16kXChiPExyBAXo1ADm3k7uEmDKQVXYT4LCDt6v4ASM
         Es91AdiAFPh2UUU+cBh4xZ3PI+7SJ5nDtpDNsPxia5G6TEz8lXmIubn+DxWR5AKmJBRu
         56lYoUqGgVs+NKswjwb4eYjKnaZ6v8jlJAkRoiqoNFFTU68ninwwIBmyU6HjNrYIhuYe
         Rfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784921408; x=1785526208;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Aq1R2dvrAm+XGL+g1ljGd3Sujd6kX0QwLMm997FFPa4=;
        b=NuapvGkkZv2F16rzsZqnE9Mzh2fT4OTdpr6SetACYmXT0/echUpLzp01MWurhZB+F8
         Qf1JEd11XZHikqy4TJDSuLrREOI6Bay8l/bR6V065L0gYyG8sZpx0BahVfssLgsHb8Gi
         ep/ORFY3ynwkPN/IFoymfShAZ//HqrJXvdY9IML3Kxm+xMZsrNJuLO6mrJlDKjSoxHWG
         aL7xaJfUNqHj2ZqqeIwGqEuXbWurBiiECO7WumihJ3jc/QTsRQq9cK6S4rM7l3I+kVI3
         MMfSz+LtrfMjPfmSHQXQ6aLp+NPJljeP+cYBliA25WhX5BMNxovCyK2eb09ZWCIqwqqm
         UL4Q==
X-Forwarded-Encrypted: i=1; AHgh+RrPNMHp+ypYU4AKLJ5NCVzUFKIuGXQ+xuoxEj3g3s+ejBPQag1cI0a/CpWleUBFuqwYnEk=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxz7fPlQaczfAe2lYTEj1+OnKh2ptFxv552zdkhuKaqs1jdJ74F
	K5SMGFkYPgyEoPYENQhMOrIM/8BkBizIkmPzeJscYxR5otJSfpE0Bi0g
X-Gm-Gg: AR+sD123+8rKlCy/wx1ze7VHCrBUByTB5bTMR7HJTe2ASPDMtovSH35mtSY8BE9xHfm
	jjZs0TkvvleHetym/3NY86/FwOohx/P7j1kXweKn6v1IPzJ0ZMMugKueb/iYdpwko9+BEt4Nqka
	IZ/a6+hWTixXpVbbu7/0BQYDfkokTvNn6fBU7R1h7EXZkdLRZIDPM97XqqVlHRoCpdoMgAnc04Z
	uf9xeyiHhqch0VGxAlvSUgvCx402wnHb2rNrhyeg+DK7vEjNtLGix02H+h3aWZY3vdFY6brRWZT
	n43Cus+6M2rC8XVJ0jewiJ2/mLNwUNxfqfVBs+aZ+0AZzXGwCDe/61CibPsvIvm2fuqgRQbEC7C
	JgDsVTlUqxR6wLsoUoE8ONtHxTEeqZyZj1IbcxJNr0VSl3/KVa0ednhuxfrTzdNk6KoOKDn7Qv3
	zymQu8CwEnn+nvUeBcPOpVDcUzWu0/HkqtaiKTBPnoKuRau4mHUm9cee37fA==
X-Received: by 2002:a05:600c:8714:b0:493:f478:4c71 with SMTP id 5b1f17b1804b1-496997235cemr24469835e9.7.1784921407744;
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
Received: from Lord-Beerus.station ([93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b49a8547sm11733195e9.14.2026.07.24.12.30.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 12:30:07 -0700 (PDT)
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
Subject: [PATCH v2 1/1] arm64: dts: imx95-var-dart-sonata: enable in-band status for SFP
Date: Fri, 24 Jul 2026 21:30:04 +0200
Message-ID: <20260724193004.51978-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Stefano Radaelli <stefano.r@variscite.com>

The 10GBASE-R port is connected to an SFP cage and requires in-band
status handling for link state reporting.

Set managed to "in-band-status" so phylink can manage the SFP link
through the PCS.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Removed Tested-by

 arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
index ccf7e77016e4..3479abc25df2 100644
--- a/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-var-dart-sonata.dts
@@ -157,6 +157,7 @@ &enetc_port1 {
 };
 
 &enetc_port2 {
+	managed = "in-band-status";
 	phy-mode = "10gbase-r";
 	sfp = <&sfp0>;
 	status = "okay";
-- 
2.47.3

