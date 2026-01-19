Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4BB30E0F8
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768819243; cv=none; b=WnfKcsOMw7yEQ8SrwNBHTmaMVew1Hc/l1vHNAuqcUULzMp9TjYKoFJXG2TJK1qxPHtem2PQ5aqfisMoA0CtSkK5Xk+YRAUHtWnl4AY/JN8Ugr4P9dPg94b3ZOhQd3pHarSjGhzJFfxyNEXfLzSqOrpOWzdhKreNL/dZIk1bCnoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768819243; c=relaxed/simple;
	bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FRVU22bsXok/+6WO2QjMfumD15XDiQbmtGPEiQ+1dPn6DxSJ4cfyNfnYt3/wdunMWxTbgOlopUAnXNNR/K10gpB2Ym9GSu+cLKyYgLUUhYDJQ92ZljmldgH0LDEg7w8RZ8S5lwkq2AGZ/9Qf4gvE3B3HgOHg8hB+foU5PyA11WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBPHvG+V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Yp4WMimz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBPHvG+V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Yp4WMimz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91Dcu1150088
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=; b=pBPHvG+V+aldTdvm
	pilu6HfKXIj+geOWxbAR8Jg4hT2TC3v3SmvZh+4BnvnA+YlYsbTcXeoJMUC/xZtu
	FAlw8vIQHM6WbJQNSzV9TNb8LWZ1RMQ1bHkH3jeX/3GdI8Ssf3zwnzPnpP7LHef4
	k6Ov1j3Z5dqpiHT++AQKVR/o+L9m8fl4fjDIsaExLmsCAFVZh4/XgVejbSw4FCpG
	1p7xg1wWcDN3gOG4GrfRnttPczxBO/YEv/5kRF8dIyZr1UxuY5weLcDA8ZLsOVUl
	4BaiQhLjFwKMBThwM19nnTDOKwNd3zMpE23Sp701ZScL46/4kysNPjVQ3ODM8esL
	ev1iDQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br04e5457-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 19 Jan 2026 10:40:39 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c5296c7e57so1517783385a.1
        for <imx@lists.linux.dev>; Mon, 19 Jan 2026 02:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768819238; x=1769424038; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=Yp4WMimzh6KqgNeirA5JcjdhgEVcY/BJYolXyOmNu1/Og3NOVwTtu3PDJ/ErIGHA4u
         j/Wr7dYI5VYjDVlYh/Os/NPpJhxRlfLiSCsKYJVPFSEm9TZxYR3gF2fKRcIO7n01Df/r
         /dNbnoshlhhlyhZqXRapPb16KL3qXewHjRlZP1GbAuNbESLC95f1aszWCPguHPln1Po3
         S6FrljI40woVkqQG/z8VJtVa1SH8w8fnxRVc9WX4fXx4WKfYTHkq+s45zDHgRYGU0kax
         NMroiNST1NzsmvlZoPmNsABTXt13saRUeKSpudFuJwEns21EY9HUEYHFB4b/cLXpSsBX
         6P2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768819238; x=1769424038;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GaQTe44hMaWFCObwIQnLwBlsgWnPwdcAGUke3wQLRtA=;
        b=JcqvHBqatqZxoefF0sqvIGSdONCLSnuaGCtK0AQYJJVuZhIbvSclxSjBf3wGRlKELM
         RraMAN1cNfFvw62LN7RSzuSKNfDUt7uBpR5PhBtYRkbzpQ0/cnzCoxq0zPOhs1gYbFar
         WXIWK9Z4fu8ejBMKJn7ik939ev3hradUwXOacmVyWMrhTS4Fk8r+aJotaFab5kumuNc4
         yupkA8VynZgvvRan0FkOXXdO7s7JEdbN2eGzN0xPRJm/jA3piOFRF20dy6eZdgnbFiFG
         7LOqsrCGrZlpYszgZkM2qRr24M/KQQF8LPFDKjQUgYLIBVA23lUDMQ1hUMJg9kFQj+X2
         RIpw==
