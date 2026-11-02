Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793620144;
	b=ClKsvqrOPmzTLT+V1ixWhFO4+e+cCzmABKMeLM5Ltj2ChO6B9rgM7rlQrbaAeg8JGFRM
	 gg2qnwtHhRLBtfufUOq8mIQAapSP7t3cLCDJDeOsVN8q3pVmgMFWHDzOTEZ8iEGDT4lX+
	 8CkgCUU8j0FuWlslT2xfG7ylpQqgqvJYR8PT3vEOut/hCFaEw4swQWa2XsbC0rK74aeXr
	 YadliALEyPgzgWcSuuiMQwkR0IxjRGcnMlgtAU1Zmj3TMeJBKdYqLZMiG2fqmudtzisqm
	 2+W0KLXbqJvHTShfmBuwJd8cglK6U9UMhS5oUpD59TIgVByqCRO1fKLdOY1mVwo24gg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793620144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
	b=xRAAPxkXyWKwrGhT7VTtOwS7EX+KwPjXQhbKOua0wM8W9N3UCjcrjbL2/hkXC1i5fMzP
	 wUHdqeRP+tEErk17pYoVI0tpbLjAeRh4LNWw9gRlkmgpKPkYAbm+LzNy7s+k5XXNWNIoV
	 Re0RoKvxFOs1gwOK2y8Ij0q3dm+GDngpvw1+EMzNWv5ZA4PPygxOMxem+gL6ebRZdGG6T
	 z6GlwlpddSz9/+oPoiY4xBc8whZhc+8ApAkQ3mC3oSEgqw1BX1eAFA8E8hE+53xwjPpqI
	 0HoS/CAcDFkkr/kMkF0zKMIZ1YMnwUFJrpxEbymp9ZQhBNeL/wP4iaesoY77kxeeURA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="RtCLC0/X";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AW1LU1Re;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAAD606A327
	for <imx@lists.linux.dev>; Mon,  2 Nov 2026 11:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DAAAD606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtCLC0/X;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=AW1LU1Re
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299w7U3402412
	for <imx@lists.linux.dev>; Mon, 2 Nov 2026 11:49:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4mhjs5YiwohXXKlFzT3X2w
	nGvKV4qOEdncy1Sbc0n2k=; b=RtCLC0/XXANm8zGgprXI3f3T37+VgrKFe5r46H
	2ljNLkoK2gazwDz7NG4AxsRSq0qth/tadAd4VDsMojwF2pGSEUNKi9wNX3hhGRlO
	yCNISqG4tjDTkry06+9GHllYka1MBnhc2Z/Kg2sXl330PxZx0QCmUB0f0SBNKIkl
	dFqhKQrm3GqGFBcrJMheFJx6PskKYLsq0gCymF6MS/+/Yc2qpsPErNsWmaVfvbMS
	yKX6Ur3QsNaNjAdqW9jrufv1R55hkFZBEjzALI5VDh9QYFShvR7lOLvNoXcFRyVK
	PXchsimmg9hLnqm2ZHsBtfmty7dCie4HQ14+KZ63xjIJk/Kg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8x7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 02 Nov 2026 11:49:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so589660785a.0
        for <imx@lists.linux.dev>; Mon, 02 Nov 2026 03:49:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793620142; x=1794224942; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=AW1LU1ReHOeHBqYFqU0cBSSdjiKkh0341k+Qxjg/WNAIZ5Ow3W5Ufu9QHUx3gW/eXS
         F+k+ngfZGomHGu4h8tx2swC9rQFwfyyDTu6Nue3H93GGmaSoyQLz5IPuqvNdx4YcobJ5
         7bPhmXgeBXMmW7dJcZkIeTkl9kVbqUH2cK3ndScuyGRw0YRlxeBeV+S1MmbsW1fp7oVr
         EqxiIM4zVAkS7YLbrS1YLIzjRXbmj/jib3sbCyS1+hnDBscoaRaAQvtTdFi6Apy+ldoB
         I9mq/kw6Ton73hdRWTgJEaecnk4McbJ6Fe05IppK2b3iMOwvHDnHfC3kYAGym1cPhrjx
         SCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793620142; x=1794224942;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4mhjs5YiwohXXKlFzT3X2wnGvKV4qOEdncy1Sbc0n2k=;
        b=sFFoU7Z1oTYDGXlk/CU46aYv94MGuAlwSoykSoSAaQbrJReKsHdXuuzEmsPS8uayfr
         vUmupnph5ZQPHsuEojygwdFtFL3fNfbuKoqT/5YZ1eDoXDrhMyjLSsgEGNZ/kBy/lNrY
         yj4Vga2/sebu86UWbdr5aS3G1YJ1li2tIyi/oO8h5VnxvlUG8ukRNj6kHSXA38k6QvpK
         uuLoOnKLHk+a8fmS8SDONl0yFLP1N17raoElA51k+Nn8ejZJ6oeuWsyBq8UsaMOow6sD
         /lSGgtkovORgQhx3N4ZTz1WZ2EfksyMkEliVZJOnOVKavL+oHpZoZ+cP4vhHzJYwmcke
         ecrg==
