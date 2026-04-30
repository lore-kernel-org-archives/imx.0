Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618C54219E7
	for <imx@lists.linux.dev>; Thu, 30 Apr 2026 13:21:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777555307; cv=none; b=A7POcVgFGUkW+c1ACgjB5XvYR3mlRIrmxTJPockWJ9pasj9Q/xqu5Y/cJRsNnXRgHlK52Gt91Gxtdn0al1JFcVsLK/wZ53/euUs6VqWZgKNvRmyVZnebDdph/VDkInqocyofyZ0pEGLKVO6yf3gb0IjJY0cln/U0GzLeq50TtfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777555307; c=relaxed/simple;
	bh=2eZMKrdUq1kE1wYNVAUmX1R9Mh35MCWgdtBeWNPzAyk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BxBuRhbk+TswbDnhZLBLKkBd6rQuV3klO/DbvJuxaF42jb5qaOrzHdS8mGqeLY5P5ViOLo/u11rAUoomWlT1VK0pudn1TyWMAIHcjWAMr2gKPalNUNW97VeLCfcOUE2tYlu+UDDGyBEguMEsCqc3clAFdx7CPdIJINDkI30GgSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc; spf=pass smtp.mailfrom=arduino.cc; dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b=Fp+ujUSc; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=arduino.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arduino.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arduino.cc header.i=@arduino.cc header.b="Fp+ujUSc"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so15469055e9.2
        for <imx@lists.linux.dev>; Thu, 30 Apr 2026 06:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arduino.cc; s=google; t=1777555304; x=1778160104; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=Fp+ujUScP9TbZRHwEn4b6qKXcmGNOtFZ06LrbOU42iJZ0nR2sM+1SEZSqcK/c2AwVD
         S0B3gKJ0SBuH0dBmY3FivrkoGLbqqnzeO8TqMCKyKfUfZnOzBc30Hfj949+iBTrEv7b7
         LBkd/pDz2BQqz43MmWe/caGjUMvJDN3jbAUvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777555304; x=1778160104;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1duYelZIs2qYPVB/MOAgMGm1UaFo5h5pWBMCVl5tsA=;
        b=ZxX9jMNepHYB+Z3as/LYdyqkpQn71T+V3Wc7Uf7p/vmDKuB/33Q9UqoHV47TF9ZOqk
         OSHgjwc2lEHQ9xzaZVtb3NF/xg/b5+ipLlnfnrKo6RQNIc1I5g/mqSN1N2DoP46k8I+b
         AT4FYvB8XLPkbC9zX7w+tFJ1xwhvaIGYraohgsqf5cWRzqZayjslj0aTrOI+AyZP+9K1
         NygXc5pIf04IV2TBKOU9ag+06/hfq6QigEVwv3gxupPZeEe84jmdZ4fnwcxq/ubfUDxS
         NwgdRNufIor0xBmq7cJRAabnR6p1kwD4/kk+TXsvygJGAB+Fvq0B9lC2NNqLweFE1Lqn
         SqFQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iDwi4o5PN6rIuOfUVthsbUCLpCGLk9hJzHwZu8YfmHa951mLBzjAufTsorSJLjYm57qI=@lists.linux.dev
X-Gm-Message-State: AOJu0YygFxnIA45lWMThqQxx/Ocmpqbx2ySmMXeqSNrGWdVBZSB4tjuE
	T5ZufZ5NKsUMX70otFDEuVyiDm/zRwen9FEVnP8k/dGaqzvH/theV8+fGkYhkNDXXfs=
X-Gm-Gg: AeBDietDC0zH+K/yWzLY02tVF6md6BcWXuzDvT0A+nlndOOAf36dL8yfSR6ehIXzxvn
	0BdN9ASPPClvOdyh9bNh2z2fM6Ya9dvuYwuhJXVz0tOfD/pmtPUWtJovk2/wg4HdzgeTUlScfjD
	WaxEDSpyKD6drWVrBnVfOvDDv8rYLUEUHuaF7bGNuPT9u7hBMJh0YbivsWsXFesPhblUcBg9so5
	99IB5oc6IS2WXpdM9ETJ7IQ54rDMz5zKocGlc7KUNnHYBkCV4tZJxXs8upU80e5fKBAxTrZZz1z
	Qb5jkZ2IQFR9eEGPss6vFQToOldv6SUOG1j3JArO26ktgWprmnUKp7oPty9+OSd6DbE2EyfDSIZ
	LFBlNWJUJGi3NhO+Q9EI/fdtqeBgpjCEBTckjpqLcicR2F+1isN7xh+rg1DGDLmZOyule8yHgHk
	w+9rVH+PwfYkBAhcwzrtqn5jy+R7siF7oQRQD1uOe4gkt989Im2hDKMU9Bg6YkqzaHLpg=
