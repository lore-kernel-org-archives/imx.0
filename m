Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A30A3112AB
	for <imx@lists.linux.dev>; Mon,  6 Apr 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775457503; cv=none; b=Hj0GBIn+5wfGqIRu74iapiPKdKqm5hAjV7jW1xRHTbo4EEIUPW25WuEry9AsMQgyzsxTrRJHE7PQmkF7efYhqnkV381x1ffv8Btbm6MxBxzllRQeH2GW4JmfaTHBcRH0rhVlUz1ojwRnYhuO9N7wZEk4IzlEjiGwaCmPSgqbwpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775457503; c=relaxed/simple;
	bh=t3X4myeEM2pMRgsbKfWAsvjQVVUHcbGX2tomwiNFOsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NzFQpN667hTogAEqNUzqwr3FuTFEoVeV2JnNRoMAI+XMxQIyIkmK3NF3556MWGC6Ua0OOe3KXmC3Kcc2kxV6C318mpEIRh/bZH7kd8hu3Nl2dZKIZ7UUMQH64S4Ko6n6Xzvh+xlK5YkNJCsANKlyptreRwgqdqYgQecy1euX2HY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QaTBnjDT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BunZa1LU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QaTBnjDT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BunZa1LU"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6363Wn6u2973403
	for <imx@lists.linux.dev>; Mon, 6 Apr 2026 06:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3
	lrMvYhgY=; b=QaTBnjDTHbYn4AkjRgJyhryLCzWUMncp9XDZ13J8ZzBnfVtpVUl
	VKParra5IlWQcfNgEZBccuJ9P/PFKUPrbVJTpRwGbFMNv4wnFo57TmlcdDp0l7RZ
	ORAwkonVC2a1hb8h9tQxiGgJimj7SOLPYE3lxjGiBHGAWETWYLk6W+CMpzgSetHn
	BgAhTm27GlvOTzGSdD2UA0A5OPJebKlXsv+LvBOPMps97Hi19MRGWuFFF9Om8lzv
	wH6BTxr7PaORpvBgmc1/cEKZ+uEmrHSKPJvfMuISycUKO35DSAHUleqbOsCDo595
	eaGTVcTeVEylKn9Z68gymWXoF0w8dFvBW8Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauthc3at-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Apr 2026 06:38:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d984c74a8so4433191cf.1
        for <imx@lists.linux.dev>; Sun, 05 Apr 2026 23:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775457499; x=1776062299; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3lrMvYhgY=;
        b=BunZa1LUIUadopIMvTQF/PGZPxMl6jMJ//PnKAv4+35viHprPJ8Han10vEKeay4ZP+
         UhR/5CQitFvbHG3S+kxsBKGSwSxEDIzZx8VvC048XrlIuqEOi0jSqfFgpuaMvNHvkNox
         BR57iWlHV/Z3thOCwz/rQYAm+lmpfiEY0xYH+XwHv1e1VQh3cpmGreMplXRjC01aVzhV
         ADaClXKUa4ppYu1f/YW272FKZdv/VPVQfjKQ2rpLfGaoKkVcjcbnrLqv0WGlgCDiseZo
         sbeojH/yG2PyWoVUGDsFj+d1w4AYX+0WQk53UGRMwmZUJrbZt7bpT8wxAxjHLnsGY1DU
         OayQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775457499; x=1776062299;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u/gxhDv+dse1tdsQ0jNwId3EjvKmQYwVQA3lrMvYhgY=;
        b=cB97FBp0AVEAGFfqd08iVyqYAmQqchALgbjsKDUztmd8rtopdV7jqpplcrzahesxvw
         bOJwNvJhbCpDMgNhjActXCH/iTuxvYjpWVtBjfD4nfdRTbeocHPfVUvWyZOVQ2h0E4qJ
         kCkE1efIMT8ORLkzkWFdusIxjeSjMBtmn0kqmd6kY4Wv1JTYNnzJA8WkV15izw3Lm/lx
         vugibxP4cl4FnfkuNrKyhVI5hvLLCGdpu5qoMDhI5IWu1JZPmPMYcP54McoWSPH3wFGY
         aUk7P+P+IBfslPP50NG1ZhKBrsJf8A9f/xqqHk8iF8YnxATa/BCoMkKHMlRiT3rTxT0m
         MTGA==
X-Forwarded-Encrypted: i=1; AJvYcCWU03/JHLWdUj/cH0DRACOHpHuAPaAewn1LNf2ByvwVc36q2EKiWMK/JzvcmFZNQQgHKos=@lists.linux.dev
X-Gm-Message-State: AOJu0YxsvuFk6c9nPq4xY61bviqU4oy7wMCuy3XK9RzRoJjSk49fUo0o
	DVcLGxJOzsIIBRF0Oqx5g5Y0H0d8O+BAoTrpl5EftiJ/oQK5O2sdBp1MbyitXmiUX9SFRJj7Sot
	HjEU1PuwUZBJE4NERZ3vzm2wFrtxtHSbV8ODi/uqVb1t5/BA4JDpm3oE=
