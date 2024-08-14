Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 118C71A01C8
	for <imx@lists.linux.dev>; Wed, 14 Aug 2024 10:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723631759; cv=none; b=gPd8hZZQZSaC8G0n0pgaBPPBY8T6RLhmkgd7lzLzz99K0QAz/MIYbV/qXZ4l3V2Bv9z4uSXOnLZrke9DUSoY7XsZhTMhSG5A70wnZwir2k+ohZ6ZzE8QTjNpP1wKgnZFGff1b5c9qakwIdTB5xIJrsjWfRVjLITe6e1mf3WS8Bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723631759; c=relaxed/simple;
	bh=uYJNJ/Lq7xLbdSs3WCTfozAzfV0PWPsoOHzzbIoIraY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=S+gJfk4tdNoV5l7MAUsqFzMUnQUk50frwDZp1KjA2pFuJDeaToMBKQEOlNwGkrXW+Tzb66jIbm3AinVVgCgcjTUhZbPUevjBByvdrwBNCDDZQdQY5c8LpqeZWiWc/Z/gqorg8KR9Oo7+nA79/Rox5Lr0DHEg/ZQp6mobE8uk524=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LBiBfpvD; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LBiBfpvD"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-428fb103724so3984835e9.1
        for <imx@lists.linux.dev>; Wed, 14 Aug 2024 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723631755; x=1724236555; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CIfn1yXxmrN46mLAefxPsa6hzoHxpKs5WpPt2Hr+8b8=;
        b=LBiBfpvDmdo+aCeG8Zmdln4clVTJgxPSiylv++0dtVyrwJk2eHWYSxfow1JqwQLGCt
         43qDslNcDC8H4jbh1DuwraFLPuQUDnKJO51/KgrhEVmVlLC/TK8nrNm+/pdj7Xz8Pcb0
         DGt/wV03rMGC3TJSrycVwRIT2PR//loJefAaIWvDo1WHOrOOo1eee/gK3o1d46ctTuGy
         KRp6RmwAM7kcyFVgdtqAEUErYmkDNDgjE+QJpOblQytbQE8sd1CDeWVX+TNIjJ3jPapm
         WBwmFMk7tPrsd5rCaBUkbO1fVtvvsDOxdBjfOk6DKQn5uXvnTQyUxhu9hpg3tyF8Sdd/
         Hm2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723631755; x=1724236555;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CIfn1yXxmrN46mLAefxPsa6hzoHxpKs5WpPt2Hr+8b8=;
        b=Ca4vDHVS1HbrGm2qjqx6JeRok4/LCwn0K8Qf8s4YHuz032y4pqrX7crc+D+X0mORed
         jGeUYFZqxd/cepHHQeBN6RPu60IZwtvC2y0bp0BXcZsvemHy2wE9p5JK9zry+PWlVs18
         WzkEBnkRWZTuuPe1YdMm6UXvJbUHVfAIYv+kmIeAxGY90LtTceZdBHqQGMqosVMPB+oG
         UYZQGjdxmVkra1EkFjMEJRvLqHSge+6qVZgEYY+/U2Gh8DG7KNZ3Wiw/JUf2MFwkMuTQ
         8mDASVQgjykZwxqTwj5mi9itZZVJ3i7YNW3I63UPTXic81wP4bz4h8Q7BbxwgxoA7aQM
         LQ0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWtXPJfGu38qf43mtcSbKzRnr1H0s7xPYUdrcNOSBiUy4E16OH+RGubBsZry8atlZKFo+qp9fN14oj2kvS24C2yp8xT
X-Gm-Message-State: AOJu0YwoNh64EUIZ0z5rj1vtP8zDizEzQy3vf+NIMOc9GvJN8sscPEw3
	yf0diOz9YN6S18oPwVY3ORlUEdGDUyZOcEL5XO5AmYLZnfXYq0uLhmraA5ernxs=
X-Google-Smtp-Source: AGHT+IFySYJCbfhEPkwCk8tbPpG+Q/vI8wWAns+br1MLGrpp6gsbqkztTS2yy1odzpfjzuGCQr1aDg==
X-Received: by 2002:a05:600c:4ec8:b0:428:9a1:f226 with SMTP id 5b1f17b1804b1-429d625a61amr41770265e9.1.1723631755222;
        Wed, 14 Aug 2024 03:35:55 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ded3dd4dsm15501835e9.29.2024.08.14.03.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 03:35:54 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/11] usb: dwc3: various cleanups
