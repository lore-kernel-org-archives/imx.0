Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE1F246BCD
	for <imx@lists.linux.dev>; Fri, 17 Jul 2026 20:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784320528; cv=none; b=MAkaWTysZQ7/AerguizKM97MpqEXP/zGkRS0VSw5tNDt4l5kt/VMJae3b39K/lN8SfgDzmGJlp/IIT1DIkkUi5FITHBPYiR/zvJJSoCOj6N5dO5CsV8YViOf6wJbtusa14NRrUtd5OTefoSYoIFmiMlLgJuht4npjA6HNNg3pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784320528; c=relaxed/simple;
	bh=oUtHmlS+6lFNDKPDMmSUMugEVw9ScUuaOklUrcljiro=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=faOybaKMujF9L2lPx01gz3nGlnIunfFNt2RichJgvCKt9Ri2D6WiMZ7bghHHGBXY++SNXhWl6oY5HcWobatfbL6ffnAxpiuMJLOQgFFd1FCBuhVIbNcIDb4wvknUzpHLEHpqtdETFLab8To4Mk7nv0SrAJTzwNjsPconHWOzEFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ah3OTkBN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ah3OTkBN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784320525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Is7QXRJ9Lqxz/W/+MXTuCWFGjk5bJ6zhQmYPGnfDWvM=;
	b=Ah3OTkBNfenuzGhK7XzsotjAxVSF6WCpAbMmXgyF6rhJE5ZEcskARiiqkGuxAo2k2sjIMM
	YzRV/fWDE0NdH4SiYAXOhLDSAA/1mx94WvsC6JbVZyvMxP3Gapzna9LM67IWyq4AB32Elr
	mvUy6nnflabT3ySB+lnJQVnP6SSqA7A=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-NBMyC63cMoCKrFk-vZ9qOQ-1; Fri, 17 Jul 2026 16:35:18 -0400
X-MC-Unique: NBMyC63cMoCKrFk-vZ9qOQ-1
X-Mimecast-MFC-AGG-ID: NBMyC63cMoCKrFk-vZ9qOQ_1784320518
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92ef13b61bcso1254645485a.1
        for <imx@lists.linux.dev>; Fri, 17 Jul 2026 13:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320518; x=1784925318;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Is7QXRJ9Lqxz/W/+MXTuCWFGjk5bJ6zhQmYPGnfDWvM=;
        b=TLIHtkFhEVthJaPkaQ9ecB8tPTfeAD6GehipU0UFA2l/wgBIAKkm/i7MqQWyuQPn4p
         wuy85u3OqopwmmhS1vKYfEm09wanPIIrlSZkvJvHlLO3SaRHy6sakC3ry9B3VzvNfFP/
         Wt9Wfz/Zvi4RiaKuxDMDd6OjecZSmExLUmyHiY+hXOaXGDwWfkNDpDsgmw6eH4SV8YC+
         tcLeIgsoiTdNG12/1cP8RMYpJlk4RR0hAcbrY8C4gyKCBiS0dLOLiQ2m6wNz011xjV68
         6skrV8WCKOoNqBpEkM/KWxfGseUoiWW8+IRCxtAXHLdStWZS48jOOxXWRBpyAYZ/jPEQ
         SqTA==
X-Forwarded-Encrypted: i=1; AHgh+Rq1iBEKSe9lWkFQ6JCmoQf80UdxOlv93hV9GtOPQIYzrNF9TOMq98n57OgroJ9kq2LhaDM=@lists.linux.dev
X-Gm-Message-State: AOJu0YzbyMVvo1pkwk09FLHodrAELmL6R/jmsGCfc1MR+2IbABiqc4U8
	ADWrWZ+1t8Id/Y2aQ7oFf9e24jWlrZiVa5DdAJaI4+vI/e6q6Mt5/3YuuVPM3F8Tz5xqD7xYlv/
	qQx0RJ+bGiTTP4nKOQIHzFJcSUv44KYUUFgH9zI56znxQoVG1S5aYDg==
