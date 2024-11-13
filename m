Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA718204012
	for <imx@lists.linux.dev>; Wed, 13 Nov 2024 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731527603; cv=none; b=fbT6dx4VqetEz9OCW8uRfdS+YDQrteNPWILAm1TKAq6iENkQ1TCO7htMLeQ6kWB3B+UOF0gGj9FERRuNXTx8T3xkes5XC7eJkYp/Y95J6VGvxAkOi137yDB9M6zl8hi+A5aem7B344jmpnIjlR/0CEDdfNX/+9kqyyymVH6KL7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731527603; c=relaxed/simple;
	bh=f+l1fy3tazjS2bz5zfkmHyR8xJEa4A4ptXrXxoXVSoo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Jd6+DwQhrHCzjkP9Y1a/djlsJbeFcHVS3OaobmXxF6/r66kYUzd/eqQJB3js0Z+HbEcYnX2fuy9ipYdin5wQf4tdQmMUu9nZjSDW326QHvKP5nwes6UpFm26s64q7dq6tVsDRF4ebba/+Ny+okXVEI9crqrhP+vO+MHzX/Ku9Ic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gnR/oczJ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gnR/oczJ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4316a44d1bbso61229925e9.3
        for <imx@lists.linux.dev>; Wed, 13 Nov 2024 11:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731527600; x=1732132400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZJohuSDhLv+Ez941jeY7j+hZPem1AM5+WSMU5a11wcU=;
        b=gnR/oczJ0s/b41YhFGkMWcNdHB0J8pZRyNdh2Cx1jYxc1UigMOE12OHprUNQvewUSG
         Yf4LEfQhuKPsG+Y7VsYcn9807LIyLLw/FTZtMzF+wWY/r1HEHGnJ6LPKTTnE+kJHamJc
         5lN2NsI7Xm3PatvSIHvCUkpV2MwwOCpzuCoYkjbFdaimVK03K32q3yjqQJHd/X/u4iQN
         Nm+r3KHCP9mlg94CSm3sebKJG9XaP2hpuoTF9zkHrm2m6r0mxAl0NunepIk2Z6XHWePf
         lYly/Dl7LRTxXpKI9MrmYOgmsm0VO4gV9RLI+bzftxj+cs38Fa9W4oxD+lMb8nVvJJFN
         LHDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731527600; x=1732132400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJohuSDhLv+Ez941jeY7j+hZPem1AM5+WSMU5a11wcU=;
        b=koUoJI3lqIiKo23o44mlsy8VCrkZHf56OUCCbs+v56FVQZ0XRthq8qFqGs0bCIBWhQ
         z/ix+jnhBUWpDhb+ZguJ6xnwy6hHexI/PIzT0aGCFwjpSjG8xA3HcKatjgCFkjf3PXDM
         jrz0TfOJ4lzZe2bxL0xSAwRyrjmUh/oJz4U3JuyXPjtXf/lNeSqKTQ+EtUqRBreQsKZM
         J50/bIu90w5zgoC2BXC/+5qTK0RD3sE991yRHBXwdUIUar8vKVWXki+qiZOzUAv5YDBF
         zCh00G7QbxwtF3JZ1DhZhIHVV91Q+MnpxK/ALGm6TLRT7I5lgDbwxcpGFL5ocZvOdygB
         Fbkw==
X-Forwarded-Encrypted: i=1; AJvYcCXv65wwZ87KvIC+xKjKeaic00HxxRBOldUnOpd/qSWnOlHoSCC1kK2ZkTVI1/mIohjT80o=@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2lovtOzeWI2h4PguIQvq2WuUb2ZvK0UA4Hs8Rsl0Wi+oTA3ue
	wldQUgzXjIceOEjNxkmGRBnW98K2TxA9nK3MDoO0Z6dWEejLDAX+t+gWQ4IW7Bs=
X-Google-Smtp-Source: AGHT+IHwi2toH/v6RTvp83UH7M2Jmxcw9HOhI3L1kjcyknLKktTX9f30Gh639+d+i9hlq9WYg//Eow==
X-Received: by 2002:a05:600c:5006:b0:431:5c17:d575 with SMTP id 5b1f17b1804b1-432d4aae640mr37829535e9.11.1731527600012;
        Wed, 13 Nov 2024 11:53:20 -0800 (PST)
Received: from playground.localdomain ([86.127.146.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-432d5503c58sm34633065e9.22.2024.11.13.11.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Nov 2024 11:53:18 -0800 (PST)
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
Subject: [PATCH v2 1/5] ASoC: dt-bindings: add common binding for NXP CPUs
Date: Wed, 13 Nov 2024 14:52:36 -0500
Message-Id: <20241113195240.3699-2-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
References: <20241113195240.3699-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add common binding for NXP CPUs sharing the same programming
model (i.e: audio processing with SOF).

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../bindings/sound/fsl,sof-cpu.yaml           | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
new file mode 100644
index 000000000000..6d63fcd71154
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,sof-cpu.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,sof-cpu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP audio CPU common properties
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

