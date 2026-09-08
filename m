Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA15592F8
	for <imx@lists.linux.dev>; Tue,  8 Sep 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788879530; cv=none; b=sHNdrTKcmxJVhXsfLAvf9AAwQ1pHaLqmTQlsIBBJ1S6O4eDh1gxeMePuAhN447p+rJEgyd0sfhs76+p1tHTKAXNpLu2u6SdvGYe9ooOkSgO+Hj1wpNt1TLs3DSyogu2Sr7+wG9lDwHev8FiSRn31BLNpwoI8SHIo80KWh6PpoU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788879530; c=relaxed/simple;
	bh=tpTcvMP4H52TudHkrbQVYa2cd+espkFD2aaWl0S9lKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R8i0wzGN0FLGk9p4VTCmK8ud4MeD4XIDGXKjAfN20n0UW8RnS2zyfeOLky/WjWXZIEdX30yOiF3lBjc7lOiZcE6b5DAIQ7v0Bp6xn0Xs/1h/1i9M2VAqHOeuyC8nRcqZfzIEZ5102aJLcclDDekB0RCc+OHldqOFG/UNZcKtWIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QcL90SX2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D7M3C8IL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QcL90SX2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D7M3C8IL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 688Ej5Ip3275780
	for <imx@lists.linux.dev>; Tue, 8 Sep 2026 14:58:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=; b=QcL90SX28sMJz/oP
	RCEE9rGDQzWYr8VpzenkeyQmuGNcouSz4RdqSAsVENDD77fbc/t7BUICoPp3Hd/1
	gxCObDlZZ0WsCYVi7yGsvKaZDjZ1xgtnOf241uQ0aP8Nu5+VO5vvjXDE/TNchvEh
	iYtA6y9cfN2TryAH4kmm9/CXVA5684CfxJINS0BPGaquzxEwe8wlPmeGmS6Y7rfD
	u/eyCJRiqFDEhL8cWpF+DlAyA+Ap0JiPFwtcv+E0BUXIJqgkjFipQs9x1UXVHqUK
	6r13tIQ4P8yHW74mofiyTAd5696EdDDRFojOILM6T3B/OrEwYh7gr7Qem8OL+Wsb
	Ox6bYw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gj1rwm4hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 08 Sep 2026 14:58:25 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-97e9e1dd7fbso3474977241.0
        for <imx@lists.linux.dev>; Tue, 08 Sep 2026 07:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788879505; x=1789484305; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=;
        b=D7M3C8ILoyB0AWIr+wB2NZVGk0zuorKWB08c7Oi5Hm+4Uye9EMZv1coiVkfqcStw3G
         5f5SojDLQQUvyEE4dHXns4FvalcTHfGCENXY4WUD4VvhfudZMGk5THtMzFZv+d5nMv+o
         B4SSDQ8TCAKZjHP3bDH47KYzgEvewh8T87vp/cxDWNXOAZxJace/VdLX+3zGkayOZ87f
         HAeqR5Qwh6VTbf61sdeTe/WfZo+x9k4D5BbQVSdxyXOgwYGOS3kirUy8GwVmqZ8dOh9W
         DpVuqwfVOPf3+tWuaYOzJkLkNFCyI4Ao8X5SzsU0+z6YXHUfiW2uvtc6V7UIsRllrnAY
         oclg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788879505; x=1789484305;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jfr6FHf4J3HKMLFr5umwwFEv12n51Ck9PHChu4Q8jgc=;
        b=nLU6XCccojoE3OAGaS36UoElARbBEknxuALGoJOoG8TYDqeI2EcS6/Ltj8G+hMsNVu
         Kxsj19487EvZ+U20eqDNkLnXlicn/QipJaIOAqVqcd82MCPwYEFW0yaWsy/nHHJShYat
         +AFiuUrlkiOjERe0qIkCnZyfcURH3jpu47UzCY6u9nvQmoa8s3aI/hp1m0DSVasj+2+a
         VKCq7h95Fv/PVmuxz8cRJdli7JfRBDw5j7FuOpOD6u8mSwmT0AXgn1C4ERL9gkW5wk9i
         YWBxOEt8tyD+hJbklWk8Ry2QC9NjMLW5o5tquuzHDWy4RBhoIHr2E5AP8wbjF5p3sSr4
         kp7w==
