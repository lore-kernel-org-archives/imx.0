Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637593BCD2C
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784192579; cv=none; b=k1TSsYSBV0kn9pmCXuHCtFvR+8137jUgWE83oimpyLdCUqPKzrZ1h84jJxZhX2C1UE+dnENLBnbzr3EhwBcYFVM4U8azf9jbqXSg1s0QsmaeDOnlSZM/xfKHlMMihc43QuOT+WTa0WcTudBeYcpQUr+5TPh9HmNWjJUekSm/xDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784192579; c=relaxed/simple;
	bh=LslnXr/GYqt7lILfSX6H30ANs5TVBAPc61jkQsfXePo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=l3bdRqWkziD54iJn1ilySHLepU+HQKYABcA1UHK0c2PBLIhLnZjUB1f6qhxzDf2wFgAzu8bNcQZi3LW3O/aq5Nj4VFEaP9z8X1RjcH8XdBHsBux5rseWi7rCmA1VPEO34N1/VKdf6whO++os4KV5jsB2p26XJPAUC4LW7A+UfwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V+6oa4N+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zz/o8UyW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V+6oa4N+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zz/o8UyW"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G836KE2123123
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ublGuK2L8LkFww+I8N33BP
	NROB2FHlpEAQq3id5WGFg=; b=V+6oa4N+LgdZwM5OLLMLzcpu+E7cXBM2MjtCEL
	paYclXuXv45UgosyH+b9jNiKowTXide2Ruhznp2OXf7vih/6t8cP9bhAYTrzPSt/
	jwyj/Kl71gtpnD4kZrMhdE08ty+lQDmLltP4kJyeqX/U1d3yIHP+be9yi19Bjbyj
	SH5VGFy1EQnvdryRsoFC4scN7YkeMd7XyOzadCndh4iPReYTiK/1SpI9rejhWLFs
	J889JR4PrWpy90cTbVS6USh7agUADPwTnK6TH/bG9yig6w22YsSkxL9A7Z4ZAD3m
	qqv71vdY/Wi3BhnG0Ug0fBLjBQLCOvcd6SUZuiNjnMDruDiw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feuex071u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Thu, 16 Jul 2026 09:02:49 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c7f385887bso154814035ad.0
        for <imx@lists.linux.dev>; Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784192568; x=1784797368; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=Zz/o8UyWttc5FI/gQhUsFe0G5bn1tuu5rsIwGcRwcEccH6Nm0oOfbQNBHfDDsg91Nq
         R1HJ4jiICya5Lv7IxbyZVpYPCenUi0uVM2KMLk0fUjIb/C+8bd6beLkcOETmEzBA9MvE
         nD+NFwlQaZcsDOHIUsAskq/pOTQvyBt+rkrma2tpdGxhniXML3u+nAnxr1ZqoatU4XXw
         SVT2z6VVtEoN90yhDR3F1163axxHJMEcT5hTQ90k1gtwxGRoioARVThriyZ5dgFX7xKc
         SA9qt4ID2q9nzm6XhASfzhCO0mI55KvZsqu+PbsdjJURMFl9+lyvJEFsAs5hwbuwFeJM
         L+SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784192568; x=1784797368;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ublGuK2L8LkFww+I8N33BPNROB2FHlpEAQq3id5WGFg=;
        b=FP9usX4M1C8eUPwXIRPB7lJG1gGfF11FpDDFLKn3s/5i5Rqr7Ra3TpqLe2pFVRr+zQ
         8AO01BU/7VKwcRkWX91qBEAYjYXkG9M8bt19LvsuwVDFgoAi56zSdsf9W0qqXaa5SjSY
         urj7SsRPcHHAmRfXbwiXr8ah6cNUTX21a6hg00k+vFZtwtdgu1j5QBjpEkcskQ/kviDT
         Ga7ilfhLHukbW8YWJXrQ0NEz2f6IJHFMLQ16tlbAk/mmUPgVwCeP68+lXe30QI+/kkFy
         TPz7APOb+tsmHFAzXaMGBPxX76pJ/7Bn/hwzvMR+Gae3phb45xY4O+RD+rWuaYI8evuF
         OSEg==