X-Forwarded-Encrypted: i=1; AJvYcCXeVHYGKcQaw/fJuapR8Shk6FoUoqerKiwQySArMpdCzPq2ZEouN/YF0is3dA4xwfsCQww=@lists.linux.dev
X-Gm-Message-State: AOJu0Yx/df4Heu+4chrbR+ZV3hex7+GoNZZ6N+EBScwrn0saKbYhyM7H
	nsFwlTmEOu7B9gUDFMbAdc5bhMtlyVBe6Q8ngIzDENrVunlufLdMg/zbQWZp94c82QmeUZBaFYr
	iuPxqrXbXfkhSHJoXv5ps03H8321wLHPUhR1gws7Nk1AuuvBgw6eSauN+hGoS1D4=
X-Gm-Gg: AY/fxX4fqOvVZgCQtFVZgvJAQsuWLSn3oUcQidAO0tOKAMy1O11VzsIXul2JcEkKA5I
	ruN42yoJ4GpoReszghCifm+BIhb+C896dMzl/7RF1zV22+Hqp1C+6QW4IjKhTVEvpHbZFRFRm2k
	cxTKS3RfgaQCizz47dZQMhcCz2w+w/0amY7Vzs+KTk6p0UU2/d/RHN+QBf5/jfrwKDn7AXO2ogL
	EI+XlkgVyH8GW1ojcEcswocTi/mG4rLO2dmLuSGGWq19oNRm/71TXdL5PTFP4NkRVDq9bNH82lV
	G0SEW+tFXlmH8O2rExAO4DXFVAz+oSx444OBo1G3sLnCPq1LXcNgts+Sn55wgbuIlw2gvvHEJrj
	nXlw/idRvDc4IVcMGYudlujTKOM4di9bdkRWVo8b9
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477510685a.32.1768819238226;
        Mon, 19 Jan 2026 02:40:38 -0800 (PST)
X-Received: by 2002:a05:620a:d89:b0:8c6:a034:9231 with SMTP id af79cd13be357-8c6a6909cc2mr1477509285a.32.1768819237805;
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4f55:d102:7129:1a8f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm185185245e9.12.2026.01.19.02.40.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 02:40:37 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 11:40:15 +0100
Subject: [PATCH 4/8] soc: fsl: guts: don't access of_root directly
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260119-soc-of-root-v1-4-32a0fa9a78b4@oss.qualcomm.com>
References: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
In-Reply-To: <20260119-soc-of-root-v1-0-32a0fa9a78b4@oss.qualcomm.com>
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
        Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=w0g7AInxJuR27u9srWJadHcDu30R8TLTmUaOMASFczk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpbgoYwGcebs7TnQeHLScelsB33SEhUygDvo2R1
 Rz0CVrKa/OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaW4KGAAKCRAFnS7L/zaE
 w5J5D/9l3gjjfHn8oabJffDpUYkOaslm5iWFwsy3WllRD3GzaFol/CREVg/2njHPc8W6eROxsJT
 wxXIe8OowaGf9BENgeEaEfA8NUIlmtIFwmbtAqn1sxEgK9RG62GMxZGUDYZqiwiAQ1IhUCRBxIj
 YT88QAz10YAkhKSrY8oYfeZ9IU2FUWXWbZMGy6GURV2i4h8GRc5YDqiM+6STIp1RD4S4pRQGuMk
 LHP/fRSDznxefUp41kh61X5wU43AQ8FM1leLsCKG8y7WmQg8bhtr2DW+p4PtZjazDWXVf5GsAwb
 1n+fE/v5NLvuGKRZuLkw3nDyesXIDKy6Kiy3iUaqz5dcnOYnfFFRNFvgbLzpIPI9aDgokuOOg4w
 AXXSky8r+SmkmL6is7QCrmrDXnUhHaMdn7/V4oudwwiVN0xvAENYX5tWKikeT/HNJ7f6Y5EsHEe
 9KOKMdbzylzqjsas2M11HREQNgxrJXfnNDgqrKm0fUVmTgmYmlpC84SnHLwAFBzIZ9ZbA63CZTP
 GeMs85X3Gqv6T6o/VMovWvCYazRePcP9Hh6O+NEalOLNppUV68kCUS1lW6U6iC9uGII++8njXvo
 smph8uKv5reLDLaVa97fvnplAnD45eUsvXk1KmzUFINRupBTUl4tKJJRsz4mgQOE6nPFufkfwA2
 yUh05MLZIZsj/bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=J5OnLQnS c=1 sm=1 tr=0 ts=696e0a27 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oxzWnGEk1v-FRkq7efsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA4OCBTYWx0ZWRfX0Xl0Ys6NeFlK
 T/j8gEYcBMTZljh3NkvEDs81oqbZEyCRdEtxo/YbybF0avCmqpDpmhGymEfTXSh6tzJ7aC8D/tW
 biElZdX5A0YLwAm5bGvoWvY/3XzMCrpkENVt/19kUkwVP8sh3PY/uWo4rY1z+nXX6GsA0inVtBA
 HkmKeR9L5OKPtOcQBcNSA+ifmMiKAnVPk+qPXVNSjdmmZT2SGoEfJYT+r9izNEKrBwPJgNK2dle
 pc3F01JogduMjdONPt1/ERMB06gdIACL24Z3vBIDTp1W5Wf8u4lYvED0u5VKhiZ15fB7l9tSr7c
 +nEBUqgz4JrlyEIyYrYba0F8+yyHsxzu1Pea7tU78B6/BqwLxcv1NpdhS2N5oD6bMbXgyHhpoy1
 i0GAcXMWiUl/fRiF4F23mpriQDCAGS0uNTCMAsGrp892+pefc/LFPS7NOrQYwhLU0XThTLz1a5y
 2TubLM+pgkWAB+k/fJQ==
