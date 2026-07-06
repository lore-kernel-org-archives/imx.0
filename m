Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AABA6367F31
	for <imx@lists.linux.dev>; Mon,  6 Jul 2026 10:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783333122; cv=none; b=YHbvyLoN7mq7RQnnpEYlaXtoavKgXesqjP+RWHSmzvgW2fcm3eMTtKkgQdOmzoafJ5zhL//d8Pd9nmecAA251EtjmGfeE/EJj+PxfPlXNX1TQvQbKR0k6QTbd+y3S8RRM5sKPl0N2q4ludaaoGr3oNcQfN2xXzm+vkt30kyh2hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783333122; c=relaxed/simple;
	bh=HkD08gDczvf+no+NYEocgk7WQMaRPmHKbsABTJviDgY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qk++8n36PjsGW7m/gfA4qfV0c54c7atXHRMkEKas9ktqAvwkxi72wniXt5heztnHjHAb4ZdlnqWzOU4MqH/BRXn6eKUx9DHV4km+MmeHMA5oAIki6CTld1y7In0ylWKzidxsRgGiEYoKC6vgnWvSQLr+4W6Ow0EO5AbM19AY+fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HaBeTuGn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NKZ+WM++; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HaBeTuGn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NKZ+WM++"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66693sej107432
	for <imx@lists.linux.dev>; Mon, 6 Jul 2026 10:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pg
	d9R33Ma4=; b=HaBeTuGnCY1aCwaAngzrrj6akDUHI7RDfXUgIo+Ygu+Vs02MZdj
	JYSbxv3RoWGBjy+ye68QxKvuvo8XsTttFwaOPM5GYVfttnt3T69oyZZE/LcM2fMO
	6/iG35eMA3ZsQgV3JAs5UQM1Fl7p7FBCmtURTTYCtZjpkqodccGJP4uB/njoPMwv
	WqNO6YN+NrPenzasLLz8xrQbWGAFxBPaGqt+uKE3tkWhX8JvI1yZtNdeU7g83BUB
	Hr3BMGP+vMvT6L7OvwKf3RepfuKCB+mSZw0CfY1vSlscG003lHUZCnEA5sRmxnOY
	f9GGW96Xt39MjdAm0VnU/eYHiO+G9OwstmA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f891urcjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 06 Jul 2026 10:18:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e68cb7a3eso531165685a.2
        for <imx@lists.linux.dev>; Mon, 06 Jul 2026 03:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783333120; x=1783937920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=NKZ+WM++ZyGZXNA0YVYNRaf6Tjlm3CFCvZyfYPisBok5hK5JdxzUbtDR0ZfV/bkVGj
         bSEvsVsAnqvbPsAPw5VgSktz7vLUSMf9fHmNRPXDSd0JL9aJtz5jxfzewm9dQIPyLhwn
         HdC9RgldHtPWwlS6PWLPlMtQccrnslin3GVkL4EPQyFgTaqRvZ+GceYRnhYDaGJvtgB9
         oowtgW9kbqgLZwbrq7RFUaLEYA0cfsJuO6NJAUANYvGrl2dmCNdCJp5LD0r6TbcA5LtT
         wOqXxIIWPTg7121yPcIvOz0WkB7KaUtwd8P/dHurAYCoXcI96mrCMhU6aYcYGdkTx6s7
         rhQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783333120; x=1783937920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BbIdL/ut92N7LLclhFSaQsYrh/P86U+H6Pgd9R33Ma4=;
        b=e7O9izclCm7fZos2m73Wcv4u9DEhka7du0FUJIXkzz3OcOZoIlnhvbakvg3i2BnwHo
         wc79Phcih5AwgoUddRel6T4ocuEWSgKNuboWEPYyGWCqSNHxH3Dk1loC3KyIpo7coiZb
         Ow1jY5TmFHikl65+fllpbSAiqtXK3eyxIe+/dhCY6ob3jvx3Zs+PoQXt2jyaheGl8907
         iVT4Th7lnbVQ/+BkN9IEnYZrwWE8tvOHjqKJspjEGIt2GDW5RHi3OzAKPMkpAt/RXM61
         LF9KMues2gKTqLKRCtNpCYOkZ5K0Ou3KKA+lGf01aa1hpovhNltmP6UT1NKN0AKa9SZM
         nWjA==
X-Forwarded-Encrypted: i=1; AHgh+RohI5+FYvggNg8UaGLIGlmpOCNHqNCR24hc4f3fhDDKnQ+nBueGW+6A4O7RrIfiSZz7saw=@lists.linux.dev
X-Gm-Message-State: AOJu0YzRmLX6Y2A/g0aY9zzOeltiqmcByPzlJ3w4VWjYrRQKMvgZtmB7
	8HUqevFULWex6jZai4gXyT6PeWYxVP7K6VowTn4aFDXnsQnFbDscfZ48kcp1Js9uhPNY8JZfG30
	Q5MI274Yk5ZFmTw1FooJc+d51Ajc9FVFzv/t4eMGn4YFBiCzs9XwCV5M=
X-Gm-Gg: AfdE7cmO0HJWTOWIACF21YrPmrvNIvejqWrBcWi72NQmZpr94mtuEdGV/+GLaYN2YKi
	k8+W5sFOD8qjOKJrojVmc/z7+BuyGI2wdX4g+Ekma9nQjafp5B/Rl51F3zsE/Bt2u5Zn+8ejq6C
	Ap2l+HHTcsT6aZRmSsBRULB+tEmB56px/YWyvzZ08PT+t83smbcYOuZgYFA/bfaGk4lPF5RJWqd
	/ZrxDJeN4mdL2EqkrudK2EH+oRTqZVvQkV1MtK4MlQ9uHDGf0tpSsGKFYfOSon2p4HnZScNdeJk
	BpLLjmttgaxzZiGuCiiZr/MPtGSNmD2Ph5r4g5CYeEKpwcEII/On22XwWO1mbkBsbZH4xbXR9GP
	Lcf8eOfFu+SBKDNgLO1K1nvbIWdo=
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265454785a.1.1783333119984;
        Mon, 06 Jul 2026 03:18:39 -0700 (PDT)
