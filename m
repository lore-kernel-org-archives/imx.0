Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D463E34F47D
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771837572; cv=none; b=F2yJmll/uPPxOhzlNgkmrrAINPgrfFRLkmNdo3dBgi9n9nNdwADVrZMAClwPibmXX+RtQva4PdCzgJJwAF7XYODz2rAx2teqcJxEdQMqGx6AMwFRdmbBypP/E7J2orqacH54bbvIl3djnNZcOEoDfwWTi2sPiBVAenirSVQFXlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771837572; c=relaxed/simple;
	bh=q14XiC/EF5mMq9yShl9lco+1y+s7ckLltoYVG3d8oSg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CcL6webFjzN9U6Pu9SALHGVCqOD9PbWKoBsvsvQDzFdHX/yfLyXI5nCMrndHY3u9aMD9zgBtC89vqbvCh+Z6CVENI0yFz2BVL/9Q3uPzP2a6L00E2bLZHnQYO/KDWdfegqBDywTITR1Q5ZzsaCkJkBCCt3ICIv8vLows+zLMsZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Eadl/oy9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eDxRRbXj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Eadl/oy9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eDxRRbXj"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N7evkf1745021
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=; b=Eadl/oy99ixX+Irw
	Mw6rBWyk6+0xGz1YjnhR1h83EMiNdZIX61oSYTTgbqwlWVvuydiXAN2nwiyYQj0e
	fGncTBKLgHakQ+3yxzp0lnw0Kqv2Sa3vY0+vv5zMo7MjSEhNctdPK4fYF5K0I3km
	j9MrnaeP6avPVBMTR4etuiHed98B0OPmXnwztGhhJ8i8cbFuwrOLU/kLvmTG6y/3
	warZ/T4W15BP2Ig2kh42+Y3ld5eeeU1Wks65Sui/dN2tN0SkSX+44Hung92tgogd
	C9TdcjmUHhhebL4kjsFIyXDrMo+SfoeFDQQ9YtwQC5Rbj+Fgjg0gsVChKxYbbqGI
	5gCSNw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vgv3ex-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 23 Feb 2026 09:06:10 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so3869740285a.1
        for <imx@lists.linux.dev>; Mon, 23 Feb 2026 01:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771837569; x=1772442369; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=eDxRRbXjLPSrXoO7XENcjQjERnwEv43bVtmIhdw4RQ2Zgt/6izDG2hCLjyAUzO+HOw
         aY/y9KuDab3yWSvOqV34WxJeQm2n27h6HBg2Os3tC9og7gJD6kxqRq6CJi2FpWOUq4ot
         Ua6RNIhFpuSMgTuCHFdMxF+XHWBLqtBBQiE1elNRIfo6DztcPMXjevUgOBBzZwqJHk9Q
         jiNMXjWrLNEzOV9jxlvkzwuU0ifbF/DUHa/I+ssMrdnJI3C206i0m3lyb4bQeSXg0q4X
         gnuRSUnC2rXT2zqNvh8ZR4SUGL/3KTFn8Z43D6bakC+r/rpU71dPXN+TJOTy0gjRdEXJ
         eZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771837569; x=1772442369;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4tkjt1CvCdql7jbfT8ajkPQtzV1KFX8BJmrR45NSdjo=;
        b=OOZLa1p0EykiC7eDc7EkuLc+TgJXCLVXRAZ5nMqVPScRp3h5IdN4qlT0qWJR2djnpS
         IlOg02araIVl3HJyJi2CFcL3w0CVeQBBiEhoaGQMunAzKdESPTJLXmIl3QgqO9Htct41
         7FKYq6KI1OYm4cd3sgEKYMFgC8Ih6m0m4LtnPboFC302FsLwqSffVLUd7jGmixbMJ4uj
         U9C9Mks0+T7BxL07wZ4WiQ5e+MloOO3hnCRTcltd31luk5kqmR9K+E8FJ46IGJwlzLVB
         z7DIawm7IyK1yUigDmOmH8aHFWa+Lx5lSgHO2Wgr5sbvxS/BAvuhyC8R9bxwF/DqJq49
         gHgw==
X-Forwarded-Encrypted: i=1; AJvYcCUq0wIkO9pz+WxvDlhlabnQCMk1mnjG0zbQot9GV7mjLu59zIAkKj0fK+TYW8lB5t+Z4qo=@lists.linux.dev
X-Gm-Message-State: AOJu0YzLKDSjG0zrj+ZglIXoDKZFlfzoF9vv3Kv9Q6LS6a6wPf+F9rg3
	QDKiN/WI121L8jS3r/Y/RGG7QMFdKFH7VBTvmQE/LM6ixg0lVAQEuF8AypElUQdLKZrkcklmKbt
	vDLZ9ApDCh+8nfP3YWUnwWOzqCrztT7rlolFsZdK3uOG4H8d4pPXZPke8p0P6i2A=
X-Gm-Gg: AZuq6aIxqMFmqCMLSeIz6/WRdj0zOzbjVOgWp642BgxuAA6wXekzJmb1tu0iHbKOsN1
	644SzKXDpKltcLlhdeQAA+0WHIQwGEXYkjHJGDgF3LXtA8rNnxdSAfrLApl11TTUjiq4KAg46xy
	UCsEpz+5SHWj9ClP9VYmNUB9SU4UrGE+xZeZ7co8R/EeTMCC7hJrdSSzywTd4phufXsh8+5HnUa
	3uB0jITXrCUXvq91vsqtD33r9KxTqvtt1PVE0A2thyr1ovMvxoDpBCLDeONJ9EWmi1hZdSOvkSy
	1X/8cMpUW709SWwnHJQ8Ufvy8G2o1zSn9bFyyydBZnex11rxXtnBri7oHTmCCPdG30jl7c0yzrM
	ioBRKS61SuteCG1f19QaXT8ha3nkDPtPgpKA7Rn9p7//YIxcYzmXt
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071111085a.33.1771837569228;
        Mon, 23 Feb 2026 01:06:09 -0800 (PST)
