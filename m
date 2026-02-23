Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F8B235045
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853872; cv=none; b=Em6ycw3ij6KX8Oec+Q77N6axd3ZYlkvOAoa6Sh3Ma6jVV9JAWIqOcLFfZG+losmHbrqonunwnl6jykj+eDJI86QMbTS7z6xgCYsMY58Ahkv1SGpIuyOhstLq5o8zzvIQUUzAvOfv14bVhRYusD1k9xh6CzKbkonrA/L5zGV0aLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853872; c=relaxed/simple;
	bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=I0Zney8/2zEdGD/Q7TDrKVz2QFmv8YE9L4NaGxwNGv/9OtmijmNpDdopuMY2TjPH/VSY8SbJ7yXjOOfUgoc3Hxzbqi5uEx4C7e/pzcKrj0oCCj1Wa3fYSIyhW6dr1F9mrYlt/mQ+by514oOw+J7E9tL+NA8E3sHqKccXPFv6MDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FLRgqxU0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jGSSAZbO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FLRgqxU0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jGSSAZbO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAWe8L3698104
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=; b=FLRgqxU0qrr/Y1KS
	g4uJW9Ub7TsH+DrfVQsrfO6XZAdyrQrdQJoOm7AeUs8wALu6bDJFxZ53WBWayDd3
	LkPcq93G2tl0yx3e5N62VoLN51pMyZAtNgvQc81E+clOfGM2OFzQ1477+MDdVtFD
	8IeOwUTxvti1PBYuEbE5kMpMs5VplU7AkEryuZJC0oHYnfdcgy+jarbsuHXy7+si
	WVvrt3Tsb+Q6j4qUAHnU4HwFZvZg1RkAvPEH2m9vDhq4RYZ4gAOj9Nc4xax3AYO5
	T3+PpQ+figj+SRdbm9kDpEQKRP6NfHqdi3aqb/U5LeGrke0m5J+IDGCrU1CgLn2r
	YhP83g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn818fh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 13:37:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb37db8b79so1706945985a.3
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 05:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853869; x=1772458669; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=jGSSAZbOFmw78rcFKEO2dQvkZjuTVKihT9zD9GB1mmEAnN8nrsyda4h1ideVGAvR30
         6lCiY+m7aV6SwL4wMc8g9DbqiK/VvJtVHgxjAWImmWcaKhSjEIvJIlFvdC3zWDwbe0ua
         QGF1A1p6xm+MXwAfzBgVVyRvBQ0Wez27kAumzvDP1m8FE6q6cnUwdydYHzswW+rHp+H+
         mt+qjB6+EB4IsBNaBZY43uXfvl9XvidgioT8kywJN3FY669e17T/+lftLeADpdiN3FOv
         PRZkAQyRY2OkhhLSbNsUDkKOJ31CViP0ELNAbZj8O9bMnSREJIqvIiSUWpBK2Z8hdmPc
         QrBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853869; x=1772458669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=18vklP2raVReBlGkeSOqpVj0g8z1dYR5oY2LGWvx9zI=;
        b=kvfdtyHCzJ2+G/P1JHSWnyGHy5xo/nIMhY0ykOgdtpAhOzHxWhMVpR8AyInI9Tpe4a
         +OJfmcwYb0BjlEfoIrij7fBX9NSLYb6SFAYztWmPJguhtvInHAy8g+XcviKJSxJ5qMQ4
         fGkwvRRg1lRughYrf0tDmBbPoGJNxRRfOPCpPb+dxJvb95RT4HoEbwv6EkjMUbuT/Q+4
         HHdAaiVA86PsRqY/Jo2Del6vFuVaWa7fTgzBxJBQ7yEnYb7uQaAmomsHLbeLZvDrOyLn
         L1wUu5sUXRCtvkEi5fKsskHOzVIRPB8YhiSryXIDegknpfCxOUC13Z2F4wVQ2/YspGVw
         KZzg==
X-Forwarded-Encrypted: i=1; AJvYcCUnLUCqhVwjH6JakSffedpznKyEOsGGLR1JfkC+9TsPL6SUQNm6YL4MkOLlJsmpxvl6PsU=@lists.linux.dev
X-Gm-Message-State: AOJu0YxTdhw5Qqhc3EDYYmmBu9w7hxLibjmUCmTKYnO9K35AaWb5LH0k
	zyaL0hBhy/JbCeONCKHi3zlTg3maVvkpi4L8KOU6FhbLEbH1fmNBtx0pmYRnGKC8d+PHKpiF5kB
	ASwNnC4vRZ1yPZTIrc4dwU2P8Vla1dJLZo3MMSz+qQpt8LJe1EMcGr+g=
X-Gm-Gg: AZuq6aJEzQpF0rp/ETdSnLKTG/dICWEnVMdDM2e50zuLBgUkl0lFCVJdICkXfJQoYyY
	xd/GrktP9FL1hiyG5r19yASTkUiggeZOsmqXDxFng1Imp32ukNmMCr3YUNPwpXFE+7Wd7HdryRT
	4+gPStDV9q+WI+qMT8rguLXv1ej2y7aSxheexu/6ksOzE4tD8A7n1tm34mr3FyFuRpOmWyIUuxu
	V6ZQJsi9jlOJM8+0pTQuPJcbAhCCc6qZ/z37abCY2DfS9q+dEig1RNdZLcoeFmXHKzXKnCewilR
	wYQ1CwcbykR4OGAK6F5XyNabWLkcuI22ZBHZ6eb7SQhCzWqXAXY5JwOejhcKdTqp6ufZ79VsUr1
	p4zIaXIOdgCnGsFIoLvRBin2fntpLZn2avXTNB8cNUZkt7JbK54E=
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118016585a.31.1771853869217;
        Mon, 23 Feb 2026 05:37:49 -0800 (PST)
