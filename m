Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794841120;
	b=SMz4tShFsekRPBEzV43OTGZyi/4lNSoCSI2nbLN5ASYcwMNYL85Gq2dZkyJjcQtP0D/8
	 EYfI4n0xQJm+mlmtMoo/Z4VCTD/DvhkiAWEC7vgw/LFReBg2a+XDAHsHskqV+YDwIhxPo
	 GeUVjRzHd8z8sO9sWLFqqEma92KGNR89Th00auwXuzhD7Rx9KeXluTdQP7y5CPrhN6Ba2
	 V5Qv+SC1hNZHGDJewk9fkyPMO/1fLSof0VhLlxOCXt1GAAjblBesYHlrM3l5niqcOaPf7
	 pFwWw82LkOE+KV7EV8QMcHeucJYSOiBXxVwfFQFNbnWZaiIxyssa6J3YcIlIIpSM3mQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794841120;
	h=DMARC-Filter:Received:DKIM-Signature:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=OA0ptQ31eFEcSFsZJ4yPzR1jURMkIU8HhjZh8gto8cM=;
	b=D7Tri/okYx8IngBDXW5z1yqqkjMUqwGMW/xV/p18Q51Zpjid+RVgvvk7DzSBBpotN0AO
	 PR1ISE4PS7yJTvyYFhvv/p7HCQ/NeXhoME9bTnSJ+uVee1VM/wta/t3hQe6B5+bpCWEYx
	 6iOux+f9U7bv8c0B5CyxX4lEN4Vl6oNsFwWqJPQ1gKI6TSmofuQw5HoYeAqoUY2aub/S7
	 Dn/4QyGQYTThGRvlKas5G7YlhabQL3w0vzhU9T/UlDDqrEow9izScXjIgYs67LaJK70fk
	 0J0vw+X2VWXUjJppmfeBPjeGPrLyMI+j70gpKHJCusME9wOF56Z8bJX8zldM4p50TRA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=An+km0yz;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB055606A888
	for <imx@lists.linux.dev>; Mon, 16 Nov 2026 14:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB055606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=An+km0yz