X-Forwarded-Encrypted: i=1; AKwUvBw+iMs8Y9rBWzMMbhrjqonCx7KruV0K16WqhUpS0NKHbeepp7Ij+PVCUYNZ/9MzGf4vtdI=@lists.linux.dev
X-Gm-Message-State: AFuF++nhVdUdq5r5qXLqgQH84gZSETHL0qQjfHHGIm7c6gvuOCwhmouN
	4QWeWFVVSDoxcAIDlI7BLael2PgDfLQkf92YSQeezpCBHKdOY+USWrud/1igGCHm7vFE0tNMD7U
	u6AnnCV5rttmd5J7o0aGn41JWFwJXsKYSas+Jty1Bmneyd4FPij7fVF4=
X-Gm-Gg: AYBFou2yxZpmoHHLgURnUBPRbf/osEGijj3BeDd80pBhHQ/4eqC11NF5AML4868ucth
	fvpfNDVbp+qFTH7qIb0MelhDtx5iuRuKmy3iAbrKxukikwCA0BG54D59YGX4yVUTWMg+bnuWErs
	k6tlyWrnVduTUq/AHvp8KFL/PIdgEBxvc/P81JvNk8L/RW4VrMOM5Ar/KdAt6KPlLJTnqSunGZx
	0GAI5en8ZCrIed9Xp7aNKtdq8fuPxwkJ7XvxDAI04H/J6KVsHO7cc3ZNsT8lKDGnyyZpWXmC/F0
	K/MWrTxF4i5OnabPeSIAF4jLPmJ9Bz0whYtaEYF11TF+zYjOWYDpHeUGMbT72cUnURiVJX01QIg
	WLKDk1P5ohlA48yyvoRI8qOxxoDd+
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12542088137.5.1788879505247;
        Tue, 08 Sep 2026 07:58:25 -0700 (PDT)
X-Received: by 2002:a05:6102:5487:b0:738:1ef6:51b9 with SMTP id ada2fe7eead31-78a4a96d8c3mr12542018137.5.1788879504733;
        Tue, 08 Sep 2026 07:58:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a2:f118:df09:fe51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485958f1493sm25191276f8f.37.2026.09.08.07.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 07:58:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 08 Sep 2026 16:57:28 +0200
Subject: [PATCH net-next v14 09/10] net: stmmac: qcom-ethqos: factor out
 linux-level setup into a separate function
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-qcom-sa8255p-emac-v14-9-ec212b747a7d@oss.qualcomm.com>
References: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
In-Reply-To: <20260908-qcom-sa8255p-emac-v14-0-ec212b747a7d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>, Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Romain Gantois <romain.gantois@bootlin.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Bartosz Golaszewski <brgl@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7477;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tpTcvMP4H52TudHkrbQVYa2cd+espkFD2aaWl0S9lKg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoCJvjWHWOCPDXWJXS5vSSZxUqE1hzayX4vd+P
 MzfOs3fj9qJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqAibwAKCRAFnS7L/zaE
 w9S9D/9nS3tATNyOBAs1H8Be4m1od81ZrXUJD3itvznkNicxqMMv8ZvLMS9dGpFZxxGVqCJCpPw
 UPYw9+l0sDp99MQCVj34NeuLWHZCyqGg7PUIAMCalWzSKrJI2xpHaU2fkRvkn0eIxuOe8yE9uJs
 3SpbtbuO7PyS1myqG1r9HCU19rG2W2pEkvncOlu4twfQu1RU5MQwo80taf9II6+yVa6oMqfGoKN
 z17wT/Pkoi/SA7U7SBT/iRqTgtX8JFpwr3U9x31kg9tX4024/SR/kbhvx7Kj0nvnbIRyCJCx7sI
 /FlI1pHzymWABE0Q+mIHkInPahwxf8n5pqIMEA16/YHQ0ORs60eG3kP1aTcbIynJWUOeZ989XSw
 CZBFHljoRoIMVJ1f4px0pc8olTlqL0+bOKH/qB3mhzqIqLUB6s4gbnwGN1APBJzkOYYZYoqywbT
 DVAkL7AMBrmPbLjLp4vf5YqXM+TflWysTgvpZgZ8kc4ITXUqXl5Uhohv0fn+62af3q9oU0cRMXn
 GSUOl0EtjhFoapNY0BbUUa6jdN6LCAos4WEMMtd6sH8O0nWK3gXeuMIBw+XqZqD1wxjayvjv9ho
 D5KFGPKFgGnXDIlEphRYUbhIFi0GEmIXBcIIGgSHMrq1nqgcXx3N2dVBQ52Omn9pPtYOlel4DP8
 J3RdmF7HMPpJmBg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Ga8nWwXL c=1 sm=1 tr=0 ts=6aa02291 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dj4JEN0qHmgdNMwDfcEA:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXy3XsFSe6F2Q6
 EjoSWouYquGiBKQ9NZBiBVWI6We9nvgbE67e9rDOIulGU6a1+yqZeLG8vaB9XvoQYao96utLE5d
 RiqqSVRP0FGDLGMjFECLcML2a0iAhtkrl0iSdaT9wr6PAlaLsvkhm7sYQAl+p1rbbLbHM0pp/kL
 mcLeyM+1MzhdepCj+tt76neaasV/QOxrb6AP3Shme8rgZEIyBxztyUpSY96zXFqdBXpatdhsDIG
 UMKlgILgdYKNu+y/PIrdo5ioqiUzsTB+6eZqP+CZ1h3dQhRansmw175ypVbR9dvVXzJZRyNlQxf
 ytYvtxVPtIMZSfVckQHNUHHmvlXYC+Owvw/oicEBgkjbq3Anaa1RB4FaHLsR3XQdEEwvKUKQ3fA
 hHKTDyNHkEpcRElFTi7+HKlZPCWoEHkS/pEBuT+Ri9M7vMKLncwVNrt2F28m4Kt9zNBvkvveyGw
 xGalyH7loFK+rqmVYqA==
