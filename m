Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF5F3B440F
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352674; cv=none; b=a8bTC3LRLLp8TiZb4QgkI0hT5uJ55V/AZ/Myj3dMmF8hiZSlymkqCHsfwkAOXYZvF54O0wNeBqM1VeQaHX1BqJHeuAz+Y8+AM3OMTezCi8U7tVI0vaW6eIwb5M+8YBFjF56XG9g+Sd+TxIfaJDrbVmMBXs9vGc5c2qt1PNldeGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352674; c=relaxed/simple;
	bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/r3e434wIhsyaE+zXvSZ7bOmNwqO/yoAiGuhoHNcCqYaDQd9CTvKab2XDNVwo2ggvs+mTamaS93Y0IOe0Xv9EQdEcXxJ9GMBEMm8SOZeoMqu/zMwFxyeqD85wEUb6luFVNiIiQpFiGvC6Tsei0/rAuyhQnwdyFZv+z4v9EXyg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaLgqQRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gO8Ou9MT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaLgqQRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gO8Ou9MT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6srhf1798322
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=; b=DaLgqQRJXv7nSfwY
	SocRU7aywBVODrbHtAfDYAcrqDXYdrxv4YfVOKrs9rMHPQBH4XhyoVJVj8+ftz+W
	l4heq1kv4t0PFEyXUsjQg5h1+NbAc3kQpTkfoR0eyax8su5UAckvnt10Ny/TNRxy
	la2aSjPWMezrt88xiGbTU0ba5+R4S/9lFdzfmKL5pDVL9I+gICRUoV3ToE+2YoYj
	AOLAEskzwK7IR3BZhRO8S6geG5/gXgtR35ZLGBFdufsm+1VDrT6EzeUwWRSFG4hK
	t+CU9A0tvODp85NkcBYdT3HGU8cZqxUvjFFKgDfUvu2ERSl2aaD/ycrVy5jDweDn
	/ebgSQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4213-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso130057571cf.1
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352661; x=1779957461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=gO8Ou9MTDvIDBsplniSByrX2w/XJmCi8y2ETcbw/sefXTQRyKbbtKQyGhmyFLKRIDp
         1gU8elIOiVLaFk/SICR3PcdZW0p0JeWCmtRh8rlqmLmN1E0iJOmxJX1ntlvVDj8ZYyPL
         Pevf9lGvq6iBEU6zItU6wAtRXxuzA+v8m0QmUlmcsVizaJLgNnQfN2ALkguZli10rc1g
         Dm9XZYDtERiY/WS0tlEI07+kHemR0yXbVx3vcTto/5JF3uUEKAHrXWCyqk9iq/ZX2k0t
         nX11Znf+wCxP8VRCtPzrSJlFtoVvWDl3B5Nq6JZAi3XTEwxu35Wos9QeQ4m3ZfKOCgpP
         whFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352661; x=1779957461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=j4GNImbV6kKJPK92ElBDiX90C4iUIdDj4kL6G35Y4rch1xY8ILuImAklCw0vYGVuz6
         QmhR2Lrk0cxjxho1BGXMJlgB9bJKq2DcIe/BrVSXbWCgNU5BUccfPOTuXj/EMBadl5lJ
         OqvENdXxf6UJ0DNXNBfcAicJsSbrUxxWv0qb/FqstCN36yxxIGh+4RrTsPp3JVsYE3Pq
         qszMghBgUYNnPLih3dtgbw+nepeADGZoWBtWeqPhzXpJn2Et7tTohua3bfLyi84AMdzn
         3xCDiqc8UBIyqstzvLajFG9y6nv8H4Sh0AvoRnfnCyrjnoBBv4mEnRjtJ/ZlHd+0KRWS
         RDFg==
X-Forwarded-Encrypted: i=1; AFNElJ9vXzrUZ2jQhfldIhB2yqTWuyREkpdjg4N++/tQ0fY8xutDHv7ofzrTbwQYUK9xtEzp6p4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWRVhTX7itRwzFVujFLnP4ntGyRXhkQfy2Pc+bLtIwLdcOYdFh
	RLZ5U/VPzcvxo8phYn8lwrpGbDm8HZELTsymNXtCAUiKUOGRZe7TileX9VDIGc00CAKP/O9fnBk
	gKQJneKSBGYvNwX6Qn1LpQkXYC6WkTlhAYzMHwFlj2N+0uQmBYm+gack=
