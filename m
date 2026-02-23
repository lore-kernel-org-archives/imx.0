Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AA7B2472AA
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853881; cv=none; b=FpxpcIw4uI+1jhIEP36K4KasSLfEDuudWgFE+riVZ3Ywz9v8CvD6xFz+d0TUcwphFjdrFs/qPPVhuaYvIJKINGK9IRkp6/TSXsWU6cyBoJzCpZtR4OAkEkSbVIkrJNn8y3wK3nJjmyllwhR8xNPmxgfE7/+v00mEwypMd77Ng50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853881; c=relaxed/simple;
	bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkdAze807cSG74C0ikMiG5dgH9GPPLUaerXatRJ5AW0p4t03LPF5MJcPqnPXqKZUHiPbf9w57Q62VldjR+fEZOcJc7UeS6uKRMXj76LFOhrdMeaPIzXCBRCBRbxnojZ9NaIl3MzPDipNlztWTfDt8x/sPBC4GW8VG0FMP6X5/vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FKPEA8Fg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R/fEyxRq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FKPEA8Fg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R/fEyxRq"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWfnu3733550
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=; b=FKPEA8FgiRKeXm9J
	CxfKM9/iMzcE+Gk5wEvWu5Kn3jdWqUGr4q+mhSly82EPrBiUZLxmUAId5zieD0uS
	b/e3qKrZ7lX7XI5ePLkFOIyloPBK7ln4unmLKt5bHmraRfcAGEvRnLt+iaI/5zYb
	cKk6pcUAvtErYGISlTVYtEiim/TRnJQGZqxYraeoRaYMZU9wvyrgmLjSTfYdkzRx
	/R+xQOGvH+Pn3gsEn8ZkZw9rmVRVENB1Q0u0XrpcSDSyzYmAcD5lhOARsBPaRyOj
	nrJACCpNaM+0mIP4So7pfxAbupEy+KKuG6Yp3xsBfZpKCUV04i2M/vBn6pfbtjP8
	TobfjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn7t8ff0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb403842b6so4700922785a.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 05:37:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853879; x=1772458679; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=R/fEyxRq8RZmtt2aZ9mULE1+Uc1qGQF/tRUK6eftGM62ULHyVtUvcCFgUpu9LiVsLn
         iRh+H9FShfl1HXIXptxDwhTaEoajol+/xwNaqY00Z+IIzLMt5eNYCtwpvPtKK4NKcz8s
         b82BD1ftoPLgnkvvpCxGqTp2kOFTwJqGxzvfzE/qOGza0EQh0t+yMY7+OTKeHhc7Wp/S
         +X/Y10AXfej6Fe4BxispRzRnHELF+l5DJGw0pe3DuZhJ1SQGKDHs7g9nX3d5sUWFV7b4
         UBB2tPyHZn1VSv98t2vVzVQODxwe8avknhOpnIJ7ZjX86K+3wtREUpQzuwCTHkmlWMM/
         QAxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853879; x=1772458679;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8IEA0OJO03Pwu/2FEJJpmeYxqL+JqswxTgLe31jsxYM=;
        b=N7c6zYSXz9Z2IIasm/A+VMlUUfiGRJ8VJNrkF2Xp6bt+K6YpuG3/GQRqNC36AROGC8
         e1e3nC+Flg0Qp9joJyVxHt2gi/tTgCvcB/9TGWDsyo8kmbXfvHLD3L9c5LjmTxprKkVd
         QTElfYXvSazIzLrJFJcKQ+B3fYkm8DVJiKkA41+fhFR+mGcGD//sRmKE+TYNCGycn80C
         cLODk+hchjH2kTi98yRvfFQacnmG7A/U2hsXm2JkaG7swWVYma9X75Xxwsv7gVC9qCor
         u3rA0u8WFAu2JoB3I9OvW7/E6oqi8f3sRXFLkVr7HggAdm8tAzwJrzaENtmJvzNCjpkc
         ELgw==
X-Forwarded-Encrypted: i=1; AJvYcCXFOuC37opZdsiL0jnpSxAgnXHlxNZqKiNtM1/j+qve7REk3dxvAKaS7yYJ6VQ4k7KedbM=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywn6afDXrO4uZKaJ6MtEAkKysP4Tx598UD7gR3CY/wfValy8Gcw
	sj5BHaeNe1DZPwkNm1vHRjF0YJGMwmzdDPNIcWGMLfLdN8poSjvwitsWMhkNA8t6osgYLMPdom+
	0IqvitL7O92XWYNNeIx0f8ZZe3/PUw04mY55tW6KlGSCYu3NdHF/gZgE=
X-Gm-Gg: AZuq6aK5daV5OvTeToBAmHHIFJyFuXHAz2CfFNZP7uHVrxj8ylLS1IvjbLBvsACa0SG
	rjNO3f2QGPh6Dtb8XSv60kqUWX5BQY+AnKKTYWi/TBXGtoU9hK0PLyVeAIW5ijmgziJ44V6nKj/
	o/73tgU93Z2qVNr9nTjMdksPKFFgcFt06j4tyCMXwHo11gWRC1MCxOx87tUyJTXNhlCRyKcMK9m
	2MCiQK055kkN0ABw2IzAqa4lCXm7LIVG8UHzwlGb4nmcK2cqCJMeBrlaYyXUO8t/BCVH0Al6PAK
	hqKhoLEg1EwLI3W/opyZeQoVr2rW3FjJmDK2QxitxCru/cL2rcRlngzo3rv1B3yxKvN131ukAzK
	Dev9ByMEGj5fiDz6ShaR7hy/2CYpTPPrNyipvqGMkBm5gA67HIOg=
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976095185a.7.1771853878663;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
X-Received: by 2002:a05:620a:440f:b0:8a2:234a:17be with SMTP id af79cd13be357-8cb8c9d2b8amr976091685a.7.1771853878214;
        Mon, 23 Feb 2026 05:37:58 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:56 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:22 +0100