X-Proofpoint-ORIG-GUID: MhyxQsG4N8bL0uiG08ubEL3JNfJ4XPdW
X-Proofpoint-GUID: MhyxQsG4N8bL0uiG08ubEL3JNfJ4XPdW
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA4MDE2MSBTYWx0ZWRfXy8UI0nVx1NiF
 uDht8VObONS6+GsRgJ8PzB6cO2N2bBjIOBoucbozCGHJeS9MXKjuYTu1kQI5n47XUdA55rSwXYN
 E48YtTtJksuG3P+HflDx9+NdnrlPAR0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609080161

Ahead of adding support for firmware-controlled EMAC variants, extend
the ethqos_emac_driver_data structure with a setup() callback, implement
it for the existing models and move all operations not required in SCMI
mode into it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 99 +++++++++++++++-------
 1 file changed, 68 insertions(+), 31 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ab1bcb7eb18e22f01556c190f7d8cd8eeba4d0c9..509a5368e69a8fa440bf3b4f58f7b09a683558f3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -5,6 +5,7 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
 
@@ -81,6 +82,8 @@
 
 #define SGMII_10M_RX_CLK_DVDR			0x31
 
+struct qcom_ethqos;
+
 struct ethqos_emac_por {
 	unsigned int offset;
 	unsigned int value;
@@ -95,6 +98,8 @@ struct ethqos_emac_driver_data {
 	const char *link_clk_name;
 	struct dwmac4_addrs dwmac4_addrs;
 	bool needs_sgmii_loopback;
+	int (*setup)(struct qcom_ethqos *ethqos,
+		     struct plat_stmmacenet_data *plat_dat);
 };
 
 struct qcom_ethqos {
@@ -200,6 +205,9 @@ static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat);
+
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
 	{ .offset = RGMII_IO_MACRO_CONFIG,	.value = 0x00C01343 },
 	{ .offset = SDCC_HC_REG_DLL_CONFIG,	.value = 0x2004642C },
@@ -214,6 +222,7 @@ static const struct ethqos_emac_driver_data emac_v2_3_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_3_0_por),
 	.rgmii_config_loopback_en = true,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v2_1_0_por[] = {
@@ -230,6 +239,7 @@ static const struct ethqos_emac_driver_data emac_v2_1_0_data = {
 	.num_rgmii_por = ARRAY_SIZE(emac_v2_1_0_por),
 	.rgmii_config_loopback_en = false,
 	.has_emac_ge_3 = false,
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v3_0_0_por[] = {
@@ -262,6 +272,7 @@ static const struct ethqos_emac_driver_data emac_v3_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static const struct ethqos_emac_por emac_v4_0_0_por[] = {
@@ -297,6 +308,7 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 		.mtl_low_cred = 0x00008024,
 		.mtl_low_cred_offset = 0x1000,
 	},
+	.setup = ethqos_hlos_setup,
 };
 
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
@@ -692,6 +704,58 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 	netdev_dbg(priv->dev, "PTP rate %lu\n", plat_dat->clk_ptp_rate);
 }
 
+static int ethqos_hlos_setup(struct qcom_ethqos *ethqos,
+			     struct plat_stmmacenet_data *plat_dat)
+{
+	struct platform_device *pdev = ethqos->pdev;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
+	if (IS_ERR(ethqos->rgmii_base))
+		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
+				     "Failed to map rgmii resource\n");
+
+	ethqos->link_clk = devm_clk_get(dev, ethqos->data->link_clk_name ?: "rgmii");
+	if (IS_ERR(ethqos->link_clk))
+		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
+				     "Failed to get link_clk\n");
+
+	plat_dat->clks_config = ethqos_clks_config;
+
+	ret = ethqos_clks_config(ethqos, true);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	if (ret)
+		return ret;
+
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface, SPEED_1000);
+	qcom_ethqos_set_sgmii_loopback(ethqos, true);
+	ethqos_set_func_clk_en(ethqos);
+
+	switch (ethqos->phy_mode) {
+	case PHY_INTERFACE_MODE_RGMII:
+	case PHY_INTERFACE_MODE_RGMII_ID:
+	case PHY_INTERFACE_MODE_RGMII_RXID:
+	case PHY_INTERFACE_MODE_RGMII_TXID:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
+		break;
+	case PHY_INTERFACE_MODE_2500BASEX:
+	case PHY_INTERFACE_MODE_SGMII:
+		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
+		break;
+	default:
+		break;
+	}
+
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
+	plat_dat->dump_debug_regs = rgmii_dump;
+
+	return 0;
+}
+
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -713,23 +777,20 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "dt configuration failed\n");
 	}
 
