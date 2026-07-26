Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0682339872
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785095017; cv=none; b=Qnso9XSKer3pjP2KJIPEMvsoCnmboz7bgVBzTS/axvr9JdT5ZiZM7bBPT1DceIjfVSH9+q7zYD3GUusWYOdMEW5RxSS3A9DJDOmQQB2DuCqsErw51F2H6DLFgTDrlDXL9pdVSyiR52mD6xnq6BW+140mM5UxibBQJuNQqatqx1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785095017; c=relaxed/simple;
	bh=SzrRHowXSa10BAHCyJ1LhewVqZLaXZNB44vA3ptkLd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=RWd4vQ7okUqQuFdh4OnyZeisoil3SxmFcfZ1NECDC30ZiDDOW2EntOvBJv8iIqeIgJ5fmErVoC3DqATGRS3WAIUdFdTiLxH2GuxyLnNQ85rh+IDt+5nZ8EpcKkc0OOvbz6UZ3m4YioeGhgstbvrz989WqHt1YS/k76bwm3Ex8Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAZEOG1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eWTymLXr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAZEOG1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eWTymLXr"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66QH6gwv1522854
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=FDQIeXpPD+dwLpKCV5Porv
	y3ne6CU+pJakDyD+AScDY=; b=pAZEOG1UWrwTp6+Udv9XpGfugtOEAbIEc8xh32
	izDKpGGoq0uH1WZWcQJmbJh+NgBE/f+Uy+hkdw7i28QDjdp4ViKCyfkO6VwS31Rf
	mPq41EFbFh3JI6QUTWEmXHsgHUGiynrS2EXPL8ZkcGbth9TSJM0wOlwvSBZpQM8B
	S9RjIOpjJQY3oPTTWsdlHzfSuVc90CxICcka85UZSEoOl5LywkG8t9kdG5gFsMwx
	lewic+xOYkv8Oo6dLPBQixW7/Z3DgUgfa8U0YswMXMz76jIhiG6QgcCMmaHZOpAh
	3/lvfjR7c+MmmS1k1XWZ+opI3fWzDVLKNYC2G95V8q3IShMg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmm3sbnxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <imx@lists.linux.dev>; Sun, 26 Jul 2026 19:43:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb6cf425e86so2613493a12.1
        for <imx@lists.linux.dev>; Sun, 26 Jul 2026 12:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785095014; x=1785699814; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=eWTymLXriGr9sMrQul57reB/PQCP7nhv2O47nRZlobYdTHDVszHgsCLg8TyDtlngpg
         zmKp6MVQC+mouujB3wzu/N4DzYuZnnA/j9VhWT0R7nO8gluIYp94IiRaL0ubj3itETOI
         vDZgANeHZgSLw+etyPafolJaabkOzpAixt4O/niUETyVNewjDxW55kgk0yCwvjnihHjx
         QoLycjo+Kr+iBSSzfCXNXiMxOSJPaQDBzymC1TolXXdwSIgWwH3XJgQgVzzDZetnWXZq
         L37tQLdGj/HUU7TfXtUJb0OFjWw2C1jSicc2Eg2OkTma4oZ3AkUxPwgCK6kdTLDEuJ29
         Hjow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785095014; x=1785699814;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FDQIeXpPD+dwLpKCV5Porvy3ne6CU+pJakDyD+AScDY=;
        b=olZkyXLLDmoaUG4AmGpKGsKHuDwLMmd4RduCBlDpcajZ3YaU4x/82EkrSTomDxo9P0
         9XExqtBk/4nXyXQdXXsWDzVv6Q+RWTV9FRnGkNXo0dUpgcKSeVcFDm8iJ2CaRoK9hxW6
         HsIF6CXGSACXEwYLwZ4EyKSUDANzBeQQ906ihzWX8dD0lEoqp7SUg+j1vX75iebQiR3U
         0W5lh0IxPdbAQmhGoLn5qCpWqmLIMLMzZ/YNl7sJvNDX5bTJPuvZZHbmWFADlvE3IU7f
         HHpA3mBvzfQQ51dfQ1NM/cFesPO2MW9iBJE/jHw1Miyr7APIy7HO2YQTejHhh/0CaAxK
         1ulg==
