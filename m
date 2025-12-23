Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840CE34B1B2
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484302; cv=none; b=d3I6ZQ2pywextObBUKwQEVlKsjcPrLbsHAygyPB5bnNe+DdoSWiM6/lpEeBtF37dNh/Trww9eXOIA6Rt5x0f7q8+JNJxsR2xyH+DGeY2MdByz7/vslUz12MUZuMVln47eV86HN9U4lbDgAus5zrzK8cn2U6xbhnZ+nIE6zNMZJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484302; c=relaxed/simple;
	bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rEsQ7O9rtaNhqJAws0l3VjwUFEcZKIS0781Ecaoi50NMM/jQ1eztVUBqw+rAcxRZKy0lOvSoFtXUzyxi9nHl6VTTeUXdbANbAettSMfUFDoHL2QIUX6kkF5GeL+hbQV48FjU3YmGORLI3jTJZwZr01sIRJQiEB6/womQ/Td/hfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hDBc7Xm1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WtOMM4fP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hDBc7Xm1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WtOMM4fP"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6uMOl1630677
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=; b=hDBc7Xm14WCUwBdX
	ydAdsZff03TWHngyey1Pu+2X9w8lpJQ8WXoXxsLDV/sWx/rCKolMlsPCE748pewD
	GkzPErUiE0tmavxvBgqF7VPF2/LxP76Me6aKTsKS7NQPWHCWhORnU+JRy7Z16cKO
	w4+gMmT/wURxKg4vtfIikrathOtNxtC0yX5z/Evrpl/1YUkPsB5+Ry16O1Cmde42
	xc9vzUQH045i377SX8iMrlQsnEtPCjTLqw8v1g6spo85v45kYIrFpnXTnCV5E+qr
	NqJRSRBtmLN/+FUQvQ8ixLHJpjzJg2TJ4ak2lHGUrdTNzRLZ689J5lMTcjh2vyjg
	0QxVDA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8j9x4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:04:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4f183e4cc7bso87594491cf.0
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:04:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484299; x=1767089099; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=WtOMM4fPG1X7YFppbrtd7cypBi1N1Rt6oT615e11MxRvGD3BQfbCNhWe4TDfLjrfyG
         GntQLemtnqtcm8aZnGKdx0ORyNK1iDLZ1yKKxbdPg5aHB+tkL7snjH3ngjTnz5EqIFtS
         +i6UpKIQDRwlSBLEKRoMks/IYEldWXG+kZzWA7xKXT5gEZ0fm9O9lF9ObuYeAJtInJmw
         RhV8JI4PG3rJXzv9Z+ZoLvDiY5IOagB+uUrdSG+iV/9klktN83i0++HKb3EFVEnhrYRz
         cqTPa/dX7whS73x8LBGNOi4+syYg8jkQ3aJCUXOmZ3xviucqNfQxQKmL5jFZt+LpXBU3
         S4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484299; x=1767089099;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p1rCvMDpU1D1vLVr0ykDBOBuZXm8pHvfoFh0GPY6oas=;
        b=Djr9QrRk7VBKSdSS/6tdNFmzAV88E7jPw3CLi0sk47HFCxJEaw47sbVFPprD7d8inh
         iQt8t1uBlyUu/ofSpP5I8pzhzyakY2zeCCeGFpBCZ55WeVbbbslZ8jTSEjItceeP9HRf
         lELPdY2thBYvzdi+fFhhlt63Zak5YKkqRAW/1eHYr4caEQAUYi4P/32p5FJSNShQ6Akv
         jDd19f40LhgX7fxWmdjm2XkCjp9CiWazL2t6zs7Y02PN5auOrVeNB0aW28ej/ONDdld7
         KOpiTneclT0wmof9CSOh5Lc3WTNYLp4G+d7jd8MPO8FIjj+0kzr63JMvViC0Yy/xBwmf
         MN2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWM7BJlFXd84N6uUinXoqgGkGRrRtETceP7ekGFTHEnbywI51MDiWYpIxTXhwnrbkEiyHE=@lists.linux.dev
X-Gm-Message-State: AOJu0YzNTbhnJNeKhilp8RtcVGY9G51RILhE2FnmitVeFCstJqXkHu8H
	K+Xt4UYAsh81cL+hmELG2cteLYR4i+Rlw+XBWZE4uLja8Mln8JeOJCR++MdNrfk/EFX1VSOfOE8
	5TwWT5BrbUVdJnBTqCC79svb01fv9FGJwEw4G91Rw7eBH4dpmtyPSLIA=
X-Gm-Gg: AY/fxX5NRuoVqUCwp/cH0GcPeYKMGJFdESda6eoaz5m41Mt38Poff+o2Mad/fnRTIXz
	ufvBAvcUwTLR4mDT750Tg3FsyrClvcsX22NqiosTJuOUCfWcLjY9auiLcvdWQgE8eNg0w45rZ34
	p2oxWjEs3Fpo0C0UB4Ln71DS1/iygOm5cpLgb/Y6YtYjbJgo/LV5Y1Yoobk1fgc6eZCervMbMRN
	U0lgoUy1wJwrRuEgVPrhPPQW7nmuDRZJGoTQ6scOqH8BlspMJWF2wueLDNbLOqbpAPixLIT5R1K
	6i0DLCzqkAF8nuYuLm1we+4M8MeUdp+xMDrzXGKhkYK1RQ7rSblIa1eEFKOqeHEfu1t0GcoRvFh
	O3rv9v5dNwhkoTetN712gR8Na0Es8ecYxiaupRa4=
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413681cf.56.1766484298472;
        Tue, 23 Dec 2025 02:04:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPyPkCI7wpeIXAWX4oTjp2cS/hulQz/NmX993pTR1thwF0IRRxKOlYnoldEaGrhaMGAtYLKw==
