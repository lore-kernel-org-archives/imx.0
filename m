Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45677349B11
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766484301; cv=none; b=GxO1nW3XIGU4vr8nm8VMYcIOv4YEjIrGsRRk391iDzRiYY3VnLDlbkPtBWpMSezWG5aSc8MR79iAEpFAFSn4rwSadPhUMxwNyrjhjFjENUhsC0PtuxApyyYtPE8XAATZe3n2KR//b8KyfqhpwGxdvZvHxt/J4MAhkidvwHitLCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766484301; c=relaxed/simple;
	bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=f/S6l9XBPkT0UfzLnZqsW5OzsPUCGSdKexLHbn92n4WAxy1Clbd5KcN5zSOHiEFZv9jrfoFf4pJjMx51puqoP2gBluQRT8Li5L214EeLROHwfB+0KVd4EKjDgTmjCj3VDT+2GvBA9TD4NbDaun4FU3VqUrqnhkbCq/Bx1W1ckmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TAiODTnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YT/8R/Iz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TAiODTnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YT/8R/Iz"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN7H4oN4044741
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:04:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Rpb4W73dFQhb2fFVWipjtD
	js1BBDNzb3ATpS6fi83mQ=; b=TAiODTnZbMj6PmIgx9AmPxt9azJHDmXkcd8QmU
	d2caYjG+9fRP3dpKbbCX/MqqOww+fHK8m4ygpbKLPRL+NQdtRHTDvANw+HiejMXZ
	+KZ0R2ENLChWcctaHwCkWZXCZHPNkiOEf6fxy8W/5G6ncv6HNjtGK81Sk21UeqEb
	uqeir517kr20DQfkuFHKJXaXVz5TqxqtqLxrQfyqOBgi0Jc4ZQbmGEwiCLGBawhn
	6yV7zTd3clbDt+xqTydTPh04zn3+IZOG4drvZZZ6Zyvxl0Dhxec1AtrfcLBupWgC
	0f+hb355KrFHSK76YEr+Bh1/X4sbZbtLvmUKUHT+Kt0j+Ysg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuha6rv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Tue, 23 Dec 2025 10:04:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee04f4c632so91517501cf.3
        for <imx@lists.linux.dev>; Tue, 23 Dec 2025 02:04:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484296; x=1767089096; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=YT/8R/Iz/+0rzmJifm6WO3ZMkCSCIEv5AFKN5PdAOpVSJPo9gC4ApMV0fTXyQed8AB
         E0ta5SBIgOMg8z3cTNGSFuwyqloZ3JVq/AMFX5ivhY/Q7hdwq6iTesB+rM4k6i0yJI4r
         DXGtJ9kDPWhhogU4tvkk8UbzB7MkweY5eH50jb4uLxrwzDgcvEu9sy28EO0TN0FUcWAw
         9v0mquUVeD/MzN780Qf7OJvl3jhexWybuqmmfvPOplwFCiGODaTatJf0Wcjq8W3MPx7S
         V6D5LE6Km9HAM5djDomiZwEROsiaeZpAMM6qnStMZH/pDNqM3wqW4uLFX6jJ17+9/gAJ
         nPjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484296; x=1767089096;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rpb4W73dFQhb2fFVWipjtDjs1BBDNzb3ATpS6fi83mQ=;
        b=vmcb5XqQrQKAOYnKQHiv3TV8mQ+iGcF/E6IqeCYNHPQ9T6Kw1mD4gOo3q1KM6gGM5v
         ie3keLiJGtOBE4fIuEjaxw/OwXALqyo3FexMZtqolYqZDf4QU+GopXxJ2zRLPTiOEif9
         FLB4+WBGHveBNmd0DdqzAof4TWPJygaL8xr8ltaxBdTRrl5IYkI1B8PtkSqLPR8Jme+9
         aJBie4/HALpWfIR4ZO/xNqFahDDrgMZ57EEUSDw9+7DDl8IZbqPSpHMmgrxQHGB5vT7F
         oKgAdq+SQlzAtcKzftR63Eqrd2tHQkDD+PVoCA3bbcnaSnyHQF42v8QsyA0YJ29YeUoJ
         qGIw==
X-Forwarded-Encrypted: i=1; AJvYcCVsbZBPrAO3tMz0rWNEVQ7OG7Ihc97NbW41KYAu1blCbcXktzxt/uRN2k9idgDCkOeDdTo=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlcEgT/t9toFL//7qPns0Cffj8HjCCf2YIUcv3f+JZ2jWRBwTI
	7ZzLtCk85Mrf2uhw0OR+D+pENBsHXf0VrUxtW/n1XJ1gjBM3Sr1DQy8xCZsICR281TXapFGVpjr
	NOJOc7ztJFQYnJSMZU+v6UQfDPUPCoKxPg0H8uiqztePDcIjdYhpvd2o=