X-Forwarded-Encrypted: i=1; AHgh+RqLkf4+Tdbf+bfFrp/egyFxWjRHDL6qG+a+akHlu0IsFxwp00ihFuRyrwEGq72vLTHZ/M4=@lists.linux.dev
X-Gm-Message-State: AOJu0YzWwg8jYoqLyupe2go3fojlnr0yZvRTYQpHrVbiTuuWAMEcMQuX
	s85jCNn344Vq8eDluHjoxmoBMbR9/gqeujrni7ujHZwNR+jUKXwBgUTjJpQZRS78nx78brTgn1k
	4ONYnF2XB5rvHGHGsGOTsb0/WW5FO5bczBk1qaUiFSVYmysQ1ezwP7Es=
X-Gm-Gg: AfdE7cldOJPzvoO0BXCxg6qrVaZbR2Rfo8fEtKNTXCT2Vcz5n06/lF6BMoSkwvfFWJ2
	LiphMVK5/IbCHXNtf3a9jkOW9GnXYdeATCEBsPydGTDSMLTZMEMNFtNauarvTj6rJ4hKukB5LKM
	DBR8dDgSV0QlpFXeVJPUxFuRz/iNz9zujqicgX+T01N/IWaRZzXaEM41zVZF9SnMX6S92jAU3pe
	889nslTz7G/4mbfltlDU7LCwUGOiwNPdIEXm2QJ5Mu+7DtVsDhG3mgJW7jpUXvjWXWp/PHD5et5
	TrO6S2j4WqzyIELPXgP8Rj6gJ8loQekGscUfMZDmdsZUmuAmMxU46PjWa0LjoKB1taWT4w8sHi8
	3+7izG1JEQyJRoNlCMsA2
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054735ad.4.1784192568036;
        Thu, 16 Jul 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a17:902:d4c7:b0:2ce:faa6:7cbb with SMTP id d9443c01a7336-2cf03bd52fcmr58054215ad.4.1784192567515;
        Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf106b271asm16592555ad.64.2026.07.16.02.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 02:02:47 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v2 0/8] drm: replace simple display pipe users with atomic
 helpers
Date: Thu, 16 Jul 2026 17:01:52 +0800
Message-Id: <20260716-drm-simple-kms-removal-v2-0-1133a8fc3785@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAKeWGoC/3WOwQ6CMBBEf4Xs2TVtUYye/A/jodRVq5RitxAM4
 d9t0auXSSaZmTcTMAVLDIdigkCDZevbZNSqAHPX7Y3QXpIHJVQldmKDl+CQresawqdjDOT8oBs
 UUotSmkpLtYdU7gJd7bgMn85fz339IBPz2i8R6NUnYvzGoNZMaLxzNh6KzGlpjJjJKCpUO8hDd
 8vRh/dyeJBL7/dt++/bIFFgvSFptNiWlSqPnnn96nWTYeskcJ7n+QMga11FDAEAAA==
X-Change-ID: 20260704-drm-simple-kms-removal-01a031c6a129
To: Alexey Brodkin <abrodkin@synopsys.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        Alex Lanzano <lanzano.alex@gmail.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784192559; l=4273;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=LslnXr/GYqt7lILfSX6H30ANs5TVBAPc61jkQsfXePo=;
 b=Qn3SgZ3Jcpq2dbsoxobIntKn1Fa949LtJINyO/lyXEjkZuMSQIFchq6+tnE8WqT7IXdz+1rFS
 ByTjQjwu366A0YatYIUCp3ydGB4Kf09fwhed1OK9kDkxik/D9RYfMki
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Authority-Analysis: v=2.4 cv=JeeMa0KV c=1 sm=1 tr=0 ts=6a589e39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=fqn4YNmA52JUfYToRRoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: gIC32j6hTmIGfulA6sIU4Lxdzn9efLrg
X-Proofpoint-GUID: gIC32j6hTmIGfulA6sIU4Lxdzn9efLrg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX9U82Z2sjrWYL
 XPDIKXoTicGpO9+PZ4rQEaSqKLcJkCbEHFEKfHtRXnrUJS0lramIKtsInA8vlr7gTGDWQmwfbIr
 BgtxvFiwXULZsZxB9051TXZ6lRnqZ44=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA5MSBTYWx0ZWRfX6tRy/uo1YdsV
 iFuU3fUXMi93u0781PX20klq/G1PSM84T3guZBw0mViDZ9uU2dbzIqtp5zLJ6ZWkFdCrhj+utHP
 K+gBaqfxQMqQzqLB2jOnUwXAk7BRaLdKVqBDxfQEFSZuXxYDOFpsueSuvzoFY9PFUzo1hV5hnwO
 m5pnYBoj0ktkUIM5dK8hPkMXNOaVmikTZLVrJt7hYz1h+ri2EP+RsINkt/P6hIHFNPqfxavRjgB
 heY7PgHfuhySgSGcXAXSETiakreK/2+rrGn5X3B8oR4mf7ywB5y5uzVzYwxoe73Yl3mwtU2oeT5
 pKqkrNBwajFwIKM09VLv/dNb6Y/abTqfZvgpYyO6VDIPkxliYdbQGYE4iH/+67TzSxmCwiGBm8s
 ++9q++IN3Ix6zUl/ue1i99ry1V7n93+5bUOKIYbQcDmViLqw7o9OotmXwrHi0qub4D6uiKsUphI
 kAJXBB+ia7852mI7Vyw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160091

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