Received: from dude04.red.stw.pengutronix.de (dude04.red.stw.pengutronix.de [IPv6:2a0a:edc0:0:1101:1d::ac])
	(Authenticated sender: relay-from-dude04.red.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id B677C200668;
	Mon, 16 Nov 2026 15:58:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794841113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OA0ptQ31eFEcSFsZJ4yPzR1jURMkIU8HhjZh8gto8cM=;
	b=An+km0yzMf57k2u47uCqIgdUmpYMaT803G5RIh1ChpbxBdpuQYOBe0QFmX3hxiPDEorl8n
	9+Y0QPfG+0hq0NPCfyCqCuG2eLwT2gxsCXtTfxGXEgdfaU/FiredcAfEOg782vCTp6F0h5
	xWHb9YTpBv+xl5jN4vchnqNfSKqZ82hJODMS0El8MyXB4uu1ongtRbfw/Df2jeeofXKhK7
	orc/QIhOY/xgV1paUYzDh990zioOI8ILBoP5sxyAfQoNkjbaa2gMW29GjVLkfdiGq9v3Dd
	QmyFQXKeFJqJ2vYN8jAb2Ev8OawGxZeEG7Vpr9psW+QpOKqKRzhG1m3d8AGASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794841113;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=OA0ptQ31eFEcSFsZJ4yPzR1jURMkIU8HhjZh8gto8cM=;
	b=buT1xJwIeO2Yy4i5WohUcACgKnTQ9JNI9iWN3Lsyk+XQgBDQ3kbiBMs4vOFQKV+5VXTKlw
	Bitym51J2iSN9Db7ulVi02ZftJ7lhxZnuflGMrhZDVLnmZD+/UaHGlb/BREW0QnW13H5af
	Zeg/A50aSzfWdVSIIMPF1PQaXL8uyrbLcsln7kaUGRZD7poxxIOIK39UeHI4qfk0HCwAMp
	/59oSwe7k8Epqjktyf9eYcDCZcmG3BUM3gOytUhIQntsI1OCMINI+FjeaNFKCjwWxuuPuZ
	Vb2zrjvTW1D7IKffFp3EdLhlAngCJmngG+UyR4CTrHQR7LcvVALfOtZA1YjM0w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794841113; a=rsa-sha256;
	cv=none;
	b=B7Z2osZ97km61rF5bvo+GZWdbEAlyb5BMvCQ5EReySf8oiuL1j1jDdKrP4AliPBSwIw07Z
	u5edIuNKP4cLE723/nElFmdxvDkOAM4iGnPruEtBOPXziMapE8p8IWHbJ1/h08j87yrndj
	M0Ly9Y3JZufafhHQ4sltvGWG/9F6rephjPU7SZTcuPpmLm5QN1kGLWoTcuNvbau+Pw5PRq
	2+l5BN5ND+20Ra1tnltX6FKErbn3L6VIzqJFcWUZi4XmcD7/fDl2UTobJ+8xZ1JO5NuBL5
	evM8TiNY4EzpLmVW11PDsBhuwreaIwOfErQCc1b33C7PVfpLIDGs2dJGI1N2JQ==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-dude04.red.stw.pengutronix.de smtp.mailfrom=rhi@pengutronix.de
Received: by dude04.red.stw.pengutronix.de (Postfix, from userid 1059)
	id 9735A3803FE; Mon, 16 Nov 2026 15:58:33 +0100 (CET)
From: Roland Hieber <rhi@pengutronix.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	imx@lists.linux.dev (open list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT...),
	linux-kernel@vger.kernel.org (open list)
Cc: Roland Hieber <rhi@pengutronix.de>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2] arm64: dts: imx8mp-skov: fix input supply properties
Date: Mon, 16 Nov 2026 15:42:30 +0100
Message-ID: <20261116145823.3018840-1-rhi@pengutronix.de>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The nxp,pca9450c node used the non-standard 'vin-supply' binding until now.
Upstream commit 4c33cef58965eb655a0a ("regulator: pca9450: link regulator
inputs to supply groups") added support for 'in*-supply' bindings, so move
to this standardized binding to fix errors on boot:

  nxp-pca9450 0-0025: Failed to create device link (0x180) with supplier
    regulator-5v-p for
    /soc@0/bus@30800000/i2c@30a20000/pmic@25/regulators/LDO1

Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Signed-off-by: Roland Hieber <rhi@pengutronix.de>
---
v1 -> v2: fix patch context for merge on current master

 arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
index 5453e590f64f..1c97f2c2873a 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi
@@ -275,12 +275,15 @@ pmic@25 {
 		pinctrl-0 = <&pinctrl_pmic>;
 		interrupts-extended = <&gpio1 3 IRQ_TYPE_EDGE_RISING>;
+		inl1-supply = <&reg_5v_p>;
+		inb13-supply = <&reg_5v_p>;
+		inb26-supply = <&reg_5v_p>;
+		inb45-supply = <&reg_5v_p>;
 
 		regulators {
 			reg_vdd_soc: BUCK1 {
 				regulator-name = "VDD_SOC";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <850000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -291,7 +294,6 @@ reg_vdd_arm: BUCK2 {
 				regulator-name = "VDD_ARM";
 				regulator-min-microvolt = <850000>;
 				regulator-max-microvolt = <1000000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 				regulator-ramp-delay = <3125>;
@@ -303,7 +305,6 @@ reg_vdd_3v3: BUCK4 {
 				regulator-name = "VDD_3V3";
 				regulator-min-microvolt = <3300000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -312,7 +313,6 @@ reg_vdd_1v8: BUCK5 {
 				regulator-name = "VDD_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -321,7 +321,6 @@ reg_nvcc_dram_1v1: BUCK6 {
 				regulator-name = "NVCC_DRAM_1V1";
 				regulator-min-microvolt = <1100000>;
 				regulator-max-microvolt = <1100000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -330,7 +329,6 @@ reg_nvcc_snvs_1v8: LDO1 {
 				regulator-name = "NVCC_SNVS_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -339,7 +337,6 @@ reg_vdda_1v8: LDO3 {
 				regulator-name = "VDDA_1V8";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
@@ -348,7 +345,6 @@ reg_nvcc_sd2: LDO5 {
 				regulator-name = "NVCC_SD2";
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <3300000>;
-				vin-supply = <&reg_5v_p>;
 				regulator-boot-on;
 				regulator-always-on;
 			};
