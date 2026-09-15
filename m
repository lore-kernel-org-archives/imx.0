Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF7745D91C
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789456997; cv=none; b=RAg+de1IHNIPtrzHVEnepAS0F7aVEX0/w6wPhxEK1zHh61fqdg3UVmIqPdOH2N0O3rHtFEieJnDeO2nwLGKb14ZILNrmpKJdS0q8MAZeCheJz6imQGLyaXTSnYhfxayKZ4DSTGiQtsjaRGnGWFD3wGB9Mlt1K8PRSSZ+KVYWqRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789456997; c=relaxed/simple;
	bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CviPcUPc/gpaZ+UmUtzBEsUpbLEBqYNz4kf6nTigZ3W5ZySE4hWlFKZlMJ17a9mZMAGJxyNQaIob5BtyWiafiyxhLVgZcTRq2I4PpODrtx5wVWb0Z9sh9GQGc/B+5UQJx/T8prW5jamDoYjDYEnMsdnXPbIycP70Xsdksn4ns/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GBvNlURH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QFjkjBqZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GBvNlURH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QFjkjBqZ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F6Z8aa2415185
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 07:23:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJF
	plso21Xs=; b=GBvNlURHys0JKR9lSkOpSc3CedUF3nzxz0c/Qr9yV/tXmwRWGEf
	OK+FnCXK70zkftAUk8mV+CCt4NM0LhRTd5dRxB158Cb+/jBKJpDf5hGSj1ByOm1p
	J73U7C+XY/Hs0gFfiVuvi+uEO1HMGIQG5BHWpd2qPQQcaT21Js8z7TKbumjIrKSW
	J9Hi7FibSnJAr3DcJsNvpeqzxMzgM95S0ACpwvoeRnczC12Rf2zBNUqX/vfyfrSQ
	EJ7SBWd0GTMcFDX/FnUUmiCgAq9tFXT0yPpYWkDFCV5UmKPzHpKy7eFRaM6ToHDb
	eEnPFJm9fHn/Is70FfvP/q42n/I1OSm+VDw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpxyd8mvg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 15 Sep 2026 07:23:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-936e393061dso670530585a.2
        for <imx@lists.linux.dev>; Tue, 15 Sep 2026 00:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789456993; x=1790061793; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=QFjkjBqZaKxBDHOnGWPxu1QSEGL78Mj4Mab7cVYDOENZw9QJsuxJoXNeFZlJ3BUaog
         8SMNyeUsUUEDIc3mAF2qre2rcMJhvwWjQnnf6RrNOwTSSX83bVsdqmo+2vNYndPpFdLc
         XJcnCP27+cMGluKwXgt2EZ1WDFF12B2dgw2PBeK8hpBtJRcf+zTFhQtnt7pSU1xz+8XR
         sZY1MwkEZnEj8D4Y2y9d6YhauW44aIzeCmcEP1g2km79MiiqSoxqZ/yK/konX5pycvsl
         IvQfIA/EeJdTON9N1EY6FNrMXPJ5Ko9JMnblSM4e1uF/oDbcQ74hOMNVvITX8wl7BW1F
         2Mtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789456993; x=1790061793;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ATNw/rTlAf7RUOzSgyQZetgiqkf6IsOoJFplso21Xs=;
        b=xJ5hv508JClPhIdDhfxumQZJKvc2S77J2IWefpKtXCDPL29pJBIUItqCeH1xbBJi/l
         qkBPXwhMR6J9/wL5FVmFIVKBBaDM5zerbv2wpqr8A4w/OgCUG9mkbe1OjHZLBo6hMSVq
         i6R56kBvTiXbdQl90B8XN/Hw2lraqhAJg3tWIMgKAU4PnQ0Qi3NTtikpqBtoXHHaZazt
         1EDv70ifXTbZKclfhx30BCTJ6j6akxL3Tsp9j2Piahy4KWh452oZ6QTMGHpF0W59I92S
         8t3Ve/C+GX/6jW6djqmNBH/OMREDZQ4YU0v3pb7bL1Fm9PCO0LEwvIF+cMRy9AE6C0Mx
         lMlw==
