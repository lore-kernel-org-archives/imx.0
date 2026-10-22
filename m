Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680412;
	b=t/VKzY31ZGZJUyoKrK1VYO+aYi1t6a8toLqevgWRwbUcoko+tVyLm4AYKmBBAznPaIF3
	 TxSfe8JYbfEcaPrFWXxKGSJkSwuulDtLvahLzzYCJ/iZRzwFwSAsehGpZmI2AhreIE3PB
	 y2726UvWZKhEKMJauWP4sQ2cmUy5eEPpxhAm0qs9+jm3BHKL1PMIz/0IRGU+eb/BqRUDo
	 CKPPPkB3Cmo0qVkPgL6zi1JfbAyaoxctRIKoyIkw6kOTG0qM7JqOXFLzZ8WcbXj4rxa3a
	 bsyloCMqpTz7LsxSN14MyMBb+kUP7xFVbqG58eXw1HYIAyFOXPHhyyka3KSoSMWhdvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680412;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:To:Cc:X-Mailer;
	bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
	b=m5XeIs1qfbpI/aRqt/HHyOlUuNVaFKpYYiP/fNkDzXo9WDLAf2xbbN+LC0WUT9hn1agY
	 iGngfz+uIMAHpuQiSVcECTDRcgs0Ku/DkGIMV5Iu1PdtEoMBEgdB2Z6cvh3x+ylu4SC4V
	 pJGUu0MCvShfrqPAKkT5vDtcCQDc6F4TrGfns3cewaDO13SfIM/BESACy9+4Moivq+ZG6
	 bmlDNU5a05pHDa5P7R7PmwCRHdfYVVa3GMr6HnyRu1dmaAaST6xuyYnMDY7RSaW3M1T8K
	 4+fHaUSy+/m4JHBf4F2Rq5Nkt2ibZCKEbgKo6H5bdcoueIIoSJYcfQOIx8TQnJCcFwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMBekLwd;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF395606A31D
	for <imx@lists.linux.dev>; Thu, 22 Oct 2026 14:46:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF395606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BMBekLwd
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1215851f8f.3
        for <imx@lists.linux.dev>; Thu, 22 Oct 2026 07:46:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680410; x=1793285210; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=BMBekLwd3cR++DZk03EL7k9qX0HUXQAHNMeneVaddO+Y55Ra53irIxURnz753eobSv
         BYSUPojN3/nDL2edsggiCtAPWI8uZgqBHhd8KIvF2MOmsyOlTBXZ0ScHLvbsR3BVRtob
         4jEIVbMNK6UqIdpzvnHkoos41kMMrypPJ1uTSsZh9eI+Ueec9w9ivaMEFNpmlgZvXtXM
         pOT06LkgLnPm+d1VxJNWbJIrFKgvv9c9o1ZJIdM6d7Bi+XkFWgs6MLwB8olvK5BO/ngm
         vxVzGuGZCA9vYyXaAOiaLAHwwpYzkI20dFKvyzBx1G/6OQwc5lxJPkfZ1+nPwZMg3UYx
         NPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680410; x=1793285210;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xBDqLL5GuxOGFYhhyYk77KxsJOi32ML+5os83sQIq8A=;
        b=Wv7bsZH4x+dtPBNSbtDsVXZMidn4osl4B7W69/0dI/XtREqoU5DOzZAePRvamwPjGR
         UiAdcsayQh0wb3V6gbgjhgSfHW4aFzMS/UISqhr/0eDSh0cthbiaAlJvvZ2Gklrwi6Xg
         viORgJFgwng43AbwUrQ81D9mBuDy0dXSlbcFDLSfd6iqm9xLg4EW4KTZY6Fe/xKirVBV
         TgrXHuOKGpTz/TzndiZ4JCYdhAGuzlQQe/jzb3tnrMKTpJzp/JI0PZig8dr6txXCpIYf
         3aH5rOXUDSheiBmYRfZlBXVKZskM3eF426976gzpqz/cq2pL/ToIIP/8mcTvNnJt/ceF
         M6NQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr6HrtwfNufQYBTUqGg52Vbj1mmkg3dUJcnTkrfbyzl8x9VUtLe7P8haJ1jPdJfziJEV4=@lists.linux.dev
X-Gm-Message-State: AFq9FYKLNzNZ348HdJUiSX74M3ASmabtv5UJJYMnqLdyXrTjDuEf/RRv
	ZJ3FPUYGwWDemaZ+ufDEY0AQsgDAHJT0ecz0hTiETntVYBlCjUAp+WJ9