X-Forwarded-Encrypted: i=1; AKwUvBwsar6jkb22gj6t6Scdk+tXdvZOcwjk1mE3P/lMHUMV+Rf6PsUYe8yDpFg+4Y9+qBurgDc=@lists.linux.dev
X-Gm-Message-State: AFq9FYJa27cbKECIm/D+HRhTwFBySqPbOP1px8ZdbVSiZIB20YImWwvE
	JXbi0r8bp0IYrjZwPy5/rvMgtPp9HIpJeZbmRFJn4M1W93PUbudnrJ+rH+HWNXBG6ssZfMENa8m
	wFzTiIZzMsWNGULlI3eHz+NMI9/7XYh4KMDU7Vxuc6YL02m4hdI6dhrg=
X-Gm-Gg: AYBFou3mWc+gKY9DTL8CGuLw1AFgc510uV+0f9WrLlumeew5ew5Qwfj7ze/5vTQ5Sd8
	1SO3ASIBPZyQh9VBlVbCWUOVX20YRPsw3ccpdEJtmOOwnL+d/zxA9Hikxk08t3E1JgGbcuZfu24
	1oICvICpgsn6mjiTtwMMK+6bNFV4D6rJ/LoR8fe6j3Bsq3BPXmsGWjaJ72jkddzFeAiejL6lVhv
	uep2DFEb/LU+XR2At/DzOktcQOcIQsjGRowvR9BzmECJlvsvLP/IC2k2besiLeV8Prr+u41Q1sn
	taK/92MwppJY/vs0jdavbHK52zVYuJxvgG5JWljipShp8EFnmqa7Bl6LpeVDgOps4ZDW2rwv4Cf
	v0UGMLDpwrmhcPtz6DfsE4ZlgdE4HCWT0y5dlKTbyuEHlcByyK28NPTt4jw==
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528698185a.47.1793620141913;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
X-Received: by 2002:a05:620a:f04:b0:93e:6f65:de63 with SMTP id af79cd13be357-944217bd696mr1528693785a.47.1793620141284;
        Mon, 02 Nov 2026 03:49:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm19766031f8f.20.2026.11.02.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 03:49:00 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [PATCH 0/3] clk: imx: imx8qxp-lpcg: Fix the clock-indices parsing
Date: Mon, 02 Nov 2026 13:48:48 +0200
Message-Id: <20261102-imx8qxp-lpcg-duplicate-clock-indices-v1-0-1c3fc3fe727c@oss.qualcomm.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKB46GoC/yXNQQ7CIBBA0as0s3YSwKQhXsW4KMO0jiJFaBuSp
 ncXdfk2/+9QOAsXuHQ7ZN6kyBwb9KkDug9xYhTfDEaZXmtlUF7VvmvCkGhCv6YgNCyMFGZ6okQ
 vxAWtsaMbmM+9U9BSKfMo9be53v4uq3swLd82HMcHLhc/CYgAAAA=
