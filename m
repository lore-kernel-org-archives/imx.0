Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADA93FA5F8
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724403; cv=none; b=sStmCl5o7Q7T0g7BGd/py163e+eEZgTFqdYh+q/Q/7RkoghY4Q6YThOtipNPVJT3MAch1r8gVzoxliNTZRNwzF+CDQJsfbAYAq2LMAq2ckwXlLxx7EQfPVUd+x2TDP8U7lXDQbDgYbESjDLmAVYbWD6qanDNuDyRsOpwQtdxrLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724403; c=relaxed/simple;
	bh=3ExHxG1MR0P4M2pmAxXchKYR4cIG078TjIhJpQx2T/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tPUERvdsatYL8URCr7Kz0Wl3e1PpgE4XtAIs7lWWAsTpFcF/9Lmms2EReqMgcdIw/Qae29WPwSG8kL2U7aivj+vMx4Wcde1sVWLXwe2htWIn2qLHA4IXczzuHILgSuYjh0TI+efOIXL/x+C9azDpN2NMZujTOngt7C4pYOduW2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mFrW072M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NT5xQhZR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mFrW072M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NT5xQhZR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8OBNS2348369
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DAKuWZx+T18TOY2rS0sRqaqFYEplRl6oHhyQKHcNh0c=; b=mFrW072MsUbz2SE/
	g0JY11fw1mkJsULAeTn25ITeMacgLdxqboxaoBI+qy0hki0UPL8DouFfc5NnmDFT
	J+RJLr/CCXP9bRUec60EFi3Tu4MBN0uqYWYR2mYS02xSypb0tkHDA3MkTFAzyC0z
	6SBeq+/95E7jnGnVD++/2rMl5NSUarslg5T9suvycoQJHQp153DsgNEVuMGa39V/
	dtgp5KxwUeztYoCBPeIF8MIkY6VM7Oc5qF9H9PiGZwdtFOKjRHTUBMTyXOfC3ePS
	Q01qZYGevpPULHIJxnQRYWoOgHtv3UMt5LkyC22Va5x5IsoM0UwyT9hjSMWkPEM9
	u0kyxQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s07cd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 29 Jun 2026 09:13:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92d4b18b373so370492085a.0
        for <imx@lists.linux.dev>; Mon, 29 Jun 2026 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724400; x=1783329200; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DAKuWZx+T18TOY2rS0sRqaqFYEplRl6oHhyQKHcNh0c=;
        b=NT5xQhZRov9aRug3avyS4hZmlSxjvsHPqbCjSwA7Ox2Pjz0rNni3CSpPamyPtk9fAP
         dnQtRH48ut9a/p4YRMSwDqvfBztL8Y13z9kdKiPz8W81NHB+dnwf0mxrc/g7G1vsBfaF
         RpIs6MSYeb5aKLx0V35OhP9p2UBUgrATGnCHGPrKs5rfYXzRNCHY5k30PxER8l5e5Emz
         CJyWkCOzJl7zZWdb3nAHmnofFTpq0V26tPNPMEfhNOuJgJGECMWWQM+lJJfGK+ab/fTt
         nX9/RpTkIVSL4220O4Id7eOwW+23g4TBnK3P8OpvscuvcURJ/mpVRMTHt4a1k1y5kcvM
         l+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724400; x=1783329200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DAKuWZx+T18TOY2rS0sRqaqFYEplRl6oHhyQKHcNh0c=;
        b=HdvMZhge/O2Xnpb/GVT6aUece5ltAZvEOvTaKwukXmUhtQvN+Fu6vu6nVJKWGR/JkW
         2uu5ZUoQpddUxlbfqj/Q78yuSUGwRf5QAz8F3E897iEnHb+wqY6zP4YNVgKAmrzp0qaI
         XrKHo5tX6n8ThRoDmWf1sL+QypivuBnw/ZO4QIkbJwOV6tiT9NXuspnK5vJdNMtz6AaZ
         3p2iVVu7AIjbnpEuQ/OTd9ZZAGUvMRDhoplvP6yd0SXMfm0bMBLH2gLxoS2WRxwMuwEe
         4F3aCr86viZ9Yf+BeDrLc4p7oPpLtbdtNNEMqPDHk+q3r6nJcyS1zrZaO1+ztkhzMw9C
         WGZQ==
X-Forwarded-Encrypted: i=1; AFNElJ8tI15uxZgG69Y7W2uTEqPQNus7d8pHVsj7MJkDOkRwCGIOu/CbFA+YDY9y3gJopVUw0+A=@lists.linux.dev
X-Gm-Message-State: AOJu0YzntApdsCrTH6DLs+0SiuudXx9E5kipJrndLsCjOTR2H7X3jNIV
	WNKzCA570Q9v1WRr/5GAzVt3+MH96mOtMFT8LuWbpqEefqhJKDtM4zqfO0lpj+1dKjvcZ/qyr8L
	JV27UTfhDJDLF4yEv22If4morxyWur75svYXFxO5QhF8F7Ki0Lza82nk=
