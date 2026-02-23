Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A659C34EEE8
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837585; cv=none; b=MVS98TtxIeWOq3kbYdq/xLIMsnmDHmDUl+MzcJ706WOgDhiL5UBklx4RqFz4vuqJJ7HVP/7bdEm28PHBnXG85uCrpMgb4dyy0RA38pLExWy9gfPcH0qi42336qUQ4ihcXwIZmnCwkbxv21VOjgLHEliheNClME074igrEEjOBYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837585; c=relaxed/simple;
	bh=TC55XBmh7XavSMEvFloOiPWsoDIu8+74KUdcPMB2Bs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XT1NWVqWWUh+HZx1EsuKe6wiBWXJAhgZLIshmu7OBKTWdzwzUf66GOZQVA6g2eo4w8ctnvJD1RwBFcKRY2G0/kchGhyyTMVFRAh46Mny0YjXyCh9xVxxN7fYsu/ZFSbHVbcIEU2aMoyBVsxm0kYvwUp223zOBM4GZqgQTNy51Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ItOQAL6U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MWoFzPda; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ItOQAL6U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MWoFzPda"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N8ZTQ91425174
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=; b=ItOQAL6Un+1g7sCL
	BNrPifQpEh670GxN5RSQnLf9WxHoyMpBIJo4hdA1EsRYnHs4zbpuOAy2vveAavVE
	wbx32eKhGXoYfYPKvijjonrTNyr8Vz5/vYlAy8sSG1VylpgelYVHl4ndaLxM+ndp
	b4NvKVCpz0QF1+to94yt9a1aah80tKP8VqMGZUNxJ9Fcp9oFPScqS1Ia0HFG1hZi
	x0aN9TfBBXEXDCeGUYKQLaL6R7sa7KdjDE7FeEBxlGgxYvosmDwbe/sYMlq7q0Ii
	0cTACN5B5ooA9spPbUXdoEMAQRLhQMG0mEYR3DA7Bc67X61Ft42/advBcJCo9Hhu
	2lmn4g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5v3v1tg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:22 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb0595def4so5271414985a.0
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837582; x=1772442382; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=MWoFzPdaZSZErrssB/rDfNh90QEXP2Og3TfVAYmp9NA3OIbrDZlVWJZ701jgouvn+H
         PnY0ksxNIhlrwt+I3Jzkmkmy/1GhugfVcqxbhEP3D4VyPtG2rl7CZu2qP8TpX3ccoTPe
         7kEjUTXoU8+cu47je9Xu+RUbXHTtyjQVzp/Qg86Pnnle2smm0bXS+zzRPFzZXzyCLPdM
         ZpTet/VlAtN4s6wNRB0gnOtmAdGSWlaGRTb4MhjCMSd1bvxnvwtSOE9yep2SUhM7bA5v
         37FYRDJIB4/9ulMn1eqD+P/v7rxpbpt/TRBE58UAD47zEPg/5WTXP9YCcbuuqw8b0J1w
         CDBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837582; x=1772442382;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWSZ9zXmCEERN9u2nWml4hs+0Q0AEKrVf/uMBqg5ZEo=;
        b=o+BE0Jpo8jjSxfOVJwf0EBQFojHnr8Kt6P+bBZ96BftClsQydLBkCwcUJOobRHX4bf
         MF6cSKOD/APlju4d3BMgyMnQgb13IIGuSaaAwSZ4z3amrTC+4zAD1u74cBNtJoVcQ8I9
         qGAWrzOkofFFbFlzETXIfUCYNd9ZFEAOgpAIxknI9lSYEtkJOXYupdUAgL2AWunLCbme
         jNtaWQYbbkSZTiLA6qeDnl/sWIkaDifiheZi4YvPnEcdn6juMJdDW31YqppWmaRYFr+M
         R5zrL2HwlKyQT/Jrdwvv3uJYp4Wh2sQtYVqEi6OeB7djGtbAxKGmxb3jZvmlZKvlYfXq
         LOxw==
X-Forwarded-Encrypted: i=1; AJvYcCUf3KCTSHLbN4mNju2i+8bhnErvHUjFqk/dk1NHhMmzM32f8OlzjE496RF7etKA/cOrA90=@lists.linux.dev
X-Gm-Message-State: AOJu0YwH/gcXkJsJ+eSQ6Ms4P0hHNaz4HyISyAS+DidB4f2OED3/yRm/
	NCyaanW55MxXmMMFUvXkPWyFrZvPXdpbFeGyLEeNZn47aOFnw/ypWVr3p/8V0C2N0bekW6GKTi8
	Jl1CzJX+w10JJfP0pTniQBXn9GpZXstSyHMfnwJX/NK4u6bXDjVHHLPs=
X-Gm-Gg: AZuq6aJPo8/HBvfT3UKk4iJp9yBoxFaUlCA1l1DkXP23Ab+i5RxthcF+Pyv1SgvoC2u
	Mal2f9VFDCtVR/E6jRx0dRI/Zaarvj/iMnCBDm1EStwCdm/28pUK8Qlt7XYc0gfA1DzIu4MuxmY
	QRQvViWsLh2IKDPMUbm3gspBVUGgaFga2UDfU9ornuZB+K/1xAokpleVGTQNjPefdCrAzaIKHvf
	kmZG4hSNiaI3jnht6FIa5yi/JLkTlfECI7N4UUHhhi2uUS0w2bfF7Y/BXg3e418iCZXqe0Fsv3O
	6WLf0JBKeU+VdJHxcaft8u8td7j+kGEFNXxbwSueWAW6x06OQ9iGcfTcMBS2FD5blCa3hAWv3hq
	48MAHGSPfImcg5pbiF4MKBvzihHrsqDbuFSi/YLuYNZju9TSv3e99
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695559285a.36.1771837582015;
        Mon, 23 Feb 2026 01:06:22 -0800 (PST)
