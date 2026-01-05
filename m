Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8001432D431
	for <imx@lists.linux.dev>; Mon,  5 Jan 2026 13:34:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767620060; cv=none; b=Vni861nbKxehNgkFtS2WyhgWe3p5YcC1lc8HBorRuuePeHvO4QL+P2DNDo0kelPp0W0z1tNF4BWqsNI+POqB+Fgv4jzStX8Dudicgxn8l8NBITO+vLg/4iPASve5fiG0lT0ze+CiDgRlpvlwaxRKN9b4m8Ty1kKbLCML8upt5+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767620060; c=relaxed/simple;
	bh=gMZzaSjVY4tZVvTQil8VUzRPtCxKhgc0IHDLGyDrZk8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D3mnREPMfH+NWUIGaxI4sKjEqfgTLL4tmy6ICKJMAoBwDI994zuxRNJKl7+4ot3Dcfem/yimKv8xfxwmMOqmLWmr3tdpUwGl3rgrlCh6w8SAh5bmrbcI4yeCE1EFOeWGBicY15pE0kmB2xLVkPCTtAaEpbsSw81H02NyqizEbyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D3GqdzVh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ObqrFv3a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D3GqdzVh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ObqrFv3a"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6058w63q593904
	for <imx@lists.linux.dev>; Mon, 5 Jan 2026 13:34:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=; b=D3GqdzVh+P8lxKak
	xY2E7ZQ7eyOZAywZB0ey8BU9stHjORNWbthxMrjWcamgAjxRHkm5TTsw2VczZXjW
	ep0idd8VLSlcOj5bIKJU+53zQ0N0ejTMiwQB4Crz+9/eAyrdtBhr975FGV5XM1W0
	EcurEwtrtt850S67vxxojPCWY19oepsMGQTG6XTGQIHdKGlE+qRmLxQNKN0csOuM
	bGNlcvunqwF/IaB6cgeO38Q+hpugBLYAZrFDpjBPbY7/UeJW/do5EB4/WRAx47y4
	eGQGPryefk1jqA0BQuW1+XGQHhY4nr5FwHs//kXpjJeDgk2EUghlVxQxqcoFRvfY
	CnGxUA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bga8pgpg6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 05 Jan 2026 13:34:14 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ed69f9ce96so523310021cf.3
        for <imx@lists.linux.dev>; Mon, 05 Jan 2026 05:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767620053; x=1768224853; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=ObqrFv3avI6SV20/w9hXJZFlDXL/3yTjrhRxcFylYs8gPsVh/RkZTfRFi1T4EYHuzD
         wmtw0O6dJnZz1l/G2sT4yBGzPn9fpaLPl2tw9dPmaT686WA1jUFmrCcxTn4b4BAvx5yx
         2mdWmt6uCc3mgePZU4lu6+bspVOuj3A6JfJML0bbsFg05wvUdFafEoApx2bGmCB5sn8X
         XHm3eSfGLpUnEKVB0Eg8Tq5QpX98+0N9beGpn1fymoNhV1SQuNnpjNcgX1uTeA1daqol
         VooDpSRqhn8Z9B/59j2Y2SsiYEyL+xDoVz6jf8RPEGFru9ayNOWIvjwgCmgr4mqfbrmE
         m56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767620053; x=1768224853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YTDHI1cVGuUbPTIN0iIEO22xYa57+Aa9xdC1m5T633s=;
        b=q356ZARmSYi2hIfRRk5TmEzNldLyYSZjQEyU/lhAQK/1VYexxcSWfGqXIdgsH2LHJ4
         Qfx8AT7QtbHz/fekhuce45zcyeEKwEOba095RnxLQhhcVIiNhiOkQpnidMLXdWtyH5FX
         zUKgxBIAyA0vFWEeuXbpLoOEimGytpMy/Wl/f4oroJgcO69WiOR6DWphJ2G0n62X6ctK
         zdDjWQJlZkVFIoguOkxEbAvSFCcMlF4OL3U8bkD46BnLNUUTVYBY+B2QZmNkI1gl5+uH
         FVM2brKw+2W9Zqxt8ZaNqYP1p6ruNvS/zQ/fy73CcyUuTIpF1Bcor+ZCHQ9KAURl28Ld
         ZltA==
