Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4553B356A1C
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837599; cv=none; b=nK/XdxXzAT3/FVeqEKmqIzV1OvZE1C0yKFV4O5RulkE3F4D4sa5UNcKAtO8VrAcCjT83Y0/Fr01Ly+W53GjI0pAVwHV9BbOxz3l/WNTtg2whCJ6ZWlf2lO4hMSk8ORmP+0dsAsehCr56VLc/r7RMHOJeJClAbNmEDN9Rl7Omq3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837599; c=relaxed/simple;
	bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=os9/QD+sxxKbyp3IaA38qNSHaeKmtSc7WLJKffQYvfs08zvfU6mf+2EZlWPqN5GbN6aKSgkPCTrGyICfugRzXF5e7hvoPhDUNLS9tzGqj4xh8JQn2RoyC7y26q0Mo/rBCwi1NPga7Dqz3j6HPIc7+weUrER3jEnN5dblw7wNriY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OF24CyJJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iIXxqATR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OF24CyJJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iIXxqATR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMv0LX3056762
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=; b=OF24CyJJeT8R58iH
	w8BMKHU7AVuj7IBfWA7+aF1MLDSW1w93K637as1xCBWheutodXGU2WvKF5f3Uf+Q
	J0X2Wtdj/ne6oU5oWhseU6ympGKihcmkjbUPlPBZniAIxSX5qHINcnoIAu5gqDcR
	+VFtM+iWAHeQzI8KjnMsLQUDkHIAqbiEtERrX+NbkHlFg/d53LLloCT7zMfjsmAZ
	DAxnspg460MiCk0GUxIzjL1XptcPRal+l3M7Xb8cHOIHu8bdSM+L1rTwDg8ynmxg
	R23GCEjSa69xofpCD4b7SlwlG9t03+EKAGSbzeUpCyV+cizLsBH5M1sOqhF3Q5qf
	heqZsw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj41f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:33 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70cff1da5so3439505385a.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837593; x=1772442393; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=iIXxqATRJRRyI4eOSOAjHdJmVqJ4lmr4osxC0eVrjac1M/PQvOQmJBdGer/UYPf9Wu
         RtcW8605crC6AABxApokJ/xife4FJF3I0LnlIY+jWnLSI0KCdJ0IOZ99SkQZPGzKJHhr
         mEfMqwFB6vdfGk7q/pQhCWBOrqwH0K3F2l2zfWG1/0OtedYUxE/fRVGRRTBPOaUXFvla
         3RpAyTJ/wFrzLO2IpaBSzvakrcPhPw+FGkzVw19vnKR2ofHycN9S9S0/4odrCALwbC1M
         k4SHdhYXYVKGFqMI5GuL4qYEZRtxpey1Yxvo2XEr1mOtct27r8iQjTzY829unmkblUt1
         VhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837593; x=1772442393;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z1s69ZOUW4W/eG75pyy2jJwkNoebNytXCN87O0Rdgw8=;
        b=vx/2EW52UfRcOo1TVZaZcLk3l/V7b+fYTjl4iHR41TAh4CYZz9idypDvW7BXUc+k4A
         /Wr27GAaGcP/Zap3XSyMQ4xy9QWHaXGTy//YpH6oM924Alco/2icJe36kfo9G4Ag2aZi
         IQKAhXpZfS6mitQzfVq3HygC1Wob8BOUJ1FyM2+RfLnrclJLm208h5aZKLCyTNDAOV9q
         I/XySuCwBA6rgEaYc9xdRn3f/ARYPhBR359lRr6rFwZdkJfuOees8eZzbpgPrRSjGEpA
         ZJVh3iM2HH3S+Sn+Gbz2LrvNM/hZUexQZvM81eWjkE4l1jQL531MjpG80mZeTygvMNdI
         l2xA==
X-Forwarded-Encrypted: i=1; AJvYcCX0aLhtHXaLQ8GvK9mIUyBWcET7FNsV9pz+KoyzcQOMqKQR8PNmN/XHmfkNBwrgGft5aGg=@lists.linux.dev
X-Gm-Message-State: AOJu0Yxn5nEEs2rWDepBvYQ5M5UnICtbOc4oOZhQgGhV/dAOCy4hs0vn
	dK0nvPG91lMzZTPy7UgB9dbitzZeyV8UTNPfAiiyfr469Ms2d3lzu/DLW0ZQWNQaDXOg28UQVJC
	O9/rqHvO9MQJ3aQ9cbX6QYwGkfxPu2jR6pC+RBmrd7IuvsRdd/UQlOT4=
X-Gm-Gg: AZuq6aKiqNCDm1n25qQ6tkzixd8///3mPVzeyvceQ0/fu8TG3kc89HeRwZTx51oaK/q
	O4qY1OlGpx1maHtglDjw0+Y7zH27ZHIJZtvQ7qvDeBy3HlyNzcC+kMrV2Cp7P0e/yyi+DIEZzB+
	vNQ1Vr6XhyMwCo8mFPMxLmLbas1AGHgYF/1HLoktl9npIe1xoHOhUuA8som28PLxc2XASj6Qe60
	HfDbgxNe/O4t+ASYEQNsmqg7czvvljihHTJWFU9sgm9Moz90fk+IVZP0LmRaAPXvwCA80PMOmsy
	zLmZKi7g2mTnLxDoKLfqalJHeSgpKktHg25TFM8wuIqRsGVTtGUalLCRLKIteHNQ+mVBEfb76+q
	RurmrqfMrqU8Ix7HlvNqrDahahk9ApiPDAE503CNhEETnPQ8O0lhN
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922171685a.35.1771837593243;
        Mon, 23 Feb 2026 01:06:33 -0800 (PST)