X-Gm-Gg: AY/fxX5d3qHXoS13NiXP/CoSpOLFMIU5fgJbZr0IOyX+fKlrl1U2GStr4xlgdbb8fTQ
	xAmrhSSO7m5SwOcsnvsp9I7RyCiw8mU9BHdBrBqOmGgnIMvrWZJ5H9i227LGfJZuw3ILUOptVFO
	4ECOVPLZlSC8dezRiMXuqXOYmBgJPuAFm9qJv1JmKWfmNQz8+54VW9Yog+oFRHO7R2xGd76IIWS
	oIoMGY0PcBZpo7JOueaPOFb7C7JyCrmahtEZgetyxZ0JvpDLw7wIfi8CN3WKaXRxiNDeyf3cF0T
	l5qCsknQALPHBqw6g2kGekcpTP/ne2DoFQ8XJZ1F0bVnpLlib9wF8AJSVVgCD+yu0dUjcLQSqw0
	MNuNh6c5xSnvydLtUl9SEdVGdIswJdvjKfp/ebnw=
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204815141cf.16.1766484296290;
        Tue, 23 Dec 2025 02:04:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEiNHKqDKCrFlscF1e8nxZ5lfR1gZCs8573oK/BJMiXsdrVSl2/AbVhz7yPs2GYVwiIg03KGQ==
X-Received: by 2002:ac8:5cd2:0:b0:4f1:83e4:6f55 with SMTP id d75a77b69052e-4f4abcd06f8mr204814511cf.16.1766484295661;
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:190a:1976:65e2:c61])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193d4f09sm235035025e9.12.2025.12.23.02.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:04:55 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 00/12] i2c: configure parent device and OF node through the
 adapter struct
Date: Tue, 23 Dec 2025 11:04:38 +0100
Message-Id: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADZpSmkC/x3MQQqAIBBA0avErBvIqSi7SrQwnWo2JgoRiHdPW
 r7F/xkSR+EES5Mh8iNJbl+h2gbsZfzJKK4aqKNREfUoZNE4E9Dxg/b2h5yoh643+6zUpEeoZYh
 8yPtf162UD/OF/y1lAAAA
X-Change-ID: 20251223-i2c-adap-dev-config-9403ab811795
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3406;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Aessx24OljIFWC+mc2LsHK/66rMxd0lRq5JDSMHPZrs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpSmk6CFIKSo02FUVtncKxbJmpddSLBsdGwlGxk
 3xgKHq5LdWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaUppOgAKCRAFnS7L/zaE
 w9lvEAC6IPKCIFxQKEcT0e9etvsanf7pMOhUQltvitPug6OEIG0KYMeK/K84tQWkYK1rDNEM9+S
 VInnmCouxiX6wvyRpsmIWYdoTH3Hx0NwbMAtenLaYgj1HOqPC/2T4EfL2fhIHFks+HcwQJQtX/U
 6IJHl2gOPKIqt/Nsdy7uhRu+dsZtrmTox0QcIWDnQ2u1AJHSOPrUWAP2bziaEPzvN7wMFnmMI0L
 yWjqOuw6piX/7Jv7xgdIphnmGvtOjVJY8CN7EzZPssJk52TGwSu4jbPZ+oh+VVPDc5ednw2LJcG
 GbY06fhDBfb2tk7U5drjc/kU27DZ7CjOZoBeGXE3FMBPIKQBarOf+PxOssqRC6+0y+CfpBs/DWW
 rk1QSObI9tMRBTzeqAMF8jCp6dqEm7lHH21J+CnG3Ed1AFcnI9zYtDqbK4FKGKA2z6wgf0gwQbZ
 48KFlz+jGZHxm7KimHiLcfu5XZqlSW0GKFLwH++KbYffIP0VH8DrDBU4X42xbIZr/WaBfen+HLG
 tgpottRsMj2BslGnnqPwbYb70GrH0NM1WEm1Afevt9odAaChxpRNm0sHJHpnE7mukt8NUqfWiVO
 19KRrejHoawa94lLIdae41mcZ60Yr/TOm8q9qNfStSjmOFamByZqVSisccC+ixsP/EnQD1TXsYA
 hicHpNR/3lUOyWA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 3g-3yA45GST8Fe87H_FUlJD1NTj1xv34
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX1WmGxdOGLYX+
 TRnsNYdXqFtfksIXDtTymwI/nRfrCSruP4I1cyfqxPnB54+iH5sSAKQuQk1lPmqERZPwwEk3Qwq
 qjf3BcxOTNq7Gi2AhDdazaJ4IIc3IdvjDbL3sIeCZ2tWTDnurSVoAEv330Ihrebn6jUGiu2fLeX
 GckFC5klsuMnH8LlhrpXD2Z2I8sndervvThR/vop0UyAiF9uRbBEO4sdoHgryNkM4pw/b/a+rwT
 i7K9487QAd1lPIO529EX1xU3KM/j4hG6dUEl04bSFTE6TEeKRdqJYYzbWJmB66V0u3neg8JbgmH
 Te/TmOtJFIMSl/Z7oxtIzNGzAabFqrh8TvzpaQTmN6MXRWpTXMhuonAenNJ+hEmsLAwjOY4eX1o
 pH5Pp55FejdWrsWvY1+Ee/mJWlbFHv/WD8cVdbaqZbbJ9zDT3UzLM2R+uQmScaucM+eW3VX2xEk
 FhCfi1Vzu5cc7phvc/Q==
