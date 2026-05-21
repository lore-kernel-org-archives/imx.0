Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561403A8FE1
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352644; cv=none; b=EUFUA36xxbF+sYHkrcY+lV4KtyC7nmNe4U//MxpiKXbxNDAxelSabfuRzB6ZCwA2PFiAbHjgCgVyQEn1v6hArXb7cHeGTU7dBu54NT5ljYtXQTD81qx+JwuAKm2MYb3z+0KQF70x46qJe9Ixu5xwnAncP2osH9LGr+Q7i2vY/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352644; c=relaxed/simple;
	bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nVZijjZMvrYib9ay1IxtabG4CMtVItPbHOBqmq6mu6wN62bD89ti2LUlnQsyKtLL8ak5UItO07ErW4QT+dxIfsSgFqI/18zoxNqIioxIWQBT9Ox+6E1HIF95zZBBXnvianM5V8iV594EPnxY8HMXHGSKbSzy0YBvrnh3rdwqwos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=djQmFj4O; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iJ1U8CM5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="djQmFj4O";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iJ1U8CM5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6fgRc2158102
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=; b=djQmFj4O78Kw61Af
	ZTRwyYsSq1FlwApquXAjrrMNV6MDYgIBSnNZiRtCqTVIosmFcxjAkb1ty/75WjCK
	YhtUfvmst1pJLM3GcrvSe0ezIW7Y50K4lTYcWo33TJohgKYVSUOZ+WkqzTwOCbCo
	gSbIPnGGTI5VqDzxpucso1RxtjGPhan9P3mqO4xk4xxPWE95nTbckAEOX/Nhkh6A
	zpCTWRZMwjoYJuZP0mtrLG2RWeFPWj/XrmkVB+nJYoKeg7L7a3JorUpO1077eV9g
	V9PdzC9QKLJxRsQUorxPcY9EMEzc++ifXfG4xJzguDOQbn218aeX2vyAagWRixO5
	w5qyzg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ma428v8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 21 May 2026 08:37:20 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516879bf1a7so158276941cf.1
        for <imx@lists.linux.dev>; Thu, 21 May 2026 01:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352639; x=1779957439; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=iJ1U8CM53K3WO3G6KzCbEhOIAhe5lNZ838X9J19EG7fGN1zIBlC3GhWjfqZCMpmUqm
         OuJIzk1onx+Dfa3EakUqJ88nSdSNkkOS9CMmoApKW+Z8/iVvQGIWTP3dFnECq9N9E98o
         xy0fRCugHxPrEJIEmt3xt9vw/3KnpXCGa3SqxKIA4AyYmizCAKAdBJ4YjywMfbe3aUcx
         +62Cy+HtMq6ULtlKX3EZ5lM+kclhXCQl0kabu1g6Smxscumfgo6FH6HodsvGCqPfEpPC
         X8mTOJuiOoBQn22d2tXh08h4Mdy8gH2OhiaJuamMEXCbPq02SCgeP6380SQcL0YTUBUu
         1iAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352639; x=1779957439;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7/ctKXvDvcUgQZW7V3LpqjnLay8t9Q9hc/bk2yC/dt4=;
        b=DIK1M8OxwtBoj9NreGCBZkC8qiAWtpOPwkSbOCZNFPiUi4K4hui3HPUAV3v4kspEdO
         wZ844n/b8eBdYCLp4aioxiG6+5dV9ZsrjN3AYiHQB/Ds/wU174x8pAwXxrZm+PzlWOrG
         gqvDjx49+Zgn6ObNAOuXbI058lcoWdAhbIgjpu1hZa8m5srMSe21fC+wCt2e3NIU8ujL
         dzsBy/FEeMeBu69WBI4v2ZeZwVOx53/pRMvTny8c9+tjMXSy79axXfHwIQXrKBEfysj1
         q6vzCW+COOfJG2tQpEx5CSnBYiXWlXo5TW0fPhcKstaeVFs9hmNhDKBDCbq5fDKt+JR9
         yFlA==
X-Forwarded-Encrypted: i=1; AFNElJ8+g0fiYMIbXLe3Q0h1hbsofk9U0izxQdJyA2AA7VzeZijQXav431OOrSFXaNzb0nbNYVY=@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgv3S7+ung2Ib3pOMtwIrb+gD8BVZLNGiQMawRyW7c5o8xFhXI
	LAnFkOrbOliHCeKroMW4g/i9klsTfY1NghsLq8WQ+W2F87UGSiFjZGXRIUEiZy0fQTkegIEdP3D
	918BlQxlHkyWrSiTYTk22m16tNQGkN1chlV4C6HT0GL8Cegmzljk5UCA=