X-Forwarded-Encrypted: i=1; AJvYcCWbq6cMGqHeKRObxtL9Z67lNTVz6vUAM8uj142rSv3Gj9X3wSDywk6VPzK9jezVrB2WubQ=@lists.linux.dev
X-Gm-Message-State: AOJu0YzwxCDwO+bpPnxHK36OA2mKpOxtHRVNpDQeRRilgYujB6FZ1kbO
	UkK7XnkUn15oBNBHhzIaoXGWrPF6nrfq4/LxA5eCqNJFTPsZACsyilpromgP7VTDkES9+1hnNDy
	Y4mDwrkq+9PfMhf2ltOhKgEOPF9CVIbSG+ybxXP+b4h+ZMfGtp7j/Ky8=
X-Gm-Gg: AY/fxX76gHp2FI1aoRF4aQuuZso7+j1xjCbps9J6iaj8gGMo9gu0B+Ftn0k1uXOMdrk
	3yjkVq1jQJaor79Ek8Yw2GhhpHmWqNbCA6T2WQSyRKczzvoZOeeNJR3iikkIsxnShzepRiavDM4
	hktLT32zVB+wFDlMdS3em48o7lA3csbHC7xfF1u+Jmonxu4nw1Oshi63fdwafadmxBI2oz0aqWf
	7PwPd8iSCvNvfIDT19kHr8AJJM//v8w1/7SqdR0ThuJz/61mC+s4tMTlzahluLbpPrf4oxaaMHF
	17LkW9DcrDlDTtOTmWbIjbOhtYrIG3/uqHP1DhOgc0hmtJRyBUab6NFyZuNmvrtjWgU0oZHM2Ek
	xYOxijNGUrpcZMwyAxw2RT5Odi21naejImQ==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028681cf.31.1767620053137;
        Mon, 05 Jan 2026 05:34:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHRkO0NCONkJWWXhAzy0ep55XiVJsUEFnaFCHhzMHAZVNsj44tHSkLbWNbO0UO4vNIzk1ruZg==
