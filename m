Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35DDB34FF59
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837591; cv=none; b=JzYnW8PnSUJSfaHk/v1nKuek7DP4Guh8K5TYWYGkCDdlAkxjK9SjiSL62uedv0qLR7iiCAUeOEP/a/nUE+n3SjQxa7JJuBTTIGh9S3ve2kqWlEpRbjXfSJk3qCUdYpKkO2eUxbNPuYGs44ApH5za2tzn6QGAE132c2pW72KVMF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837591; c=relaxed/simple;
	bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uwADnyyGA3tbkK7pd99R+2sx53zcQsRKTMD2/jQUlhUIQJ7NOaGbZfCB/3+uac++X12u3iqyOK88QDOt0dF+VQlLGcbqWDUSmpb/DhY2QsHL5zUOSkGeQuJIzJ3FVl5ow0Tzz0VqelvKFD7AfKaUrdgacGFwB+JkmN6lQuwTNS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hAQdRWvv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e41sMiOC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hAQdRWvv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e41sMiOC"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N839ct937354
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=; b=hAQdRWvvV0G+NLiW
	MEGF9Jf95N7zQMt+9m5bmPGFLSo7Eu9+Mt03F6fs+Se1rzZb6pK1IW6IfRGnhR1Y
	o8ODSwJeWHfhUQUeazDO9mCdk9QlBo4vAeoXYSwgR0uaIuKCxeXh9bFuQ1eLb23N
	KDcGNM1YBpWlOOSI87m3Xfjb8ZyG5mxvfyVWEEZEWgqQboKe9MTk6uJhXGSORwts
	sNYIDpmBhp6n2XqiB3YvgX3VwBIC3I+pZMDCysz0hmBryFQJxW5Ni6liSbnKx2Go
	aegRmaZmzQeBegQGQEYD2xBPgA6stAI4RC2dePjjcbGPKQ8VRsE/OsSEjYVyiwuS
	WdohNw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5wav3d4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:28 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-894a861fd7cso527017236d6.3
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837587; x=1772442387; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=e41sMiOCIG/PrHiwxQKstxyYa03ZMbgFw9vdWDjwPySyxMCz+QUYKuF3KcK+opaYMI
         WOB/DuNDENwNrB+GQ5oMbplnGqTAbS+6L0vtpn3cYLeFKsSvUrguJm8PN84qC/EBcuxI
         3Ajw4wr+6pHbG3RfLSfj9lJgkDiMIK+BfqJWe7XYz9HpRMkxiCHPTgL3pGlpdUd6Pq9F
         I75doXfX4rPSp6y8BPp6E8GM+79/nb43nfKGDOO+jOI8Q/T7rtiEzoZkN0aRsyfC6jhk
         Ze2gazn/nWVWktfz7auGn85G81gQLevbIO/xogJurdH/Y+ylr53rATYhM8io1JTvH1b8
         DHRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837587; x=1772442387;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FyxLSzBCpAOYWjHIriWOLjSl7tu83i2BCeDdIz9SsH0=;
        b=YVuY6lMDiRUHNk+qsmFElrcFJR6IcmGlbKanWfOVTfBnVyG9q6I4/+ObUJ6c+u4brF
         Dn1T9oWa6SIEwHAxdiEm1sGGQDE1dOxoBv/S6FLuM/mLCvK4iB4FirEE3me8SpGxY6wJ
         Lna1uL+I9YGDja5cHpwotx0ApZQRK5a7RZGoMBEqghXPLXRUM+xv97wVRzZB2/AEZ8DM
         ZC1qIiIVyEv5Ek4rKhkAAMcfo8jA4qHBxtLo0w3lCCTqQNhCo/BAjIUNRtd7jPZnXGeX
         T4EKm2j5a7+pqz47rqzTHPUqlSCX5JqUzyNxWEGkRJ6GuKBrG1rsV+Pp4oHShTXDGjzg
         EAAA==
X-Forwarded-Encrypted: i=1; AJvYcCUjuKihS7RCwk8NcgFkr8kbbW9SJjNVpAYSwSwdC2Jf1t3TCiH1rOMYF9+MPO2VFLB2kQg=@lists.linux.dev
X-Gm-Message-State: AOJu0YyA/nFETQjWMK6JM5X7u4ckzpBLu6SsrPTWFE9eC+40C3JR9L9T
	Xs/xjflnSHEeAq2OgRbuOpWskYcowNZpNjSlQcbAA8wEkhlieOFWbB1gwDZk64zmQFMd4XOQN5c
	eLMzSDS/PMAjNQZ1J94CDBKh2ONio6AkR+MO0LDY+ThAjn/2IlB+ljzs=
