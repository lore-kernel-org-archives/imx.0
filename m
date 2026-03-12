Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2993FFAA0
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773341034; cv=none; b=RldxVIs7hHzkveDc3bqVdy2HMy9KS/Ptp8De4om9J+ri5Rd9v6QGDwKQkc9Eytng42ViAH8EidSY2/AGTpfNgy9KGfrkQZdI4YLXRmO8QK5bLuUkGzWyu9Od9T0JbWBbRZCzSoaXiZgCr/4q5G1HP1wE4zvkuo05MioBESRiKnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773341034; c=relaxed/simple;
	bh=0tXOIBZpahIMNyxmlfBim1P4ONHHre0IuoNhHAjYNZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=V+/cP3Oo0vvufixRwK1zojNNJjwCxdNviZh1kIxDOe/YWRQKy8mSR1FCFR2JRN+p32XA50MRXToNmFMk1lmeLeGIfqNG8qHeQuzbgTm3FVsLhmxgtmukxcPkefmcJHxx0OrBD5RwIY6W3OSqEm8rqdAuEW0RqDFHidOBVZFN+Ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAoECN8A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5U56MPM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAoECN8A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5U56MPM"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CCAUOq1740425
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjL
	ro1qNdYQ=; b=TAoECN8Aye7D4KBxiEOgktoqObJEg+36z5lQrQ/gtV/sVgoId21
	jXrRr5QbkEfwmcSPSrUeFPNEM6Uz6QAY8ISrrGuwDCGpvGZVrf9abwUV1KmWivc5
	AafdBTW6n2Tckf+oisYh4IQI7MPQmF1dGCWvchVFhQq1C0LO0GThZVkUb6R5zaEP
	yR2dMOC+G4fxbSZZJtiDFXQySjCiEZBHzUDIr69ImBeLSip+btXj++jybIOErTN9
	bDtHpYOgWaigHQ4MYDAexhx8FxqrKBgp3CdCtCaX+mKqUyzBJf6Pul5WnC7jdNMF
	oY4+l9BeLQJfVXvZ2IS6U4AxXsnSzW233XA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdjkgf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 12 Mar 2026 18:43:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cd827a356aso841518985a.3
        for <imx@lists.linux.dev>; Thu, 12 Mar 2026 11:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773341031; x=1773945831; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjLro1qNdYQ=;
        b=I5U56MPMGRUfu9QelNApDhEPmXq6upEXI3iUImfSaiIdXR5S8HlP9NvXTmdW+iz/o+
         SHT/qGv2JhmV8zv8L/T4Y5lVCMYt5dxXb8eRVsoP8HV0GrbFY58TaV8SYOeDcKKjbip9
         eMhZsTIhjsIMMqNn5opJyQuWSp5BJH9b2vRjHw56//KkenwZJ665QNoSiV6Ak0LJLimy
         IRI4YxkkDTPvM71zw1a13xZundPZgLxvbrSwHya7ka6m+7tCvIaJZQckEF31QMVRUFpC
         6iBfjUsqQoWEmCcJk+f1Fz3EeRI+WwV55KKjxrZ94whpSNR6DDsG0ZmTq6bSSbqQ7aSX
         GdKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773341031; x=1773945831;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+HkoqHNIcmwOZo+SK51MwxHYbRzqLjxvTjLro1qNdYQ=;
        b=VFjv/JXNc4hnff8SagX7zJluUQ4mX6ZwHzsAn7jQD425bFmevkQQgFMX4Yv+LGQZFs
         cnxG6g5E+82JnKVFzWr53JzJGlbmknrzI2TCNFunFfDdapTR+UB1m9GIuMz0CSwdOSXP
         vX6JyDKwqgqDkAEMAjGxP9pLC2jHg+3b9/aRNgNBoNOx0vonYWnf0Fg7hLT1g6yO4bZH
         MrAQ00dpCQM6CZ0AqtyCjkBKlzyd9N8qA6F8ldlC+KMfagvlHgYsUfqeEq2nwxsbbO76
         UlZsc9F81X/H404KdAwSB/ZzO25SiOP+ybBtbk78wCGerCUvkqx57Gj1VrIUgX9PZ0WG
         xBTQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/t3deYtx6ir6cYCg/N14Hwl9JJdFJzS76ZTNCSCP14XCQL7qfbvTnY7tw+SahuxS4CCw=@lists.linux.dev