X-Gm-Gg: Acq92OG1U+yvdp66Nm3XcPH0FY2p8vJBrGINSKc7No/zmul120wegYH6+CuR1cIPDaS
	ty2uNPw53+x41CdQj7ugE9ayzoBfadWCs4UMXks70RYV0VxNEnUiRmaqCMdQK6CNUI78K8xj8gt
	//cwU4Ptx3YVEz53bJjhO9ffs+2H2EHgNQnqw1pd/VtXmqAciY3de6O2UFCiMwo59l83/xlN/L0
	Lxu8yYFF8owZLfYlZetL3uRDv3bD4SWxRjKNxPbtY1z5fDU6Xgnz3CgaPqAQct9uhaqaAY17yrB
	DhUN/yTO04xmWfiZfY0W/SnOUuZ0nSdsA9HhN8TVWTWG+DGVdBEe0oouH4t3Z5rQfkyvGIKE1AT
	lnTJ/z23HmCcJtL93ynOQXdhifrp2tcLKFx7TMy2B8aVKQbJWRrE=
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17064571cf.11.1779352639570;
        Thu, 21 May 2026 01:37:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8356:b0:516:7a83:8c37 with SMTP id d75a77b69052e-516c551754bmr17063841cf.11.1779352638906;
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:27 +0200
Subject: [PATCH 04/23] pmdomain: imx: fix OF node refcount
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-4-88c324a1b8d2@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1152;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S6soBSVe9KjUpY4fV3w6m8V++eYkYCwWMWeUkaW05Ts=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQhtpU/CqYzAaq1jp+LLLiJjIA5Qt/YY/0VT
 S3IUh2uDoyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EIQAKCRAFnS7L/zaE
 w1etD/4l9O7wUTmpxjRT+gvruneHUxzYHEIhXscwzHkmXXFaTqlBavoUQKz+sPAmBcudjOXscQZ
 mu4A2CkrCOVZtrepbcDAksLfqo0RIXfw8xZ6iNAc7TSbIK3BuxmxPm9SM9FrlfFCYlcXIlQCPU3
 VVJ56YN3+53SSoxDlaWqJqOl01UWof5ledWKTH8dzoqTxaxB+LlTLL2+tl6wzT1hIGLaHrq0NHx
 bCcVpM4BywkAyrn1olQuZt9D+PmGCR/zu4IqxjWNsg1Ik47sX+JWSrJCCDlVs9WzwSP6edRFsTr
 eWVh9X/z0Zp1hPf5XkuxC8WEE+ciQUi1ZtOFxOUY3Vjfup0mR2EWcJYYwcvH85XbmRz/VZugYMl
 LhAXbqUdasak8C0n65UmlfBHkKOBeIwN23suD7Yx+Q0ORyAUBdEQEp4N7QpNWQpHLr+upEQjLOY
 2MWtqbCVH++FysZ9T8ZwTwT0ndcQDFCyMi2V3eXQjB7KVSGpXFzWPg/SFqJSbL97xhV84W6Izaz
 hKCOM+EEUU296NZs3+u5L2wPfjObJIqYpxM9fKJuc1oRI1cjHoUUBAbdGLhOXXnN62XXTsUqhLm
 zCKbcupHSwPo+aF8UgCOTdYr82ZFVr+ZBQa5PZBJSIY2Wd4qB0rRonQwRh/TRYIARXk9niYp7WR
 TMEzEazWVqpnxdg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=K9kS2SWI c=1 sm=1 tr=0 ts=6a0ec440 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=3puIpDhKG-71yv69WsIA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: o8srlZvKqC69EBJIPooVVumc6-ROfEDN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX3NHghvTZ7DIn
 I2HVuAHaU/iTNIU8yS75XdLTq6HmFzqQK0EUEbJcODEdvZUn8jAs43tw/jNMLUBqNcwlMiM2xsc
 oiJ8s44EXLZCyDxG8ZrqlMgLPu/MRntx+RFekMBlpDgAq/PCtqFVTqkDVy5iWsiy1uYZvPwQHmy
 HHiXGsGN5tbYqGsCuRbtnoHJiYxsoMKtvWjcZXj3l+T0mr6/8aIlEgwfZxT1KN2EZYastsE7DaN
 Y+rqHBNdYTu+F96hUjH+7l4UJl4KYj2qU7oCfsmgldrznheN5hTMQLg20LMYjUI5lIh0t+HyGgC
 lFa2VLKgQP2xRXhmoUSdVLa8OlmB+ANneJ/kbZiDTESbT4ixuSrk0MXKWEhe/40jcWdgxmq1Kfb
 cZjNLkNXG52Y7Dk8U46efE+tkckEILErWlsop3RHbffBg1YQ7FMI+4BP8WP73+yW5jcSEwGqZnD
 0jowlk/2MAAGraupxSA==
X-Proofpoint-ORIG-GUID: o8srlZvKqC69EBJIPooVVumc6-ROfEDN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

for_each_child_of_node_scoped() decrements the reference count of the
nod after each iteration. Assigning it without incrementing the refcount
to a dynamically allocated platform device will result in a double put
in platform_device_release(). Add the missing call to of_node_get().

Cc: stable@vger.kernel.org
Fixes: 3e4d109ee8fc ("pmdomain: imx: gpc: Simplify with scoped for each OF child loop")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index de695f1944ab31de3d37ce8000d0c577579d64f9..42e50c9b4fb9ffb96a20a462d4eb5168942a893c 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = np;
+			pd_pdev->dev.of_node = of_node_get(np);
 			pd_pdev->dev.fwnode = of_fwnode_handle(np);
 
 			ret = platform_device_add(pd_pdev);

-- 
2.47.3

