Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C679D364023
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 06:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457506; cv=none; b=AA1WUqbdp8Wl+45/7xrjltbccXjdX2nMfeOfv0f6BZUdnhwFMlXv9E0XBZSdJcXQ4X131p/krnldTIffxcq5Np404exnSPxaCbBrMpNSLrjrR/dXbFzosI6hAlznvyNvQYkG+2PJABKLPBdQTGXpPbZg/XTl3g6TuqUzoRl44J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457506; c=relaxed/simple;
	bh=cnSToU0JVi8FNh9yA4D0xjNAQN16uyi+Yv/aqF60iAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B5+4AQpLpD0iHcnSu8wDgqXv9/5oMVKZdn33rlMAd5RjqxT4MfwMZEeSxgIKno7fwETmAAjkCp1bM2gs31RbpYKP0GVDmNUjZv6lIuUGsjlOzmIgAHxY8vhYL7hVVNDj+R6IuhKLCP1li6Y373UNgj/KLuPaGjAN+HTS/tY2Ds0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gtK6v6Rn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MR+CuCod; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gtK6v6Rn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MR+CuCod"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 635Kq28N3594801
	for <imx@lists.linux.dev>; Mon, 6 Apr 2026 06:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=sCXejvIvXzR
	onAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=; b=gtK6v6RnQVpWL0kdgpJjnjka7mt
	dGy7exiRN/TQ3vq4ereBnye38P519mZi3ZW3ZYIu/HeyaLMFjjJnjRBPkvaEdN5C
	cOdWU7JFEtpQaMtCb96BZIwJ5Q+5ISvL20KDs2rarJv8q/wRQ3v1zit0CM6VeyIp
	LncZ6jVu3lD5dU4mpXAbp3d3io4Vo//HPGetMAwlOeCbwMXlNSYw901PdAMsdvoz
	xgbs7gkLS93WsZ53+gz2NWZyRZcwCoCSbifa/8kfHBjZ0T2f07Ybwo8LEf5zKKta
	YLCzI/XpqR9v5sKBhgrQrAn2sHABQ2+lJCeLNL3deT8TNzkY6Z7pV7Jq76Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4datv1c5a0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Apr 2026 06:38:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d8ed08aa4so24966581cf.3
        for <imx@lists.linux.dev>; Sun, 05 Apr 2026 23:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457503; x=1776062303; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=MR+CuCodvoqKZbomcL3WZTb6/hY4E5ftgoCEDlVjKIfTqXkkY1MJMiuRgmyY3NAe7F
         S2esPYJ6pmQnB74SoIrVgpYeUFL1bLVQwax8/pb9kFJ3eLWUpaZ7XMXMCDLAh+yV1eyM
         NzZFSoKbvb6IS56Pls3ODfklLY6bp0TK5OHCpnYv7esxgSBlSC29Ncjfi1GLMnf++dQx
         tpPnT27D+HLCNIQNcd5VMqo4NzS/CLkkCgUaDco8CV8K+sgR/yoqS7FpuXnQ607M6pog
         W+EKgVcPOuHSmij1Gw+gTxfHqGNsx9nZntYIWAykOnJnJe1RGB5hsqXfQ8+H29YzzR2n
         4WaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457503; x=1776062303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sCXejvIvXzRonAhIe6RN1n43jxQ6Tvh+KK2kck+kjLc=;
        b=rgiW/KtaBbu1DwGYHyvgsqvvaG0Q+e0CuujolDjLmOHLUDERsVNa4UgWhKysFbZeib
         JqHC1HrZLNnnACXSz1itA36p3DQhHmKcW2aSYdWQnAjq/gvR2HEFFV162EdxxARD630A
         Hn508KJH3nXY4+wo/6ja1SuCBWwoaZA/km/zNFzW4ExgTVjmQ6QaIYb/1o39GQXp2mBL
         N51GU+RllhRUJAB97NJt+iBF0+xaedAspoSTV/W+FuIc/Qmu/NKVam7+u4y89AUZm9u0
         RxAEpF8c6sXug4wRMKHRrQxEn9hN3rM61uGqtyq/YUW9E/v+FN3nHueSI7ejyy5QLy73
         WVBw==
X-Forwarded-Encrypted: i=1; AJvYcCU1PGajHBDOcGCwNwb4T6TvegzO++0C1u7PbUXhtqngjxd4ZAhFjHstHtiwmyURHUyuI4w=@lists.linux.dev
X-Gm-Message-State: AOJu0Yz0abeHyOxVds4gGMFs03xO8n6qDHVg9fvn7tsTTZouAmd0C035
	1iHXmETq9Xj9/YdDZzXX5QH8d8F3K0lA+9nlyWD9P7z26pH8hBnfr79kQQ2wA5w0mJo8Ao7Gtn8
	3WKncov0Dkk/VhFM9tKZQjFzr/MyR6yO40V1xC1EVIAdrlW3//ZlW+ig=
X-Gm-Gg: AeBDietseOEzBJkUyyrtsPo7a7Rmo1lM0lVAM6KVGbDC5rry9Y+phpOfEYYamx447ac
	SKovzLE8F2ZZp8Q1hO7rCH97irVRaRYvjkmtoubThvtUGx97IJrkcrxgul5b7+ch8xJzFj00/2x
	nh2C1+delCqUm59JSZTjEzxxwEiTRvKwIhnuBOLUd5votMey9PLhlOB8dZFu8qcSaTpETpeJGFj
	OiuZvm+zO6QSF32ZEDhMzqnKq9NUpiKwCQRkFQB68Ln3Z8d23Ete1Brtj3e+xUR/B3KKXyWfXVf
	z7vIaL5zOtgy1dlCYdAmJD+UGafRrYdggbEKLZvsr93yWhmQkwmX9JqKK3yzbDB8zSJ6vhAsT43
	xthiQAW0rjotZjMwmYkUmI5bL5/UG9HVYD2Ue
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960951cf.47.1775457503162;
        Sun, 05 Apr 2026 23:38:23 -0700 (PDT)