Subject: [PATCH v2 7/9] soc: imx9: don't access of_root directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-7-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PJKjL5w9GmkNdzF3k8paqIospNea5xR2VwPf/5AEtMw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFggsAfK2L599u52s0jxxDBJVDwECvhtJQ6BZ
 ShZXXzZl6aJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIAAKCRAFnS7L/zaE
 w9TLEACvx7EUOkNExR6rxJvbiPrwBxde+MzYk8WnOY0KUo2qQYe2IV3v4Y2OLkNQxLORHNTmTet
 tL8qdFdcA7/EtkfNAUf86JGuaHxQWgvPaQLo82VmtcJXrb3s4ChhMHQTxwSIzk57nVcuxBwXaoC
 d6cLiDC/nMwvrZAeyb+0Z1LBwzE7OMUXdzVztRyUlBioOA+aG7+h03mNocovFYbn8rvTos+rY0Y
 e7h5NIVlwUODtq0Ev51CGoFbC6CaCwiNXJba+UycfegX2W0Kkhwf0Zyi6DiT6gQq2D9oI1fRdMD
 xIzw0mWS+oLN1VnrqlYu5wL/Ku4iTSggD+ob4YpLXraU5R+wYi1r0Azeg8et0za9it4PFjFPnfh
 Dl7dYRS50ulZCrHTUPGGGGvZLPZT0QgfYfmQTBBovf+cs1qrWcAVJPUnA+5OIsPfTAX4tiEFRts
 P28q4vNQSZ0M8Ztild3VhrhzLubEMw6II5ymoX4cbhfI53GoFeJAcgxeL3sNXMCDZjbybvyP/7+
 P6DMYb8Zm0nYj6H3x+3/s8WEK2ZkHPtYYlR/xxt5DIZKaoXnhqi5T+1/EOjQ5KwLwJVLhLEEqcO
 /410xgEfAAQKBXmwObvlKe9pciFTnNXitRVoM55CA5VOT0ToZ4cE5MSg6+N9VqPGbRfWHk49buK
 slcXvQ/kjdLSnvA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c5OmgB9l c=1 sm=1 tr=0 ts=699c5837 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=PMAhrox8fQbXPR-8CfIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-GUID: _fpXvOq3_gMk_C05WM_gJ0YrKKwBlP3h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX8aSbr2gqpKfY
 pBaYCtkCW/oACw+Zyb5yPAcPhN4CznJtA94ombX/mQJx5/ejZ10bBfq5w/l5PQ4QcoxUSZngSp6
 NsKvQv01FSU4O1V0niWSsHGCr2DWJEZojCahVKB/8fMMadGkptTXQ4t9CKypeDLR0fn/jYr8x25
 xN/xYSNwa4H7TDbcBr6TUSzNxqewSJcwwwPy05qLB8HUvse1F2TlyTvMDNQ5jzyKxS1DxB2pmaG
 CKDYTNNQ9NFc5jb3B7kAJqD2P0ebenbXKaEBpgmKI/VaBQhlb4Wwk9S5On662YjqCop7CvY/8QY
 hHsxw/VXVoJC7J22Wmz1XYejcy1TgX5rQBemlE3IhEYssXUy26wP1itswScYHbDLNTLolPQBjch
 cqBlEVUqxcKhcnRbpyjq4bU4vxO6+iS48L3PG+5/PxTAEJsyAF5tiYy9uaP448xS6mY6WeKNguC
 2PMfJhxOD9yLK0aeHEA==
X-Proofpoint-ORIG-GUID: _fpXvOq3_gMk_C05WM_gJ0YrKKwBlP3h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Reviewed-by: Peng Fan <peng.fan@nxp.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/imx/soc-imx9.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
index d67bc7402b10e2966ff77cbf3b15c087540bd377..58eef7d4f9089ae56891507e8dec383e69884ec5 100644
--- a/drivers/soc/imx/soc-imx9.c
+++ b/drivers/soc/imx/soc-imx9.c
@@ -30,7 +30,7 @@ static int imx9_soc_probe(struct platform_device *pdev)
 	if (!attr)
 		return -ENOMEM;
 
-	err = of_property_read_string(of_root, "model", &attr->machine);
+	err = soc_attr_read_machine(attr);
 	if (err)
 		return dev_err_probe(dev, err, "%s: missing model property\n", __func__);
 
@@ -89,7 +89,7 @@ static int __init imx9_soc_init(void)
 	struct platform_device *pdev;
 
 	/* No match means it is not an i.MX 9 series SoC, do nothing. */
-	if (!of_match_node(imx9_soc_match, of_root))
+	if (!of_machine_device_match(imx9_soc_match))
 		return 0;
 
 	ret = platform_driver_register(&imx9_soc_driver);

-- 
2.47.3

