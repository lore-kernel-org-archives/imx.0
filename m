Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897D1303C8A
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 08:23:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771230219; cv=none; b=Hj7k5j2sGxeRDU09sDpGvz3bJUdMzwG6YhIHppnPLhlKK+GHNO7/SSV5DCeFsBWl2yig2a0Kz2KMBnOoP1IEjd1+lKQeHSWEMMLO7Xit8o/L1bfBJVQp3XdneUqIFpwOaBdy7KAiTAoM3zRVDbLBw5I3xmZv63O9hTtDwvinoN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771230219; c=relaxed/simple;
	bh=sFAr2t+BvnqFlwrW1ysGHeXPiGH3mfxxZ+VgNKOcNCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TwrCYmUXzHhaG7P6owZW/fGFgoshdQSiqG/xxffWz3n1m/CEzDEIcckklJYV2nUvaQIWOeIy7GyNP9dK856uZ4BZZCAPcE0cXnjmIL1hHHFPEdjUhSreV6Zt8B3u6dm8cvT3w/geLXa7Tyre+tCHScuNQCjm/CPnuGRqsFsnFcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iyx/tN1a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eZN6i1/V; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iyx/tN1a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eZN6i1/V"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61G2H4DJ3897339
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 08:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1
	R0GXD3GM=; b=iyx/tN1aasJqaZGYZPuLefbZVo7i+OtYBnolNO0gKtexeEcH1H4
	PRTekwxgJcs5MVE9SfvWD/l6h2O3LaKTbxS0247H8IQfOLOvlg38XhwsGpHubqwU
	P60yRcA3At+TLvrTFqE6uZxAIWE9Mv8eQfnI2KUhOD8cVhvMKrTfMCUAHjz6egYx
	7JXS/A6/0o2XJ5TkhZTO0LcDcIE9FFLA3IVuxZVfS5kP/okO/NIWjw84p/2G3tAv
	Bl+QrGf95sVjCj42/U2wFlWmgnlfuPS/cpzsFverk2SK2GYceGxckMvW6FA2s+F8
	g0tTxwPYMZjUMHNty95LTqI787IClNg62wA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4caj7jbq93-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 16 Feb 2026 08:23:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c881d0c617so1742322285a.1
        for <imx@lists.linux.dev>; Mon, 16 Feb 2026 00:23:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771230217; x=1771835017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1R0GXD3GM=;
        b=eZN6i1/VF6+Wkv0F8Vwfa3hAIb/Gd+oCbD/nw/gM/FUptuxvdB7rzia7TTHpnRSFg3
         TJqMHUEYx0z1CHYkCNZUHjnXUOfdpqxPIOmmIlHUir9VFvH/WwmzAEUwihKc/XhnzD2b
         DPyUQrw3fwx1NV2Gj2DKRm433ZJMQ2mTA8mwh+tXr2/r6OBoEMmHMjqA8Jcd+J5kS+Dk
         HBhvjla/novEpf95qr11FKU87pzcqwKj3JFY47gX3e8hImO6mHtnhWhmuYzXwbbPrHzR
         CodYcPc4SWIJGboWkw4O0N6/s4+4lS0Qme29bpPYaowqlT2hAwhJGeby0Un0CVW4xkVh
         RxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771230217; x=1771835017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rMVTVE6mXm25OeX+iOc5e0I0EziX9QVV9q1R0GXD3GM=;
        b=WHHvJ6L3C+8dldE9kerPhfgpFuLuRwMa21jAOQyfeSQaW3NtIhy+yRWzlcLvIbDx/e
         jHbxpHUlLdYD11JnaUAOJCZ6lAXRJp6W5jg8e31KP6Yff51/eSL3KGXMBI89SKMLX2fK
         Igf4vJ/ixc0+9t+yJaO9SqqeV1C11jnnu2CGMcye3w3mgdXOCUV3HLYoCsGTI/j0h+rc
         5XKfv1/4e1cPTZjwngx/5zGA3BYKLpwXDYrcTNaaBF69eWC6O96UqSKL/cBhIucu3w/q
         G9zlFG3Xbp0dGAsnosjF5/M7Yxcls1amIVjDE5FE0oD+E7ukBreZFUP7wHHvvaaGA+qU
         shzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzZIrnz4HW/Fe8sEZmP42+93H1aYjlBZmmT8JbHbgKeeZlTF9CuAQyuiaip080kHXpkSU=@lists.linux.dev
X-Gm-Message-State: AOJu0YwIYdPfrvj+g+nOF4zxwlFVj76YId3mimmbY4E9PbtH42bkeV3f
	jchfh+xqsF5dBV1V0DWDfMHXClrQIBYg8P9Pep6vZ59i9vd+TXo+Vf9ywad1XIprZqleb4Z25u4
	XbCr1BgniN5otEYGPPc/94jsTqh0BX3g71+bBEar8MVF+4EtSzQRMdzQ=
X-Gm-Gg: AZuq6aIBSCjRkXSx6k4u8s66JbI3/W13B7N2sLgcwp0AbxEreQzlMxzV2HMAp5Lp6WT
	0fKw0S1D5gqbcdOCpXw87RidaRInhjLA2kGYgwn0LFfgFl2WKqzF7XKtXdAvilZtRH225gf9F/a
	qtKkFFTkIatLmf1bylxAx4H5ZJ7X85903lqGtxlt8+0qRRIOSicYuISTPhmGSDemQsC8WlESyzE
	4hKxjrb43rVPdVKHHScO0UkacVlqg50vuILcwF+mirlJGpBhsbP59Y8xXIeWcguKgUgOypPEqzV
	6ERCILOdROXXJ6p4TUwKxn7NHEZAZx/2XcE1/OtQZPoDfRGxEGiPMjRL24wPvofD0fX5gHOdRUQ
	TOm5Tx8OnsbFoBAA7vu+K4d5Kx4mLTMee/2CbRg==