X-Received: by 2002:a05:622a:18a3:b0:509:2618:cef1 with SMTP id d75a77b69052e-50d62a80efamr193960661cf.47.1775457502818;
        Sun, 05 Apr 2026 23:38:22 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:21 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Marek Vasut <marex@nabladev.com>,
        Peng Fan <peng.fan@nxp.com>, Fedor Ross <fedor.ross@ifm.com>,
        Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@nxp.com>,
        Viorel Suman <viorel.suman@nxp.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 3/3] arm64: dts: imx8mp-ab2: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:13 +0200
Message-ID: <20260406063810.25531-6-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1239; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=cnSToU0JVi8FNh9yA4D0xjNAQN16uyi+Yv/aqF60iAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01TWXJeeow51hO6xuzeuJNKOn8auMRg1PTfGN
 q5wYAjvx26JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNU1gAKCRDBN2bmhouD
 13WSD/wLwS38Q3CdR0ASwRG7YTDJkR1cjbPPWx4JIdVIn+BN5p2xe6dhzSBEeaWGHmBOufqCYzC
 NJOfa8vYbP00IBTtZX1xUjKOL06nwmW8nIGDHqOLBMxxhMaFFYOKdP3qQefszeFGBlH768yqsHW
 L0knMV2ksg7T+EMm2zQq0GPX43+mmrF8vlHrp9ZKZ/7mvcU+T7PQHaF93bfUJZReVa9WPJ+IGa2
 h6OanYKu+rXBvaxmyyRKxEZcHKiOzenPaudB1Zq9d5aAHeaayK6qZMmi1R/7GFYC39EzYLCm5lf
 /If92JAnEB2fPgeJpCrki8aD4++YO6rFoHENoOdBBoyMY+Qe6NH/kLAyIUOpAh/fnD7XIXc02s1
 Adm5XLAgy+9JiN0JUHUZJRepeMJr/4hVy/e57kcxFijBn1b4FURiS/DYpqkYEjvP3jhDnB1POoF
 6JkB3NffyCXhrRatEPFW5y26EueAeuQID/VubmmVwVZ1NKbcsRbO+vG//INPsL6Uh+4FurzVA0l
 dSJSLgGzG9BpV18FKkXHDicKvgaBdWN3pyr5//bd8pmZkdBFANtM8I8H3pKeGw0uRP+PtRlCmFU
 20VUFZW0yduQeYdCeGQQhpe+tc19MWW1NAt4t6NXd2InRYcgPSUjky+Dym+Es6WMEEee/5siIV5 0xQ7CQSP0flDPWA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UGldZAxfY-mOa6q6MTrxuaXuRFyH4zOk
X-Authority-Analysis: v=2.4 cv=GLEF0+NK c=1 sm=1 tr=0 ts=69d354e0 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=0oGBXvcucFHjQTZxw3UA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: UGldZAxfY-mOa6q6MTrxuaXuRFyH4zOk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfXx4Kek1IoAS2t
 ian9MTKyZNPmbohBpsaibWgBbmjHGXgYKtc5R8qsRNplsYrg4PoTDRp2h5a54nnIPI+MgRGU6/f
 6g12OyMktrhLYDZm2dpbRhnhKB/ibX4ed3OasVDK4VeFi8en8SbbpbQiEpSpVy9DMMJT6Csj3md
 oE3oaD4IKJxeNjvKHtweSQS4jHI2ru0/I2u3Z+y9Gd3kUscH7U0y69snd0gGFQgrXML+hYA4itU
 daG7A43qhFOXJ3za4566nlGxpXiUkszw1QR7Tikllhc7W39k1NeitW296n+55oWEEmNo+w3ORrL
 W4urdFJ3+2+vtQpisxBrMFn/0q1cwY2+uNixbBLSgQGrTn24u6jk8C4/pU2aYpN4lvyJI7PSCss
 +moQ1gzssbcUL5Ml6Ehw7mI7vhM56mkZG/gnRChx/p2j30SKIs8rt36cnfkKem4gT2K9KH8Jgk8
 IzHV4A5Iirul3saVCxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604060060

GPIO_ACTIVE_x flags are not correct in the context of interrupt flags.
These are simple defines so they could be used in DTS but they will not
have the same meaning:
1. GPIO_ACTIVE_HIGH = 0 => IRQ_TYPE_NONE
2. GPIO_ACTIVE_LOW  = 1 => IRQ_TYPE_EDGE_RISING

Correct the interrupt flags, assuming the author of the code wanted the
same logical behavior behind the name "ACTIVE_xxx", this is:
ACTIVE_LOW  => IRQ_TYPE_LEVEL_LOW

Fixes: bf68c18150ef ("arm64: dts: imx8mp-ab2: add support for NXP i.MX8MP audio board (version 2)")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-ab2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
index dbbc0df0e3d1..443e4fd5b9bf 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-ab2.dts
@@ -281,7 +281,7 @@ pca9450: pmic@25 {
 		compatible = "nxp,pca9450c";
 		reg = <0x25>;
 		interrupt-parent = <&gpio1>;
-		interrupts = <3 GPIO_ACTIVE_LOW>;
+		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
 		pinctrl-0 = <&pinctrl_pmic>;
 
 		regulators {
-- 
2.51.0