X-Gm-Gg: AZuq6aKy7j/HuQkKGPrgqhcrLNqWLgPuk27HXQF8ZkCFtS295YCOKq7nmek/mOTH2TQ
	4qZtKN/rDn9Jhnv9iqOJUjm4rHQJqQDAJxQ5ds16A+0Bu1dNAinASVyXCYKPN/k0uDgIc7/cWwj
	hQ//aePYKDMOqZT+NyGdLcbUT6+ispnH30fhvAwmtKbVboXMpxMu9jdKfr8n8I6gpJuaIO1q6mZ
	+wQblLbloZqn/99mjB0Jmj99sPMTh8dk0Fauu3BzOngxMWZVJ1T3IvQU5EwvozJ3P4jQbGwz2B9
	DR4LjjnMCyWAzMp4Ixnahd0P7+pAztPFlufwik5KQ1y38dhOiB8F7Lp+HckUeuoObcdtw7/iunb
	az+a1wedh08iKnD/p21y+GrCaq4fDDbXsuA3L+C+vNg4bBRSOw5/5
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922889085a.14.1771837587497;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
X-Received: by 2002:a05:620a:4587:b0:8c8:82a1:11c9 with SMTP id af79cd13be357-8cb8c9d1dcbmr922886285a.14.1771837587053;
        Mon, 23 Feb 2026 01:06:27 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:26 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:54 +0100
Subject: [PATCH v2 08/12] i2c: mxs: set device parent and of_node through
 the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-8-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=988;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=iacvmP5MKst4koF4pQzdNY4+k8gIR/r7nU+j4v1o/rI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh46t9YVusxGMRyOKiO1gXCj7YchvrY73yIi
 M9XKPAvJqmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYeAAKCRAFnS7L/zaE
 w1f8D/9Kr6cIxWLtSoo/iCsrKZvQ1AH7s9U2qJB6pL13Bs2n53X6os+fQTcQ3mW6OqL9+gW2IBO
 hKJyz5n049Yg9UAulAPIB2NwtjSqS+2e3S2e4+YVRmkxHqOdSYiUcQiX7UKJQU51B0sRz4x+Jsy
 j3bdNkn8RXeXakq85CDPNGeBlub6cxzXNysFXSejcPM9tA9av5dQSSq3w9uAg6Z6JlNv2rkjfbO
 Mru0GOD4rjDb05x/1ld6B71rL2iqeiOY6LJ+5Zag0iNaqwpIroZIZGRg8cnygQ3av91fBgclbCE
 wdt/NmYrtU9IIPBwJDv3Jn1NbLe2TjwYYADsuEGwKC2OJeadyxdITubVzqMoZVdr19TWwEhMjVQ
 AEImAkWG/9zFYjU4his2ENsP0xL/V2N6R70qdXddM3VPqQUOnpD595mWRSkqQgIfVG47kt3SB7Z
 8N/tLHhNvG6+30lNhzc/F89tdmILZIhk0D15gcNcWaJ90xx++Ua/MCzmp2wD6GDTuoHkYEt4hXV
 tO1YDz8vjze5y8gIf5ACLG3claNn3De8Yxn7RhBwfuB3pg6YxMWkplKp6r2GbZJdQDHEpWdLJEL
 owN4Lg0hxbwpY928+IW+n+cKYnIuhUEC+JQbKv8kTubPpXwlNvRuGlvIyVrD413i2bk0gWxDFCp
 W78klu2oVB6AoJg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=KJVXzVFo c=1 sm=1 tr=0 ts=699c1894 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=ZBRMoY1RY0NPWYz5CrkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX/dkC7Rz4SkdT
 VSGL5XQzLplnCVz6Vy5T6TyDaKJ83Pv1FBzNenmHJRmfl27TQ4csfUkqRxriay+FxNi/SlGmRMj
 mtRN5VYkt4Qbo1kcwpZkG1SfHAj6SbgRPwW70ZXpCOAYvwT92+V28Ya8rLUwd9VAbSbpVKRQ+qp
 4y2HZjwZT5NIB62MHNYDTo9msYEJ1xj+n9vGxdKmPVYrLCKSgGer4670tL18IEBtHbu3+NlM07s
 9QGOuimq0tMC2ZzTBVl32H63DP610Aw69KzyeE09unptE+OPWh2OVaKT44nf97EY37RLMSbJX70
 Nl7SRaKD2W4SObQb6nmV+gI5Cd19Ddvb1vipvU4u8cdgLvhaCli1LjNN0CgYkl+7oTjH8Foq2GE
 MuNIQuj0aGSTZ2SLi6F0Vdq8Wkd0nJYZ74K4i8C1ikBxkeUalJcGEscU1EhPN/GjTAyBqS1KVyF
 8E56Wn6PtJBxPb+xd5g==
X-Proofpoint-ORIG-GUID: R9tRZHng8PN_PUiJfzZqybmDxX2knoei
X-Proofpoint-GUID: R9tRZHng8PN_PUiJfzZqybmDxX2knoei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-mxs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-mxs.c b/drivers/i2c/busses/i2c-mxs.c
index 08c9091a1e35151bac8d4adb80abdbd29a62b95a..bfbd96ee2f483cd1dd872c3448eaa6a17940d70f 100644
--- a/drivers/i2c/busses/i2c-mxs.c
+++ b/drivers/i2c/busses/i2c-mxs.c
@@ -849,9 +849,9 @@ static int mxs_i2c_probe(struct platform_device *pdev)
 	adap->owner = THIS_MODULE;
 	adap->algo = &mxs_i2c_algo;
 	adap->quirks = &mxs_i2c_quirks;
-	adap->dev.parent = dev;
+	adap->parent = dev;
 	adap->nr = pdev->id;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->of_node = pdev->dev.of_node;
 	i2c_set_adapdata(adap, i2c);
 	err = i2c_add_numbered_adapter(adap);
 	if (err) {

-- 
2.47.3