X-Gm-Gg: AfdE7ck8Oqhz5+1fmq0JjlpvD87xlx6RusrdhQSFGqOwFFHZ7yJ2BKJ6jiMezbg41xk
	OwEy94MiY77cBGthfRbQjBoG6ZvJkqG2deZ5xVFfXrMN7IUQyzjI/ke0sp63w0uf3WDnx991eip
	Dz/iU9oE74br8oipdQLeaoWJxP3ob89TgLtjZq3gqwP7EjZxwCg6fuvqi4fCd9EjDiJ2X3oA5HZ
	HXtBSdDDhiLhT/42jxl+9Jw5kJsakbA4Q/M378rl4Pg+Gz+7vddD+En7KgF0IDCLFujvg/ctGcJ
	zqigcrV/aca/mizIN3rKNnq4yUlI5rgpyRacu7m7oxJsJtLZycT9FTwYLlVu3GeH4o4oB41qWtn
	sVq73/e9cn98+RehcErfluAPUFLXYdXMC
X-Received: by 2002:a05:620a:8807:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-930b3f45332mr464673985a.31.1784320517644;
        Fri, 17 Jul 2026 13:35:17 -0700 (PDT)
X-Received: by 2002:a05:620a:8807:b0:92e:7d1f:d3aa with SMTP id af79cd13be357-930b3f45332mr464671285a.31.1784320517096;
        Fri, 17 Jul 2026 13:35:17 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e253sm232859985a.36.2026.07.17.13.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:35:15 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Fri, 17 Jul 2026 13:33:56 -0700
Subject: [PATCH v7] arm64: dts: s32g: Add GPR syscon region
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260717-upstream-s32g-gpr-syscon-v7-1-ee198f287682@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MMQ6DMAxA0asgz1iiARLKVVAHBE7wQIjsFhUh7
 k7E+Ib/T1ASJoW+OEFoZ+UtZriygGkZYyDkORtMZWzlXg5/Sb9C44pam4AhCeqh0xbRtf5trO9
 sNzeQ8yTk+f+sh8913XcTkxpqAAAA
X-Change-ID: 20260717-upstream-s32g-gpr-syscon-75f926f868d4
To: Chester Lin <chester62515@gmail.com>, 
 Matthias Brugger <mbrugger@suse.com>, 
 Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>, 
 NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Dan Carpenter <error27@gmail.com>, Jared Kangas <jkangas@redhat.com>, 
 Dan Carpenter <error27@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320513; l=2673;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=Su44JoHUNIT+NILqohVHQyIxNtJALtkgLhgf6U3PzRs=;
 b=yu/MhwLbciKwwtbena2H4ob80CIrdSVWImmgvPDfdQYil0HgnUhDWGX8kWATuLCNUqkPL5X2N
 wWNF+/HbdMLDhuEOGC3Q65MuEZGnrTmnS9P3sZgL8Fmho2Q0bTXkoZZ
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6X6HkFMRnduk-S1QPHmkZ-aa4R5Z_brYQ6bOoThAS84_1784320518
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dan Carpenter <error27@gmail.com>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
[jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
Tested-by: Jared Kangas <jkangas@redhat.com>
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Revision of Dan's v6 patch based on discussion in [1] to avoid a panic
when reading the debugfs regmap's registers file.

[1]: https://lore.kernel.org/all/aej2X2Gp-UI3Vmvo@rh-jkangas-kernel/

v7: Shrink gpr size from 0x3000 -> 0x100, add 'arm64:' prefix to subject
v6: no change
v5: no change
v4: no change
v3: no change
v2: Remove #address-cells and #size-cells
---
 arch/arm64/boot/dts/freescale/s32g2.dtsi | 6 ++++++
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/s32g2.dtsi b/arch/arm64/boot/dts/freescale/s32g2.dtsi
index 809019ea0e299..81280ec6b07a9 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -325,6 +325,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -795,6 +800,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c7..da35083a5e0e5 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
 			};
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		ocotp: nvmem@400a4000 {
 			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
 			reg = <0x400a4000 0x400>;
@@ -874,6 +879,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";

---
base-commit: fce2dfa773ced15f27dd27cd0b482a7473cdcf2a
change-id: 20260717-upstream-s32g-gpr-syscon-75f926f868d4

Best regards,
-- 
Jared Kangas <jkangas@redhat.com>