X-Gm-Gg: AeBDiesFZ7NlnTuvQeFTyB1yQoITi7bqzv+h0i54ebkCBZopPFKl+ernp0pyzmkBI/A
	oAcqy+muSWFjCutykQ3pD099E3y2P48ZSK+Rewwbcl3Me3tbowh6KWdfZaNRXqxO9qRHDzQUnny
	9xWIvLLufWxqCBnvpCGJ6R/4lQ6IWNhKU5943GtHXMhkj98zm8SCbJ/bnm5/6HU1nm58p2z54jx
	DKU2joVaKVIcYAZYL/Qwslw3qBlT8mkXVdh9tJHMewC5RKCxsJLwfOKzOISDdtRXjBtuXg+RiCQ
	EODixjgOCPqxQMvu4Jfylomq9SF0eVLUCAAWkP95hHsdBQywUb8A7FoJrUGkLvq73A6hNxDap5J
	7e8vkearjIANFvO67tA2pWJDWJJKieunN++gH
X-Received: by 2002:a05:622a:5593:b0:509:25ab:f545 with SMTP id d75a77b69052e-50d62614e3bmr170907211cf.11.1775457499448;
        Sun, 05 Apr 2026 23:38:19 -0700 (PDT)
X-Received: by 2002:a05:622a:5593:b0:509:25ab:f545 with SMTP id d75a77b69052e-50d62614e3bmr170906911cf.11.1775457498777;
        Sun, 05 Apr 2026 23:38:18 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4e52a0sm36724509f8f.30.2026.04.05.23.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Apr 2026 23:38:17 -0700 (PDT)
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
Subject: [PATCH 1/3] arm64: dts: imx8mn-vhip4-evalboard-v1: Correct interrupt flags
Date: Mon,  6 Apr 2026 08:38:11 +0200
Message-ID: <20260406063810.25531-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1314; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=t3X4myeEM2pMRgsbKfWAsvjQVVUHcbGX2tomwiNFOsI=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp01TSBAM+SreyDUs2Xv30dWAqtMC1N5TYX8UsP
 HrA+orZi52JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadNU0gAKCRDBN2bmhouD
 104YD/90K5P95Kv86zN8mLXa7j9vmSSYq1vdZk5QfNkapBUNfKP7JvkxVxQFdritonwYjIxtsQ0
 VDgiWp4QCg5/zfGdCV/S+Lpd7a/kmLxPgdB2S91eFIFppk+/17LY11cmwo7KDmlY6k1GsBZxiC1
 JOvGY6WbyNmip+h9260++UU7O5f9V/vzqau7z/VLCECssYL4SOj06Xp5nAdcxhrc5URU3636Bea
 pfb2uIGRbxjOHmhozsv6tFEhi6UJfLFtT/xhR06F3spI5X41QK8LJvERGX4VvbUnfXgy5o5X/I+
 3mUVvRksKrRskPH2Ig4MvUG7fUc55AzA+SX/iLyD+8GZCUjt76js+5jD76fEKokHK8dqhV+dlob
 Pvyyl/52IvnEE3E7E+BridW2qVx4bEsM64VzL4OBRophBsZODg2Iu061ddKcNSSgYm3+34jLqxD
 NMRb+6eIJ15ifG4pl1NWfUj/FLBa8E+Ujer4GZXyMAAl+khiRlrc9QDsxtxe206+E/4CJ4phsmj
 VYX7pHvLBfVM62/3HZbEuSV9pPnf+w1GuGcJ3Ol6LXuhyECJv6IAvwAUdoxSGC/mgMiVkljXAFp
 I6LkdFZCmVJmnWbSAG/BRMSLAMR9TV0m9+DtTVN1VppQkc5PCcXfr41XyrCATKJoxPKxZ8tiuvN 5sxD3zvnwyZtqtg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA2MDA2MCBTYWx0ZWRfX6x8nYz9o4yK6
 oOVCKh9e7C5GNUjmqbHOmZZyevn8y2T8hcQN35VtADwKMA4qi3CSCIj+kgeJMsWJb7XuovU3ZEk
 maaQFiWSJ85ZZgsmEmEu0rTRc8hD5F9Bi63Lg+WTFVzEEcEAsQPBbAwYdoPBEKA3jh9doYA2ZA2
 HtSUlT6otiIYC4XRciCixodd+r0TwHJPmBRsm7YnpHsvJcoBxHTNabKT9lRll80zHtEDZF7g2xp
 0+6q6SEfwMzA4Hs3wABtoExaYw+5aMJMINzF4JQR6vJroX5tquJPBJJNQkVYsPZJvNQ8/D6Lw7h
 RkCcNLXUTZ4QWBWBtejGx6C0Qy0S3ThLYRLYeuNSxil9odxrZClz7eQBr+tFRVFpRGbE0xwDJh/
 KngtZQIUs1JrSXfBoRffvVCoXb8Sve1SVu6jp0rcbuQGVyY0HLnSAC06cImsrZoUIX1CkXlFXP/
 BPmpIB591vntJeDEq0w==
X-Proofpoint-GUID: EF7foYzV91oBObqPapU5PjKkdXRcdrxI
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d354dc cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=LaLCeD5El4-HEmIGaUsA:9 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: EF7foYzV91oBObqPapU5PjKkdXRcdrxI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-06_01,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
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

Fixes: 5eb7405db99b ("arm64: dts: imx8mn: Add ifm VHIP4 EvalBoard v1 and v2")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

I fixed this upstream some years ago, but people still send copy-pastes
of downstream code.
---
 arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
index 5f37065bf43f..a8f7c226a61f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-vhip4-evalboard-v1.dts
@@ -112,7 +112,7 @@ &i2c3 {
 
 &ifm_pmic {
 	interrupt-parent = <&gpio2>;
-	interrupts = <0 GPIO_ACTIVE_LOW>;
+	interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
 };
 
 &iomuxc {
-- 
2.51.0

