Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C73F83E024B
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773245305; cv=none; b=dBnrr8ZRFazAB87yzCGIBo8vaNVWN+jDdtnjeFolAfFC8fd7K6JmJR9nCFzPPINY+l//jEscGsb9xjfO3lRjHoNADr6x+cGnbFeG5h+xeq4eVQWzqiC5JTRUTwciaGB2icsVx++vDGSNMCmiKgYTt7W3DlzTX8qMqs9JAW6KMe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773245305; c=relaxed/simple;
	bh=fvJPxiZJcDnoLtQ1cA0D6s3NXztANmKivfa8n0Cahy0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZAkaTjeeHx6AdQ0vUDzbHD4gm/4mxk8/AhqTKc9WWoGSpVEd1X965fu56F/3tip+VG8/YvXcsGs116YLhY7jYDtHWCg3haZzOUXeEk+/utYkaqncrBA0n83Upnslx4vSbuLUiQ+k+QhY7kQDIlBklT6B7UA7H6Fv4ce2asdq5iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sdvv4ZjF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W59sW93p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sdvv4ZjF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W59sW93p"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BD87ld4032863
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=; b=Sdvv4ZjFZCL0yLms
	BgZ01xWzR2gWiedXQayJjxVU1EWp1b1kfUnVIQBu6bJT+fA3q9l9OFNpLDln/n1b
	N+52T0PpEg6ONh4yN/Zzs9bXwGejtpj/a/67hUkYb68+AFSc9kTODH8DlACjghAC
	nfFZXGi7lv/yPx8OJ2oVNcXLYvMp//nZUSWUDc6/BpacKZ4lnFbBU+E75EwJMzEK
	99JiAIHZqzGL8NzfHgc2WG5wd/aj9VTqODfytRNxl77ExgLzBlsMNi/rkiJI3DEH
	N41Ms6KBVAP0rGXle8La7m7/vk0HBTectUitrVupITN+JiW/wfmPP/QT9Grb/N8B
	vo+X6Q==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cu90t8qvu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Wed, 11 Mar 2026 16:08:19 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-948476b92e8so23415619241.3
        for <imx@lists.linux.dev>; Wed, 11 Mar 2026 09:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773245296; x=1773850096; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=;
        b=W59sW93pL0DGozyymApbNnc5bWpo6c8MVJ2/ZLts7UbEKFa0ciuYKEX0UcXC9B1z/b
         HcSA3XvFhOss4c0iWX/hHWDWI+AMuAPIYoqMsraKBwALpScM04ML+YoxKK7dghEKUx62
         EFLPRBj+ACUb366spugj8syzCD5cGt85GwQ23kufzdOVWEkcNVNrSrwfzi939X6h+e9K
         wYl56gjC8zRnSnCrvtg1vwAL6iILynr8OsZtzcAMvFpzgnmbQkQJYBeh7gi2UtO2v0lz
         CFzr82KjedRrpkoQ++Kw0YGdYWpoODOHPR5jnFSwf3qkWrwuf3BX9eTMGxnNzuY5i6my
         21YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773245296; x=1773850096;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gX/y4X/Q6QOSCv7k16aN0suGNLFd1YkVqOqHYVfLXTs=;
        b=ZGuzNJ+us7fEa3DQdc4f2MUdHrO522lEceWUXhpBddv2ug4AGM+nNfHfeE6j5NakS+
         kbZAVu39ar0unM00S2cvnleX1CqOKceZJo0/kA49I+XunnIdA3DYpkXMk188bm7gGNL0
         qFMNBJKVYsaKhwHJSbCfssGM0tEa1kdtEcVxlCwHlxwdJhnqoF3dZu3yfMdVJCWZG6rF
         ot50OeXFc6fiy+kH7dHRgjIkNq7BmBURNOBrDHmTo1ORYnIXy3D7u1exyXLSGeBxjUPR
         UxqaOOHlyqFoOA4wradTXtmcEzLNKNaH1cKF42nPDfepD2cnH123EHGLbVRpzkj1gCQ2
         2raw==