X-Proofpoint-GUID: 0wlX_RvuS783wQRVzr2HLNiXbcFOMy05
X-Proofpoint-ORIG-GUID: 0wlX_RvuS783wQRVzr2HLNiXbcFOMy05
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190088

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/fsl/guts.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/fsl/guts.c b/drivers/soc/fsl/guts.c
index 6bf3e6a980ffc67c21ed7b62b5b638e37f27454e..88ba32a40f6a27f8ffd13624e940aa0edf48586f 100644
--- a/drivers/soc/fsl/guts.c
+++ b/drivers/soc/fsl/guts.c
@@ -186,7 +186,6 @@ static int __init fsl_guts_init(void)
 	const struct fsl_soc_data *soc_data;
 	const struct of_device_id *match;
 	struct ccsr_guts __iomem *regs;
-	const char *machine = NULL;
 	struct device_node *np;
 	bool little_endian;
 	u64 soc_uid = 0;
@@ -217,13 +216,9 @@ static int __init fsl_guts_init(void)
 	if (!soc_dev_attr)
 		return -ENOMEM;
 
-	if (of_property_read_string(of_root, "model", &machine))
-		of_property_read_string_index(of_root, "compatible", 0, &machine);
-	if (machine) {
-		soc_dev_attr->machine = kstrdup(machine, GFP_KERNEL);
-		if (!soc_dev_attr->machine)
-			goto err_nomem;
-	}
+	ret = soc_device_get_machine(soc_dev_attr);
+	if (ret)
+		of_machine_get_compatible(&soc_dev_attr->machine);
 
 	soc_die = fsl_soc_die_match(svr, fsl_soc_die);
 	if (soc_die) {
@@ -267,7 +262,6 @@ static int __init fsl_guts_init(void)
 err_nomem:
 	ret = -ENOMEM;
 err:
-	kfree(soc_dev_attr->machine);
 	kfree(soc_dev_attr->family);
 	kfree(soc_dev_attr->soc_id);
 	kfree(soc_dev_attr->revision);

-- 
2.47.3