X-Change-ID: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0
To: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>
Cc: linux-clk@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, stable@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=/6v7L1X5u5rSAsDoUAMgtN8tzVeu21cN089Cbw+fzqA=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6HinAXy6mtSVoB7DruBwJu7hXFE/BDIQ891NF
 u9vdP09TiaJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauh4pwAKCRAbX0TJAJUV
 Vl6OEADNhE7z40I+qslePVWHxtl/AdsZugFLn4PuEOrHRPvc+jIF58nAojAp6nEX+iPYc4HxcrD
 TS+2DK803oF/hvsPqM4EZiU3bQjccKgVC/q37aLailgAC5+/MqUjAa6hvi2hAuKKwr1HNGDJjdR
 BiBOjNEWR0ThVntnnyDAGIfPloFr2/GFXq7MHVcWLe2H6T882hRefFWdTCDuSo4D2qOMFRFMTBA
 wqVerxYDZeTrROZhsC1JgQ8FEkKoAQ0qzzyRx47Gyu1TN7k+Zj30ckCjT0G9gz0YcVzY1IdFyeu
 WeGlSxfatmjQmVqZuIn1hL3LZD3FgSfhlASpoF3RzDpM5ihGWyxK70ReQkVWwnjOFa2Jy+Ygc10
 +/6/k4I0XHsz1tiexy2vycLxkTQTrctIHVyKDTyB+pBofHmW6uGHyKBTmuXKwODdn9TilDFrOhU
 bQvcegjwXTgp7s0thfBj2skwqHBdrw8xLEOUhoYMf+8+5PYtOSZ1YBD5lceTyF/pjHMhHP5tCa5
 9INk8Z+n+4vTm3e/2OnVsJzG1BU3knO5Cn7Ejn49R3GWm2uZ/MOr4FljAbh1D0Im08bXcxN5UrY
 ZNOFF3Ak3PnXe+OlnJvcwzl89/GtpWH/OmSzwwtW3VsQD56FgwlmPscy+r8mjLoc6ob9076XF4J
 9u15AQqkp77QMZw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae878af cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=H-1XAVmeZCqmBwV_hRMA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX9OXKNd7ru9x6
 aCeWznNMvp7E+pAXCLXlSmtJ+mzlsuU56BUEsTu/4/jtCqZBbeiCOyf+xaSKak6Knfg28rv0y3z
 7MfszhWq4Pj3b7W6nHfzJu4TLPok1xOb3/DwtifAG1N8jW6jN5RG7L+fZ1fyWwulxFtoOl6brSF
 JVhGW6KFI4xT19pua5Ao5+zdQJFaRH51m6L68tnF92uArRmyJNpwzAxkfVLAajRxEh2G0SGaSrZ
 POqwI3e28BdsAEGnwqGtrhQKkwsK2eTuS/Fzxsc3O+xf6uzny2Yu6BBFH4cT0DlMMZDTcjE/4Ks
 L3uHqfOM7afEyeQTmmgHkaWkWrbJdRuyekNB4Q54fVZABV1qaGQhVZgDfqQ4Ol+nI5iZcXEQUTv
 9f5e3C5QtqhF2Uh5QMFW2B4vnu+km6V3nHd9GZaefEmtLUVFApYg5EYy4gRAZ4UcmZOy+F2qJny
 AT3l//yc+eTOP5hUXeg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0NiBTYWx0ZWRfX1BmaaD65mcU0
 QUOhducrUwUMhGwUtipNgehpQ9jm8XwVGQmbkXZS/BF/WINia/XtFJ8ynSSjKnVy/y2DfSJRdEE
 BIIIsHCDhU0Vu00LbT1/0gw7EIaw8qM=
X-Proofpoint-ORIG-GUID: pMG-98-l2B2Hb0ghOPbNOXlBFc8R4J2K
X-Proofpoint-GUID: pMG-98-l2B2Hb0ghOPbNOXlBFc8R4J2K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020046

imx_lpcg_parse_clks_from_dt() trusts the clock-indices property of the
LPCG node. Duplicate entries leak a clock and make the error path
unregister another one twice, and more entries than an LPCG has clock
outputs overflow the on-stack arrays the property and the related
clock names are read into. The first two patches reject both. The last
one makes a failure to read the parent names return an error code
instead of the number of clocks.

Prepared with help from an LLM-based assistant.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
Abel Vesa (3):
      clk: imx: imx8qxp-lpcg: Reject duplicate clock indices
      clk: imx: imx8qxp-lpcg: Fix stack overflow with too many clock indices
      clk: imx: imx8qxp-lpcg: Return an error if the parent names cannot be read

 drivers/clk/imx/clk-imx8qxp-lpcg.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261102-imx8qxp-lpcg-duplicate-clock-indices-828fbaee36b0

Best regards,
--  

Abel

