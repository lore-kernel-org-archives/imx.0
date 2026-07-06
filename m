Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA97F423777
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 09:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330485; cv=none; b=YwXCuFffH2UlK5mIX1r6PhB8PERmX/M/kbO1/3zpeMXy1biCzxjqdrYGpsZ1BJE0MLBK9P3g5c7+qCwfglO3pFmBr4yXR244PcSo5CinI/1H5aKzjMn6MPALlOS+vlCeAeLIZtDtf24WdfnQj/N/R5E71S436hjxWeTBvnHxNKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330485; c=relaxed/simple;
	bh=IeKRZg74QyhRVwu+kGBUQl8HO8WW7FxL2jQ3rUJ6AMI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4hjfj3vRrCMOhIkQaRRLeBFdjWC4kzTeS4YISRycK9kI1aQN7zvl4OjlUYqCq8WC9U/LriSGwGDzWqpe9FR2zY6rvjU/BrqEC6t4GwpN23jKrjyxVgVJiAcfZlqVlBVuWmY/cRRZblC19FsUKihDnjTnuMBgIVkPQqbiE74gi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NFLCOJfC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TXwzqF1P; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NFLCOJfC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TXwzqF1P"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693qTv107413
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 09:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lVYzWkq8RkW
	eG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=; b=NFLCOJfCuBezPKIGjoBd5fMS4T9
	sm2LSF1ro6b05Lcd+AdtG7GcKw3uPxZByAgcNdB/7fYvFLl5TTY1BGrKHoQmD7MS
	5zCMG+5P7X1nqMqXlow2WrKKPdbg8tYOrY46DZ9Fe++7FXz1gj3Ocrh6GkvICS8G
	ziwj9SbQP+wadn7aCxuNydqD7WrZonxAjmpA8mCYaycPXDWn7vHPU995SgfhVxh+
	MT9LfEs49dbYxctwLr+NEL+eHLb1fMwfWzefZWHc/ina7NERql3Y1eFGDFqiNB/m
	+B1xqYE8/Yjl2PXP7PMGa22Ga5MywjmVPP0JQzqHBfoPABnR/jLWv7JoTqg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891ur6t4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 09:34:40 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e66f9e2baso266157485a.0
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 02:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783330479; x=1783935279; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=TXwzqF1PnM5MqJMg5YfxWNBK2RS5w/d5rXUvpBWhrRnHyrjs1ifrSe37afKHEQa27p
         82nhAaEZR7hbIPLgyPGU17YpRn9jOVmF6S/OGHOmsMitm1UIkknq6TChuft0gK+m+ZMc
         GVqZ/GoGV9eMN5lXN08qQEGEQ4st9xlz9aTsVJLK0SVyqc1hFt+/BLxEBpuZ/udkygBx
         7sD2mMvNdFhT0Cl6qUkwfjU6MIGs+fMWziuX2Yc9bFdT/XIns4D+lKqDDCC4a4Uj68e/
         ZbQXvBy+xxvZMsG/g+Lb2dftS5OY/DQiYb/59Akt/cH8Rlx8g9E0+m6hbJJ2WlAelz/L
         Wm/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330479; x=1783935279;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lVYzWkq8RkWeG8PLodKJIFI9GJIkXcqgBqHbVKPLIz4=;
        b=kChq75hmpLsNJWCUoVex2YafMiRiD3sOb/urI3vzWaxY+XwSecZYLCuhGuW9AFw+R9
         xjuMcmTvPMvC9p21HUYoSLBYbrdVpI4J/lENlZFTLzFOzGY3GOzbx5MqiUQfG7dOa+FI
         KiSy1ocOeaBzDtFvbPPaOtfk7ZwGvlazcFpdxBo6caDQuk/BAgU3/Q70Kn0c9aYvykJR
         KseTy65rP5hp3YkItwpsYjU2opXH8kGgx8GVxsSg6LAkkorpCIesjLe2q/n0RNARhAmq
         TNQ3TNCZrqebBwD0JK+hkfw6INC7IDxMz3MJHgAEWo9kAU4WFweXCcQriopb0aOsIHUN
         5AHw==
