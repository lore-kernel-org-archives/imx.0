Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA88E3E7BAF
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779969815; cv=none; b=EHte6Ia6J6JYqL8ONuhXplFwtjC6jkgmu1tdVOpXSkPkmKqMT03hjQ9kad5C2k5mG/lQD6jbGCENdB1nTmwlRcjJN4zph2b5uwgLBRlKW7aRqDlEQZFZNHDVmqSx91nemVJMYm0CXGgNUA658y7Njqzj/q6S+DsVC3i7SyGLtaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779969815; c=relaxed/simple;
	bh=4BOlVvg3iRSP1swvQ5XO1a679OzNH/v+9k3kUrkeOsc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UoJ82n33xsiQ40li6HxnRjcatxDhNQYsX1Fsgzt5A4H6urDlFGdbGoy+4RTKY67w2yDejevQSpk7X1oxuj0TcDpPn1eqQEOYxtJ5RToDnocZIceo3USU7fI8vU+X35CN90ZBZ+pw+dugQr/mGLvBFshMS34xyv+0MpV/i6VSTMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKxdT2Zx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GJKPfEZZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKxdT2Zx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GJKPfEZZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vKUn1562576
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpC
	PwzY9U1A=; b=XKxdT2ZxyET/kRwmmco/ZMp5hTn96amBXkrujkbW72W0YNHe1EH
	nhOIM4bMhT2NGdVjwGz8l1Zj4duffd6plFgnjM0xkxySoiTFfgA6370wKZmL09ek
	FM3H/vg8mpW2weJGjJkAPHVgB9rL29RyKUgAZCh6JjJne0sR4MyZGpzjVDupZT4q
	d7wRvPmP11H4rE7YJSJJAXP3G1qPrBlsnZwTh6EPjj8xlvrqRqkW7MeQlj/ESQRj
	IJnIUqn213P+7sxrpgB4xUX1Hhy01BqKVsbQA0EBQruY3v5XtNr/DSEK3r5wv6VD
	KNLXROP2k7l93zKFSoHrEs3VAbbV8anImbQ==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y2tm70-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 28 May 2026 12:03:32 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e60052c551so2621695a34.3
        for <imx@lists.linux.dev>; Thu, 28 May 2026 05:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779969812; x=1780574612; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=GJKPfEZZSTgnDlcpj1nQWuDQC+OyyHkmiazxfwOGY/9rPVPnk8lxQF56pihYKJEzu2
         huRXT3l/Bt9wLE+Oh2tDQdOsriaS8eARwvMZjwF/PEajhplbzhCLdx5QG+aUGv61swNl
         zzb+lmz0ycyqBHMLFKxgCyUxpLVmkJyULGBHQwx0Ph6Kp1DyOnbliAluPuHLv5ISN6nj
         DaZ7tZdMvOL2GiHFoGqRDAWeCPv4fgo+6nCBNqY2ORhsu6Nq5ulsNtD4wavSP+S9SrUN
         wgR4ws9CcNLMXRea1iCXHj5x7cy1qZB0pXUJKndUKO6Jj+OQcewrlnSNVck1UMsRLEjX
         xWrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779969812; x=1780574612;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lRDh1Gsgwo/+sLiCfxMrEEDL44ENfFOMWpCPwzY9U1A=;
        b=B0ZNJdGoloJO4HxWsKKownoyZOg0Lhqx4qoNTqvo53aEpth2enSTn2im8XOzYkVKHo
         y/GWm7oKVzRIgNUJ+/X5BygrqYGWbV2cOLgErAaHq/XYRdwlzwmgr3v1bz0TA5AC0Kko
         SjoNTcLW/aHtBoSFXaFzl6M7TQaX5XffXwF4AMgbFaHr4yZfuyKUnRW+nDIZXrWxOXte
         WrmVoirZUWGPXU+dAkKD1F9NwP/tlAd9PoBBQMQjFLXzvglHYSUHiPXBPJUHnliGtUlV
         mbrfkDGvlLpxPYZK0Urx5vLrAH0S4pfgUMn7vf42e6dKMnvW+TJkNP9l+zgQK7r7tuEy
         TlBg==
X-Forwarded-Encrypted: i=1; AFNElJ9m2ty7z1aV9Dq9ZRHsvjgS4jWhEV9m52LyzFs9THDJLk8yfxPPakjZvhbaWTiSQi6+U40=@lists.linux.dev
X-Gm-Message-State: AOJu0YwconpPr6CBh+5sEc1SXQBEZqDrhuBqSouL93drmGwpII1Z3GZo
	S0wPwTFWBUYpK7tV5cAZnaKVbsanMSXQZ8/HYEnlGlFz+Chn0tUtMiiC+eWh5t+cVZxT0aDUkGB
	ij7kI+5Der3E16HUK4uI9pEceBm4jUZIKjBvKmxInsOe2OjMEuX7NMuk=
