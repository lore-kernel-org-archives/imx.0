Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E45A635B626
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837602; cv=none; b=GpbTzDMCPefLT7h1kA+oIRwHAmW0JP0YA9elFTuHmFwoj6PoCQbj3TdKEO+u3zDE0P1GrJ08b6WI7lr5XCIyKwBw8IE/zUA3rMvEQ7NvqAeFbxeCyrj9Orxp5wnXFppwtlg18QtXsmUDQXcWoCYtpVyOkoEifVVG5s5wQ4YEURQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837602; c=relaxed/simple;
	bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Idy1WwpM29DRn8XRbJehRfpJC34x9+/P+PUs89ZFHcznsLbW/CwzT9JNX2PJ9wowj5uqIvsV8aF4a7r86Fg87VpKcAZdspGU52vCtvLG31ZRMSE/PXGfZ1zchc53fm0q8NEZmpcnJimrFkOMMUgrqiTeW0fVvihOKz3mU2w1aGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ks9LgQaZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PtglNSQL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ks9LgQaZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PtglNSQL"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MLr4mF1378896
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=; b=Ks9LgQaZ3rISUUiB
	UPhLyg/wvHNrMuQ5MWGAkiHx0iTOMmkXYe3Oz/aqmkvOAKX51jAY4jDR0H4ZoTL9
	u3f8F9FGGFVb7seJ0dt4qNmUb/HHrL36jZ2fKTHhNqsTIv6HNKltCodV5RFZRSoF
	IeGKpz/KS4ztmolA34vbLAiIibrhLpIcBlIHcGo9llC5ajpnrOWXzWr+PkFnC1b+
	9g6P/WEhspfqn4px8qqJ0cmtjRLXgrYitdoEVqVNtMcSPtixCMNKxHw/10/QXYY6
	hV+QRuOd+9Sl3vBXhlqaFfuKPPDX4cVO5T5OpDBDeiIGS9wYL+6vHU35jWCqbSw8
	9V6u8Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7v3r5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb3ad1b81aso6422649485a.2
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837595; x=1772442395; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=PtglNSQLFT5knbQW6BKqDg84UZlOh0H5/YCYI0a9ddpWan7vccvTja8BFLmfmZGzag
         dwfAQsf+uPuj2n0Fbrs6ffwq6f2TCqPs/tkra1a1TCy3pmyP/9Xjzy7vhSxyOIRbV2hh
         HKHooCTMs+YzHEaWWu5Yz7YemP2A2ANG6mRfC3nZ/rTh6bVAgzLkFN2CSsJ1Ce+SwIP1
         WeyucLKSqiT/DAca436UOrqVj1TgtyvXmrZKGQ7DP/tj1L2b6LpACgQ61wl7LhJGlIAw
         eh2Nisn/DY8PSmyOop9LpuwCi+5xsfzGwzXrqO2j5ozVN+PKzWRwXvQq0KtAAzZY/z6A
         +Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837595; x=1772442395;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5Fj+YoY3aFmHNkVAQ1kxm2aXYDxfPdFiRa1WlYNrDfI=;
        b=sRZ5b6gsUo4vhavfzlxYmX1vZZ3eoSD1BGeCkCTFij+AMjPj6WWrfDAq0yT5qzB4wY
         v+fyR9o0rrP4pcFmdjBE9HsozXBjp79al6NEKe97edH2ggzrxdl+mzNb0ExTAAttYThB
         UjQBGsSTLdT9vhn8OeVPnEhWU4F9cD1hMk+5KK82LHuOvwO9e4Ep67WCHzb760IxtlVr
         KG5BnzCkqSX7OPntPRwZddqTHhCHPGH95wB03Sc3u5uXk2i+nURHx07LMIQ/Hq+OnkK2
         7XTU5jQSDWGnzMMY9KWBvDawUY0GLpq0OnC3oJpR3qUUF87APYdNVYSIIJRJey70I4xx
         FcPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3KjzA1MWTPYq7VY0KGme5fYKpEOZdDlU5H8X9Y5dyvfbsVSROMFRVEPTQGWU3x5TGsmY=@lists.linux.dev
X-Gm-Message-State: AOJu0YyCApUNZ/Rn4HFpUvFJ3MVa1YRmC9xcB31AQs307tvEHjvGIY6U
	utEqBIqaZwgbNxJLM27reyIDmA24+FbHThbDENk8ZInklMBeI01fpmM+20ympYN/b/MHhwvMt+9
	FAZXD1MlyTgcsuLJQ8ZhpxC82TzPI/bvkFj0NkLHUkeakeidSrFbktn8=