X-Forwarded-Encrypted: i=1; AKwUvBymrNunYux9AzquXojDHezSrEhk+6R77EZELcwRDz0E9TUdYCC7KhXaDbNlTqVsSyCL7fM=@lists.linux.dev
X-Gm-Message-State: AFuF++lHMt0GAZjU3KrS3QeL1Thau2rvsTiF5qnDLN0IlCasnkhaGXev
	wPSJ85QvEFebgP7WJcpNZlZhn8SIH8PHPcTt5SoW660Bn8D1ChahhlXgBd9S1vC5hUqbLaBEGfx
	fYBjtgHYnfuyzdjgklYNujpP/eBkTqPiJuAEgQV7U2uNSp7q5icHbOm0=
X-Gm-Gg: AYBFou2rrgq90sGoGedqPlLozwXR7nQLfXTMWnE9QHpAT+XFF6klZOA8V2Heg2l8eP4
	0apJdgOq+hiza4x0CHAgoKkvpLmrJCXaaOfWfAhH/afm3eszgQ9CaWE3mpvJZHMhbBDpHWPoK7j
	wg+t9DzH6U0YMNTITD8lLb1S97i8hcJ7ld3vjqhZsjoAgnPSYcScjxa81sFxHoJk8oT2MeLpSgr
	zdrys5ObnESj5SIkUomqljdYfNdySI8K+U4JJ7HA893ciGjAoTjDRyRPs+3IbR0zIEFCHXcW+Ov
	JYQxYDdm0ctac1uMcozzXAYK4MgAVaLLOVYHSS/BWFvFFVMQR5U/5QyDbVbiKfgkCn8bSnkbvnk
	noV4ef2EPmaOvIoQ=
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869987185a.9.1789456993465;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
X-Received: by 2002:a05:620a:2548:b0:939:78ab:3c5f with SMTP id af79cd13be357-93a297c8d1cmr869984785a.9.1789456993090;
        Tue, 15 Sep 2026 00:23:13 -0700 (PDT)
Received: from quoll ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7ef2e117sm43920095e9.1.2026.09.15.00.23.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 00:23:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org,
        imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: imx95: Drop unsupported opp-hz-real in OPP tables