X-Gm-Gg: Acq92OFKWiDkDPjwHfsK0Hsz6QmMqC5eubs0qXNi4/IIX7G4d0toC3iqkv175qMQexx
	gJSOnlvgp1TuiZbCZNm9ni5yYulMEZthv++En2HEQUYAAYMPZUAS6tzWJ0ZbbWoNXz3RVpGUCPB
	z/E9iZcQW/ddIliV5bSRVONrxWnUGRWbYW+ccHoMKF3QXsZLf8pXfwpb4eArlYIiKYgj4JNH3ke
	ng/KI7aD7+PsXKkYNbAZ8VbW7U+DtzGzY+4Ahb16nxXA7hEgywOLsNz4kqjw5UGmuymEM6s8Xpd
	kLfVZzdgOe4dUVkH9VCEm8ul0WNQsXahJ11zWxxDYR/rHJdoAN6j82XiKy3LF4ItrJvWlGlCvoy
	YJSZVl75oXViWjbwViVtoO+kNWeLXpxY2Yive/azn8/FRXg==
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066705eaf.17.1779969812109;
        Thu, 28 May 2026 05:03:32 -0700 (PDT)
X-Received: by 2002:a05:6820:2222:b0:69d:e8de:7578 with SMTP id 006d021491bc7-69de8de7d2bmr3066668eaf.17.1779969811575;
        Thu, 28 May 2026 05:03:31 -0700 (PDT)
Received: from quoll ([83.144.38.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4908dcf850fsm21035695e9.4.2026.05.28.05.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 05:03:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Chester Lin <chester62515@gmail.com>, Matthias Brugger <mbrugger@suse.com>,
        Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
        NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] arm64: dts: s32g3: Fix SWT8 watchdog address
Date: Thu, 28 May 2026 14:03:24 +0200
Message-ID: <20260528120323.46287-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VeXH+lp9 c=1 sm=1 tr=0 ts=6a182f15 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=gYaODGAG9naNOzoQWaDNdQ==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=W4yJvGHheH2QdBhsH34A:9 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDEyMiBTYWx0ZWRfX74Xl8nFS/qhI
 WE1LEAynBWhpEUfzY7sH3A0kM9bW/0XepIzoBfvCgNg20NcRXuAKktIDXfIxAscueFg1HDHnyLD
 2TF0ZiruB1eDNkSvm0xtNDxi8tyJbd4A/qXDUhSqqw8XuuMQGMEZr9dHGGxURXSFEcy9bbICWvp
 k12287/ij9k822VefHgx9cePsVVwU3nRyeN0+iOeD2Znq7BvKA4POP2Z9XUQYQFQUiC/yiEaT1h
 LyyDn/fLCoNQafkUpYHkZcVYxHYqXxlaGikP2tijraagIRSrydm2k+mdRBpW6RKb5uG4Tt9Iwoy
 nmgapT/kJEFW3OX4GH2MOu7UNGkRYYXSeTI8b9WID8FmBzveDXQ9ru4Ni91YIqZc/zeCIU0htvt
 7rLcr52HpiOlo06TScjDk6SmRoTD1aFFOC1DaSxEj3EiRxY0YLjrKSXaB+xzKzjymuOVfc156lp
 GCH0YUlCG6MJoq8mlCg==
X-Proofpoint-GUID: D07JHfvbtiD8LAGKzYdp2peGiAxKJSn6
X-Proofpoint-ORIG-GUID: D07JHfvbtiD8LAGKzYdp2peGiAxKJSn6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_03,2026-05-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280122

Add missing hex annotation to fix the SWT8 watchdog address in 'reg'
property, as reported by dtc W=1:

  s32g3.dtsi:863.27-869.5: Warning (simple_bus_reg): /soc@0/watchdog@40500000: simple-bus unit address format error, expected "269fb20"

Lack of hex '0x' meant address would be interpreted as decimal thus
completely different value used as this device MMIO.  If device was
enabled this could lead to corruption of other device address space and
broken boot.

Cc: <stable@vger.kernel.org>
Fixes: 6db84f042745 ("arm64: dts: s32g3: Add the Software Timer Watchdog (SWT) nodes")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/s32g3.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
index e314f3c7d61d..7e28dff53a86 100644
--- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
+++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
@@ -862,7 +862,7 @@ gmac0mdio: mdio {
 
 		swt8: watchdog@40500000 {
 			compatible = "nxp,s32g3-swt", "nxp,s32g2-swt";
-			reg = <40500000 0x1000>;
+			reg = <0x40500000 0x1000>;
 			clocks = <&clks 0x3a>, <&clks 0x3b>, <&clks 0x3b>;
 			clock-names = "counter", "module", "register";
 			status = "disabled";
-- 
2.53.0

