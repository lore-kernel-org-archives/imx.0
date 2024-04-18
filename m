Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D383D17AD66
	for <imx@lists.linux.dev>; Thu, 18 Apr 2024 20:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713472693; cv=none; b=JEowtjZs1+ZvbBwZwSa35SBkfrqGXLvFTyPsNM87YvhXc1q+4++Aevuz5yFReQrIXM0P4JYV1rh2vqOzfLhZxYgU5wvXcmxZcg/m9Ubml/xqmBswdlTE0Faouyl60bCZlQsP8i2Lu5hXeWeRteNdX9DOATrf9rG1OXGBOkbj3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713472693; c=relaxed/simple;
	bh=sKiv4SDu35oSMqZnfSXRLAkPw/aQxk9pkreC9OwjRh0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uVPw1jf0nt2selQQiy/0SMqDSSOdPlSBhIPh3jMuO0WIMs+rjgk98bH3w0I6oVzaB0hgplpRTMc/wC/E8aTF4vR45Gm3PHrQI1knOH855Iou9HWjgF8+b/Bg1WsJzgzrUVfdjwAfhLa2ksVNO6n4qhKIXkI4TxwtWlFh9dCFTaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jrrtWy93; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jrrtWy93"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-516d6e23253so1529334e87.1
        for <imx@lists.linux.dev>; Thu, 18 Apr 2024 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713472689; x=1714077489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JF4x+kNM/mmae+ZYoHJR13wougtTUOzbFPCVrpt7xuQ=;
        b=jrrtWy93PSgGJDJhL7/vKmPUchz13LlFyJ+Fz2QAPcmvOuS2BWz43gFHuZI7KvTfz5
         ucAPjx23f53v09IjDklXxow8+vorbfK9x/P/fRlJu+VcFFbFIIxkOzqY31M9WyQdSH+n
         jMXPldZb8kqQDnMJZIPpiK6LM/ojHHQi1HVfP7mZ61/XKXXd7sc8pr7Uu03WO3EWH0NM
         TEFrhkc9orMOVsVWMLLZvPIMBebn6UGQe7mfyl6FH5UBh02fzVTNwaeZk3lpvUWVAPOP
         AIWf7/L2RDWRjl3EzwPN4YdtZ2e4+tmKGES7KC7FHUuHlaALibEFjaZrF9GXcUzmTEgi
         7uyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713472689; x=1714077489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JF4x+kNM/mmae+ZYoHJR13wougtTUOzbFPCVrpt7xuQ=;
        b=Idwcuqlrpi8qE6q9PTuqs3K77hIxbaNthKZmdEnJLfwib8bsrBYOsVrChE1tL7PPc5
         /+uHq2ObX3CidJryTql+aercO4vR8tbjx7z5p6iNEdq0lIh91CAVsGX+hGS5peeEPHXR
         PEEU4v/P78rFB9gYA66fqmpCY/goB/uAVqH/XTBOBxn4UR/ltSUpyRhJMzccEYJxMRCG
         6g3M+wetgmh9Bh30ElUFgTktS19aFLb5gnxDcpj04D+oxnzGHcPvJPLk5vk3eltoB915
         ebeEXTgSmU1zzioNFpuFhG9tGCxBTd6uxE5O4QuJcq2bW8YmBeSg3z2rj1bOAP2PXkKt
         s77g==
X-Forwarded-Encrypted: i=1; AJvYcCVaMNn8rrMO6FwbmPxtAfzJalho3UwD7IkGoXtTaClRYMMhtCwLUeFeneDfDGIg8Fada0VJoVo0b7R2BYQmY1QQYXJa
X-Gm-Message-State: AOJu0YwjbKRcWzZpB0lgfbHpj1oVHuBGt7qeTvH1YLdnfdjsah6wKRb8
	sYZeASUa+yc/T4bWW8l7B5vmDP2bD/HwBQ+w6Renwj4s6cAwkZAG
X-Google-Smtp-Source: AGHT+IEQdvifaiqzhQgGeM5KMZbCp8qQgxPJ+Bl+TS4jV006wTpcy9/73atGZ2nqI696XMF1UUWulA==
X-Received: by 2002:a05:6512:2111:b0:513:9e44:c68c with SMTP id q17-20020a056512211100b005139e44c68cmr105129lfr.6.1713472688803;
        Thu, 18 Apr 2024 13:38:08 -0700 (PDT)
Received: from lmc-playground.localdomain ([188.25.209.252])
        by smtp.gmail.com with ESMTPSA id l21-20020a170906079500b00a473774b027sm1305649ejc.207.2024.04.18.13.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 13:38:08 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Liu Ying <victor.liu@nxp.com>
Cc: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] Add DSP node for imx8ulp
Date: Thu, 18 Apr 2024 23:37:17 +0300
Message-Id: <20240418203720.8492-1-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

Add devicetree node for imx8ulp's DSP core. Also,
update the schema for the DSP node to accomodate
the clocks used by it and add a new schema for its
syscon type node dependency.

Laurentiu Mihalcea (3):
  dt-bindings: dsp: support imx8ulp dsp clocks
  dt-bindings: mfd: add schema for 8ulp AVD-SIM
  arm64: dts: imx8ulp: add DSP node

 .../devicetree/bindings/dsp/fsl,dsp.yaml      | 51 ++++++++++++++-----
 .../bindings/mfd/fsl,imx8ulp-avd-sim.yaml     | 42 +++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp-evk.dts | 39 ++++++++++++++
 arch/arm64/boot/dts/freescale/imx8ulp.dtsi    | 22 ++++++++
 4 files changed, 142 insertions(+), 12 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx8ulp-avd-sim.yaml

-- 
2.34.1