This series converts the following drivers:

  - arcpgu
  - aspeed
  - mcde
  - pl111
  - gm12u320
  - repaper
  - tve200
  - xen frontend

Each patch replaces drm_simple_display_pipe_init() with explicit
primary plane, CRTC and encoder setup, and moves the old simple-pipe
callbacks into regular plane and CRTC helper callbacks named according
to local driver conventions.

The conversions preserve helper behavior that used to be implicit in
drm_simple_kms_helper.c, including plane-state validation, CRTC
primary-plane checks, affected-plane propagation, framebuffer prepare
handling, and existing event/vblank flow where applicable.

Result is less helper indirection and more explicit driver-side atomic
wiring, with no remaining simple-KMS dependency in these drivers.

Except for gm12u320, no hardware testing was performed.

This series is based on drm-next-2026-06-27.

AI usage disclosure:
- I wrote the first two commits myself. The remaining patches were completed
  with assistance from AI tools.
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v2:
- common changes:
- create upcast helpers
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths for mcde,
  pl111 and tve200
- arcpgu:
    - remove reduntant mod_supported helper
    - change obsolete mode field to crtc->state->mode
- mcde:
    - drop attach of unused encoder
- tve200:
    - reorder connector/bridge attach
- xen:
    - change possible_crtcs mask to 0
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (8):
      drm/arcpgu: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/aspeed: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/mcde: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/pl111: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/gm12u320: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/repaper: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/tve200: replace struct drm_simple_display_pipe with regular atomic helpers
      drm/xen: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/aspeed/aspeed_gfx.h      |  11 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c | 187 ++++++++++++++++-------
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c  |   3 +-
 drivers/gpu/drm/mcde/mcde_display.c      | 251 ++++++++++++++++++++-----------
 drivers/gpu/drm/mcde/mcde_drm.h          |   8 +-
 drivers/gpu/drm/mcde/mcde_drv.c          |   8 +-
 drivers/gpu/drm/pl111/pl111_display.c    | 202 ++++++++++++++++++-------
 drivers/gpu/drm/pl111/pl111_drm.h        |   5 +-
 drivers/gpu/drm/pl111/pl111_drv.c        |   3 +-
 drivers/gpu/drm/tiny/arcpgu.c            | 179 ++++++++++++++++------
 drivers/gpu/drm/tiny/gm12u320.c          | 132 +++++++++++++---
 drivers/gpu/drm/tiny/repaper.c           | 132 ++++++++++++----
 drivers/gpu/drm/tve200/tve200_display.c  | 217 +++++++++++++++++---------
 drivers/gpu/drm/tve200/tve200_drm.h      |   6 +-
 drivers/gpu/drm/tve200/tve200_drv.c      |  12 +-
 drivers/gpu/drm/xen/xen_drm_front.h      |   6 +-
 drivers/gpu/drm/xen/xen_drm_front_kms.c  | 175 +++++++++++++++------
 17 files changed, 1107 insertions(+), 430 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>