X-Proofpoint-GUID: 3g-3yA45GST8Fe87H_FUlJD1NTj1xv34
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694a6949 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_sFN2lLQU9JdPEgOWvQA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080

It's been another year of discussing the object life-time problems at
conferences. I2C is one of the offenders and its problems are more
complex than those of some other subsystems. It seems the revocable[1]
API may make its way into the kernel this year but even with it in
place, I2C won't be able to use it as there's currently nothing to
*revoke*. The struct device is embedded within the i2c_adapter struct
whose lifetime is tied to the provider device being bound to its driver.

Fixing this won't be fast and easy but nothing's going to happen if we
don't start chipping away at it. The ultimate goal in order to be able
to use an SRCU-based solution (revocable or otherwise) is to convert the
embedded struct device in struct i2c_adapter into an __rcu pointer that
can be *revoked*. To that end we need to hide all dereferences of
adap->dev in drivers.

This series addresses the usage of adap->dev in probe() callbacks where
drivers assign the parent device address and the associated OF-node
directly to the struct device embedded in i2c_adapter. We extend the
latter struct to accept the parent struct device and of_node directly
and make it assign it to its internal struct device inside
i2c_register_adapter(). For now just 12 patches but I'll keep on doing it
if these get accepted. Once these get upstream for v6.20/7.0, we'll be
able to also start converting i2c drivers outside of drivers/i2c/.

[1] https://lore.kernel.org/all/20251106152330.11733-1-tzungbi@kernel.org/

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (12):
      i2c: allow setting the parent device and OF node through the adapter struct
      i2c: qcom-geni: set device parent and of_node through the adapter struct
      i2c: bcm-kona: set device parent and of_node through the adapter struct
      i2c: keba: set device parent and of_node through the adapter struct
      i2c: omap: set device parent and of_node through the adapter struct
      i2c: rcar: set device parent and of_node through the adapter struct
      i2c: st: set device parent and of_node through the adapter struct
      i2c: mxs: set device parent and of_node through the adapter struct
      i2c: highlander: set device parent and of_node through the adapter struct
      i2c: gpio: set device parent and of_node through the adapter struct
      i2c: nomadik: set device parent and of_node through the adapter struct
      i2c: bcm2835: set device parent and of_node through the adapter struct

 drivers/i2c/busses/i2c-bcm-kona.c   | 4 ++--
 drivers/i2c/busses/i2c-bcm2835.c    | 4 ++--
 drivers/i2c/busses/i2c-gpio.c       | 2 +-
 drivers/i2c/busses/i2c-highlander.c | 2 +-
 drivers/i2c/busses/i2c-keba.c       | 2 +-
 drivers/i2c/busses/i2c-mxs.c        | 4 ++--
 drivers/i2c/busses/i2c-nomadik.c    | 4 ++--
 drivers/i2c/busses/i2c-omap.c       | 4 ++--
 drivers/i2c/busses/i2c-qcom-geni.c  | 4 ++--
 drivers/i2c/busses/i2c-rcar.c       | 4 ++--
 drivers/i2c/busses/i2c-st.c         | 4 ++--
 drivers/i2c/i2c-core-base.c         | 5 +++++
 include/linux/i2c.h                 | 4 ++++
 13 files changed, 28 insertions(+), 19 deletions(-)
---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-i2c-adap-dev-config-9403ab811795

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