X-Received: by 2002:a05:622a:50d:b0:4f0:2afc:3b80 with SMTP id d75a77b69052e-4f4abd92eaamr181413191cf.56.1766484297752;
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:57 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 11:04:39 +0100
Subject: [PATCH 01/12] i2c: allow setting the parent device and OF node
 through the adapter struct
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-i2c-adap-dev-config-v1-1-4829b1cf0834@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1578;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9DuIEZPwzTeoXCwAXaQfazb/wfAxmGqBk6OslVsEIUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk7zl30HWFdf5toH7ZGKXOD8CIyBlVApBySN
 IwaXVxofDGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOwAKCRAFnS7L/zaE
 w3jMEACQwb8ZgE58DE3uw37UiRZwU/zhEQr9IPt83tPHLkgZTeqGX94iF4zPORHT1Sr6NycarTH
 GVHxF1XDkA0X6UnMa7Irhh1xeo/qFeqPke157JJl41OxB42h6ZeHStCofCqEkj4AlKSM2kDl/bF
 G1HXjnJ4IXxgAP3b7RzEiGinSsyZVdyG0CNKHWCbe+hdducCLVXpRx6nBhO5RpZGmlyca/6iBQo
 0miDWx0P4uwD90IWT97/l8TGMYnY6DyXRO7v4fRCTDmxeY8+797P6blElSuKf1KXLPLUPmnNoZW
 GxO+tpHCeutabKOcxnj0pASJ4GKqEHZIl2zFYTglOjkbQe5JsfbZiyOwdMNbBCrDlPU8SgGm/5m
 jLA03yUabJxHbPOqP84PoAtk7C7aYBw65DpZlloaVlGfKM0B6Shr7Qyyb4TR+Nnmypt9BnTcbLq
 Yvgb/jJWplS241rXMWFGIEo1P8zeNJGZIXMDaeZTWuDcnFI1gsK9EsXgdrf5EUERg/RLqZwD4ci
 byAseHFEQwGNSmVOdmnctOJwQLnfwDat/vfonNlqFxcjrSEH0qRpXao6xHBUvveYqJNBTBf4Qvk
 KHrDjxJXW6mFnMyC9z0wifTeZDxecTGHG5sQHGHGDGzdMQtsrwWyWvftqfdXiwqu/VpMOVwbSLN
 b+27NTk2zhOsLnw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: IC7I1dawWxJAGYvsFyxr0QssyzVASHxX
X-Proofpoint-GUID: IC7I1dawWxJAGYvsFyxr0QssyzVASHxX
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a694b cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GqsknrqNkdw30Ab-NAsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfXyZEAfCTWVMTG
 OsubKVk4pI56nMqPcD1dtEzXH1tPsQY2eevkbWDSMb1y6d25g/e2UMH8qsfgpb0NPZ0VLRnsEOH
 cE9Od2cZBXTy7dJgRJSCFYMG/isZ7toi0SpeNjt0lmE0dK42xqQzTGkLCLgDzS+5t0Sbda6ob2E
 RrQfg1i82aYvE8YoKoxTT0WLNVTXu3hvNThOwmd6UqVsTJyJmsvchf3RZdtjtb5OBP0/XwrNgFj
 ha6Win/bXDB0uXrtCmXcdIQhlSSiSm5/sdlhgUZirmkrV6WWqXR8juVF9aIaaOzBx6SMnR8i0Sv
 fdi7SfyWvyJhJ1YvnR31yebyhAD9puTiJY9vawkqKIY0I/XvhdOHRgSR09QACoGiBFMV/xiKIMm
 VXG5Zz8Amq/hHf2DcEjsLzbBbojk9Pi9KjH8ASDiYKt54XzPE1a0l9TUm/FjsQTur4uZZX/uXaS
 9leU36FMAEZYpYI4EEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

In order to stop i2c bus drivers from dereferencing the struct device
embedded in struct i2c_adapter, let's allow configuring the parent
device and OF-node of the adapter directly through dedicated fields.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/i2c-core-base.c | 5 +++++
 include/linux/i2c.h         | 4 ++++
 2 files changed, 9 insertions(+)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index ae7e9c8b65a65c415f5a42f0eb0e7a4ff3e86dce..732828e63730bb773b77ab59362bad8697a1ebde 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1561,6 +1561,11 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	adap->dev.type = &i2c_adapter_type;
 	device_initialize(&adap->dev);
 
+	if (!adap->dev.parent)
+		adap->dev.parent = adap->parent;
+	if (!adap->dev.of_node)
+		adap->dev.of_node = adap->of_node;
+
 	/*
 	 * This adapter can be used as a parent immediately after device_add(),
 	 * setup runtime-pm (especially ignore-children) before hand.
diff --git a/include/linux/i2c.h b/include/linux/i2c.h
index 20fd41b51d5c85ee1665395c07345faafd8e2fca..72677f29aff161530bc3c497d1e07144a44eb9e4 100644
--- a/include/linux/i2c.h
+++ b/include/linux/i2c.h
@@ -761,6 +761,10 @@ struct i2c_adapter {
 	struct irq_domain *host_notify_domain;
 	struct regulator *bus_regulator;
 
+	/* Device configuration. */
+	struct device *parent;
+	struct device_node *of_node;
+
 	struct dentry *debugfs;
 
 	/* 7bit address space */

-- 
2.47.3