X-Gm-Gg: AZuq6aLKsfy4MyrKDcyduLkeeYJOh/iDp5B+Gc/dzuuujdqdDztcapP+AJpn8/dJf7R
	Usu2GrhNPOTOEpbaObQfZQ+S0BRFAXVxsSv6ELNaodt5EBB4cRv1tua84ex1Qw4MdfxjnOP0KAM
	XNh2+7EmIXJy/M8qhbLJN63Oh9MP7M4oHFYedIEB7sLYj8diU+celcP+IDNiW/C7zadXWt0SxUO
	GISwYKs2n6Rukp7bdS1XXPzbcOpAtj4DGB9sszQxjVXV2+VBsuCfRrOQYehtKhIoGzCQ4FTIpAX
	i3MzYbHGnjtoP0eGxO1lkpjgvCuoUu7iGctEgw4rzXzp61uXmdDepMp7DKpDjdvowR0ccqmsAnQ
	Qj2+vnBmgrxGe/iIF0Uj7rqtKBkvp2Q0i8KVnxV5+0TOITMym1lI8
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764191985a.15.1771837594976;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
X-Received: by 2002:a05:620a:d8d:b0:8c9:ea1c:f218 with SMTP id af79cd13be357-8cb8c9e009cmr764186885a.15.1771837594436;
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:58 +0100
Subject: [PATCH v2 12/12] i2c: bcm2835: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-12-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1023;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u9n9l0NVttKMXo8Cm/QnZobv6JruCHoppeN1fvpKWko=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBh6jRDDYe/3k1buXIvSNZ0TnkcrKdAhpsYOn
 u3Iy5X2HQaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYegAKCRAFnS7L/zaE
 w/fxEACOqkkkfaqNDgIlMNMHdbLfBNUN+gmyyErH+9RBYgw21lotLXldvXjukuDR43t7iBhEwQ6
 v4RmssSTTIPx1IaBN8RKqSTKhl9DxJTZoQG/RWkex+IXlSU6aNk/eapEsQIS/ImmReGyQbGzaUC
 7BGuDxYIhXrvzKsSOw1FzEhWWbMSZ4mtTdk1CZeUrsOGpc4smvhI1+XwAzfjXYf65/NK5LMjc8l
 exdlUnuKLFmfZboiBNCo872Eq0XM7NQmb7eOa67A2jpyxL3X9WXj2R5d1/Fr5IMGeWkZdnRpjSj
 5NU+AHl99u6k9MDIpqfSEV1EeSM0vmqqL/8Ixa1LJa7BDu2RNTN42T2+jCzGg42h4AIkgCTP/dl
 l8qVhh3hgMSHhLhJM9H9kPZwlvkqzO1eLwurRNKpTgz5jOjqwmhiOYxEKoxyr8+0J5LD6n5NLYg
 ZSNAJM/fPknh9iPDrWlWBHqxOKOSrZnLL6HXgCJ42zZht03ftuKgxXbEtQOCU2LIHKaePurzFUH
 3cKffAKB4Yo8oDatXqW/WoQ00bR9iDb5ms+rU2bXP8WjcYq5y2u8vrw+bMM8L/ZuzYmrOzIgmO0
 +mvyxeWTLzka7zKtqqCtpQUs7kT8hJHPP/MEXSqM3WPFQz0WeLm45y/8qDGNiDy+7ahzeaOkzbr
 cwHccInIQJYdhYA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX/LLCIFwpvIRu
 8QwAG2LCDgQy3553zGf7IzUa60ikKPmqNCNS6MtoaTzRyJOAKW6D7tGgHdq3Up5CF+ICeyi5UZ/
 pnyYdLQt4eaN5vWbiXa3afe3PBUaXDEfNqo1GUsN8CHF43GFqINTt2CsxOno9Hczb+5Ks6u8Q5v
 EaiekB51GlCea6M1GduLBsFeR66sfnqF4sxdD/hs5NQBMEXKbzKULKRh78z7kuFJBip3PelFnGB
 fHcJElG0Z/WUzPmHfwSNwvR+sjSAVJFEShhxi5+GpF730UJeO5XSG6la23c7D7PC9kJ8drht1q3
 htYjKAHaxkXaCNd7esMVTpxD8dUWGRHdNZWihd56iTgoz0a/Z9JqsKbeg22HZ6cYrWkb36GqXin
 iG+j5w2Gu8sCGCqhv7hFtvX4nJcXWAGGgxBM51hXWxTYCH6FatMUYkJGASjd/hejYLYfXqj7Qda
 kn7JUd8WsgUiMZ8jwrw==
X-Proofpoint-GUID: f-alZv47IVMCcMIw9L383bdwp_rZTfrn
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c189b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=w6fcmXAubz_WdynIYoEA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: f-alZv47IVMCcMIw9L383bdwp_rZTfrn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-bcm2835.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-bcm2835.c b/drivers/i2c/busses/i2c-bcm2835.c
index 0d7e2654a534e92a529f27fdc049812359678522..4f7e4a178b33fdd172657cc625a34018b18f88ca 100644
--- a/drivers/i2c/busses/i2c-bcm2835.c
+++ b/drivers/i2c/busses/i2c-bcm2835.c
@@ -474,8 +474,8 @@ static int bcm2835_i2c_probe(struct platform_device *pdev)
 	snprintf(adap->name, sizeof(adap->name), "bcm2835 (%s)",
 		 of_node_full_name(pdev->dev.of_node));
 	adap->algo = &bcm2835_i2c_algo;
-	adap->dev.parent = &pdev->dev;
-	adap->dev.of_node = pdev->dev.of_node;
+	adap->parent = &pdev->dev;
+	adap->of_node = pdev->dev.of_node;
 	adap->quirks = of_device_get_match_data(&pdev->dev);
 
 	/*

-- 
2.47.3