X-Gm-Gg: AfdE7cl6DsKZ1gIQJ7oo2eqFHTA3OllIyeNI+db5gAoC8erPw0rXSFmxl9CVGW0gYcB
	9DLE+orRYlooWNHzacvH49JMKMn2C3jscsCF3uUEESTNpF+oIZHlNldf4T0Z9l241oL2d8/a6Aa
	F4U+RMRaEIkbkJnc+88ut0M0WZ0od5/TRpb8+XKgCap6u/9SrAkSJKPqrGK9+t7vZj0DEPQ3rU4
	TxdjOWwdEfA77AtMhc6U+Z0sQxm+qN/kDtJJlZ7z6X68qYDYO+rRLOZkWN248WRq8hdot74RE5+
	vQ6rgXVy4l58Ym7jKmFQkd+NGZCOLIlpGFs5x8WR8hno6TmRni1N3JgKwz7K5jTeh+g4VEuwiXn
	D6rKXGFA9ZuJM91cUbZVrEBJcjOQN8ESzqUSbe27t
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2334275985a.54.1782724400547;
        Mon, 29 Jun 2026 02:13:20 -0700 (PDT)
X-Received: by 2002:a05:620a:2a0a:b0:926:e8e6:3b09 with SMTP id af79cd13be357-9293dea9e7bmr2334273585a.54.1782724400118;
        Mon, 29 Jun 2026 02:13:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:30 +0200
Subject: [PATCH v2 07/19] i2c: pxa-pci: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-7-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=3ExHxG1MR0P4M2pmAxXchKYR4cIG078TjIhJpQx2T/Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcNxd44/sOnB3ZQUb+HxYFRS/KtwYPACD8iK
 44tvCPGXbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3DQAKCRAFnS7L/zaE
 w0SHD/93ITElIUICiF4/3GgOrqssN9o1Qh2VzmJpQ3angjTmd/bLPNcbWO1I8zxNcV+bsJvn1e0
 WmAyCF13gxL2y0QjWrRmuAPwBRcgd8x/E6WpSzRwOhUUnrw3APQf7t5N+HMHHSrcfZvnO6Nd+OS
 GyD0SD2lRz6xSq+RIJi+DAvXUq9DLkMdEMcJuqQpQYWYqQxe+qUm9xdGu5wYZkUpOam1ebCKsnI
 t/S8JsyhX8NX0yviOPELnPfeIgHcI0roxVF0xD4hvnAoiQPlfH+zz+7Qu2wCS9jFRNJp9s6Q7d+
 +TIOj8knCk9LnV+0awUwbYrwNMN25b1vwdrtrpi3sWQOJrxYGVcr96Exqg9RjA2QG6IdyyWW0C4
 NbhKtgfxITEWqCun8ekCjWmb693zNn/0exqIIB4yyylN9oGwa9boqjlhmjIUjUURz9h8qNRYKRc
 PL0Bi9zWqYxSQpjGEU0N/Y+fD8eHpYwy89oHInlv4vsydp4pqsWzdre5sCQxAl/I5GDHuzKTA+E
 dfWdX5WTZG6gy0gfSw+4QtwwuxWiLh7nvwksKjfjaHRoRIzgv2bF04OwIg2zvLbchEV/U1HAwH9
 blEe8ruOiEIHHeye1oW7/s6G7sYQE6rB2FOrvn0O9VQICexcIyofevvqa8FS9JR6qmXGcwc3hR9
 S0k+pQj2uVT69dg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX14IZ+wqXT3ay
 Q/jJjNLmVp1RbmW0Dy8ebABk3vi1hXGJUwCqk139+GRw3u7a+FnoY1HSr1j46t1OCBjQVJe4MfL
 AqYxa6XHVmAJ3dPjcO4nGI/evrRWGV0=
X-Proofpoint-ORIG-GUID: b1qNJ_LNCG79stJOsIVCJ1Mu8bo5W0kz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXwZM54ciULXUT
 akCgaR940HJ9t5edkt+Kiv6Sfb4BElhMOorbpSukndHzI4gSJacJRi83FAOqhFxWqZB3a5jCrDY
 DIjaBCUiKztP6pxnmU3TyM10MQ1yiPOR+eq+VHjHJUwF9nBVwyD4aZO3P16Pta6eceCA/aKh9dA
 vlLSFLhg9qN0zpfmHbvGmIJSKi9QpXQYAntYA8yqIoX5ETVuj1nwbUNF1ObQnagUPoC80SerhlX
 rFMv79JSop4SQhk7jNx9wwAc1kCPeDDatIcAOk76HXj4OEhHeTEXZZlu+ZAQSi5yNiAXi+broa/
 RF466lpQp/cUuN7DtWmkvawIS/g0KInV8CaFcZR38v2QfV3ubnHTZwjnntlLwPsMCCOJb4aCkRd
 j8huWTWvrZXIQ8SWvMZ2e3m1WAxVnxC3Qio3I2ULXniGB6JNW4wWKiHROilQIQRodMBp9HDWziT
 WBu89PEH3TWK6qMc5cQ==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a423731 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=LDBv8-xUAAAA:8 a=EUspDBNiAAAA:8 a=aMVJyI47E4_qiwhfJDMA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=DZeXCJrVpAJBw65Qk4Ds:22
X-Proofpoint-GUID: b1qNJ_LNCG79stJOsIVCJ1Mu8bo5W0kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Andi Shyti <andi.shyti@kernel.org>
Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com> # for I2C
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index dbd542300f80043c6bc65a69fa27ca7b3d5fe787..92a0647f08c69f841ca99caca757c1728b3f6fce 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
 		goto out;
 	}
 	pdev->dev.parent = &dev->dev;
-	pdev->dev.of_node = child;
+
+	platform_device_set_of_node(pdev, child);
 
 	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
 	if (ret)

-- 
2.47.3

