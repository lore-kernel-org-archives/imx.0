Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794922738;
	b=Ik5wAPBk96EVzqgkxC8Dgi/Gv3Y6hQ5F1LXnbxPolvlnQh8DK0nDbXlj88+k9MQGZzP+
	 6IjJknwAWIzmSWqJebj74IyRXtajbQy+rU9sLnm0wpxOGbNEb07W7C9zJvFhvac+zTHIV
	 kooEMXC4j7SS/tM9RKxVHkR3RwUma938I2uvYeLA1zerHzy3/inmr2jEM8A3BiGzdFD1R
	 Fv+0Ug1iYn0qR2T/gMgcTPMJlUgwZrpF9xCPliGpsYbK1rF0VyHcNkFytrcrNXRaD9fCT
	 7vcxZVC82QThdRldzXZGi2rbV7MEpdwplejEpIkHmD8zM3/NJxIDsUJ5E6O1uDx4oIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794922738;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 X-Developer-Signature:X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
	b=IzutGruXsQ1O5Pj8pIBU2jyBobZwdCn+wlT19pbYufgZmTzrZagatC76LIvf4Pd0Yj3T
	 RSjMsdlruVsrm9nAwEAbG+HEe1TNxwcnUdXtMbeonYNF1h04Zhs6bksoPoblV3SwCta7a
	 wzWuyWdtn/SbnfNUTSEwqe/pCkPkvX5vuF1C9gtOUi0R2vcNcIEBHuvKmD0kNuEtucLpW
	 0PobBtllWY4ELsyM/UBKHQzrCx+XnErQlgFXQvs8QSIaxvbXOOvVhv2IpAxgk+aQIyolQ
	 rklBm3snUbHwUWVubXZA71BPUNxFGMRN+O/6Aa4U07Y2Y7ofvUAIF3vBm44tPyPlPEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ti5lPGMK;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A526606A33E
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A526606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nhXQjsl8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ti5lPGMK
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHC3tuQ2096369
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=paAaVYHLFrA
	+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=; b=nhXQjsl8FjZYXud61fLT6Mshb8U
	Z8t+fMsevFc/Tl1Opma/c7OXs0Q3HkS9p9g8RFSSu3Oe/pj4OqFU1hxNEIXE1V5w
	ZVtRWKo6EdEEdRyydPvpJn6XsG9xlwyb5a9k2lQXz2oC4ZAo2EyBlbG13Y5eiuTb
	MJIfWstq56H6cFSSHjpgDnaGduLPeIyetmBLB3HyLfWCCCHuSb4xziw0xPAFswtM
	Of/PzEWomB01n6ZoBiXMaEyMImBNsRzw4WEHRtADt90sRFiNioudBuGdDsf+2X+W
	5uxwUNGxu8TyM2S7D0sL5vNXxEofPT4MesjQ1h+6d763/zlMTWLEzSrV0BA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0c7h2sms-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 17 Nov 2026 13:38:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9308eafb465so1169065685a.2
        for <imx@lists.linux.dev>; Tue, 17 Nov 2026 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794922736; x=1795527536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=Ti5lPGMKoH8Krr5Zn598YP8XvYozIkWymdphcNpxbblDfSXdrnJNtndv+eJRS6v1JL
         SowPR79Mzdot5bNZ6SmJWC46OjOoo3GpYIiF+HrBdkmmUZqPz4Xmuneal9+k8U1bAOUl
         KJsNeZSWP40Q9ALtSfgkbZb+Hx9BQupOQDK6SUcpgtKRDkm+/or5jPtJRo87hPwsMdqH
         mjhlLdw8incgdU0j74CITHDQtHilQukU2R0NT6tcdQyyXjoE+b+j8YvAUOciWHftLkdI
         bNJ/o03GJUGHF+0OJ/V087QUS/GulNbGGYU2TucVaNyHoiqZ2lvpD+qjFxCMSC3umBMJ
         PdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794922736; x=1795527536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=paAaVYHLFrA+QS/mFBTaOWWEsc1rhEBK7fRyLBDWW4w=;
        b=ZkGsTlZtfaRdLGIa0YPmVwoS2mG+ONof9wHl4acf8ngTN55p0Y+vTr9Ex+lEGvBow7
         h22uHc1PISV0lP6LnZ/tY2Qwcg/y3RBlWN5hVZi6VKUDWliRQHQ1j4bpO6REmAOOTA7q
         e3b4C7hNukDBJf4pnDKK16ykAJYCBbFxB3A4jdU125wPSSnHobyZMqEG3fm3M6kjWCst
         TGtKT4ytiOr1PrvLskxKJuV2PT70h8sqNYewOyjJepsqIqzFtXgjU1ZN4QZSuMjLua1e
         TCWMXHMjwrFeVYYfaBg8scpTFX7a1WbkkvLz1/iKRyOCJbiHQkJbdQRT0N1S4kO32jV6
         YnNw==
