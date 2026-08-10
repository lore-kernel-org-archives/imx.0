Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1640A928
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786373515; cv=none; b=u1pYSudGfsNjZ3ZKHrgh56UQaTzNA3acyGrkBZtAnIczAUlePC2kHlImaJAgR9VZD45byBVBvcZED7HDdMVSRWgLJ040aIoTf131oArBxlt5N6j4QUsBQzsY4n0NYFp87K50nZVNyUzwpC15WpGd6I+cSJgCJ8zV1JxoBnyYs2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786373515; c=relaxed/simple;
	bh=n0QwEGmm9QPFYqEaWEPfuhWwBfoE4E6XocGYB82nrkY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=H2LlxRzCt+dQgtN89kFNISf+Hovw6RjornG6m0klKzUkmCx0bJtknssJ9fqTOHN5s5UiTWwq2KoIyt5jN1wyI7wKrbp377SisB0JoumA/PbbgI2Ei2hD2G8xqvcObzxLEeT+2m2/GEFfnKTDaiehCaLaNZsHTmFqGsUgsrxfT0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XpAMESP9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X5m2tZxP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XpAMESP9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X5m2tZxP"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67ACj6FA915867
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zxqhJG+46XP4U4QelHuaFo
	OC2P3agnUHF42PXfBS3WI=; b=XpAMESP9n908IPHu947b12Bsdz2BREv7xJjkq1
	M3rZwDXCp+FBLV6Rm2JhQit7XzeMRbZZXKBnaUclwygxoW05+JAvYfXfNx91QFfH
	vkyIp+V9uTqlbwYvsxxuW/Ix5pKVIEWE7qiH7mYbdDswT38uLhE2mV2e+aJAzZ6y
	DttSM2tMJFt88pLUsq9da1UE+m5ryWqDgejk7jQbAMEuhJZYCU6bT1ymKexbq+xg
	SAFmlcdSPjPys1GXycjAkLH49vgJJmWq8KSg/iaSVHaBpxWZhUGT+JvzAKnnasNR
	OkHHKU+IzF6EE5Jhf74bitMEAJA3NIV/GCxgr2CaPTDUe16w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fy8v921m1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Mon, 10 Aug 2026 14:51:51 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c1a9764f0so19682711cf.1
        for <imx@lists.linux.dev>; Mon, 10 Aug 2026 07:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786373510; x=1786978310; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zxqhJG+46XP4U4QelHuaFoOC2P3agnUHF42PXfBS3WI=;
        b=X5m2tZxP6DYu3R9MYJOOopJs8LUZZegGnO66pQnHZyXF0yhpKAE73fLd0mbmBIMB47
         7AozbFfigZf87eYAPuWSMGlIGl8rjI9UNADBx3Tww6HbNV9/fU+K0vs/Alx/130LDnU/
         EXHNKFqWuF404c5n/7jz+cy05vzW0IMX0yirfPu8g/9JxxF3SWlhdyb7raGYOPJFkTyf
         IqPQRAUsuPfYOT8JI3knWDwgb0kjFEd9X5NEnbWE/ERFme1k76vv0L0ahpKMqOr1c2bk
         dr2zqoDnhOA+A7Xgog2CHtDd0mJqorY6IfycxE5joarDaeNT/jrexfOPjUO4qpaHUQUb
         a0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786373510; x=1786978310;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zxqhJG+46XP4U4QelHuaFoOC2P3agnUHF42PXfBS3WI=;
        b=jbSZdolvVOFFsRcgX6vFzjMfYCv+3NCs8pkvyTkunUuTZ4Dd4y+E9O3QCmFBE/AO2w
         YaBt6L0lE2eFc/DwKX0uEENVawCpkC0tAEL5Ny+F1/mv9iFAY3sHayu7iMJy2pfaYH/X
         O23bU7dZKqIgYltHn1QYg7dxtmMoZfSg6lRzE4BDA3MyU8UofAdo6W0gqL0bnNCm+8h2
         110OSzEBqf8GldwA1NwH1koMWeHi9D29O3N0+h0kl+s7RlKCZKat2nb5soB8RQNlgF07
         7o2psOFcJjLTucnRqedFJ3fBS4RwBa6izY1Slp4ied3G386Ctteb5cF9f/jSabqGr8i/
         esMw==