X-Forwarded-Encrypted: i=1; AHgh+Ro43BwxVbqNB5JFwoyedAIE6hHsYaKGmfb9l+wUWd0UpkztvXp7GnAOTHPQPNHzVApkFZo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwfiYv0g6ccaaQfCNBsyZTLSlfS9l4b5X9GuxoeG/8Iw5MrLP2v
	I0v8rD6Xn/gyihnS50+ZBZUsiZYkhUWpB6ApDKYYbNxKmATp5MMlFnBM+E28GVmrdqLe/AJowGA
	TyZceE+3jy4/u2q1GASvbztk/Hgp86mpsLXfuVFMqr48WzZTcGfmpEE4=
X-Gm-Gg: AR+sD13/zEzgrYk+2zsIp54ywXQ30hVyCaGZB8aEjXk1gUwvLdRLnDWNoc5TyPFgWe+
	4BTO6H98gHwujVD5LmRORuKuD4ATKJjdlCm4iVaMby2vnjkNhNefNtkxamLSiL4ahbGZturjzrs
	Rt6UGlEPV3DkMOxaL5Ui1E52JQN4ukKnpCtN9ntk0UrEmtKFuqzQJDX71I3wWPEhi1YXxuPkymw
	lGIOx57ZJQg89E2mAF//sZGtq4ETun2eRKPdfaYUFF+PwewJefvPjOzC8QPyLNSWUWeEGb8JySO
	KQ0z9VbiudV/rBEfOKCvEqD0IcSEy9CL3zVwMdm2uZgUhgW7i1ZvB2LtgvXViBSbtrvApvmbCXM
	N+PdFo+ycobo1Wb7S5/cA
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548170637.16.1785095014255;
        Sun, 26 Jul 2026 12:43:34 -0700 (PDT)
X-Received: by 2002:a05:6a20:43ac:b0:3b3:2703:115 with SMTP id adf61e73a8af0-3c67dc41ae3mr5548148637.16.1785095013838;
        Sun, 26 Jul 2026 12:43:33 -0700 (PDT)
Received: from le-cd01-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbbb66dcd38sm2312070a12.29.2026.07.26.12.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jul 2026 12:43:32 -0700 (PDT)
From: Ze Huang <ze.huang@oss.qualcomm.com>
Subject: [PATCH v3 0/2] drm: replace simple display pipe users with atomic
 helpers
Date: Mon, 27 Jul 2026 03:42:31 +0800
Message-Id: <20260727-drm-simple-kms-removal-v3-0-de36e534f7a1@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAChjZmoC/3WOwQ6CMBBEf4Xs2SVtEYye/A/jodRVq5RitxCN4
 d9t0auXSSaZmTdvYAqWGHbFGwJNlq3vk6lWBZir7i+E9pQ8KKEasRFrPAWHbN3QEd4dYyDnJ92
 hkFpU0jRaqi2k8hDobJ/L8OH49Ty2NzIxr/0SgR5jIsZvDFrNhMY7Z+OuyJyenhEzGUWDagN56
 Go5+vBaDk9y6f2+1f++TRIFtmuSRou6alS198zlY9RdhpVJ4DjP8wccL41iDAEAAA==
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
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
        Marian Cichy <m.cichy@pengutronix.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, xen-devel@lists.xenproject.org,
        Ze Huang <ze.huang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785095005; l=2679;
 i=ze.huang@oss.qualcomm.com; s=20260716; h=from:subject:message-id;
 bh=SzrRHowXSa10BAHCyJ1LhewVqZLaXZNB44vA3ptkLd8=;
 b=ygG0jOkfjjtOnpnb/85WRy8PlT/tiW1jcovVo98E9rFl6SsoVZpL7kFNMISeo+OC86QqJ04Aw
 LK0RRwuDsgNBhR/dSZRqnbW+r+gFyurTl3vHzvkgzWB3HgUd6B0UHHR
