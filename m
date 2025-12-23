Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75734F251
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484315; cv=none; b=BMtDFwbVdfUhsV8xJM7YteDCejRyz2etr2IF8HgnrK3DloevoW50msrc7m3hi3LUpd04ibgjv2ddEQHidRhlrqjphyiE8tJMoKOWS1bhedF8+Qf3LDxqZlPg0DTsxJQlToah/lzWV3nBYvMWia0L2H7BtBjcfP2jklxqJcis3RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484315; c=relaxed/simple;
	bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=H72SL5lvjRv5IbCPQoebDHNlIJFQFNzlLPIUHMOjw8XwUJYrVIc0LJEEjcH8nTD/TEq0HoG/NmyPawalWeXp/oapRVca/7mwDKiqzqG9+R2sqXd6WsoX6iF36q0J4iBDU9pOw6cgE5lcQ+rteRFO0pST/yxIQeV11+fjObv39hQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QAS4G2Q7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SAqraYQn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QAS4G2Q7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SAqraYQn"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN37p4O1569209
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=; b=QAS4G2Q7io445Ezh
	nAZ9Psw1yyqhWxNa/qHtPQXie7kitVAgyT+CqzSeeZd0iOkz1aOxuiT8VbTsFBHI
	CQUPFX5anQIUR9+ZSGpxbhRBiKCgBsM9fOBLFCJiBdJ6u3vMjSHCPlpJuqnTu9Y0
	8F+M7oUx/otBmTR14/BeueEo1srl2syW+BYtooSexJ7gYvdKlZ8ZEYMOJjsvk4w/
	t4+lvmcV6zcYiH4hvBANGvjrNxCmzEV+Mo/MQYQFwxetHvOZBkNbDd9hcRYsH8SE
	0p5xIzc1vueS+ubQwjsLfGbCQTsKjbnfc3CsWqGTQlWtWXDI0NUHhfa5a7HOrm+2
	LMWJQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy37g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b22d590227so598350185a.1
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484311; x=1767089111; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=SAqraYQno+yIUCp3ZKdCrMqab4EV7LxLsvERXTgBsbH7Ga0qIt+zzhfrxkK/leiESV
         kK8p4ErBxplJD0+EkbSMkrGR5LRiyn80d3tPX3vVrk/W/li8WXuhRmYC2tOvym5FqZs9
         cUkAQLf/wnoqa+o7x9eJOQGsCcgFvEoKXTDcD/j+0qd00LzQvIEfWc0VO2isjxzpQZ5P
         KdBfzJE55lGD0Lw2E5+I62OCyBdTyWAkqQHodWK1q8RsuDNJtcYapIvl3Y75N1hrLK/Y
         ZL9M4apE0meO/lchVytZRoOf86j5CgWkSGSMJXh/VOEW8qFzM4NIF72ZdoVCTY3mis9j
         6ccw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484311; x=1767089111;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VESHsWfPvaoi4+tiqe+hxrug8kTFVaKspteSAbY4EtE=;
        b=YzTbc2neWQiGKvfQQNBbC7Ezb5Nzza2LhljCrMMKRXoEVJfTFbu7J8kYvpUOhA4bSJ
         oeFaj/zlmHYZZpf0UVauzAXtgAoSUIhIpqLHFxniG7nnm50jGChg4M/F1fgaDL+aYcff
         StpIzb8zDfnB8I1OTztQ5/UXWMzeFh3U3EmyXvlh1e2a2emTfvA/5v7IVSd9WL8kBqyl
         8UT3dOnptSenf6dGUN/9WGCQ1X4vBDYjPQBnMIQUeJhyFNTvlwdSYky8CEwlLd6QBCcC
         HCgKnI/TaWwHQw0Jq+pN1VO0bPA9YykLy17OSlTujyLFPVsVw+hunRDtSJX9Hk4tV8wM
         aHRg==
X-Forwarded-Encrypted: i=1; AJvYcCX+H8BlgArDAfdIl05+Xjwy3/wmXozMr1dKHe/PoOQ3DUsnO0VGCGbs56wkGIb61a7/BrA=@lists.linux.dev
X-Gm-Message-State: AOJu0YwGaTYPdmqKqu0m2J7I/UsusaDbJhQHBaZdqJ8IrNzC9BeGXOrZ
	ihXZRzPHUQM1C7RG75mqjnbpMB5Q+8hQ8HKirERLSORfMaPEpP9oC48qffAAp7IxiPfr0FwzpZX
	+wcyUdSfnA6ftt4DMlit2KbKoC/nL/KJLNeWJoei4CwE+Z7HrDxUeWYI=