X-Forwarded-Encrypted: i=1; AHgh+Ro+maZF1epqmzPIz6Ur8t3PkDZQgX567uAVk78N3Hk4OlTdghF6Nym/zsK0IDh0rpsYhU8=@lists.linux.dev
X-Gm-Message-State: AOJu0YwVKxBjTUTiWZYajxRnne9d+ZGqx/8xRiZLyX7wc2gT+OLxVDCT
	E8JwwJDCOyJacPcOh0wsGxnyuHljfuB934d2Z/pzQlGXmupxXKy7098gUR/IQrdw4NPfRC/mmgz
	/9Je7wSfZh700sBmJ3qo4mOLv6LTzR+MB6AmbNVg6W87xOW5oLlitCs4=
X-Gm-Gg: AR+sD10e7VNA7WD7ag4IJhcB8UkmeU6IT0XKh8jZ3igSPMDixkj1Ciima3EMPgLGUIX
	BWsmdH6qZnHEvzEHEoBHXYMMuUCvfU/KfvmgQHxJTbmPF7IPTWN/qpCiUpIWt8zeG5mK82niuQO
	ZBzYpz1VdU5fpT0sCrs0jJIeTR+DfYjuO6GaAqHS2ELiyHki6jOOMwAq5zIZYJUsC8FEeJ4IxwQ
	2Wg/hcbxPNVSEIZ6NLtHAru6g8JKShaJ5NNMHFp75GfCx1lTfoqSqT8uMs2KbpI+ciDamWvp8im
	Q+LmTv+xYQKuawQrmHVwaWX8Gsa1rYo3Pkr3iUZgpkuz+KAmnZuVqgFoyzkHYvUgvMQmKUbwmTc
	Icw87az5f/0sDEa7qCw+i+ohNmZJvyfOtBZYcuDBwlS+EZpFKPcYyWT5b+JLWHVH+L7igw4JZeR
	E/MptN4VWLhQGkDQ==
X-Received: by 2002:ac8:5907:0:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d20960822mr231816031cf.16.1786373510477;
        Mon, 10 Aug 2026 07:51:50 -0700 (PDT)
X-Received: by 2002:ac8:5907:0:b0:51a:8f3a:13b9 with SMTP id d75a77b69052e-52d20960822mr231815361cf.16.1786373509999;
        Mon, 10 Aug 2026 07:51:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39fddd6a796sm22489661fa.36.2026.08.10.07.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:51:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/imx: fix TVE / HDMI coexistence
Date: Mon, 10 Aug 2026 17:51:45 +0300
Message-Id: <20260810-imx53-fix-hdmi-v1-0-fff9b1b17f25@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHleWoC/yXMyw5AMBCF4VeRWZukraC8iligg5G4pEWaiHdXL
 L+cnP8CR5bJQRldYOlkx+sSIOMIurFZBkI2waCEyoSWAnn2aYI9exzNzCgSqQqTFzrLNYTTZil
 sX7Cqf7ujnajb3wrc9wN7Z1CJcgAAAA==