X-Forwarded-Encrypted: i=1; AL+hErFcQpxL3+edRYFe2pevDQHTWy+x/a9WJ911qhXrh8CxsHaSmKy9RykUQYfVArlCkR7WuJ0=@lists.linux.dev
X-Gm-Message-State: APuU4Z8Elujyif3mN2up/2YxBBG8r9yXiLeESIpW/b8SyVedbmFhzmsK
	A8/ff1dNrgk72Ft69IA7Z9QPgsn0hNHJgw2unDrVtHT/oF/UPvOYs6hVt0X6XMDu347nkslQKfP
	4fuvPAWgzU896v4++Jkxy2IvF0quL6DknnR3K/e2kOBNB9rDXgs929uA=
X-Gm-Gg: AYBFou3mByo3QWERpWBP/CjYUrLIWafyGeoyhcQy4iduvxid/AePWES+GyELJULp3pv
	u7zka1P66uln4JhE6wCvF4UBnBeocn02oPAPx+pMNKllWsPb8dXmiglUpBci8UidcG3GyV+At/s
	qhZhVJRgdfpBTXmZGNjX5H9CuFx+AWEqrDkFpdrzzyF+j37jzhApDggqgHAqv0kDjD0LzpIJbxZ
	fCQSl6rJzF76+bNV4WtWrsHxPwQv0aSZqZ5qbx+MyNKu3CPPebgDDBG+dF3hU3wge780WDIbIpv
	UgU0AIzYBYjzPF2rznMJToOt2yIips+QuEA6+vISGQ82AUdReQdelG3By+kbjZbaXn+/970L60N
	uQQELD5xT/1ENFOVwuuRrNpNLdls6Oyez/MQL29dgAUII3qZgj+/5toCIM8Ywbw==
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121288785a.1.1794922735527;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
X-Received: by 2002:a05:620a:6508:b0:936:ab1f:6aa4 with SMTP id af79cd13be357-9494b9c5b55mr2121285785a.1.1794922735149;
        Tue, 17 Nov 2026 05:38:55 -0800 (PST)
Received: from quoll ([195.50.164.66])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a3ad4ecb62sm4066504f8f.57.2026.11.17.05.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 05:38:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH 2/2] arm64: dts: freescale: imx8q: Remove undocumented, unapproved aliases
Date: Tue, 17 Nov 2026 14:38:44 +0100
Message-ID: <20261117133842.245262-4-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
References: <20261117133842.245262-3-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=JeiN87X/rish5mj+l3Crpb2AauVxvJ/WY/Ci16QM4HM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq/FjjEkg6Na1/foI5YSMp5p9UhUDig2YlQw9xp
 vUEnFRSVwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCavxY4wAKCRDBN2bmhouD
 15rXD/9MxJ30eyPs75n8xdTYAn7I3NcEN5UEhdv+I0gAg80tgBOUr+MQi83c66n9apvVaONT043
 emhah3MuQ5A4QyA5LX/NnGbU9bvH2aNkw56RbHtIHeN1rTz3jopykskPSGJ8G/xMhxI/aWljQ+V
 j9Ib3ZMcGqaSgvaIoHDj3ITViJypxbWzk9sX81qucr+OD/7uSJahsmOcbCFBrEcx2FZDSSxgX7U
 iRiB+OqYKRSIRx9Hg0Hf8CKz552A0Dxt3GUio9njPEMAbgxPLpndiL8LbNVJyTSVc2UVpbUtOxm
 SUg9Q8e1ndUkjhEu4eDp4+aoc5ZyQOfvoMbzjGdnwEBdAwEGv1sY6LPA3AP0KU0Qu8sVyVYWRNO
 wG497ztclVJSENcQSZ6aK30B5o1hJm48lGynDAoF9/WiYka8XISkrYervUU0kXrFUV3nMpJfoBU
 RSp5aFppqdP1FxTM3YJ3vuH+4MeK3Z+e/q6g6wWGqUIS2c1nt9QmVOeJuDDjnO+QnEsq9jJMCNj
 Q5DlAQmcX/aip5onLVyiWznY77Blei8124tCLQqn6EPKuouuruS3knrCO0jwn1AOLW5PE4/VHVt
 XFaDJ+V+G2ophCoRtJY7uu//+/GvEXOTawW/5ZwcKWG+wpRUXlPJJSlWVCGFIDEKyOxJxoU9ySY IIkFguXhdIIJhtA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: mBsbicwvm6GYlKXNOeEL6I14ZjIIstJU