X-Received: by 2002:a05:620a:2986:b0:8c5:310d:3b2d with SMTP id af79cd13be357-8cb8ca03e68mr1071106585a.33.1771837568736;
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bd71:422c:5e83:8b37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9feasm17791593f8f.6.2026.02.23.01.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 01:06:08 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 10:05:48 +0100
Subject: [PATCH v2 02/12] i2c: qcom-geni: set device parent and of_node
 through the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-i2c-adap-dev-config-v2-2-d78db0a6fcf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1058;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q14XiC/EF5mMq9yShl9lco+1y+s7ckLltoYVG3d8oSg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnBhxLArCtmmlE4gRC6CeGEzvDnbPvKlM97OaT
 prp2vCjynqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZwYcQAKCRAFnS7L/zaE
 wynfD/9nERsf8qMwPeM4IonodXdRsy+F64xQK/uJ8mfcnvZ7ZSWSuU3pDRsjoQDv4nAjW8Z9/Me
 SHXKyhu7lahHo5a/SFSde4mbEa/ZxhLn7prdnZv4fcEfiMiOMd8iLOHm/J6KiothsVFfhV5khGi
 7JeEH1JlSiyQsO1W+QsQ/cvXeyYjWUxQg42KyPDMfqn8Zu97Vm+ytckEQNKQnjQ8B8Yf+tf0jnQ
 LqrucTueZ3rYk2i+SRB8fFmC+cSQxO3gfUJCPowDsROzIKHlG6ANnCNw31IBb0KfvzYnqsCm7oX
 id0Plrm1YjxV3inA76Dl4Swu14UqUX8C78Xm41wBD6JVYkfzuewMmNLzCtbW5wj84Y+461lTBns
 ERoDa4DNFoDRhrZlsnivGFpW+deCli/KIqn193yageDShkXqk1E6O8/wMYKMRq/h/JjHml2c6Y8
 mxi3Jty4CDeG2zPkd4Kxs2P7cNUBe07XoM1i9b/X2z38tI7nklLkL/ciyoYbCdJb1fJoT1+z25P
 PUXMf0/Rp4RbJZLzyEwM+2dHiUJLfu7qbFPhUDHiZTjXK0CjZ0ol19qi9OSS8NapU90EqB1KQyG
 StFY/1gRv1rOXL81boZNNJNWLYXe84MuRjktMGzdPXegmAFX5gU0VDPtI6a8CWXOxLHMdHfIUaA
 zBF6WRa/X+6Bv/w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA4MSBTYWx0ZWRfX5NKgX+G0sNIv
 wbocsNRhhHEXEe+9HmQl1HJVJg9LT6rvVn01gAlD/QPGIdtTq1iwVlXTGkkTCAKkSvSB/85a7dW
 nlQe9VpPLWckXGbb/FI/kzG9xkIVp4gm8X/DkSnR97GepNDj6lBuRrJQd/YeEinqcRjbho3jAsr
 RNPMUGsPwOMYHacVoh5TtjWySc17oHWn0zDfgSciiTXUJVyacfFkfIj/d8HDfeqyQosEPuet5UO
 9+sMemnHAoGHiUcTKTnQmkFAcltEeib3KHCeUjuNHQEzFjPjzrq8cI2eKbJCxScDGRUIzQ/a36c
 iJJ/wm0VcZkFACyEmbZrcVkAXrFw6l9Q41wiH/89LfC2+/SVgVFijODtSgo0hwDqQZT11kDhuQv
 nUP7hgGBZCVIbkm1N4TmC6zsdwj3UDjMZM6YS3DguAL4q+y1fJ5WfYKHGyQ/wx5pr2Ezyj7GlJZ
 QI1P1CDFNiMyr7M8YMA==
X-Authority-Analysis: v=2.4 cv=W+A1lBWk c=1 sm=1 tr=0 ts=699c1882 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=GyXxqrRC-9zytgsE6zAA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: _NXO74YujHmaIQViPDupvSwBY94rj3YS
X-Proofpoint-ORIG-GUID: _NXO74YujHmaIQViPDupvSwBY94rj3YS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 spamscore=0
 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230081

Configure the parent device and the OF-node using dedicated fields in
struct i2c_adapter and avoid dereferencing the internal struct device.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-qcom-geni.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4acb78fafb669f49e71f739764b9779617f0cb5..d930d198518718aa107819cfebadb9e32a1da377 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1039,8 +1039,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
 				     "Request_irq failed: %d\n", gi2c->irq);
 
 	i2c_set_adapdata(&gi2c->adap, gi2c);
-	gi2c->adap.dev.parent = dev;
-	gi2c->adap.dev.of_node = dev->of_node;
+	gi2c->adap.parent = dev;
+	gi2c->adap.of_node = dev->of_node;
 	strscpy(gi2c->adap.name, "Geni-I2C", sizeof(gi2c->adap.name));
 
 	ret = geni_icc_get(&gi2c->se, desc ? desc->icc_ddr : "qup-memory");

-- 
2.47.3

