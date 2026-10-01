Received: from mail-wr2-f40.google.com (mail-wr2-f40.google.com [74.125.225.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72CC524B18
	for <imx@lists.linux.dev>; Thu,  1 Oct 2026 15:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790870073; cv=none; b=gTGWsUfGvbgiSndpUMvcL6TJdVTWpZjou4/8+m74mL+V89VwDg+C1PK08x2IaS1HXbqZYYEUhPK+OyedavkHmeNL56TRMw7VFEj/W6/7h2AHPf2sIldEYKtWq1lUpawqsLVCQ/emVT14CNgdXCe21SCMe7/yc0VQ9txs6tok7Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790870073; c=relaxed/simple;
	bh=rKlCQm13/lVSoRcoMYle6T204+/T5Pa4/yPg7USLSQM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EfRkBDewQZqZq9LGiGFzXH/p8Uio74U8h6G789QCtipmL9WD7Miu5S9ZjXdV4ioVQcdQ3NMGtmaxchQPGy1vYFm0iVwL/B7g84c3ZE4/T/ASrVyEwKYCDywB/Lk5Ws6DJy42OR8FNdzOyumNavzCHlqCisE+HrnAvZjQo2c1v2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZkjxyFk; arc=none smtp.client-ip=74.125.225.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZkjxyFk"
Received: by mail-wr2-f40.google.com with SMTP id ffacd0b85a97d-48b017a3be3so1711445f8f.2
        for <imx@lists.linux.dev>; Thu, 01 Oct 2026 08:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790870067; x=1791474867; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=lZkjxyFkXM0c/9eflk537DUsPUGGZ7Z5FC0dWwhV9MsqHxAyxLTNyNGR62IieOs3MI
         yB3Z2aa9ApulkMILAeI9a44H0vO/TZtztupAD92SdOOxX7jTuCHJhY+g+l6WmLjQNwMZ
         nSsDBiYVmVYpmFASdAq1/JCJJylFGYsCj7XvocKwAPQWtjEij4iDlfgWAZxUzXcOD954
         W/8SLKb1MPW1z1qXSmRYh4AL65YfpiXbMnwq3Z7TnWDNT3qVF6rIh8AIuupVqiT+y0g5
         QwCw8H+nd/8NyJcB010YItEx2Rr7b1m/Q28x8cfO+6taHFQcIIUVmI847V+HQrzvHSrf
         IDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790870067; x=1791474867;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Elg4CK8BHPTlS8KGlNqB5v2UOw1qnjW/5zGPlvDhyVU=;
        b=FUO8+9ubDRniFUE4R4esj81peVuZb8iheXXf/uRXetTb8KtRfaS4cq48ikKrrnY1+f
         VGF8/jp83Q2vsJ1F6x10vCm+zgepUbNG8SxBppyhuzdCEafosSoA2suGssW50tpBU9Ex
         2cEKITJzp1nAMkw400/AnP1XskHR5U4fXb7FoAj+ZWk1Rb4s0Ahx7IiVwy7Q4qA8UT4Q
         4UKS1pB1XPa6YzQf7yCNQs3ySJJD4MnEpEHbyCPxrb9doKgFTGrCIQu1mDV+obzNIue5
         9/p87zSNIJ1M/RDGBrX0GaVR6Jo/VVHZG75LQMmyf1DaH40X1wWjgOnY+5X9QLkmEkYj
         vnuA==
X-Forwarded-Encrypted: i=1; AKwUvBzABx72nsaWmZTW8iomyYbsiPeO0IgVjAikP+u6bbx9y41xFLZY0/5k2kpPuRc7wxx9r1U=@lists.linux.dev
X-Gm-Message-State: AFq9FYLcCcQ/COepKvhexLv619xNC2VcmEgwB2JdlQUO/oqOg+vyZJtw
	DKtbnDyb8O4pYQu787QEswc+QxIDTe7mN9Z3bg80Og9tXYRGlExIlc8U
X-Gm-Gg: AYBFou1S+/EzzfsbvXYW8860ipm6/lOs8O6mkCvh/u4WC8urK1kbm5s0i79Ja18LSd1
	+sq039aedKOwAaIspGh10YBlcZsEBbjGnqSVbcm5KVUbtzyJZ5s2tR7zTMl8LvkkNJZPFipjIFp
	WPXSEXMwrAZJ/xyZkFt0wpBU18384blzQ4fUsoKSRiMjRfFGE7s+Q0BxzBaVRhlghaCO5kqm+dJ
	jYtbTlRgjCkcrxSADKG0LunkZwLDZ3w6hNnrQ03z4avxexme+Mv+Nk2BxEVR4PkSkXIQWShD9KG
	A8w+AZeUBnx3Tzv82jW3Jgqgq+7c+rD0raLiZykqXYwRRiZ2ysdQpGj4EyDJllvL2H4kbslwpxL
	iZCSDGGx/OArNG3F/9iaVyQ9Zaw9aBPXh/sXxGnXOvmglOsbF82sllgs7cvHSnP8QCH4oKO0bA4
	MYoy9zVBdWhimD3O8IJ+CKm8QMGTtNDw+o/M/PuyLouPv90h56Dvj/ptLiom2xD1p1fVFr802v4
	KFm9WD2Mglau2n4ozgBzk7YHoKiZKydef+89cy0/44Xgg0JW97HhYhCCUr0Yx8O+0E=
X-Received: by 2002:adf:edc2:0:b0:488:7d08:edbc with SMTP id ffacd0b85a97d-48b127431dcmr12700f8f.24.1790870067132;
        Thu, 01 Oct 2026 08:54:27 -0700 (PDT)
Received: from leonardoc-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff6eesm6517294f8f.11.2026.10.01.08.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 08:54:26 -0700 (PDT)
From: Leonardo Costa <leoreis.costa@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	francesco.dolcini@toradex.com,
	leonardo.costa@toradex.com,
	hvilleneuve@dimonoff.com,
	marex@nabladev.com,
	stefano.r@variscite.com
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/7] ARM: dts: imx6q-apalis-ixora: Add 3.3V_SW power regulator
Date: Thu,  1 Oct 2026 12:52:52 -0300
Message-ID: <20261001155412.3177428-3-leoreis.costa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261001155412.3177428-1-leoreis.costa@gmail.com>
References: <20261001155412.3177428-1-leoreis.costa@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Leonardo Costa <leonardo.costa@toradex.com>

The Ixora carrier board has a switched 3.3V power lane that is used for
powering peripherals. Add the correspondent power regulator node to the
Ixora carrier board device trees, similarly to the already existing
reg_3v3_sw node in imx6q-apalis-eval.dtsi, so that it can be referenced
by peripherals that require a specified power supply.

Signed-off-by: Leonardo Costa <leonardo.costa@toradex.com>
---
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts | 7 +++++++
 arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts      | 7 +++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
index 3ac7a45016205..f6eb2eeee417e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora-v1.2.dts
@@ -57,6 +57,13 @@ led5-red {
 		};
 	};
 
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
+
 	reg_3v3_vmmc: regulator-3v3-vmmc {
 		compatible = "regulator-fixed";
 		enable-active-high;
diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
index f338be4352779..f015faf19199f 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6q-apalis-ixora.dts
@@ -55,6 +55,13 @@ led5-red {
 			label = "LED_5_RED";
 		};
 	};
+
+	reg_3v3_sw: regulator-3v3-sw {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "3.3V_SW";
+	};
 };
 
 &can1 {