X-Developer-Key: i=ze.huang@oss.qualcomm.com; a=ed25519;
 pk=8uGhlZHInA8NXq7G6u/g59qEcwXwuMRI7nBSnT/ijtY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfXwYU3exLEox2/
 Zwr+wfUdo4Q98byr+KGWRzm0yxHeQ9h9376i/Jo1KV5ByiIzU+ItvjhgobiJdZZv3+4TnH55Ffr
 cJOh0jTeovJpYxG6YoaiXj8Ax3tqch/r1CtUJsjRcWkyM2TyuwAUhizrl8tXRGObPkGdd0EmOzJ
 RAsV7XkNcQcJXNxptbEYs60f9+OF6+wWysQqQ5VD7mgd9adYtqvfmciUxMiXzA3Ilmf7quT9CRW
 RLaLWBy7/WY+5FhLEz73KpoSA3XG9pOp8JGqlK1agwWTd1MPmC2+bqE0twy/jfPicF/jJkVOFMf
 SnN9Ja48S+822UlVxICJEefNA3GlusxF4jDqDC36sa/LERQQKPdI1jaksLdcyqK236qoPSZFu/8
 H6gsfpMyxyGdLRTSLecwWiu+m0KFxKRBcbdvo8xWT3BV/3DIpH2Mvmbg6Rgadr5BoC1i084uX2R
 0c3xNOFAGSRU9EXxIjA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDIwMCBTYWx0ZWRfX3YsLv794WVEh
 rZibQt4LpcjKMjoDOSsBE4Y1x3yt9oq8vAgjurEta6pnnq4bKpW98p3/1sMuzzFhB+32cuKOPtr
 5FlmIYleznSRLKRLfA4oZZ643ibwBuo=
X-Proofpoint-ORIG-GUID: -OmrAniMn4w_f6X9Wgcx7wdnLpgXDDP-
X-Proofpoint-GUID: -OmrAniMn4w_f6X9Wgcx7wdnLpgXDDP-
X-Authority-Analysis: v=2.4 cv=KanidwYD c=1 sm=1 tr=0 ts=6a666366 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=Aa0Oat_sKGPK8WdvVJkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_05,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260200

struct drm_simple_display_pipe was meant to simplify simple DRM
drivers, but instead adds an extra wrapper around normal DRM atomic
helper setup. As noted in Documentation/gpu/todo.rst, remaining users
should be converted to regular atomic helpers and stop depending on the
simple-KMS interfaces.

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

Changes are build-tested only. No hardware testing has been performed.

This patch is based on drm-next-2026-06-27.

AI usage disclosure:
- AI tools were also used to review the code and suggest code changes for
  the DRM atomic conversion.

Thanks,
Ze Huang

Signed-off-by: Ze Huang <ze.huang@oss.qualcomm.com>
---
Changes in v3:
- Add a new preparatory patch to avoid duplicate clk_per enables in
  imx-lcdc pipe update after CRTC enable.
- Use commit-local atomic state in enable/update/check paths.
- Link to v2: https://patch.msgid.link/20260716-drm-simple-kms-removal-v2-1-7e4a6b8528e6@oss.qualcomm.com/

Changes in v2:
- use 'commit' as name of struct drm_atomic_commit in atomic helpers
- improve control flow in *_crtc_helper_atomic_check() and
  *_plane_helper_atomic_check()
- Moved page-flip/vblank event handling out of plane update paths and into
  CRTC atomic_flush(), using atomic_flush and disable paths
- decide clock disable by old crtc state
- add calls to drm_crtc_vblank_on() and drm_crtc_vblank_off() in crtc
  atomic_enable() and atomic_disbale()
- test crtc_state->enable before mode size check
- Link to v1: https://patch.msgid.link/20260705-drm-simple-kms-removal-v1-0-b4e1ca053623@oss.qualcomm.com

---
Ze Huang (2):
      drm/imx/lcdc: avoid duplicate clk_per enable
      drm/imx: replace struct drm_simple_display_pipe with regular atomic helpers

 drivers/gpu/drm/imx/lcdc/imx-lcdc.c | 263 ++++++++++++++++++++++++++----------
 1 file changed, 190 insertions(+), 73 deletions(-)
---
base-commit: 3696d07837d1df13a5603d77f667685e7dfb3c53
change-id: 20260704-drm-simple-kms-removal-01a031c6a129

Best regards,
-- 
Ze Huang <ze.huang@oss.qualcomm.com>