X-Received: by 2002:a05:620a:2990:b0:925:4309:dd18 with SMTP id af79cd13be357-92e9a2f7607mr1265450785a.1.1783333119500;
        Mon, 06 Jul 2026 03:18:39 -0700 (PDT)
Received: from quoll ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493cce0a7cfsm270839395e9.9.2026.07.06.03.18.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 03:18:38 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] ARM: dts: nxp: ls: Correct indentation
Date: Mon,  6 Jul 2026 12:18:35 +0200
Message-ID: <20260706101834.341292-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=753; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=HkD08gDczvf+no+NYEocgk7WQMaRPmHKbsABTJviDgY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqS4D6ulvmFdrQv8Oykl6GSSQk/2Yx5hWH/zH3X
 bJM2t/wZ4SJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCakuA+gAKCRDBN2bmhouD
 12FvD/9FG/s0ZGefd2tEFba6XCFX5ChHG5e7CwFpttWWJ5kNGHtxLBn0ZdhaLWSeg0Atp+wxqPa
 2M0nBhnLP4me8NGyH1lt1U9Yu89XOcAT8aeTCj95zzhkBsFPzYkngxPGq+hSux5B5tVg+FwNvUl
 5H0jBCwVz/nJdRzc1vJr+TBqL14nKWx8yXR4JmWdf3hAjCAIaNY509WlSZ0EuqUWF1oUyWGGsMu
 PNHGhdBki49x2TVVwQzB6K6AW68NBWWnaKcdiZ1UJ17CNxirXbg1Dk0G2nVv3rqPTnFtAo/jWUZ
 LFCkQwZXcR5EyvPorgoalP52w3h0EwqxVh6qEHAj6scDMkzuaYIou3gehBMBVzFGEq+PrCcbBLL
 gZnAOIs/aRifecbuifzUTbzPsBt2rS4qZukz54TGyCFojhKzsWr7Vz+4jVztGyqCrPc9WUOcziw
 g0w2uj1GQcOaMuCO49ngGsf+utm+U7rnps+Nl3V19KhX1EHtCukJ1eN1k4TA5gihM7p/jXXpOoG
 CTYbIVx1SgQBPgb6yjUql17jzC2MtLIT5O1IibjbJwyfz1v2CaDj3p34RCnVLW9T1QROKB1YqvJ
 v7lUPsH5QRaZyhJCI40mHLSxLM9JEGvd+YcKOvvxCmJdcMmbdkWzWr9kOaqFHwbrIXsDm0riXI2 3ATQjFiBCXwB3yQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: RMIkjHsNv-FM8qpYIU4NxGaDSpAz_b5G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfXzxRP5aeUD9/V
 Ob4wB1PzvItFvs71BKFW/weZ+XKrwoxXJpbe3+yBerI6F2lkzm09VLK8Otcv7zwmg7tdwozOl3Q
 XoqiiueRzc142LB+zKdcELr3gcjGbCc=
X-Authority-Analysis: v=2.4 cv=Mo1iLWae c=1 sm=1 tr=0 ts=6a4b8101 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=tLFoKwMCRvoQtr3NvW8A:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEwNCBTYWx0ZWRfX3QYqfAO3w9A+
 SyjNLe5PGCPM3me+aIfRmZfrGgwJWayCvi9IOa3m/lCU/YdWeVEP6D9rQJQMfAta+i1c2ao74P/
 /UsT6lZQ/2jpJQQqbN1LfkoHPM1ZJOo5CcI3Vv94Wliigb+1be48xR9JJ7W+I/2q3+inH2PeslF
 J6DSuk0OCj+EoDKgJTt/S92KG4UpjRskw0I6nyH+kyc5xgyh/sXrE4n1EiB+PeE1YL7/IT9wBZP
 nEAptcopbj/4igHuttSIze1orYqVVuOT9rWVDUxh5lCNZEcbTIb0cZbtkBQavqfOxoFpi4xMC+h
 yymvxRWAJQAT9wr9hUvwuFjgCPW9xAFBTxHwLkyx3jZIHDdSa2Qu+PRMJFgUlw/8uVufZFkPgZ7
 ymchMq/RGTokzEOjneoV6hkz8djNGiLf4LEZ5GqgFvf/5QkCk8sI1FHatO1+fgxTP9QSnYnWGS3
 vo73Un1umYSFZ2GqjTA==
X-Proofpoint-ORIG-GUID: RMIkjHsNv-FM8qpYIU4NxGaDSpAz_b5G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060104

Correct spaces or mix of tabs+spaces into proper tab-indented lines.
No functional impact (same DTB).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Ongoing bigger work for all bindings and DTS with built-in checker (dt-check-style).
---
 arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
index 38281b904301..7341945de3ce 100644
--- a/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
+++ b/arch/arm/boot/dts/nxp/ls/ls1021a-twr.dts
@@ -190,7 +190,7 @@ tbi1: tbi-phy@1f {
 };
 
 &esdhc {
-        status = "okay";
+	status = "okay";
 };
 
 &qspi {
-- 
2.53.0