X-Received: by 2002:a05:620a:4448:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb4c039214mr846298385a.77.1771230216931;
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
X-Received: by 2002:a05:620a:4448:b0:8b2:e8a0:f4e with SMTP id af79cd13be357-8cb4c039214mr846296885a.77.1771230216530;
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
Received: from quoll ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48370ac3564sm218760205e9.5.2026.02.16.00.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 00:23:36 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] firmware: imx: sm-misc: Make scmi_imx_misc_ctrl_nb variable static
Date: Mon, 16 Feb 2026 09:23:30 +0100
Message-ID: <20260216082329.32029-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=881; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=sFAr2t+BvnqFlwrW1ysGHeXPiGH3mfxxZ+VgNKOcNCY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpktQCAupsWXrW1bsfGu0/qby30s34FN1H2791f
 KK8/j8IKGeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZLUAgAKCRDBN2bmhouD
 18VvD/45qfZfCuBtVGeMp57N6vu1v5hp/gwgOWuzIwqLz70+h9S78rCOt9fvWJcwYxDyhsQ+t6P
 56waeLYDE7JIskiHEurE+9Gnyk7IQiDEosEaK38E6nvq63wcxiqNfUGdxjohoUf4w1XB4IbxI6b
 8ZE0AYXMGMgJsFkSQBWbsRGSoPRas7L5PDwXu4iv94jcw/+JqQ5SRwrMRednN1cyvTmBHpILMuk
 mJbsfKSJKdnf13Ch/5nyRfWJt7GGLSoDUdQoY34QccZbJnl8CnjFs/phkD6E8C1HEyewT+yyQNh
 hUOYumIBEItdCE5i7frpfHF+bSfiLfVWkGBrc+fWKAp0IemL9xBu2wEcZZK6w+k9tXb3k4dCZVn
 VcOZoWR92wzly6Db4VlDZpBORcHi3QpGjnYYo1/R9YHaPubJRBVI1U+bPBv5Q3CxxAMNoFzS00v
 TSvRjoX/X40gVhzvucRpKGgTLl9Z+4XEeuBCQ+DJ2Ec+2CTKGlzvHEpQPQQHE3hY4hU487436HP
 /OBg28lzzr5mwWwSExlVa2TB38Zy3Kc5fC4FimaIi3o3pqEnScIhKM4z+qKx2yf72gI5zZw49zO
 VbusvV4KUQTxKkMRtqG7pOeVmgUvk1rpXOZ/llREjp6RxVNJAB6CNYmQ7SF+DtUVo91/Gm1JU9Q IULPE4GaGIXa5ag==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dIurWeZb c=1 sm=1 tr=0 ts=6992d40a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=lLDweYiKzoSJucHH224A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE2MDA2OSBTYWx0ZWRfX5LTzX4eiNBzJ
 B+6luzBdGC9BQrjyhEXF/aMk8iSQCsqSSw9qZVFk7beyUv6+3FFbB2DfM0j6w/po0WtN/DB4jw/
 wll4ZCF+O+ylR0LbTqaqnIFmrR5MtqcSSU3aabUQjZ1V2G033mvkxgamu+ETBewwMUg2/jSDkoj
 dkAbBjz/rjejKHH1HdC58KPhg3JrfX2ZvZEsOlwDJ8xlwAgD6pA1pYLlZA/mQNe3+Ko9Daed8o2
 02InIWrpNo9rjPc2DqZjJ/Fv71Lk24H8zXpSMhIbPjt2pnSJjYUSxLjEhNIjCZb/UwuN7vX74Bo
 IfcECL74ABsH69i4vT6FVtd0Y11xr6nXVc8lGNn7rIOo6oPughHGHtWVw/tzd3ATei4uImm6Y2u
 imMX44vQY703Rsm7hmVTfnc9fDhHrwzRHxOWUDcxvfxA9WKQzyfCFLz2hcj0a81i1qaE97Ph+K8
 a5CROenyqm1xiJy23Bg==
X-Proofpoint-GUID: j5pJZxQy--W0k1YrBusDRKZEPAP4iKpF
X-Proofpoint-ORIG-GUID: j5pJZxQy--W0k1YrBusDRKZEPAP4iKpF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_03,2026-02-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 malwarescore=0
 phishscore=0 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602160069

File-scope 'scmi_imx_misc_ctrl_nb' is not used outside of this unit, so
make it static to silence sparse warning:

  sm-misc.c:19:23: warning: symbol 'scmi_imx_misc_ctrl_nb' was not declared. Should it be static?

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/firmware/imx/sm-misc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/imx/sm-misc.c b/drivers/firmware/imx/sm-misc.c
index 0a8ada329c9d..8d95a901734a 100644
--- a/drivers/firmware/imx/sm-misc.c
+++ b/drivers/firmware/imx/sm-misc.c
@@ -16,7 +16,7 @@
 
 static const struct scmi_imx_misc_proto_ops *imx_misc_ctrl_ops;
 static struct scmi_protocol_handle *ph;
-struct notifier_block scmi_imx_misc_ctrl_nb;
+static struct notifier_block scmi_imx_misc_ctrl_nb;
 
 int scmi_imx_misc_ctrl_set(u32 id, u32 val)
 {
-- 
2.51.0