X-Gm-Gg: AY/fxX7iCZ/IbwATWgdhvFc2Dwg5ut4xfbM+zeghpgVxwN9nNZxMG99Dvf4RNz/V2U/
	Ma5Y9IriyNTgPXi/hLslxaVJFZpjhyRuNhAaiB70TBPuLqkJyR2GIsSwBN/JanPHQITBEAsS9po
	SbzLa02laV+wztsmCI4bZyACg2mlrY/zxvsaulgeF3CxOsrLcl+y6tiEZMzM7UjYYBDUAyLrsuc
	DI32eIGefWcoVD+N4sTCdwxJScwi9aJteQ/o0eBiT2gFXJ7D7+Aa3jfw4STkQJk65VyK3p0nPG6
	fnvXmqWzSNal6dV8U4W/idpVfv7OVCjKT13VxYTh0ZPgQps5swCFUO27OE9hYXGVDAd62BtF2JJ
	jd1GghnOxBfILgcB6aXgsATQvyXtr+uX87B78s4w=
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221784511cf.1.1766484311431;
        Tue, 23 Dec 2025 02:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1Q9GcA/8ICDBh3b32h+BDN0dPrIAIb45m474a1bZscaPBYkROzgBv0H89r6pe1f5PLFubmA==
X-Received: by 2002:ac8:5f84:0:b0:4ee:bff:7fcb with SMTP id d75a77b69052e-4f4abca9abemr221783931cf.1.1766484310894;
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:05:10 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:45 +0100
Subject: [PATCH 07/12] i2c: st: set device parent and of_node through the
 adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-7-4829b1cf0834@oss.qualcomm.com>
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
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
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>
Cc: Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
        linux-rpi-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=939;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4VTHCgrPHZIkSmUOibk7Y1K7i7wyCTns8fIiAuDUmjA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmlCfBDo9ayd5xJjNDefHMY+MeprfqWaGSes7
 X/ntmYV6uWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppQgAKCRAFnS7L/zaE
 wyySD/91tRc6qmcix1iUN41NkqvYaKWNZg7twzSemJ9R2CAbmtrAUoDnzD1pUdkhNQsAGQjwWFH
 7KmtVJYSWxgYWGsbmV/SCfiIUJRRjJoE0n7r3qa3R4HQBgZxAs3MPaVfs9aRMv4Bl26cnJe7Hh5
 BntwjvHXdv9BwUYUD76Fg4QDnT8OSycLzHHH9IHBSM2x5UUQpfTSy/yEvhUkU/SrdLisOk05l1j
 pyAuS4c10z/zMyo/Auo3Q2ovGAIXnSKI6YNh3helH7rDqCxVzTw/UX7j50/g//wpUcBu0gc606c
 LVaZgCpeTQQhRFD+i/haihsQWmCrIODQ3ashDc9sGKyKPWD49M6AsEEtsuasqO1Rx0SVKM1WwEz
 WYHanibvULvtfiGMUIQLziMHX0YFWvBAJlzcb4xpNuKHgAepDUzpimIicEhTJ9/EdFG3EDrpj3m
 MZ4jeedoXkvHYeM47k0xKoblIU9VoT9bdaENYwTDEfm+2tQz91bdN1HtmzAHTIjLmt/NaoBCyVH
 s0XXPQiJIewHbvOSWHPsc3EzJdUeTsDyPVQvzuAzADKipCiTgUxT2k7Mxzq7PNgIIQYwKXukpDG
 Ji7S4tEPwKd82IgVyMgNEg6g4ekYQlegH+ITIJxMIrqOfBl3UV7CpFZQL1AHCGCKQO1TOR08/eC
 q7hOFISKYAicpzg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX9aLagf6pVY6C
 O4x97V20iC5CPpr7HXlHomwfG5kjColBU7skJi6cJh9TSvOKAPB4rNblZV5GheGMKR+o2H8pxW/
 1z7e8RD3P7zMnOBLMncoYTB1RrQ6udxO+dqPM9uV1RmqpZ8XoZfhbQAFrFfpYtQyn5SZi823/bp
 yhEisGHkBKREFNuBr0eTbK9PH9uBLcjv/SPK+OaV6kS0du630oVTGQuEKR/HBRD3vmeWjt5lVW5
 1JDTB1rUF3FJHtz4jBKOlI7WMBU9oIExu204Vehy5+hLois8dx/ZNEXMv4fePbaadqfO7ldfjQz
 inFN1vd335IVCWB4rYiVd6kSK01GpIkvEHji2ShUIDICOILPeBpgoMt4r2yoAYsXgrUumYWBRQL
 rfIvYABEbusDyRuXPFLMRosKwzziMBx3E2V6NYzCRbdJJMdvcouTyB6J8yXmNkyoZVyTa+9XHwj
 tzLkkp3OsM6pH8Zun6w==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a6958 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5jvZOilLG3lo3iFWl1UA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: n8DQxzqT2xB62ySybWZmTX7nv0BqKX9O
X-Proofpoint-GUID: n8DQxzqT2xB62ySybWZmTX7nv0BqKX9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-st.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-st.c b/drivers/i2c/busses/i2c-st.c
index 97d70e66722706f242cd97153387c3a865abc12d..b50be2c39eaa4b9b95a71b038a4d63f3c5fd7c4b 100644
--- a/drivers/i2c/busses/i2c-st.c
+++ b/drivers/i2c/busses/i2c-st.c
@@ -849,8 +849,8 @@ static int st_i2c_probe(struct platform_device *pdev)
 	adap->retries = 0;
 	adap->algo = &st_i2c_algo;
 	adap->bus_recovery_info = &st_i2c_recovery_info;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 
 	init_completion(&i2c_dev->complete);
 

-- 
2.47.3