X-Forwarded-Encrypted: i=1; AJvYcCUTTumP62K9R+A7o/VmXQyJ9p5R31TBmQIjJFps4F99uDPENKwUwi6kOpVEBdwpnKHzLIA=@lists.linux.dev
X-Gm-Message-State: AOJu0YxNkg8oMxqfVT/GNcgcpiRJwV5So2oXHPnXmINDFhHFpo8joJCC
	DiJsEaHeKDypdtBIvHwxGMZ2y85Wv7NrL70NZ8ySbHJFrlis9dNN2/Ojr9+8XwRhRg6AykGFhpu
	ZyUzRB/od/AGmRq7wBaTXknfF6r/w7xMiaZwmeneFeZRE2P/gQWi0pR0=
X-Gm-Gg: ATEYQzyRuBlkftxorPYa3Sx3TxpdbnBDPdzG7D8dIQ797mR4dAQZ/sp2e+Qx6GINpYd
	FNbKbMF9Dvdtj41vTcgAo+uc/vi9nCzzWKWFyXv9IMe0BSIcIq//lHpYZW0M3xorDMFg3l63WlY
	t2wNFTKt6FEsoMSNP+tQ84etiFUumwUBfe2evQMWIQRR0Z4YgdoUqHqMt54iAahWvsRl3f0XsBe
	FLTrx6bUs9sXeiV/nPCL5C+hL3bB+3QB2gWRNjo9kuDoDMhhpp2DeOUimSbTFRhI6x4PLNrQfhf
	Jc/3lrCGWvo1/mLVmM7tC0y3yC2gvDBeIAmXqbJNhZxNzxkIbz0V2E9lmu12kBiMOU1Cze6Llcw
	y5rrAd5VtYPtZbTx30D900COiNRVSy05M+ufJlAdyVOGa
X-Received: by 2002:a05:6102:3e82:b0:5ff:de16:3697 with SMTP id ada2fe7eead31-601def03b2fmr997405137.19.1773245295927;
        Wed, 11 Mar 2026 09:08:15 -0700 (PDT)
X-Received: by 2002:a05:6102:3e82:b0:5ff:de16:3697 with SMTP id ada2fe7eead31-601def03b2fmr997393137.19.1773245295485;
        Wed, 11 Mar 2026 09:08:15 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe1aa2c3sm184711f8f.13.2026.03.11.09.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 09:08:14 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Wed, 11 Mar 2026 17:07:57 +0100