X-Gm-Message-State: AOJu0YyuAmVQoAQ3Hcb5McTSW+yVXmtbv5MWiEq/cAt6ADElcx8d7wuY
	nLGUw1c3+HAOcBPELTysbFiiRfTGx7+XpArR2tiw4Y3vacaCK0nG0RZTo7Aq23IRGaIWXDFIUaR
	dHGF+ipHxOU5lymQooKt6mhc2Qi5qmsWt59Y9df0xY0QO+mGDvwwhQZ4=
X-Gm-Gg: ATEYQzzOs54eQnd/7fJUCSVRh7cisOEP2S8ZCA+Ox0nL4wozEJJTYx/ArFoFjl3LePx
	/azDSA/gWdea3PByQK0ZZ5T+4H1W2BI1rtiojGE0+gccI6YnaS3CTedwnRbwQbclqr6NEBVktTX
	ps0Fd2hirlESyDWejYgEGzYIVs+ArQOjPjKjX3P1RWg34Hjtyhke7eziqoDuZ3L9axFnDBKgzBb
	aAoOwatffYwgzPpTbASmOBIEFJNqhmHJMhpGBlyp1JiEJ4T+EQCCoaIY6NdSjc4Tklft9iQDkQk
	pPugNxI//j2KSjN3h4sN+ygbY4RmB8rGsAWlu1LtwHxsMW+F+Q7h/XkjV4ROjNLSh//xXjkLcT2
	jfN+kc/T1jMRLrU7iZrq5K7FQKBYGkGjouiZW
X-Received: by 2002:a05:620a:1a0d:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cdb5bb05f4mr106415585a.77.1773341031465;
        Thu, 12 Mar 2026 11:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:1a0d:b0:8ca:41af:32cb with SMTP id af79cd13be357-8cdb5bb05f4mr106412285a.77.1773341031010;
        Thu, 12 Mar 2026 11:43:51 -0700 (PDT)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20bbb2sm10005040f8f.22.2026.03.12.11.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 11:43:49 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Richard Zhu <hongxing.zhu@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sherry Sun <sherry.sun@nxp.com>