X-Received: by 2002:a05:622a:590e:b0:4ee:4a1f:f8ea with SMTP id d75a77b69052e-4f4abcfbaa8mr830028281cf.31.1767620052729;
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
Received: from [127.0.1.1] ([178.197.218.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d143f75sm147211015e9.5.2026.01.05.05.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 05:34:12 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 05 Jan 2026 14:33:45 +0100
Subject: [PATCH 07/11] clk: imx: imx27: Simplify with scoped for each OF
 child loop
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260105-of-for-each-compatible-scoped-v1-7-24e99c177164@oss.qualcomm.com>
References: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
In-Reply-To: <20260105-of-for-each-compatible-scoped-v1-0-24e99c177164@oss.qualcomm.com>
To: Miguel Ojeda <ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        Russell King <linux@armlinux.org.uk>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Nipun Gupta <nipun.gupta@amd.com>,
        Nikhil Agarwal <nikhil.agarwal@amd.com>,
        Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-clk@vger.kernel.org, imx@lists.linux.dev,
        dmaengine@vger.kernel.org, linux-media@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1126;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=gMZzaSjVY4tZVvTQil8VUzRPtCxKhgc0IHDLGyDrZk8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpW7270TUaY6iNZZ3USQUUPyMVYCBnPviUFAJQZ
 SbtcAwOUwCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaVu9uwAKCRDBN2bmhouD
 1x8WD/9st0kAgDjiJuLHe/DH08bLcxWpCZlth0KGlKegvN8Rj1R0QAKsyr+7yQgZJxI2zmLbtFu
 uHevP6bF88adt/4FfMMTJiGlsLLnnNw47I9kijxa0eob+ij8Q3c4aR2RQNI5H4L9YXS4GGvFm4l
 pMPr3mERDghSCXHaRRJ9AVOnaM9NGSstFpYBt9sqyql/tc7k/m3/Tq67I+dU3QIYbNb1dGl5m0r
 P0A++LSAUbLCusxVP9eWtPhFnS6fFF+LCxC5Cg/flpMX5y7tRoKcDHxpQgRpb1B5qxC20qOyXmf
 2ykplrlmCi4Vi9hM5euEu8cppTm6YFs0QTKW7YqIHORm0m5HtodFWLvgPaaFm2bg7uW9vaVaJER
 NQgrU7y+ZO6aGc8GOpjcLJyBC5spVcsUdcRLltJdlB3i4P027abTyxNlrmpQS96vY5i5WvX9PmH
 vRi/vBst2K2QmXUi61j7Gt06cNG5Q7aufKqp1FTFV1XgEiyziX5mbOaz0CRmmwP/DVMKF3PCCak
 kbVgAYKAO9V9B456wwx3hpvNokZHMHAnzIWeEXFk5LCMUXIK2shaxjWAZaJhvyUiaQxI8UjQ9hN
 yaNEWVOyWGWzXd4gkhRzptnmx9kCYHhUopwuXudzrTcobAEHqeqJIvcbNSZ/L64QtRtNlN4eOQd
 wE4SrRsGoLsXcIA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA1MDExOCBTYWx0ZWRfXxkuAKD8wXimW
 XHTal5zz8HVoY/dzX/zqfZjZI5nGIFcAY/hZTbjcayBRlZOMb5r2TXkv8V/iqCDDwydRxQ659p1
 3tf1TMztAhkpk0FZH3KXqdaMMchLii3bYKN0AYjUQvRAQaLyRY1hE6ZlUdNA1KZUg2b8K0qszHZ
 85ZGPdUD9wDzEQF2VRr6DP5chhpHd3dVqOMQ3/Me16fvI2x5ILpbUzbWYTp/fIw7NPj9gCLpFHv
 19z4tMo4+6R3N00qk4NBMjibrc44JrBxcPixGjnjyjxQc/9qX1HEBnDpfmbdRJSnPU8pfnZoe6N
 0uZyGpklR7W1o7j8TxDfYSFA6uZE0BpKnHnnl6dyBJH+dm9X8QZfao5upOK26Yr46+v88xaGJYW
 dZ96GxV5s1FBHZj8yh+1TyjMj6v1UqwZnvvp1X+EPd3cFwdRUgHn+xCawxlSLre9Ac1iOdZKzSB
 9iEaUoKPnbEhx/fVnyg==
X-Authority-Analysis: v=2.4 cv=JfWxbEKV c=1 sm=1 tr=0 ts=695bbdd6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Eb9f15NH/cHKzfGOmZSO4Q==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ZKLgdMRimQxpfTQYzWgA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: eS7aQG__bdI903DtFYcK3fIBZzTh_Knh
X-Proofpoint-GUID: eS7aQG__bdI903DtFYcK3fIBZzTh_Knh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_01,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601050118

Use scoped for-each loop when iterating over device nodes to make code a
bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Depends on first patch.
---
 drivers/clk/imx/clk-imx27.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/imx/clk-imx27.c b/drivers/clk/imx/clk-imx27.c
index 99618ded0939..f2f0d3fe5c52 100644
--- a/drivers/clk/imx/clk-imx27.c
+++ b/drivers/clk/imx/clk-imx27.c
@@ -171,17 +171,14 @@ static void __init _mx27_clocks_init(unsigned long fref)
 
 static void __init mx27_clocks_init_dt(struct device_node *np)
 {
-	struct device_node *refnp;
 	u32 fref = 26000000; /* default */
 
-	for_each_compatible_node(refnp, NULL, "fixed-clock") {
+	for_each_compatible_node_scoped(refnp, NULL, "fixed-clock") {
 		if (!of_device_is_compatible(refnp, "fsl,imx-osc26m"))
 			continue;
 
-		if (!of_property_read_u32(refnp, "clock-frequency", &fref)) {
-			of_node_put(refnp);
+		if (!of_property_read_u32(refnp, "clock-frequency", &fref))
 			break;
-		}
 	}
 
 	ccm = of_iomap(np, 0);

-- 
2.51.0