X-Forwarded-Encrypted: i=1; AHgh+RrQmLbuOojffIUVcgTm8C488AB+0ITvtIBYXIJ4yYIXEAqRCjtf0dJHlb6axn7ROuf/iDc=@lists.linux.dev
X-Gm-Message-State: AOJu0YypZIGgaDhP8lMve6AVwyH5p5VN/bfF6e4zmVQyqO9Th6S/oGmS
	R1hei8X9EZKAwdRLRZZ6Yixu32JDqaUyQ6sse9MkIrCsDL1AwvVJ+643ZNIIaQnvl6eIUi5A8pb
	TX/WReRD3lk+kPJ/FEd8BrjpxDLEfSFT2tLT7XbfIp81Ufl9WQDhfnc4=
X-Gm-Gg: AfdE7cnuo3N37/SF03+s0ymfmGAeAIN54m3m7HJ3o3UR7GUct6R95+0cwpHx9jE9pXV
	g2gwb5/3BF2kH5ugCV2/zAm9u0CdrIQabZUMvur0SgmBzbWHAJoOL5xjmICcXLfbmUdAw1kXLvg
	njkGfYjPw/B5NR56fVFYYdneo9koqLjuhVMOO5zZS0vrGGRrgWcvo/UgeAGA6yCsIQpLx4/LePL
	tVxxfRwIRnHcWu/KLuKvjnzbCeZfNv3g8u/pAWLqtr1CERZ/gEsW+PoefGk99sUeOUUXbrsEW/T
	y2hTMikPM9MtfERgN7r+msVZ08Hb8c0lEV1tfOP02wdO+Ilnh54npGpZNsGLhgh8A4r8+ZQwAhO
	5poTXx9laEMaqP4t53FJblyMgyEA=
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259051485a.51.1783330479289;
        Mon, 06 Jul 2026 02:34:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4609:b0:926:16a9:cf08 with SMTP id af79cd13be357-92e9a4d1e57mr1259048385a.51.1783330478878;
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e4d7801sm23938339f8f.16.2026.07.06.02.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:34:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chester Lin <chester62515@gmail.com>,
        Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: s32g3: Correct indentation