-	plat_dat->clks_config = ethqos_clks_config;
-
 	ethqos = devm_kzalloc(dev, sizeof(*ethqos), GFP_KERNEL);
 	if (!ethqos)
 		return -ENOMEM;
 
 	ethqos->phy_mode = plat_dat->phy_interface;
+
 	switch (ethqos->phy_mode) {
 	case PHY_INTERFACE_MODE_RGMII:
 	case PHY_INTERFACE_MODE_RGMII_ID:
 	case PHY_INTERFACE_MODE_RGMII_RXID:
 	case PHY_INTERFACE_MODE_RGMII_TXID:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_rgmii;
 		break;
 	case PHY_INTERFACE_MODE_2500BASEX:
 	case PHY_INTERFACE_MODE_SGMII:
-		plat_dat->fix_mac_speed = ethqos_fix_mac_speed_sgmii;
 		plat_dat->mac_finish = ethqos_mac_finish_serdes;
 		break;
 	default:
@@ -739,24 +800,13 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	}
 
 	ethqos->pdev = pdev;
-	ethqos->rgmii_base = devm_platform_ioremap_resource_byname(pdev, "rgmii");
-	if (IS_ERR(ethqos->rgmii_base))
-		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
-				     "Failed to map rgmii resource\n");
-
 	data = of_device_get_match_data(dev);
 	ethqos->data = data;
 
-	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
-	if (IS_ERR(ethqos->link_clk))
-		return dev_err_probe(dev, PTR_ERR(ethqos->link_clk),
-				     "Failed to get link_clk\n");
-
-	ret = ethqos_clks_config(ethqos, true);
-	if (ret)
-		return ret;
+	if (WARN_ON(!data->setup))
+		return -EINVAL;
 
-	ret = devm_add_action_or_reset(dev, ethqos_clks_disable, ethqos);
+	ret = data->setup(ethqos, plat_dat);
 	if (ret)
 		return ret;
 
@@ -765,21 +815,8 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
 				     "Failed to get serdes phy\n");
 
-	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
-			       SPEED_1000);
-
-	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	ethqos_set_func_clk_en(ethqos);
-
-	/* The clocks are controlled by firmware, so we don't know for certain
-	 * what clock rate is being used. Hardware documentation mentions that
-	 * the AHB slave clock will be in the range of 50 to 100MHz, which
-	 * equates to a MDC between 1.19 and 2.38MHz.
-	 */
 	plat_dat->clk_csr = STMMAC_CSR_60_100M;
 	plat_dat->bsp_priv = ethqos;
-	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
-	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
 	plat_dat->core_type = DWMAC_CORE_GMAC4;
 	if (data->has_emac_ge_3)

-- 
2.47.3