X-Received: by 2002:a05:620a:198f:b0:8c6:a587:377f with SMTP id af79cd13be357-8cb7bffe749mr1695553785a.36.1771837581510;
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:21 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:51 +0100
Subject: [PATCH v2 05/12] i2c: omap: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-5-d78db0a6fcf7@oss.qualcomm.com>
References: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
In-Reply-To: <20260223-i2c-adap-dev-config-v2-0-d78db0a6fcf7@oss.qualcomm.com>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Vignesh R <vigneshr@ti.com>, Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Andreas Kemnade <andreas@kemnade.info>,
        Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Frank Li <Frank.Li@nxp.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1109;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TC55XBmh7XavSMEvFloOiPWsoDIu8+74KUdcPMB2Bs4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh1cgZ8t5g6Eu+YoXhXwpQTHi3u0PDANGTOZ
 Ae0vjnO/5yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYdQAKCRAFnS7L/zaE
 wwgCD/9apGwYLbKP/+X8XV0CrL2TpbVD/yQ1v+mwXTXzC2F0pORGRN35JjluieguYXFndYxaKdR
 tFZGjy50KQb/wtE7KYKXDQ2vWD6HJKH7FLizL1sVHQ7zo2GDBMUrZfw46kio+YiG6Is+Y1LYS7x
 +WX0RKZmhXLvUyNifbPFoZi2cCSTnAlzLHtIb+UJKfzgib+aVNaVB/OH+/srM5mpP4oDifAlwgx
 Ikc9+u0lITu1cL1gkDyoDKnj2lI/aWKhrc7mKp8fiSL+tBfUMKVYrKGus5GOIlEgoVa+iUhARC0
 zjrJVesZJEPf6zXrnmLcNt9AVMPczA7pz70Q2tp65CsbqZnkc/30/gYsr8AENPhTQLteN5BMo02
 086YUnhbe7k0pExpN7GQxKZosadOo7IUnEmhL90snzNzrE1Et39/xYOE2UJq6ii4a/qtmW2uegk
 52VogvSFCULCBjU1Yjr0c6FvBcFABmtCKBqsa7dawmKHWBtVF3vFskxY2lu0/bROCQFZTv+7w/k
 IxINEGTeEsbhCnd7d/eAywrwe3khM9Pf1mA72OKQwXI0ez9mYSar2yrKKTrBe4GKH/5lFWB2+/2
 Y9/ssBYQd5bBfBM8TxNtTpP/pY6suqrCVQXH8nBZw5nsL2f3q2BHphXOV1+Aha8pNOS9Vw/1Uae
 suI+G4XhCD+wAIA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=YL6SCBGx c=1 sm=1 tr=0 ts=699c188e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=50gAi1W1AAAA:8
 a=EUspDBNiAAAA:8 a=H-w5s1-Ky7DYDkcl1QcA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=bIAsa0K8HJLRn3BBPJ--:22
X-Proofpoint-ORIG-GUID: Az0Vxn7NxqzqGMHc9sFca70rSvXfAUjV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfXxN5Kyp0vEkSQ
 yoK3eWAvfxGVMcLYPjYaRMKpPzr72HP1r4zU1lgRP3GCxgnREuNwUgGvacCtt1DC3ZUxSie8PUP
 vpcaJLKC4rbfkPGmKcyA6ASHyuoXwwUXzHm+3Wt4qf2lp59Vg0iSkdJ9k0aV/4o5HlTzy2ZDcgp
 m3Y2UqkihAhWLaQC+LtQ3NQfLMVerUXXgdbh/zad21xbY8ON3v+DkJgXiT3lxxZVqPeBtCyPfCr
 HEFruh2fzbGybdbsUVXV07yTeq0z7X2K6BMdSAZmrxACz15BrVAQZ6UCF1DUzkgQW22PG4Zc9MI
 qN+R0uXWjpnGvsVYHGX3K8liCJJ7AbSZ0dywNChYjfZyPNzYxOeUpR8psI7R5I9VMln05yAS1W4
 sweMY6nxWBDpVRlrMHP2wfCokigP6DfxecS0nYQ8+EuZy62XqWBaeMMuScu8MUEcaOkHDeWFyEx
 DXOQ1YrNzyn0DnMvsQg==
X-Proofpoint-GUID: Az0Vxn7NxqzqGMHc9sFca70rSvXfAUjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-omap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index d9f590f0c384340dd31308bdf9ed0cb1a1a2ba8b..f95f31c521314e1d67f3d5b34bb44fcef557624f 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -1496,8 +1496,8 @@ omap_i2c_probe(struct platform_device *pdev)
 	strscpy(adap->name, "OMAP I2C adapter", sizeof(adap->name));
 	adap->algo = &omap_i2c_algo;
 	adap->quirks = &omap_i2c_quirks;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->bus_recovery_info = &omap_i2c_bus_recovery_info;
 
 	/* i2c device drivers may be active on return from add_adapter() */

-- 
2.47.3