Date: Mon,  6 Jul 2026 11:34:32 +0200
Message-ID: <20260706093430.273703-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260706093430.273703-3-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2184; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=IeKRZg74QyhRVwu+kGBUQl8HO8WW7FxL2jQ3rUJ6AMI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS3anbJNEPvKPAm/1YFLMfNg3gBUMSn0Tm6Py9
 TsPqF6qYdKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakt2pwAKCRDBN2bmhouD
 12thD/9fnkq5jQJ4WKHrWWltGuRyHhe+UQRj9VLv5VK1BmER8T8CowIHvmUX0XO8r/vTsWLjmKt
 WXB7pc+QQw2B5KYr2GO3YVt4aoyuO9eclCQuyOb2bQ+Watye2rgVgm+0dtiDDPPPhpPZQk/uIdg
 5o0HtXrtOEV2D4uBNK2JJhZIu+OoCgl2XS8n/OCGs00jegKKIB+dVgRw10pgYsYIsjf3BEjLVxk
 86QbzmKKFf5KNjxbIVSzMWLWqBcblJNJpQvBT97dq+lwS3EaFIye6V/g4ZPwcT29Bd2w5SeuD5H
 pDbC/ipEC8l3U1aEGJoYIDBgEAdmmKe884gec8VkclFcQ5W4e81SFFNxsoRRgCkNik1G8JO7CH8
 QhhRYbga3H7QavEhjpGUaYV+yts0PdjoftKWbDpDuQ4/4+zrcalBxpcI0ih1aR+IkNEdDxL5Qm1
 O+LoGdfiL63YjVzEeht0XAivyr1jiFj6sAy4JK/nNPubnjUkFSbSiSbU+iw2trjDdi8qV3r8vjv
 23syf0qvADAsLkFIEWgOoQxSbUXA5or/Ja7BeuQQZw+0QWGohLf6rS6F4F3fLZAxM2qBGblInCo
 Tbw4GL+l7Sn5jD5YegF4e2KxlWBZWBFVPKWxDG7bglqF6qHvNRIdO748vYqI/knGdanS4SRv3lh pQ5guXLIWUA0weQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: -js80bOYptZz_hqWCl2GGhjSmpYKu5RJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfX5kmFQl/0M7+8
 slqE9+Y5/AaoaS1MiScwdRkVD2qQpELoST3ziYgFHNWHJnxgBjzYVXBy623+9g/izxlHbNxeVJF
 UGtR1oZFbPhKApuA0dejB45zEyIClfE=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b76b0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=yCPzjt8dSLUH7PgGldcA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA5NiBTYWx0ZWRfXxK5xftnVQeQY
 /j9+xiuBXXAi33QMDNdBLLOt0YOEbzNAsHXVUo7pI3jJ8jHjZ04YUslh53OoNq/t8Ayc1ri1ilC
 LV2iwefAqBYE72CwcGbGOk7FJlsfAOErOsWQqkjWBL2pEv5Fi0S6vujwrftjnUo9F5IdQVPWve1
 oXM5y2ETJvSWMjYXeA7JMTK+s2UoULnLsBvPawQ4gVSHKfPwBlVlmbd8kVeSq2bXGEw6FfnO+12
 dXTxdshuGA+zhZHviGPvSiO5xQl+6obGDS4/krSkpGo9z43tPelrTNlgjP/ZubCrqPvbLuaHTk2
 02aJye1TgLzJCuw2/M3ncVK5gw4nC7luiuTmvbylFk3hsqmU7MVqmxE6TW2/6DX75KbezVN3kOj
 xvp3WdlmFfAC6v0EFJ4ZQEqyJa7ZeS83G1ESizLjdYuiGv1LQvA+De4aI+NA9zNl7xQCGocIGAO
 bS4yl7SRP/RDTfj+aEQ==
X-Proofpoint-ORIG-GUID: -js80bOYptZz_hqWCl2GGhjSmpYKu5RJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060096

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 32 ++++++++++++------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index 22e80fc03f9c..6eafa9139557 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -534,22 +534,22 @@ usbmisc: usbmisc@44064200 {
 			reg = <0x44064200 0x200>;
 		};
 
-                usbotg: usb@44064000 {
-                        compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
-                        reg = <0x44064000 0x200>;
-                        interrupt-parent = <&gic>;
-                        interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
-                                     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
-                        clocks = <&clks 94>, <&clks 95>;
-                        fsl,usbmisc = <&usbmisc 0>;
-                        ahb-burst-config = <0x3>;
-                        tx-burst-size-dword = <0x10>;
-                        rx-burst-size-dword = <0x10>;
-                        phy_type = "ulpi";
-                        dr_mode = "host";
-                        maximum-speed = "high-speed";
-                        status = "disabled";
-                };
+		usbotg: usb@44064000 {
+			compatible = "nxp,s32g3-usb", "nxp,s32g2-usb";
+			reg = <0x44064000 0x200>;
+			interrupt-parent = <&gic>;
+			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>, /* OTG Core */
+				     <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>; /* OTG Wakeup */
+			clocks = <&clks 94>, <&clks 95>;
+			fsl,usbmisc = <&usbmisc 0>;
+			ahb-burst-config = <0x3>;
+			tx-burst-size-dword = <0x10>;
+			rx-burst-size-dword = <0x10>;
+			phy_type = "ulpi";
+			dr_mode = "host";
+			maximum-speed = "high-speed";
+			status = "disabled";
+		};
 
 		spi0: spi@401d4000 {
 			compatible = "nxp,s32g3-dspi", "nxp,s32g2-dspi";
-- 
2.53.0

