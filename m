Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F8E53E49F1
	for <imx@lists.linux.dev>; Tue, 21 Jul 2026 16:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784650402; cv=none; b=YdrskgFBUDrbNWUU4PTNopvtb6lIcE96tPdjcAdBGX1FxqJpNRKSMMpCgbNqGRWKxZvicsq++AwTRxHJLLuTKT30rjx/yuWG7+TE4MbdB6LDUrLXA4d1cH3yUgsR5bgpugWiDrdmOgHaxcfrVVbz5KZjzLuYsOktzUhzA34XzO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784650402; c=relaxed/simple;
	bh=uaRfl+zCkdpZUD7Wzj2CgQZtDnhYn+/y8na2rrPgUi4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=ZjJ/eUzZi5DP5lTZ7PO+8HsmqxGRwnK9+kLVzPoKhy6QQP2hBSqs9/+cGFb3sdNGwcfObi5kqyImB+N57c4HVDR+M4xkQsHy6XjRqayJ9gp0NXPgDSoNKuoW3Ia0HQ5AzAsXy1GXBjKd0knL7x/Aa7ofsVcY5Cl9K7wUbNzmFu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iR0zyOFO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iR0zyOFO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784650397;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
	b=iR0zyOFOgsgs8FxLbi8UABs7Yibnb4014FHs9kH+b3UBl4ufqrCg+4zfCgvC+2FrlzcLvr
	1G5anPhMNOMhvST+Cnz/rSvMwntPB3vwATHy1eN9XBfg59oLK/4D4uxYZFNDAZ9/yYXMt8
	oFxxn0GlUvbWr3o+vurwihjkKNoujuw=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-vQ60sOBFNjmicr5uDyqW5w-1; Tue, 21 Jul 2026 12:13:15 -0400
X-MC-Unique: vQ60sOBFNjmicr5uDyqW5w-1
X-Mimecast-MFC-AGG-ID: vQ60sOBFNjmicr5uDyqW5w_1784650395
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8efe7db1c42so212926296d6.3
        for <imx@lists.linux.dev>; Tue, 21 Jul 2026 09:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784650395; x=1785255195;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=16RyG3rd15UswS247w8Y2rBGrhgjsgtjs/mBo5jjAhc=;
        b=Zs2uR0VKtyI7hTnVtAqjFirCTJzVS4UnrzTcurcwMnyBpVde/ddQjYS6ZXpL/szUEO
         X3q+H4Ktn6S5tq7Lpmm+i1GAiRNcf1ud+gU5K5V35nhlz+CgGm6xrL//lJXZ6VuWft1R
         yQ3yj24WysVYbNY0DDvyERecmxoC3k7/x3hLJOIiJk713SGviZ47nKRQiKxbfNG11WZG
         Jz2tshXPvdJ+ZzpLHjMbnbOPEw4PNaf2Hsq8bjWks0afsb2obz6PEmzQ8v6AE99Gl24z
         bBN1Ai4ffUyCTpttC76RZ3FsC2xvbiEt0u68h7l+D26gbUrIUs5ub4HRVtNtLrbdzhEp
         XDSw==
X-Forwarded-Encrypted: i=1; AHgh+RqYzmRHV364S2Emm2IaS5vgMNQnfEDrIq2BE6WjCny2BO1kA8PXTBSU1MUNmPryZcRyHg4=@lists.linux.dev
X-Gm-Message-State: AOJu0YxO2nMfXntuAqib9j+KwpgrwSlgBmtbd4YrF2Knt+6FKResNov2
	BQDijQ9yEhNMFXAc4KnjQqGzPvPGcnwORTGUr8DJ398MnhEgUQKMC9R35rFIE2oV5BQ8Fqrxxdb
	90T+m0hEL6Ol4KqVtzQVi69GNxH0dp9YmfqmclOQyuSr1GZBR9r0dmA==