X-Gm-Gg: AYBFou0qYFzJF/t2p+5HJVLn8cu/zWIsfQ+lX5JgHYf+4fT0RARloPyP6yIZGxkrljx
	1nfPQDOc9UU+/PHJlsENt8YXYpze1q659KF4fxYWH6bZVk0cUhPweKwrqNqrgvOfeCqpYKeNXM8
	cHQOWqpX6vVFy2HnqnxZoptYZ1mLHIAYjHTaRCAY0f3PqY9Hg7J6rj9u8kdqkaG9tpPiranqQwz
	jahrhTznfVhfeYp9k+Pkmb9J7NAL0GV9jvvYsCN7AP/NtNUWgTnXTOEYx3W2aQNFF60XZ++ngPh
	yFr7AGvZgzZJbjPs5TfKJAW4ryxcZC+DfthWriQ8quOMWMqL8bVCFiJwK/RqlkTDOzSs1kMaGDi
	bPXipiXeNcZnASM3ZXQFsTCforbJUguDaiXBr5SKUqU4SzEva+XYdjY43ene+BfiHYdG1zkuLeU
	pKNW6XP3M5Ofwq4+YdNmqMzP+y012PvJRoVeUfY+TLc7OT7pc4WUEy82lSaMnFKc8kVHQMWyuRl
	f0vlgoSF4H3oeC4epXJBJHE0KJ7LLn0waIK8WDMgP6Qa2SYiVhijtdP0fDS8dJ3kRqLyWZ7R6Hf
	9r2NhV1Im+OxuCX9KinoBQ07xBKK6kNIamcnDEQjecMo6wjnMyw/C8TDpS8aJQykqLnfLv1v9Y7
	7
X-Received: by 2002:a05:6000:4009:b0:48d:ffa3:714 with SMTP id ffacd0b85a97d-48e264c9950mr11847583f8f.19.1792680409680;
        Thu, 22 Oct 2026 07:46:49 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:48 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Subject: [PATCH v2 0/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 OV5640 overlays
Date: Thu, 22 Oct 2026 16:46:43 +0200
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Post: <mailto:imx@lists.linux.dev>
List-Help: <mailto:imx+help@lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
List-Owner: <mailto:imx+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANQh2moC/4WNQQ6CMBBFr0Jm7Zh2gk115T0Mi7EdZRYF0hKCI
 dzdygVcvpf89zcoklUK3JoNsixadBwq0KmB0PPwFtRYGciQs8YQLhZL4hxQ0+rThIGTZC7on86
 1kclEbqGupywvXY/yo6vca5nH/DmOFvuz/5vVG2Qj/mo9BUeXe01wlPUcxgTdvu9fo6+R08AAA
 AA=
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0

Add OV5640 camera overlays for the Toradex SMARC iMX8MP SoM and its
development carrier board.

The overlays use the camera connector GPIO nexus, so this series
requires the toradex,camera-connector binding from v3 of the Verdin
iMX8M OV5640 series:
https://lore.kernel.org/r/20261022-verdin-imx8mp-hmp-camera-ready-v3-1-90a30b0b0d55@toradex.com

The camera regulator is supplied by the on-carrier 3.3 V rail, which is
described by the first patch.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
Changes in v2:
- Include the on-carrier 3.3 V regulator patch, previously posted with
  the SMARC iMX8MP display overlays, which are deferred
- Refer to v3 of the toradex,camera-connector binding
- Rebase onto imx/dt64
- Link to v1: https://lore.kernel.org/r/20261002-v1-smarc-imx8mp-cameras-v1-0-a0e89182c625@toradex.com

---
Ernest Van Hoecke (3):
      arm64: dts: freescale: imx8mp-toradex-smarc: Add on-carrier 3.3V regulator
      arm64: dts: freescale: imx8mp-toradex-smarc: Add camera connector nexus
      arm64: dts: freescale: imx8mp-toradex-smarc: Add OV5640 overlays

 arch/arm64/boot/dts/freescale/Makefile             | 17 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi0-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../imx8mp-toradex-smarc-csi1-ov5640-24mhz.dtso    | 15 +++++
 .../imx8mp-toradex-smarc-csi1-ov5640.dtso          | 75 ++++++++++++++++++++++
 .../dts/freescale/imx8mp-toradex-smarc-dev.dts     | 33 ++++++++++
 .../boot/dts/freescale/imx8mp-toradex-smarc.dtsi   | 10 ++-
 7 files changed, 238 insertions(+), 2 deletions(-)
---
base-commit: 7f47e8eafbf55a2ad0697e5d28f5e6cff2fa42f9
change-id: 20261002-v1-smarc-imx8mp-cameras-8b664da20da4

Best regards,
-- 
Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