Date: Wed, 14 Aug 2024 12:35:36 +0200
Message-Id: <20240814-b4-cleanup-h-of-node-put-usb-v1-0-95481b9682bc@linaro.org>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHiIvGYC/x3MQQqDMBAF0KvIrPtBTcC2V5EuYjKpAyUJiRFBv
 Luhy7d5JxXOwoXe3UmZdykSQ8Pw6MiuJnwZ4ppp7EfdPweNRcP+2ISasCJ6hOgYqW6oZcFLeeO
 8nSanFLUiZfZy/Pv5c103BpHSf24AAAA=
To: Patrice Chotard <patrice.chotard@foss.st.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Michal Simek <michal.simek@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1554;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=uYJNJ/Lq7xLbdSs3WCTfozAzfV0PWPsoOHzzbIoIraY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmvIh7j2wXb8IRSjayFQLu9kQ0RjqW1dpsXav5p
 jogbyksGwaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZryIewAKCRDBN2bmhouD
 1z4JD/0ZLzy3oMfUHF+i0Jrf/I9J/ggzgTBbZIDeBh1fMIHwXI4UV3f4ZzFi4+MAeq52bwcKi/Q
 4ZWjuR2Drm0x2yj1lNXUZSrUA8muBeTX0u7g3TCJolxsUXZ4jhC6zo+Ss2xueXo8LUfBH6f+1Ao
 NsP370WTlUa6fkWu02lC7JKBkB2VaCEvCwJQjVP6HRCh0lH754h3pNL74PjjsI5BFihWRyBqB6d
 xMQUW0oNEdGfUW65/cdsR5wEzZpt+DA1bSIV+a2gkjYpsHbkNd6Knf2KGb0SfoKSjWatb3UHVFN
 hWUzTk3vk+Z+rRKEhifVho8skSOgm/0DdWjoCxwFydVQO+jwNsr/7Q7ze/cElZrzFi3MKf3gbIV
 5A5vJaNmUSMsKfdKUIV3rCAVXRNiSCRl8gzqNChQYNjDUnaP2Uiy7Bxon7TrJt2JgRjjhWUbu8q
 smr11srqf1lzIC+YFOr3q4H1lQdliToGwFCCx5SnhkYcN4MhyOC4Ks/Kqn/LvNYvvHQ2tpqs2iF
 crEZHvh79p0ROlfgzNYFuQuuwG+q7VBz8rJxlaz0dzOru5Hoza8zCcbI3LjqORtCq6DyWq9WhJR
 pLJHkoVqFyJmyqZtke+/BYT/wPyombZcEt/ulivdPeiB0eJIqMB7YEZpY/g9R61eiMqhNwQGfYi
 b+SwC+Apdc39TUg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Hi,

The first ST patch depends on my fix:
https://lore.kernel.org/all/20240814093957.37940-2-krzysztof.kozlowski@linaro.org/

Series makes some code simplifications and cleanups.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (11):
      usb: dwc3: st: use scoped device node handling to simplify error paths
      usb: dwc3: st: simplify with dev_err_probe
      usb: dwc3: st: simplify pdev->dev usage
      usb: dwc3: imx8mp: simplify with devm_clk_get_enabled
      usb: dwc3: imx8mp: simplify with dev_err_probe
      usb: dwc3: imx8mp: use scoped device node handling to simplify error paths
      usb: dwc3: qcom: use scoped device node handling to simplify error paths
      usb: dwc3: qcom: simplify with devm_platform_ioremap_resource
      usb: dwc3: rtk: use scoped device node handling to simplify error paths
      usb: dwc3: rtk: return directly and simplify with devm_platform_ioremap_resource
      usb: dwc3: xilinx: simplify with dev_err_probe

 drivers/usb/dwc3/dwc3-imx8mp.c | 66 ++++++++++++------------------------------
 drivers/usb/dwc3/dwc3-qcom.c   | 16 ++++------
 drivers/usb/dwc3/dwc3-rtk.c    | 52 ++++++++++-----------------------
 drivers/usb/dwc3/dwc3-st.c     | 38 +++++++++++-------------
 drivers/usb/dwc3/dwc3-xilinx.c |  7 ++---
 5 files changed, 58 insertions(+), 121 deletions(-)
---
base-commit: 64b429eaf21be888cc83e9013e25897d5fb03a75
change-id: 20240814-b4-cleanup-h-of-node-put-usb-93fadfc77d33

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