X-Gm-Gg: AR+sD13CUiNW2GAZ/iydM8M6+Fc9PGsnNSntBfUCKfoiOc2TnBzFbfxDxr1SVdqiljL
	InFF9Bu2XN8Rhr2k2XDK8FMdPPsqxGMInM5jsSiSAGsWkPMsDipOCtZxi0XontDti9o7daIkLFY
	Gtp6hti5HT+DpV2z+d6itSIdpP69kwbA8rcfPDkEW3D3g/58Rn8ceki/IMuaKxVN4R8zwmASu23
	K1ue5S9c6XfN6jK9KZedPnNm+kiVQX9yV3IetE7D4/VXGiZWDV9uZRnuH5TJKyRy3MG3N8NzB8e
	WvO1utwFvgmV6d8415gPvx6rqKjXvNFkoljbDWHNTsQ6Q7eujH9S/iWcXFPk6jZEBRjM2Ukfelc
	YwRCiFuTOn92uGrPSAFBe3Pm6zgI2cEA1
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208454946d6.16.1784650395290;
        Tue, 21 Jul 2026 09:13:15 -0700 (PDT)
X-Received: by 2002:ad4:5dc5:0:b0:8cc:de2:3b5d with SMTP id 6a1803df08f44-9077833676fmr208454366d6.16.1784650394783;
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778543d85sm119008176d6.3.2026.07.21.09.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 09:13:14 -0700 (PDT)
From: Jared Kangas <jkangas@redhat.com>
Date: Tue, 21 Jul 2026 09:12:41 -0700
Subject: [PATCH v8] arm64: dts: s32g: Add GPR syscon region
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260721-upstream-s32g-gpr-syscon-v8-1-49c308536aa6@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7Rio2hZW3sOwaOgUuoCSGSQSw
 t2tnMDle8l/fwchjiTQFDswrVFimjLYSwHd4KaeMPrMoEqlS1MZfM+yMLkR5aZ67GdG2aRLE5p
 HqJUOVlt/hzyfmUL8nOlXm3mIsiTezqfV/Owf0dVghURVbYOyRlv1ZPKDW65dGqE9juMLUKOvr
 MEAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784650392; l=2767;
 i=jkangas@redhat.com; s=20251111; h=from:subject:message-id;
 bh=lHjtYpzASvlxCVG3xK2x9n2hpQ6hZK9tKMMaQqJSCeY=;
 b=8ABgP1iCn05nj/pN7ivfiWkvV8wjCMbPOBY708QDHm/JR0QQ1ywmBsudLTLIbKYGcPDmFkhUx
 outpkTAD5lOCyizJF3VSDULxbbFxFlTpUNX5qZRSfFKfkCsoTG6Yb5j
X-Developer-Key: i=jkangas@redhat.com; a=ed25519;
 pk=eFM2Mqcfarb4qox390655bUATO0fG9gwgaw7kGmOEZQ=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mM4bGXdoo0Rqt6mzqsp0gUud8JzSo4lDJoWx2Uae7zw_1784650395
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

From: Dan Carpenter <error27@gmail.com>

Add the GPR syscon region for the s32 chipset.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
[jkangas@redhat.com: GPR syscon resized from 0x3000 to 0x100]
Signed-off-by: Jared Kangas <jkangas@redhat.com>
---
Revision of Dan's v6 patch based on discussion in [1] to avoid a panic
when reading the debugfs regmap's registers file.

[1]: https://lore.kernel.org/all/aej2X2Gp-UI3Vmvo@rh-jkangas-kernel/

v8: Correct gpr node ordering, drop T-b tag
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
index 809019ea0e299..29050aa5ae960 100644
--- a/arch/arm64/boot/dts/freescale/s32g2.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g2.dtsi
@@ -122,6 +122,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g2-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
@@ -795,6 +800,7 @@ gmac0: ethernet@4033c000 {
 			compatible = "nxp,s32g2-dwmac";
 			reg = <0x4033c000 0x2000>, /* gmac IP */
 			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
+			nxp,phy-sel = <&gpr 0x4>;
 			interrupt-parent = <&gic>;
 			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq";
diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c7..8baae30f9f192 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -180,6 +180,11 @@ rtc0: rtc@40060000 {
 			clock-names = "ipg", "source0";
 		};
 
+		gpr: syscon@4007c000 {
+			compatible = "nxp,s32g3-gpr", "syscon";
+			reg = <0x4007c000 0x100>;
+		};
+
 		pinctrl: pinctrl@4009c240 {
 			compatible = "nxp,s32g2-siul2-pinctrl";
 				/* MSCR0-MSCR101 registers on siul2_0 */
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

