Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533FD2222DA
	for <imx@lists.linux.dev>; Wed, 26 Feb 2025 16:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740588410; cv=none; b=DFaChQFUhBLWH9jCHXvh3PON4/qSRPTPH8BkWxZ6gTQyGoK2YRMlhjRNpuGuijZ77yig+LTXsZ51xKrGjSLEzsDlQhqV8NkfdXvXOc5HLXoHJy1bxzqUrnSVEiz1t6CzTPNTFJZpxLTSc6C7twlzKeEvryfPgHxqUIqhdGI0niM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740588410; c=relaxed/simple;
	bh=aGMEv09mgvOMWn0LVWhHooUpN8dKT5EsPlQPTtFVSQA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QrfiZDg2joa8eGYpk02vf9SjglIOQ3mr6G1i7KR5i5J8tR37+XmavImBTB9RBSQsw9NGn7BIfp43o/pC6C3ZC2vQU61/Ez4SIwBx+NzLE4Rcp2Wst+xUva98wlqgcXG8LplWVYbESrbteZZxLhNauC/rVsRsAasDWDfmIDatsMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZDpGe9q; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZDpGe9q"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-38f2b7ce2f3so5011324f8f.0
        for <imx@lists.linux.dev>; Wed, 26 Feb 2025 08:46:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740588408; x=1741193208; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=HZDpGe9qrjamoyItUltmtI+KVVVAPrGcBEoqx+Av7xnKIhlSooJPzD03c45NxsSb6e
         hUkcPhrpiijD/Aj9pSlN+1ags68xDo9cFGuugzDXK4J8G8CHn8qypKZogejLuSFR8dcZ
         21k4KRJZwz7M6k0ZD8Y8iZjMdirYKSQ4IQsvPBWywj6iypNDlbfu/KszVqJz7PIEs+ww
         fbfYjEvKnBefLkME3ofujgaNyaEeLiW2v3MR8/TZgrpgxBWb8Xwbvi9TCyjHk5h8zUPf
         Iv02FNZdm4Jn9alMOdH8x2yV5MDqgFr3ULIXjJ/hgr6pVd7q3/5gEWi1ZiH1lMtgAnQX
         2FmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740588408; x=1741193208;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V3oJX0NNej/zcXG8s4cxQRhfNdLEwQ8bXLo+d66KAIA=;
        b=EnBDf9XIwRql95zXwACMYQsgLCHNsHMfJ+5U9DFqV3mfRlsgGVJLQiMvGRMwf4MP1p
         XD77BvhmV9uzkOK20V7s7dgTwCi8FEIV7XVmWYjwdjiISpc27p03m36jiPXvk1g7qzZH
         3rqbg5U/XryvsHeYW723UiNmcRMt7zGh+00bT/ekhIGZlwVJ0I4DXqg52wv45k2kNVcx
         ilxIxxXUqI/7SXOIyorXrevFfw9NRd2kjVDb6lCRwULmCZfw7SDruO0K3K75UJhpAVYb
         vFR7mO/S52zD16s6x7LNPniv/X0ovn4YWW8bXtGcZNm69qqzJfAsJx+hdyKYMGHGmTmf
         0AAw==
X-Forwarded-Encrypted: i=1; AJvYcCUXn+sfw63d4usMDb6LEcJtd00CzsOe+agXayvkLnbL6cHlvaaRMkpWLnujnSGQajYUGsY=@lists.linux.dev
X-Gm-Message-State: AOJu0YxKDAwxOF71OK+9LrsP2w8gqLMSDXsVyAmgouCONjKgtyu4csWQ
	KV/KXp6EiNBJ99iWhs4JUM65cMR6ELsbVM1iKfX1t//PldjWdKrs
X-Gm-Gg: ASbGncvXZ9sTqprjMpOjjwsCoa9JCC2EY+BCE5tKr5EhbyvzIh4Z+CMD1vwMLzk2scS
	u85mcmKE7L6Ald+Zs8TtW483rKAeVp2iVX9HqbBzoYQCrojag/Y9AihANMNt66rM2zsJC/1dPnR
	8corJJLthmcMYDa71J3qyE4h8FICDAxzpIQhNLTJ/AZD63e5eXjJs/o/jsBZXjoGwyh+4wRVWE7
	qa5+JJYB5kaSrP8/SE3gVv2M0usB6BP6nYQ2P7lL2RMTxFI01mKZ12PAokGri5CC71uczcz8AbP
	ZDIDRUblxYCzqc5OKYlV4ejnGBFRx+rpnTwXKWzh3UcbKoAm4cy0JNijzA7/9Bae
X-Google-Smtp-Source: AGHT+IH9PirezPUvo0SDYj6S58hBwzBVZ6Rl2C7V0n1gZp808ZMU/3QJOgAnoayYRlZbNnJBn4E/gQ==
X-Received: by 2002:a5d:6c61:0:b0:390:d76b:fbbf with SMTP id ffacd0b85a97d-390d76bfef9mr1679150f8f.4.1740588407321;
        Wed, 26 Feb 2025 08:46:47 -0800 (PST)
Received: from playground.localdomain ([188.25.208.27])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd8e7165sm6200215f8f.73.2025.02.26.08.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 08:46:47 -0800 (PST)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Marek Vasut <marex@denx.de>,
	Stephen Boyd <sboyd@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	Adam Ford <aford173@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz
Date: Wed, 26 Feb 2025 11:45:13 -0500
Message-Id: <20250226164513.33822-5-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
References: <20250226164513.33822-1-laurentiumihalcea111@gmail.com>
Precedence: bulk
X-Mailing-List: imx@lists.linux.dev
List-Id: <imx.lists.linux.dev>
List-Subscribe: <mailto:imx+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:imx+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

AUDIO_AXI_CLK_ROOT can't run at currently requested 600MHz w/ its parent
SYS_PLL1 configured at 800MHz. Configure it to run at 800MHz as some
applications running on the DSP expect the core to run at this frequency
anyways. This change also affects the AUDIOMIX NoC.

Fixes: b739681b3f8b ("arm64: dts: imx8mp: Fix SDMA2/3 clocks")
Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
Reviewed-by: Iuliana Prodan <iuliana.prodan@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 86c3055789ba..54147bce3b83 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -834,7 +834,7 @@ pgc_audio: power-domain@5 {
 						assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_800M>,
 									 <&clk IMX8MP_SYS_PLL1_800M>;
 						assigned-clock-rates = <400000000>,
-								       <600000000>;
+								       <800000000>;
 					};
 
 					pgc_gpu2d: power-domain@6 {
-- 
2.34.1