X-Received: by 2002:a05:600c:8b76:b0:48a:5363:8cac with SMTP id 5b1f17b1804b1-48a84484f9dmr52429955e9.22.1777555303724;
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
Received: from riccardo-work (public.toolboxoffice.it. [213.215.163.27])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a82307f28sm106210325e9.13.2026.04.30.06.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:21:43 -0700 (PDT)
From: Riccardo Mereu <r.mereu.kernel@arduino.cc>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	broonie@kernel.org
Cc: linux@roeck-us.net,
	Jonathan.Cameron@huawei.com,
	wenswang@yeah.net,
	naresh.solanki@9elements.com,
	michal.simek@amd.com,
	nuno.sa@analog.com,
	chou.cosmo@gmail.com,
	grantpeltier93@gmail.com,
	eajames@linux.ibm.com,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	festevam@gmail.com,
	imx@lists.linux.dev,
	m.facchin@arduino.cc,
	dmitry.baryshkov@oss.qualcomm.com,
	loic.poulain@oss.qualcomm.com,
	Riccardo Mereu <r.mereu@arduino.cc>
Subject: [PATCH 0/3] arm64: qcom: imola: add support for Media Carrier 
Date: Thu, 30 Apr 2026 15:21:37 +0200
Message-ID: <20260430132140.30369-1-r.mereu.kernel@arduino.cc>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Riccardo Mereu <r.mereu@arduino.cc>

This patch series adds support for the Arduino UNO Q (aka imola) Media 
Carrier expansion board.

It adds: 
 - two CSI connectors (support only for imx219 sensor)
 - one DSI connector (support for waveshare 5" and 8" touch A panels)
 - 3 jack connectors (headset, lineout and ear)

It modifies the previous qrb2210-arduino-imola.dts (named in this patch
series qrb2210-arduino-imola-base.dts) in order to move audio and video
output via USB-C to a DTBO.
This is needed since the DSI lines can now be used via the carrier
board.

Camera and panels are divided each in their dedicated DTBO so the users
can easily configure the overlayed DTB to match what's actually
connected to the carrier via user-space tool soon to be released. 

Depends on two patch series:
 - https://lore.kernel.org/dri-devel/20260413-waveshare-dsi-touch-v3-0-3aeb53022c32@oss.qualcomm.com/ 
   (applied to drm-misc-next)
 - https://lore.kernel.org/dri-devel/20260331-ws-lcd-v2-0-a1add63b6eb6@oss.qualcomm.com/

Riccardo Mereu (3):
  arm64: qcom: agatti: Add dai@3
  arm64: qcom: imola: Move analogix video/audio output to dtso
  arm64: dts: qcom: imola: add support for media carrier board

 arch/arm64/boot/dts/qcom/Makefile             |  13 ++
 arch/arm64/boot/dts/qcom/agatti.dtsi          |   4 +
 ...ola.dts => qrb2210-arduino-imola-base.dts} | 122 +++++++++++++---
 ...rrier-media-camera-imx219-csi0-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi0-4lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-2lanes.dtso |  49 +++++++
 ...rrier-media-camera-imx219-csi1-4lanes.dtso |  49 +++++++
 ...10-arduino-imola-carrier-media-common.dtsi |  46 ++++++
 ...a-carrier-media-panel-5in_touch_a-dsi.dtso |  80 +++++++++++
 ...a-carrier-media-panel-8in_touch_a-dsi.dtso |  80 +++++++++++
 .../qrb2210-arduino-imola-carrier-media.dtso  | 131 ++++++++++++++++++
 ...rb2210-arduino-imola-video_sound-usbc.dtso |  61 ++++++++
 12 files changed, 713 insertions(+), 20 deletions(-)
 rename arch/arm64/boot/dts/qcom/{qrb2210-arduino-imola.dts => qrb2210-arduino-imola-base.dts} (85%)
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi0-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-2lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-camera-imx219-csi1-4lanes.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-common.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-5in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media-panel-8in_touch_a-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-carrier-media.dtso
 create mode 100644 arch/arm64/boot/dts/qcom/qrb2210-arduino-imola-video_sound-usbc.dtso

-- 
2.53.0