Subject: [PATCH 01/12] ARM: dts: imx6dl: Use undeprecated reset-gpios
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260311-dts-snps-reset-gpios-v1-1-ea1cc09fba84@oss.qualcomm.com>
References: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
In-Reply-To: <20260311-dts-snps-reset-gpios-v1-0-ea1cc09fba84@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Christoph Niedermaier <cniedermaier@dh-electronics.com>,
        Marek Vasut <marex@denx.de>, Russell King <linux@armlinux.org.uk>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        kernel@dh-electronics.com, linux@ew.tq-group.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2702;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fvJPxiZJcDnoLtQ1cA0D6s3NXztANmKivfa8n0Cahy0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpsZNfTn6qzffTPfY0KbNFgDxWfK7fwOPHPTt2+
 I6kAcYyRwqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabGTXwAKCRDBN2bmhouD
 1y7sD/4m3uYhaIFFi2AxPmLW6Zen8VvbRunfGikywBQxGCskhxH9LFYaPjaWvzOU1n7OV35JuQr
 SmwlIJHmhWVx8mweQL+ibp4UkdkpDgoYmx6Amwe9RPQ1gugK+UGDSxCRlcZjq1JbQWNCECk8LfH
 7pG2m6uAyn/WtNqCd9UkfVU1ZFsxgUq2WYx1ssucO7WMsHYeNDXkK5KCUx4YO8784IE/QmARuiL
 A2BiA8HmLGtEQYFOStotK9BA3js+cLobJud4Xq4yPr4//Aq6MF+3mSmph7US6teMwgDIi0p6K+O
 YYn59VubXnYGkk6NZVBm1p++vMt7bn3WuUbbqOzycWDJITB4puqzQIZjCfeZjwX1qOzBpAqWrr2
 pL3lPrCory7jYvSMCatwbPmwJm/f8gqwse4Fl2sLI1Ip0GZwQTmGNp32Py44IqdhNHCCUFn3GtC
 9VWKESvOa3t/ggqzfMaZhYnAlpaSlINf5mfkMq42wlh1UVJ1hWfot7K2M5oWUXwU4tDDJ73W6mQ
 neYYzwjKd+Yd/npbL07IL44x3SpuStruginHkBAcJSxn30eSjBPstTX8AjGk67PqBEoAQxw1MDw
 WXBWUoqkrOIlPgHuadiphhQFjlNYU9GpW1gJE4rsjeeF4U8knOMpUOzaNeV+hJeFj+X1dwag6d9
 KswsjuUyLZbWwgQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-ORIG-GUID: ILp7p3lxkec3oWxspktbkjMq2Q1rTiOb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDEzNiBTYWx0ZWRfX2Vy+aAXkStNv
 N+vvleL7XaAV2cDrO7CsWFws3ucSRLC4hZrvamfO7s5hnzNsSLSJKOdvldRqO2litvvOpZeM43I
 Y0xs9JBJetKWn8XwjAcvMElwjTy1WNS+BXGLHgBYvNJW6JpaFrwHqEiFxQN+Ciran9DsYNxvsjC
 waGxFus9DSadbb5mat/0X3FLdjEPkzILLZobBro1BfKXZwLFM9Kqwu5w0J5CH3SBNWxaXl/GJil
 7VJq7pSmUkw0jrv32ZiZdKbOy2eN9XmfW1lJO+ozIb9AlItREH3ANqTwQvpXHHIRcA1ukL1Rayv
 1UdAIJedeMpsB0iaZlsHqAcYBgxHSZyFtt7VMDhdZ8wPI6hnl1kV5B5BmfPR523q9ff3NmapyNQ
 T4j+IykxqvlF11TTUQQedDsh80Es2YyF4+giwMvA6ttBewWuDCrwynlHOMOjx9OeKXVO8A2JzAv
 UodDshlk71UYjocj7gg==
X-Authority-Analysis: v=2.4 cv=DfEaa/tW c=1 sm=1 tr=0 ts=69b19373 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=J5n0A9H0bXRu_Ym2jYcA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: ILp7p3lxkec3oWxspktbkjMq2Q1rTiOb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603110136

Freescale i.MX6 PCIe host controller bindings through referenced
snps,dw-pcie-common.yaml schema already document "reset-gpios", just
like Linux kernel did for a long time.  Use the preferred form over
"reset-gpio" deprecated since commit 42694f9f6407 ("dt-bindings: PCI:
add snps,dw-pcie.yaml") in 2021.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi            | 2 +-
 arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi    | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
index 1e0a588b2a15..a4e2fbdc0d0b 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6-logicpd-baseboard.dtsi
@@ -318,7 +318,7 @@ mipi_csi2_in: endpoint {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 9 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 9 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
index 5ed55f74b398..7b4c16e3fd5e 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-eckelmann-ci4x10.dts
@@ -321,7 +321,7 @@ phy: ethernet-phy@1 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio1 20 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
index d5baec5e7a78..de6473a0d262 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-qmx6.dtsi
@@ -271,7 +271,7 @@ vgen6_reg: vgen6 {
 };
 
 &pcie {
-	reset-gpio = <&gpio1 20 0>;
+	reset-gpios = <&gpio1 20 0>;
 };
 
 &pwm4 {
diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
index 4a5736526927..d4911fad1d79 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6dl-yapp4-common.dtsi
@@ -571,7 +571,7 @@ &ipu1_di0_disp0 {
 &pcie {
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_pcie>;
-	reset-gpio = <&gpio7 12 GPIO_ACTIVE_LOW>;
+	reset-gpios = <&gpio7 12 GPIO_ACTIVE_LOW>;
 	vpcie-supply = <&reg_pcie>;
 	status = "disabled";
 };

-- 
2.51.0

