Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 860662063EB
	for <imx@lists.linux.dev>; Mon, 16 Dec 2024 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734360678; cv=none; b=aQNjx80H5RrAUn5wmP1CIaR59HGz9ZKCDGcS2C2WNYJWcgxFNteiEXvvEofMLzAMeI9kb4SBnUh6eK7wlvGFkhjYsLE5ealJSQKUjqzwya5oAJoOrw7ZAwSKIWtRvm/8VAU7hu/Pk3mbkscHzBgDRP3W1HY5tMwa7kT3QcByvjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734360678; c=relaxed/simple;
	bh=kAz5cBPcgesyVW4NY2ucqWfgWBRYVqzqd6e6WZNwbSE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=F/xd+vCyLOP0HXAnMqhytAkNpsYtfjfRvYHocms5xYq/6SZm6HMgQ2RJll4n+DRSfiZ9xeUhsyNM3igVO/DCdfZzYWrj5Tkd+9PTy2YbVW+VySri0IunjtDNjbir/0VDILIYmnpIHDcEKMdLffT8V6Pcy4zGI09wdWmp4hWzJEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KiuNH2sK; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KiuNH2sK"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38634c35129so3306643f8f.3
        for <imx@lists.linux.dev>; Mon, 16 Dec 2024 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734360675; x=1734965475; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=;
        b=KiuNH2sK5JLWd2ZDdM3dtYT1TP/DoWDabBmd4VPuRheBWoE9br3vwe0WhVzBOgIive
         a7ZDoYvjBchNMNnknpdhgypuyD3CWgRhLCKmN4UNBqnmrR9etL+pzD6d27j8Gfa86WbU
         r1Fng4xId3fQoRDm7Tx9mbQxUHPYBCchG+1ojh1Y7822BTGzeELHAi3GMbvMMl6bG7/Q
         QreH/W7VkRLolJN0owaTlEBw+VfZPQfGz1Bi3KCwOCBMpr2Nkq1L+mIy7wH4oBDa/aGc
         b3swBeGJ8MX1S4GfjhnA9T4+B9PHZQjABhDkA2k68EjeMh7tcpfz6g/wdzXHSjdCgbFc
         z1rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734360675; x=1734965475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZR22IhRUpX/Fq7KGPdPODk7QFLwb+WURrRAPPoxEH0=;
        b=gClLojJ8IbE46Uxeu/+toXaTpnCnNzdenuj/tUwcYyeTN/GQWcFtDzGEmoSXnN+uqv
         2Mq8dvEOxZyEttVjXVhKeCYIaoeprRiVWHpU6OMtyaxBOA0BiGPVj1sj1zlxNjRVFtt0
         Y9PER3zw64eBl3W4wXXObpWTo1qDvzOXAABDKjUebCSC20+ljpQ8zfe27ksuFQ/4hKs5
         uGgMbDlY79zBL1375EKCHG2/AW68hwy5e3kIaq5sFec8kQ+DaP8f5iDxtCIA9/mmePvD
         KauZCU6DaJQV7HrBERtDVkSLM6/jXn1XD0K3TH648uGD1i1wJ8B/0rSr74UmvAxmJfX+
         nd+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXozi7QUO7icVmfKfC5GGw7uwwmBTObx2uGZ38rpdFdpFmV8XugaAW2h8qFvszutlOn+/s=@lists.linux.dev
X-Gm-Message-State: AOJu0Yyn83F/cnwunSmUC8jYlYoSRsIL7Lgu+CiIbb700mKVh4ZbqHCs
	85qXEnT9i40r+O1x7xHPsOnexiUF4AhcFyquTR2m/9SwVvSepGc4
X-Gm-Gg: ASbGncvkOlbTAbDq9Wjdf0z/zW1XY0RRhTgOHlLR2LvWIZCzMqKGq/J1dUjjdTxUiwH
	79sVtnJCy8pyTZ7Oa3TFL4Ku5LsLS2uCids1ruIV5vTcPrEKNuuWy4Cksw5kvHHwWZjNFmQxMkU
	i4faFUmjXLKaJdW6Eud/uGOr0CkRnmGBmPcHKC80ysDDtWEuQBGO4TfENQbTYfKv6gE8vsp6Hc0
	0aVWWgADNTxXbm9NcnhPtm+Ez2ELi3Hfz4CwFADaKuqnrsNi7DE1xFeTWAq/PJjsBD7GCej55R3
	rtvAYP14WkixVWhj
X-Google-Smtp-Source: AGHT+IHzN/5NhLTul0WIKF2FfViCsMY2uCJdEVicfsfHV8smpoFeZ1z55RS+AV0S1OCL0ZcqZxbh/A==
X-Received: by 2002:a5d:6c6c:0:b0:385:e1f5:476f with SMTP id ffacd0b85a97d-3888e0b9bcbmr8246013f8f.39.1734360674752;
        Mon, 16 Dec 2024 06:51:14 -0800 (PST)
Received: from playground.localdomain ([92.120.5.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4362559ed6csm141616455e9.24.2024.12.16.06.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 06:51:14 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Takashi Iwai <tiwai@suse.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Frank Li <Frank.li@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/5] ASoC: dt-bindings: add common binding for NXP audio processors
Date: Mon, 16 Dec 2024 09:50:35 -0500
Message-Id: <20241216145039.3074-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add common binding for NXP audio processors with Sound Open Firmware
(SOF) support.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..1958afceba75
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio processor common properties
+
+maintainers:
+  - Daniel Baluta <daniel.baluta@nxp.com>
+
+properties:
+  reg:
+    maxItems: 1
+
+  mboxes:
+    maxItems: 4
+
+  mbox-names:
+    items:
+      - const: txdb0
+      - const: txdb1
+      - const: rxdb0
+      - const: rxdb1
+
+  memory-region:
+    maxItems: 1
+
+required:
+  - reg
+  - mboxes
+  - mbox-names
+  - memory-region
+
+additionalProperties: true
-- 
2.34.1