X-Proofpoint-ORIG-GUID: mBsbicwvm6GYlKXNOeEL6I14ZjIIstJU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfXyH80uWniUWu6
 LsJDS2iHYwWwwCmxTr/55QvRubr2Agwm8fafxxruE6U1UE2/j6XOHtMPd57FC1PZbgc7cpoYa/q
 UKUcgL74FyQlIE7O93nh3xR8mjuom83/CeJmrtQEI92WF9LdS0HLr7O0twt7BZ1r3s7AFD4jBas
 wX5ZFaKQT6H3ZyzCF2UIRVzrTFAMKj1BoRS0uuvCIG/whR+Bm2cF6lLuhSDhNHJwd5MJG8Ot/4d
 RkzjClI0amFF/TfOQYSYlldWuIrYlhOzG5I2ICfirkpJpk0bI7gU/1ZYsNL8dQL74NtIfmLKRlS
 K7LLinNlRLkWk00+HjWUizo9gC/KWT0ALANOAKrdhP/pIn8AduPhLdIIYnJd3Dgw5c5AvUnx9iw
 YYJLDZh4qfSklFzWgHVlFAlt/zcLyCxilNTW25W7Sp/sDObQcu+6naaw9guNuMBA0GExb/BWZuc
 gQh3ON2BimS9i/qKo+Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA1NCBTYWx0ZWRfX04kAsOQL86PL
 LfQJ072qZfAUUL1pgjSZqgDIDsLqroLsnkfid4MUY9pQSUpy0E/FKo0ZEmMUi1M7LeA1p2Gq5Co
 wtX/6bd9/c5iGuWuQ/GagpaqG7dZkkg=
X-Authority-Analysis: v=2.4 cv=bobZl0ai c=1 sm=1 tr=0 ts=6afc58f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=Jk2/TV77q6/E6wQq2oQJxQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uBP-owwiYe2Lw3drMN4A:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170054

The vpu-core aliases were never approved by Devicetree maintainers,
because they were never documented as actual ABI.  Drop them, because no
new custom aliases are allowed for years now.

Important: this will break users of this undocumented ABI, so these
should be updated to use only documented and approved ABI.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 arch/arm64/boot/dts/freescale/imx8qm.dtsi  | 3 ---
 arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 2 --
 2 files changed, 5 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8qm.dtsi b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
index 9f9b34153ad5..f9d1c166bfcc 100644
--- a/arch/arm64/boot/dts/freescale/imx8qm.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qm.dtsi
@@ -29,9 +29,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
-		vpu-core2 = &vpu_core2;
 	};
 
 	cpus {
diff --git a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
index 7c4a50e0ec9e..82f640efc74e 100644
--- a/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8qxp.dtsi
@@ -50,8 +50,6 @@ aliases {
 		spi1 = &lpspi1;
 		spi2 = &lpspi2;
 		spi3 = &lpspi3;
-		vpu-core0 = &vpu_core0;
-		vpu-core1 = &vpu_core1;
 	};
 
 	cpus {
-- 
2.53.0