X-Gm-Gg: Acq92OGQ19g+sgTWa6/7Q/40I78aEWSMfc7vzxUQdi6FBhzyFf0d7weJliAJppFazcc
	032dnQpRgnQkt6t3fBTDPsR+ZPVa8WqqOCkHdwFzAVhEismpW9WWyYyfmpsgpGoypV5b+aXUkZg
	IuWDZxMT/QIb8nRi2pdV8MxcWQPEAdsDLKqTbpeE6CxI1LNsg2Lg8RIKApMHKuhcY17WRBpIFz5
	3up2l8NhKh0VE3Jp9r64NxXiF/6ZEvAL+x7MDSTmFRlbw0mxJCmgpjBkY8ScJfXc82XjqdSKHTD
	rFwJqaq8O8ZBF4OxGvd+XkLrJ+XthFchHre54KZ9XOCSt+4IGeF6r0EfdwIIv8k8JMNmEQe4qci
	NhLVbXo2Oev1RQDZs6BSnvjwFsFaKPws+7r1ZGfK+7lOv8PaQWFA=
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24203601cf.22.1779352660948;
        Thu, 21 May 2026 01:37:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24202871cf.22.1779352660361;
        Thu, 21 May 2026 01:37:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:34 +0200
Subject: [PATCH 11/23] i2c: pxa-pci: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-11-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQo4KNVL307DNwR+/EfAcS03uVuTfyMcVo5R
 Ddt4Kdh/uWJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKAAKCRAFnS7L/zaE
 w5nKD/jttCuRwjJL5Z4Il89d2N0A4tqyEE0nA9nXREA+66qoEbjqQyieTedDwGD7MsX/6MSPxWV
 5CG3DD9FTc9h/ClROUNg/GH2d7w0kmkUywGwm9JyvBvlzAtQWqhuj075sIa5tYyeQQyFKPC34Xk
 RnsOL1rVgTEuFPw7IDDHaHI1wZ9tgnujchxPW/lP3+3NQe03UfCKxaQCxAG1ynKA8raoCqq+t2k
 tDuwqhRGAwWDfLmmH+F5oJMBzQm1CP16i+5iXRXocTOr5qSp23nOk1Z0Q3UloRClQzplCgq37L3
 K3IsTU3OSaWhfpVZjZDVu0OjtCMJSs1504goCjTXsrMMAehTj8kA5H2Q3oCJ1ybTPTXCrMu/8zx
 w+UhqGCrcQOhqlnF0W19dC/7abRToVks9nrDn5Nfe/sPPCCMCkx8LdnTYZg26piql+IHqJyhggI
 RkLs/3wvevoUmIlQEEGS88N+eHstmcvVdxGfGKcsK5B24XL9VaFYBNJEgnodc32ODuzo+Syqaku
 ZvCejLw5tSb2aNz/ngtwFBWmsvToRd+AshtUjUtEull4jHEwNa8fuhJk1yBf1zRRFEGMAvVSQ9D
 2oogJMuOeGt9NYmDMDCE4lV3vTJHw/hkkS0pvxsEB3/vQzc0MTZu850MXdoOqqqDJ26YedDWmog
 ilIGvILVlz2uM
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXw5FLVHPKGTBm
 khVHM4PBi5SrwAdO4X7RZ2CpDpBDIgmT+3jggmrcf8Zvaqkfl6kjxwx077joq0/xGyGOwo03B/o
 B2u5id31fLvKUx4uUGk4/HON643DVLb+4feqSTG2XfiCpdFO4Y5lpObCHGi1o9quDQZEsgZYM7L
 NHACnzslHRDFB8huKlJpjWa8XsZsK7N83bq2AWcOnLApy+gm6Rshd9xstYnAz+Gea7gibMXs52W
 K3zqCtn3wf/oRHIBOcwd7l71ZL6kkXWGYhhrb18bU3ExQxICH/+fNF++RugfY3/wyuHAyXpZk/Y
 Z0RMG9gjJCU1itqMzTK7MVH24d0p7eOJoBQGDet7Sl9Hsmg4cu/hTRpc1ysPFJyySpsrgYOsMsN
 iVDVnEiAh8ZpeLRTYxy+BQtNKe5hwAn5oKnAI0/u1SGDLguFpK2oBMp95i0Fva6ViCm7iBBvnY3
 B4dWg2aiAnwYNs3xcZw==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec455 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: wdw5R7tjrnUuckv-KXOsxxhETK9Rnf3r
X-Proofpoint-ORIG-GUID: wdw5R7tjrnUuckv-KXOsxxhETK9Rnf3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

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