Date: Tue, 15 Sep 2026 09:23:09 +0200
Message-ID: <20260915072308.64047-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1987; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=1CwEh8Q/rE1NnBMoNQNfgUNpKNcbygdha/9UWzt5FEA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqqPJcJRY2BJd+T88jYlFk1GheN4sqq8i4Wa973
 jvqfy7SQ0qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaqjyXAAKCRDBN2bmhouD
 104gD/wNqgSpuFjJGccDgJI+wE97JAS7/eb4tNGBVw27ynWMA5AqDYYnvK5X3/F0roozimR8qs8
 hDvcWCNNqHU4PBXYCOoZ5jQwYNgxs9wv//rwxKzJ5N0AfAEXebev57u30T5bc8JK5KpYeQU6RII
 RFDIPpsdytPmUNKkZ4n5llMHmoPJlasIGEzldd/SJkwV9vB35E/gIPLXlFyJtcow0uh/eB+BnY3
 bJSs8g5xZcwsRfAnwlv829d5OjgV5FvQuXUsLAuHyo0athGI64upCpApkhDeAKeap54Aot40cIR
 yfRcXxCz23sw4rw5OTQHvP4TfU9r9m/dSIPvir3kLQ5uYqJxeVnRubV7iaxukhTATBafHTZAI8O
 iAWLQinDVXqRnIm4lEDubTnN04cHVaXqmtUfdqHXm6m3v45rOwQkjB7LRRwybInr7LoqXvt2bhV
 Hf0SLRU1rHcx+lGbNCo6SKD+N0oyKqIv0jprhs0Gtxs9hPTfina9cD5+10Pnqh2Yw7g0nK9DyqY
 BBDuOUrfd/4FdUjjlPb979qdlPRLjXqlwI45/pjwvvt/8pe0P9957yxMk5ljlpzClRua4ILx08F
 5PtakefXHXbQBBpRwKLD4bguq5rEnqRW3djJQAkzymjQIQwGHO3k/IVsJ8XE0cwM1pqvufUd4Pj U3wEzs/QFSi4K0g==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfXxZ/z2q8L44Nb
 obeObqbv9pHnj/+SZbqtk+GkPkOhza5iqDPV8xR0jU7EfEBqx8F24m/u+HrgBgRVeyJvGxPB3nk
 7Tc/tbSa3tkgSIQwnLqvnQzVPfI54/Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDEwNCBTYWx0ZWRfX2qCd6ICjKAFE
 26WM7Czt+f5t9b45NU2Ew1sOexvpUMzRu8vipMs2jyGSSWiDIJcRRyTZswP8jcpcTDqX47JXsNn
 9flD01TDirb3a5Husn6ZWVma/eOhJxG2l5Y7XXf7vjYht2SubZV+BrjIqI38jNx2IaQXsz2B99v
 wi5vE0FfPtI5Y573H2IeqX0/qSJBW0aNva/QIUpEN1zgkxtzxhrKhnY4RfUMEbgoiXx7w1FzwYX
 ifbJcM+1hZIX83RkrVgEAxqeWTamlW/hxriOlM4/rSSZpjbcp1jpkb49LrJf2pyqTZ+R+JxtFZ/
 RH/ZUJkqHOjs96xaIhioZ0hiO0j4SUGc+nCPmgvM6n8oq1PLPS9jMMpEXjed/W8F6+OGbvrv9lK
 IQq1nHPqwyc6eGszxmUu1IGE4S7wTl+QPtUaVwSiDFUGYzIwCO7oSbkFHA4yByrDWQHzXafSaNr
 7zx4451oPqOJXS0PVzw==
X-Proofpoint-ORIG-GUID: eM7di08HLMBoc6KtM8gEMWELpg4Rk5Jv
X-Authority-Analysis: v=2.4 cv=LYepeTfi c=1 sm=1 tr=0 ts=6aa8f262 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=LIxWyly_AihzR3FwyFQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: eM7di08HLMBoc6KtM8gEMWELpg4Rk5Jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_02,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609150104

There is no "opp-hz-real" property at all defined in the bindings and
new DTS is not allowed to bring undocumented properties.  Fix dtbs_check
warnings like:

  imx95-15x15-evk-pcie0-ep.dtb: opp-500000000: opp-hz-real: b'\x00\x00\x00\x00\x1d\xcde\x00' is not of type 'object', 'integer', 'array', 'boolean', 'null'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx95.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx952.dtsi | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 1cb8eb15e5c7..99c72d5cd125 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -255,19 +255,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
diff --git a/arch/arm64/boot/dts/freescale/imx952.dtsi b/arch/arm64/boot/dts/freescale/imx952.dtsi
index 887abb1c4784..306239de096e 100644
--- a/arch/arm64/boot/dts/freescale/imx952.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx952.dtsi
@@ -323,19 +323,16 @@ gpu_opp_table: opp-table {
 
 		opp-500000000 {
 			opp-hz = /bits/ 64 <500000000>;
-			opp-hz-real = /bits/ 64 <500000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-800000000 {
 			opp-hz = /bits/ 64 <800000000>;
-			opp-hz-real = /bits/ 64 <800000000>;
 			opp-microvolt = <920000>;
 		};
 
 		opp-1000000000 {
 			opp-hz = /bits/ 64 <1000000000>;
-			opp-hz-real = /bits/ 64 <1000000000>;
 			opp-microvolt = <920000>;
 		};
 	};
-- 
2.53.0