X-Received: by 2002:a05:620a:f0d:b0:89f:7109:185f with SMTP id af79cd13be357-8cb8c9fe268mr1118013385a.31.1771853868814;
        Mon, 23 Feb 2026 05:37:48 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:47 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:18 +0100
Subject: [PATCH v2 3/9] base: soc: order includes alphabetically
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-3-b45da45903c8@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=wW8xXPxpKDmxwgZvpOfgeQnchhB1uWOF7QOX2KdsSDE=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGmcWByg57Obv99hS6Oh69qse1rMhM733ND3/E5jFtmsA2uzU
 IkCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJpnFgcAAoJEAWdLsv/NoTD9nQP/iPx
 B1jGPMqwhkHEFboaz8rKRAWDcT1EXyqV3r8zD8iUz1itnruVo9pkg7K0BTyjjjY5jJXxGEUDyln
 5VoUzvDH/4UR2c9L5gRSHhIlCNZ/k9h8n8rgrYB4Mw/4uOeUYVbhVorTpB9Bodbet2Nmh0WNRme
 iE1SrqmavcP+8nxdt3TosgeYOpFlYPS081Q6+PesWWEVMJNuARH7Fuu2cEZvFsCdPsQciNidWVe
 o2v6Sku7JRVbV3A5H/WE1A4N+zumd5+HNWXHGCLD59q/bhf3oiE9utrugRe+YNQiK8VDZ//nxsx
 UQHrtF4bWww7nKIfFEIuneWOLnbhwSMfjhVQ+7IOqvIkP7FifK6T7dxXThCPv1DTl29ZC7WlyA/
 +P+f8FyN4RpOjggJV12eAGSlynnlvk3mI+Ht1EMz2Rc6+a6pCsquzO0s3U6ABvvA4e9gTAGwOgN
 DoLLxLkJzKFNpXpfqp2zv6cMc+ESwl9TpcUSwChH6WG7yBbwAFKI9e5RRq+dNjcabAarC5DnVLV
 HxznKM0rD1zonz2rKdFy3LvcKc5bdjNY0RrgCDkOo8ijSqxWItBb+JBOGz6d9qVHLf3zrS7mUrb
 6tqTLtWMrWS5wHUlWC5rlXEDZjHx9qFqQZDnLOv8xP45umlVi7iOdAAp81H3/qSBWTrLDPe+Vz9
 DLrZp
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: K2CiZw7_0gjvhNo66kPhBr3rqKRD0quS
X-Proofpoint-ORIG-GUID: K2CiZw7_0gjvhNo66kPhBr3rqKRD0quS
X-Authority-Analysis: v=2.4 cv=CbsFJbrl c=1 sm=1 tr=0 ts=699c582d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=LcgYCWfw0sZjbfGval0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX997l45yodx/r
 peaAIGqghuxocVQk59Z39Sm7iKP3dg6lLUTAX02XIz2BWMDHjEnE83i0Ok5z95qMCH3kceP+/Cz
 FjgUG693w1ujj2qu+Jim0mizxEoGe6zag6TY6Pkp8Hb+ppWRsCtNnyEMmOkll63sWTrenjf12HA
 K5i+sOSkHBDE8Fkoy0xGQNMTtAyOrRMoJlPrM7md7GLuTofX1RH0M/6wqa4sw23/CUmqVGahAjd
 m18suEjbzBryoMwnuD2pubdvdwjf78bWrUiGnTA16g8xLGoN+snnGf2gz9zuVx67QjRrQJSg2QA
 XBPGAFbB8qHOSq8qSFTyyWPnNOKmS0Z799AZ0tjxDR4Emz0p/h34hdA6P4qgEwQN5V6YGjIXms+
 1SqezP8Xxtrr25fTHtNlBOosdm1/Y5LBGrVFzR1nXMJPljXUPayigSCfzvswIQthMJLXjZzgjYX
 qOzQNXyDXoh9IxVHCvA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230117

For easier readability and maintenance, order the included headers
alphabetically.

Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/soc.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/base/soc.c b/drivers/base/soc.c
index c8d3db9daa2f02c93aeefda9dd9c5ede148a676f..48e2f0dbd330b8d402135ffa7308f454eb4ab7a5 100644
--- a/drivers/base/soc.c
+++ b/drivers/base/soc.c
@@ -5,16 +5,16 @@
  * Author: Lee Jones <lee.jones@linaro.org> for ST-Ericsson.
  */
 
-#include <linux/sysfs.h>
+#include <linux/err.h>
+#include <linux/glob.h>
+#include <linux/idr.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/stat.h>
 #include <linux/slab.h>
-#include <linux/idr.h>
 #include <linux/spinlock.h>
+#include <linux/stat.h>
+#include <linux/sysfs.h>
 #include <linux/sys_soc.h>
-#include <linux/err.h>
-#include <linux/glob.h>
 
 static DEFINE_IDA(soc_ida);
 

-- 
2.47.3