X-Change-ID: 20260810-imx53-fix-hdmi-03129d798678
To: Philipp Zabel <p.zabel@pengutronix.de>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=n0QwEGmm9QPFYqEaWEPfuhWwBfoE4E6XocGYB82nrkY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeeWD0drxB6zJyouBN6QZVzN8RjwVSKS4JXKly
 Mt49RWAqPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCannlgwAKCRCLPIo+Aiko
 1Y9jB/43j39n7WjjoMAQDWUq589TaOBcT8q1aNzDUtM3ol5l786d/QI0TGEFznYALxKC97mF56N
 Kug2nJmXQf/kJM90Hp/mhuIZHbvRTFtQGm7t2TspzdZ+9+CUVQVEw2D/Avr6u24qwjgkp+Iegky
 7c5+9hXHjOC9vMYPo3Z3v47TZCKp9g7eD8AxFloZlpaFVg5BDLKI3zaUTj/zYTHkytQVTWLM034
 RMtR31LoM8xSE4MA7+lhJT9Omo8cDnfNb28GJePn/vECpbvX7Gcr1We0e8q0+ixsQO+UEI6iOZY
 huAzUDgnPWuQzxRI/HFK0w+1nPR+QA0fNkmtRF9B+edPkoJP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfX8BM+Ia80ZMjE
 J9OcZ9S6EjFmlXCOutDcBpwWBtnjHlSbjE69FvUYJUIF5i0hB/SR27FW/RZZpAmt4+QL7IClK0Y
 OMSBA4R8j5P+SISarrXAVz1jhsxjoAI=
X-Proofpoint-ORIG-GUID: mqx-nL-cJkjzMhsD8-PiO7ylzFhrsbYF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEwMDEyOCBTYWx0ZWRfXxCcUO1sneMWa
 HwqKtD9GLdErP3qjuVSXCqtx1d2kMZJqhaz1eQlSJh6+69bl0DgqNVU+4iYpJR+Joa0GEJsbcUk
 9q76X+1djMEv8WhG4tsX31vqT17TnhOm+Lj4aEra8IC0xJB1M1pHQ6eGptyyBPZR8+BnPw0ZYTA
 dhCHFpAUOftXcAMYiXVsbrwip1TcaYRimUQVn+2HY1aO+s1UmyxubkQtRswfsorB6NA3UzjwiAF
 xv+PVszNbqpGqyfiWzF4cpXbadfAxA7UiBtTbMXc6Xm3JVJPIU7MfdRggd90TW5ebrhaXdMCR3W
 6paLfoDOcb0pRIAsvq8TW4RMQUj51vKIG+WKzgNVf71/HMQPJeMtZmBYKfiZ0lEGClU6V2DOujN
 IQx95psEp3PhUEEIbLuKa4bc6gojB3Hze5/bHIcOZ/0mwLvpBhWKv4i6To3H/TD7eo9z2YkCXKR
 7PkZNmzxdxz+atV433A==
X-Authority-Analysis: v=2.4 cv=T5m8ifKQ c=1 sm=1 tr=0 ts=6a79e587 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=qhRTTLL9oDwathZehP0A:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: mqx-nL-cJkjzMhsD8-PiO7ylzFhrsbYF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_03,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 phishscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608100128

Testing MCIMXHDMICARD on IMX53 QSRB platform revealed that the HDMI
output is broken. The TVE output (even unconnected) forces the PLL4
frequency, breaking the frequency selected for the HDMI output. Fix
those issue, making TVE stop grabbing the PLL4 frequency (by correctly
reporting if it is unconnected).

While we are at it, fix two plane-related issues, which are now reported
by DRM.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (4):
      drm/imx: ipuv3-plane: do not advertise separate alpha formats on DC planes
      drm/imx: ipuv3-plane: add the pixel blend mode property
      drm/imx: imx-tve: probe DDC before claiming the connector is connected
      gpu: ipu-v3: di: report an unattainable pixel clock

 drivers/gpu/drm/imx/ipuv3/imx-tve.c     |  1 +
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c | 49 +++++++++++++++++++++++++--------
 drivers/gpu/ipu-v3/ipu-di.c             | 16 +++++++++++
 3 files changed, 55 insertions(+), 11 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260810-imx53-fix-hdmi-03129d798678

Best regards,
--  
With best wishes
Dmitry