X-Received: by 2002:a05:620a:468c:b0:8cb:55d3:2a4 with SMTP id af79cd13be357-8cb8ca08308mr922166085a.35.1771837592722;
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:32 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:57 +0100
Subject: [PATCH v2 11/12] i2c: nomadik: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-11-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=984;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=GNCZSO1tofFVimQlfEXcivvHDvpWa5BaBkjqLZZcroE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh66xd7+MQZXKYUp1lof2Wde5NsKOrQrt95U
 eR8Ce2ipBuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w04VEACsdT4VCfUT8Out0yUzqZzfml7dMxtbxcoCnGY8tQLapaBzscsfnI+5Bu5NVsBjRWz2YfK
 GKz1PyQVjNRu6C8ehswM/RGsSkjYRUxZSTdjV631sUHy16gbpFobawG+M6magVodquPAsrG2efp
 fw078QxbHLsGtHgQUf3QlBUOhMk22ArZLQ7UVI4eWPuitiP6f64SssRo7tqJ//BaGhTLtlxLgt1
 jvZJM6D+hpoylJBTdwdFh3LNOWlNngiDMmXlJ+TYP7vEyQAHqGifdZcZ2gOjEZvuuGtO/lEw4zo
 SozwKRkeYXSwgcaSyFO1dD01Yswbq2jYdHSqqQ/U6ptyeOxHXTthssXS7L2LPdlo+WWnkUba/Bf
 4oG7Kg6fqOGDNbJAGQFzXbP88fe9GJvo21ZhNEA96KsQPTOoYosm2cONZstWSuGzQHRYlbRNoD0
 o41lI5eyWu16TVPGP0JRYBMjXMYTYSlhuH3hkyYXocF/XU6tyGdnIhI9kAYh5ZTFmS7uDBVKtYs
 9Tyx0EIpX5yv7J38BgWtyTxoLDGrIrU5OAym2Uw4iiru7lO0Rf+h4+zA/T/ASHlw7uHwH0ZBqTF
 evk49M+ClOODknfwmlUK6g5DkzMRRmmnMtP8HudXzwpA2Gyo6WgvZHRgm23knlsypDaTyhOz3PZ
 EC6ZWixHAae92HQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX0bzpoMNgzW+8
 SnfWkXatD3KLQJMhygjCCyYDAM86oxFC4EHbiIFZBwdnt8gDk6c33DmPJYAns0BBHP+MTToD1x5
 bxfgXRVfL5Ep43ozz2HVxEAK2DD7KFhJs7mO6pce+47vLBnsjVAW3fnIWftgoW5LGnFzZrqOlMX
 sLG9H89UziYE9TzUOjo5YDZy0O2bgFKDNWDoaOoe8u3zUBgd888Ddw0qtv2yjZMGh9eyrAfvjo7
 wJV74gcCIJDqcuAC06+RzK0pYgOfoR2O0WjcZ+k30Hq0Y9gMvt9ww0tTI0LcO8mkcr3ZEYocDrB
 tORPpvTZoLcIC34B+k+BrPtDDCCXaA32B9bRd3eY8ZJ/bNrffnt8Z4ltPFM080jBNH0OKbdHhrs
 QGKNm2QbtEQ193iIiuYKudUcNmuvaGlOAS3z2v6x957IY7A6K6O91c8wq2iy6C5opxAQyoDSf7F
 usKV9hchrdsLDEmIQaw==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699c1899 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=tIHrhau139UvCPJ7cvIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: VlOMPphRN-ba7H1ZKQZ2lBoiMT7BSArl
X-Proofpoint-ORIG-GUID: VlOMPphRN-ba7H1ZKQZ2lBoiMT7BSArl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Acked-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-nomadik.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-nomadik.c b/drivers/i2c/busses/i2c-nomadik.c
index b63ee51c1652080e414f4302bee16905914c1288..12b4f8750886d7f6f5b6027b00691240952a3694 100644
--- a/drivers/i2c/busses/i2c-nomadik.c
+++ b/drivers/i2c/busses/i2c-nomadik.c
@@ -1148,8 +1148,8 @@ static int nmk_i2c_probe(struct amba_device *adev, const struct amba_id *id)
 	init_hw(priv);
 
 	adap = &priv->adap;
-	adap->dev.of_node = np;
-	adap->dev.parent = dev;
+	adap->of_node = np;
+	adap->parent = dev;
 	adap->owner = THIS_MODULE;
 	adap->class = I2C_CLASS_DEPRECATED;
 	adap->algo = &nmk_i2c_algo;

-- 
2.47.3