Subject: [PATCH v2 1/2] dt-bindings: PCI: fsl,imx6q-pcie: Explicitly deprecate reset-gpio
Date: Thu, 12 Mar 2026 19:43:45 +0100
Message-ID: <20260312184344.42337-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2298; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=0tXOIBZpahIMNyxmlfBim1P4ONHHre0IuoNhHAjYNZ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpswlg93p8yhDunYSI8srtbq0lw5h4i/81CjyGK
 tJwNqZb776JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabMJYAAKCRDBN2bmhouD
 1zKMD/0VbfX3p0sY7DPP9esiQ8ycSbh3PmD7F2UrbBSAiO0cHHO2LUKqcW6AMzVHx9p99uwQuaU
 ciaFreVVcuJbzwv9r6iJHIpI+IxMTC1C2DITt4tpLG9sFpyQmaFPGp7/l80/dUh0y1ZjTAn3ncL
 B+Iv9G6SMS1oBTcZdW2o9Nmn6aUDoSes84V6e1TERKgNY4L7wV/jfO4l5D3KJNaB7f0qEzQ3ukY
 u3iDqDzYEO2lgIO4PXY2tL5XFceLBFjiTClAbYkP49jeZccSinEgMPtaepHHalTrPRYjNfoQBFY
 Ut2/00fpWMV0Bu6IFOeKNkHbDknlzUFlyrQC0A0xNNHRFlD2z5e8v9RQQGwIcO0ttdL+UlRW4yZ
 STfuSi6mx/niBtDvS1g6v9otU36Z/qcB0sa0RoTvWU7VDsbzZVg3nTL4Qx3kmxBNMbS9JaOMe07
 1BbfxkKpqOlx/HiXM+0+4yZE5MzM9Q6WVPu9W01FKWI8qam8EXNYkw++HUURNSR5OpETp7rR9Of
 1OKo55KWHPpHtDBghA0+tmrkFavuNa1NxHMAR7f8dowIZcszilojKc9aGX0ERxwNEE1NocvNWg5
 A9/OB1TeWSrrQRQ4MuUzKMUwc762SE62NrxLCUkOPrzBrkyRfuZmXTlXkW2SbGy+Oe8fPq4AIRF i8K1ni69MwGq1tg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDE1MSBTYWx0ZWRfXwzJONG8rfmRo
 LwW6X94bo6qLol6RISqnwBkfBSrqyg3MHPquyJ1fL8RK0/iLJmXOrS38PMl+hB4BWKkaMFksP5O
 UxlzUsLIVPZntAVlGR5GugvlKr6CCapoQNZzNNcRYWGntP2ZarD2/ZBoWTuiiG5l1CVcbgAuonq
 NSdN757kv9cp0EddFhq80A6IPInIZ5LmjjDY9l/l0p/qU4FHbHTreiA6TeWS1o+Cj5GcVUHb/zy
 P6I6cgpUkdtTde0d/S0k2Zkav8raBvhzNKwmSUpS4DXqPTdY7y70Zr4B59fX068Q7VUyksIeRSX
 RhB7V57M5YKvlWrsf+MTKuN7f+HhqSKPhS7e9UHX9s5gxkZR5FNfJO/UV+L9EXZadFdQsZcxSwZ
 j2ExL8V2x7HmpObER68s9jNWz6KjQHtGJDbtRSPmk3Ea07Ku9SSbUxdZpH4Bz3P90QReWJqaFgG
 rowHdURb2+KkFWrBYCw==
X-Proofpoint-GUID: qV6XNKMggvMivICsdBLx5LSLHD73JmKj
X-Proofpoint-ORIG-GUID: qV6XNKMggvMivICsdBLx5LSLHD73JmKj
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b30968 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=8AirrxEcAAAA:8 a=VNn6zrWwxK5-OcnvxvAA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_02,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120151

The binding references snps,dw-pcie-common.yaml which already deprecates
"reset-gpio", however mentioning this property here lacks this mark thus
code is confusing and suggests property is not deprecated.

OTOH, the property cannot be removed from this schema, because it is an
ABI implemented by Linux kernel in gpiolib-of.c in backwards-compatible
map between compatibles, "reset-gpio" and "reset-gpio-active-high"
properties.

This creates code and binding which is not obvious to follow, so rewrite
it and be more explicit about:
1. Deprecation of "reset-gpio",
2. Relation that "reset-gpio-active-high" is used only for that property
   and not proper "reset-gpios".

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Cc: Sherry Sun <sherry.sun@nxp.com>

Changes in v2:
1. Rewrite the commit completely after Sherry Sun comments - keep the
   property, but add "not" clause to forbid usavge of
   "reset-gpio-active-high" and "reset-gpios".
2. Because of above not adding Richard's ack.

v1:
https://lore.kernel.org/r/20260311154955.145120-3-krzysztof.kozlowski@oss.qualcomm.com
---
 Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
index 12a01f7a5744..12cd1b9f78d0 100644
--- a/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/fsl,imx6q-pcie.yaml
@@ -62,6 +62,9 @@ properties:
     description: Should specify the GPIO for controlling the PCI bus device
       reset signal. It's not polarity aware and defaults to active-low reset
       sequence (L=reset state, H=operation state) (optional required).
+      Deprecated, use reset-gpios which respects the polarity expressed in
+      phandle argument.
+    deprecated: true
 
   reset-gpio-active-high:
     description: If present then the reset sequence using the GPIO
@@ -224,6 +227,11 @@ allOf:
             - const: ref
             - const: extref  # Optional
 
+  - not:
+      required:
+        - reset-gpios
+        - reset-gpio-active-high
+
 unevaluatedProperties: false
 
 examples:
-- 
2.51.0

